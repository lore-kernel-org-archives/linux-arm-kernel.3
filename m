Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4F1CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hmESmRQ7oEDRaIT7qrXfWDnCEYcDZdHNx/MwGQONMc=; b=ZXb01BZMGdCV0Px61IsZwzIPLY
	HEyxGOHCjqJgcYuO1b9rs+X2qCZaEiuBbtrndLmjgb+Sdx3/0atht+Pqb/0aAZvmzy4NEeJRcdwh/
	FCjeUZgRxXfHMgtU/+CI+WRBI0+CV75GhEl12a3d0HmdpS1fboCfBYvn28RY3m9bEPB+iHFL8V2qP
	Mzh9VfDI5JPVNUJtABPdaAESQAh6TACiPy0xuQbKIxjmhF5vm4wIIKMgu+yyTqWXACUTYPvbkWtBp
	wCdn8eIJmagoJIbpHwPfToQL8bMb8haTih54SqX9DHymCCV2NiEhEh7pxfm6rYb8tO27bQfFrR9HI
	lL5P0efw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxWy-00000007T7i-0wMn;
	Fri, 29 May 2026 13:45:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxWv-00000007T77-3Q5W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 13:45:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso94701425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780062340; x=1780667140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hmESmRQ7oEDRaIT7qrXfWDnCEYcDZdHNx/MwGQONMc=;
        b=YqeoLLmu3YCfpX96kAfyvN2a0fGOjmoVVbmZrnZK11xDgdmCSRGLtJNkVtYNO+QJfQ
         LdFSpOV2Z7g1AIJnLaKJOdlYqNHZ01gN+dD0MjDekzIRqe7RBQ2z7Ve7TUSAQYAY19zj
         ypWDc9Kkuad/e5+L7i/LCDUCA2c+89gxH6MR3S2mIcufjZNr+R2EueCyv2tO3NLAEYw7
         i5MLGT4Ws+XyBCB9Vj+1w36Gve42tJhxXan/xA4o52PIAeJbsToAdz2f5MB17PrtKDuf
         rc4C89bpncL0B1+lZKwsKPqxab/GnR7dpg8sLPSQopxWJLTSSOvfzCD3Xyigk6/6ZJYe
         j+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062340; x=1780667140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/hmESmRQ7oEDRaIT7qrXfWDnCEYcDZdHNx/MwGQONMc=;
        b=KyBdODWjML5CP/rSvNkTq6xh4egm/XSUxNxjLS3VBajs92reiQ+7eKcVZp6iPxmOoa
         l83CLBZNUEZeYARyC2NUcOh43CE+FRMdI9QdDVBRpn3j+bNGK0nszJXQe/eE03iMskCX
         KH2hNkRj/XATDYoMfI6Uh1fwCNnzSDKkl3hFg8JmSALSiVEkx7PqOo/eg/DfevmjhH44
         uBbACw8SnfMVw/hFcyG8iXCNouEa5+YXoZNEFvQODOj1tx1BAvUnZhjvO+gleIr5dkXX
         aY24lhe/5TMrDaQn7Wg/haO4x0TbMqso1QRR6NDqXuNoXBApj62nKhulGJmGdumVvVXK
         Q4dg==
X-Forwarded-Encrypted: i=1; AFNElJ+906Sir9j4DEtJeWui+FEp/i54FwMYy0e78TrpegdAUYfcLbQZXt4z8zcbQioKbdpjyPLTo6OdFKxZaPwFp6iI@lists.infradead.org
X-Gm-Message-State: AOJu0YyP0/JCRUkBHARj8kPeugE1uoXV00A99mbaXUlWjGa1cayo9QHV
	rq72I68BILvRpk2UBE+hpV+YC6akLo5UVi0mO2M5Cc0cdAxpR1rF1pUFcE+QDxbgtLM=
X-Gm-Gg: Acq92OGfQmxM9oIc1eD6icvhwtf5O/KT/VAFQ8VZoIUJb/1F4M81snOv0Fv7YZajXg6
	2fSuYZqVQeSvo/CNCfSt+k8ZOYxj8IqzRceO1TEUUaCqLQVs9HBmYOjFGG3Zp0Tb5Epk20iHlPS
	TnngkZsdIIzmVZSaCamNNTFarJtisY6Oo8BsFMJh8c+tOhv9rOqyOPCdO5MVUGZ65xFxsFhHFT1
	0PCCG0qAOJ9GvgkKTxII3ML1i9GzO2nozgSa7vCM0heBtCBlItkdiI5fmVkqW5wAernMxvKf/Oc
	ZbOV74dRzL/pdqmJCawzWo0Pu+xJptUsqhFAl7Po0vwuHgtJgI8ra2Csf/vxK+qcMUzq3wvEBom
	x3FFqVyQbtfbzxJsWhrwpiXFUHHWLB/p9CCZ8OPWfB4XBHRcJiIuBSl/5poY0jqYlPJcm3NsHi+
	NydQRNs8Ca4sGZR9Z7fCU2EG7SF4f07fBYItrN3I5cWANFH8/wiBn8WkU=
X-Received: by 2002:a05:600c:c0d1:10b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-4909c07755dmr41345005e9.7.1780062339885;
        Fri, 29 May 2026 06:45:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb3adsm41387165e9.11.2026.05.29.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:45:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Vitor Soares <ivitro@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
Subject: Re: (subset) [PATCH v3 00/11] arm64: dts: ti: k3-am62-verdin: Add
 display and peripheral overlays
Message-Id: <178006233854.3611686.1401419911890133047.b4-ty@b4>
Date: Fri, 29 May 2026 15:45:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_064541_868866_7DA637D0 
X-CRM114-Status: UNSURE (   8.55  )
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

Hi,

On Fri, 22 May 2026 17:11:04 +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays, expanding the hardware support for
> the Toradex Verdin AM62 SoM. The overlays target displays, cameras, audio,
> and peripherals available through Toradex carrier boards and the accessory
> ecosystem.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[03/11] dt-bindings: vendor-prefixes: Add Riverdi
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3764568dd2e621850c8c2a34dd8a88096ae73e72

-- 
Neil


