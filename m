Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606E4D3ABFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 21:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRc5BI/CyFZP0gkiXOWg7GwHZh9g7symIcLtVtOL5gw=; b=KKeHwOsLVU9nNKySGyefDXotek
	e50ABpJm4B8eocwxg7ehpb1pUsxQnxNTn6EZapV3oPpuNg82mhV5zSueEOkLrvz45qIOpEG7mhsON
	GmF7/q6uxplFb5GZ4qjMMKNaPWQQpO4AhXD21PHoKzH9gvi6q2/DsyNhC9X8Thb5e1/zUTSKaXgyN
	khzjfHndFivmJVUKz11ZJ+50d8t26rTIZC/YQwaBuAW4MUUbnzf/9xSycJlZIltcy2Pc1mZyTJWdY
	I+GDuyZKIqV8Xij2rIP6+YjbJ+lE58WoF+maQR9thw38OCyy/r+3+uylD00LVIaNs89vcFuDHKh4u
	WRYwGw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcOm-00000001Qb4-07Ih;
	Mon, 11 Nov 2024 21:56:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcN1-00000001QPh-2AzY;
	Mon, 11 Nov 2024 21:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tRc5BI/CyFZP0gkiXOWg7GwHZh9g7symIcLtVtOL5gw=; b=WLIXwm9Ystl7CFwQKDRTerWpIB
	4KGaBb6N+eqjuGYOtRdjZf2hpJTQFBa8AcC3Ma7fJrP2GkiE1nDR5T+PbQO9zPwhqZikSHLmf+osD
	Q+wqhKxPfzmnQIZqK2ZxszypU21OjdRK0GDaeXPjv6OwOG9wNVPuEyasvW2WgP/L44bUxY8lfogwD
	tpdCWcJ768Zb0JI9ScI7WlekOCh4wxyH6wSaRdfjisdz/cF5xH1AD+yXxT8HCJMPV8a4Uy9iDLjfy
	DP3m/JwG+oRvtxA20sE59fCk0oouT3pdX0rX+jgEEqaJwN7xyg2l3GUy6LGh03kNctp1nE5jQKSqu
	9lii49sw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcMv-0000000Cvy2-01q2;
	Mon, 11 Nov 2024 21:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38A5BA40CFF;
	Mon, 11 Nov 2024 21:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3157C4CECF;
	Mon, 11 Nov 2024 21:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731362083;
	bh=DqR3k8brOadv8bcg1GsVIfynuocPyt+daDjnYYPFCR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYveXlPW7LodRFcqnTNh5rMxLLwOnUfN2WqUe1ERMapVG11AD5at5202tinfCKRip
	 MCcwPHh8vWZusY2flxVi2Wv38KpUBcRg++G7WOqvmfn0ouXtzvhB/XDgdlHgSpnnnF
	 JqGXlwyKx4BPf+NQ9iRcC/lgONredUYJKZ1XnZOsqOXAugbFgCpgWN+D8DshFD1+VG
	 QYyADNUJNpuhdfq2QOx1S9SGtEmtFkGQk4qi4jJTFI1gIVnGLEiAiRTMHiEUcZpRxz
	 dUQEQJS6RPXpgmyDczgRnnBSMAYyy25bFj/WfuK8Ba48YMHU6PEkGuTv51uqky5H9I
	 Dny3Z0X5bTeyg==
Date: Mon, 11 Nov 2024 15:54:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
Message-ID: <173136208008.2010062.9879027626457168051.robh@kernel.org>
References: <20241106100741.173825-1-y.oudjana@protonmail.com>
 <20241106100741.173825-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106100741.173825-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_215445_573346_F795BF92 
X-CRM114-Status: GOOD (  13.97  )
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


On Wed, 06 Nov 2024 10:08:33 +0000, Yassine Oudjana wrote:
> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
> has a description of the pinmux property, as well as some additional
> descriptions for some pin configuration properties. Pull those changes
> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
> preparation to combine the MT6795 document into it.
> 
> The only DT that currently gets affected by these changes is mt6797.dtsi.
> It is modified to match the new bindings in a following patch.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


