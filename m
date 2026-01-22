Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD52D3EE84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KkRLR7fPi+H4rNwzlcyHQ/APifsqXIbbfK87OvmCYM=; b=Eos9NfUqaMS4OE9F04uhd/3+OA
	ujB7qPLRbVr15TyxGuIjnEVN7mC0xv7VzywkrUSK4upHW7OerRSAfl4yhHglgibCFBTQAVszAUetC
	ot7IQZzNH+gb8j0CsOSxbBwctuA1FgHqla+h16ILGUc/KU++oQs2oFzw0AaBbuWi5rAhfi+3/sCno
	poVvnluv7lrhNsDtlx40Osj7JOq4Hj7V2M6BiP9F5nXCaVCrBCKtAlYgTzysqd1wkezXTmLDUifAF
	oqpEys0Y56s7joV4YK4gYkx8hDWIKq5q1hoTFDar0eElSJjMBzinsoRHU6jy4+G8SR/abNzdLgVg3
	L9ODWmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2J-00000007WCV-3pzw;
	Thu, 22 Jan 2026 16:59:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2I-00000007WCC-201C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D2F6600C3;
	Thu, 22 Jan 2026 16:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E608C116C6;
	Thu, 22 Jan 2026 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101197;
	bh=fnj5f0mzOP3nCSR0nXkS9PzcpIrYNOAhr7vqfig/jcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D/mSaB/NDq2jreN5kdch+CxtKuutzH5sGJhcWs4Iuwgska/79RFnyt2+QmqWuOzGj
	 gXH49QCP0UiMSu415Mm11bk6ywNiJ7DvUgjyJKtD5lGm1o9dzTHIfFfIwrF81pK4Fp
	 FIOM5sjK9z0/1ApyexIZkGEuctP9XMkB7OVAKpVketT29w/lydGM6WPFTcIdN89gKa
	 ZlfLq7d9bZ3zhooCGWOhKTCjyQef0+LHL0W7mB5nfskVQyFirlFZhE7SsbhxU6Q8OU
	 9f0PgWIgO/clpgh3X13HxqSdcZ5UskxXCMbnTHq2Kg73Fo1ljatyxXFx2PkPQOKf2O
	 Z9C0nbg45tr9Q==
From: Will Deacon <will@kernel.org>
To: bibek.patro@oss.qualcomm.com
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	charan.kalla@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	konrad.dybcio@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robin.clark@oss.qualcomm.com,
	robin.murphy@arm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on sa8775p
Date: Thu, 22 Jan 2026 16:59:40 +0000
Message-ID: <176909187807.2987598.8685170214732571189.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
References: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 20 Jan 2026 20:41:05 +0530, bibek.patro@oss.qualcomm.com wrote:
> The ACTLR configuration for the sa8775p MDSS client was inadvertently
> dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
> Add actlr settings for mdss on Qualcomm platforms"). Without this
> entry, the sa8775p MDSS block does not receive the intended default
> ACTLR configuration.
> 
> Restore the missing compatible entry so that the platform receives the
> expected behavior.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on sa8775p
      https://git.kernel.org/iommu/c/14e9a138dd02

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

