Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F43DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iH9GHclLADxHaK7lGmwG60TMy/tMBW1Zzi6F7hap/Yg=; b=WEfZpNx9EdJ7QWxMSSzsnqhD14
	C7hepYKsmnS1z1A/TBR7NX10L+nJ3m2U4ofZbxNjhRv9wvmCQXAaBc6JMaZJIrr8v4aLyPdXVMeoh
	OL0HIdXTVoIVrIBeYP5OWa9WnXE1nGnqbsQP9aew4CTqpZtkiCNsoDWYF3hS7aeRvDhumVh4dGhD6
	Zh8PKEyvyOUEfsyrJ79puUOsoJNc644kU5HkuQmqPxxlWX4sYyWAoa4WLhnZ2nCS7R6DJa1ZWPY/O
	C6wL5mf80VCFpahJnCJjvrSt/VzIUc3HeXtThjXsy/Ec8OWacT2y5z1iMMePpJiZa15GCrdcgka0l
	K2ysT64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO7b-00000008t10-3yCg;
	Wed, 12 Mar 2025 15:35:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO50-00000008sYB-0q6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 15:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iH9GHclLADxHaK7lGmwG60TMy/tMBW1Zzi6F7hap/Yg=; b=ArIpD8PkcXyPglBLUs0D4cNd6j
	5eeOs7YBGX8A63fnnpdRkt8C1TR29b8uSR7GDvR1N4MR11R+lDJMYhOvoz9ZjHJeXgLdl/AW5N982
	qtaO8XKx3nkPfNng4WAUcTWZGPK76teiIDpbBuyEMHSvas6vUIzYwsBBzqTSowVgSqkE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tsO4q-004hkE-KU; Wed, 12 Mar 2025 16:33:00 +0100
Date: Wed, 12 Mar 2025 16:33:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
Cc: Russell King <linux@armlinux.org.uk>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Simek, Michal" <michal.simek@amd.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH net-next V2 2/2] net: axienet: Add support for 2500base-X
 only configuration.
Message-ID: <fd686050-e794-4b2f-bfb8-3a0769abb506@lunn.ch>
References: <20250312095411.1392379-1-suraj.gupta2@amd.com>
 <20250312095411.1392379-3-suraj.gupta2@amd.com>
 <ad1e81b5-1596-4d94-a0fa-1828d667b7a2@lunn.ch>
 <Z9GWokRDzEYwJmBz@shell.armlinux.org.uk>
 <BL3PR12MB6571795DA783FD05189AD74BC9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
 <34ed11e7-b287-45c6-8ff4-4a5506b79d17@lunn.ch>
 <BL3PR12MB6571540090EE54AC9743E17EC9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR12MB6571540090EE54AC9743E17EC9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_083310_235070_12CF7D2D 
X-CRM114-Status: GOOD (  19.22  )
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

On Wed, Mar 12, 2025 at 03:06:32PM +0000, Gupta, Suraj wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Wednesday, March 12, 2025 8:29 PM
> > To: Gupta, Suraj <Suraj.Gupta2@amd.com>
> > Cc: Russell King <linux@armlinux.org.uk>; Pandey, Radhey Shyam
> > <radhey.shyam.pandey@amd.com>; andrew+netdev@lunn.ch;
> > davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> > pabeni@redhat.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > Simek, Michal <michal.simek@amd.com>; netdev@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; git (AMD-Xilinx) <git@amd.com>; Katakam, Harini
> > <harini.katakam@amd.com>
> > Subject: Re: [PATCH net-next V2 2/2] net: axienet: Add support for 2500base-X only
> > configuration.
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > > > On Wed, Mar 12, 2025 at 02:25:27PM +0100, Andrew Lunn wrote:
> > > > > > +   /* AXI 1G/2.5G ethernet IP has following synthesis options:
> > > > > > +    * 1) SGMII/1000base-X only.
> > > > > > +    * 2) 2500base-X only.
> > > > > > +    * 3) Dynamically switching between (1) and (2), and is not
> > > > > > +    * implemented in driver.
> > > > > > +    */
> >
> > > - Keeping previous discussion short, identification of (3) depends on
> > > how user implements switching logic in FPGA (external GT or RTL
> > > logic). AXI 1G/2.5G IP provides only static speed selections and there
> > > is no standard register to communicate that to software.
> >
> > So if anybody has synthesised it as 3) this change will break their system?
> >
> >         Andrew
> 
> It will just restrict their system to (2)

Where as before, it was doing SGMII/1000base-X only. So such systems
break?

	Andrew

