Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E68606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bXAWIAr4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjcIfigc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D5JSFMSkR1MEaF+FBIxO4X1YjnGz0AsOwlhitWTx58w=; b=bXAWIAr4/mcjz/5ltItHTw/Yq3
	HAeZc9ZEAlg4/7lvoyiA00BYRERUZJzpJO6xZh8MOMx8haByYMGDO8PRCNFohRTJWg25zhnVlmL3k
	V6SKjrh0RDGw1Q/Fcpa+op3l7u4JezB/okvOLlir4GSuLzwdbaHHUVBzQS6L1M0Muz07feF9+Pjye
	9plS3A973VYp+02awMNxoDuoQH8roo8tHbpQKjW0vH78sJsVBD/Du2sv5aYPXqDuxt7xGL8m0vyZA
	05WQ/DSA/EtLO8Va9AasDusKIIy0vv1PHCPNHdHWHTt/b4TF9k+/x5DzmsbErha1Mhl8XmDBpGSGt
	tj6h3zBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnUQ-0000000FsXw-0VkP;
	Mon, 02 Nov 2026 08:34:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnUP-0000000FsXl-1F8l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:34:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA15360EDF;
	Mon,  2 Nov 2026 08:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD72B1F000C1;
	Mon,  2 Nov 2026 08:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608440;
	bh=D5JSFMSkR1MEaF+FBIxO4X1YjnGz0AsOwlhitWTx58w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YjcIfigcEay+9mD67vEIw4WuUOPv1d8o2geaAAw3ij6AdOdTKKnFQpYCaUtTcnrZL
	 9BP2uKodggt8ac7X2qSavE8OaTOhAJFsxNC8sW3X45OL6vcpNMyxkvoJQqb1G5xzmL
	 elR9MYPpUUyCiC/r1kLdnSuvjW4aqrGkV/ldoCoY81j8iWVfFiCXEFzUIqYYMKuOYt
	 GACW4TQSWR69smxs8VGJv0FQCDAr0o3t/jKhBbPYjzcsRkvwMAArHPkomnaSAbk68g
	 grsLk0e64iiD883qVyJUdpkWfBn7v6r42BNmTiucvlMxq7tyM0AOeoebVw8uI3pyMf
	 D4yV2bu+mEzNw==
Date: Mon, 2 Nov 2026 09:33:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Krutik Shah <krutikshah@axiado.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Message-ID: <20261102-little-bee-of-shopping-aff1a4@quoll>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
 <20261030-axiado-ax3000-usb-device-controller-v4-1-c5267b36a777@axiado.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-1-c5267b36a777@axiado.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 01:10:09AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the USB device controller integrated into
> the Axiado AX3000 and AX3005 SoCs.
> 
> The controller is based on a Corigine USB 3.1 IP core that is
> dual-role capable (device and host), used here in device role. It
> provides SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, and
> supports control, bulk, interrupt, and isochronous transfer types
> across multiple configurable endpoints.
> 
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  .../devicetree/bindings/usb/axiado,ax3000-udc.yaml | 69 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 77 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


