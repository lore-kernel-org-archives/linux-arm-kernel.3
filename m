Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E183E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAyHGum9hEixx1AC47FEpqY4d06EwprdiNsiZHyy9mU=; b=neY3zgSJ73CETTd9gC02QALMcp
	BKlcrYGjgYSUMM6TKxasXLl06x24JGb4YD6dAGMlW4vILGjk6/oA5gi38voCso7zzU7ejfaR6AY+3
	kW6HsuGVUT7V9s7wDJyqwPN4398KLZLIKDNsxTWdUz8uozhjWT4DqQRhRu/gWC/Siq2/5Y1EizcQ2
	ceUV5FyvELpdNbKhyx7mKite5DntAgi3Ye/vOknunDHXS3ru2PPCxHZXxVCdSbG6pQ8AvSAU3RLoe
	x/jNXFYpGvZM03CTC51HHdmYfMDzKl0brkpPX2S6xN/opF4G/SwJRKtL6wpUJOM8XlBiQsLnoSd2/
	h/R7pYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJtR-0000000EZQr-04Wz;
	Wed, 11 Dec 2024 10:24:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJpG-0000000EYWK-0Lsz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:20:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07E471063;
	Wed, 11 Dec 2024 02:20:39 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA4C23F720;
	Wed, 11 Dec 2024 02:20:09 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: James Clark <james.clark@linaro.org>,
	mike.leach@linaro.org,
	coresight@lists.linaro.org,
	yeoreum.yun@arm.com
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: Drop atomics in connection refcounts
Date: Wed, 11 Dec 2024 10:20:02 +0000
Message-Id: <173391229097.561442.2664501227957186728.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128121414.2425119-1-james.clark@linaro.org>
References: <20241128121414.2425119-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_022014_166089_CE8B3C2D 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 28 Nov 2024 12:14:14 +0000, James Clark wrote:
> These belong to the device being enabled or disabled and are only ever
> used inside the device's spinlock. Remove the atomics to not imply that
> there are any other concurrent accesses.
> 
> If atomics were necessary I don't think they would have been enough
> anyway. There would be nothing to prevent an enable or disable running
> concurrently if not for the spinlock.
> 
> [...]

Applied, thanks!

[1/1] coresight: Drop atomics in connection refcounts
      https://git.kernel.org/coresight/c/5aec7c065fba0c56d6c1ea5d629395210f174be8

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

