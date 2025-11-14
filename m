Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BD1CD98C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 00:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LXJv7wRXF9U/cick5b/LfhiRGQebQw7e2o2OTwwBSk=; b=xBJ4rQMceUoS7u6bIagLS9lwN8
	SadWH/PNkdxdVfM5Bnb0OGXae0/FfKyjKS990Eh+jcN8JCIqGMi8a7TVvVbp7SBq5SvO+dFNijnki
	BuaShqAU36Hzl7wKY+JtYTXAnU9TFf+kFacLThkJyc8cNoiuxSz3nzIAySyFilHR/O2q5fYA52L5z
	P0EV1N33e68NyB95rllNcU3woLxEnJf6wpgEcpqq6Q7SO6psearevGr5duwAAnX9XRktEB5vggO1B
	lFpCq+3+dPu0mU6HL6pjGdqPl53fRCANBiMqBnaec2VdxDFAX/5bpbj1fYLXschl8Ux1lKJvoXDet
	zB3I3hlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhvi-0000000BM0P-1vZt;
	Fri, 14 Nov 2025 00:44:46 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhvf-0000000BM00-4ATI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 00:44:45 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b556284db11so982064a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 16:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763081083; x=1763685883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5LXJv7wRXF9U/cick5b/LfhiRGQebQw7e2o2OTwwBSk=;
        b=DzUDl7I5CC54f9H4+qXnjHWPSioUUAn1wrf7t7r7LD+OV6Mz7RIkhzkQPNnNQNDn+J
         QbyqVVckQ0jSSwDvLIneP0p6ECLzCG8PJ8k36FN8LGSQVG2EgKW9y16OwKHFnmfXn4p4
         f7oCH0Evqih3E5mlYt1GVpcCPAREXtPVCLtFF4bvsoFMkPbu56wgsg4m4HrlFMzdGzoU
         UoyWp3+0gRWiLaw5XtnSIBIVucB6MyF4UJQDv2O85QEWu1j/bt6DePlkYE4g2gQUI2RX
         kNWstF3/dwm7WRmFCzp+XFQAbroyZpM6Dhi+mx0LOfoPggmu1W+uFh82Q/Cm7r7t2xoq
         LSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763081083; x=1763685883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LXJv7wRXF9U/cick5b/LfhiRGQebQw7e2o2OTwwBSk=;
        b=LzFRizPXf/oAx42uQYrvTxm8GySYAELpj4NqPWlJzUbPzZPI1ljEJOCKjLc4YybMWQ
         WNGbxCnKTZ2xvYV6iREZaxqltFWan80YBO6g3SpifMywIy9zFSRZLmwL0LTEMne8IWWF
         e/ZoYrIIud3wPkwM6oxPwiGQHLV0cmLAk/ke6sI+/FzFjc/eB/Xz163IT+D+Zi+iuw1O
         kSt3c7dj9QjJ1mwVDQLmPQJdIkdKmPgcM/IniJAjlYJIZvSWcV6wxzpnl/gcCKek5zGF
         kRfyf1bRyaP/3yW5kO0qOsNuzBlqLz6M2OqIths8vOfWD1VI8GefuJQnEPacFId3Q8Wg
         3R8w==
X-Forwarded-Encrypted: i=1; AJvYcCWgYvTE6sw5dUI42C0pHyjug33bX/ALKZHO1I1jPV0Q1JfgKlusox9PBWCuuIvSadfQ/ArxeTJa2ihqqRM+7S1H@lists.infradead.org
X-Gm-Message-State: AOJu0YwLUasR8tCXF0UtDbI7lzr/r+FzUYX9hMKw8Q9r24cS/J3JAZtT
	WMgZeNgrd0Y6skIenU3aHoDMhKGBRIGjFoQDbYhAYBRxpPFlaNn9yLqp
X-Gm-Gg: ASbGncuLOyKXvnDQSZbQxPmuEoUhVqo0c9asHr5K5bh+nnHIImZMoqTqNsQxS4UyTV8
	S7MkR+2pbNIpqAE7auU8SuJVXjtbXGvCLNhId7JuitB/wWGQ9ZzwxOZH5SQVvXee/strHP/iwLv
	3b9ugpA1p0wSgvteJRphIkeh58G5eksAF5GswMdQEwJwjg1+wp1zRxvxfwR28DxOfS5ENn2SI0L
	uW2Dma3NHN6BKhVrnG7plko4Jt5w8k69ChquPWih4i3jTem7AFBZOOirnYW78CuXEnYqclhVKgS
	H6CHU9pIYxwzGLWXySCzc7Lkg3ikpGyyfHQQFhsWxIxk155zptK6G8vWGlATZ29j1g74tKkOgek
	NeCSV/jqAgjKSKEasnshu8vJrGUsbu9TiXj8nBNGygP18Gkbz3gtxdFhz7C1JX+jy/eApHmZOHf
	U=
X-Google-Smtp-Source: AGHT+IEIKjjPhOVUqGPDpl5dOo+GAofGTEs4SPWCZYKYPUBqhOjG64m/9E3v+5NweXcdOCz4DDVv4g==
X-Received: by 2002:a05:701a:ca8c:b0:119:e569:f62b with SMTP id a92af1059eb24-11b41707c45mr465043c88.36.1763081082981;
        Thu, 13 Nov 2025 16:44:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm3672341c88.0.2025.11.13.16.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:44:42 -0800 (PST)
Date: Fri, 14 Nov 2025 08:44:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy
 mode restriction
Message-ID: <yjl3gnf2gwh327wbbwcbkxwnqy5tyhwutffovlxhcm7b4vr2xu@he4tg6bcrduu>
References: <20251114003805.494387-1-inochiama@gmail.com>
 <20251114003805.494387-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114003805.494387-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_164444_039259_775A5B36 
X-CRM114-Status: GOOD (  18.78  )
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

On Fri, Nov 14, 2025 at 08:38:03AM +0800, Inochi Amaoto wrote:
> As the ethernet controller of SG2044 and SG2042 only supports
> RGMII phy. Add phy-mode property to restrict the value.
> 
> Also, since SG2042 has internal rx delay in its mac, make
> only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> 
> Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> index ce21979a2d9a..e8d3814db0e9 100644
> --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> @@ -70,6 +70,25 @@ required:
>  
>  allOf:
>    - $ref: snps,dwmac.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sophgo,sg2042-dwmac
> +    then:
> +      properties:
> +        phy-mode:
> +          enum:

> +            - rgmii-rxid
> +            - rgmii-id

Hi, Conor,

I have restricted the phy-mode with wrong mode here, it should be
rgmii-rxid instead of rgmii-txid as the SG2042 always add rx delay
in their mac. As this is more like a mistake for me when writing
the binding, I keep you tag with the fix. If you need something
further, please let me know.

Regards,
Inochi

> +    else:
> +      properties:
> +        phy-mode:
> +          enum:
> +            - rgmii
> +            - rgmii-rxid
> +            - rgmii-txid
> +            - rgmii-id
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.51.2
> 

