Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A834CC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQ/a78zKcnzi3wuFBoD/ZmfJN8yrdQDZz6t6y6GL1po=; b=3SPPJHR0GSLZVQ6aVDifFrVMZv
	1QN1wE30cl4vOyuYvteGXpWTGludNfXoXa3i/o44tsy7mrAebaQtO4a8afYdYB0zHiGEM6QmaBUuZ
	MjF+CVP+tjuy8YL4GI/oVqgFJhw3R/8jE7Rxs+bvaGtA1ULsflc2WcUcMdHyjDLAkX1OHwgMCnTkd
	SjMk4AMvgtSy4MOuCAJ7yHSMABkBotEeukGkjYQpKvHhd4oiNMsz9v3PFNqTfrKxqW4XQrBuoB5wA
	iqZp2+pDF7n5FMxiuRHMmkn/5l9qEJdQROmRIDVm4uktJipBCDMlNn2sL8MTz18eH/RkJMXqdXZNr
	jlmxlzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw18-0000000EgG6-1eQO;
	Thu, 23 Jul 2026 16:11:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw16-0000000EgFE-3l1J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:11:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A24860A8C;
	Thu, 23 Jul 2026 16:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70F51F00A3A;
	Thu, 23 Jul 2026 16:11:23 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmw0s-0000000872c-3fEC;
	Thu, 23 Jul 2026 16:11:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	D Scott Phillips <scott@os.amperecomputing.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Lucas Wei <lucaswei@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2] KVM: arm64: vgic: Avoid double-deactivate of IRQs in the nested context.
Date: Thu, 23 Jul 2026 17:11:07 +0100
Message-ID: <178482303767.3351010.4100459132454242259.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714231158.496808-1-scott@os.amperecomputing.com>
References: <20260714231158.496808-1-scott@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, scott@os.amperecomputing.com, mark.rutland@arm.com, zengheng4@huawei.com, xuwei5@hisilicon.com, vladimir.murzin@arm.com, lucaswei@google.com, kuninori.morimoto.gx@renesas.com, Sascha.Bischoff@arm.com, yangyicong@hisilicon.com, yeoreum.yun@arm.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
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

On Tue, 14 Jul 2026 16:11:58 -0700, D Scott Phillips wrote:
> In the nested state, the physical interrupt has already been
> deactivated through the HW bit in the LR. The extra deactivation
> would be harmless but can hit an errata case on AmpereOne, so
> avoid it here.
> 
> On AmpereOne, deactivating a physical interrupt through
> ICC_DIR_EL1 or ICC_EOIR1_EL1 (depending on EOImode) which is not
> active, but is the highest priority pending interrupt causes the
> cpu to lose the interrupt pending state and also prevents the
> delivery of future interrupts.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: vgic: Avoid double-deactivate of IRQs in the nested context.
      commit: 8a570b19b4b16a8a3b5ffa2b332bd5613110b2d8

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



