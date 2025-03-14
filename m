Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3223C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbAf7RLJv6RsTwMHx91Z6PJ5PYNVMVgiR3uOKlVTE8s=; b=VfpLt39S2Vo0eIoedgWwgranJ2
	yFkiYEpm8Kyw6aqCtUCvuXsiE0Iud/q2/caMdWP7/rV5z42OHjmZ0nB/o238oDq9LwEPansDJ5ljY
	nidKZK5uqX5wFXpv3/EGLqKlfo17T/6egZm0PkdSaaxnShWiQ7psaTb/1RmPUjdSDw2mZaepvsmhD
	yHbAYJaQEJToxz0LYMKxu49MhEn/RxeLuK/rm2rtzrhQA4ykrxBuK+25n4HyCzOTWlo+oqG52kH/f
	0QDbxZsavqvWrt5wYV5euLoSB1JRjoMRGV2qBT7x5Y3rw7Yk69f+UiONNat6im9UxQgpaWbUpdmn6
	NZgsX7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7V7-0000000EfFo-3Vo4;
	Fri, 14 Mar 2025 16:03:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Rq-0000000Eecc-2EGV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:59:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso15801455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741967985; x=1742572785; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qbAf7RLJv6RsTwMHx91Z6PJ5PYNVMVgiR3uOKlVTE8s=;
        b=W4TcfgPEKVqaAWdOOMQACe1dIfwRXWHEf+Pi1qnFfve5COa6N3Ab/PlPc34R7F0sIu
         IQJlDtPSWoAgj8WyqDbIUJnDceCQ8Vo9rt9K+loTqiBCBFeybxqxSzV3X3mOqEvq61rv
         fZxoerKoKJX1TAkuXwOO/1OEAL+IOaY2kk2cI04ZsValxcAkQDkCnGF0hlA3peVbBN9x
         xrlFoX6wmhXhVZRiuqJ1rIN4inDFI+Bvpso94lo8lXIoE5UrftWdGyD31fjrIL66fvdo
         TPfwsAgX59nRiZ320oTWVrr4wcyPh4mZeyjj+ZoSmXvgaQ/r1QNfmrtFox8R1f7uUyzS
         nGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741967985; x=1742572785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbAf7RLJv6RsTwMHx91Z6PJ5PYNVMVgiR3uOKlVTE8s=;
        b=msf4/9OKSsGJTq08317fICfWxSl0NaCia9dZTEHHnlScNYoxX9/olkWHGb7JRa1qHF
         tfyo4YOGkhpEq+kqF0ZFo10qLLBzbL53a2dxEpVGcWrm3AcWwvHI20sUKuILYRIoiX1/
         MLkah+6n1jTo//ZC77bdmc0vfwuv0/1TvRWq7oTQZwGiDoP2bESOZ/g8IrzA76k5HnZ8
         KimNKVsmmj00k0wm8swiTonh/zmXNiu1TZUzWkW5LL1I/k65YZvM1MgrDzkXgCH80Lfn
         PTxuVjqWK2FTJBH2vDE4xaDtiJCGAEISxUoWr8F9VwjWfgL9kYCKMxxXSQirQd8tGvOK
         KCOg==
X-Forwarded-Encrypted: i=1; AJvYcCWkidf0jDaBKQzMAS1hgpMZA3R5wNsjR1Ep8n/YDp2NRYIwsrJK6WhRFYNi50BgqwH+0KVOLALw89LqoIWD4bVz@lists.infradead.org
X-Gm-Message-State: AOJu0YwrfOmLYJB7PrbyJVcT7ECoUFNnLmdwKQEgjG0a9Z9BbAFKRdKf
	wmn95DSg2F3XHJiL48AGc3JQ+1ylKSbDlbZrsU8VUJW8MjjRgJFFDAuEAwYmbe8=
X-Gm-Gg: ASbGncsvdTwmBhye+zBX7kI7Zklutg+l1pB98n+B2uNj2fl6pQEzB9QCWdeUD1NpKXc
	mtbjHhlV/CjVHaAm3vbdVyAemJHZpyZDhr5qLBFVCLxNWYmwX6YX6L7PqPivmqTwP+vrb9mTjNn
	jUjNCCamUC+IlaoDUXyR87BfMBG5cHqNsbiYqgArGbu5XXUp9XK+MxCMew2EAQNtC8eUNgqd0RJ
	YVKg4P745glMnz5im87tAKW5Os7B4ASWHU4GWC2p5zClt2ZO8KqFt1ZJoXaUb5SvlqRWQuTMXnt
	C2DEh9aU9VAmY8nO0me7BCuAM8+PfLU5Nkzd/1YMgbNAj58Y
X-Google-Smtp-Source: AGHT+IHxwHHx6Fb/u1dWZbQ1qTy60BcLwUz4P4SvmS/UEUbzjpP8/AFJeuPq9qAxmx2U4YpAhe3Dbw==
X-Received: by 2002:a05:600c:41d3:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43d20e467c7mr27073105e9.19.1741967985037;
        Fri, 14 Mar 2025 08:59:45 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fac7asm21846905e9.28.2025.03.14.08.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:59:44 -0700 (PDT)
Message-ID: <931e5e0b07d598912712b091d99a636b796fe19f.camel@linaro.org>
Subject: Re: [PATCH 2/2] scsi: ufs: dt-bindings: exynos: add dma-coherent
 property for gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart
 Van Assche	 <bvanassche@acm.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, 	stable@vger.kernel.org
Date: Fri, 14 Mar 2025 15:59:43 +0000
In-Reply-To: <20250314-ufs-dma-coherent-v1-2-bdf9f9be2919@linaro.org>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
	 <20250314-ufs-dma-coherent-v1-2-bdf9f9be2919@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085946_569111_398643D8 
X-CRM114-Status: GOOD (  12.05  )
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

Hi Pete,

On Fri, 2025-03-14 at 15:38 +0000, Peter Griffin wrote:
> dma-coherent property is required for gs101 as ufs-exynos enables
> sharability.
>=20
> Fixes: 438e23b61cd4 ("scsi: ufs: dt-bindings: exynos: Add gs101 compatibl=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 2 +=
+
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yam=
l b/Documentation/devicetree/bindings/ufs/samsung,exynos-
> ufs.yaml
> index 720879820f6616a30cae2db3d4d2d22e847666c4..5dbb7f6a8c354b82685c521e7=
0655e106f702a8d 100644
> --- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> @@ -96,6 +96,8 @@ allOf:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 6
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma-coherent: true
> +

This is allowed globally already in this file. Did you meant to make it 're=
quired'?

Cheers,
Andre'

> =C2=A0=C2=A0=C2=A0=C2=A0 else:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
>=20


