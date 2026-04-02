Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ABBD39422
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grOmcJI36EDsB6bXPH34WY1X8Wl3U1jd9B/ojfKCPPw=; b=YqF/Xm8aWBsn4qoM7pRL8EGsaN
	iy7zMHAv9RK0cOytfmmmJup9M8zx+1kQwLkFgJ/G9OxGnTDdtii16dKX8jImRqLJepx7buoh6N/EM
	dGoFoEeUgqFhUjELRNdLL3o7tbkTLj6IU1SuRR3veNm7mYKMX7lv2lgg0QJXxY3YZe57p9UC1kt3N
	/fyk1n/2xHYQrOI0z05XkbSan/qYWKVP9+yVtVlxqRbxGaioVmAWL8EAltgHS3JGdcOc1ue8O4vqK
	VvspDq8Ze2sFZTCMh310PqfXtDpTTpL4VGjLlZD4REFooUzX9HQAMX8umWWWTPrQyVruXjTQ6lQWw
	+Vmkgi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IDM-00000000BtF-221g;
	Thu, 02 Apr 2026 13:36:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IDL-00000000Bt0-33Cw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 13:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FDA6600C4;
	Thu,  2 Apr 2026 13:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB317C116C6;
	Thu,  2 Apr 2026 13:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775136962;
	bh=iXINi8wbcgvvzxIu9ZHmz3Yjq2Fc7XgtVugmJpzXWCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e56R5cnc20S9El3aMHHHBTQRvZSsqaxF2lg6ImbJ2wBCqYLJw+aMX4lIjCKzzMiAv
	 j6H2JrI3PiIzlJLMqqsS5I8M53oFf+JIgngZtHffdmM8LCfGw1/qZTWdB7y/z6jZC0
	 M2j+3KQ1wZozPL9TLEtZplX8MgJUjHyNkxx9GP3QlZ1JwNbCe0NZPhaWqV+XTEynCp
	 tFrqGMynIs/1EVg+9hroiyexarqqOc6ZHxVsx4X1iY5OkNlVRfdQ53HZBxsGys0gXr
	 UsIiGhloE8jbkm22HnlRwxUWWVNyzX0xlDUMPlFcyQCb8JU/10gII9Gnx8YcT3UlNb
	 zVQvJvlvRJYBA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w8IDI-00000008GzR-1g99;
	Thu, 02 Apr 2026 13:36:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	android-kvm@google.com,
	Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com,
	joey.gouly@arm.com,
	mark.rutland@arm.com,
	oupton@kernel.org,
	suzuki.poulose@arm.com,
	tabba@google.com,
	vdonnefort@google.com,
	will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH v3] KVM: arm64: Prevent the host from using an smc with imm16 != 0
Date: Thu,  2 Apr 2026 14:35:57 +0100
Message-ID: <177513694954.452775.15481446147791932639.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330105441.3226904-1-sebastianene@google.com>
References: <20260330105441.3226904-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, android-kvm@google.com, sebastianene@google.com, catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, oupton@kernel.org, suzuki.poulose@arm.com, tabba@google.com, vdonnefort@google.com, will@kernel.org, yuzenghui@huawei.com
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

On Mon, 30 Mar 2026 10:54:41 +0000, Sebastian Ene wrote:
> The ARM Service Calling Convention (SMCCC) specifies that the function
> identifier and parameters should be passed in registers, leaving the
> 16-bit immediate field un-handled in pKVM when an SMC instruction is
> trapped.
> Since the HVC is a private interface between EL2 and the host,
> enforce the host kernel running under pKVM to use an immediate value
> of 0 only when using SMCs to make it clear for non-compliant software
> talking to Trustzone that we only use SMCCC.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Prevent the host from using an smc with imm16 != 0
      commit: cf6348af645bd8e38758114e6afcc406c5bb515f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



