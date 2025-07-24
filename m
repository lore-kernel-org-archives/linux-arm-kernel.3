Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB411C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiOv6C/osTxNoBk72SCJemyk6qpcTT9EtOlEQ172ii0=; b=I6S8xj23hYBmV/OieQHwMfszv1
	rhlBN9aB25K7gosYBPswpA8qCI3lTN1rZJEdk+nztYzMhmBxuDOoRDQycXpusG0XifdNAuOqq7Luz
	kq/HsrS9gOAXI+xVVNlVMswKKQFUuoKE0HNblm+OLXZMGM32ids8tqdyMP/LTFjUS9+Ks0561r7V5
	VR58Q3Kk0/VSo3m6EBTBoYAjbZXtNwci38gKppYY8EhRbFbEpdXtd+pe3Bbsu60D+NC9io80udA8P
	UIhZF4Cd5ECvcTf+wNqizdABJKBFVmZYS0jnfkXNQUnTpIwkmaPiGBiWrlZcnSa6phBZ04HlOAnG1
	9CkrAqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewN2-00000007Z3E-3Xwc;
	Thu, 24 Jul 2025 13:52:29 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uet0y-00000007BXg-3tsj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753352249; x=1784888249;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hiOv6C/osTxNoBk72SCJemyk6qpcTT9EtOlEQ172ii0=;
  b=FCHyjNBRDeGA+ieI4ksKgPACZt1Ulb0jP7WgTgLXEjmGACS6pEwG24qn
   RD7QtQKJTLeExPvpNEJOs7puwe2QQha8FTB6PzB1Rizvj91ieBwlFw71d
   pYXAcmMC3c5fQlYqVNgcF6U9SAmh0u7aCaxwqtJZZR+xOrEfPmmAHS6NV
   WXx3VKxm08gDUBulldj1Rl0/3TrW0fNlVsBkwaNfJSc1BNdaLRQ7dqD5R
   HTlQgDKglZMDRw+VP7NOeZnTplh0DFo/wNpxNJn9141fOzIJDTvtpLF8G
   huG1LtITlpFGCmR7WwXWsSFeBVvP1OSnROaG6Eh6owAGNviUQrVzTJj89
   w==;
X-CSE-ConnectionGUID: UuHEozAeSU+hDFJUEFRMjQ==
X-CSE-MsgGUID: UEqPGTtkSUqZZKPgemzn6w==
X-IronPort-AV: E=Sophos;i="6.16,336,1744063200"; 
   d="scan'208";a="45397445"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Jul 2025 12:17:24 +0200
X-CheckPoint: {68820833-41-FE216C80-D1ADDD01}
X-MAIL-CPID: A07D5907D5C628A30C31B649D2719C0D_4
X-Control-Analysis: str=0001.0A00211B.688207DF.004C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A755416829F;
	Thu, 24 Jul 2025 12:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753352239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hiOv6C/osTxNoBk72SCJemyk6qpcTT9EtOlEQ172ii0=;
	b=C1LqdSyflPIbcD2U9v4RWxYpSFTyQ0p3JRnY1O/JHfae1FTAqA+O+uFGg0GYv4Mo7vF3RS
	2F8VHf71Uqfq49G8djYxfcbV+ow2tsIjsxhXjbPHbkJhBb1J7LOh/qozDYIEcGyam5XKbw
	2LHyBxBAljMFbZ0G6IP1j/GhQFUmVV0ugGO9i1yzBiptQbNuecGejBP/hDm9B0taef2ikw
	R/pOalXQ7/dbdUdgXSIGT47FurwqKiwjtonHR3HfA10BMSl4QthQtSD8UfzZYyYhB3pc4Y
	17WQApXH9KtBg/yYm0WL34Y4eSgxd9qvfc0+U9Zlf52Q+2KAusTJyBbqFF1tpw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: mathieu.poirier@linaro.org, Peng Fan <peng.fan@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..."
 <arm-scmi@vger.kernel.org>,
 "open list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..."
 <imx@lists.linux.dev>,
 "moderated list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..."
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 RESEND] dt-bindings: firmware: imx95-scmi: Allow linux,
 code for protocol@81
Date: Thu, 24 Jul 2025 12:17:17 +0200
Message-ID: <2793923.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250718094723.3680482-1-peng.fan@nxp.com>
References: <20250718094723.3680482-1-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_031729_463846_150681AB 
X-CRM114-Status: GOOD (  16.01  )
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

Am Freitag, 18. Juli 2025, 11:47:22 CEST schrieb Peng Fan:
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> BBM protocol supports a single power button, supported by driver
> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritt=
en
> using linux,code. Add a reference to this schema and add linux,code as a
> supported property.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>=20
> Resend [1].
> I not see a reason that why this patch could block i.MX95 remoteproc supp=
ort[2].
> But to speed up the work, I took Alexander's work and resend it. Hope this
> could catch 6.17
>=20
> [1]https://lore.kernel.org/imx/20250513-whimsical-almond-quoll-e3ad5b@sud=
eepholla/
> [2]https://lore.kernel.org/linux-remoteproc/PAXPR04MB8459A0F330554EB69E99=
0E048850A@PAXPR04MB8459.eurprd04.prod.outlook.com/T/#t

Thanks for resending, I lost track of this patch and though it as applied a=
lready.

Best regards,
Alexander

>=20
>  .../devicetree/bindings/firmware/nxp,imx95-scmi.yaml   | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.ya=
ml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> index 2bda2e0e1369..7a5a02da2719 100644
> --- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> @@ -24,13 +24,19 @@ properties:
>          const: 0x80
> =20
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
>    protocol@82:
>      description:
>        SCMI CPU Protocol which allows an agent to start or stop a CPU. It=
 is
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



