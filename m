Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE19CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrbXyYji9fv0hqyCc0cWNLfWo/sY+ALwkUN7BwMdQqo=; b=dgaOZaP5jvf5K1LMUJ1IEmjf8K
	hDKZ4YiwX1NhvyaZHi6U375acqnWglLT59XE16/gJUhL45GV/HfaPPwIPOtp4TWIsj9fHjbCIVEOi
	VmYGd7kp9ChHvJNRan1idUKh+jHt5IlGwIcsjiHQjGX9kgQHS6tlCbXJzOjSGr+rIhf+Y6h81Kmqs
	Gcrr+RcnBoYPOAW1e1LYFPSZG6ryJvuT2B2+t5iHfhzngCFCcQ+RQLq0boHv9iverbYu9opyt2kfv
	hcHyPhM1NX0PWum1iS2x8cWdahDzrHEeEiIp5UOkvNvKJcmNMKkYwHmC+L7Yc+TwjbxGN0nUDg5+I
	Q4ZHk05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMcl-0000000HPpo-3Zvk;
	Fri, 07 Nov 2025 13:35:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMci-0000000HPp1-2YW6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 13:35:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3FD71515;
	Fri,  7 Nov 2025 05:35:19 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 56EFD3F694;
	Fri,  7 Nov 2025 05:35:26 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: tpdm: remove redundant check for drvdata
Date: Fri,  7 Nov 2025 13:35:12 +0000
Message-ID: <176252250205.436027.680396021677885922.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107-fix_tpdm_redundant_check-v1-1-b63468a2dd73@oss.qualcomm.com>
References: <20251107-fix_tpdm_redundant_check-v1-1-b63468a2dd73@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_053528_685414_C894CE87 
X-CRM114-Status: UNSURE (   5.15  )
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


On Fri, 07 Nov 2025 14:16:39 +0800, Jie Gan wrote:
> Remove the redundant check for drvdata data because the drvdata here already
> has been guarranted to be non-NULL.
> 
> 

Applied, thanks!

[1/1] coresight: tpdm: remove redundant check for drvdata
      https://git.kernel.org/coresight/c/aa5edd1b5ece

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

