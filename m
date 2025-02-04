Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BD7C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwIsfd/OtVZWLJT6WB9dwos5ZOiOppzZY+Mt6fv0DyY=; b=YLA7TL1NKt/WOjwXX9z4WY6zg4
	JtToBanhPOqb65KcBzv+J391goiMZNSd+ySGiBxZO+b2ehnB3o0O415VuKHjTqsf6VEzmD2p7ZCj3
	8LbWmQiyIMJs1bo1yCLd9UpQcuCiS3UwrH4VRcd5Vkj1LnZlXGx56p3CmRDG340/K5cp2wLh495UC
	azv8P6/xQttNKjKBkOXymhSa3PQxjwaxsypfBhw51i9vLpJ9e3EI+obS9a5c2EJEbL23ojGzaghGl
	44V+pDz0h56ksYOWGleW6M8SfpKnJheaiAWgQjFyIP9bXp9MtBW3jAMIMDI9FpAdEvEhsMX6+AAdR
	Yfn/q4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfR2t-00000001fSO-40PV;
	Tue, 04 Feb 2025 22:05:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQzs-00000001f6i-3iFB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Feb 2025 22:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RwIsfd/OtVZWLJT6WB9dwos5ZOiOppzZY+Mt6fv0DyY=; b=eNqBJikdFJsAxIx/P2pzDTODXk
	Rnv3WSAfk5JraynU0VWy+kGrab+6xwm4GE6Ev02CczTPjhcC5lX4mqrg0gc37Sl4eqLqTz2N7wa1K
	Avujnbh/hyVOBdCSg+LtzS1+mtyE7eVt+lv3ydSJmMi7ivFRJ2h6mTpdgMAHvhYVp3mlLxhHUtHNA
	XHcH5uOF8zgCV0vVdXucgWOEUR3o9DcWS2spP2Pr/yDA9De6YAIGrA5NYjIsRbQF3zVS7FGbRKUHk
	t0As8jC2t1theSWY9t/VeK/COUgeHiTzkz2wfW5N47c2SJzHdkkP+guRNNG+rHHyDJNl46ZfMH/fk
	h97peTsA==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQzU-0000000GSDP-3FaU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 22:02:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso42167845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 14:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738706507; x=1739311307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RwIsfd/OtVZWLJT6WB9dwos5ZOiOppzZY+Mt6fv0DyY=;
        b=eXzCdtFcuBtElv1QbNXUVwFYXBL9gXVQY4bqTIv1FOwdV1yumcfcT42QDUBDHwoEY0
         oAvqYlH6X0AYeM9CYfB/rPf+Nx2bL1+OTxTBRm1Nq1cHOhzFoRhOmzOy4GPqMTLYukml
         MenqNabGT5nNOrTOOjAQmQkzb+gjyCn1TwIr9VYgJz9wlQJhSXo0hR7d5Xs3JjJtOhxO
         y1ozfzCT1pgguma4LeNjHNhaY9dPvhT/meGflyQ1ZVL4QQpySrkKywZyUZZg2ne4DBd4
         dJjjzooNL2OIm+KSfIG20SIm5F7wjejgxWDklM2kMWgZ9kjHRwN1cLhV0VSRlXPtzV0f
         vPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738706507; x=1739311307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwIsfd/OtVZWLJT6WB9dwos5ZOiOppzZY+Mt6fv0DyY=;
        b=X/HgXh3NMB9gDd89EkRq1oSK36VWtGfK/nl3Kha8yJVPvKkjT+IztBsRfZwozehnxQ
         JGIDxh8oeft+QsSv4X3XXCMHAmb5obpziwi2lxy/Pzumb2wVXwPoDQ+WvyYlAA060T/s
         Ivz4SFvwzuWIrWysqQgSBRxIDN0myZDVDlXEtQmtcPUlFzrJtj10srA8mAIg6lP5le02
         8AhOpruQL9DgyLOBtWZmey/GjTuXiDyR2tHmOMQLkTyC4FBqz/BAQ/MpTlI0jpax8hBu
         1pRTVdKNm3acWUnw8xwBsxYJ9j2IeqK2Om7nbQq2TAdqr/aVdxcjaZwTgMrJhHJPiGU1
         Jv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3LzKPRoWEunSddJEeWWivV44bywVwxqCumlkAGcH1/IX2JDWbk2ovSndHM9fYhB/ewxW5VFiwq0pZKyiokV+V@lists.infradead.org
X-Gm-Message-State: AOJu0YxLG3QPpn41gHfm1GCvaOdC9yvQVlY4VrK+tm9EFSHDUVPZjDhz
	zRp4JMRujTm3KbGfQaVKHGVn4SqUZHtr43s0LEY2HkJkuYJArpempK0LV2MZlG4=
X-Gm-Gg: ASbGncs4TfugL0KZ8nGtMMvNEBeBBU/tTtvXktVYSD6w4kmufYwiD1ukGslAGBlrnqY
	D+J55ZOPivngIb/AMKMshwE8LVTNJdU+PzBpBDiGrWpQrKvyirHwJ3LrRg6fz9jkyrFYvUCW8RK
	QfNhv/6cUrhMoYIQ/INSj0vlnaKutVIML84us9X0qEI/Z+NLL6FGwjXrZ/4/Sm6QoovmSPp2LA0
	H6fbOjQxzzBPGO+tdIT150g3WM3XgDNcISCODUymKtc7EfXzUOsksZor1YcgrU/67Gr1bcP40I9
	tD9XgAPRxNFu
X-Google-Smtp-Source: AGHT+IH2eC8QjzxubMrfwju/J92XZERQpRmtsPLz6Ay5DOV8VGM1F9TQnHss3+rgoHiESfKlqDj3WA==
X-Received: by 2002:a05:600c:1d0f:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-4390d56e5a6mr1234275e9.25.1738706506951;
        Tue, 04 Feb 2025 14:01:46 -0800 (PST)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec369sm16729579f8f.8.2025.02.04.14.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 14:01:46 -0800 (PST)
Message-ID: <d2f87ea5-fe54-4334-ad68-9b169b2f3774@suse.com>
Date: Tue, 4 Feb 2025 23:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: s32g399a-rdb3: Add INA231 sensor entry
 over I2C4
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
 <20250113110512.506007-4-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250113110512.506007-4-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_220202_353265_54F7AE94 
X-CRM114-Status: GOOD (  12.55  )
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



On 13/01/2025 12:05, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add INA231 current sensor for S32G399A-RDB3 boards.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> index 94f531be4017..802f543cae4a 100644
> --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> @@ -40,6 +40,14 @@ &uart1 {
>   	status = "okay";
>   };
>   
> +&i2c4 {
> +	current-sensor@40 {
> +		compatible = "ti,ina231";
> +		reg = <0x40>;
> +		shunt-resistor = <1000>;
> +	};
> +};
> +
>   &usdhc0 {
>   	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>   	pinctrl-0 = <&pinctrl_usdhc0>;


