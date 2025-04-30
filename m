Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1CEC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt25pr5urizQx5p8EgaJEd7gimyrt8EzQ8oHIOFaYjQ=; b=TvpUygS2uoysNYpO+zC4jtWqs+
	PyNKy61sAxwYgwjqWG8rLIFVJahQHlchopEjf7iQmi6LtEK7/UTBF7L2H6CIvrSL8hcO5J3I1ztoR
	0sqNWdoNmB8tra7UbvhjBYiknyEp7VGAVk3uvbjeYLPf4fidqH2MD6AWEMY/irKMhlBfu3PvZo0VS
	BgAmE8aZEsNea+or3Bq0+b7bhCdn7eXpNPj2cBUW86UjEIVjwyLHbYwXcMB7bJiTLTHd4OZHiCiS9
	Bxlljo1kHLM77ZE0DkXCJwjXPkD20Ec6ouhZcUv1kI7AyzbxlDZLiaxSynB06A4tbahLFivzcIm/A
	EDn7k1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA80X-0000000D4EE-3DCk;
	Wed, 30 Apr 2025 14:01:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7uK-0000000D3ZK-0fWf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:55:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F390106F;
	Wed, 30 Apr 2025 06:55:20 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D7CD3F673;
	Wed, 30 Apr 2025 06:55:26 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
Date: Wed, 30 Apr 2025 14:55:12 +0100
Message-ID: <174602129798.56812.10570639925939232972.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429231301.1952246-1-yabinc@google.com>
References: <20250429231301.1952246-1-yabinc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_065528_239973_E5F2AF1A 
X-CRM114-Status: UNSURE (   8.85  )
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


On Tue, 29 Apr 2025 16:12:58 -0700, Yabin Cui wrote:
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously. This patchset
> is to fix race conditions when enabling/disabling a CATU device.
> 
> Changes since v4:
>  - Collect Review-by tags.
>  - return -EINVAL for unknown types in coresight_enable_path.
> 
> [...]

Applied, thanks!

[1/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
      https://git.kernel.org/coresight/c/a03a0a08
[2/2] coresight: core: Disable helpers for devices that fail to enable
      https://git.kernel.org/coresight/c/f6028eee

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

