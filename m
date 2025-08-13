Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B5FC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZIvx7/8G4YLNltByZ+tcdnBxElMJ5x+9zs9iYoybLY=; b=yZEyARp3sHTH/2iyGNzI4q6vOH
	0bBKk1RwgyALJSwM1ahyLO588SZNUfhroOARZp5FUUvLWM5VOs/OP9hRszSk1gjgqu+i2zayJQOyp
	ZxGlL4YRAWytPjOjPd99z7NSF2BsHuTwfvVpQcdLb60tyc81RaPF5iCMNaafDlb1MI5vBCumvg2JF
	pXKeGTcTU0eIcmKGKOzAFIuFMPIypXbPGLxEPcRmpxauNe9IYZLyF3CBlSbBzqfzeX0BshCdb3bY+
	3cKOCDlO6y+cZ7n1vftyvD1SDCnjLL/1zY/TYj+6dBDHlMG47FLwzvhQnfustiJRUMfYw8uMGD/7f
	Tvwn5SEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPh-0000000Er8F-1o6f;
	Wed, 13 Aug 2025 19:45:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFur-0000000Egnt-009Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 18:09:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CCFC12FC;
	Wed, 13 Aug 2025 11:09:27 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A64F33F5A1;
	Wed, 13 Aug 2025 11:09:33 -0700 (PDT)
Date: Wed, 13 Aug 2025 19:09:24 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: cristian.marussi@arm.com, Jason Wang <jasowang@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [REGRESSION] Virtio networking issues on v6.17-rc1
Message-ID: <aJzU1JsV5we-QqgQ@pluto>
References: <aJycJvs3xztfD5Rm@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJycJvs3xztfD5Rm@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_110937_128166_D0E1CDF7 
X-CRM114-Status: GOOD (  16.17  )
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

On Wed, Aug 13, 2025 at 03:07:34PM +0100, Cristian Marussi wrote:
> Hi,
> 

Hi,

> Not sure if it has been already reported but in a kvmtool/guest setup moving
> the guest kernel from v6.16 to v6.17-rc1 I completely lost host-guest network
> functionality....in a very funny way, though, I'd say...
> 
> In fact NO error is apparently reported in the guest kernel log and the
> interfaces seems perfectly up an running both sides, but looking at the
> host/guest interfaces you can see that ALL received frames are indeed dropped:
> 
> 
> enp0s1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
> ....
>         ether 02:15:15:15:15:15  txqueuelen 1000  (Ethernet)           <<<<<<<<<<<<<<<<
>         RX packets 125  bytes 17948 (17.5 KiB)
>         RX errors 0  dropped 125 overruns 0  frame 0
>         TX packets 1207  bytes 51182 (49.9 KiB)
>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> 
> 
> ...on the host same..(taken later on...)
> 
> tap0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>         inet 192.168.33.1  netmask 255.255.255.0  broadcast 192.168.33.255
>         ether 8a:10:f6:df:a1:70  txqueuelen 1000  (Ethernet)
>         RX packets 804  bytes 43904 (42.8 KiB)
>         RX errors 0  dropped 804  overruns 0  frame 0
>         TX packets 101  bytes 14408 (14.0 KiB)
>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> 
> ....and for a good reason, apparently, since sniffing around on the Host TAP
> interface I can see a never ending stream of:
> 
> $ sudo tcpdump -i tap0
> listening on tap0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
> 22:40:42.309158 00:00:00:00:00:00 (oui Ethernet) > 00:00:00:00:00:00 (oui Ethernet), ethertype Unknown (0xffff), length 54:
> 	0x0000:  ffff ffff 0215 1515 1515 0806 0001 0800  ................       <<<<<<<<<<<<<
> 	0x0010:  0604 0001 0215 1515 1515 c0a8 2102 0000  ............!...
> 	0x0020:  0000 0000 c0a8 2101                      ......!.
> 
> ... DST/SRC Macs are just all zeros WHILE in the payload you can spot my guest
> SRC mac address 0215 1515 1515  :P
>

I bisected this regression to:

56a06bd40fab64448aa6b84aa06b3dc470c1254a is the first bad commit

commit 56a06bd40fab64448aa6b84aa06b3dc470c1254a
Author: Paolo Abeni <pabeni@redhat.com>
Date:   Tue Jul 8 17:55:02 2025 +0200

    virtio_net: enable gso over UDP tunnel support.
    
    If the related virtio feature is set, enable transmission and reception
    of gso over UDP tunnel packets.
    
    Most of the work is done by the previously introduced helper, just need
    to determine the UDP tunnel features inside the virtio_net_hdr and
    update accordingly the virtio net hdr size.
    
    Acked-by: Jason Wang <jasowang@redhat.com>
    Signed-off-by: Paolo Abeni <pabeni@redhat.com>

 drivers/net/virtio_net.c | 85 ++++++++++++++++++++++++++++++++++++------------

Reverting this commit on top of v6.17-rc1 solves for me and network works fine again.

Thanks,
Cristian

