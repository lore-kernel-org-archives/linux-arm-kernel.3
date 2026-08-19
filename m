Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B158C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 19:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j93O/wzY+ND2y2T5OB2ptTo2V7Qf86MbrCV2pZCYH/o=; b=1AnT3MEsPrufP59iYKw6NC/TcM
	mG5IdThVz9/hRjemZUcEmKrGhRHaouiMDHuXHMUIw1N1VACByXNGYnDxUrTMzzSBYjfaCizARwFL0
	CZxh/5MKqPI37Z8Y2MFYdSpF8UbaiHMos3sqll7KRWf9ZQpL5vsqfsnOF4fhs04WR0CWV2be/LXFo
	A0B3s96VJ6WFvbfZg04V8JQUCXxndUIkcDjJN1An2KGd9n0Hai1amDo4xFG1TPjPpfX5WJV09G511
	DhPwGBECTpf7cyfe/BHEd5kbNcRNyDkOLdoOWg3vmkLgHqup6bevR7GYY39vtE+Ot/EaO3Lyil5Aq
	5Z2Pa7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlbs-0000000APu8-3hAW;
	Wed, 19 Aug 2026 19:06:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlbr-0000000APtE-1XCN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 19:05:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F18B440AC6;
	Wed, 19 Aug 2026 19:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8E51F00A3A;
	Wed, 19 Aug 2026 19:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166358;
	bh=j93O/wzY+ND2y2T5OB2ptTo2V7Qf86MbrCV2pZCYH/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=edmJxd/PrdQSDvgsExrOPDvrHqncYA708mfDN3pihKtmJWIpcvsxx1SkdnyHyDoV8
	 HiewbVbHMxFdsSB4i5+70LZneATeSZZf3aWyA/e+ZCc01qETcWKQFYZBQwdEMo11hy
	 HynFnlVpEzoQSlBKWYnHPxSd+sbCGh6w/2oc2B4E/fIz7iTG56tAr2dOUgUzN/4Q5v
	 sw8Gx7oo9k6LC1xWhtTk90U4GFM2AERw0Ipwjq9zVgpSLom+bp5w1E05QKY2ib66eS
	 3NUDoBeAMO413LtTLi4f55m1bg22MoXegmAj4BcWTI15UMx71eBxYiJ/l1BcjQl+SL
	 7EOgB2u9f+Nkg==
From: Thomas Gleixner <tglx@kernel.org>
To: Julian Braha <julianbraha@gmail.com>, florian.fainelli@broadcom.com,
 rjui@broadcom.com, sbranden@broadcom.com, linux@armlinux.org.uk,
 Frank.Li@nxp.com, s.hauer@pengutronix.de
Cc: bcm-kernel-feedback-list@broadcom.com, radu@rendec.net,
 kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, arnd@arndb.de, Julian Braha <julianbraha@gmail.com>,
 Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
In-Reply-To: <20260801212235.2692694-1-julianbraha@gmail.com>
References: <20260801212235.2692694-1-julianbraha@gmail.com>
Date: Wed, 19 Aug 2026 21:05:55 +0200
Message-ID: <87lda2j5gs.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sat, Aug 01 2026 at 22:22, Julian Braha wrote:

> ARM_GIC_V3 selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
> dependency, ARM_PSCI_FW is met. However, ARM_PSCI_FW should be
> selected by the system type, so ARM_GIC_V3 should depend on ARM_PSCI_FW.
>
> Additionally, the systems that select ARM_GIC_V3 (ARCH_BRCMSTB and
> SOC_IMX8M) need to select its dependency, ARM_PSCI_FW, too.
>
> This unmet dependency was found by kconfirm, a static analysis tool for
> Kconfig.

Marc?

