Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FBBD4A619
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfxYfMzBG7yps/Ndka5XGNrBw1wKOMkbe1QKKSEROYU=; b=EqYD1Qoo5e7XdKGhu2InBm12r7
	VjveUN02uCg4IeQ6shEzZ5vioSrV8U76fn3xxGqrvSZa45xo+XTbPawYyH2se/R1ufJe0zqs8uZLC
	cjxwOM4huzFJCOtUEuH3haa9zvLvLpIYOEEbC4HyAg+hYCdPAFMCWO+reCYZGeUWnenR7/IBA2XFy
	dO1XSUb+iNpRzppaAxtsKs8cdlg6aBAT+4OfoBINona78yVpJnykggYP3h2oqKstap0/T49Ml0/lb
	GS0nD7xP5zy6GE+/apcVrNppZ99Al0K/RIcd4Fq5GyQyE7xdl03s/0xnD7oeNWnTkRMq0r3L446/J
	NFW8uZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggRM-0000000Dssm-03YT;
	Fri, 16 Jan 2026 09:48:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggRK-0000000Dssf-2OA4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA00860160;
	Fri, 16 Jan 2026 09:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509D8C116C6;
	Fri, 16 Jan 2026 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768556901;
	bh=IkRVBCOnX5HiBP2w/6X2FnPTKDEDjwhHkcdCqYBot/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQEQeryXltRdA+zXbpY5NVnnTOZw/TJVEVt0yqB6+A9uwzj/rN98aC5ffAIJMaDtE
	 wt39HeBjd5DVEQO94CD5DHvX71hgo8+pg6PDFESpWQgM29U/PEc3N9/PxqCo02B9YL
	 UXw4zi5FEz0+Bn2QciAWj6RfF5HuGi3Bq+2x1s9lpqTLfNP1mvLvMhJ58Jmd5mLdHS
	 S+BxQ3kbWSzq1TQT7wtK0x8Ab3QsO4r9tXQik6CB2PYIfWKxSIkpAIpMzq8997pu3Y
	 j3IlYbu5APx2AJp3JLo6/qaW7Xqc5DhKcXBxgndGimqWdPxz5BrOwnwSLGm4jxK9hD
	 yZUYRhdEh7izg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vggRG-00000002pcX-2qTD;
	Fri, 16 Jan 2026 09:48:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <korneld@google.com>
Cc: Bartlomiej Grzesik <bgrzesik@google.com>,
	Tomasz Nowicki <tnowicki@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix error checking for FFA_VERSION
Date: Fri, 16 Jan 2026 09:48:14 +0000
Message-ID: <176855688030.3828453.16084185280555582394.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251114-pkvm_init_noffa-v1-1-87a82e87c345@google.com>
References: <20251114-pkvm_init_noffa-v1-1-87a82e87c345@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, korneld@google.com, bgrzesik@google.com, tnowicki@google.com, sebastianene@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Fri, 14 Nov 2025 11:11:53 +0000, Kornel Dulęba wrote:
> According to section 13.2 of the DEN0077 FF-A specification, when
> firmware does not support the requested version, it should reply with
> FFA_RET_NOT_SUPPORTED(-1). Table 13.6 specifies the type of the error
> code as int32.
> Currently, the error checking logic compares the unsigned long return
> value it got from the SMC layer, against a "-1" literal. This fails due
> to a type mismatch: the literal is extended to 64 bits, whereas the
> register contains only 32 bits of ones(0x00000000ffffffff).
> Consequently, hyp_ffa_init misinterprets the "-1" return value as an
> invalid FF-A version. This prevents pKVM initialization on devices where
> FF-A is not supported in firmware.
> Fix this by explicitly casting res.a0 to s32.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Fix error checking for FFA_VERSION
      commit: 582234b0d8419e0b6cbfd87ae3f80568c8d0917e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



