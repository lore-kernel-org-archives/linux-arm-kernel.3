Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFD8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FP+ifasHniIC8neSq6VwSq5ZsIenCwU36aCvQ3EbV9k=; b=pTGe1tDLNnanUazk0W3fDdFGtF
	cQ9JmPbIWnXmJ6hJ5NtrcO39Pm0wksIjkxCxBTzj3kdvOE72ww7Zd0dSwd920Vc/c6KT/EVUUp++E
	SGowRCCOn1ay1KQz2GWvOo4DX3I0h7/Vah+4ZH3fAPp8jpL/PoJFIOrZ6KexfdSDqvEj9px965Fyh
	FxbbTafP1MjeYs5ETC+cj/EU15dbpfXKTU4ahYPheNM/q4UyxscX0BxXVSEpdlqSPS0LeO5PDemIO
	twE5jBLXuuWknGxKyJPd0sBufC1w74XOUKPhPdP573lw35mCPCcQHaO5MBiI/Vu2xqX6rUsWFStPo
	lBDZ9cPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYMx-0000000EPwb-098Y;
	Fri, 07 Mar 2025 14:08:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYLK-0000000EPdb-0Lmy;
	Fri, 07 Mar 2025 14:06:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741356358; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RUSqeTjX0/f+vSCIJFG7Ivi/H9ExZZOTIGsH8b/7NgnDNY+UPVZ7ECjWzwOuDI3RzpTfQqmbZSAsfna/nJrzgxqNHi9CItEF9nS40fA67K5OyjyabwmfpK9um35EBQjHtXoOmHIdnjUaDBCCDMC8yAzHg++9XIkIh6wtiClIxik=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741356358; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FP+ifasHniIC8neSq6VwSq5ZsIenCwU36aCvQ3EbV9k=; 
	b=M4EErEyApvaCAnFL5c92n1M0wMYZ4/LNdYQL/JjFfVIWr1+oWZ7LWHG91M7LH/wdakw0O6B/Z6DdW1CFhUYSU8YrcdcDdi/S/B33oM+ZFqVbEURJgvl8Ve4JwYi+DVhf5OMbdwCpJiS1Sj2d8rpDnz9ZN6y3eCQFi/Cx2aen930=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741356358;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=FP+ifasHniIC8neSq6VwSq5ZsIenCwU36aCvQ3EbV9k=;
	b=k4LLpH1xLhH5D3H7h2upAramGsfkMWDuPKZ9FZ0XGVS9QKMQsdQP0bKN4azcuUGk
	pMfBCbFEZtyQaxyMl/XEFyBtH0id4McTIUQZz/KeSYcNbJQotbnjO7wP5JrTi+oGXgB
	95fO8bj46v0ezvai2ZHpniitwdl6VAtoA17B70u4=
Received: by mx.zohomail.com with SMTPS id 1741356356876241.9419093370691;
	Fri, 7 Mar 2025 06:05:56 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Daniel Golle <daniel@makrotopia.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: rng: rockchip,rk3588-rng: Drop unnecessary status
 from example
Date: Fri, 07 Mar 2025 15:05:50 +0100
Message-ID: <5417098.31r3eYUQgx@workhorse>
In-Reply-To: <20250307093309.44950-1-krzysztof.kozlowski@linaro.org>
References: <20250307093309.44950-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_060626_184686_2D9C8ACC 
X-CRM114-Status: GOOD (  17.48  )
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

On Friday, 7 March 2025 10:33:09 Central European Standard Time Krzysztof 
Kozlowski wrote:
> Device nodes are enabled by default, so no need for 'status = "okay"' in
> the DTS example.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Drop unnecessary full stop in subject prefix after ':'.
> 2. Add Rb tag.
> ---
>  Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml index
> 757967212f55..ca71b400bcae 100644
> --- a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> @@ -53,7 +53,6 @@ examples:
>          interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
>          clocks = <&scmi_clk SCMI_HCLK_SECURE_NS>;
>          resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
> -        status = "okay";
>        };
>      };

Hi,

is there the possibility we could make dtschema as invoked by `make 
dt_binding_check W=1` (or W=2) add a warning for examples that have disabled 
or explicitly listed status properties when not needed? Or is this something 
better handled in, say, checkpatch.pl?

The question arises because dumb mistakes by me like this should ideally be 
caught before they waste precious maintainer time.

If it's best handled in dtschema, I can look into working on that so you guys 
don't have to do even more work due to me.

Cheers,
Nicolas Frattaroli



