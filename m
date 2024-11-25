Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7DAD59D60
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VI6iB72IM9pOeXA3Ahtpe9ntVlB4bLMrZkLxC+m0GCo=; b=DnPx2ey5SsWWG4TltgXTfw9l/2
	El36TVkh1GX2l0J5YuYleRhhReoVyE/xGlY2AHycxw8vsZZopyfJUpA0v1fhDWtLhV5r3JZDhVMOC
	GA1hI7YuM131JDmmfKLNYRHl2BAC1qVHcxEAwJFKt16Myu84N64hkzmJFG92wCwPs68ACvc4gqjXO
	dIEXlhj7p44YJQsCPmiIr1FNJ2cAq4dSLlUEdAnP/bjJhfnJDRAJPsjm9x1xheLRTbTCwTi+LM3nM
	O5B7har10uT9yaXRfSA6v/qPogurvog1FPUc7nRfklbZK/Xs276fCbZZRQZKxwNPI7SJkpBVGgGaz
	eBwdbJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFeXs-00000008wR6-3bzw;
	Mon, 25 Nov 2024 19:14:52 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFeW4-00000008w8D-3K2o;
	Mon, 25 Nov 2024 19:13:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1732561891; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AQ+fK8pZBszsVDlx+Z/SHz8j4YYA07x0lFPi3/F8soKU7jQx0AcUWZFkrJuLnOfETzFH8xDYXsU23BCxNsBXnvukMDO0i7CqNcSQn9f0Tm2Vhni+8xlsxaJhzqA0soMGsDGokQtTgKGGdck2d0mQakbjhlOECX2GvZcTvx0fpTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732561891; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VI6iB72IM9pOeXA3Ahtpe9ntVlB4bLMrZkLxC+m0GCo=; 
	b=ZqaReYXI3yMlq/kG/24NrDsk5UiAPogcX+U98S2vKtl3OmnyR/BmgSULaNR6oyxZSBcI31uDQMuecdYdM+ZqjhIFMO32zzCnpGaM9jG0dGlAW7I6OHFChVA11PJHYvXtJytmDTarzfAPM5oEHknoSdhWhOS1UpirhhPiUcm9sI8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732561891;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=VI6iB72IM9pOeXA3Ahtpe9ntVlB4bLMrZkLxC+m0GCo=;
	b=IF/JhwkdPjvuzgIS8SskNCIgBqz8pLJ9CLo/iWplRZZCy7mPF4ZRPjEZWXnzrU6n
	3OPBSf9YeaXaGYcMZ3NkawBA6zCPkrU45xhqfTaMmAMUjoOcgiYIbXkuZj9Yw1TYEXy
	gLSWpVVddBG9VuFDgc8aMbKNRMWDM+1+ol7ybMFk=
Received: by mx.zohomail.com with SMTPS id 1732561888245996.3404772030888;
	Mon, 25 Nov 2024 11:11:28 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v4 0/3] drm: rockchip: vop2: Add VP clock resets support
Date: Mon, 25 Nov 2024 14:11:26 -0500
Message-ID: <12567182.O9o76ZdvQC@bootstrap>
In-Reply-To: <3e8f91fa.8700.1936251b29e.Coremail.andyshrk@163.com>
References: <20241115162120.83990-1-detlev.casanova@collabora.com>
 <3e8f91fa.8700.1936251b29e.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_111300_902989_FAF24260 
X-CRM114-Status: GOOD (  17.82  )
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

Yes, the issue can be reproduced with the details in patch 2/3 [1].

[1]: https://lore.kernel.org/linux-arm-kernel/20241115162120.83990-3-detlev.casanova@collabora.com/T/#m82b38f4a83c4793bb82919bf736b2f6bd804a283

Detlev.

On Monday, 25 November 2024 02:55:41 EST Andy Yan wrote:
> Hello Detlev,
> 
> At 2024-11-16 00:20:39, "Detlev Casanova" <detlev.casanova@collabora.com> 
wrote:
> >The clock reset must be used when the VOP is configured. Skipping it can
> >put the VOP in an unknown state where the HDMI signal is either lost or
> >not matching the selected mode.
> 
> Can you provide some detail about how to reproduce this issue ?
> If we can reproduce this issue, we might be able to do a more deep analysis.
> >This adds support for rk3588(s) based SoCs.
> >
> >Changes since v3:
> >- Rebased on drm-misc-next
> >- Reword first patch subject
> >- Reorder commits for different trees
> >
> >Changes since v2:
> >- Rebase on latest master
> >- Add details on how to reproduce the issue
> >
> >Changes since v1:
> >- Add AXI and AHB clock resets
> >- Set maxItems for !rk3588 in vop2 bindings
> >
> >Detlev Casanova (3):
> >  dt-bindings: display: vop2: Add VP clock resets
> >  drm/rockchip: vop2: Add clock resets support
> >  arm64: dts: rockchip: Add VOP clock resets for rk3588s
> > 
> > .../display/rockchip/rockchip-vop2.yaml       | 40 +++++++++++++++++++
> > arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++
> > drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 30 ++++++++++++++
> > 3 files changed, 82 insertions(+)





