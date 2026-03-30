Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140A9FC97E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuAWp3WuRNOiGbMUfdiOKGUuLbpHU86UYThvWrha9xo=; b=WMCMwOQm61eUqS4j/8VtfK5Zey
	KBKt9hxVpXMgBH53fBjrQ9I8m6CmecLwioMnDZ3ooQ5Yfhb2Rx//gr6yGutlqP2VSk8Hbgr6MciBC
	5jB0vHmvx8Ey2uaJyElzev8S01hPem1z4RHkxp20+/flFTqS8czSiZW9MwXIdklJx+QyTUX7szgNn
	IPqHb5j57uf0BdrsQL6up/VbuCKZ98sTKtaLuMVVDdvrXmjMxLYXsnERYMp0Fxc5jte3FJEbGOfS7
	zU/Ldj6u3NKDk4zMRv2utGnfoXxrjyVUtp36rK5GAppbYpTPyZ9D3eK00YJTv4HBjHVVdyZxEKF7W
	w6zp8LWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78RD-0000000AvDo-12KE;
	Mon, 30 Mar 2026 08:57:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78RA-0000000AvCn-38vZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 08:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NuAWp3WuRNOiGbMUfdiOKGUuLbpHU86UYThvWrha9xo=; b=bvSsFvzzpEG0rMMNqfsYthO0Am
	iU/ks82d2OxKATh03IRqXFc5hGP1C32pIpV4h6rjvP+RdFGAExptt8kStfqZqdQuI/Ixdg/yOXJik
	Qty9Q/59LXAxyiBYw5/oOcOYt41gA0g4Ki00+CU4v6zmNXN5PQj8kHcF7OBr9m3vlV32LKE3hTH1L
	kpnUb9EgQdw6aamI68xBNiw7uPCaHm3owrIUnCpi9eoSAYOVxjn+wP6DK0DOTNDeXf4WphOKDDpkl
	l0a373NzxdrsbPJnzd6f6z1A/E6Ylujzyin1TPRksbqLvS5oSDUVCB78j9njciu8i7lILfcTpdfjd
	l12hHLCA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78R7-0000000DNBO-0VlN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:57:31 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43b8cb81bc0so362466f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774861047; x=1775465847; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NuAWp3WuRNOiGbMUfdiOKGUuLbpHU86UYThvWrha9xo=;
        b=Z3SqUlq38vrQ1/uzLqmLk/fy96zUWi8gKdvmEn1ODRnkznglJsdwu/TsPOZLBY/e40
         vK/3CM1qs+57/pcQxwOBqr5bSLiJUcjAsJIlNnoXHWUuRLcpjFX0nHntCbr7r5+ypa3h
         IZ7/p/f/vV9fLKCQ8QGN7wx+FJvNquM5WijEBYjIwZc0fnHskqz0DqhZV5POHRcprflw
         4uYSCX7H74XcVywTWz5izvNNffDGrZbfkxpwOaIMf6CMYtOzATB1l8WLVKQFvzoPtZEi
         lnK3nfW4BGgXhVH8Az2fgfdqIcLqG0EmpSABWuQMWv+EGcYlNs5xkqP+9CfAlZCKnUKD
         OLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861047; x=1775465847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuAWp3WuRNOiGbMUfdiOKGUuLbpHU86UYThvWrha9xo=;
        b=OH7ymRFX2PYi4T+ixe6yqZScvDCB4So68CTwMhM/NtJC5E8jvajbf/JUPY9ZoXGWjR
         5qiif36+D76PXqt3v4TGafLvZtM19Jm6EXFFKSRwQsxpbyftLhZwvqvArdjIWoIyBWTW
         JFSk2Y1oIp7mqi+excIoot5YXYtPXKDaZ0Q6fnGhGQ508/AmWGcEqncDdXz3scUUaR9U
         KOOSV7tmTCtTAnAuam2o89MOShxi7FwW3D2JoMg4+434TJAB4yRfnSq+bJ2iv7kCPbWX
         /UAJ9v5ksAQ89No41nAJ3wpl0VK2LCbkaM0Ji634sen0AneRceHBYbS4cQ/5LfYZQmz4
         qj/A==
X-Forwarded-Encrypted: i=1; AJvYcCUe14fS6YWR7A0J2k6Z4qtyFG/g13UTEH7UosmBly6wzTcBFnf4eHlWU6d2Us5Fjv4KMVO+B/MkInxbHE0yeXxP@lists.infradead.org
X-Gm-Message-State: AOJu0YxiIXX+1nYdYEpjnpTPFXEmQc78x9sJSEbK2uLa9bPKGriLXbkq
	i6B45+PuXqVbX4WL69GEyyDYbZl84wc8E5HuVchHR/nyYLYZcXOS7Mcj
X-Gm-Gg: ATEYQzw2F4O6B2EEzYaGW/apdtSKxHksaKC6brhc3mjtbrwnGdEsmOXfRx/uI4SLbbm
	MAKNXTF6A+bXj+oRawP8auNlVkHzERpNHA5wcBdCdQw4GTdlvhLyRwhm3Bdit7Y3bazAgYDQf+X
	bwQPBrPpyOqCk5Tbz7fz+vDry1LN+Qi/FtSrwm+v91RdjyvKyhzvqlLNHYtOfAwnFUm3qjjpIlr
	zgQlCXG/hpymtkHWEEzd0XVicFejHK0On4ga89NKIPoMQbdxR9rACciT7bPX+Nv76IM7cUW3vPI
	4SetWk1Hm3TAs6j824QJo8gKliH0iu4xiJmCoscsXJ2mtksVAQ4K1lZgLDEE9HwstcvSNQplPA9
	BGeYgmpOCOmQfGyvKcTGf3YvoMj+FxEX+kONV4+phV3uTrM0nhESIODgp5PIK/vJuuxDzUYwN02
	nvb4GI2MxILo5GBPmUkviGiEpAfA==
X-Received: by 2002:a05:600c:1d1c:b0:487:1fbb:5a28 with SMTP id 5b1f17b1804b1-48727f2d043mr90623985e9.1.1774861046566;
        Mon, 30 Mar 2026 01:57:26 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:a0f3:2097:3813:850f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873bbcac33sm65338995e9.15.2026.03.30.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:57:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:57:23 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/2] phy: hdmi: Add FRL TxFFE level control
Message-ID: <20260330085723.4rewkbs76lz3scum@skbuf>
References: <20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_095729_431318_3A93613E 
X-CRM114-Status: GOOD (  17.57  )
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

On Sat, Mar 28, 2026 at 03:54:53PM +0200, Cristian Ciocaltea wrote:
> During HDMI 2.1 Fixed Rate Link training, the source and sink may
> negotiate a Transmitter Feed Forward Equalizer (TxFFE) level to
> compensate for signal quality degradation on the physical channel.  The
> source starts at level 0 and may increment it up to a maximum agreed
> upon during LTS3 in response to persistent link failures reported by the
> sink.  TxFFE adjustment is optional and entirely independent of the FRL
> rate and lane count selection.
> 
> Patch 1 extends the HDMI PHY configuration API with two new fields in
> the frl sub-struct: ffe_level to carry the requested level, and a
> set_ffe_level flag that switches the semantics of a phy_configure() call
> to a pure equalizer update, leaving all other fields ignored.
> 
> Patch 2 implements the new interface in the Rockchip Samsung HDPTX PHY
> driver.
> 
> The series depends on the "[PATCH 0/6] phy: rockchip: samsung-hdptx:
> Clock fixes and API transition cleanups" patchset:
> 
> https://lore.kernel.org/all/20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com/
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (2):
>       phy: hdmi: Add optional FRL TxFFE config options
>       phy: rockchip: samsung-hdptx: Add support for FRL TxFFE level control
> 
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 74 +++++++++++++++++++++--
>  include/linux/phy/phy-hdmi.h                      |  6 ++
>  2 files changed, 75 insertions(+), 5 deletions(-)
> ---
> base-commit: f7b64ed948718290209074a50bb0df17e5944873
> change-id: 20260328-hdptx-ffe-a89c51e66904
> prerequisite-change-id: 20260227-hdptx-clk-fixes-47426632f862:v1
> prerequisite-patch-id: 5c1d442fae39103bb758f54738aff33d2491401d
> prerequisite-patch-id: b86f30292308345387d2a6b50949ad040b931592
> prerequisite-patch-id: b1335105db9177cb10c64ed1bf0867832e6aac2f
> prerequisite-patch-id: 83db6603d13e19f239e89fde2b26366eb0106b7e
> prerequisite-patch-id: b534395ad315811861f11859a3946f65c90c631a
> prerequisite-patch-id: f9637e57c902f35218cda658397416f84f7285cb

Sorry for my ignorance; who is supposed to act upon this git-format-patch
base tree information and in what way?

As things stand today, the build infrastructure we have in place will
not be able to apply and test your series unless it applies directly
onto the linux-phy/next branch.

