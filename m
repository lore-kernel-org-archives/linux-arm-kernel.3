Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB613CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VW3FGEMYl3HtrO5py8lQ+JYd7M0lWOH5Fx7/bpcIlXg=; b=BvmEF4+r/vSJDEyxTRlb/lpBAU
	Ua4gfRc8tYiEYHtcwhHq1LkCJdI3CUxhgZ/ahkoeslA/chm+diQG0PaEipfgqx2r2CYi+OfbYxr4n
	XibSaA1E2A9GfEAuM3LDOYYrTA8TYIIHWirVbiLz3LR81VNEQ/ik2a2zWCstPufrpK37lRqO+Dx4r
	wSLTK2OpC9l/LRSnU3oj8hkY/EwISdaDFarLFO1YzpPaqlFppIGJe5ol1VezpWJvzvFOdJJzcxLUZ
	wAd/btDHROu9sNCs293BYFbYGd1sixzIXzRtGKjsKfn8EUft5YwWUBDHJCeY9uxPOr6tSGn7Aq1VB
	3hLIw7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtA9-00000002ESw-2kUK;
	Tue, 26 May 2026 14:53:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtA6-00000002ERM-3ej6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:53:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d734223e4so6774583f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 07:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779807221; x=1780412021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW3FGEMYl3HtrO5py8lQ+JYd7M0lWOH5Fx7/bpcIlXg=;
        b=mIr28wtH942l5EpO9DeXJGuzYkpNInMUYxbYGla/0IkQF7VaOJ4boR8Kh2ir/c+eJb
         oeigQ18G8zseprfiOuldT578xZlPD/doUorkSFgPPXZ68Sxksg3qLDEDgispKxf0hjd5
         pWoq5M/NH8SRniUYYk2xp+Av3PSZpiTh4fh9v7LGk9KlYI7V4ryhUoU8VZZeh0mjjoql
         vRCMMOTGgpWIoXCa9rPxyHYiy0OYEKSgDuL3bCTigp5eV2Fj1SzYyJEZsdlo4nyK8GPN
         B+kfiOdPlgZKnXM1ky1xDxmhhl8/loFtM1s0PTxrkUnZYYhTe6giwrtBT6nF5zi26w8e
         Njyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807221; x=1780412021;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VW3FGEMYl3HtrO5py8lQ+JYd7M0lWOH5Fx7/bpcIlXg=;
        b=rVAeZsll9+friW6Hh3HZUSMAbyLzjOCtlII6BmVsDtwtonTZToqJ/VXu2yDms+mThc
         fjs8Avzk/Y6B+7yt5LmDEdY4j+1OfchMyPjwTVFgyISJLd+jIdzPYt/JYA2wYtFoyKe5
         6LpfAipnRfPcRdwi889AVl0xKcg0mfvPE/gLKUHVABTUXZ765F9FCSqr6ji10ZB6yQzV
         CziHM17jS+7l1IAHEh/gX1QISc5SvXmDQ8EAjjfkfQ5i6JvBygt9BNipTt9CVbb8kixi
         5LnwLOcTA87mDrjeMjlVA/2ffKhdtn65pXMSLpW9slkl+k7aRq+41Pv/RVabizMJudNz
         Wbmg==
X-Forwarded-Encrypted: i=1; AFNElJ/n4gbxsNpx2nNN1b/2YSz+cqNtgY9QM73NnVJWYiJ4fR/Sfo9gvxZ7Okes4rE6FFXuCu/jooh60lNYQN2rqL/t@lists.infradead.org
X-Gm-Message-State: AOJu0YyF+tFUhjxGMKUHPhFHhd4yMQntWRoXAgTfjOAKCykojp6TLptb
	vGJwugruSEx5Pni4arrO8GuImirjX11tzNCKLbO5Jm4CSTHZAKgHcZCR/AaWOea9FMM=
X-Gm-Gg: Acq92OEBEmzhIZLl2fkrYn/JpzZauNIBpyBC14fEMne6Bm/l8MQ6Viwosnf4hMzkYlP
	gjuPdj4C9W1F/myGC0ieSdqxS8FVL6QbbTDbU/ABr8fMmr3DOL61WgPk03lfySu416RCym3/0i1
	no/SIPFjYhKXOHDyVBNOX/xrKy2jFYkBFMzXZNku4tS7lGnOH6Voftt9hjIHXoe92m7EwAkyEut
	MC+LhvGnaKVTdbpmd8sn/5/qR7EYKxabJliu45wXDb/QM08qDtZ/pCCnGWiN5aFX4swTU8OEnxD
	e4MnKzVRqrMylrDVGuunYXNlUKjK/zl+AZWV7XlN1mVu0s134w54oVO/knDv+WxP1660c0L8L3p
	CCXI0mwMCpltvkakr9Ylrkl8AUCZLv2CSMRgtvdoryMKvxaTI10MdtUBAbj+dekDrPv0GwnbTpl
	ZKkDnPg1TfU4I1aLUBkAEzeYsGcLuQpq8dNS/6c8GuWcnH
X-Received: by 2002:a05:6000:258a:b0:45e:6a3e:1ddb with SMTP id ffacd0b85a97d-45ea3128db3mr35001389f8f.1.1779807220786;
        Tue, 26 May 2026 07:53:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d49132sm36278884f8f.24.2026.05.26.07.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:53:40 -0700 (PDT)
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
Message-Id: <177980721984.3070642.16547338359984019493.b4-ty@b4>
Date: Tue, 26 May 2026 16:53:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_075342_928072_F82A56C6 
X-CRM114-Status: UNSURE (   9.14  )
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

[04/11] dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and RVT101HVLNWC00
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3c3c5fb9b36836d279ebe370189d68a0a3387362

-- 
Neil


