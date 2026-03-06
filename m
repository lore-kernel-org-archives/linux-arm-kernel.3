Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A63FCB619
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWmd9JmFrzj2CSRUCUjjYlCLuKKl93h/rZTpdGbTueU=; b=Bj9rh2n5Oc1vco9zzF4ZDam8nr
	v+oSn5Kmfoh1p+Eyprd5oI9ZB0Piefdr8wubFhnqLHRXX8GCyIpnaBgdlrBWYFSPnxJChpV9HkO9e
	MAdJtDj+4VvbyA5VGv1dTOWcjyQ1g8iGdaAaxZfKgbNxpn5eWvb/Vq0noazQXBPvsITbWbeo+5sBu
	ckQfbPVWEj4KtNLvE4jPBOdvLMnJ1ZOUDU+bNYmvDzIYcQYVrogTXysdWnycu1Wjb492scHfT/iyn
	DhGk1f7JupqQCo+K3qIFTFTOqWHK0QepE90lYk1W4F9q3KcRAorvUZQIEhm7amYm6ST24V+4S+a1L
	XCd/7uuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyY6x-00000004AfE-2AsI;
	Fri, 06 Mar 2026 16:33:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyY6u-00000004Aej-3UGK;
	Fri, 06 Mar 2026 16:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AF67404CB;
	Fri,  6 Mar 2026 16:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC168C4CEF7;
	Fri,  6 Mar 2026 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772814787;
	bh=CnQoePDGbm0PHXBOJYOu5eMNk8PFbwki0J91SPH+ipw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfhEK+zVvjIgeRlPT1wuB79AM2+Dd9id+GxlsrUhswzSVDVUu9UDDm4qe2NH9faZG
	 9H1TXikDsT4sJaDwGccf/iVUWw1WaLTxkkO5CtoF6payK6po9/yuH3tALljqDQBrnh
	 qI+ZmpGDndHmXj60/uJMWHmrWkVwRhNHKVIlSOnAE0ZEXhW4QnGHTpdcm29b5sKceW
	 wS58IrVfEBLrFojjoFgbGC4bvmXP2TJCpE3FfalC7meebPH8WyEfQpfGAtVd55i5pf
	 B8FYa3oY6Sgq+SWcqf1mDZ+H49BzKN42/3/e03c0lTfooVRXt7laYoN6DoDk/6KRYH
	 fOJ+dWIRF9Yog==
Date: Fri, 6 Mar 2026 10:33:05 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chaotian Jing <Chaotian.Jing@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
Message-ID: <20260306163305.GA2680515-robh@kernel.org>
References: <20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com>
 <20260306-mt8196-ufs-v9-3-55b073f7a830@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-mt8196-ufs-v9-3-55b073f7a830@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_083308_914025_BCD45E79 
X-CRM114-Status: GOOD (  18.76  )
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

On Fri, Mar 06, 2026 at 02:24:44PM +0100, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC's UFS controller uses three additional clocks
> compared to the MT8195, and a different set of supplies. It is therefore
> not compatible with the MT8195.
> 
> While it does have a AVDD09_UFS_1 pin in addition to the AVDD09_UFS pin,
> it appears that these two pins are commoned together, as the board
> schematic I have access to uses the same supply for both, and the
> downstream driver does not distinguish between the two supplies either.
> 
> Add a compatible for it, and modify the binding correspondingly.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 58 +++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> index e0aef3e5f56b..a82119ecbfe8 100644
> --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> @@ -16,10 +16,11 @@ properties:
>        - mediatek,mt8183-ufshci
>        - mediatek,mt8192-ufshci
>        - mediatek,mt8195-ufshci
> +      - mediatek,mt8196-ufshci
>  
>    clocks:
>      minItems: 1
> -    maxItems: 13
> +    maxItems: 16
>  
>    clock-names:
>      minItems: 1
> @@ -37,6 +38,9 @@ properties:
>        - const: crypt_perf
>        - const: ufs_rx_symbol0
>        - const: ufs_rx_symbol1
> +      - const: ufs_sel

"ufs" is redundant as all the clocks are for UFS. Same comment on prior 
patch.

> +      - const: ufs_sel_min_src
> +      - const: ufs_sel_max_src

"src" sounds like a parent clock? If so, probably shouldn't be in the 
clocks list. 'assigned-clocks' is for dealing with parent clocks.

Rob

