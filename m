Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DFDCEACFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 23:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ug/+WQGznHQZFspx4hzvIao2Fd8H3zJoZId+XewBIw=; b=Cx85DSaLUOvQ16pG+8ZmKpWH99
	/pecQ0gE3vmFsxh3sn8eBkLuHoUxzxI5veZTmoo4I3dGLH1rR6N7Riq6Z9iOVB7tLBrUasAnZIenN
	PFJWtKekYGvaUpyzdIKAwWjZu/Nvu0lLLT4cnqGNTIf9exm172r4h00QZI783Id1hFd/Et2B6jpM6
	5F6geFvKfw8Aep7G+19QV0zeYNLIEo5D96iwiuyUFS3yqlbZbr/wS7n78HPX9GMj9TEW5P3OjQQik
	sLCzulnwiU0NtJK8iPqeHdj/wvSte3LKhde+SzC7Ep4fbqQfchymtM4Z3/2n4wtmvzdJEgGHfwYCM
	ToUnbWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK3UC-0000000DEoT-1zIT;
	Fri, 14 Nov 2025 23:45:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK3UA-0000000DEo2-0ICx;
	Fri, 14 Nov 2025 23:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7ug/+WQGznHQZFspx4hzvIao2Fd8H3zJoZId+XewBIw=; b=qNRCd6yS5HX00LwExIo925glXh
	4o0R5xoxfFlwXcPNovP06vCdw7SU/kflvJbjsMf7Yc3ObzFHVNXo7tTR16P55y97zysgu5pn0ZEnK
	d5Sp+FyM4FFGKqkm+8ZmSI1gBPgr6ML2kgGEEAAr7MQ8RCF/5Gm6JOUOcN3VOVzQmVJbr3VzTAug2
	0GOvH5bV0XnYpvRSek5zINcGYKiVw2k3e6hukzUm8VGuCwwqrDwxUn3BW609fD5IWfUoakZ2jQv2w
	zBnUd/Tv4tDB9tDMYqXjrVbjlT2BrLjJ9CDaFbO9Pe3qRJtZIt42aeH49glKudLaApRThjsW1PeT3
	AXE+CIxw==;
Received: from i53875ae8.versanet.de ([83.135.90.232] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vK3Tu-00009U-4m; Sat, 15 Nov 2025 00:45:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	diederik@cknow-tech.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of use win_mask calculate used layers
Date: Sat, 15 Nov 2025 00:45:27 +0100
Message-ID: <176316391967.677170.7889906780839490279.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251112085024.2480111-1-andyshrk@163.com>
References: <20251112085024.2480111-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_154546_113157_CDB21D55 
X-CRM114-Status: GOOD (  13.63  )
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


On Wed, 12 Nov 2025 16:50:23 +0800, Andy Yan wrote:
> When there are multiple Video Ports, and only one of them is working
> (for example, VP1 is working while VP0 is not), in this case, the
> win_mask of VP0 is 0. However, we have already set the port mux for VP0
> according to vp0->nlayers, and at the same time, in the OVL_LAYER_SEL
> register, there are windows will also be assigned to layers which will
> map to the inactive VPs. In this situation, vp0->win_mask is zero as it
> now working, it is more reliable to calculate the used layers based on
> the configuration of the OVL_LAYER_SEL register.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of use win_mask calculate used layers
      commit: d3fe9aa495854f8d88c69c41a4b31e69424656ad

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

