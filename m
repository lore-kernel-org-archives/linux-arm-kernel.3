Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F6DD277DC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYReflaw6Ggn2elfjPo5fcOOtHNAZNVa8CaYgcvrZrI=; b=E83OSWric4IG6D7jMj2YfGWVh+
	AlFrZW8HN6JIf4+ButZNeyGRiMl9QMjSHG8cs52BiL8/BhaGI2fCjgSzUV6E0AahH5aljhTo2lJ3c
	65+jEkuxfPyr4WGemQaSxIhl04plSoAy9cmXl26abalie2ZwURiKZugLWFLWcEyWOV5Vse0zBjnwq
	MDHTjgkrqJIaPSQ8vC4vQRbpR4uK442NgxI8T90Fg5eIlozXs1c7hOIk6barBErv6BwzRl2a7Nr7J
	SEYK67NOLjfTuZjDE1iJAUFEmUGIeKujvrBeCFUzjulAi07GdLXXx+aBlpKwDILz/wxejS+Hj6LrW
	IgkwZV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7n-00000003OQ3-3UM9;
	Sat, 10 Jan 2026 10:23:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7k-00000003OOT-3SEb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 10:23:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 762734416E;
	Sat, 10 Jan 2026 10:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E15C16AAE;
	Sat, 10 Jan 2026 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768040590;
	bh=5BpRwTddsBFl6oqWFX7gfeQH8tja4Kaghtjo7PeB38k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SnZiiitckm+zMMklN93i/ILolsBGbfeN5AAFjCWBuSUSfwHNiUI1Ud80JnQsun8LS
	 v5EIUhb1gVylmu6LoZSwLjEw8pAxmjhW/Qk6wHUvIFIpSl4/LESGKE+9sswIdOGH3r
	 Ns1OXMtsu8vgrToq7YWK46uSJtHTanDV4uPyghVZYk7kg2+LuezH15Ry71n+2rFTax
	 8l7qOAgVBgZwJsOK/p7aELVeySnCBtSG4GIGTGrAx8VR3SMweMoXE51+NMeSgS4aea
	 Ekfu4rPoN6kQOD0RgiYVcNukVdmZR3Qu1ZbnSrhrQYv9BeirmPBE+xlpTZtokXsY3O
	 uXGGdtRMVGMPw==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] KVM: arm64: Don't blindly set set PSTATE.PAN on guest exit
Date: Sat, 10 Jan 2026 02:22:43 -0800
Message-ID: <176804045760.916140.17170975850498325021.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107124600.2736328-1-maz@kernel.org>
References: <20260107124600.2736328-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_022312_890090_007BB9E0 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

On Wed, 07 Jan 2026 12:46:00 +0000, Marc Zyngier wrote:
> We set PSTATE.PAN to 1 on exiting from a guest if PAN support has
> been compiled in and that it exists on the HW. However, this is not
> necessarily correct.
> 
> In a nVHE configuration, there is no notion of PAN at EL2, so setting
> PSTATE.PAN to anything is pointless.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Don't blindly set set PSTATE.PAN on guest exit
      https://git.kernel.org/kvmarm/kvmarm/c/86364832ba6f

--
Best,
Oliver

