Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11477CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkKZNZ2WF70GpVYBUaUs9g2BD2h2Uk87tq0zV1opUTg=; b=OnBVLJNF983ZIFTYeG9MvGUZR1
	IN9Nh4RWlv2xlltlBnYkr29K315HzYpK76SpvqRG0O39ZBBtPSaAdGjlIM9dYLeLXivGxGsizQBVE
	mwVYbv0mWMXf6uA36DVrtwXfm1vNjcMkDVMXWYYwaMOxVK4UnS0CjVbdPESth34U3yNOo0Ramiodn
	B8vBwvyW0KDP2zoNIy5QEv30XnCNiHVVIJ3Aq2LwrDNJNwbUUc/ZyUTZ/yPPByq/cWgLdjNFs88Ep
	HdkW8v2BFVJRsjf/wosyKjDCC2pnDoE8EtuenZkgpv8YOFjxRbq4em2qrHJMm5AVg0tuUEfgvcart
	fTLW04qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzaxO-00000002xMG-47xW;
	Fri, 19 Sep 2025 13:15:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzaxN-00000002xLW-1IhT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:15:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF9236013A;
	Fri, 19 Sep 2025 13:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AC3C4CEF0;
	Fri, 19 Sep 2025 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758287720;
	bh=f+KQxZ6ogJBRTh5AD6J/biKmMTTk229KHvOFfA3HFec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jEf0PYZ2BZ+IxqPUYoOmHNBvKyHlg1FwjIvCCH5gR3kGJwFfwrVIHP+8e1mW72ueH
	 stA/TZwA7ziDsk0zksCmbX/+kF3q266bguCE4F99XUjcT7t1q0waXkfkVdt5lqSUiM
	 jYJVyLKtYaJtIoQPSgkB+af6f7QHMDUDjxxjVqASSsFED1Ie6qJw2bvolwICXVied8
	 4mhBKKp7ii2gO9C99xFW5+ttRtRa4dpDZL7xQlrMZ9td6pklxYPgdcvQkG0sM6OitX
	 azFvmIHI5cDkIViD+YMMPcc1IV6oO05FFQn5lZ7L2N7EM0qktDAWr4ZW0pLYGqyfvh
	 oo6VctwpIxWVw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzaxK-00000007mgw-0Kxn;
	Fri, 19 Sep 2025 13:15:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: oliver.upton@linux.dev,
	yuzenghui@huawei.com,
	Jinqian Yang <yangjinqian1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liuyonglong@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v3 0/2] KVM: arm64: make EL2 feature fields writable in ID_AA64MMFR1_EL1
Date: Fri, 19 Sep 2025 14:15:15 +0100
Message-ID: <175828771292.1762581.13961318453079156132.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911114621.3724469-1-yangjinqian1@huawei.com>
References: <20250911114621.3724469-1-yangjinqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, yuzenghui@huawei.com, yangjinqian1@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, liuyonglong@huawei.com, wangzhou1@hisilicon.com
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

On Thu, 11 Sep 2025 19:46:19 +0800, Jinqian Yang wrote:
> Allow userspace to downgrade EL2 features (TWED, HCX) to ensure VM live
> migration compatibility between hosts with varying feature support.
> 
> Although ID_AA64MMFR1_EL1.VH is an EL2 feature, it is still kept as non-
> writable in userspace. When FEAT_E2H0 is not implemented, HCR_EL2.E2H is
> res1. When E2H=1, EL2 operates in VHE mode. In this case, if userspace
> modifies the VH bit to 0, the Guest's kernel will still run in vEL2, leading
> to inconsistency.
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: Make ID_AA64MMFR1_EL1.{HCX, TWED} writable from userspace
      commit: 1a0b2bf6ff11d2e0438f3a7d1d299339edab96e8
[2/2] KVM: arm64: selftests: Test writes to ID_AA64MMFR1_EL1.{HCX, TWED}
      commit: be8c9192eaeee21fdaacd72ad4ba992b9e42377b

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



