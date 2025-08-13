Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B2DC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2r+YvwUMTdRXgaHGTUxzpAdECRkvs+ADcectHSFWKx8=; b=nJfTIjbp5sqJ04tgGfzQj99qJk
	FeyhMkGNVQubFJwaxDV81yYe+eWb6AwxO5v0r6hAnLrBJliIrlINmt2DyZa0zcZ44qRqcXe0/mtyy
	6C7vbxPhCVu7DbTioZZx1RkAJq6xjX/aPwl/ZIg8/C/AhorMOfm7cIXs7WW7NNE8HxmxnhyT7L9+P
	1ViMvdfZ2tI/RVeQezs4aFhZn9/munzjQIl1eJqy2TgYbqUIOEbrzjbedgKoIb45O0fEBp2bnY2WI
	zViVhTUZkZ8MB9KBnHLcn3UW4BHtMLIztYfvOwendCCx+LHX07SH7yvIupcJiV70q1/VSgTINXg+8
	lzhqllEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCMQ-0000000DtcW-1SCC;
	Wed, 13 Aug 2025 14:21:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umC8r-0000000DsOt-30ug
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:07:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A0D112FC;
	Wed, 13 Aug 2025 07:07:40 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91DEF3F5A1;
	Wed, 13 Aug 2025 07:07:47 -0700 (PDT)
Date: Wed, 13 Aug 2025 15:07:34 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: cristian.marussi@arm.com
Subject: [REGRESSION] Virtio networking issues on v6.17-rc1
Message-ID: <aJycJvs3xztfD5Rm@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_070749_794526_395B1E68 
X-CRM114-Status: GOOD (  10.78  )
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

Hi,

Not sure if it has been already reported but in a kvmtool/guest setup moving
the guest kernel from v6.16 to v6.17-rc1 I completely lost host-guest network
functionality....in a very funny way, though, I'd say...

In fact NO error is apparently reported in the guest kernel log and the
interfaces seems perfectly up an running both sides, but looking at the
host/guest interfaces you can see that ALL received frames are indeed dropped:


enp0s1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
....
        ether 02:15:15:15:15:15  txqueuelen 1000  (Ethernet)           <<<<<<<<<<<<<<<<
        RX packets 125  bytes 17948 (17.5 KiB)
        RX errors 0  dropped 125 overruns 0  frame 0
        TX packets 1207  bytes 51182 (49.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0


...on the host same..(taken later on...)

tap0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.33.1  netmask 255.255.255.0  broadcast 192.168.33.255
        ether 8a:10:f6:df:a1:70  txqueuelen 1000  (Ethernet)
        RX packets 804  bytes 43904 (42.8 KiB)
        RX errors 0  dropped 804  overruns 0  frame 0
        TX packets 101  bytes 14408 (14.0 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

....and for a good reason, apparently, since sniffing around on the Host TAP
interface I can see a never ending stream of:

$ sudo tcpdump -i tap0
listening on tap0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
22:40:42.309158 00:00:00:00:00:00 (oui Ethernet) > 00:00:00:00:00:00 (oui Ethernet), ethertype Unknown (0xffff), length 54:
	0x0000:  ffff ffff 0215 1515 1515 0806 0001 0800  ................       <<<<<<<<<<<<<
	0x0010:  0604 0001 0215 1515 1515 c0a8 2102 0000  ............!...
	0x0020:  0000 0000 c0a8 2101                      ......!.

... DST/SRC Macs are just all zeros WHILE in the payload you can spot my guest
SRC mac address 0215 1515 1515  :P

...or on a different instance:

tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on tap0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
14:57:57.127171 00:00:00:00:00:00 (oui Ethernet) > 00:00:00:00:00:00 (oui Ethernet), ethertype Unknown (0x3333), length 82: 
	0x0000:  0000 0002 0215 1515 1515 86dd 6000 0000  ............`...
	0x0010:  0010 3aff fe80 0000 0000 0000 0015 15ff  ..:.............
	0x0020:  fe15 1515 ff02 0000 0000 0000 0000 0000  ................
	0x0030:  0000 0002 8500 26b0 0000 0000 0101 0215  ......&.........
	0x0040:  1515 1515                                ....

...so it seems the frame is 'shifted' by 10 bytes or more and random
garbage pollutes the Ether frame...

I am using a vanilla kvmtool at:

	ba6830e vfio: include libgen.h (for musl compatibility)

and run with:

	lkvm run -c 4 -m 4G -k $IMAGE_DEF --network virtio -d $ROOTFS_DEF -p "earlycon loglevel=8"

and I could reproduce this on a RaspberryPI_5 with a Host Kernel v6.6 and on an APPLE M1
with Host Kernel v6.12.

Has anybody seen something similar ? Did I miss something obvious ?

...never saw this happening before on any previous kernel version.

Thanks,
Cristian

