Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D236CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+svzqE5ocNDgN68Ny4TxkgRFPuZDVnfkNUjs1uBQuU=; b=Lu9l4W2GuORhsmrA6UvhTCKK2F
	klOupGv83UKFdjYliDOzuGDt47GbhHpmTA7uqDlJhPxm9/5FwEHfTbanj603wzn3cxmZl6aPeBDQ/
	INm+9wnp3ccOmPWvpvWu1twLpE4dz71HztZYJoMIU+O3wypPpo8dFb7DoHtkoFW3vZidATFy9+Kg/
	ODw0bZc36+EElXaZNbGS2LqzvuVNE/Q4QlNB2k3NKCE52RH6e5RrN6MOO6IlfYS2fYv3zK8JZGo+W
	plmyyn/BswycuprEwuUZamTdU7xrNy32SoiemE7GINVbZvxO3FhjjNbgOtKUQT9P0Yq/LJSyYfE2d
	A+tJitsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVQk-00000004Rxe-3Xo2;
	Thu, 30 Oct 2025 16:23:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVQj-00000004RxO-1HGU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 16:23:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B9C9605F7;
	Thu, 30 Oct 2025 16:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00425C4CEF1;
	Thu, 30 Oct 2025 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841396;
	bh=4GBRLaudHRcBoz01Z4IeWd9bqYB0qBWnK2IVkXPjuoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C+JX+u1AHdIdZKw4SyNVX0vtYYqnUKc0r1DZLb6pJ0joB9sWk/f5VrR5I/HS2HOM6
	 ANZuNZEUkf+kqIi0ByD9yjuRgnWYZRjArzFYtRkHWM4L9ax/rBg3qRxJkOgR11X0yN
	 Wpc5V88Gj76jEGU+0RZC1asYaoJOq0rbzpOe8/gx4ikTAuLlnjsT8QAm7z3hQf4p3j
	 eoiw0TuwkHa8FbMbwFDzNMKXvFn2wZQ8ijgZbMnaeIJecVTeAwfYeGZHeuUeQD+tIf
	 QnpUIrYZwDe9Z4a0k25LGe8onC99z5iNxqdv9iG95R+20Jdy7VByJq5twDzySRiI0x
	 lYAJ1Bmjs+4qA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vEVQf-0000000139S-3rhC;
	Thu, 30 Oct 2025 16:23:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: nd <nd@arm.com>,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: vgic-v3: Trap all if no in-kernel irqchip
Date: Thu, 30 Oct 2025 16:23:07 +0000
Message-ID: <176184138741.2037570.6590517133486615638.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021094358.1963807-1-sascha.bischoff@arm.com>
References: <20251021094358.1963807-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Sascha.Bischoff@arm.com, nd@arm.com, broonie@kernel.org, oliver.upton@linux.dev, Joey.Gouly@arm.com, Suzuki.Poulose@arm.com, yuzenghui@huawei.com
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

On Tue, 21 Oct 2025 09:44:09 +0000, Sascha Bischoff wrote:
> If there is no in-kernel irqchip for a GICv3 host set all of the trap
> bits to block all accesses. This fixes the no-vgic-v3 selftest again.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: vgic-v3: Trap all if no in-kernel irqchip
      commit: da888524c393b4a14727e1a821bdd51313d0a2d3

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



