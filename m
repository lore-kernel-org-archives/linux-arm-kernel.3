Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B5CCCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nvdLLPdXgmH5xYbPF/kbae8+eOitti4IdBA7i104h0=; b=3XUiKyXG9fmOe6Nf7zO5Iaa7E1
	QjnmXwp2czTymMAytM7ws+vWf0/iStBA1YtGg1PzO7eB8ZN31svO2EjxnhUMGSrqO9XQnrHhlzHID
	qYDO4ARnclrc+2HgIbSiayEEDFZi8P9KCoBrZOw3gswbjRLE+REIVx7OENKR2gnyL3Ze6cXG15REY
	o7L2h1cpRVJHRxNdI3KhA+NzhQu1JWSNBoo6CqYTam9jDjHpZCqaR5NeqkfqpuDagHRjtmWSoD0Ol
	m3dfU0JGmPmDp04NeizEcki0BVpon6h33WJW2Ls365PY6klqH9V3uiGch2v1tfIDL7Qvq+gsOXSpf
	XoExt49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Lqi-0000000Dwsg-3fXC;
	Mon, 13 Oct 2025 16:56:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Lqh-0000000DwrU-42FD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:56:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D6DF61DCF;
	Mon, 13 Oct 2025 16:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06314C116B1;
	Mon, 13 Oct 2025 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760374569;
	bh=V/MAAI6c/W2kXvAAM5vLnSBH5PzenfxxUv7lXNVHDf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jF4RAZSKXO3/wzVMsevgsaewpkLC0B2J8nl5Yc1Io10RtKWu2D4oSTPU+MWqYoBYF
	 /vMzHsLzzH8x6Z6/XET5+J546Nm6m8OoABIkWNWYuyNJWWVxU9MFNDTlDuCvRfdQPF
	 0IAUIcxuJuw0ZCRze57yrwXpuM0O4rChgaDoMsAp97Np/ajxwBeurSvVflzw49CXNI
	 nd9NZeEN+XMcJRSDo1Fvu0ilsrYRjsj6hXxkqUTheVWsjPkQvjuTYdOF0GCdm2A6OE
	 mNYWvFD34hHOxbg3rUCGQdeiikHZk5hT5giw54WGJbuJoVYMtVvGEJZTfR9r1Gmdoi
	 Ya4LNurAJzzzw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v8LqA-0000000DaUU-2pWO;
	Mon, 13 Oct 2025 16:56:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Guard PMSCR_EL1 initialization with SPE presence check
Date: Mon, 13 Oct 2025 17:56:03 +0100
Message-ID: <176037441177.969330.7925084033862079350.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010174707.1684200-1-mukesh.ojha@oss.qualcomm.com>
References: <20251010174707.1684200-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, catalin.marinas@arm.com, will@kernel.org, alexandru.elisei@arm.com, mukesh.ojha@oss.qualcomm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Fri, 10 Oct 2025 23:17:07 +0530, Mukesh Ojha wrote:
> Commit efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE")
> does not perform sufficient check before initializing PMSCR_EL1 to 0
> when running in VHE mode. On some platforms, this causes the system to
> hang during boot, as EL3 has not delegated access to the Profiling
> Buffer to the Non-secure world, nor does it reinject an UNDEF on sysreg
> trap.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Guard PMSCR_EL1 initialization with SPE presence check
      commit: c35dd838666d47de2848639234ec32e3ba22b49f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



