Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BB7C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W64OfXJBTXrdEHn01dbecqbXkdcTLtQbrrsQRWJQMCY=; b=J2moSnVghtjLeprqCDoc8NgQ2c
	Asp+G22A01ZNKOI05I/XMq/L/u6X1QcPOFPNBrmwwNR8D/OKLPTmzdWSvOw6xIZW4P978UjVDOm+N
	E82O/7Xv6X9Lm+zTFDAlFUa7YbR3wvTpTyrpRxTfg3ujUfBw4eeOdw8ORUcNOXtUlG9xpw331qbor
	swt0Sv8wdrEsEc9Ms6Sp5P3jggu8GXaYeRqOEW2o8dh4vEfMORUtK7h7duCENNdrpYiEgBjWOHZIR
	dkObQOGYTAd+wMLMm/xjVoPwMSnmx+TmkyBrPYPyL4PIjXGxZGqPwnbZx92grttM5CdHXa9lWjRr8
	8l1gw14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E7l-0000000BDNX-2aWk;
	Wed, 09 Sep 2026 08:57:45 +0000
Received: from mail2.dspace.de ([80.228.58.149] helo=mail.dspace.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E7g-0000000BDJK-2Mwg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=dspace.de; i=@dspace.de; q=dns/txt; s=dkim1;
  t=1788944260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W64OfXJBTXrdEHn01dbecqbXkdcTLtQbrrsQRWJQMCY=;
  b=MizYj5PBsBF4gMt1zXuT4svGWYV8uq40o213X6UfCKzLuwDfPBTNjCqC
   ipSfZHMemEg+IhaeELP33Mdow/6Fx3WNwcEzsynoC6z2DPnG1DEZDyrCO
   ZGZmxve6k5K54m2S1lQzNiV9AXe7N+h07dAJjGRf5zeUAWFZxlDLnD4UN
   s=;
X-CSE-ConnectionGUID: lesFjaISRZmDooY3588RlQ==
X-CSE-MsgGUID: WwlpYq3GRcO/083IRCND2A==
X-IronPort-AV: E=Sophos;i="6.25,270,1779141600"; 
   d="scan'208";a="5430986"
Received: from unknown (HELO Z1-1000) ([10.1.1.222])
  by mail.dspace.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2026 10:57:16 +0200
Received: from VM-Z1-1000-LIVE.dspace.de (localhost [127.0.0.1])
	by Z1-1000 (Postfix) with ESMTP id 50DDB60038;
	Wed,  9 Sep 2026 10:57:16 +0200 (CEST)
Received: from exchange.dspace.de (EX-DE-PAD-SE.dspace.de [10.100.196.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by Z1-1000 (Postfix) with ESMTPS id 41CED60036;
	Wed,  9 Sep 2026 10:57:16 +0200 (CEST)
Received: from PascalKW11-NB.dspace.de (10.71.5.241) by EX-DE-PAD-SE.dspace.de
 (10.100.196.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 10:57:15 +0200
From: Pascal Kneuper <PKneuper@dspace.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	0x1207@gmail.com, si.yanteng@linux.dev, larysa.zaremba@intel.com,
	aleksander.lobakin@intel.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	DBaldin@dspace.de
Subject: Re: [PATCH net v2] net: stmmac: restore NET_IP_ALIGN in the RX DMA
 offset
Date: Wed, 9 Sep 2026 10:57:29 +0200 (CEST)
Message-ID: <20260909085731.108922-1-PKneuper@dspace.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <5aeb6fd1-f1c3-426d-a2c4-1ad45ddc8572@bootlin.com>
References: <20260813092923.284285-1-PKneuper@dspace.de>  <20260824125014.47862-1-PKneuper@dspace.de>  <09e7cd4b-b79c-47ea-95b6-1c1a96fe7657@bootlin.com>  <5aeb6fd1-f1c3-426d-a2c4-1ad45ddc8572@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.71.5.241]
X-ClientProxiedBy: EX-DE-PAD-SE.dspace.de (10.100.196.14) To
 EX-DE-PAD-SE.dspace.de (10.100.196.14)
X-C2ProcessedOrg: 563f5800-21cf-4d8d-8aed-fddd1469e4ee
X-TBoneOriginalFrom: Pascal Kneuper <PKneuper@dspace.de>
X-TBoneOriginalTo: Maxime Chevallier <maxime.chevallier@bootlin.com>
X-TBoneOriginalCC: kuba@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, 0x1207@gmail.com, si.yanteng@linux.dev,
	larysa.zaremba@intel.com, aleksander.lobakin@intel.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	DBaldin@dspace.de
X-TBoneDomainSigned: false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015742_860763_CC12F0FD 
X-CRM114-Status: GOOD (  16.94  )
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

On Tue, 08 Sep 2026 22:58:05 +0200, Maxime Chevallier wrote:=0D
> Hi again,=0D
>=0D
> On 9/8/26 10:16, Maxime Chevallier wrote:=0D
> > Hi,=0D
> >=0D
> > On 8/24/26 14:50, Pascal Kneuper wrote:=0D
> >> Since the RX path was converted to zero-copy, the page pool page is ha=
nded=0D
> >> to the stack directly as the skb head, and the offset the DMA engine w=
rites=0D
> >> at is what determines the alignment of the packet headers.=0D
> >>=0D
> >> Before the conversion the payload was copied into an skb obtained from=
=0D
> >> napi_alloc_skb(), which reserves NET_SKB_PAD + NET_IP_ALIGN. The=0D
> >> conversion moved the headroom into stmmac_rx_offset() but did not carr=
y=0D
> >> over NET_IP_ALIGN, so on architectures where NET_IP_ALIGN is 2 the IP=
=0D
> >> header now lands misaligned:=0D
> >>=0D
> >>   64 (NET_SKB_PAD) + 14 (ethernet) + 20 (IP) =3D 98=0D
> >>=0D
> >> Same for the XDP branch:=0D
> >>=0D
> >>   256 (XDP_PACKET_HEADROOM) + 14 (ethernet) + 20 (IP) =3D 290=0D
> >>=0D
> >> On ARM32 this is fatal, because ldm and ldrd trap on unaligned address=
es=0D
> >> even when CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is set.=0D
>=0D
> > This patch breaks the stmmac selftests for Jumbo Frames on dwmac1000 :(=
=0D
> So looks like the problem isn't this patch, but rather both the way we se=
lect=0D
> the bufsize, and the Jumbo test itself :)=0D
>=0D
> This merely surfaces existing problems, I have some fixes that I'll send =
shortly.=0D
>=0D
> Maxime=0D
>=0D
=0D
Great! Thanks for testing and keeping us posted :)=0D
=0D
Best=0D
Pascal=0D

