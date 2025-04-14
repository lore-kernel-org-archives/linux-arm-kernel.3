Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BECC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kLS/6RXQ66h4Cm91JvQtjGIa3JCgrOEQRFQVcgiCPw=; b=zy8Oa7afW9BgO7ACj3fnV0ku9D
	8WGsoZHiYyl6D6ChnKej4Hy73ZpvLTXWaKwk18vm0FDQYq+q2ikDZ1g6E0dUWfB9wjf0MULZs1YTA
	B6rg7qoNPIeXXncXU6znTTgU3f59D54qKH7aVgHid7oXquMlleYINGmCO+hJRjftQmSIxWE/WhlV5
	x7TrPHVHdQ+YPYJCPAHixIdlPMFEMzp2v2YjogaysBDpCJaaDlHD86aUoevr4OD2Xep4cLGhlbMTD
	GsuKEH6/e5RkYSaF85sb00yUuT1pigJOxGINMieNxmK32xPuyUAaY9UklyCoa3rWTuRTCfCa4VQR+
	0cpoo9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Le5-00000002bpj-35nQ;
	Mon, 14 Apr 2025 15:22:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LIJ-00000002WmJ-1P7M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 15:00:20 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2254e0b4b79so59756385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 08:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642818; x=1745247618; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5kLS/6RXQ66h4Cm91JvQtjGIa3JCgrOEQRFQVcgiCPw=;
        b=Yz/+qTZCN4sbE7/kShtUmt4RcyZbD3/HjWoToEZlKqmtDhPb7FtyWvC+Z48/75UYHt
         FI/zFLoM/D3UxGZ9jiJfB0Yw6sHo2Be8s5wJtFzow8ky25+nk5w1SCejgygXvgRTy3XD
         MJsGuNXrpu4FGJsorrv+T3EZWvns8Z9W0SAHRUK28CZE9iIbJYdU+yAUmAOPAKSnCiyw
         N6txTwYKpkJaLhDRoLBzi2xFfwhuEnm596gOGHz5M13lteHq0AKmgqQbxbOgIAl3EILW
         p9+GH/FvxmlqLjoPwrwp+hbD2ynSglkOeFckqN7VCk/vYT5252VxihQtNZtMepdH65QR
         qnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642818; x=1745247618;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kLS/6RXQ66h4Cm91JvQtjGIa3JCgrOEQRFQVcgiCPw=;
        b=mCWOuo36Y5LKqFFX7ApgFDN+G7nzsjXQHcSWFgfp2USwmrMyf5Ti/54uMfW82PGADH
         OVSDON6uHDajcuzanfAD1QHcefmU/0W2E7Moc52CpmKOrIcwX2koOtImqoJMTQ8pwnjH
         JhgG3ojrkhcstMSnx0WAwbOK6q156rv2K8Xh4AyWieDUl/UPN0YhcBAX3TAqIF4Fq+8J
         SlDG+kBysQntv5gIz6LcQW+42ba3XJR8jHv08H7B0miFGsFO1A4e8yGQB2RFzHARP33s
         HqEYKpkQuQWkTWPAIM3PglOLgfixmowVJ1600B07ANiCZcjYWK5Qk4+VpDsVLHRvtbCO
         UYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2PtAjyPV04ewNZ5rjNCkWKjUBxsQVbMB36SoumKRbRZosG7X2aFX//KLqZsWKlpTWaPcqbK0kgyyxAbvwNWPX@lists.infradead.org
X-Gm-Message-State: AOJu0YxInA3nOWsPfrmoMP3iMF0FTsFzxFJBXlLwQTYKZsRDOySteI4k
	RUyc1UkEqVw3svjldm2l9QVZ70Ps33upIoHsvkGLM0cZl2cs88h8
X-Gm-Gg: ASbGncu52VsId/ZRKz5fvigZjqEeuwlIvjwZOHjbbAawHXDVkCifgAY/Y4o5T1DTxO4
	moxwc6MPx+RsvXqJr0qM5dfzYI7N1WnaR6Hnjt2KaAmAUyixiHBbugVFRBxV+s9Aw++lWa4dpbt
	GvymJ4db9vXrc5wKELIFh6PyAIEihdTVxOoqCyzdgPo4BYRmrlVxf1iSXTsQYhWPyDFYHSjV43s
	Ab3rvkN3IgszW4FBNXfo4E2agrlYPTElTyUQBt5aoQizoaRWdpO6MSireWxsApRruYdglor3da8
	12qbL8rZ947WULZ3luq3ePEQENlVrgoWyr1QFhXu1i+4rudVxGeo975qixQo32hcCFuDQe03XHA
	ZUPdnSG7i+F9zkw==
X-Google-Smtp-Source: AGHT+IHqBXbTHQD4lPtB456t+zFykKlRJiHynnOhc3Db4nt5B88XORp2NkZCBZwkWo8idEIhJzlAEQ==
X-Received: by 2002:a17:902:d4c2:b0:223:2aab:4626 with SMTP id d9443c01a7336-22bea4952cdmr166451955ad.11.1744642817775;
        Mon, 14 Apr 2025 08:00:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b6508esm99898635ad.52.2025.04.14.08.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:00:17 -0700 (PDT)
Message-ID: <91a0f271-3261-43bd-acb6-81a404ba0e1c@roeck-us.net>
Date: Mon, 14 Apr 2025 08:00:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document
 imx8qm
To: Thomas Richard <thomas.richard@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
 <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_080019_403485_6F98695D 
X-CRM114-Status: GOOD (  12.36  )
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

On 4/14/25 07:57, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> index 8b7aa922249b..1d9f15ec6657 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> @@ -20,6 +20,7 @@ properties:
>       items:
>         - enum:
>             - fsl,imx8dxl-sc-wdt
> +          - fsl,imx8qm-sc-wdt
>             - fsl,imx8qxp-sc-wdt
>         - const: fsl,imx-sc-wdt
>   
> 


