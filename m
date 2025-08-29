Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7970AC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhSoS2gcwCfK6pxd7ltatSsRlXZ3B4ZnEmWhPcw3nIA=; b=cbZn5DT6Z+W7ezDWfamnk+1nht
	DpmfaaTfUzCU14oiZx2axFvQ/D09/ECQDfq6CToMrdcG1El2FLTqNrPnjpJh/2DdcMd4ubsZHrPOD
	JbL3hL57Xd02wT7DxzeuzihJYpshr6IDGt/KY4ipd2oJzQb9krgehEVOcjgBJ24n/oRv0HrX7GTo6
	5mUIUOMQ7COQqjM8+8RA8GRrIBx2Ba2aTkbsexeR6yJ+KU+8GnyqX3IGCFpqabf2HLLBWfAJRx1hj
	PIeyMzES5vokS+PO9cg0CRcebT1i32VoUtxp1CB6XlaIlrbcY8A3+ksqMb89OwwI4vlaxN8S7Xped
	2f+26uVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursPP-00000004cAu-1j5o;
	Fri, 29 Aug 2025 06:16:23 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursGA-00000004arP-24MZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 06:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756447610; x=1787983610;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yhSoS2gcwCfK6pxd7ltatSsRlXZ3B4ZnEmWhPcw3nIA=;
  b=B+Nk02266O9uzdZkt4m0DFJcjMXfRV6ns+I8/AAPL++vSAxP2QSG4M1c
   kYLConloQmkfe8YFvTNWnF3MSSfLk6bYiFoUHE264f9nVBRKzmSBZurGq
   od0BFiy8Li2I8LVxVHOjdVWrdfK4byY8XYkB+hqmh+WnY6hj4Fql9oWZn
   pJze+PvC2QXolm0GkXxt3+eV1wNX+kR0EQEBZ89dDB3f1cXEXiddoYpyO
   p2+4l4UaZMknF45W5Oy4RQewXjmnWIji3ChFdTKVDeiIuYv9AHBVqmYVg
   HFCXWDiHxh46SmeznpraFb6As0EWzKn9Xm0PTZ92mnerKhQOKqAcQpNXU
   g==;
X-CSE-ConnectionGUID: Vx6WPkHrTJSNijI9O2t94w==
X-CSE-MsgGUID: sWq7ec2xRmqgqmY0djflPg==
X-IronPort-AV: E=Sophos;i="6.18,221,1751234400"; 
   d="scan'208";a="45969065"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Aug 2025 08:06:44 +0200
X-CheckPoint: {68B14373-29-299FBAB0-EF52EDE7}
X-MAIL-CPID: 9E8933FFEF0FDFBC4AA31CA6DAD71FDA_5
X-Control-Analysis: str=0001.0A002121.68B14308.005F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D34CC169B29;
	Fri, 29 Aug 2025 08:06:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756447599;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=yhSoS2gcwCfK6pxd7ltatSsRlXZ3B4ZnEmWhPcw3nIA=;
	b=BnAmXJvT6pIpazDfP4tZLf4m0fzPhp0SQXYsg1a3Pl2D8tdLNl1AMcHdJtUiXpGzgha7Ih
	in1Cc5Y3Yy2h1rhRffhLOTn9mIsAxuqcUTaSD3fxLXfN6bQivBzNWILv8ANGvXHaYwx2Lx
	BkeRS48++WZ7DqDHKUJJDWZcadWauIJudHWhhOYkFNbULhnChu/DHVXKclXbrLSo41AHXi
	+eLeLA4EOWEf4o/37km2aKDJWG46f5FFzwQmLFfdFbb+4I1NuekKxDJGWuERlj4NTy5ETb
	5cSfHD47omfor0Vx1BRsrbS4G4LpnP9Miq67c1wv1EOm5u4eCnQT2AalSw9Rpg==
Message-ID: <47a8152b-85cf-44d9-b94e-29e3f462d507@ew.tq-group.com>
Date: Fri, 29 Aug 2025 08:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add TQMa91xxLA SOM
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
References: <20250828094745.3733533-1-alexander.stein@ew.tq-group.com>
 <20250828094745.3733533-2-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <20250828094745.3733533-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_230651_017592_75E3C43A 
X-CRM114-Status: GOOD (  18.01  )
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

Hello Alexander,

Am 28.08.25 um 11:47 schrieb Alexander Stein:
> TQMa91xxLA is a SOM variant in the TQ-Systems GmbH TQMa91xx series using
> NXP i.MX91 CPU on an LGA type board.
> MBa91xxCA is a starterkit base board for TQMa91xxLA on an adapter board.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---


Your commit is for TQMa91xxCA and TQMa91xxLA.
However, the commit message only specifies TQMa91xxLA.
The TQMa91xxCA is missing from the commit subject and message.


>   Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index ebafa6ecbcb64..0843c5e9275be 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1433,6 +1433,24 @@ properties:
>                 - fsl,imxrt1170-evk         # i.MXRT1170 EVK Board
>             - const: fsl,imxrt1170
>   
> +      - description:
> +          TQMa91xxLA and TQMa91xxCA are two series of feature compatible SOM
> +          using NXP i.MX91 SOC in 11x11 mm package.
> +          TQMa91xxLA is designed to be soldered on different carrier boards.
> +          TQMa91xxCA is a compatible variant using board to board connectors.
> +          All SOM and CPU variants use the same device tree hence only one
> +          compatible is needed. Bootloader disables all features not present
> +          in the assembled SOC.
> +          MBa91xxCA mainboard can be used as starterkit for the SOM
> +          soldered on an adapter board or for the connector variant
> +          MBa91xxLA mainboard is a single board computer using the solderable
> +          SOM variant
> +        items:
> +          - enum:
> +              - tq,imx91-tqma9131-mba91xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa91xxCA
> +          - const: tq,imx91-tqma9131        # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM
> +          - const: fsl,imx91
> +
>         - description:
>             TQMa93xxLA and TQMa93xxCA are two series of feature compatible SOM
>             using NXP i.MX93 SOC in 11x11 mm package.

Best regards,
Max

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


