Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD5DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqET3yrln63sKOqtKsLCt9GeuSdg6kTdsyx4gEPoi98=; b=kfAl7clvJJ2A7pKFazBd26pm6F
	868CGxWUEmAAX/q96NrqzU1sF3anrwdfc4tUV8S1JgfJZ7v0J/FFRvaAO2w2atiZgdD1KiXXkqQTz
	smUuRlKjM54IvyTO8TpQgjbGt+8s0cc0Y/DBUBKZf58VXr8rYtlg30z7IpgC1n65xDeNfVZ/W/XZC
	YVjS+EUgKWCGBJrhNtA2qZ9GZY7Fta3vUJ/sTRA/4HYbrjvIbn0T4otR6YMvqg7S+MPFvCinZNRqQ
	Byb+y8Lgy1uTf1pUSuptpxzPqSHEzxgZKQF4JZLS32bD6RJtM1R6mpxW7qcrabq0g3laizPIAbAOG
	NL20k5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhwtB-00000006nSk-22lc;
	Fri, 01 Aug 2025 21:02:05 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhwqa-00000006nD7-46bD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 20:59:26 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e740a09eae0so2541529276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 13:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754081963; x=1754686763; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqET3yrln63sKOqtKsLCt9GeuSdg6kTdsyx4gEPoi98=;
        b=FrHhzabuAefaDYebEwcVpX3ZRryzT8IK6pmHS6IbOysu0tu1KpJvZoIrZpCb9+4jAQ
         7Dr65L5SIiO0U8B7OH1coMkjVAGXz1AmzLkQ4RENcLMhEN14isz//6uDJSPx8bh4p2Mp
         +ymwt6d7Z9sR5qpGfIf9XRvE2SgC7IZvpq5R7AUSEET9mvr1+qaDbPPfi8dV2Dq/JCdp
         NLMK2zSzot3Q3n1x2TE2StSfmgklXBnWbkXAH3qTf1GqjP0ZekfMLyBhYDk19YALEnUb
         v/aNiwBH4FHC2A0HM9NO3BO2wPZ8Bis113ds431MdIfbi0xlZ4Pxsl5yh9GOVrGqD2uv
         xWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754081964; x=1754686764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqET3yrln63sKOqtKsLCt9GeuSdg6kTdsyx4gEPoi98=;
        b=mYHmbVvrYdMg6tY/inQeJHjJlaMuP2EpHfTRUAirziMSbSrz3ep2oSBnyLctKwTDqe
         DbUFjCIGxkwIDJeKT7jgljqSQ+GhBIAeO18nsufliTE7ZdmMYjKw6tpnmR+gCZwW6Tms
         KV+ASQmErUd7+6g3oxd54SE5Wh/yoJoqPjX1iJIzPzgGWMs7WDeCO6aL7HhvKkmfGCIN
         s/D5Bi3qIJbDi/QfjvzWiA2SQN97ow812Ec9QoebM2/U43OupB9Jwty2jRwPNvg1mN+T
         qInLZAhOBitiVUrZ6t+EK09xVA9K6EnlEzI/zm9PLFwRDizUKLIkukePrujOcIF1xpxU
         MLug==
X-Forwarded-Encrypted: i=1; AJvYcCUpiT5gle0rEAcSRK74aIqvHhournJJcYZhWysllRDxo6BJeS7Xh50yYVYQJMppxcM3cUhewFdwL73CfDljJpXT@lists.infradead.org
X-Gm-Message-State: AOJu0YxEadetD0drGbF5fwnMMJFMA8gHwIPB4ueSmRJWfj9gAPknDT3e
	4TfgKJsxtxEEvw6SGewONrggSi2LTocZYpXt4mW+0hnz2u9vUGkZkgCS16u8dOF/A6I79rfD+As
	1Pt1fs4tDHzqLWg4qrfPKTwgcArMtF/g0Vzp80gGcpA==
X-Gm-Gg: ASbGncveYOuLDK5waHTpOoN7qVDWcCwPIBKdhJa7FcN2LQ5m0fM6S3f+X/zNe+liCtS
	1nCO247tY06jg3NogoVUIGccricnRNwXxOblcMBfiZU8Mj3yyCoBD3CT3I19MYArTqS3aauoTFq
	mieiM4VVglkrhn9G5eEwZ0k1q0Ks8fENVLIn/6fuqQ759zKZHveXIe6Sgw9U1hxamNGHJIYbpVk
	EJPyhxHjr/6GdcQ
X-Google-Smtp-Source: AGHT+IHKd1jJXv78xY/0PrFBxMZydcsWN552v7cnDSpVMcUFX+EeAaX4TfUi3JPVYyXTGczQLE+cROOwGZIJgBxNeNw=
X-Received: by 2002:a05:690c:3101:b0:71a:186:59af with SMTP id
 00721157ae682-71b7ef85224mr13019307b3.30.1754081961974; Fri, 01 Aug 2025
 13:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com> <20250730074253.1884111-2-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250730074253.1884111-2-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 15:59:11 -0500
X-Gm-Features: Ac12FXyXKS4Uf9Z3hgF_FjM8XlnTs6lt758RvGFER7GO1W1HQaOxbu8Nf1Gdh5A
Message-ID: <CAPLW+4mesdhGf-RnQ9S6m_gaxS7hgt3=WQwoO-+Be=CuNiBzxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: exynos2200: fix typo in hsi2c23 bus
 pins label
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_135925_024870_D9E958D6 
X-CRM114-Status: GOOD (  15.63  )
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

On Wed, Jul 30, 2025 at 2:43=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> The '2' in 'hsi2c23' was missed while making the device tree. Fix that so
> we can properly reference the node.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/ar=
m64/boot/dts/exynos/exynos2200-pinctrl.dtsi
> index f618ff290..5877da7ba 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
> @@ -1438,7 +1438,7 @@ i3c11_bus: i3c11-bus-pins {
>                 samsung,pin-drv =3D <EXYNOS7_PIN_DRV_LV1>;
>         };
>
> -       hsi223_bus: hsi2c23-bus-pins {
> +       hsi2c23_bus: hsi2c23-bus-pins {
>                 samsung,pins =3D "gpp11-2", "gpp11-3";
>                 samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
>                 samsung,pin-pud =3D <EXYNOS_PIN_PULL_UP>;
> --
> 2.43.0
>
>

