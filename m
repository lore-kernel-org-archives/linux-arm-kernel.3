Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E37C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 07:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvhoBaZylv5JALI+/bZ2X6Rv5t1lsNh1PTJCaRNalmI=; b=K2SYsp9zFUyT9jm3H+DoO2YcQb
	Yh9EKIsCGDTgAW/CiUIKeEHiEMItzx7wmYZlgCLHNWk7z1jfqvGqLWAIdW/HpjDQxMd5HHywe7BXV
	NgBl3u3HBRdsIKAzaSMbdvdPy7e3vTjWmI66SC/cW2G3zQFpldXEeshBTrXmMyhLdEEGlNJyorEw8
	xttr4ICkVKIqbAH16yVbcme7W+qJh3HxrVyju8/6IhGXVfJv2rNCF6KByOdBCJ3exm/5vC2Km1kMs
	0mZf7+uyM2g1PSC3JN59BDEP5Iwcjw6AgeGp+Sund+pQnWIla5EMXB1neKGpTbijyMLik+I3YZhOv
	InK6RCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ5TX-00000006f0I-2xGk;
	Sun, 25 May 2025 07:08:51 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ5Qd-00000006ekR-0PSF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 07:05:52 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-605f7d3215cso541537eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156750; x=1748761550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvhoBaZylv5JALI+/bZ2X6Rv5t1lsNh1PTJCaRNalmI=;
        b=pX5yM5mLj0/QnmMSzdJdR6NoXtwMnrxDf1yq2j0VKjGs07VoBCfgclygMw8/oM8mjP
         JEi6qoAN6SpEGZZito+j6zU06LZKdaVj7V1temARsZFyxEhS446upzgtCkTfMRyns2ON
         KZs0wZ5RTKM3+hvP1c4aBFFIGE7qiYVoaZfLe17F8bTS1b5hueIA4Ljq3zsrl+jsPvLg
         dSqCEDnSEoQbl64wZmJotf2p80Ck257ujJzarLwCCt+v9iVpWOow93d4fxF57hAB7OYN
         To/gE1q+ZkKkUvobMpMnALTOwflPTVQpWPOuz1ovor4G8SUV+5BjmMeJro2oh7nervDS
         D6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156750; x=1748761550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvhoBaZylv5JALI+/bZ2X6Rv5t1lsNh1PTJCaRNalmI=;
        b=w1YXOAxm/7006EsLjSLs6B/rVsjGp9dyGoYmeBdDjjRcI4Zx0wOqifXipe3dpOhcDV
         RFkqYJsgNRzv1s7lqnycXIWJMg69V1fV7WrmkMSS7U8EUPoW5ZOdHvmgEgnH9a3a28r3
         bC3hEOXrUBoYPOzYAtK6tSkvnc995QUMib51wyjZZ4V0LyjCQ1QIzdZ9Ys/QWMSztJa5
         4F4WX4aBm+J3/wSZIBexrX8KiSswSX2OK+w2RDVeWeQJjgo5kaobjVFeGrL22TjINgOU
         qbixJZ711EBvAlqLr3eZJ1DgTDuZ3zYt8zK8L+el4y/bVrb9ad7M5wY3GCIJTURKGbMr
         dQgw==
X-Forwarded-Encrypted: i=1; AJvYcCVxhLiT6P+PQrfK86Wm4Hf3P+uUvdiMX/uRay0cTNuwqvtZQTTbVxwHY70+PD6JypBf7Mfvqrs+yojBe02lfp7K@lists.infradead.org
X-Gm-Message-State: AOJu0YyzVhT0bwoIdfXDORg545ej1kBr9t9i2yRMBQ3M8paqeVJTnjn3
	Myf5CZEtmUe4m7G8J8DnB3Q86nDE/90X0KkVjoHXOOXAre2YS5DYmLVX9l+nDwwnNsnFTIJbQjJ
	GgKywFIZUGA5TYZe4gBuTS/s2BMuskBb+C3kVEIV+ZQ==
X-Gm-Gg: ASbGnctI1avrpUZRUxrMwylsAt8Cv3OBrUsK7AqwTVnCsme/tvAycAwdX1z6P67fNwp
	zEhU1XzjjGQ+21pBGEkC7DSH0nrbrUeSC2MHMwspbAJMvJ50HE79IKdgiC694Nuw+sasji86olv
	9SdWzrrZHedhTXEJaS4UWHGzFTW5V/Dxs0nLrSykDrYvw0oXwGof9l8JzapNP+B4zstw==
X-Google-Smtp-Source: AGHT+IGPkyRDJYTnbDg706EyGxrFrSBuZIpU6gujwRJ5t4G9MskZVR3FMKn2gTUYPOf5EomM6pt3h4XtTjZNiHOsagk=
X-Received: by 2002:a05:6820:1b1a:b0:604:5e57:80ab with SMTP id
 006d021491bc7-60b9f8ac9dbmr2898191eaf.0.1748156749921; Sun, 25 May 2025
 00:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-3-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-3-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 08:05:39 +0100
X-Gm-Features: AX0GCFuYwVDbJuGWCNZYKWJexcFUkr6L5u2qT_trsMWFdA8H8nt3PvddMdXZGPc
Message-ID: <CADrjBPq9jzuDKXE1++ds=q85eOFDfBQ2VizjE7GX9t24wMsbtQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_000551_143875_61AF19C3 
X-CRM114-Status: UNSURE (   9.61  )
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

On Sat, 24 May 2025 at 06:21, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Add the 'nvmem-reboot-mode' which is used to communicate a requested
> boot mode to the boot loader.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---
> v2:
> - add dm-verity-device-corrupted
> - update commit message slightly
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

