Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA6CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAVZ/6PMd5CIYGP1LffsV13Ct6MPa7aS43NNYUi9Muc=; b=bPAGJcqURh1H2iiO0/3Z0TLQOS
	OiWLH+CSV6rPs9iq/0A+04T6AkpAz0+qabmiW3Wjm+uKypf9BVXsEySYeTbfBoEQr6BjyTtiwsU9d
	072cg2q8l4PSL8nK2N5OmYHBPcGAxozeA1HqvUMmsN7LkDPSl+otrJS1eVLxwucFW8RbsHo4eSbLH
	/hIRvOA2e8u+amcZtLG2D6TalnQPMqHlC7PoRzQafblyujDYYP0ni+CKge1T1Q4zHKXIYOrmjqCGc
	kUriVzTVp7YHca9dkuaAR97s0QyLEUIialQAlYuiK9A1oZxVEGNfF6k6o5FyFnN8Y2WTqei5rjQRb
	Pw2gxm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UCQ-000000075lo-2Awo;
	Wed, 09 Apr 2025 12:06:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UAd-000000075Mv-2h3T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OAVZ/6PMd5CIYGP1LffsV13Ct6MPa7aS43NNYUi9Muc=; b=Do2eW7o21PD63tUeD1m2JPMF3Y
	GA5PJ2TY9XpQdy9chWaHuYljs1HgVw6p5M9TaxjWcsYXPcY68Nmh+BBlqBEFfjV182S1AM0QCVxcE
	Mg97XRoHA317XEdNLGpJRIrwHtQCfQNRRgkRtx6Y8UULja95mNyri9hyyr5XhP3K1DcA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2UAX-008X2W-Vg; Wed, 09 Apr 2025 14:04:37 +0200
Date: Wed, 9 Apr 2025 14:04:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Ng, Boon Khai" <boon.khai.ng@altera.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"Gerlach, Matthew" <matthew.gerlach@altera.com>,
	"Ang, Tien Sung" <tien.sung.ang@altera.com>,
	"Tham, Mun Yew" <mun.yew.tham@altera.com>,
	"G Thomas, Rohan" <rohan.g.thomas@altera.com>
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwxgmac2: Add support for
 HW-accelerated VLAN stripping
Message-ID: <3eb3bb21-eee9-44b6-b680-4c629df29d34@lunn.ch>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-3-boon.khai.ng@altera.com>
 <c65bfe99-a6e1-4485-90ee-aee0b8e0984d@lunn.ch>
 <BN8PR03MB5073B710F5040EAC06595AE2B4B42@BN8PR03MB5073.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN8PR03MB5073B710F5040EAC06595AE2B4B42@BN8PR03MB5073.namprd03.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_050443_681050_1D6211BE 
X-CRM114-Status: GOOD (  14.67  )
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

On Wed, Apr 09, 2025 at 03:12:53AM +0000, Ng, Boon Khai wrote:
> > This appears to be identical to dwmac4_wrback_get_rx_vlan_tci() ?
> > 
> > Can it be moved into the shared code, or am i missing something?
> > 
> >         Andrew
> 
> Hi Andrew thanks for the quick response.
> 
> For the dwmac4 IP it has the following format at the 
> Receive Normal Descriptor 0 (RDES0)
> 
>            31                                                                                                0
>               ------------------------------------- -----------------------------------
> RDES0 |   Inner VLAN TAG [31:16]   | Outer VLAN TAG [31:16   |
>               ------------------------------------- -----------------------------------
> 
> While for dwxgmac2 IP it has the following format at the RDES0
> Depending on the Tunneled Frame bit (TNP)
> 
> For Non-Tunneled Frame (TNP=0)
>            31                                                                                                0
>               ------------------------------------- -----------------------------------
> RDES0 |   Inner VLAN TAG [31:16 ]  | Outer VLAN TAG [31:16]   |
>               ------------------------------------- -----------------------------------
> 
> For Tunneled Frame (TNP=1)
>            31                                        8 7                          3 2                  0
>               -------------------------------- ----------------------- ----------------
> RDES0 |   VNID/VSID                    |    Reserved         | OL2L3         |
>               -------------------------------- ----------------------- ----------------
> 
> While the logic for handling Tunneled Frame and Non-Tunneled
> Frame is not yet implemented in the 
> dwxgmac2_wrback_get_rx_vlan_tci() function, I believe it is
> prudent to maintain separate functions within their respective
> descriptor driver files, (dwxgmac2_descs.c and dwmac4_descs.c)

Please add a comment, or describe this in the commit message.

	Andrew

