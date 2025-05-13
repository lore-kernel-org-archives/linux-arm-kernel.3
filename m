Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DC8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJS9CxnNPpheLNaZ7imhBbfapJj0YpC6MwYgWpp3x9s=; b=HH600hWiMmGeLSVRy53IIkQptL
	18/VCqdosP5Hm5o6LqRKSMbrBbsOmsj2WquhuRmJ/6Dq8vr4a5Oldn3v1ZU2pFuLXLxuHTcQ8O609
	1r0AIMlz5Ceyv8Y/nURiOOLs7oUcF++5WsOkRyQcWh6wjVlIsFmvRyNeNvfG6A+c+bCDQl89hufE6
	LZaOZi/Pk/2HY/69+POOCQUgT7N1bUWUaYwON0mXJFe0xOwUiB+GESu4nXB0hF3pRXSG5rEHLH+hn
	0s6s/Em9NGueuds2qe+dD7hsWgqIHUTnjJdkveSDHCl7pf2t6QyVADQ9V5flqBr+2XtuikbQnIwDe
	BFshLO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErk8-0000000CorX-1FR7;
	Tue, 13 May 2025 15:40:32 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErhT-0000000CoGR-3WbX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747150667; x=1778686667;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KJS9CxnNPpheLNaZ7imhBbfapJj0YpC6MwYgWpp3x9s=;
  b=Or5kjkmFhf07EPPF62zIVopWrqxgMIDf5N2Kc14l3P4PT8vuqANfoi4I
   Ssi56Ni9MzPFb3EnZQaR0ToZ5Capyv04isAUq6BX1j/rskP+pN+E97bFw
   ep1NEgGBA5qyaZ0kE0qzh+WL2DAudAnN9Wrj6YNRSs3igQpZTrA+esCFs
   cM3tCOBdoPWhPxgt3Q8i/+iS6h5kaUZ9g/iLbbGxgFb7gTpO622Y86ELa
   1rw659EfLxe3Panr8CihZi2XwUtMIZUmgtxSykjYa8JpHKifLlAliBL3E
   fYj+4rpGns2F5okx4sNUde7ICIo3FB3yRSrHfNvJkQTMteRVjOUKCHO1X
   Q==;
X-CSE-ConnectionGUID: irKwGYMGTE2318TjCJsHnQ==
X-CSE-MsgGUID: BXWXh5dpQIGK8etu1WtVMg==
X-IronPort-AV: E=Sophos;i="6.15,285,1739833200"; 
   d="scan'208";a="44052047"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 May 2025 17:37:42 +0200
X-CheckPoint: {68236746-13-BF62DDF1-CB8BF55F}
X-MAIL-CPID: 5B6CDACB2F8209EED8054BD55E19D0AC_1
X-Control-Analysis: str=0001.0A006375.68236749.006B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46BD4160AF7;
	Tue, 13 May 2025 17:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747150658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJS9CxnNPpheLNaZ7imhBbfapJj0YpC6MwYgWpp3x9s=;
	b=HFuFRpRT09roncsuKn6WsddpIpCTW8yJlMynj4Wdev+hKN2OyOYgWCbAFjw2h3Ip/1h6I+
	BksszSj8dEdQfTpeHKOl2yQANX2EH2M9zGZUb06HDc6qVwL5kSNXLqIZpovZJUgDhafjMF
	ZCAXh9MuJl3Hhn3ODi3lJCTdO65eQu+S+blHfaSlG1bhfdyx/GHcn/j/sdtbjzqhuOsa+T
	f7Jd5IuqFsw1ZiofwSl237aeBKcYcL341MXH/MBsHQ15PsVa81VdAoaQ1jzUDfSZVGiWnw
	wL7lYzb+62ZZ0j1E1PGnN5+Ctvplw8TJedZ2+129YaR0P9o7fp3nNWSjsLsUvQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow linux,
 code for protocol@81
Date: Tue, 13 May 2025 17:37:36 +0200
Message-ID: <2804473.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250409160029.GE27988@nxa18884-linux>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
 <20250409-heavenly-sceptical-ara-bceeb9@sudeepholla>
 <20250409160029.GE27988@nxa18884-linux>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_083748_357088_DB95DAD2 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Sudeep,

Am Mittwoch, 9. April 2025, 18:00:29 CEST schrieb Peng Fan:
> Hi Sudeep,
>=20
> On Wed, Apr 09, 2025 at 01:31:58PM +0100, Sudeep Holla wrote:
> >On Wed, Apr 09, 2025 at 08:18:29PM +0800, Peng Fan wrote:
> >> + SCMI maintainer, Sudeep and Cristian
> >>=20
> >> On Wed, Apr 09, 2025 at 12:59:50PM +0200, Alexander Stein wrote:
> >> >Hi,
> >> >
> >> >Am Montag, 4. November 2024, 09:56:21 CEST schrieb Alexander Stein:
> >> >> BBM protocol supports a single power button, supported by driver
> >> >> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be ove=
rwritten
> >> >> using linux,code. Add a reference to this schema and add linux,code=
 as a
> >> >> supported property.
> >> >>=20
> >> >> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >> >
> >> >Is there any other feedback or things to do here?
> >>=20
> >> I see Rob already gave R-b.
> >>=20
> >> Not sure this should go through Shawn's or Sudeep's tree.
> >>=20
> >
> >I am fine either way. Peng, just let me know if you want to pick this up.
>=20
> Not my patch :)
>=20
> Since scmi driver changes go through your tree, the binding changes
> should follow same.
>=20
> It would be good that if you could pick it up.=20

A gentle ping.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



