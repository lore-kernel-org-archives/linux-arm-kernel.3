Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A27C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 16:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8auBAsWmzOyx9AlQEKXQW3lYZT3R7zY1mzxA5CFuTA=; b=1Rbx6UsINYSK5Y
	ZFmxMufc57LebWnFVyj+dqF+s3jxKDxAX94UoI46KMSh29+1euuh054kqolTsvHOYgYI3zT1BkSpT
	ilu5FDs0Oji/wVXEAlTNuNh6t3HQlI80vBKSFpw6dG2OL9znv2Gk1LH0TJ4OHp9/LCIW6bMjo+6PD
	AwRVnrIqszqchDv8aUgrGdlCtrDlJJtv/wZkrQWtC5TMG9ARpb6Hxqjx05R2YjJNfXNQVivtH28Ip
	j+7ZLjh/Y0RGJzGKh0WPZ/nZWU2i18b9pQto8NplAZTxXn+rS7670l2cypGYwjy/vU8WMaMk+Edo5
	8oz30YR8ykcHDvDcWb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGhG9-00000007JLc-3MRI;
	Sun, 18 May 2025 16:53:09 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGh9i-00000007IrL-0q8E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 16:46:31 +0000
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85e73562577so403205439f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586784; x=1748191584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8auBAsWmzOyx9AlQEKXQW3lYZT3R7zY1mzxA5CFuTA=;
        b=gXXuZMPrDUMILgz5mD5TnrTL5U0YJ/pcs7V7sMJtW/RsImZVM75rCbGMSxJa3sFI3T
         LbUh7ByzBGmiSTiCdA1FkwXGvr0eVDMahxggPB6oHicMBl9C0yeam6jSnx+1YqqO2K5+
         CwsDRSEvzXOmz4CeyVix/pd49XKpjH7udVJ/9Vkz4uCL1m94AIe4L+AeBMam+8Mfbzhw
         +9oLoj0OBSOQBU0Z+b6aI+OfAnhFKmueCoWlz3OMyv/4Fa0Ijtcuy2C+vqsgXmYF90cF
         S3/+WoUVVlzJNxcUKsGQIiB2oKd0NTFvqTUo4T36iFk3x56yB4H6WsjF7bArdWnkS+g8
         LJKw==
X-Forwarded-Encrypted: i=1; AJvYcCW5taacvW/FioWPnTlDYmsjBDsmVHvY7D56Cn5I5Atgw2eZGW9aLvRWDXDD+SyIVwc9UW4ZcKxYBGMLu0onqIzp@lists.infradead.org
X-Gm-Message-State: AOJu0Yymjgyp9dPpVghSOeXfw6pnYDplGLwvfWkUCFSGXrZtKvl+pGVr
	aATtkumk3r8CHGqHNdw8urNowLLdpnuiQ5+Ue5T7YmFE96XwahgJJene5EaKLkasLxk=
X-Gm-Gg: ASbGncsHV0A3f3UrnIM8J6+o9zKWTQOvSlz3FkkhDsAW0OI50AnFWEd/IUrfrrmxz/J
	r6eFlt64bIllkGrA10Nb9ib6C+34UIN8JqGXgIdAD0NwtpsiJSL1FlIOmaMvIUqBbOIs07zKmys
	UsTY/5tJ19EfsRA2xDQCzspDBKkH0ycA3cKKpJtL8I8n8VFW4rShuJukQ7Z+YBP3sKZBYuQhm27
	zXcc+VKCq5yhH3Igm6sz4nRNe/DbjaoLqUPv0VMuX5wnTOVohMP7miWSF/AaFYzZnEBvptPk5cn
	S9TUlw3urfEOiLQ9nGbr/vz9gku8k+cMi47UCoXsF3cShqv/23EjvqQgrwoLE7I2BtLODxZD/RG
	mKoGrajtq
X-Google-Smtp-Source: AGHT+IHejHotF+XlB/M+SKekNtKRHVrhhZ0PMwZbymV6QzwfcVlSK6tSLdixYuFcKcXx3FfSHFP/FQ==
X-Received: by 2002:a05:6602:3a81:b0:867:3889:45e2 with SMTP id ca18e2360f4ac-86a2322a6cfmr1191105739f.10.1747586784160;
        Sun, 18 May 2025 09:46:24 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a2372cc53sm135209939f.44.2025.05.18.09.46.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:46:23 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dc6f6530c5so1220025ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:46:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUf2wCuc1c5Em3Vs10GXet7pb/79LUb7XXfwfCEGU2t1FUmSR80nPTCrsYYjktr78LvojNM0WoHy25nUF4uegyO@lists.infradead.org
X-Received: by 2002:a05:6e02:3c02:b0:3d8:1dc7:ca7a with SMTP id
 e9e14a558f8ab-3db84296d9amr115461995ab.5.1747586782845; Sun, 18 May 2025
 09:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-8-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-8-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:46:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Lw9bne9Zch4kyAbWx4Zz=VPh3EJAta0M6XxdaSi-d7w@mail.gmail.com>
X-Gm-Features: AX0GCFt32y8vwGnO09UOLDY6RStkxid4HewGHZjKOLQgFiYtO_lDbLwjct7FmIQ
Message-ID: <CAGb2v66Lw9bne9Zch4kyAbWx4Zz=VPh3EJAta0M6XxdaSi-d7w@mail.gmail.com>
Subject: Re: [PATCH v11 7/8] drm: sun4i: de33: vi_scaler: add Display Engine
 3.3 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_094630_243720_BB0FF5A8 
X-CRM114-Status: GOOD (  11.55  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The vi_scaler appears to be used in preference to the ui_scaler module
> for hardware video scaling in the DE33.
>
> Enable support for this scaler.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

