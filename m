Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27316C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yolepTUWycUYSP0NNLMuaVmz6Sw1ofQLTuAXR+lN7k=; b=ijp3HijzP4dovsDVlyhc9KAUDA
	x3/+B9NM5fbolxt8qD7MkOfF+hFzJG+ZU/kgpjJNrBR0Vpv95FBv7GhBzaxQTBD3GVlodNE1oDgMg
	EeUi4WoakEmLMDlHwJTvrlzjRSZ3bOQad9r5yhNvDsgScOF22XpnbTbhptdNYfOvR/LsAI5YGSJ0g
	dzD6kEv8GhVC5UpgZMmRpKYEm05jNWHgwu5HAkqlg3YdcrTv6eOsQWZzylMJglb3J9676Pt0RTxSB
	ZZvJhdnrZixvhdjL2pbcO5rqJiIF2Zcc8/4bbgnZDyUfcT64A7MV7jA6Vo6ydFx1U8ZKFnQXLBLEK
	xu8/4L7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRND-00000009IWs-20hF;
	Wed, 12 Mar 2025 19:04:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRLZ-00000009IN2-1i9W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 19:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6yolepTUWycUYSP0NNLMuaVmz6Sw1ofQLTuAXR+lN7k=; b=nOolVWXOwrwm+h38j0+1o0NTme
	Vm2e2oT75glTXLaSsbcjFtGNrDxqQd/zSwatCVx1BTRKCZEehp2GexcuwjMiFozWB2Phvev30ThWa
	qeIXkDD0+XN90q+HCVz3qKY2rarAsVjPHaMz1eNHCu1EJlCqatHjd+S3nJFn4BYrUbz4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tsRLL-004kgf-JU; Wed, 12 Mar 2025 20:02:15 +0100
Date: Wed, 12 Mar 2025 20:02:15 +0100
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
Message-ID: <ce0796f4-cf2e-4a3d-ae79-1f9b9966773e@lunn.ch>
References: <20250312095411.1392379-1-suraj.gupta2@amd.com>
 <20250312095411.1392379-3-suraj.gupta2@amd.com>
 <ad1e81b5-1596-4d94-a0fa-1828d667b7a2@lunn.ch>
 <Z9GWokRDzEYwJmBz@shell.armlinux.org.uk>
 <BL3PR12MB6571795DA783FD05189AD74BC9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
 <34ed11e7-b287-45c6-8ff4-4a5506b79d17@lunn.ch>
 <BL3PR12MB6571540090EE54AC9743E17EC9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
 <fd686050-e794-4b2f-bfb8-3a0769abb506@lunn.ch>
 <BL3PR12MB6571959081FC8DDC5D509560C9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR12MB6571959081FC8DDC5D509560C9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_120229_445314_8F7723B0 
X-CRM114-Status: GOOD (  25.52  )
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

On Wed, Mar 12, 2025 at 04:08:02PM +0000, Gupta, Suraj wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Wednesday, March 12, 2025 9:03 PM
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
> > On Wed, Mar 12, 2025 at 03:06:32PM +0000, Gupta, Suraj wrote:
> > > [AMD Official Use Only - AMD Internal Distribution Only]
> > >
> > > > -----Original Message-----
> > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > Sent: Wednesday, March 12, 2025 8:29 PM
> > > > To: Gupta, Suraj <Suraj.Gupta2@amd.com>
> > > > Cc: Russell King <linux@armlinux.org.uk>; Pandey, Radhey Shyam
> > > > <radhey.shyam.pandey@amd.com>; andrew+netdev@lunn.ch;
> > > > davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> > > > pabeni@redhat.com; robh@kernel.org; krzk+dt@kernel.org;
> > > > conor+dt@kernel.org; Simek, Michal <michal.simek@amd.com>;
> > > > netdev@vger.kernel.org; devicetree@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org; linux-arm- kernel@lists.infradead.org;
> > > > git (AMD-Xilinx) <git@amd.com>; Katakam, Harini
> > > > <harini.katakam@amd.com>
> > > > Subject: Re: [PATCH net-next V2 2/2] net: axienet: Add support for
> > > > 2500base-X only configuration.
> > > >
> > > > Caution: This message originated from an External Source. Use proper
> > > > caution when opening attachments, clicking links, or responding.
> > > >
> > > >
> > > > > > On Wed, Mar 12, 2025 at 02:25:27PM +0100, Andrew Lunn wrote:
> > > > > > > > +   /* AXI 1G/2.5G ethernet IP has following synthesis options:
> > > > > > > > +    * 1) SGMII/1000base-X only.
> > > > > > > > +    * 2) 2500base-X only.
> > > > > > > > +    * 3) Dynamically switching between (1) and (2), and is not
> > > > > > > > +    * implemented in driver.
> > > > > > > > +    */
> > > >
> > > > > - Keeping previous discussion short, identification of (3) depends
> > > > > on how user implements switching logic in FPGA (external GT or RTL
> > > > > logic). AXI 1G/2.5G IP provides only static speed selections and
> > > > > there is no standard register to communicate that to software.
> > > >
> > > > So if anybody has synthesised it as 3) this change will break their system?
> > > >
> > > >         Andrew
> > >
> > > It will just restrict their system to (2)
> >
> > Where as before, it was doing SGMII/1000base-X only. So such systems break?
> >
> >         Andrew
> 

> If the user wants (3), they need to add their custom FPGA logic
> which anyway will require additional driver changes. (3) was not
> completely supported by existing driver.

You say 3) is a synthesis option. Say somebody synthesised it that
way, and found it works for what they need with SGMII/1000base-X.
Because the driver took no notice of the capability bit, that is what
it would do. Since it worked for them, they might not of gone back and
optimised the options. "If it is not broken, don't fix it". So we
could have systems out in the wild, synthesised as 3) happily doing 
SGMII/1000base-X ?

With this change, won't you break those systems?

I'm just trying to get to a definitive answer, is this change actually
safe to all todays possible systems?

	Andrew


