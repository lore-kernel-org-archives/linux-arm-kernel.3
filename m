Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6678D30CE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 22:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8vxYE/GG2h7J3BZOCKIlpgaekSPZ8Fq1E5Q0hAM9Lc=; b=KlXTM6LWVBOyLXIRZquq9MpHAN
	go9rMxJbvhoAbHQ7veTHpAHAmMxYypJ0UctaFemDllOgdDq2zO9I9Y1HCn+/Qa5HLy3S3nY3TdkMm
	MgouIWgm6wwDTv4aKXTrYnmKGq2C130o7/24MPXwGe/Q/WWhsJX58qaQjKowgR+TkmWQNYuwmD4K2
	GkYwYdfZIYsJ4dLVEUnG68z+izD0NviE7LtfJ6f0yLj0zm8hVnQ9fvHFhwtC1mJlnsNmHoPf1hmXf
	F11iPZ3UvBnuoOKzYnp2i1Mcy7pbAMt7eFq+mLsSqd0v1juO/HLwkzcuDeZ22J+mLxrNOiDRvHlqc
	Iykhdo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfn0k-00000007pif-3ANK;
	Tue, 13 Jan 2026 22:37:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfn0i-00000007phl-3Q0R;
	Tue, 13 Jan 2026 22:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC43243BEF;
	Tue, 13 Jan 2026 22:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744CBC116C6;
	Tue, 13 Jan 2026 22:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768343831;
	bh=e3CTtEWdP+YYk0zGKgbECMVxrxJeiEy35VeU8e0usYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZTjJgzlvfioRepLNfbiKbV1N8Ug+xze0gtWzyvbyFxpKv95a782K2SskkGdEa4TL
	 Ug3fR7DR8iRKQSJ+cNcFQHWfHIFXp00CdqZtf+Itq/Kc4fZ0B4c+56AJSpQPRqFTyT
	 ESoWiEExlyisKrOZEZjW8TRBMK5ycWnxdfvIx4YlTVLIJKGM3dzdH68OPxedREBTGs
	 CYKF6qSlNNQHTatHhJrFyWu5/IaDctzsNEE8MjQ8mgnV28jY9kc7Q8QQEOofcU0b+W
	 GNkcgetxB9M0pCT/0Buy/vYi6a1vOd6R217wGFoee0ChPm6iZUE681mKPV5teutY7g
	 STJrtLkoIRkwA==
Date: Tue, 13 Jan 2026 16:37:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregory.clement@bootlin.com, herbert@gondor.apana.org.au,
	linux-crypto@vger.kernel.org, andrew@lunn.ch, atenart@kernel.org,
	linux-mediatek@lists.infradead.org, krzk+dt@kernel.org,
	davem@davemloft.net, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org, sebastian.hesselbarth@gmail.com,
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: crypto: inside-secure,safexcel:
 Mandate only ring IRQs
Message-ID: <176834382993.367039.14372601260257226212.robh@kernel.org>
References: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
 <20260112145558.54644-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112145558.54644-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_143712_874939_6D27E8BA 
X-CRM114-Status: GOOD (  12.92  )
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


On Mon, 12 Jan 2026 15:55:56 +0100, AngeloGioacchino Del Regno wrote:
> Not all IP implementations of EIP97 and EIP197 have the EIP and
> MEM interrupts hooked up to the SoC, and those are not required
> for functionality as status for both can be polled (and anyway
> there's even no real need to poll, but that's another story).
> 
> As an example of this, the MediaTek MT7986A and MT7986B SoCs do
> not have those two interrupts hooked up to their irq controlller.
> 
> For this reason, make the EIP and MEM interrupt optional on the
> mediatek,mt7986-crypto.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/crypto/inside-secure,safexcel.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


