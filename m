Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D51CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 23:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSShFjPEhGZS0W8PMTI5EHo4sFmoEnYAkCUykXUZUtk=; b=CG43MoM7IjL54K/F6ASFVye8eU
	dLh2sSeTiziMaEooV8TSKJQs/R0RvL3yASAV1DGno+RyR1nzlJhrd8AE9yXbUvXQfvAY2HpjNmRwa
	2oBw8er7g0NUW3d6jpsb7J0c4q+YWZMd1SYd7ZOG0DGyPlupzK0mSriOCWTQTDRFIuse/wdwNu9Po
	BjL1X7nJ2d01HKW6f6mgT3WhwH1i47gctW/MAPDGbp3sF20GwwbTZJu3EzGzR7eM/UYPxAeIRcMQ5
	cJUuN6OLoqw872ks8LxwYkF/2ppWvLdKN6q9+lOlqipc96sm5xq2/3/uqqCvGr2MHYeExsl31hzRn
	YvgXJy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8oKn-000000001it-10HH;
	Tue, 14 Oct 2025 23:21:37 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8oKk-000000001iV-2ODG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 23:21:35 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7b6d6a1e4e4so3902558a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 16:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1760484093; x=1761088893; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSShFjPEhGZS0W8PMTI5EHo4sFmoEnYAkCUykXUZUtk=;
        b=fzpubnU5qP+Q5N4TqG/yXnQQBY1fhvUJunRfb5xZ/1nt7WnYD99NDz9ALLNkdSM8Fj
         e8UvOhMnSDl7uVRPPmb1Jho9kg/g/5Z1l7D8PfuehvzPxxHXtrPNhzca+sa9H7nTxTgq
         URtttOj+Rkw9Q3OuIBBbbWcGFQTmqWTRJeqsxw1orGiSli7E1EURFecD0RseMybaoVFC
         uyLOo29i7uPBDQtvYzX1TAEzPt1Gc4P7ZR6R7c1zuj4YAw5gQjvL5AQT9VIkFMN3fbSV
         fPFeWjBZFvYd+kzoBrZ+K0VmvVIlaDsMefBNH4lRW4Xyt5G2Kgu1CLhZNIXxlC0PRCBR
         fnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484093; x=1761088893;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSShFjPEhGZS0W8PMTI5EHo4sFmoEnYAkCUykXUZUtk=;
        b=pbN56V5bntW0Px30ndCgO75+1iaRslRnB5cVYhFtunfN5CFaEbM9yR+lxhgo/CPQBr
         b0crJStNmb0mh1kPMyWn5vHs2+ZaQnkmnRjR/eUCSN1z9jPEF51MO3oZwpbgoTDfmbjq
         iAry+tXOcrOpD5SEAX6NnKeSlD8JBtOm65OHUYcRs2p4dKxzAaxDS7hcfHTaEu2XAaCX
         RDI9LwR1xlCyEkXQ9yoNQx8uKr09Wd6vpEGa1x+S36h4jvSoMOzIVvv+KRFcP+jVM3tc
         WxAeglaJrUbxGjuXV/sDkKSJ45CP5JVy/u0xCS6DCiRYO/ClFYrYjVSXW7ZJ0nlIxx6X
         WBig==
X-Forwarded-Encrypted: i=1; AJvYcCWDSZSqYwE5b6ukRO5qzEFlSVVOwToJzkwzoUHlienEqEJAsn3OLr+/6nZc1v3hw/XcN7suSZb6aRsdPro+0+g5@lists.infradead.org
X-Gm-Message-State: AOJu0YxZrTKZk1AK1ppMrgauiAj0kLImwuxTmqksR1QIT8JLH1BRrZS4
	z6L+yXo5xdjgCZYBVem2nM1jZkeN4Uo9rXsTnDWzhrJ+N4cDqhIJFI2v7u7Fp2fpv5M=
X-Gm-Gg: ASbGncsGH+rQj/YztsZPspYnN3+5crKvWIWiAo4vLJsTYWrLK7mSCD0gSF8j1F0Hm7k
	hCsJDKCww64HFemtb87ezO+xwmTEACf2LqyDABeISoHwBhRQhLpsLL0PWqO91PpcQeVWPFT4/lE
	mcvv2MrUyEos2BdJ+gC+UCOoosodNewAIFitjbQM/IdEo2CSxO1HmV0Thp/6R8FjVCd/byvjQcl
	GyywvizOG7IuJddUgxMt6Fe5VJvzLWMt9lEznBUWf/nT6YzNBnYwXXp2DcZ+3UsFV8rvjW/rzMc
	KI5mHkyNoXJj/1f28Kr/VSnaxpoecG4GHj9a9PDWT8ldmDGQ3pJAQut8Slkg9R5gk3HcuWGZHeA
	UUqphDrurP+BUfzUheqGeQmbknpXCKzdQ0dkSEevfmVbMrkwbIZUuqfw=
X-Google-Smtp-Source: AGHT+IFyq+WDPFYOSKVvyIdkGtxTVAzzTyKhwOBWQXTwZ3nOyJ35Dj36gHaI4KcaGzemEBsN+8m9XA==
X-Received: by 2002:a05:6830:661a:b0:799:bdea:3470 with SMTP id 46e09a7af769-7c0df6bc4famr15912480a34.18.1760484093234;
        Tue, 14 Oct 2025 16:21:33 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:ad63:63fb:ee1c:2ee9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c0f90510dfsm4856881a34.5.2025.10.14.16.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:21:31 -0700 (PDT)
Date: Tue, 14 Oct 2025 18:21:26 -0500
From: Corey Minyard <corey@minyard.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: ipmi: Convert aspeed,ast2400-ibt-bmc to DT
 schema
Message-ID: <aO7a9moI23th0Oo9@mail.minyard.net>
References: <20251014152948.3782738-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014152948.3782738-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_162134_613853_5C082E3E 
X-CRM114-Status: GOOD (  22.08  )
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
Reply-To: corey@minyard.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Oct 14, 2025 at 10:29:47AM -0500, Rob Herring (Arm) wrote:
> Convert the aspeed,ast2400-ibt-bmc binding to DT schema format. It's a
> straight-forward conversion.

Queued for 6.19, with Andrew's review.

Thanks,

-corey

> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/ipmi/aspeed,ast2400-ibt-bmc.txt  | 28 ------------
>  .../bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> deleted file mode 100644
> index 25f86da804b7..000000000000
> --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* Aspeed BT (Block Transfer) IPMI interface
> -
> -The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
> -(BaseBoard Management Controllers) and the BT interface can be used to
> -perform in-band IPMI communication with their host.
> -
> -Required properties:
> -
> -- compatible : should be one of
> -	"aspeed,ast2400-ibt-bmc"
> -	"aspeed,ast2500-ibt-bmc"
> -	"aspeed,ast2600-ibt-bmc"
> -- reg: physical address and size of the registers
> -- clocks: clock for the device
> -
> -Optional properties:
> -
> -- interrupts: interrupt generated by the BT interface. without an
> -  interrupt, the driver will operate in poll mode.
> -
> -Example:
> -
> -	ibt@1e789140 {
> -		compatible = "aspeed,ast2400-ibt-bmc";
> -		reg = <0x1e789140 0x18>;
> -		interrupts = <8>;
> -		clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> -	};
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
> new file mode 100644
> index 000000000000..c4f7cdbbe16b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-ibt-bmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed Block Transfer (BT) IPMI interface
> +
> +maintainers:
> +  - Joel Stanley <joel@jms.id.au>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-ibt-bmc
> +      - aspeed,ast2500-ibt-bmc
> +      - aspeed,ast2600-ibt-bmc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +
> +    bt@1e789140 {
> +        compatible = "aspeed,ast2400-ibt-bmc";
> +        reg = <0x1e789140 0x18>;
> +        interrupts = <8>;
> +        clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> +    };
> -- 
> 2.51.0
> 

