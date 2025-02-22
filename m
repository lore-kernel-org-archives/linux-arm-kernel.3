Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55661C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHlH9GRTTu/x712yX9JTl9QV/kQ/7As/47pnB+L0hd4=; b=nR5kMqgw+xUpRbfOoEGn3Kyv2O
	kP0PH7YEAYVQiKmldJgNb0U5QCwSUzOXoVMzxfBySJ5cKiwcmE3TgGYCkLeS81ZDEu86N68jzqOyb
	35B/C1umKGEl51AfgSm/GHgxEvCXQD7mO9eC8qM+nUip+sYgWIPPMkvP/n2YGVZ7Cxe/fJ0nccOXr
	VRwWVNYmA0xO/GKqelonSR9+btkERXX8Rp540egEhaqpL9I4PzGfbIAp94Lr8QCtNg8W/S9T5FUWW
	dahzXHiSoCYsRrDnqetgJyM+RQzJv10pr4CvtC1OBT3ga64JhVEm3oqiQQoTLp8eDAIJdK4jpslnZ
	SvUX7Ptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllx2-00000007kGO-0cUD;
	Sat, 22 Feb 2025 09:37:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tllvN-00000007k61-270H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:35:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso29015655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 01:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740216952; x=1740821752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHlH9GRTTu/x712yX9JTl9QV/kQ/7As/47pnB+L0hd4=;
        b=ELoZzACps327kt8kJipO5bAcu1fvmBO8yCdfthtJ6bZjRfHdKWEChGV3FA5UAecOyZ
         lCDbABBgHBecJzPH8MLfnOENcEWsgw3bTg/Zthiv+cKj1bhZ8rvmRA7TymHKg0R1yGgS
         b70q/q1yksGxMNtkFb66pR4UdPUBv7sRYeyBvu1pVdB7FWmpw9gqQOorUvNkbqUT8Tgj
         93JrivmeaLffSQvNwwXoy01ne3ZoScENgV/jmJ6VJ2kGbB/f0gmkE4ceRAdJNwOdrsI2
         cqtgmgyDTLy/BbLpJdG8O4c3YiQhIDwh77XW9iT+uHCgr8On8FvZxUAI8hzAqPFZIJC7
         x1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740216952; x=1740821752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHlH9GRTTu/x712yX9JTl9QV/kQ/7As/47pnB+L0hd4=;
        b=bHngvoxli8hAai1Nmm2Nd97EnRgwBF4pLc/bkBYwAq3vDN9yU/P6C81zU3CwsMHE0c
         VLGIBdQHPfvBDSavclx4m+itF2jGh/8zbY8GgzIq6+IW/BIZ6wD1u2ehtPm6RwbKDYqQ
         Uo/Cw8ZcZFLWnvFfJB5C32o4nbYJ+nF/PynngZrvDTqcE/Xxmmiw+a7LlFC9bsklfxh/
         xlIMZXopUh45TJ7TRCPQOiTnN855i3KN0NI1uL4SlzwSD/vdQShsmUePOM4YeioSyvZv
         ReDeS33dolRM1tSp3AGEYNp3JmNEfQqr8f444MrjXm2nvUApDvuIiHnaGz2a3zYY8Vwf
         m4Zw==
X-Forwarded-Encrypted: i=1; AJvYcCX1I8Hu4p9wkaCqHQgv+jBe/b4rXAFpbd2nc/6+81TH7zH23GumnLbwA+J2nWpKvE3817gVBQUoMof/kcqvGL77@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ17OLsMFz2AkfPmPxaMR3pJBX/JXUzJ8+01cHAT+RS+9lsNbt
	8F02ci3zLT23x8VuoWrQYoW2RZnHjDEv/AWt2lXDKEh7V9qipRt6
X-Gm-Gg: ASbGnctlBxhY+L5/+rw1gzIv8JjKPP6AOSTUMOEeXfPHIYqUbL9FC1x2P5gFdOHflHV
	t6h4hrVxzlCqtwCKi6OD3Kc7kQBr2RbQ8m4YskXOoVtGPOlJQ/7xAu35T+GmXzvCV8jFifGwxda
	SrmzlnfcdwaGlpe3g8haEVS2+5GPQYWjAv8PXVyHP8nLzn6TMEwqoItR/d2m+G2bKr/1YGkHJk8
	vo8MT05dSlxh2vIsHGNcU3xUOprMz99NDenuQVSGTHhHsBGdQzmV07cKBWckUG7I5PNw/dzykaJ
	gCyFAM/fS8IqRC/8HgGJBqJEDwwlFFFbjxMk+lZfNwCb7gl7L53DbVZekspbSQYmvj+983RAlQt
	v8Q==
X-Google-Smtp-Source: AGHT+IF/vk0QCfHjxCD3xQN2FAZ8znHgGm0G7SYedRPknv6M80yqxBaJ4GKJcXeQpUbJdA5Bq/HgXw==
X-Received: by 2002:a05:600c:3c86:b0:439:9b80:ca6f with SMTP id 5b1f17b1804b1-439ae1d7272mr66049675e9.5.1740216951812;
        Sat, 22 Feb 2025 01:35:51 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccdccsm25767979f8f.24.2025.02.22.01.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:35:51 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH 1/8] bus: sun50i: add DE33 compatible string to the DE2 bus driver
Date: Sat, 22 Feb 2025 10:35:49 +0100
Message-ID: <9408152.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20250216092827.15444-2-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_013553_541610_D7C29BD2 
X-CRM114-Status: GOOD (  16.18  )
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

Dne nedelja, 16. februar 2025 ob 10:27:08 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> The Allwinner H616 series includes a newer display engine (DE33). Add a
> compatible string to the existing bus driver.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  drivers/bus/sun50i-de2.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
> index dfe588179acab..47c87d51a603b 100644
> --- a/drivers/bus/sun50i-de2.c
> +++ b/drivers/bus/sun50i-de2.c
> @@ -31,6 +31,7 @@ static void sun50i_de2_bus_remove(struct platform_devic=
e *pdev)
> =20
>  static const struct of_device_id sun50i_de2_bus_of_match[] =3D {
>  	{ .compatible =3D "allwinner,sun50i-a64-de2", },
> +	{ .compatible =3D "allwinner,sun50i-h616-de33", },

Since there is no functionality change, just go with h616 compatible with a=
64
fallback. No need to change the driver.

Best regards,
Jernej

>  	{ /* sentinel */ }
>  };
> =20
>=20





