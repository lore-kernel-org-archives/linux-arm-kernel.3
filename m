Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C78C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPz+pRNv6M2Bl3l0XU+3yKO/cuTqG+5OunpOwazZoio=; b=e9Tam1duH0XL1Ztv6lLS8tYvA5
	0exvKZx3p4W9xnOXRDA53R3wboHP1VNy7Qpn9AptmQZlpS5mPGDRq0pjZzsW6tmG4xgv85gmjWeNl
	qxSAo0pn2Fh+XaX9JhfL47d9dPlG2pMiYhJycnM5/+uJ18cM4lLWwrJ/0pidoW7Rey4QiliDVZb4z
	T2YOEbBzD5ocsuv35+8ojY2DouEJUFgyIhBjICaskAMIy/4KXlnKQSZ+Tf8XdG5HqpFP/YEJBJs3G
	sO5YmQuRMtkGAkZPIgfa84pG7LNPse1OPBoWlno4/A32LtO8LMHttoohBVQ58MFCCJ05cqZ9b5RK9
	9gJsp1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRi4-00000000IHX-1xtB;
	Thu, 13 Aug 2026 09:26:48 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRi1-00000000IH2-1miJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=IPz+pRNv6M2Bl3l0XU+3yKO/cuTqG+5OunpOwazZoio=; b=nKP72OPTQMRqcB57kmWSrGWTPj
	esmryEFUibscPV2WL4LQE/LUfZ7EGKiutgMKBrrTAw5Pq3Uc8DXXtwU79wtvhDpTm1AA/nnzyw/RE
	1qNnrFopYMghltvOCStmG6zSNtEts0rTgQXJtWJICX88j4x0JJt9Cao1vKCerX8ilg7PVrjDlqs6B
	3Y5xoCiRLZ75fZWuKzkUE0an5ELxFy1MgnIYvk1CwTA9oWDP3JbCFVZ8VzIbsbS/Fr8cBq0enY7QK
	i904iLYNM0Gv0aQ7CXWk6fUBbSX8pjk5tiIhU1Q5ajJ2wPMXxXJR3dd9SJg805E52gv57qEfwGwLX
	Us7ErV7g==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuROI-000EhZ-0C;
	Thu, 13 Aug 2026 11:06:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuROH-000CPn-1b;
	Thu, 13 Aug 2026 11:06:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Francesco Dolcini <francesco@dolcini.it>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Thu, 13 Aug 2026 11:06:20 +0200
Message-ID: <4870648.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <cf1e1514-fb92-46cd-95a3-9c857bf08f66@kernel.org>
References: <20260812132954.148571-1-francesco@dolcini.it> <7661119.LvFx2qVVIh@steina-w>
 <cf1e1514-fb92-46cd-95a3-9c857bf08f66@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_022645_571952_158FE859 
X-CRM114-Status: GOOD (  21.56  )
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

Am Donnerstag, 13. August 2026, 11:03:06 CEST schrieb Krzysztof Kozlowski:
> On 13/08/2026 10:56, Alexander Stein wrote:
> > Am Donnerstag, 13. August 2026, 10:34:02 CEST schrieb Francesco Dolcini:
> >> On Thu, Aug 13, 2026 at 10:10:43AM +0200, Krzysztof Kozlowski wrote:
> >>> On Wed, Aug 12, 2026 at 03:29:49PM +0200, Francesco Dolcini wrote:
> >>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >>>>
> >>>> The DPI output of the LCD interface can be configured with a bus wid=
th
> >>>> of 16, 18, or 24 bits. Introduce a bus-width property to the output
> >>>> endpoint, specifying the number of parallel RGB bits connected.
> >>>>
> >>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> >>>> ---
> >>>> v3: use video-interfaces.yaml
> >>>> v2: use the common bus-width property instead of the legacy interfac=
e-pix-fmt
> >>>> ---
> >>>>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 ++++++=
+++
> >>>>  1 file changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yam=
l b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >>>> index 2dd0411ec651..1f3daf002707 100644
> >>>> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >>>> @@ -71,6 +71,15 @@ properties:
> >>>>      $ref: /schemas/graph.yaml#/properties/port
> >>>>      description: The LCDIF output port
> >>>> =20
> >>>> +    properties:
> >>>> +      endpoint:
> >>>> +        $ref: /schemas/media/video-interfaces.yaml
> >>>
> >>> This won't work, you need to test your DTS. The port schema does not
> >>> allow video-interfaces properties. You need port-base, like in every
> >>> other case.
> >>
> >> Thanks for the review Krzysztof
> >>
> >> Given my testing was not ok, and I am not sure what I did wrong exactly
> >> on my tests, is this the change I should do?
>=20
> Yes
>=20
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml =
b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >> index 1f3daf002707..89cea0c14cf1 100644
> >> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >> @@ -68,7 +68,8 @@ properties:
> >>      maxItems: 1
> >> =20
> >>    port:
> >> -    $ref: /schemas/graph.yaml#/properties/port
> >> +    $ref: /schemas/graph.yaml#/$defs/port-base
> >> +    unevaluatedProperties: false
> >>      description: The LCDIF output port
> >=20
> > With that change:
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Please do not. Build testing is not testing (in the meaning of
> "Tested-by" tag), otherwise where is Rob's tested-by tag for all the
> patches he build tested?

Well, I tested this on actual hardware, see patch 2. But then this
is irrelevant for for dt-bindings. So let's go with:
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



