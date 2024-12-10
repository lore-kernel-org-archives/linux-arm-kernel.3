Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA359E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03lzIWbBgrYztWCtWT8WxjDnlzcQKSOSZ3z9Gh8bKUs=; b=pDILG3zp8EhXOCFumfNjmnUxY+
	JmLO8+ekMfOU90/JfMt+lyYqnVuvM/t5iiU9MZI6/OTq5Kya6c9pS+haRLn9qPzRI2Iz0H/z42O5Z
	t13XQZr+Ysd7I+1TBaCozjV2M1kFdD+wb09xHWQ9N/doSBb7tHv04mq1mPzakwIiqA4RZ1MOTL7gZ
	BPXfjXR9PdNj6LGbdTLHDbFAfBkmiAtpr3IG9AQweAez5CiqkA26gBYU4GKcbjAOjQH7gPeXtLRlF
	G/zrDIlrYbjW/IxP0yvSo2RFeF7pkfMSAOlJUTMmdUOUUUonWIOtpcGvzf2C3+Aebq37kBR7GH/mt
	Ysn/mU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Kn-0000000CkCi-032e;
	Tue, 10 Dec 2024 20:59:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Gn-0000000CjBS-2UgC;
	Tue, 10 Dec 2024 20:55:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434f398a171so2714985e9.2;
        Tue, 10 Dec 2024 12:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864148; x=1734468948; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03lzIWbBgrYztWCtWT8WxjDnlzcQKSOSZ3z9Gh8bKUs=;
        b=QHYpmO7fBY3rWioBonRu0dgzKuTeUzUUg9AckpbVrionxDba0lD9LNM71Wkua4jXMj
         wkUYSHJuDkrG8Dol2FeGy9Itk+Ml8FGBY36R+VHcws1j8Z0bQprdjaIp8WFKKgsQpP17
         PydJmDNHV16K7OK+Pb+XNvbV978Y4INaG3S4bEQbj1qbwOlYdKvFv9OzApktssBWrU+i
         SHtmqPm/bsQVHjuqGMHT2kFzVSUa3FgPb1lLzfy5t7uXZC7PFR8lCW0eoSR8LjViU7J6
         g6O0GhGffUp/3ENfsjVcgWIfTAXlEQZy5JHXmUpJPGdnLvNh+J8aIh6TOtEvbSbWoeGl
         kfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864148; x=1734468948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03lzIWbBgrYztWCtWT8WxjDnlzcQKSOSZ3z9Gh8bKUs=;
        b=FyykJSP7lsQ181n5Bn9DzCRiLH0hT4QxTNqPpUUfPQzovUWfe+89Ry+FBMfrGYB0Gv
         w4/8pjm5AcVwdBXOFRKum9WUy0QX8ccohtCNPP65HI3LBCPOvDm1h5U9CuU/ARg1MKMA
         nBFMHsAr25XbFo935HrM4u1Ag+KvG1UuKCN3OmGU0nPI3TeVvPzXwHYqkLWWi+FXVDea
         Jv13HEo2dASeUP7lyzYVFhQh+RgACgHc18bsx28xhPKt53eop9fWL8S7/w8wD5rgF0yc
         Zzv6Caz1FFOo+ENsOscN6AYh4qNK9h5SdSKSsfoqs5+UxBD/zn9u4GWSVY1EXegvPny8
         0dNA==
X-Forwarded-Encrypted: i=1; AJvYcCVc+PN7gYu39nFPZoADihIIAvIAQQVcUyWZPog9/pzhm4HKhw90QcqXd55Bkq3B1Gco75ZRGyddxhqPjE8NDmY=@lists.infradead.org, AJvYcCVylwVGN18dn67IYPoULu+/L5cfvRHHzJ5eSrIxOKQ92rffZ+IWXtb0/FhEfdtwmLHgeEXI0bEPSA8zahaIjlf+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1X+8u/ZWx0wVbUWzNvPhc8mntvRdGdG2D+m9kSm/0etUGCxdX
	sxrkPzUjjBTo07am4heNBEWLuoBuW9pyriXo0H1+nZTjVD5k2sA+
X-Gm-Gg: ASbGncuzd2mXhhimk5PudUwhN8Hv+7nWJ+THqBujwIsUCUiAALJ6NKpio0plHfoMRI6
	BNlhphxEhpQ8TQorBo25ZCuZQSwPHOUDYj6OHP1isgTenJOE6oFEzI8fhXMPLBiu07xWmi6QF6F
	mqs4AElXDDpI9pZmkWZn5FO5X8T0szgMYz1WjtLDsNcBN8s7f3C3M05tqcvN0A5JXImzA0Tthlv
	+zOuE0arXHE+FvTApxg791yORBqjuwyx9aQECt8Sw==
X-Google-Smtp-Source: AGHT+IEiD+5cl0JJRHM/3eDcF6jZsi6IQoeOt4l+BoieBmFnyEFAFnP/YYrof8zR3fpaQjM0J7r5Gg==
X-Received: by 2002:a05:600c:3541:b0:434:f30e:fd7c with SMTP id 5b1f17b1804b1-4361c4238e9mr616715e9.9.1733864147857;
        Tue, 10 Dec 2024 12:55:47 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526ac03sm245511785e9.4.2024.12.10.12.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:55:47 -0800 (PST)
Date: Tue, 10 Dec 2024 22:55:44 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 4/9] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
Message-ID: <20241210205544.g6y7vcyekyfebkoo@skbuf>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-5-ansuelsmth@gmail.com>
 <20241209134459.27110-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209134459.27110-5-ansuelsmth@gmail.com>
 <20241209134459.27110-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_125549_631117_C62B1BD4 
X-CRM114-Status: GOOD (  12.10  )
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

On Mon, Dec 09, 2024 at 02:44:21PM +0100, Christian Marangi wrote:
> +properties:
> +  compatible:
> +    const: airoha,an8855-mfd

After assisting dt-binding reviews in the past, I get the impression
that "mfd" in a compatible string name is not going to be accepted.
The bindings should be OS-independent, MFD is a Linux implementation.
In principle this could be just "airoha,an8855" for the entire SoC.

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mfd@1 {

And the node name could be just "soc@1".

> +            compatible = "airoha,an8855-mfd";
> +            reg = <1>;
> +
> +            efuse {
...
> +            };
> +
> +            ethernet-switch {
...
> +            };
> +
> +            mdio {
...
> +            };
> +        };
> +    };

I hope it's not mandatory to duplicate in the example also the bindings
of the children, especially since you link to their own schemas.

