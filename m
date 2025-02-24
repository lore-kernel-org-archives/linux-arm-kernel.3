Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F49C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vgPCjuI1eJZYbLDfgbr1Uw7fIRlLSv275jSMkiMWms=; b=RV451jsqckQoO1pukEib6XrJnn
	Nj2UUBv+4OXuY2riCLrWPPCgLTnZMHseY+aS9mRBVsa49L1CjEYgUABIOxR4zpV1ddlWAFtxpFOaS
	7Lyb2oAT/Vqy9UAr7sDkd9NiOT0DiLMaGvsDi4CI6V7qLdNqV+T6FdTH9cgY6Wge9y2ZHo/9NQxEF
	J6EyM0Z3PaVQgT2JZ+Mn8KlXBUfBDgu98lQOWLmslK97KTn4fTW72h/O/xZKhMZoVa8KnbE/+zYYq
	+EQ7DsNrc1WFgDsxakRzEa8w/rgQ09Oly5bNPFF9MWmXtO+/KEJZAthNOG7SVjfshswzeT8y07vr2
	tqg/Piyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaGJ-0000000EGS9-03Up;
	Mon, 24 Feb 2025 15:20:51 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZxy-0000000ECpe-12Rs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 15:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740409314; x=1771945314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0vgPCjuI1eJZYbLDfgbr1Uw7fIRlLSv275jSMkiMWms=;
  b=QLAqC2N6HNT2/nOPJw8O+Iuo3lVuuvz1qZ4AmOZ58e0hQ2v1Q1ZThiab
   557s6g8EQ1bfM8M2oOIG8eQIrLe8tz9o5oN5eyGmCDAY8T9b4nYYEzp0k
   GYJThY6ezDFPjxTiT3x5HS4y75SdcpemljAIV9zES/aLEI8/MAm3E2Hl5
   ZDmBBQwChY/WQJTYepkEGhHT4xK3Dl7iiKCRCNAQQvBKXWHV5ReOVhGbc
   V/6phe130y9iBb+unwk8v1pEAIqHWgSGImI/Vuv96ZZudTeV8f6gEgsQf
   DzKCjpIwR4CQps2fNK8/R+rTO3KhlO3J7qa2lC0WkNaiZ6ZRnIdh3k+is
   Q==;
X-CSE-ConnectionGUID: 5dJT9lkORb2bXGaN9wqrRQ==
X-CSE-MsgGUID: 3M5nagRHQgO5oBudA1DgGQ==
X-IronPort-AV: E=Sophos;i="6.13,309,1732575600"; 
   d="scan'208";a="42043119"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Feb 2025 16:01:52 +0100
X-CheckPoint: {67BC89E0-16-6E0A4539-DBC44C3A}
X-MAIL-CPID: DF92074B598E4880E8D6D2A2DC4D7C0A_1
X-Control-Analysis: str=0001.0A00211E.67BC89DF.0016,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69A1416798B;
	Mon, 24 Feb 2025 16:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740409308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vgPCjuI1eJZYbLDfgbr1Uw7fIRlLSv275jSMkiMWms=;
	b=Yhkf86HymiAEhVU5Mhl2xNo9I/xdvDYPOkBZ4PLhphiNHfstietFbhe4efwDFjXVTm1rRS
	cP1Rsi3BPwN2UiOdkcvd2nJOLAqgxnFiDOlxkTha5kWUSUSqcezqeYQVt9og3zj7WG+yO7
	fLI442EWMXjTKkyZfqWINo1/moo66uUHgqEMdjk1/vKz3wd9I9AXca+jtZhrbJdWd5fCij
	My3WeokGvW/Qrlo2L1Uj8kESlWqB+XK4wnj5iD40639KTwMPr6d2UtBhLYJhTF7+fTInRO
	XwgfNHNxuXqsm1e670IIOADYQ3aQV+/U8zee74frAx8elptzxeJfNDh7zLc1+g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: mba8mx: change sound card model name
Date: Mon, 24 Feb 2025 16:01:46 +0100
Message-ID: <6132446.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z7mUU/Rgj3Gx7g9E@dragon>
References: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
 <20250120132503.556547-5-alexander.stein@ew.tq-group.com>
 <Z7mUU/Rgj3Gx7g9E@dragon>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_070154_659528_6298EE35 
X-CRM114-Status: GOOD (  16.33  )
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

Hi Shawn,

Am Samstag, 22. Februar 2025, 10:09:39 CET schrieb Shawn Guo:
> On Mon, Jan 20, 2025 at 02:25:02PM +0100, Alexander Stein wrote:
> > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >=20
> > The card name for ALSA is generated from the model name string and
> > is limited to 16 characters. Use a shorter name to prevent cutting the
> > name.
> >=20
> > Since nearly all starter kit mainboards for i.MX based SoM by TQ-Systems
> > use the same codec with the same routing on board it is a good idea to
> > use the same mode name for the sound card. This allows sharing a default
> > asound.conf in BSP over all the kits.
> >=20
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> I may have missed some prerequisite ones, but #4 and #5 do not apply for
> me.

Thanks for pointing out. A local commit was silently introduced as dependen=
cy.
I removed it and pushed a v2 while also fixing a typo in the commit message
'mode' -> 'model'

Thanks
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



