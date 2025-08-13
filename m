Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C4DC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DenE2k5k0ARvi7AFwHT0DKLAZKHwkPF02z/nBUHdjjk=; b=4yh/kLTwZ4dadHVmejHJGEvmvK
	yywEiwOk/eeBTzArPmxBWZ2fhx7Rq34LoD5tCbovJBHTJ2qnNUBCMsNmj+lT1TxnNfXcCnHTYvfdI
	Ld3Cy2/TpcZmlX4BQ4rH/ytZw1ZumIyaAlf4a0VjfW+sW7Ov1MvravmeexNNvhWOvOrArX5pPrlve
	Atw9jDGb9gAK0dx9jdySS3eGr6RVqeaEFpaJU+8lRjJXlCIfkmssKywbt/Pw4bV8Ft34vVG+PpvTX
	BUhMyvJmYbxDYihM5ZScaQlIXejlyIWdum9fhMyE4mlmmPkGqj/PRGo1Yo1M+YNA7o7111i5oYCC0
	a96uiWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJld-0000000F8hQ-0GUP;
	Wed, 13 Aug 2025 22:16:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIeg-0000000Ez7v-3mRJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:05:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ECB12B;
	Wed, 13 Aug 2025 14:04:58 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B629E3F738;
	Wed, 13 Aug 2025 14:05:04 -0700 (PDT)
Date: Wed, 13 Aug 2025 22:04:54 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [REGRESSION] Virtio networking issues on v6.17-rc1
Message-ID: <aJz99mhpyGZ7Woyu@pluto>
References: <aJycJvs3xztfD5Rm@pluto>
 <aJzU1JsV5we-QqgQ@pluto>
 <aa46dd09-a450-4633-a647-b04781599c87@redhat.com>
 <aJz1_HzPsEyvY6HN@pluto>
 <146fd5f7-c694-4606-afa5-522c5c05d9ff@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <146fd5f7-c694-4606-afa5-522c5c05d9ff@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_140507_033693_D243B456 
X-CRM114-Status: GOOD (  41.35  )
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

On Wed, Aug 13, 2025 at 10:41:28PM +0200, Paolo Abeni wrote:
> On 8/13/25 10:31 PM, Cristian Marussi wrote:
> > On Wed, Aug 13, 2025 at 09:51:30PM +0200, Paolo Abeni wrote:
> >> On 8/13/25 8:09 PM, Cristian Marussi wrote:
> >>> On Wed, Aug 13, 2025 at 03:07:34PM +0100, Cristian Marussi wrote:
> >>>> Not sure if it has been already reported but in a kvmtool/guest setup moving
> >>>> the guest kernel from v6.16 to v6.17-rc1 I completely lost host-guest network
> >>>> functionality....in a very funny way, though, I'd say...
> >>>>
> >>>> In fact NO error is apparently reported in the guest kernel log and the
> >>>> interfaces seems perfectly up an running both sides, but looking at the
> >>>> host/guest interfaces you can see that ALL received frames are indeed dropped:
> >>>>
> >>>>
> >>>> enp0s1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
> >>>> ....
> >>>>         ether 02:15:15:15:15:15  txqueuelen 1000  (Ethernet)           <<<<<<<<<<<<<<<<
> >>>>         RX packets 125  bytes 17948 (17.5 KiB)
> >>>>         RX errors 0  dropped 125 overruns 0  frame 0
> >>>>         TX packets 1207  bytes 51182 (49.9 KiB)
> >>>>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> >>>>
> >>>>
> >>>> ...on the host same..(taken later on...)
> >>>>
> >>>> tap0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
> >>>>         inet 192.168.33.1  netmask 255.255.255.0  broadcast 192.168.33.255
> >>>>         ether 8a:10:f6:df:a1:70  txqueuelen 1000  (Ethernet)
> >>>>         RX packets 804  bytes 43904 (42.8 KiB)
> >>>>         RX errors 0  dropped 804  overruns 0  frame 0
> >>>>         TX packets 101  bytes 14408 (14.0 KiB)
> >>>>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> >>>>
> >>>> ....and for a good reason, apparently, since sniffing around on the Host TAP
> >>>> interface I can see a never ending stream of:
> >>>>
> >>>> $ sudo tcpdump -i tap0
> >>>> listening on tap0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
> >>>> 22:40:42.309158 00:00:00:00:00:00 (oui Ethernet) > 00:00:00:00:00:00 (oui Ethernet), ethertype Unknown (0xffff), length 54:
> >>>> 	0x0000:  ffff ffff 0215 1515 1515 0806 0001 0800  ................       <<<<<<<<<<<<<
> >>>> 	0x0010:  0604 0001 0215 1515 1515 c0a8 2102 0000  ............!...
> >>>> 	0x0020:  0000 0000 c0a8 2101                      ......!.
> >>>>
> >>>> ... DST/SRC Macs are just all zeros WHILE in the payload you can spot my guest
> >>>> SRC mac address 0215 1515 1515  :P
> >>>>
> >>>
> >>> I bisected this regression to:
> >>>
> >>> 56a06bd40fab64448aa6b84aa06b3dc470c1254a is the first bad commit
> >>>
> >>> commit 56a06bd40fab64448aa6b84aa06b3dc470c1254a
> >>> Author: Paolo Abeni <pabeni@redhat.com>
> >>> Date:   Tue Jul 8 17:55:02 2025 +0200
> >>>
> >>>     virtio_net: enable gso over UDP tunnel support.
> >>>     
> >>>     If the related virtio feature is set, enable transmission and reception
> >>>     of gso over UDP tunnel packets.
> >>>     
> >>>     Most of the work is done by the previously introduced helper, just need
> >>>     to determine the UDP tunnel features inside the virtio_net_hdr and
> >>>     update accordingly the virtio net hdr size.
> >>>     
> >>>     Acked-by: Jason Wang <jasowang@redhat.com>
> >>>     Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> >>>
> >>>  drivers/net/virtio_net.c | 85 ++++++++++++++++++++++++++++++++++++------------
> >>>
> >>> Reverting this commit on top of v6.17-rc1 solves for me and network works fine again.
> >>
> >> Thanks for reporting, I was not aware yet of this regression.
> >>
> > 
> > Hi Paolo,
> > 
> > I spotted this issue on my setup this morning.
> > 
> >> Apparently there is mismatch between the negotiated features (that
> >> determinate the virtio net header size) and the actually virtio header
> >> used by both the guest and the host, which is totally unexpected.
> >>
> > 
> > Have the UAPI headers been updated ? ... I could not see any change...
> > (not that I am very familiar with virtio core :D)
> 
> The virtio feature space has been extended from 64 bits to 128 and the
> blamed commit is the first using the 'extended' virtio features
> negotiation.

Understood, thanks for the explanation.

> 
> But, modulo bugs, the extended space should be used only if the
> hypervisors exposes the relevant capabilities. kvmtool does not do that.
> 

Ah, ok...I was hoping it was just a matter of kvmtool still to have to
update headers but maybe there's something more.

> >> Could you please share the host kernel version, the arch and the kvmtool
> >> version? Also I understand you only upgraded the guest kernel, without
> >> any other setup changes, am I correct?
> >>
> > 
> > The arch is arm64, I could reproduce on a Raspberry Pi5 with host v6.6 and on
> > an Apple M1 (running Linux natively) with a v6.12.
> > 
> > Both host kernels are from the original distros unchanged (Debian and Fedora)
> > 
> > In both cases I compiled from scratch (make clean && make) kvmtool on the
> > respective arm64 Host using the current top of tree from origin/master at:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/log/
> > 
> > 	commit 	ba6830eec0f5 ("vfio: include libgen.h (for musl compatibility)")
> > 
> > Run kvmtoool baer simple with
> > 	
> > 	lkvm run -c 4 -m 4G -k $IMAGE_DEF --network virtio -d $ROOTFS_DEF -p "earlycon loglevel=8"
> > 
> > All was fine till v6.16, and it is my usual setup and update procedure that never failed really
> > as long as I update kvmtool in sync.
> > Not sure if something is still missing from kvmtool master repo for v6.17 but it seems reasonably
> > updated (July25).
> > 
> > I wonder if no one else had this issue on arm64/kvmtool....that would made my 'regression'
> > suspiciously tied tomy setup..
> 
> Thanks for the detailed reproduction steps.
> 
> I agree it should be some bad iteration with the arm arch and/or
> kvmtool. I hope an arm system is not required to reproduce the issue,
> because I don't have any of them handy.

Thanks for having a look, hope not to have made noise for nothing and
maybe it is just a matter of a pending udpate from kvmtool guys...indeed
looking at their mailing list there is a pending patch to update headers
to v6.16 (for unrelated reasons)...

https://lore.kernel.org/kvm/20250729095745.3148294-2-andre.przywara@arm.com/T/#u

....but I suppose it would not be enough to catch with v6.17 changes
anyway.

Anyway if you need to test any fix on arm64 just let me know and I can do it
(...modulo my incoming holiday end-of-next-week :P)

> 
> I should be able to dig into this tomorrow afternoon my time.
>

No worries...no rush...I have a good workaround for now...I just wanted to
raise a flag to make sure I am not hallucinating on my own :D 

Thanks for you help

Cheers,
Cristian

