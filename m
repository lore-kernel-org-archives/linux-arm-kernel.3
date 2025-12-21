Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D085E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 21:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=; b=02AvViIAhrJjikQpaHitHXctiM
	I1sFeoQcOqnIZa320z4g3F4/1rhA/aCWf//H7d/dbPi+pxrL3o9ft4XWWEbOzzhmAz8XzAE/i/VJJ
	9GQwzx3LRUU9+AS6xZACiQH97D/qIGZOzf40wVSZQhsPYttlVEd3vElCYFIrwhMD37SmeNPUNG4L/
	oi2hPp7UMKgTNC0kPzvoKtBQTZu9o+N3MxHtOlQLIVGeropqvJwch8Ib0JiZAzawOVSseN8f9K35O
	Qwhnl6+2M8kEs4qf6UMWtLAdY+toyF55Pvc/m6iqaTz8kLgUrHDqMMAv2q+/6Tacyvpp5gs+0hE6W
	TNB68DQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRLN-0000000CnpD-1mek;
	Sun, 21 Dec 2025 21:52:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRLL-0000000CnoV-0E6Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 21:52:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a099233e8dso29298485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 13:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353918; x=1766958718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
        b=VWN1XRT9pC4VMWG32lWWb1I60dFZXiyQ2aAlQCotk0/PRbnugxagLjgUPKbXH04IcD
         IGArAMyv4IKKPpUkDs4bbTJGpxFfteLbDbFvQ/F5v5G7zzezJpud9o9ZMdwnHl0e5szp
         jz+qcHLNOc0FYXXn0X2oNTR5+1UZMfP3Fa54yN6EXvcFZ5Q2uYbhEgBYSgdL6oDIIwdB
         Eiil+IfEdDjiq8OJKs1xBkDN1ZPUrQyQ0NS4qO+/Tj7O2Bz4zmE3L0a+F7O9c0IT7jm7
         Qy6GqVQL4RAxSErWlJk5RD1bO6mVebQdzwY9sLax2PIocT4cyyNGL0TylRKQUV8PBRI1
         wv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353918; x=1766958718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
        b=uf7X5Eaf/sGPDgIz+lh/m24Fk/CIgegqyEO0AGW/DfXC0xKwiec/W2D/4d2sG9YiEH
         kc7PNpQdLKN1qaF8MsSU0DuO4lG/+g4kmNfMGt4fhbTZxWwBZ8bnlLrDf7ckZOpbQKLI
         3ZZ3l19TXwTqs1n1JFMXyHoFjNWkGboPOq766YOjOs5QFapYHliR91tvIBLML2MGlebf
         LarW6ClJTRKUb0G1Vnt3SJJobXaA5Tf+OXlQGub29nFbh5058QxZlqibiqmf/kd+JREn
         UGPSC913WighijX9APKEhF5jZiPxeBwy008rln4SKSfFtjoO1A0W+ghYH+/AMhf/0YWw
         qheQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkMCWwoFI47Kep0J5/okHAvN87zGTYSeLwIA1sGRaP5CbJlCE+FVruk2NPQMpK/oihXHNJ/oNOpmcm2Eby8qFT@lists.infradead.org
X-Gm-Message-State: AOJu0YwQfLL6guioMPL4dyMIAANUy0SSzR0k2uZBNavtXUMYgQ7xYZcc
	I+7DZ4RgLbCZtQZIWZoQUZFdG4vdQMPNG5vkHudXd6mzmixNUcD8VwEJc5Yef/TQjtMxdpy1lu1
	8IE+fDhxNh74I4Ck8pMcGV4Ao6ojEMjA=
X-Gm-Gg: AY/fxX5DN+c++I1Xx6D9vwyeCfElCDBXTax4NsA5fabPP7di1n1PlQkwbzwvlNBI1Ya
	dvFzqAMI43V5AV0oYPRZZN1ZrAaDpLodVq+lkN496pZAdk8Rt2Z8mF4wmDBUOCZaZDC8H+jG+ky
	Djiq9xguJSxit8ONIXad49yeEAdCSY5jKnQr2GvRyjtF1bC6J+VXJ/dfyE7Ify5Zepz+6IjY1oL
	eP0/qmWRmqQfFipP2autxFaK1i8aKdb6tayvTvtFtvBuroDjZFU87EncgXCR9/sNqrxywKlzEky
	mfoNqFerSEvQzWNjvGNT8BC2JxQE
X-Google-Smtp-Source: AGHT+IFhVsKQ8B8hFSiqKoLGfXbsRY75c2m0MOxZCySUkGexjvaMcQL0jHgp8m1+S1WmJwyBE3X0eYB56oovc6ceHh8=
X-Received: by 2002:a17:902:ccc7:b0:2a0:9759:66fe with SMTP id
 d9443c01a7336-2a2f2735242mr95258195ad.32.1766353917909; Sun, 21 Dec 2025
 13:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:51:46 +0100
X-Gm-Features: AQt7F2rrzqrcB2CqEcsVtsm58CwTVijhfO5EKXQK9KI68D9dnI-HolBL_A2auf8
Message-ID: <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next bridge
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
X-CRM114-CacheID: sfid-20251221_135159_091384_E207DB19 
X-CRM114-Status: UNSURE (   9.74  )
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
And additionally I runtime tested this on meson-gxl-s905x-libretech-cc
where I still have HDMI output, so:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

