Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D217BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzRkQFsbsZb3prYdm8IYnpC6IOEvvGL2fTo7OIg3jSI=; b=PkLp0oZO2mm6vPbwkM/4Q0ZBvU
	PeOHpKhBHW2aGkQwCCHdJX9VnoWHEsLOAH7XAr+dBPO4QGThGeQ2RgDFdGaWA8A5CyRdG8Qn4I9XK
	GwwMo7lZoPymvhFZW9k0kkpq2vsHQx7UysRTolm+TwkcrIU9q25PkVE9cEDu/z8STrcEsXTWcsq7w
	xElbGQlq6lqQWs/+/6Ns7Qoa3zURcljGdsApvEQehjs5ypkhlJV8QkQDH/okhJZjBO642NJ9u21K1
	54Ivhzi3ElRZgDuuCWOTNJb6nOokSp0F2Yiv2AmYLf3lKDivMJckvM4Pwig/ttLiMYbdzEXpU8wN4
	LhnH/2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX1o-00000008moN-46V3;
	Wed, 08 Jan 2025 14:27:24 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX0a-00000008mfR-3WJT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 14:26:09 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5401c52000fso16663811e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 06:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736346366; x=1736951166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzRkQFsbsZb3prYdm8IYnpC6IOEvvGL2fTo7OIg3jSI=;
        b=Mimn76ROVP1+KTclfsWan3pcx7q7RdNzMOIBXPzhdOGdNWZiuuSWAx6RmGVUEFrCKD
         LkTM2SEt18B8zuEvJrPtPQdfMigjgSX6SkOEwdAuVjrOaTkLjuIGt89Yf7H4bLJVso/K
         HcUal+UP/Nz2vTkuSzlZwDmJFNkVwpi0Efkjn5i2//l6NhWh0iRkD5kCcLyJ+dDMuTRc
         9z8DbidtAezhLqQG8ELgcEgjt/V7vh4TUpQkdKxrMNUBBGBCm7I7qCP4q+SsbdY/ZudJ
         G9tGWZKIsbJn/LNFes2b8h5eBChr6fGZkdLXxM6UR8b53p9p5/1Y3eCurhinPRdDGphF
         E2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346366; x=1736951166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzRkQFsbsZb3prYdm8IYnpC6IOEvvGL2fTo7OIg3jSI=;
        b=THIujwrk6in/5W5mLUDcesTjTwkWRxyFzx5O2493DO6RN1ZkT0CQesBdx2mCZbArCZ
         +v3eIsbj026E//wSQj2PI4pk3RmKKg98cKv5xMnmCYa2VMt3KywqvnxMPkgLJDY+KKr5
         HTlz3Pqoe9gAatYDeZXHDrZscGZXhhC4x1S2F6jX+Cg4GOfF9yN1/A/DOQSaGvqweCnI
         +6kX++DWFAPWnx+2Hgsm7ttsEH6yD5BiSKO5LBSYmeTQn6EAFnSYT+WaAjy9UGkF9hg1
         FskpgFMlQ3EvKlorf3O8lczRrltAaU+UqEvCHt71ocdCOeGr18TBhTZpYA3fy1FDohN5
         nrpg==
X-Forwarded-Encrypted: i=1; AJvYcCV5nGUMDIvBQYaE8FDCanMeYcl/lKtyhO7O7oxZJkTkEJHpVqUusfSqO8Bt3x0nVXWIIvUbauub0d4iQSpHicuu@lists.infradead.org
X-Gm-Message-State: AOJu0YzkxEIZMvFyk2GXn2/wy9KP3kWSgfeSLqO+DkEWOkYjIxwSnhnZ
	LDu1SsBiInCFloA8BR9CDXzG9RlWq5uE1ue86twTbOE064XyASB6Hlrr1AZ53c4COFpu8a9bdY+
	viC0iBwf38Qz6lA9ovSPXSxUkZes=
X-Gm-Gg: ASbGncsOiAEzgp92umKeSoAoNtVpvVL+UQlFPC1DL6rVpatQXOwqOWmwSzZuXGkTUpy
	0CJMrUGU/vk9ooVTwaSbBQ25vrGHYWEoe/YltBIEfwoQjMuoUzJcTj/KDlqLY+T6DqDGT2w==
X-Google-Smtp-Source: AGHT+IGS3A8h0Q/PUkaHrm1SeFvYbUscGOt6bkTAr2NyzolQMBSyfrUMesJ48vgLAB/IZNBnRthccsMB5/EPlNVzUcc=
X-Received: by 2002:a05:6512:1150:b0:542:2166:44cb with SMTP id
 2adb3069b0e04-54284815b35mr845905e87.35.1736346365946; Wed, 08 Jan 2025
 06:26:05 -0800 (PST)
MIME-Version: 1.0
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-3-alexander.stein@ew.tq-group.com> <173629198495.2036683.9877314471091548361.robh@kernel.org>
In-Reply-To: <173629198495.2036683.9877314471091548361.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 8 Jan 2025 11:25:54 -0300
X-Gm-Features: AbW1kvYHWbk5Czj-Ab9dHoICLA67HONxWPXgJEt2PMFBPH7OeOl5M6o3MpfGq30
Message-ID: <CAOMZO5DeGn1_i60r7Km40D13f+B+bTk8DndNEJVq4h6HZnnpYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: samsung,mipi-dsim: Add imx7d specific compatible
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev, 
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_062608_878566_6F1BB5BD 
X-CRM114-Status: UNSURE (   8.24  )
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

On Tue, Jan 7, 2025 at 8:21=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> Fabio is clearly confused, and I prefer this patch over his. As
> it is probably past the drm-misc cutoff, I applied it to DT tree.

You are right. I am sorry for the confusion.

