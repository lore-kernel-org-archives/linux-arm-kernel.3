Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634D5C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PXAjNqo4dVKHrMRVuneCrUS3mECjOACVoWNer/R9x0=; b=TdN2MYtqxDlFHfQc+l9luiPvr9
	7a/X/QKz1H4A62rZjpbnf4kUR5Hy+Of0wkjIaMQBKmSipoxwoCeUTHw7VpgcEzlFxMgkGvAj6AycU
	Uw3M+oqglJ1K5XAyl7J8ARHRRHuCUUG9anRMa2r270tKTMSxydDfVZyZaH+2NSRM4lie1bwmVFo5G
	KQkHOFp9901sN/w0wcwXCLVEn3ELLwLKdB7TmyJh8vVe0HaBoJZ6/+W3dvRE6CwFpsrwrsMnatQV9
	0f3Ed0SAFqZX9nIepgdccV/AwJD1ewoNF8sSyB958pvLn33eW1UkhZ+4qqlfWSdrgKTdFYfysmcmp
	FyARkysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVSg-00000004H6h-0gaE;
	Tue, 01 Jul 2025 07:31:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUit-00000004Bd0-1Vdl;
	Tue, 01 Jul 2025 06:44:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64C99A50F3C;
	Tue,  1 Jul 2025 06:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD05C4CEEB;
	Tue,  1 Jul 2025 06:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751352246;
	bh=tL9Chr28UTYs0r/wuqu9zvyT99diInJK0WfEdylmUj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lh025Qaq+S/Muo2dNV1h0GhM3fKgnEA6JLKYH+/HHtYhv/B5VBjpTMwZQJyppnPgZ
	 euWtE13Qw+4ccgs71DJwBCX2GCPhqCCOHYQfMujIdPXDRD6gwsag4MANNdCy16MNh3
	 3ih7MkdpVbqCUJII6mJKLC9+a8LluTyvVmb2WqLHTiwle7mmCBqUZ6kE0/0Wg4Whx9
	 /RwXepHdfZ19iFXj1crWKN1MnCJXeoo5+mGyGTYsReZhT4laWRXidEUcbXjc6ani9K
	 5twV9IY+3JYFDA13b8N0GcsGzFuDB8NGl85UrSXPhOhCGiaecpTD8rNU6hHK+QRFYD
	 nnKLErJA479ZA==
Date: Tue, 1 Jul 2025 08:44:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Wunderlich <frank-w@public-files.de>, 
	Johnson Wang <johnson.wang@mediatek.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 01/14] dt-bindings: net: mediatek,net: allow irq names
Message-ID: <20250701-wisteria-walrus-of-perfection-bdfbec@krzk-bin>
References: <20250628165451.85884-1-linux@fw-web.de>
 <20250628165451.85884-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250628165451.85884-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_234407_528531_65393F2B 
X-CRM114-Status: GOOD (  19.89  )
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

On Sat, Jun 28, 2025 at 06:54:36PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> In preparation for MT7988 and RSS/LRO allow the interrupt-names

Why? What preparation, what is the purpose of adding the names, what do
they solve?

> property. Also increase the maximum IRQ count to 8 (4 FE + 4 RSS),

Why? There is no user of 8 items.

> but set boundaries for all compatibles same as irq count.

Your patch does not do it.

> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v7: fixed wrong rebase
> v6: new patch splitted from the mt7988 changes
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 38 ++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index 9e02fd80af83..6672db206b38 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -40,7 +40,19 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 8
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: fe0
> +      - const: fe1
> +      - const: fe2
> +      - const: fe3
> +      - const: pdma0
> +      - const: pdma1
> +      - const: pdma2
> +      - const: pdma3
>  
>    power-domains:
>      maxItems: 1
> @@ -135,6 +147,10 @@ allOf:
>            minItems: 3
>            maxItems: 3
>  
> +        interrupt-names:
> +          minItems: 3
> +          maxItems: 3
> +
>          clocks:
>            minItems: 4
>            maxItems: 4
> @@ -166,6 +182,9 @@ allOf:
>          interrupts:
>            maxItems: 1
>  
> +        interrupt-namess:
> +          maxItems: 1
> +
>          clocks:
>            minItems: 2
>            maxItems: 2
> @@ -192,6 +211,10 @@ allOf:
>            minItems: 3
>            maxItems: 3
>  
> +        interrupt-names:
> +          minItems: 3
> +          maxItems: 3
> +
>          clocks:
>            minItems: 11
>            maxItems: 11
> @@ -232,6 +255,10 @@ allOf:
>            minItems: 3
>            maxItems: 3
>  
> +        interrupt-names:
> +          minItems: 3
> +          maxItems: 3
> +
>          clocks:
>            minItems: 17
>            maxItems: 17
> @@ -274,6 +301,9 @@ allOf:
>          interrupts:
>            minItems: 4
>  
> +        interrupt-names:
> +          minItems: 4
> +
>          clocks:
>            minItems: 15
>            maxItems: 15
> @@ -312,6 +342,9 @@ allOf:
>          interrupts:
>            minItems: 4
>  
> +        interrupt-names:
> +          minItems: 4

8 interrupts is now valid?

> +
>          clocks:
>            minItems: 15
>            maxItems: 15
> @@ -350,6 +383,9 @@ allOf:
>          interrupts:
>            minItems: 4
>  
> +        interrupt-names:
> +          minItems: 4

So why sudenly this device gets 8 interrupts? This makes no sense,
nothing explained in the commit msg.

I understand nothing from this patch and I already asked you to clearly
explain why you are doing things. This patch on its own makes no sense.

Best regards,
Krzysztof


