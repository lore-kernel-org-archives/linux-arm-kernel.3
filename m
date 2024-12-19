Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B45E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cS+nRbp5xUtPRCpEi25EwuCO4ItLuZHhxv5YcNc6e4M=; b=dtaGpkphJ86hm+NxqD8PJCPSlh
	vcuqA7awIkL00VjRhSn3vNxwkt4Yzwlj6wira/4yQiHAeFUiP1cKhFeo+qcMCqz8utRr3BxOcxP6K
	R+TGVBXZ87JavJN4DNjz+ZSVOhc4eoGJYkecQkBf8olDG762ydjwuZUk5nfJIG6LOf30wWVNBePer
	c+DcdC+dmnj/exH7xnC4kEJBriDj6L4CTbxWIwCIZhcfPhpd6ykT/1WWBCwm4FMGikPSu033UUBno
	svFY/uqoenZEYBR4ItqtcK00IlY0/C7kOEPdrxVE1ULfyALvS0UZ4cdJuc0FR59ohxKVGtjLx2N+5
	zvUKgpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEGu-00000001bUJ-1yXX;
	Thu, 19 Dec 2024 11:00:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEFn-00000001bGY-3Tmw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 10:59:41 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso435482f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 02:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734605978; x=1735210778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS+nRbp5xUtPRCpEi25EwuCO4ItLuZHhxv5YcNc6e4M=;
        b=fuIBXAwmRKppMKTQNQWQYSS0zLpUrVBqMKWd8VRHZYA/IIoqBJa1FUR+4zh0xTOZUH
         /o5kV3z9H6HSlJEI4ni7cMr97nTtTwxf1m87/lxuoCryiSkna4xgbt/ifNaLI2WujNsw
         E1eeSZ5R7eXIPwE4sbZXD6I0EwdGhAUvpK+l4s1epQejiEFsUWWjZIxdRuHdmss6QUlp
         E9WxEHIFosDRXPsu6868q0q16RkPne+r1j6vtYl5fyOO9AxPCOHlDMi08D1XTu/yhWKl
         knblFV/QjDkCmY2JYkxoTSoxxL//V28535cYUj13ni1vefwk75K2VUDsg8jQngUBTQQI
         wDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734605978; x=1735210778;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cS+nRbp5xUtPRCpEi25EwuCO4ItLuZHhxv5YcNc6e4M=;
        b=r+HBh11M8znSTGJMxbvzr2j0trZYkNtMrVbSh+C/AVfc+VZLaDBjQIYwASI4McPBA/
         XDmZTUOm30KsMvA5Rx9mw9KSK4cpRfjLL2YGNszARsz+BVQAQ7gnKAUPR5khufisCwyT
         xarMvTiqYkfoH513VxZsmSuwtsD3PC8CpaZYj9OCuOprAjiPAdS9ogI1HGqJDYW2PQ0c
         4YvO3pwuf1VUGwlQV4bGyINVfSk5VcO5GGNkcjgeLUP2fLjQ8FuAlxa08uCfFCUZhoTZ
         jJLBBH7mYuFbqiE36o+50IZMWwaCN/9+IUfOBent2I1SoxD65+nZzKw4OnPb+oXfJIzy
         Z2BA==
X-Forwarded-Encrypted: i=1; AJvYcCVDcEYeUVS/93sRqDcXXTCCjgWRBhchNvtTdsUzRR4N6aJN3SvXB9FE5m8MqTAuK9PadKLTRcmAgmGS6HEYefzq@lists.infradead.org
X-Gm-Message-State: AOJu0YzFRSGzIquxK0N4qICmSFCj6AZLxxYiEXj47+Hf2Mh38lBAC9Hs
	ULkooSc+vEzwHKqIMcSuQh6rhYlroTRc2w22/4Nq/uNQfZ+w3/cVXqOBUeYCoYg=
X-Gm-Gg: ASbGncv8uTJbyY5scggfBnPXE0VqQ82E9H5jKEgiyoj+RrulrY7yMM5NGfswVZKWl2y
	Co6zfl3nSJhKs3uD1JChO1fovlZgHBeLAXlK7tPz00AOT8WnfZi+bG4X5ozhNntQV1DkQuPyW/7
	P2sCrE0H+XZrkWS5PjGED6K+AepYSCtCKcMNg7GJjWK1nmy1YXTKRHv0B1QEqbcHcPN+Z3Fk8k1
	MiKVf1SAJvRxkDbxdYGQBYbP0blayRMQF6zNoQou+FAw3t8v7ILARZkBdjG/ckBieNTZgwWm0GD
	IA==
X-Google-Smtp-Source: AGHT+IENRpTZ1e7nnnS7IIxmPArBgJVUoa1AtaNNn0RO62JEfVFRRCR0Cb6o8qC4D0b/oXcnJqyscw==
X-Received: by 2002:a5d:584e:0:b0:385:e9de:d521 with SMTP id ffacd0b85a97d-38a19af880cmr2997296f8f.8.1734605977659;
        Thu, 19 Dec 2024 02:59:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2d2sm1289920f8f.71.2024.12.19.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 02:59:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: andrzej.hajda@intel.com, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, marex@denx.de, Andrej Picej <andrej.picej@norik.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
In-Reply-To: <20241216085410.1968634-1-andrej.picej@norik.com>
References: <20241216085410.1968634-1-andrej.picej@norik.com>
Subject: Re: (subset) [PATCH v7 0/3] SN65DSI83/4 lvds_vod_swing properties
Message-Id: <173460597657.883073.14115671156294694663.b4-ty@linaro.org>
Date: Thu, 19 Dec 2024 11:59:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_025939_890925_D3DA78F1 
X-CRM114-Status: GOOD (  10.37  )
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

On Mon, 16 Dec 2024 09:54:07 +0100, Andrej Picej wrote:
> The LVDS differential voltage swing can be specified as arrays of min, max
> in microvolts. Two arrays, one for data-lanes and one for clock-lane can
> be specified. Additionally, because LVDS voltage swing depends on near-end
> termination this can now also be specified with separate property.
> 
> Driver goes through the tables, taken from datasheet [1] and selects the
> appropriate configuration. If appropriate configuration can not be found
> the probe fails. If these properties are not defined default values are
> used as before.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for ti,lvds-vod-swing
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/63f4e7dfef8c1162e22cd25c9a23b125ba40dfc4
[2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d2b8c6d5495706eee2347483ea89b5c13f256ff2

-- 
Neil


