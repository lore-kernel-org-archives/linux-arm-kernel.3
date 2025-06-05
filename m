Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD0AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdLwRHvCrCOAPfBfo/82xRhAV+U+O+tj/YEO3lajgmk=; b=P8YocYCnuzcrwO5pvK70zLRApO
	UHm0p0iGmaw6t67Xg9GsE/Ya2ypZjv3mgQAfPBYJsJEkwa7DkQITeDbPlGkpvIZO7JyGy6wlvHOd5
	2xVc/lC94ueP0fQvPZApO+1AsrnaU/QGnbLwEh3HTXuvH04+JGhFhTCVVrJr8OQhTLYvkcI6o6oxe
	b85C6nk6fuiYTW27tzcZ/ekmCB9JvDsKuhruLM3cEu7sghmNj6f+xiPjSFSDMZVO+TVqo02l3zwua
	8Kqd87+VKLQ+YcPSoM3r0sd/BZeKhaCVcbw03eTb6ECEDtjPD16uPLqqFZhZLokKUSME0Jl3+61O8
	jc/lXTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNB8X-0000000FigP-2M5y;
	Thu, 05 Jun 2025 14:00:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAk8-0000000Ff9P-0cOy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FB20629D1;
	Thu,  5 Jun 2025 13:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1749C4CEE7;
	Thu,  5 Jun 2025 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749130491;
	bh=6c08yMaPScAPjT2q9PtLNT/m6FgmW5i0I8814t4zESQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oQycruX6Ft+69hoARFw3CXlZX5gxdD4GTl23ki5AbhEGf0LQWe2muG2g60dEsxtv1
	 MY+oAjx1TnLypPHGwI9AWx9k6UHYCKiamVg2WduBh9b7+Q0g6zmSqPuO1vLUTsrszh
	 qgQtXZddYjCr0clgWARxLwC73ZuUfxDbk1iAdA34UsP501In3f6AgPIsyVrs6qxxhA
	 2GbAPXhPAZZjGM8a9RwNPOUwUj1RSKL6Y74Fvd/PtvWbgUZin70cQ5wLl/GB8+zZaK
	 /pO/qcECdt0MAzb0hvHhvM0i1bLbC83O56uuF0ce4slU8JFs42opW+YzshbjAFiH55
	 vO+YyX4/4kIUg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uNAk4-004J4j-OA;
	Thu, 05 Jun 2025 14:34:48 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Miguel Luis <miguel.luis@oracle.com>
Subject: Re: [PATCH v2 0/4] KVM: arm64: vcpu sysreg accessor rework
Date: Thu,  5 Jun 2025 14:34:37 +0100
Message-Id: <174913042252.1215953.11968070829426679957.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250603070824.1192795-1-maz@kernel.org>
References: <20250603070824.1192795-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, miguel.luis@oracle.com
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

On Tue, 03 Jun 2025 08:08:20 +0100, Marc Zyngier wrote:
> This series tries to bring some sanity to the way the RESx masks
> are applied when accessing the in-memory view of the guest's
> system registers.
> 
> Currently, we have *one* accessor (__vcpu_sys_reg()) that can either
> be used as a rvalue or lvalue while that applies the RESx masks behind
> the scenes. This works fine when used as a rvalue.
> 
> [...]

Applied to fixes, thanks!

[1/4] KVM: arm64: Add assignment-specific sysreg accessor
      commit: 6678791ee3da0b78c28fe7d77814097f53cbb8df
[2/4] KVM: arm64: Add RMW specific sysreg accessor
      commit: 8800b7c4bbede3cd40831726d3f98e8080baf4df
[3/4] KVM: arm64: Don't use __vcpu_sys_reg() to get the address of a sysreg
      commit: b61fae4ee120f337b8700dff43b2fd639f3bf6a5
[4/4] KVM: arm64: Make __vcpu_sys_reg() a pure rvalue operand
      commit: b5fa1f91e11fdf74ad4e2ac6dae246a57cbd2d95

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



