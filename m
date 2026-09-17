Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2311DC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoi8WX3DCZ2p1aQMAVpPAaAI5VyfQnIrXWk4MAN4EKM=; b=Qw/Iukh+TJZqQQCg+2bdpGmg06
	GRmku8WB8lQgCAqjR2PsNT9uVtDzZ/ey3VmWkE//r1KNAElLR1nazL0fnUgvCLekhAswMIUVFbn/V
	QMAnx8zRPGkRb1qHZ+wqGA7AXKjONrVb2+Eq6z2N1ayb1Eu8qIrruF/r+cZ/42+TayW05MN39UrMj
	Yn6lGyQToIUKTSG+37SRv9f3T4ihM6587w93meRAIPodbV+EwXr5zmBDQkuzXVp2dIyRnQ2hfrQ1T
	kaHXqF7sauibgN8068ZV1aoLQZ4lW3WJv24xaXmLj0Av0XaCrulExbnlLUl5qKTiX7LdtgMfQF1he
	W/zOPOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H9B-0000000CHAV-0zhz;
	Thu, 17 Sep 2026 18:47:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H99-0000000CH9m-4BlA;
	Thu, 17 Sep 2026 18:47:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD39F416F0;
	Thu, 17 Sep 2026 18:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD311F000FF;
	Thu, 17 Sep 2026 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670867;
	bh=hoi8WX3DCZ2p1aQMAVpPAaAI5VyfQnIrXWk4MAN4EKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BB2+jnctfYN0AwSvguJMW3rc/+2ssfIsJZvSy9ONwsCf0EV6KMZIlUi14Q8y/oTn6
	 cQbVbup8QpNHZetMaqZK1ntYDnPH8p6SZ5L9fA8xMNwJLNjaapa0Rihzie4wzJu3+N
	 l1RMtwHSsfXpZ/hG9kjbl7WeXd5ajCL8cTPqnkTHcOiHQfst/lKK5dgj6FlLPC7lK8
	 dRa5CK/70BRBj5C4TbCdZ3q1bYp24DZeAFSb+nEIT2/mX1DvPCI5NPZWwKKMm83xEn
	 PDCeuR2/b+R+i731sZIjseF4AIo8N5vZwESY0xGf/EWDQ/9gqIzhEdvAYwt1Exav5m
	 VAzHXnneEdBCw==
Date: Thu, 17 Sep 2026 13:47:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl:
 Correctly restrict number of resets
Message-ID: <178967086592.3096341.16943496243275631637.robh@kernel.org>
References: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260812134455.179663-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812134455.179663-4-krzysztof.kozlowski@oss.qualcomm.com>
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


On Wed, 12 Aug 2026 15:44:57 +0200, Krzysztof Kozlowski wrote:
> Add missing upper bound of number of resets for Amlogic DWC3 wrapper
> node, because "minItems" alone does not imply one and any number of
> resets would be allowed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


