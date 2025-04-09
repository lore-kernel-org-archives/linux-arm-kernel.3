Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4BCC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kn75fkqPv9i2aiN1xOdOZGSnE5xqACnS+FveSU5qwDo=; b=ta1dpOzMAe1yRNj2Vh2TfPsbG4
	Ulnnyhx3KmyPAFcWlSBNbCPnQJs+psVBfrR9Ko8UyQeHKgJYvIxPtVEizK0Sj8FpUVKbbYIvvTcB3
	U4e1cn+FiOre6If0PZif8VNFhiEyCEwSsZWrRuoHVrwkkFN9VxC7/+Cc9xm5ZlrvnsLrGwBP5pWJK
	LLLiLSAXSdBGuwlJ9MULGs86PWpi8kJ3HgEIlS6649GyCF0FIBPwAi7s+WIbLKVNMkfgi7upF8eh4
	GOLL3joJppBFsIdhfudEMj2MmKpoYlst0BDPQO0lM2iUrvBm+cKgKpShs3/M1/AEWv+55JbOr6FVb
	SvmmBCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TF8-00000006w9u-1Kmt;
	Wed, 09 Apr 2025 11:05:19 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T9y-00000006vKD-1HYk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744196398; x=1775732398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kn75fkqPv9i2aiN1xOdOZGSnE5xqACnS+FveSU5qwDo=;
  b=V2Z7uA2mAZV2TClqy585B964kToWo7P2fLpTfqpjZJXmA8L6kBnFnADQ
   XjHxU9ohb+imDhm62aDXwnLEnRW5vU24sOIrmxz8NNjwI6qhpPlvuKaq1
   Sh/bmnT6tmDHFLQnYXrXyIJE85EVnRHQLuQ9vXMIKollw4l8O7l8NI58W
   +H2fdny5UFldJx37zx1VRIWlX3A07FUACn705OwWbjUm22PQk802ktkR+
   BuyIcHJCkxdeEeLhyYQQgVJAMnA682B5p1JChf1Xof0Iq1R4JFd+EFE5X
   Bbf9DA/R89u5kayYrPHFvnajNweS9rHCsrCT3C39SQA+FoBIDCakVW16i
   A==;
X-CSE-ConnectionGUID: FaxeuNCfQkWKH7AtI6ab7g==
X-CSE-MsgGUID: 5VwsxvJMQVCKcn0dBh+4hA==
X-IronPort-AV: E=Sophos;i="6.15,200,1739833200"; 
   d="scan'208";a="43426690"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Apr 2025 12:59:56 +0200
X-CheckPoint: {67F6532B-59-7141A0B0-E6EDEC14}
X-MAIL-CPID: C309E74E949F8B32217D51A50BFA7CA5_3
X-Control-Analysis: str=0001.0A006371.67F65329.000F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4609165763;
	Wed,  9 Apr 2025 12:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744196391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kn75fkqPv9i2aiN1xOdOZGSnE5xqACnS+FveSU5qwDo=;
	b=c6yWtWu5ldp40FtgZLvlKrLPY8tZFdZikCLZSAcQjmnId/U1Z42jqJJzy/rq+jP4UqS4Hf
	SLkiGUErbtWr5TQ6KSRVKwv6NjWsBOAx4GrxWkl+HOBqBEk6iYFgIMKQbuzrnhUN44zOqe
	2P4t+3fKlVkeuur7IWfG8M6AjMTT3Ui0rFqoUU6gveNIhFl7l1N0wely8wPDYYE3OrtLVG
	2mrthxPtuqoAv5GNLJwvrjVcFNJiq9dVMVdEZhu5XEfvRDmsXnLig9ktLHjeUh4U/rOyQt
	6x8jvhu+Jsu9eBSbzO0eHVsHZYL+MkisR4MZEBnVRHtvGcE4CQ2Ley5EF7aIbg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow linux,code for
 protocol@81
Date: Wed, 09 Apr 2025 12:59:50 +0200
Message-ID: <2003940.PYKUYFuaPT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_035958_829885_F4F3C841 
X-CRM114-Status: GOOD (  15.29  )
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

Hi,

Am Montag, 4. November 2024, 09:56:21 CEST schrieb Alexander Stein:
> BBM protocol supports a single power button, supported by driver
> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritt=
en
> using linux,code. Add a reference to this schema and add linux,code as a
> supported property.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Is there any other feedback or things to do here?

Thanks
Alexander

> ---
> Changes in v2:
> * Added default value
>=20
>  .../devicetree/bindings/firmware/nxp,imx95-scmi.yaml   | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.ya=
ml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> index 1a95010a546b1..c1b7140ee0098 100644
> --- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> @@ -12,13 +12,19 @@ maintainers:
> =20
>  properties:
>    protocol@81:
> -    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> -    unevaluatedProperties: false
> +    type: object
> +    allOf:
> +      - $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +      - $ref: /schemas/input/input.yaml#
> +    additionalProperties: false
> =20
>      properties:
>        reg:
>          const: 0x81
> =20
> +      linux,code:
> +        default: 116  # KEY_POWER
> +
>    protocol@84:
>      $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
>      unevaluatedProperties: false
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



