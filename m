Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01C5D6D232
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9i8cWPPpk3qhAbSDSCLeR0U+nXf0Qia9C/CB0RwOtJs=; b=3ba4qFOKMMUOn1aD0XHCsWAYHZ
	T+WMs0oVsmOBBPz7LpBehkJevmJI/DG45rPDaHXcphoQ6eKtR36E4iHg298zgxGoYjtvV9XNlNE7/
	VV0TgRVKLMMVhRuHNDOE8uq1v0EnMUt2Kv1KLKDCC+959/dcSzlMqXo2fmxRX7MqHi34crdl5TSeO
	dtYH5CQbY5VjvykOaJxwHv9MzBtV/9fAcrwz7Yg5w5mr26C0DfsLhSCTzgkPvq/Eaei0gSR73J8zm
	oKA+SC4hzpwI55fJJNTF1Q+vtERzQE8MBvirRNmloYVtqJZQb3xbotAzX90uaIzekWx1MiPyy7B7p
	MxmgDGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGjY-00000008nrW-2KYy;
	Thu, 18 Dec 2025 16:20:08 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGjV-00000008nqP-4C8T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:20:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so1232252a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766074804; x=1766679604; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9i8cWPPpk3qhAbSDSCLeR0U+nXf0Qia9C/CB0RwOtJs=;
        b=Dw6Uao2ol6QIkbIOyOJyPBlVIMkqFWGO6prLqv2EpsOPYwGonVrSBRevdK6fg2qKnG
         lz7mb5UTgQLWt6cWHTD2+3nM/GVdJAS8AO6bDR4weqK1Lujjf4V70E5SNFq+ByG0BmFH
         HzsUl8RpFVsYQuITQ7mGZjzznlZoOd4cx1VAsmzYWh/G0AfY/9TFV5+vWoDCoSp3PSkx
         gTwmLBmpd9GGNVUAeD4uMn58jn1+TVbThgHt3MBZRFo41kyVYm/LwLOECKzmLQrMEHYf
         CO8pZxsMZ6BX5Wats832s5R+3l3gjg9tJQ/0MxUvdUKTuivJC4/dRctMOUfo8MAAQgW9
         nrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766074804; x=1766679604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9i8cWPPpk3qhAbSDSCLeR0U+nXf0Qia9C/CB0RwOtJs=;
        b=EJ++RR/xRL5GesMBrCeRC1Y1egVu+IGLbRMRRlkSZkV5Ino9TjQrvy5i3Zfrk8Ppf2
         7R3m6OjOhYJQFNGe8J82/L1k6xhPzpg2nxCXNRqqYNfQOKyb/49qfcPDrQntNrW9HesS
         my8l658DKBfLLYAU0s3G/IviVf1DlbHob9XbD/OyDa0k8sWtg+9k+SY3HpLcJTVyAP5d
         kztgMtydrD3qz2L6QfGJTRMT9B1RmLs8iAOjrN9kke+vE0e4B7x3b6KxfejmbkoXQbEs
         ZKtvQlElBmQfeWP6AvgL/yWVhxesnZ6QtsmpArwXw0XCfycssMctmjikYERHY8MKC3nd
         wpzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6T3InsQQO9uP6zWXR9gCoFykPiVjPQ+sPBK6cujqjLpnNn9tgK2s9vZ5ydOZB3eqlHq2cVRVkQMPiisakgugh@lists.infradead.org
X-Gm-Message-State: AOJu0YyqZjVdyDGIp7JaKV+aJblMlnTnwzY1WjRQe+tPvoceZjCzYUdG
	aBnrgf45EX2vJWgOQP69T4SYLTPDo2QBlp16lb2B4OLZPj/mRVpBbzvd
X-Gm-Gg: AY/fxX6JRUnEAUN6jFhRIE03VRSWX4gyUaqvZacp2jUF0Gnnbo5rxI5H4fwh9BA43Ew
	2/4L2RQs7oDWsGST+S05ZYY1VCIdnlKA2JQnvkfMVnSzdjZDZD1yk4xB0bsSrftNF2rO9J+S/Iz
	N1y9H21acaLIbA2TbEgGIBTU4lktqvQ1WBfZ/wENF9odHwR7Qjc3CxzIuXh9lCvd3Z3vmHiEDYu
	tgpTCU9QeWxChAxT0lhzdJVhNdpfljQivyEZYQVBQLE0Yw7nTav5IqHr9sshsaEik9cyVLB+ErO
	aVEScBW4/o1RME/FiWkOlYtgf0sWMkfLWCvI9Y3Ut+wCBqanPzlX/3RnySl5cRsoeX6+P6dFQJe
	TmWZFmmu2dOzeG9L1cwibYmDyLVcqsbVAAgHP5opPFm3Iz/0XZkt/gYuc+0wsI8hZQCnTCIfDNi
	i4lW+APWnLDQgeo8iGcOTv4WmU0nC7dh2IefaDnyXoXQ==
X-Google-Smtp-Source: AGHT+IEK/Oq/yKYYYk/vo1yGLO9cpqS5uZ1Iib4terF5s9b5DAyEzWO01hv02K28pdINOt39Pnr/Dg==
X-Received: by 2002:a05:6402:1ed1:b0:649:815e:3fac with SMTP id 4fb4d7f45d1cf-6499b2fe480mr19443071a12.23.1766074803307;
        Thu, 18 Dec 2025 08:20:03 -0800 (PST)
Received: from [10.25.219.74] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b585d3f17sm3033124a12.8.2025.12.18.08.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:20:02 -0800 (PST)
Message-ID: <55d6fb81-5309-463e-a624-dc80f960aa24@gmail.com>
Date: Thu, 18 Dec 2025 08:20:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 FRDM board
To: Lei Xu <lei.xu@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 justin.jiang@nxp.com, qijian.guo@nxp.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20251217-127-v2-0-67cb12e56242@nxp.com>
 <20251217-127-v2-1-67cb12e56242@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20251217-127-v2-1-67cb12e56242@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_082006_057580_B169AEC9 
X-CRM114-Status: GOOD (  11.88  )
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


On 12/17/2025 9:56 PM, Lei Xu wrote:
> Introduce a new DT compatible string for the NXP i.MX95 15x15 FRDM
> development board, a compact and cost-effective platform based on
> the i.MX95 applications processor.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 68a2d5fecc43..4b6188d39be6 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1432,6 +1432,7 @@ properties:
>          items:
>            - enum:
>                - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
> +              - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
>                - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
>                - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
>            - const: fsl,imx95


Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>


