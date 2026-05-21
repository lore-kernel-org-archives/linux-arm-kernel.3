Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19DECD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeHgpAGmkkft1lTDv1GUbcLOSox8wth2jbdG+ISuWKg=; b=uAGgoGvKw5yKFksCIllC4gvNnG
	TCFrs3wfrHsvhynrIveC/tJ8XJy9bspzi/bbdssyd7AXD3fOwJml3m1IU8P7UTp6qaxlln0jJWiv2
	OK+61NrIXkm1x/96hETX5+j4Toy3lh62Tkm8DCqXIPdxQPw2GfR3GU3Vfz2vtulUsaImUkY0OmBga
	ZEXcVw3N69FI7BfRnEyixUC++Viwcphd9KkT27vrQfFm58zGmbqpPZR2OSgdDLQTErV3KMeb6Wng+
	/KvOGSTVKrnQjCWkMh2T0h26qXmAMa1lY/4LGorOnSpgKStGN/k+TXiyHIEF5QFvF5ZvCfAfGZRhm
	DOp9xmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Qx-00000007QLh-2dlw;
	Thu, 21 May 2026 10:15:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Qw-00000007QKp-1KVc;
	Thu, 21 May 2026 10:15:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A92260172;
	Thu, 21 May 2026 10:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0481F000E9;
	Thu, 21 May 2026 10:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358517;
	bh=LeHgpAGmkkft1lTDv1GUbcLOSox8wth2jbdG+ISuWKg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=DCYqjYat31sL+mOST1Xc8Edy59m0ameJU2o9mvxAEAytb2a/ZuIteGVExXtaYxFmh
	 uJKT0vLGRKLT2y0N5xvXWlMlk5iBg7RqLdoiL3Xaq6TkmQ6/28r3nydDHRgN9Yc1fk
	 /zmoifVpk66TTSioGzFJD7SFNo8xkqKd9Gbrlf1cH0XcnC2sMGK1+nXM6tXN3t/Lv9
	 O2105u3JCJqOzuCfuTcw0QFrhW583UUItiecZIBNNvcGA7fK1P+VuO/S1L/k5b1CVh
	 cq1E608gEhRG/kwLty7km2Fg55eIWPMgs82NMmNUL20ui/F0CFinJLENyDWSOaAH9p
	 4X7JBnUg5XIdQ==
Date: Thu, 21 May 2026 05:15:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, 
 linux-mediatek@lists.infradead.org, Russell King <linux@armlinux.org.uk>, 
 kevin-kw.huang@airoha.com, matthias.bgg@gmail.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
 kernel@collabora.com, Eric Dumazet <edumazet@google.com>, 
 macpaul.lin@mediatek.com
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
In-Reply-To: <20260521-add-airoha-an8801-support-v4-1-1e4837d30ef4@collabora.com>
References: <20260521-add-airoha-an8801-support-v4-0-1e4837d30ef4@collabora.com>
 <20260521-add-airoha-an8801-support-v4-1-1e4837d30ef4@collabora.com>
Message-Id: <177935851659.1629932.12187285243163013208.robh@kernel.org>
Subject: Re: [PATCH net-next v4 1/6] dt-bindings: net: Add support for
 Airoha AN8801R GbE PHY
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


On Thu, 21 May 2026 10:21:54 +0200, Louis-Alexis Eyraud wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add a new binding to support the Airoha AN8801R Series Gigabit
> Ethernet PHY.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../devicetree/bindings/net/airoha,an8801.yaml     | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/airoha,an8801.yaml: ^led@[0-2]$: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260521-add-airoha-an8801-support-v4-1-1e4837d30ef4@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


