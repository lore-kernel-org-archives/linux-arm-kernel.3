Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8190C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSZWX5xFW0sVcWlHSb+4MgJ4CgTapTVN8LsIk7/nm/8=; b=xgGoS25v2o7ddlk4ytTEv5yN9C
	Mm1yfbz1Mho/dGEs0lungKsngsPN/iGP2ndSALtsKNUCiKVWdwZ9J6Yu/Kf1kehfjhp+swbpp8mGM
	45YJZg3Gg9gfpanf9Q2TZGv1arAdL6J5bAgUIIuhst8wDsk6qj9PVhxdyd/2KniB2g93uZWtoXeCh
	qQyJVNw0eVzpygyqvzsi/pvtcFUS1vZbqWZnJ2KnTOUJte01FZpvk7rPXfLvDw3BrlH5N4Z9X44BV
	D5gKqbe3SuE3hPYUKiTTHHGwOZjVf5YBMf8H2aX6joiGGk/aFRAHDPwgExK1c+iEh6cdtKlcUMt+x
	xWolrFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdza-00000001eGa-2XYs;
	Fri, 17 Jul 2026 08:32:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdzZ-00000001eFw-0qY0;
	Fri, 17 Jul 2026 08:32:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D896D40AB8;
	Fri, 17 Jul 2026 08:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600FE1F000E9;
	Fri, 17 Jul 2026 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277140;
	bh=XSZWX5xFW0sVcWlHSb+4MgJ4CgTapTVN8LsIk7/nm/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EWG0PmBskngtBjqNBmrVsVSBFqYpucErvCXUeoY1LPeUz4W37bkXZIsScvNuFQOL9
	 IConoJndUypWgtq5JTV2kKRJS9cNFHy0OsA7rp8LOWdRhUTTKNWojQacmIQH4/Kc9B
	 BARghgtdWg05RSb2lk2Lr4h410Pw6CoixuD3CM9yJDJc4xfBIlNZ8e5hz5tdZry66A
	 TkmiIgguw0SWhZqBNzpHzSr6hJJYVhPOYUIT7qmBmf+2F7UDxTKaJMNr017IBaGTfQ
	 flFTCdN9yk8d9fB08dOKJ+NnVfW5KLi0OYGGqKu/jCUdl4BvKPAqHdqDsQoB4ArGS1
	 guf6VOiY/S4bg==
Date: Fri, 17 Jul 2026 10:32:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>, 
	Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/8] dt-bindings: i3c: cdns: add Axiado AX3005 I3C
 variant
Message-ID: <20260717-rainbow-innocent-mantis-eb246a@quoll>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-4-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-4-c429095143ec@axiado.com>
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

On Thu, Jul 16, 2026 at 08:51:11PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 I3C master. So far, no changes
> are known, so it can fall back to the cdns,i3c-master compatible.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
>  Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


