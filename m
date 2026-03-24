Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DDCE9A75D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyBbJrhl+JbkmWxKmqRyR5KN0texKz3TQe1rLJZ4y9E=; b=A5Ph4PYk8ZXh08XGbg19WtTAH8
	j2kcs3ojKUEX5CBFeH/V4WU9abNTeY0HKWaEuDtg9kAXgzCkdkvTj91O03r2DjECnSTx+fxZaa8Z1
	s3LPKxBr7qBmGyMGFVzD04RC9IsKY26daFgbYkWDwRf699RVkOmP/GxxObf0gp++pj00rOQzLr8Cx
	o51VcXAzP4hiNgRcOVaQ0ZbwuLuITpkl0L3b++vVCEZt0ayVAZ/9F3kIsgpbTRemqRnJ2rhHSLxJU
	uNlSSHys149bMUdIgoh+C15iP/Lw2LuzH2sjQbchmykg45X6Se4TStNUz578fqfLWwREe6IuaBh+m
	/w/4J9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yow-00000001CGt-1IfN;
	Tue, 24 Mar 2026 10:17:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yov-00000001CGI-3J6v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:17:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 253E6600C4;
	Tue, 24 Mar 2026 10:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA612C19424;
	Tue, 24 Mar 2026 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774347428;
	bh=X57S92v9PsVwANXqz2O9mxWwkDwdhZBcWmfotp7Y8ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WJI+7T8bkIRW2PoOLSUOY2IqNusWm+c8BS/WDcatufsiApR52vyeazBcKXEee683U
	 HyPDF8xpCfmhzOW/66gbd/W9bucrpJiG0Jj4xCGOOhTNJn3UR2108UguEhQnweerhS
	 OKf9O/2ZNCw/fzhsavx0NQMjFU4x64Jgqz3+BUneQjdeneJgNTNNODoKv1tFqdhhzj
	 m2aBOzlhTPtb8uRBwzEuiCGw3bOp0YukoVVjasYrGB7iLrrmHTLHErsPXUSeZePrgA
	 Hd0UPPulp5+dCch1OIKR6qDOLNXxNAhEgdeuIQ8oTFM+ZUqugikc4ZHKGYL17ayHlW
	 RV9aHrwZErJ5g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w4yos-0000000572R-1i9f;
	Tue, 24 Mar 2026 10:17:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: vgic: Don't reset cpuif/redist addresses at finalize time
Date: Tue, 24 Mar 2026 10:17:03 +0000
Message-ID: <177434741587.3191556.9572155374639344215.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323174713.3183111-1-maz@kernel.org>
References: <20260323174713.3183111-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

On Mon, 23 Mar 2026 17:47:13 +0000, Marc Zyngier wrote:
> Although we are OK with rewriting idregs at finalize time, resetting
> the guest's cpuif (GICv3) or redistributor (GICv3) addresses once
> we start running the guest is a pretty bad idea.
> 
> Move back this initialisation to vgic creation time.
> 
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: vgic: Don't reset cpuif/redist addresses at finalize time
      commit: bb90920c5ae1217449409dc0b5256c6ed4ccab27

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



