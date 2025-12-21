Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57560E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=; b=cPQCuZRDJ6Jsnwe78J9U8Luy7C
	BBUTKEg0XfX5WG9sjE8KmmMB475AUSAPXYZuTdLf8N5Ro/B2bB0Ea88/lsroXXyNk4PEDi2K0LxW3
	+HGR70RdcPNB2zoQnxRFx9Lk8IMYsd5vpZa+Lq7kogivIBQoSG+O9/0kziGa38I18g0NfKQxBZTlK
	q7sT5juNIrdPN4qIifCafm43luDLWt6AR4f7BOM81KVrMDRI3vIj1QDzEyKtaaxyvGodQ1qKrQI7J
	ezGJw0supChYK2Hx9+z8OOWK0zsVKhXlIXZDMBd5a+7vvyMmwHqoiCFzUO3IUS/gN/wi5r9jjzWUL
	eK/6U6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRK3-0000000CnXY-0xjD;
	Sun, 21 Dec 2025 21:50:39 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRK0-0000000CnWm-4C37
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 21:50:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso35881415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 13:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353836; x=1766958636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=R8diVP2UnJvaJRud5OWcUmknmUFQ5bXSpp/FJ9NbimiaLORYKy85A6YpMQgwBFnmeu
         GaWQiWpjpm9taiLT+wbC9csKmDGICYU+R9mZ6pjD7Fc6xsNkBMW1rN2KFCrsJxZOPVTE
         6InrPqROscqqorM4spjtLRhg2MDteooFJlgqJ4Xyr6QVJlWvDZs0ekTXHsDpg1eGA3Sg
         iNFSUKxlSXU4SMy1NV9Ge5FOF3oMZp/PMEaIpZaKtxr5iGHVrlJtOTQ6YE73B902y5yn
         3x0IQnAOoUHsH+TNDGWuLAdLqUDTLkjLT+tJEiPB0Tu47Kq816JFnvJ8WbV+t9ZlAWwR
         K7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353836; x=1766958636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=lwqU9vbxcbB0fpvqsxh/gwfNEEUITVtZFOkYhTOhufkTAloFD1VtcgDBEz3tH28RB3
         0rWbeOsRB2SH2iQ4IsmxcuQcXfc9qXFnErkncY9H1Kr5WUOjI4B70BG2C40763Q4uEZY
         Jyfb/MFgbYbKUgPLF39w+4tMpIjTfYCPKQ7EEzw9xgFHtXkfFxd+4sMFJRQ6vfTBPDzM
         mbonqfyholBmLXuVPulQlKG8AbUpwBd3lOUvzEwrT70mILMdJkd5GZJojEtB60JEQoc5
         FiPVq4QodDzTEZbAFUftC6StFSuivoZ3xTPJG59aznzpBPUuC21QqGZXyXHB2au1Ejuk
         sXnw==
X-Forwarded-Encrypted: i=1; AJvYcCXYIZPbclsCj4XGZoayjtWX06r7+mtCyzHFvWd3Y80zFgwTw+8UCDw7XhIE810N2wEaI5ZaTsNgBvXcJZoHxf1x@lists.infradead.org
X-Gm-Message-State: AOJu0YwMT8taBGWUvOZmY/hzC0Ww4ejAjH2Qax2BEBFmuirMEbTv8xaN
	as3mNzmd/61lBV5PPbnSHcy12iz/VFRIa7dDApqLeXvZFLofZSdSsR2uUsymfE4Zews9ZU1HYuP
	uyewH8DTjA8KAiWH9WEf6kTZsTkacsX8=
X-Gm-Gg: AY/fxX7ktiNPTCcGmmST4uHhewy4Xs+tWwlU1fTW5WhNISKWeU7Dz0s96lSrHYbgt8e
	AXuEpvTUGb7F+bGaemUTd1zyncyL4tsAV+OER7RRurmxQYZO+IvNaFXPTIEbkiWobE0GIYyL3GN
	Q1Zblv6BuZfzmtVo8neltfvvAdUkrQ8X1YukRSBIWU0cIJYk/2i13Qu7VX0FFn7kxFeWzuQVJaI
	D6jXeXATW2SzANxNBu8sDrWTdX4pOnYCZW+T12D+ZbpQRITc4ZdZoiCTxRCX6K5+7GuRuffjphd
	Xzkmgk4yKc9nexeN7Q9DN0x0oowv
X-Google-Smtp-Source: AGHT+IGw0n+Vw3mSNWIuK6jiR5TwNM1Orq2NMptHhH0WFtIprggK0653bvytXvjKFmmgd9+xofkm/n3sIE9SOEugciA=
X-Received: by 2002:a17:903:b83:b0:2a1:388d:8ef3 with SMTP id
 d9443c01a7336-2a2f222bc6amr92154845ad.18.1766353835637; Sun, 21 Dec 2025
 13:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:50:23 +0100
X-Gm-Features: AQt7F2repQdtBoV8d-ez3LVKkRTtOC5SATWZ81V_d9C-sFP5czyoEjd7MirbIfc
Message-ID: <CAFBinCDt=9H1ccXatr8JYA=atG+vDCBX9x0xor9kibUfo1NKpA@mail.gmail.com>
Subject: Re: [PATCH v3 10/22] drm/meson: encoder_cvbs: get/put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_135037_043521_69BB56B6 
X-CRM114-Status: UNSURE (   9.03  )
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

On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

