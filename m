Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247BDC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ylh7Y4NM96Y1K3UYEmAplxHb/OJOQpXgOdrp8UvyGms=; b=w2pok21/YbTC52UvGWOmfUBw2s
	W1Cytf4j5QjgTg+Nws7AKm11B3HGW7OpYlPKFurNWcFTupQjWw6Ktty4cS/E7FRyiqvy9rtYJb+xp
	fiHiilFxPcGHLupyWTAJK1Xf76+Ak8nMZ7uuD8puMSu4M7Ts+HwK6EO0C3TxyK2skoeJHOhO+WQIn
	LKzVzOJMWIBOliLmmVigAjEr/G1cDoqphd7GumYVTIQ+nNxetBWjb2UC1q7mZNw4sLEjaRLvsvz0Y
	jEawbMPF8ELdxCkBQHOKuxTrqpIs82k6RHraO06jiMY4g59kk8tA0n/j01yR1za1rAFJlvkM7r40t
	6Zr8e3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0dp-0000000F5so-2Iue;
	Thu, 23 Jul 2026 21:07:41 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0dn-0000000F5sG-14d4;
	Thu, 23 Jul 2026 21:07:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784840846; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UbSRRyiq4UBWkWjCiZwEN5+D5j44j59m4V+dy12Vq9SuquHzklkgkkxFvxLZBXsdaCDQpnDXK1fEYeodd091n2o8AwdnjNt3NrTpe+JqWPN9YUvoMx/Uy85zfX0ptIVfFUZmssPlP240CtutyjL1kxzynL/cWVuq/qqpmTgREgI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784840846; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ylh7Y4NM96Y1K3UYEmAplxHb/OJOQpXgOdrp8UvyGms=; 
	b=T7FkKlw3eCyXnnBBwJ510N7uYE9YT6eJzc0E70BMSZXgM+avST8NeXC18IgLhQb/rnjTqjFh8EloKV9x+S+rdiTcvaXkpmPSM5hRt37TQd7zp0jdqU+utA62MP9onAHbhDSpBCbQANuGdfmfps6i1HnIo5NIus7aFtztKE/SCXg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784840846;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ylh7Y4NM96Y1K3UYEmAplxHb/OJOQpXgOdrp8UvyGms=;
	b=amPpSWRDaVPD67O0JPV3NK3XDV1KW3LPZtW2RUJOwZgfoaXxsopf0pftnEIckLTa
	muUl8zZqtJK2bS2vCy1sYdDkxx44QS2HCSrhSJbX6NWnLgolqxe0bzkUe4kqk3O8/kw
	p2fmwLgqyI55EuxiMlruQDA2O7nd9B/GtShEqMug=
Received: by mx.zohomail.com with SMTPS id 178484084539279.68028284519187;
	Thu, 23 Jul 2026 14:07:25 -0700 (PDT)
Message-ID: <6ec14924-7e29-43cb-963d-cf9703f03ebe@collabora.com>
Date: Fri, 24 Jul 2026 00:07:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
To: Igor Paunovic <royalnet026@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-2-royalnet026@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260721064115.64809-2-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_140739_392051_ADEF022A 
X-CRM114-Status: GOOD (  18.26  )
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

On 7/21/26 09:41, Igor Paunovic wrote:
> The HDMI RX controller can expose the audio embedded in the incoming
> HDMI stream as an ALSA capture device. Document the #sound-dai-cells
> property so that a sound card can reference the HDMI RX audio DAI.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> Changes in v4 (both suggested by Krzysztof Kozlowski):
> - reference dai-common.yaml and switch additionalProperties to
>   unevaluatedProperties: false
> - drop the consumer comment from the binding example
> 
> Changes in v3:
> - no changes
> 
> Changes in v2 (all suggested by Sebastian Reichel):
> - reworded the commit message to describe the hardware
> - property description now documents the DAI indexes (0 = I2S,
>   1 = S/PDIF)
> - moved the consumer reference into the binding example
>  .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml  | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> index b7f6c87..b80660d 100644
> --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -78,6 +78,13 @@ properties:
>        The phandle of the syscon node for the Video Output GRF register
>        to enable EDID transfer through SDAIN and SCLIN.
>  
> +  "#sound-dai-cells":
> +    const: 1
> +    description:
> +      The HDMI RX controller has two digital audio interfaces, one for
> +      I2S and one for S/PDIF. The DAI cell selects the interface, 0 for
> +      I2S and 1 for S/PDIF.
> +
>  required:
>    - compatible
>    - reg
> @@ -90,7 +97,10 @@ required:
>    - pinctrl-0
>    - hpd-gpios
>  
> -additionalProperties: false
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
> +
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -129,4 +139,5 @@ examples:
>        pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
>        pinctrl-names = "default";
>        hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
> +      #sound-dai-cells = <1>;
>      };

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

