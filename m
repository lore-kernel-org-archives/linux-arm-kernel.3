Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE2BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzZsOt1cKau/PD5x2aFRuLHCT/wldjQtNk8/+LhsvTM=; b=rHVpqxITOaa0YX
	Mlv17OTPTbFqTK4ybgtuVcw5guQF4iCp6wb4w/eoURGCfM3INRIaedHbHdEiYDe3W1b9AAlDHPYYq
	kPRXN1SIFoWNz3T+kJ30nB+Xx/l97J8YpPXyuHSnWpvDqNf2qLFNW4g66rry1oPCvP7FIGcrq0vgm
	Esd/iR/rv9tyF+ZHZOgF/Kz6gtamhLTXLqwi8HJ7YfDmIyxARIJ/V/B0OPlhX1Yj1rz05fxFoqnx4
	u6ocbT19GjgtJYno84GizOlm0m/BDFFaidaFcB8MpaTs3NAEJVFjrun/uzWK6Ee8iRCW3IfAH7G9S
	6fvu0iEVt4tUY2vze5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TiO-0000000715T-1WvA;
	Wed, 09 Apr 2025 11:35:32 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Tgc-000000070qf-0Ubu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NzZsOt1cKau/PD5x2aFRuLHCT/wldjQtNk8/+LhsvTM=; b=t1frAIOvKlfnlN54/NH0r4j3kL
	g8rpv0hG0SRt5/c0mJaRG+tBKhaYt612ygqrqbtYYoiDrUNTXEWY5rIje+9htCHxxiRNDe25nnSQ4
	qlm5ePCmNRdlbSG3fVw8tw1ehkz1DgyHz4MVPm4iIXlEBv/lPLdZp+jSGu8Ubcn6juGg9+kaiAhgp
	NqnRP4sFTb0XHtbEgjBQnAybyjWsci50AQRBMlBTwcoojCxJCzowdSlCqBGVrHDEQeWaaxtoWlMJB
	PJ8fzkKJh2ifTTHYJmu/MP80nbRLd9wyZv0aAGcVpSYrpNqfaOdEDDAMMU/n1LmXlqlDZDszyz3xV
	JuORocfQ==;
Received: from [122.175.9.182] (port=62615 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u2TgY-000000000Uh-4B1D;
	Wed, 09 Apr 2025 17:03:38 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id AD0DC1782035;
	Wed,  9 Apr 2025 17:03:31 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 8ADBD178245B;
	Wed,  9 Apr 2025 17:03:31 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PiRs0122yNG1; Wed,  9 Apr 2025 17:03:31 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 2FC4B1782035;
	Wed,  9 Apr 2025 17:03:31 +0530 (IST)
Date: Wed, 9 Apr 2025 17:03:30 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: jacob e keller <jacob.e.keller@intel.com>
Message-ID: <190529030.1024806.1744198410980.JavaMail.zimbra@couthit.local>
In-Reply-To: <CO1PR11MB5089CB4D35150C286EE81387D6AA2@CO1PR11MB5089.namprd11.prod.outlook.com>
References: <20250407102528.1048589-1-parvathi@couthit.com> <20250407113714.1050076-6-parvathi@couthit.com> <64a3cd3b-feee-4414-8569-01642b127ac8@lunn.ch> <CO1PR11MB5089CB4D35150C286EE81387D6AA2@CO1PR11MB5089.namprd11.prod.outlook.com>
Subject: Re: [PATCH net-next v4 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ethtool support for ICSSM PRUETH Driver
Thread-Index: AQHbp7GUMpxoQbaZ60qmLD3ok6PwS7OYpSWAgAAYWhDYFQ2Lzg==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_043342_189266_90C111A5 
X-CRM114-Status: UNSURE (   4.85  )
X-CRM114-Notice: Please train this message.
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
Cc: nm <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>, tony@atomide.com, edumazet <edumazet@google.com>, glaroque@baylibre.com, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, ssantosh <ssantosh@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap@infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

>> > +#define PRUETH_MODULE_VERSION "0.2"
>> 
>> > +static void icssm_emac_get_drvinfo(struct net_device *ndev,
>> > +				   struct ethtool_drvinfo *info)
>> > +{
>> > +	strscpy(info->driver, PRUETH_MODULE_DESCRIPTION, sizeof(info-
>> >driver));
>> > +	strscpy(info->version, PRUETH_MODULE_VERSION, sizeof(info->version));
>> 
>> Driver version numbers are pointless, they never change, but the
>> kernel is changing all the time. Leave version blank, and the core
>> will fill in the kernel version, which is useful.
>> 
>>      Andrew
> 
> It is also a long standing policy that in-tree drivers should not have versions
> separate from the kernel version.
> 

Ok. We will leave the version field blank as suggested by Andrew and cleanup version
will be resubmitted shortly.


Thanks and Regards,
Parvathi.


