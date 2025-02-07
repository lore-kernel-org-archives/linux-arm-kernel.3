Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF95C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJM77HZ1UmnRhLojKb2438RKQywcG1lAcAzGFls8E7A=; b=kfOSGE/tbJMh7d1YL4DigIbijQ
	wcgbWqFUxDqpQ3yXWUJYdR5udwA5H0cRi8fIBGZeLIUV7Q6YqFyViJZZsN/qX4oyLXlHsnVlnvbIb
	NvSBQvaYWVrfyvkmssU27qFYkVAmTJn7kGkK2J9TFRf9u0QSaM+hJqrDbUqIhmjmWNi2ViJxDslgT
	OkmneXMfmKaDi8kpCBQEOKTCQFWdqlRVIsh4bQ76f/ZT5ji1cGVdGt2HYx1PQi+yhbG1CbXz3WtTw
	ErXBrS/eJra4auiS9j14Anjh3YetwVtZegkIOpV7JsJ89aHuzW3w6yrVJna3ukz3hk4KyEWR4J4VA
	xzB+cdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUyl-0000000B41B-1L3H;
	Fri, 07 Feb 2025 20:29:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgScD-0000000Aaln-27De
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Feb 2025 17:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wJM77HZ1UmnRhLojKb2438RKQywcG1lAcAzGFls8E7A=; b=E7OKAlPV3wUtB0JJClahGI0CCG
	bntDyFSsiC058VdKURkmPN9KMUungSrW7dcsHDrjZkw10VSbY2mpZbm8FkZVx7TmPG8LvSmSjGxbI
	BMtDG4Hk2nsFgjWZWYIeXjj5M+/COJZ4Vw/8DOLpXta8kRhNF+P4/Lx7uhZ/BS7DFcuEBPzRdIQT0
	OpzJhL5fU7hdSPti4A3g5UzUl1rrb3g5Ab3t3Ib91vPQ6vdhtek6GYzPPDtTbi4MLkpJOhSkWLXjc
	emVCgnSxbx8YWqh1j3pDdUCnrl5BCJCuo1PqZ/Twf0p171QHyrho1mildou1+04bPgRGfFOJBinj4
	quCwTfig==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgScA-0000000HHAD-0wkE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:58:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f4a4fbb35so25674825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 09:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738951084; x=1739555884; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wJM77HZ1UmnRhLojKb2438RKQywcG1lAcAzGFls8E7A=;
        b=dyBziHAgalNWPcm/NvQ3K5XCfCH/jJcdoyFMsJveCOZggLks8KcylILfBLLY3xOJeG
         0Gb40QX3V9EVKYlFoN7CLZGstXcfwIPiCZwX3XHKSFZRva3Yb/XY64iryeR1BZZA2J33
         orHmlWNh9VeqF8kYF9MCr+rGpsOj2gGFvmoNBt8NpSxxbONEjo/Vw9NbimP5fCp9/lBU
         8flIG1Tt1fkMDU4J31SKusTukPV5Nx2XVCHwms9ThbyjRut2iAbvUrJgqrrJ24Nb+a+Q
         zFtA87yov5m0X7AX3jKfMudYb8HCW4ZQIOKtstvJwr5P0QFE7E865z91kEMnQB9JJr/H
         bLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951084; x=1739555884;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJM77HZ1UmnRhLojKb2438RKQywcG1lAcAzGFls8E7A=;
        b=T1ZiXWxsL1tOMQThKt2gZu0Fyh6YxGo5fLF+beeq1ylHlv6E0gmorsYlYtIKLnu7dO
         EAVwv54naSm3eXNKGY1Ha/32iux3vUHoT0guGo0WWDLrkGnFZxF1TqJHkevo/V19ye1H
         3L+V20UD2FSANr4/90OVDxabjiyWKWn2tr7LOEQez0AIUCSkM/ggqgrMpDjJ8oNjLDx3
         3hjnthY+dp6pYAc+gpNmdUvYLaIPRDbascXy1cJQXzaZLB6XmvVQB3JUwbLONHT11mLH
         0+PvU0wu2ko6IjH8/0rf2vtZ8UqsSRCKE5pOT4b6kpG3Dz5THCXQZ+svfyW+uszl4n0T
         23kg==
X-Forwarded-Encrypted: i=1; AJvYcCXEAS5pu3QJMN44Br2ojekc0yeaXTBSTqHm85P6XVuo9buFMnHnqPcJDhiiE7hF6s2CQdYZgDNenpXKiNJ53oFY@lists.infradead.org
X-Gm-Message-State: AOJu0YxSRg1XEu7FPglUb3QHpVwgXZ4Hg2iLknhBXCgZak1/bUNllpFD
	S8vD4hYaT1HeY5BKiVbVjH3J1RXHscfB+tCMxUABMnadtbdxgvF0W6Z85dMu6g==
X-Gm-Gg: ASbGncvKQuiYKOxIvbHuP+HH6yMoP6KuG/rDXHLUG0/UUn5Y6BfepHUkivOHSAJdKf0
	bJXFK0jGBbzW9sRJesJPZ6Rus6GEwz6O5Bb94JkZSa7VFAdKW24vcaTBOvyVF+D2YKomj4+7mk3
	9RqM4ayXOPF2lSJTFJZZo0meHdnZ4222YPlS08BdWWXaxzjyk/U/kO/zEHHA751OUSvxi1KU4ZC
	is62sRftZfI+f9rgAMF80PnbGe45IyMM/nJeYzoJH4Yk/sBuvb1HoysxH0Jgi8yikfos8BX6rOG
	ko7NFnRsQbNbN5/H9VPIype3ew==
X-Google-Smtp-Source: AGHT+IHJs/XZ6CiTFau0hB0u90Lhs4NJaZOV00tEkIwNjsA+gYtKS4ULQ+Eo/VyD0QJD/a9Hbkubyg==
X-Received: by 2002:a17:902:d4c9:b0:21f:3352:8f64 with SMTP id d9443c01a7336-21f50158c3emr64628165ad.26.1738951084262;
        Fri, 07 Feb 2025 09:58:04 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368cd38esm33196655ad.240.2025.02.07.09.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:58:03 -0800 (PST)
Date: Fri, 7 Feb 2025 23:27:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Wilson Ding <dingwei@marvell.com>, cassel@kernel.org
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanghoon Lee <salee@marvell.com>
Subject: Re: [PATCH 1/1] PCI: armada8k: Add link-down handle
Message-ID: <20250207175759.jzmoox5mke3rachy@thinkpad>
References: <20241112213255.GA1861331@bhelgaas>
 <AD287CCE-9FFE-49BC-B9CA-B5CED4F05AF1@linaro.org>
 <BY3PR18MB46737FB5FDBD75CF31B505B8A7EB2@BY3PR18MB4673.namprd18.prod.outlook.com>
 <BY3PR18MB4673207A36B2CD7C3B75EBA0A7EB2@BY3PR18MB4673.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY3PR18MB4673207A36B2CD7C3B75EBA0A7EB2@BY3PR18MB4673.namprd18.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_175806_510741_44FCBDF0 
X-CRM114-Status: GOOD (  38.39  )
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

+ Niklas (who was interested in link down handling)

On Sat, Feb 01, 2025 at 11:05:56PM +0000, Wilson Ding wrote:
> > On November 13, 2024 3:02:55 AM GMT+05:30, Bjorn Helgaas
> > <mailto:helgaas@kernel.org> wrote:
> > >In subject:
> > >
> > >  PCI: armada8k: Add link-down handling
> > >
> > >On Mon, Nov 11, 2024 at 10:48:13PM -0800, Jenishkumar Maheshbhai
> > Patel wrote:
> > >> In PCIE ISR routine caused by RST_LINK_DOWN we schedule work to
> > >> handle the link-down procedure.
> > >> Link-down procedure will:
> > >> 1. Remove PCIe bus
> > >> 2. Reset the MAC
> > >> 3. Reconfigure link back up
> > >> 4. Rescan PCIe bus
> > >
> > >s/PCIE/PCIe/
> > >
> > >Rewrap to fill 75 columns.
> > >
> > >I assume this basically removes a Root Port (and the hierarchy below
> > >it) if the link goes down, and then resets the MAC and tries to bring
> > >up the link and enumerate the hierarchy again.
> > >
> > >No other drivers do this, so why does armada8k need it?  Is this to
> > >work around some unreliable link?
> > 
> > Certainly Qcom IPs have this same feature and I was also looking to implement
> > it. But the link down should not be handled by this in the controller driver.
> > 
> > Instead, it should be tied to bus reset in the core and the reset should be done
> > through a callback implemented in the controller drivers. This way, the reset
> > cannot happen in the back of PCI core and client drivers.
> > 
> > That said, the Link down IRQ received by this driver should also be propagated
> > back to the PCI core and the core should then call the callback to reset the bus
> > that I mentioned above.
> > 
> 
> It's more than a work-around for the unreliable link. A few customers may have
> such application - independent power supply to the device with dedicated reset
> GPIO to #PRST. In this way, the power cycle and warm reset of RC and EP won't
> have impact on each other. However, it may lead into the PCI driver not aware
> of the link down when an unexpected power down or reset occurs on the device.
> We cannot assume the link will be recovered soon. The worse thing is the driver
> may continue access to the device, which may hang the bus. Since the device
> is no longer present on the bus, it's better to remove it. Besides, in order to bring
> up the link, the only way is to reset the MAC, which starts over the state machine
> of LTSSM.
> 
> Well, we also noticed that there is no other driver that did this. I agree it is not
> necessary if the power cycle or warm reset of the device is done gracefully. The
> user can remove the device prior to the power cycle/reset.  And do the rescan
> after the link is recovered. However, the unexpected power down is still possible.
> Please enlighten me if there is any better approach to handle such unexpected
> link down.
> 

There is no issue in retraining the link. My concern is that, the retrain should
not happen autonomously in the controller driver. PCI core should be made
informed of it. More below.

> In the meanwhile, I am quite interested the callback implementation suggested
> by Mani. But I am sure if we have such infrastructure right there. Mani, could
> you please elaborate a bit more, or is there any examples in the existing code
> and patches.
> 

There is no such implementation available right now. This idea is on my mind for
quite some time, but never had time to do it. Maybe this gives me motivation to
do so.

Niklas: Did you get a chance to look into this? Else, let me know. I'll take a
stab at it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

