Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9881DCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91ni4OHOJEhYMTKX+2kMkaj6csE1qduQg5o/8P82bfQ=; b=QFAnuntCeJIXYu201i8POdu65i
	TUVbPOtQa2sn00wwqCnOFmnKy230p7g8I96h1XGzofuY8kmIzepJTx0DuKAqZ37r/ssHO5JL4JNHa
	jy/FOYebAFq7d33kyA8gKmLwivpWKC4yX7q2w+hyvv4xb2MSSUd71QYLj2oq8MXDipe7NNkK5l+9u
	dUfQe6z6/0PaVZMXDWTJ2G5l9ufE7oUAf6Z31JVkepgz2Lk4N+c+gOKYt9qI089cmbcVW+Rzv47p1
	PkF/UZB5xQ9IUDruMd7BdGcM694gKc6vrTM4rYeOy4hgFqUN3w7rfNUQEMCNB+9x6ag7JgkfkeXcr
	jn5jxoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtMk-000000003xs-2UgL;
	Wed, 17 Jun 2026 16:43:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtMh-000000003x7-475R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 16:43:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4923139e940so13001575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 09:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781714625; x=1782319425; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91ni4OHOJEhYMTKX+2kMkaj6csE1qduQg5o/8P82bfQ=;
        b=mISUp8UbBMCuMCI18l9wPEEKB8UHlnkbsLYefqt2LHP5jgwoSpTGtUNYIqg+EcLLW9
         xCPjuTQZTVqXxl2wlaLPEx6wN84kxxZSLMULQr50si4M1SXp8XQGRVJTMNDBD0tyVZo8
         Y+dDmOaV0hl4eiXlIfHSTHee2UXOcrtsYoiCKTjOt38spXhDHVhEt9hsZQ0FAvafmQUL
         /YAa4sM1TDFuXdHCIVtupLRM/U8qg5IeAbXdP6FInUqn/zmTw28GrBVI3bbgSe7ZWgxm
         W7j7tOGHph0/qCXv8cUVY3eiqoVzr674epFh1n8dSRRuRXt/jT4dQwRfwP+xxI1ff/Gt
         yZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781714625; x=1782319425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91ni4OHOJEhYMTKX+2kMkaj6csE1qduQg5o/8P82bfQ=;
        b=HVHj0lfR8SehgCcgwBDGg2XI77OnUVWSw1gVg5az0jDnVK3IFyUtINcNp95ajope4s
         8B+ZoA65YotjmqWofganP08wtmNOpHrZUG5GLo0xZeqsKOYJrQvoZt32aZmTbDTYLAXR
         2WDe0rkbdIk6wl1zoJhL5XILfV9iXo+aZ/1Hz4HTwhG/02/fTivbDyWEjMIOCmQnq2/t
         QFCboBg0nTXaqVOv6CtByq2KU+nRZXf2PkHlEBqDglt1pQ2xryEQSGKtzDDZVtKVmV5c
         P777VkpHloX0O1zntru8ZPjdo1u1lskzamSxzUZZdsUiiLv+GEjp0SjC5z14+of8n00O
         Fs5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+DHVrsgxv9sZcQod491jC4/qSMiuiBQKZA9+z7eUDxWWgTJj6y78rmPcr2fwPD/+N5J4tFWthe8prIukewLgWV@lists.infradead.org
X-Gm-Message-State: AOJu0YxuPlRuqAH1zyO7tG8pWMcIFBcPqBRVyAB5a/5booskH9k6Npmu
	lZyi+fcx/V79g0PPCsStovjSlnUsUx35Daxa7d6RIc0IXCm5TPMW8mOg
X-Gm-Gg: Acq92OEsJKSc3ZuZhnOpw64LSbyIyLyAgFFRAxcmHGxAx08hCEp5qqIUSLW4AA9h7nf
	P/B+LWtfhNB9luzm3dJ2NJLN0xPgT034gCdUbiG8msj6sXOlOhMRAuiJYZYfCCxhsGZLwtGJ5jG
	umu4jC4RjtO762P8PBx5Uu36JEbxadmvT0+r2qXjUkSa2ODC6dEjko3J6chIdCUlfZK4Vjf/1qo
	dSBBZcWtDj1yJo3BfXRyDL43ZnWyo02jt0YUmAf64SIOVQ7grqX2HvacNrhGzCMF69iyIGZsag4
	k0vOgx8yiZ2gKTeskOUhy9URIIRXVgyozSjojgZiYjJdsv2fQykmPFZ9O646py+JJgdTeN74x4G
	BxVusvMuASqyK0qGPFSYE+pbpVWADiw4Pjdj9u/ZV2vNCayTDh9MHYBghhnQVvZs+4onbTyqiPm
	Qvgv0RqneYRQNXOzJqDb/kVrsUoNOjPuy/E+WxydBXuXgn+nlSeVYtg4x9CIoucQOyBUu4kuGQA
	3ZpA/ttnQ2YML3046MsPz6BsEKq//9zXC710RbvRkWU8gyMvlHkiZM=
X-Received: by 2002:a05:600c:a15:b0:491:91cc:d12d with SMTP id 5b1f17b1804b1-49234131f7dmr59507685e9.25.1781714625451;
        Wed, 17 Jun 2026 09:43:45 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f4a:8700:58d1:af07:762f:9d17? (p200300ea8f4a870058d1af07762f9d17.dip0.t-ipconnect.de. [2003:ea:8f4a:8700:58d1:af07:762f:9d17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a8ec56sm156440695e9.9.2026.06.17.09.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 09:43:44 -0700 (PDT)
Message-ID: <876a38f8-75ea-4b32-bb65-216cb3adb436@gmail.com>
Date: Wed, 17 Jun 2026 18:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: net: add Realtek RTL8125 PCIe
 Ethernet
To: ricardo@pardini.net, nic_swsd@realtek.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net>
 <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-1-2bd38922d129@pardini.net>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-1-2bd38922d129@pardini.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_094348_048422_C78F6C6F 
X-CRM114-Status: GOOD (  21.09  )
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

On 17.06.2026 14:58, Ricardo Pardini via B4 Relay wrote:
> From: Ricardo Pardini <ricardo@pardini.net>
> 
> Add a binding for fixed/soldered Realtek RTL8125 PCIe Ethernet
> controller.
> 
> The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
> spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
> need a binding when used in a board DT - analogous to "usbVVVV,PPPP"
> compatibles documented in their own bindings (e.g. microchip,lan95xx)
> so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
> these PCI function nodes can be validated.
> 
> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
>  .../devicetree/bindings/net/realtek,rtl8125.yaml   | 43 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml b/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
> new file mode 100644
> index 0000000000000..eee13fbc1e6a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/realtek,rtl8125.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTL8125 2.5 Gigabit PCIe Ethernet Controller
> +
> +maintainers:
> +  - Heiner Kallweit <hkallweit1@gmail.com>
> +
> +description:
> +  The Realtek RTL8125 is a 2.5GBASE-T Ethernet controller with a PCIe host
> +  interface.
> +
> +allOf:
> +  - $ref: ethernet-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: pci10ec,8125

IIRC we came to the conclusion that the compatible string isn't used in the
relevant code path. Then why add it here? Is there an alignment on this?
If it should be added here, then an explaining comment would be helpful.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pcie {
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +
> +        ethernet@0,0 {
> +            compatible = "pci10ec,8125";
> +            reg = <0x10000 0 0 0 0>;
> +            local-mac-address = [00 00 00 00 00 00];
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c8d4b913f26c1..e5fbd82946aec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -134,6 +134,7 @@ M:	Heiner Kallweit <hkallweit1@gmail.com>
>  M:	nic_swsd@realtek.com
>  L:	netdev@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
>  F:	drivers/net/ethernet/realtek/r8169*
>  
>  8250/16?50 (AND CLONE UARTS) SERIAL DRIVER
> 


