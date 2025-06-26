Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB97C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgX2rbSl6nxCZ+ljksLm2VvnTJIQa/AKPDwm0hWPs9Y=; b=ADKmjEkyOojUIfcxC7e8kEwr4Q
	I7pcKQdwlvXKKgKBBNMtIsnYFEuqpOiEuzIV78DyjzFocfBnVdUiOTdDyZjsym/PGttLgO1NLeF7V
	AGRHftVG80rVkn8WLvcX0t6eHYMV5Q33x0smcuZdXc6YfRztmeZ3dgwap6Csy6tMcatv1z0FfEEib
	wC3UjHs52cekj/gSL0ngik8/tG1afffEK0ge/TqEB7b5Uqmv3B7kkh6C8zWreJ2yr1kp05U0OSeu0
	DBchPOvprmptMW/Ag1TRc/wlsFY+mewMuc6rQiYgH2iPLm3uWTOQwHT9yaG6xU/pyXwJTgc0X9bzc
	UpTF+0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhVX-0000000AsCj-2REB;
	Thu, 26 Jun 2025 07:58:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhPl-0000000ArVN-0vpt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 07:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3D2C617EF;
	Thu, 26 Jun 2025 07:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B36C4CEEB;
	Thu, 26 Jun 2025 07:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750924376;
	bh=pJA1oEnHjl7M7Z9qrdqOkWhZGLir+8D6TagEYS/sYmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g8tEl3zAcKnl8rBFQAKlUrnNDdx7tOq3djNZLVF8prU9kr9+VwIeqrOYRiDVqzdLa
	 YZB2wxKAIHM7r77YFbVYdAXaCX6MLpabsUjwAatSY5cgmgsACdqSTJCgs9g2KU9RgU
	 1jepk5Fns3rRgq/+AF2XlbWQCWAobPpDWCBOlAf1cDqOpdXQxfi+BOIY8n9GYhFiPd
	 N6ONq7+M1DOL9BQQFwsLM3Rp+uIF1IEW/vfJfpMaIIbvYRvizTC2z0+H22Fvb8dcYZ
	 wa83J0Uzo9ESjbuKrn7iatx0TOfXb3/Wa9iSvzSRfk/CQ9IpECvTrQgDlca7xjA4mh
	 uBr09ZNzMfUpw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uUhPh-00A8gF-Rn;
	Thu, 26 Jun 2025 08:52:53 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix MI line level calculation in vgic_v3_nested_update_mi()
Date: Thu, 26 Jun 2025 08:52:50 +0100
Message-Id: <175092436132.7925.6436811848886215951.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250625084709.3968844-1-r09922117@csie.ntu.edu.tw>
References: <20250625084709.3968844-1-r09922117@csie.ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, r09922117@csie.ntu.edu.tw, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, jintack@cs.columbia.edu, christoffer.dall@arm.com
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

On Wed, 25 Jun 2025 16:47:09 +0800, Wei-Lin Chang wrote:
> The state of the vcpu's MI line should be asserted when its
> ICH_HCR_EL2.En is set and ICH_MISR_EL2 is non-zero. Using bitwise AND
> (&=) directly for this calculation will not give us the correct result
> when the LSB of the vcpu's ICH_MISR_EL2 isn't set. Correct this by first
> adjusting the return value of vgic_v3_get_misr() into 1 if it is
> non-zero.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: nv: Fix MI line level calculation in vgic_v3_nested_update_mi()
      commit: af040a9a296044fd4b748786c2516f172a7617f1

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



