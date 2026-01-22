Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B48C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMs7LYDRjNVYBzS8Mju/lFTBd+stxm/ObxawGRdrtrE=; b=f5rJAfZMyE6Gb/34tLDvKVzrWf
	pQuxk704rvuEsTUV/phKov0hpTUFbbPVHna1tWLkRsYI5RNX669FkpWnlnGB1T4p3tdJW6tZ0quwy
	pKd3+a+o9K1pSIOf2+AD88HAQfKwZ49eMmG3DwSHcKMmavYr3sjwNwg+BoRtzJPzbM27A5I5MCzmw
	M+KZgeYc5hNaLDZpd0Qp1Fb6LK2Kqh5wP6xow1IlLtfRMBW2r0EkX4qAPHhnyDlMQciyfyyvIp7m6
	xE8YMmx8NWhAFk67FEP79WYIGRz8qnK3zB+/sX2eRRg+c2FC/M63MTcZW5UYF7uKeJANkEwOHGGkg
	RoL6LpKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqig-00000006ido-1CpJ;
	Thu, 22 Jan 2026 09:11:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqif-00000006idZ-1CgQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:11:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DBD2600C4;
	Thu, 22 Jan 2026 09:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A891C16AAE;
	Thu, 22 Jan 2026 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769073070;
	bh=LFW90VWHJHnmtxUoM+a3yP6IR8eMMDNjSdMlhzJlmnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eYUHP9Ncnk0czUylGrVq34W4sQ/D7IQEbxX3lFNcK07HFU+/P66K09I5iXwhp/npo
	 aoMFUOJVQ0ayjKypW5RvEdqI6n1OCNUnjO/TxvoKQjVBLyuxnWfAnMyVRdsPp92r8m
	 hZ1jaJUCuEFW8oEu7yr41IM+T/OZ8hknrwoMRRuQJWQMGLpN8Pj746v4TUPyTm02cf
	 jM8ps15g6A9f9zyAQ1yck8CmomoXPzp/hM0S75bbz7EvASiiz63yO83QzNnCUXb0Hl
	 Tg/s5e44Be8OV2bjDdo+6OIUU4D9308id5Al3MqRCAOyQhN6rUAhb7E77h4Yz+6Ewy
	 r8CZvY/aepsUA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1viqia-00000004cWq-0JnX;
	Thu, 22 Jan 2026 09:11:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Always populate FGT masks at boot time
Date: Thu, 22 Jan 2026 09:11:05 +0000
Message-ID: <176907305595.536564.11529095810436212819.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260122085153.535538-1-maz@kernel.org>
References: <20260122085153.535538-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, nathan@kernel.org
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

On Thu, 22 Jan 2026 08:51:53 +0000, Marc Zyngier wrote:
> We currently only populate the FGT masks if the underlying HW does
> support FEAT_FGT. However, with the addition of the RES1 support for
> system registers, this results in a lot of noise at boot time, as
> reported by Nathan.
> 
> That's because even if FGT isn't supported, we still check for the
> attribution of the bits to particular features, and not keeping the
> masks up-to-date leads to (fairly harmess) warnings.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Always populate FGT masks at boot time
      commit: 54adbfe40e3b6d238293cc36ef071ed9f35c8af7

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



