Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBE4CD5BA0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UjOMsFb9kbRymmKpTR/5HYw4uxQJJRFpFEQGX6ehQ0=; b=I4bl7El7airfjPZ8/N3SBa++c+
	NfXgXeAyaHn1TW9d8b1foieca2jdJRbyNu+ho9BvwHlW8hvF4PMxyDeOUI9mlzAWsHfONNDlKec8V
	/auoHpeNvw5dQZKmcmb1R5nqG8HmM40pMVEh6z30SaWzbFPeXYqNFLDZGxTw90QvElXRC/nvNT7M4
	R1k05kXN5wWQcnQlErlnmYeabBaHSeyYSshtWGsP05d+d3/SVMSTDokRp/DEBvjsElW3mzIf2eFPn
	V8jkzFRX3cZL81Ghuq1sgNy/QWwrovwWVKO0J95J0rMAU6RJTmHLHNF88iMNowtct4TsZfx1NvLst
	cuhHlKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTGY-0000000A9qX-434Q;
	Thu, 13 Nov 2025 09:05:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTGV-0000000A9pF-2asN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:05:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4710022571cso5353695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 01:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763024713; x=1763629513; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3UjOMsFb9kbRymmKpTR/5HYw4uxQJJRFpFEQGX6ehQ0=;
        b=dvePIUls0dM/URCalNEZ30/jtOJ+obglo+ILV1wderN+CTRQ3qxX4//DmFe4zg28by
         CUqS8DxJgoW1pgPZi+YGwVNpvyJfZjEpxwtQZqxugypgQJcONtJ3q5NOrTgwpTw7yN0z
         hQKEnwR0xSajGDhJMXqSTKuQYBIntBJ3xw8rdodnkShsP1G+RyaXTKuL+80zF4oogU6U
         ZwaP+UqhoBScxkgAN3hK0KHyZPYn0JFk71KpU4fVeG6z1+7bY75JwFUIfXgloT02qZt/
         BgyyyYjWQSc4xtDbnX44ofTWKfbaAbApIujfdzq2r5h8Cife1QMUioUSpykK8Xuq2DnY
         8Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763024713; x=1763629513;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UjOMsFb9kbRymmKpTR/5HYw4uxQJJRFpFEQGX6ehQ0=;
        b=Aa9CqBZm5Ed+Rydif9Y9bIliQ9gt8kQdRbtvyd6lrLY9L0W3p9AXE0x5A71CjGP8W3
         8MqwhQN7H0+kP3zsPwk+ZC58xTzBa/KSZtMOUjZtnH0UlJ4SenyXoo2Lyoi7m5u6kucy
         ldLNDlL1ba1fVpgU4nZfjqDwfokXMSiDExrHMoHr6KY/MGTMz5oGDqZk36J1CJRKkcT5
         Xj1dzitOa4gj6IyCwhLsdGSqcPVtRawUrpmqbYbs+YW1htKtlBxRShxQ9BRQ8adg0lOx
         6ZN8TsCS+CAUX062rvWGdi7obQw1AOEVsAPfBHdO9o922jWkOspjBQj3753t5BBuBSgR
         LSjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLuanwq9eEvNwHflyFeaQNIRx363TIANEL5jJJ2StF2f/RvnoKeeDIfnXIgl/XYEa2rs5Qdyd6rK3HSbNAjvSk@lists.infradead.org
X-Gm-Message-State: AOJu0YxY6QNbudtvOa8KAicMDQCLhnegvDd04gbKdqjR/CYF9ClyGZ3w
	VDNS6sRA+OcYeyabmV30t5O0xUWwGB3JOW7vvX+cU+0xSdn8DWdrkwMfwlxGpvrHo/w=
X-Gm-Gg: ASbGncuvcCDVfWfFrw5P65ZvcLrdHz5fvmhXU6HlbIEKbWm/+V6Dv1Bd/snrLQ9A+yo
	jJ5hpN1xdvjtHXs8JQ1wTGFZEt/Bso2ncoZK21439757Zs6C/1TiS8qoZG6x//cNSsWv4J6MhB2
	0iNwMYSPeR8Eyf4mTXJEXFh2CgOATbiotLB9f3LeeBVVSXRNG86mMIscP5UAHtbLV5kFf67XsYL
	OvMr62VOJxgMT6ujb8tRDefxrS6AEwHzJB1up5XxpqHopkm8vNvJWEF8woUI5IBvKutkkuMAQCP
	H0csgcQq5hA0KpZCnmCndkbUvFPnsvr1KuvWIsCNHVu9J2pVnXisCtfMPKrvPR5J035vr2PjD1P
	vdg1DZAG4RNgNsjuQW6bJuLPi/msAsOaQ1fMByz4IDowIXAwKWbnfe1DvBxJJVRKjBN1pSMkOx1
	VEdomQ
X-Google-Smtp-Source: AGHT+IEtWoaffuaVTqHh20HuWI5Dpw76dp6as3Uhkrib83c8uxD8cJiQ4F+dYLKDixdUDUaZQUzkpA==
X-Received: by 2002:a05:600c:4455:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47787071919mr61751085e9.6.1763024713192;
        Thu, 13 Nov 2025 01:05:13 -0800 (PST)
Received: from [10.1.1.59] ([212.129.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f203afsm2532796f8f.39.2025.11.13.01.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 01:05:12 -0800 (PST)
Message-ID: <27a5521cd7ddbed0e870ac416dc829722f1b36a5.camel@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: nvmem: add google,gs101-otp
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Srinivas Kandagatla	
 <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski	 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter
 Griffin	 <peter.griffin@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 13 Nov 2025 09:05:10 +0000
In-Reply-To: <20251112-gs101-otp-v2-1-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
	 <20251112-gs101-otp-v2-1-bff2eb020c95@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_010515_700591_0E07BC3D 
X-CRM114-Status: GOOD (  12.00  )
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

On Wed, 2025-11-12 at 08:29 +0000, Tudor Ambarus wrote:
> Add binding for the OTP controller found on Google GS101.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0.../bindings/nvmem/google,gs101-otp.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 56 ++++++++++++++++++++++
> =C2=A01 file changed, 56 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yam=
l b/Documentation/devicetree/bindings/nvmem/google,gs101-
> otp.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ea87216761dbab9a7a5cecd87=
a553a6a2a1783f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/google,gs101-otp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 OTP Controller
> +
> +maintainers:
> +=C2=A0 - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description: |
> +=C2=A0 OTP controller drives a NVMEM memory where system or user specifi=
c data
> +=C2=A0 can be stored. The OTP controller register space if of interest a=
s well

If there's another version:

-> if of interest
-> is of interest

In any case:

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Cheers,
Andre

