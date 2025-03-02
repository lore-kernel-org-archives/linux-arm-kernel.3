Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD80C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPjgLLKWy2wvQvaiR+uGJguXDw1skCmohUdLq/bT13M=; b=ZWppazqiBGET7KmY7A3h63jizh
	7HXr/G82ssHwS81Ld0nYIsncbdnIdAVJJQoIK5QWqF/dvSRR1jdhCoZ39J+8JnDitM0m6E4nayYng
	Seug2OEwzTZN2uz7sMh3JZcW2v45uZolAZpn+x12I14eS7wc07Z3EJZourkqhFmBQuwZW+V4uHz32
	O2EIkoueEikhU7/uY8vPX9nJXF2I++tNEv58+noD1btlAxjJyROR7/m4COg8EAiFBzV8DMSYxvsKS
	OD8bU2GKlvDEQx/rCEIDilMvbe/n7XU+P3bkgMRawlWBmCbfnkydg5eT5zC4YeDhJ+JQg2E+pCnbj
	doBJpd5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tooXL-0000000GY0q-0iJQ;
	Sun, 02 Mar 2025 18:59:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tooVl-0000000GXtA-0K9u;
	Sun, 02 Mar 2025 18:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pPjgLLKWy2wvQvaiR+uGJguXDw1skCmohUdLq/bT13M=; b=zgr8VpMs2oAvmtSCdLZNlyiimz
	8LpNFXehoTksa2gEf3aQkohP09ro+0qaqjvYXaQu+KxZB+sIKlyUbvUikUssDkhX7/7AP7k3KfEaz
	CAyKltObROv4gAMOa6xExAlm0l0aEKhoX+c9Pu1qTiFRRCfGJmEIJqtREfcq73tx7Ws1YbwXRGKdw
	WnzTTKVSCtKDSdIL8G1CshPaA0/1AhvPCLPnbygN/m2VtmmRPHGF/nWchoU07/hqyZW/BJqwtS6iH
	00V1WJLr3B0KvowzlMahZEFATeTzBlelY/WUcLfEdDewwy1pfGP6nsBKk3XlXNJTeRn5QvR3q8al7
	Q/n2u9kw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tooVb-0004sB-28; Sun, 02 Mar 2025 19:57:51 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v15 07/13] drm/rockchip: vop2: Register the primary plane and
 overlay plane separately
Date: Sun, 02 Mar 2025 19:57:50 +0100
Message-ID: <2759797.BddDVKsqQX@diego>
In-Reply-To: <20250218112744.34433-8-andyshrk@163.com>
References: <20250218112744.34433-1-andyshrk@163.com>
 <20250218112744.34433-8-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_105801_108216_A2F44B0E 
X-CRM114-Status: GOOD (  12.84  )
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

Hi Andy,

Am Dienstag, 18. Februar 2025, 12:27:34 MEZ schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> In the upcoming VOP of rk3576, a Window cannot attach to all Video Ports,
> so make sure all VP find it's suitable primary plane, then register the
> remain windows as overlay plane will make code easier.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
> Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
> 
> ---

patches 7-9 look good to go, but ...

this needs a rebase to adapt to
"drm/rockchip: vop2: Consistently use dev_err_probe()" [0]

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b06d1ef3355571383cdb463cf0195b7a02efdfbf


> -		if (win->type == DRM_PLANE_TYPE_PRIMARY) {
> -			vp = find_vp_without_primary(vop2);
> -			if (vp) {
> +			if (vop2_is_mirror_win(win))
> +				continue;
> +
> +			if (win->type == DRM_PLANE_TYPE_PRIMARY) {
>  				possible_crtcs = BIT(nvp);
>  				vp->primary_plane = win;
> +				ret = vop2_plane_init(vop2, win, possible_crtcs);
> +				if (ret) {
> +					drm_err(vop2->drm, "failed to init primary plane %s: %d\n",
> +						win->data->name, ret);

should also use dev_err_probe


Heiko



