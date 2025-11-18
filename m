Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6982CEBF97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ODEp5g3hoBFXtgMG8yLHQj2oAfrtxXSdzqfcf/5l9M=; b=npzRwBFbUAG0einHYfy/nnhB65
	NBw1lj0kfjKyZqviKB5gVHZ3460WaIkate0LLMEp7zyaby1S1QXu3ncBxhwBi2Jy+WVlznKePJOSH
	+PlhWZrej5Oxg6IzDraQXiKoDT9amDK9FpY4WR4Vs/yx1zL6vFWDMFXjJUG51ZQmx3CQrsVQKgpcN
	cX5ubpBZL6lp1a5B+osWtx/eAFXe/TvcPFFAinzasae889dCmfF1J2ea/uqR/uYBiRib3ZZBpoGAP
	Uf3b8T9kIZPteR1pIJlqCvvra7mtHYRG3DMd+095Pj26SC70p1pYL2bRW+yUZ9ZK+gFgWejVFCQgr
	MHMOJ2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLN2r-00000000a83-1mPO;
	Tue, 18 Nov 2025 14:51:01 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLN2o-00000000a76-491J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:51:00 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-644fcafdce9so1786426a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 06:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763477457; x=1764082257; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ODEp5g3hoBFXtgMG8yLHQj2oAfrtxXSdzqfcf/5l9M=;
        b=ndhfh3AWJWDq+lspUr6U9esyr7AdUeKtEwwTegCDyAykktriuWX46N9HnWdy6Xa/Cu
         4j2H+0TxLkoG1pfeBHJMDEy87TDOy6zGGyeR5ZMB6Ilmrr07rlN2tMZPVRzYuKFZ66so
         1kVVX3FM0BYKWAzuG6jHuwz0s2WtR6c3gCXxwixCg6mMR1ZfYdyVfLEwLuRkoiAyeZgh
         0DA6kM650bP+VnxuyYTz1L+MSpNqNj4QaWkVjrjyUjwDUUIodemOnan9kU53cHR2rC+c
         q+DbM+R+y8W5aC9210yPI03jEpq6m/1mUI8AmVyE8t4XamrKwrQALtZUE1Xf4uqtbV2A
         xXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477457; x=1764082257;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ODEp5g3hoBFXtgMG8yLHQj2oAfrtxXSdzqfcf/5l9M=;
        b=kuWduoM/SSH5bo2TGTiHSb3x9nMLSLBphvjIVizYbVfOZis5OWhgj3k8DEVkohsYsU
         Rk5uwTiddA1S3NjNaegqaXwsV3n46lYu4FImd84dgY6AJKw52i/kcu2EgdBNCwRUJmd0
         sVreoObGavj2Z4h9hnlHupxpvedT2he2QTDhlkTKpuPqz7DbyTi4FeLeWVOvM+ejNBa1
         LVc8rsTxEsOJBUK9OA6cN5/j2Lc5uc1OMyUss8GyzuB2zJ7D/X180NmU7wNWi7PdMaTj
         UgvK4YRn2RamJ84mPlzuMawFI/Iqji7TmF2nVMQiokyBJW6/MuPtU80p8FH2qtZNM7+7
         UCEw==
X-Forwarded-Encrypted: i=1; AJvYcCUuj1020yt6u8/I0mNt2bp5mIZo7OntLs/qnhFArWddzPWGYdT48nDfhDabltAyGgh3LJioF+b7yUbYWq6i687w@lists.infradead.org
X-Gm-Message-State: AOJu0YwSMpOCjre7/8Y4Z33YN8vY2EjAApiLPYLxZL5P7E0bqK3sRvrY
	+UMaqggYbM05abNG8Je07dm4Ap5tR7woaFivmk01Q+4SsxgPe8ApOrZb
X-Gm-Gg: ASbGnctwZ2dSN/b9U21gyENTWw8x+f2cvcz67RaU1ow2Psh8GRWKqHKmrcX4E+t8j+/
	5UFAYHiaWt4YERIxhdNuIrPW8KFpSYTo9D602JALDN73JGTSvNY16jIO3xTBu+QDZqICIIV8jzj
	GwXjq19tHQ9oZb4MX9YQ6RMuDknwbL53djQ82m13EvXmrcRM0xrIKXBxMgDR1Lyz0oCvQi69kx4
	dK3WTbms0LzK9M9mDjy7V1ztusGXddBBvyVi2dbQcpq4A6BiJKmcn5W78TJ+zJgflj44Cd2XqdW
	Gr5hnVaY6aM0TaZz1wRpeNR3459OcFWf9h7RXshuGm1dIYRYtWybAgxgPEebJW9dDXYYPAxjqIX
	RSIega1+sWyQFufBx9wWQh2s/sFgf4mYa5i9pvRsAQJJrG2Rk4oAWjWjXl+0pR6d0+U+pOh/S77
	PvkucV7FdKN4JrMcGX/yLKF5U14Ft27xLCgTUhD0gPETdW8szINJX9ycvx+c92i0eTKZ5If0PqC
	Vw=
X-Google-Smtp-Source: AGHT+IEbPgDVza8qfJZo3JEw3mI76xfM7nycUKDaL0NKUdHMgMx7hzlIugTLL9c0WovJWHk2SHXoCA==
X-Received: by 2002:a17:907:5c9:b0:b73:5b9a:47c7 with SMTP id a640c23a62f3a-b736795d4aemr1818872166b.51.1763477456662;
        Tue, 18 Nov 2025 06:50:56 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd809absm1372003166b.44.2025.11.18.06.50.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:50:56 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
Date: Tue, 18 Nov 2025 15:50:43 +0100
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
To: ao.xu@amlogic.com
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_065059_050116_99C75E00 
X-CRM114-Status: GOOD (  14.75  )
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

Ao,

Is there any chance to get this s4 drm hdmi series for current 6.18?

(i tried backport this series to 6.18 but have some issues with reparent =
vpu_0_sel to sysclk_b_sel)
  =20


> Wiadomo=C5=9B=C4=87 napisana przez Ao Xu via B4 Relay =
<devnull+ao.xu.amlogic.com@kernel.org> w dniu 10 sty 2025, o godz. =
06:39:
>=20
> From: Ao Xu <ao.xu@amlogic.com>
>=20
> Add devicetree document for S4 HDMI controller
>=20
> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
> ---
> Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | =
1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> index =
84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40=
e08def38 100644
> --- =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> +++ =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -55,6 +55,7 @@ properties:
>           - const: amlogic,meson-gx-dw-hdmi
>       - enum:
>           - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
>=20
>   reg:
>     maxItems: 1
>=20
> --=20
> 2.43.0
>=20
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


