Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E06EFD20F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqDg7C1JgIC3panHLwcXUxYJ0WBkJSTyRZQSGN/dcfs=; b=qrFksPgi1sGC8sUo1pFD4dVrVf
	nH0ZFugr7Dd4R5mBwL58JrZHT2t2t4JzwWX7f47bipUT+N246a8hndFIE1QPfHbBtR2AXeV8qqG4J
	XlxITgqpPjErRzkMDHOdWtRPOM3wcDFrbMeBhO67wLfHvKn/Ii7EiVBwz79xPFt/lbf6ygxsYj9OX
	l3S/iEHJc0hcmgRsO+gYcqhaoAc3GnZ3IH41T+HFMlTETTJxMjpALQyd693UgNUfBmzFnJ44MPIiy
	6HTx/eSu56XGs3uq86oFxWJuVylCXz7yGdEJ5a4BF7omGdusIBd/6YcuyRA5YMNzZ7733Yei/LB69
	ABj4lPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAja-00000003buH-2pOx;
	Wed, 25 Feb 2026 08:59:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAjY-00000003btJ-305X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B5F560097;
	Wed, 25 Feb 2026 08:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DC4C19422;
	Wed, 25 Feb 2026 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772009943;
	bh=IuIWpowmo8Xqgq3Y+onfDk5wFveKZIxmim1zX5DjEXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xdf0nIHdaPvZqclmpcCBZDetKJRrTJKTevPj/axoOXjXY7v2c8KGe/89TJbvCTH5M
	 5tq5+xxr3IsZoFRodycPFjYELix7m5ImM9Aya6MX4EvS34Jgz3QYnUWzfbVXkRpIp3
	 dfcfQ800ptspDtrGCisK68mmsBi8U362szXi2DrxvjV2o3WQa3S4M+mEgN/JAG0K6k
	 G0S4cc555PmB36FoK5Gx+gQjEKN9XEczQe1zX5MVZ7QrMYdji7iC+WmlbUu4Smw7C1
	 PgpMMcyu+yvsSgoqEf2000jq+fVsUCPBGvxBpxXAzI9m8lqYsIqbMX0fAqlyXrTXb6
	 oeuULsJ7bujdA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vvAjV-0000000DdIA-1uOH;
	Wed, 25 Feb 2026 08:59:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: nd <nd@arm.com>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Fix inversion of IRS_IDR0.virt flag
Date: Wed, 25 Feb 2026 08:58:58 +0000
Message-ID: <177200993275.3967978.14380203034813209994.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225083130.3378490-1-sascha.bischoff@arm.com>
References: <20260225083130.3378490-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, Sascha.Bischoff@arm.com, nd@arm.com, Joey.Gouly@arm.com, Suzuki.Poulose@arm.com, yuzenghui@huawei.com, oupton@kernel.org
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

On Wed, 25 Feb 2026 08:31:40 +0000, Sascha Bischoff wrote:
> It appears that a !! became ! during a cleanup, resulting in inverted
> logic when detecting if a host GICv5 implementation is capable of
> virtualization.
> 
> Re-add the missing !, fixing the behaviour.
> 
> 
> [...]

Applied to fixes, thanks!

[1/1] irqchip/gic-v5: Fix inversion of IRS_IDR0.virt flag
      commit: 29c8b85adb47daefc213381bc1831787f512d89b

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



