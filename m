Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90287C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BX16TfDwmJeuNsVzAioGXDE8NBNHgG/KwWmvHJtVfv4=; b=vmc7zrglWVW8yxZu9WWuo97e9D
	aMWIcxkStUA1SRkddikzIHdneGJv7pEhdloO2RtPLtIvqMp1Pn9Qh9mNCDqAJHFxqORUgkcom9YCK
	g+PdjL3iLJvcvMEMZa2J8Mre7cl+xtDUi2RtBRcAWoY46ueuOaidmdySFwMYFzvumlncjcZdqQPuq
	UPajHvEMX4PGIfUNYzmzkiSzSfiISISYYDhoQGAsANndBSDlqRh3EkWU/T/MtE5XdDtCKg9aZDon5
	hHqpl/+YL25EWy9QkUej6A6NEIM9TxEy4RQFLziU0zluMKXhZJH+dEXy2vpvNuMqYtd6ciKttJkxk
	RbUWae4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwQQ-00000000Dlc-2KGS;
	Fri, 30 May 2025 09:53:18 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwMI-00000000D7k-1FU0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:49:03 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4e45dae6c8cso1263887137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 02:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748598540; x=1749203340; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BX16TfDwmJeuNsVzAioGXDE8NBNHgG/KwWmvHJtVfv4=;
        b=xeS3NO5w6jZw26+owFhkBlR6Wh2JkS4M+7KYP4cqR2/FKMjod/r8mkb9kUo8B80rtm
         7k9c6ZjlbQsNsHk9lkn9nlTobBfg+Pyeozzyl3kUQPCWSpcACrcxWH4vlv8G/2VuD7FS
         TyMC9sT5zVrSqChTPJ93Jxo44bl+dPSmY9X+vUtyO1/0Q1/4geJce0JgRdjOmFPMTt2F
         T7CR040Us1i15LiW2lEKa5hIGLtRT1VXx71+rL26s8MoGI8folO2F2+FlP3qNNxYDn3q
         lxqwCNO95msE97FAbV+4yXGLiOEFT/qm+Hv3T7vRuDmAbiOIdaQRXKre4ca0Zsppx8ob
         bhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598540; x=1749203340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BX16TfDwmJeuNsVzAioGXDE8NBNHgG/KwWmvHJtVfv4=;
        b=IVXaVBv7E4JhzrVOnngc30FESZ3pcAxAs/gPsJqdMRseRFpDPPkqeGCXRWXD4DLeDf
         OkXqrz4iuc6VHKL2s5G5SMkFpM+xCY/O3j/mi0sQU8mMiUWPoM5Zo1I+AgEdPMrMGlRy
         6aRj/q68uVYa1e2KrvCJKsjcuYceWleu1b4LcfmCTPKwwWcSYuctBj4SRnQLh6ljhMOz
         zU7A04BYXrKo3xwU5FqJvhasXORR0MwaJx88v9laWXoLSNy02zla6F7hXDEmv0qLd9J7
         BYL+ktKvWW8mdI0bXzEhyoI9987Cvu7EufEulO9Y6p8BwNFYNT1ECfNIb8awkpLWCm56
         tj6g==
X-Gm-Message-State: AOJu0YxkAs/kLrGvGcNaw0DRkcqWwXpqeM1puVl5McBGmUCJ2mZMXwHV
	btumlPOHv5NcADZ200HiDljWoPsaZmiue18bnfaTy3Kb+l61fCdeDzzl3qvXkLWrA6sLe3B/cnt
	aLEkMNDRjn+RQG1z7OBi2pUi12yGs3oHjRSa6Wos+XBwFxd/B4hogHn8=
X-Gm-Gg: ASbGncv72A8QQpn1K35J8ei15hWeV+R5minVaHyKUdgNlWwgz0iPAch482Fo5yHvtgI
	ce1MUMLPIO6Vf2dcL4V7VjfwBVNFUrD729NhWOvioCG6EB6KASBBFX0WZia8J3frqoOg8oeaATM
	i2jtym+WF9OiwqTqz+r4cXnJlWUYoBDJcrAwuHyTq6/xCH
X-Google-Smtp-Source: AGHT+IFCDzCsC18lIEI9eoPRpN1VBwQuWtrYeQzK5FfBQTEKVxOjXzBK+FhiElxrVAbMsJjHyUqfWwTNH+a+X8F2fyY=
X-Received: by 2002:a05:6102:4b08:b0:4e5:8eb6:e8dd with SMTP id
 ada2fe7eead31-4e6e40d655dmr2670174137.5.1748598540530; Fri, 30 May 2025
 02:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYt0F_vR-zOV4P8m4HTv6AecT-eEnrL+t5wgAaKPodi0mQ@mail.gmail.com>
 <6e0ef5cc-b692-4d39-bec4-a75c1af3f0aa@arm.com> <CA+G9fYs_nUN2x8fFJ0cfudHWbCOLSJK=OhEK0Efd1ifcjq_LRg@mail.gmail.com>
 <5a277d1d-c7b1-430c-a463-1e307a2823f6@arm.com> <03e6283e-2ef7-498c-9460-8411114711e2@arm.com>
 <e6db6396-cb1e-4e24-8fd0-3cce388a3913@arm.com>
In-Reply-To: <e6db6396-cb1e-4e24-8fd0-3cce388a3913@arm.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 30 May 2025 15:18:49 +0530
X-Gm-Features: AX0GCFuc1bDuO-IvLHLzjp596VNTvH9_C6fgPX5wyzKbvtGEon1kLQjQtXhQSq4
Message-ID: <CA+G9fYuroDkk3qrd7yJJG7twZV0sM=t3mDjhrBMm==q2MjS41A@mail.gmail.com>
Subject: Re: arm64: juno-r2: SSD detect failed on mainline and next
To: Robin Murphy <robin.murphy@arm.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_024902_341775_55C6E5DB 
X-CRM114-Status: GOOD (  37.59  )
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

Hi Robin,

On Fri, 25 Apr 2025 at 20:48, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 11/04/2025 8:11 pm, Robin Murphy wrote:
> [...]
> > OK, I found it, but I'm still not sure what exactly to make of it - it's
> > the pci_request_acs() in of_iommu_configure(), now being called early
> > enough to actually have an effect. Booting with EDK2 already using PCI
> > prior to Linux, here's what I get for `sudo lspci -vv | grep ACSctl`


Linux version 6.14.9-rc1
# lscpi
00:00.0 PCI bridge: PLDA PCI Express Core Reference Design
01:00.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:01.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:02.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:03.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:0c.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:10.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:1f.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
03:00.0 Mass storage controller: Silicon Image, Inc. SiI 3132 Serial
ATA Raid II Controller (rev 01)
08:00.0 Ethernet controller: Marvell Technology Group Ltd. 88E8057
PCI-E Gigabit Ethernet Controller


Linux version 6.15.0
# lscpi
00:00.0 PCI bridge: PLDA PCI Express Core Reference Design
01:00.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:01.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:02.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:03.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:0c.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:10.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:1f.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)

> > with 6.15-rc1:
> >
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >          ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> > UpstreamFwd+ EgressCtrl- DirectTrans-
> >
> > whereas with the 6.14 behaviour they are all '-'. I don't have a working
> > root filesystem with the U-Boot setup, but if I boot it with
> > "pci=config_acs=000000@pci:0:0" then the kernel does assign the bridge
> > windows and discover the ethernet/SATA endpoints again. I can spend some
> > time getting NFS working next week, but if you're able to get lspci
> > output off a machine in the "broken" state easily that would be handy to
> > compare.


On the 6.15, After adding this into Kernel boot args
pci=config_acs=000000@pci:0:0

The SSD was detected and mounted successfully.

Linux version 6.15.0 +  pci=config_acs=000000@pci:0:0
# lspci
00:00.0 PCI bridge: PLDA PCI Express Core Reference Design
01:00.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:01.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:02.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:03.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:0c.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:10.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
02:1f.0 PCI bridge: Microsemi / PMC / IDT 89HPES16NT16G2 16-Lane
16-Port PCIe Gen2 System Interconnect Switch (rev 02)
03:00.0 Mass storage controller: Silicon Image, Inc. SiI 3132 Serial
ATA Raid II Controller (rev 01)
08:00.0 Ethernet controller: Marvell Technology Group Ltd. 88E8057
PCI-E Gigabit Ethernet Controller

> >
> > So at this point it would seem to be something about how Linux
> > configures ACS when doing it from scratch. What I don't really know is
> > where to go from there. I do know Juno's possibly a bit odd in that the
> > switch supports ACS, but both the root port and endpoints either side of
> > it don't. Could this be tickling some subtle bug in the PCI layer, and
> > what is EDK2 doing that makes it not happen?
>
> Just following up on where I ran out of ideas. I poked at things a
> little more, and from a process of elimination, the culprit appears to
> be is that we enable ACS source validation on the downstream port while
> its secondary bus is still 0, *then* we get to the "bridge configuration
> invalid" bit and reconfigure the bus numbers, but after that, config
> space accesses to the secondary bus still apparently fail to work as
> expected.
>
> What's now beyond me is whether this is just an ACS quirk of this
> particular switch, and/or whether there's something we could or should
> be doing in the PCI layer.
>
> All I can suggest a this point is that you could at least sidestep the
> problem on the LKFT boards by updating them to a less-ancient version of
> U-Boot which supports PCIe for Juno (looks like that landed in 2020.10),
> which should then configure the switch at boot such that the bus
> numbering doesn't need to change when Linux probes it - that appears to
> be the only "magic" thing that EDK2 is doing.

I will work with my team to address these issues.
Thanks for your suggestions.

>
> Thanks,
> Robin.

- Naresh

