Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB6EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 20:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBleD+055ltSM9SLVyMdhGo/eyX/NfyNWllMpqcy3W8=; b=OhG1/nx749Gbtm614ptQuBN4Uh
	3QBSDp156ta2uq+7E8Dkmi5kpS27iOWixeSvqDd68xqz7H0GxFUbmH7AGfnUDitenL7w7Ll4ard8A
	n4erJjmd49PsE2G6veGi9cYpAFrhGpdNgHVXmn0bgrObi1ACFTUWhUh3qfXMBVFeZgcKTVYqmhDKO
	g3EKUCsh0SqHmzfkCJ2hzu0r85e6OJGY0P4AJuIPUyBw+SElR+aElaKE/HQANsjn7sJE1qlhMU9v2
	lMwX6erjghqqGsKX5PQzzoDUxX6sNvh4uX0bZHyOnvg2GyHwx6r6qh2DJunwk2Wb6gueCq0J3HUsQ
	UvBhq7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umILw-0000000Ewwo-25JA;
	Wed, 13 Aug 2025 20:45:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIJN-0000000EwtA-2db6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 20:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755117784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBleD+055ltSM9SLVyMdhGo/eyX/NfyNWllMpqcy3W8=;
	b=KX3vN8OY0l3gpjdfd/5CiM9p7HEQZip8MPxbI83SqqATe0h1dbmo1bAWJGxd/N7UN0j3AW
	uEM5/BS8jENZ/FmJmGuORNYtBYKzWcoDmlsCCvjk/fmsAviPFIxrMTQzp/nVIz+xCgs6a+
	8zHJTsUavh474c55P71ZN+aSm1tylAE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-Nk9SGiRUNMqWN5c88qpRFQ-1; Wed, 13 Aug 2025 16:41:32 -0400
X-MC-Unique: Nk9SGiRUNMqWN5c88qpRFQ-1
X-Mimecast-MFC-AGG-ID: Nk9SGiRUNMqWN5c88qpRFQ_1755117692
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a1b05b15eso908455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 13:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755117691; x=1755722491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lBleD+055ltSM9SLVyMdhGo/eyX/NfyNWllMpqcy3W8=;
        b=ZOUbkcZrf4Pw0ogsUs5yUkDSmDbGR1Le/HOsmT5/tLnGip7fut1SgdFc2MxUlbWnmJ
         QyHlIFxnybiOYHl3rYSl3WuuM3lXkAYENdLVaxiXd5Bq1yAqwC/sbz+5oRe+mPLeelpo
         NePkk+mMga074OCG2WYvFmD4+FEUMgHiTsegFsBXX5MfR4emt0GFf4lNQZGZulicWtOH
         yH7O1Wae/r1hzg5HaKIilnzeFZ7GVMDuNoWuYdkL7MWjb6G3bABm/4oUaS7IUfS4ugNc
         ZJ9bzArRERZBJ68AeFvFdWC749UDXeCSTnxpSiFwLC8KOMZckbYqdicpAHCoopZHlexh
         /HGA==
X-Forwarded-Encrypted: i=1; AJvYcCW1LxR2d+zduc3MjE/YhaZT+grNBBhIGVjh/cJrY/dldbMewiLHP6wec32rqDv/dKdyBFqWneXD8wSAufvv7LUq@lists.infradead.org
X-Gm-Message-State: AOJu0YwkPpkR7PnTJoWEYftKP3atL+ypFgRhmV2p5gE2NnZoWeSXOzWO
	ecYxPr0dGoRDEvyWhTc1Jam/escyBL7LPagOBUoVG+wUxnLq42ePdrK+O0PJ/VGOpMG6QoqRbzB
	RnvNFJbvDggN2soLJU2mTIZA1COsLw/qWVDj9zrWrgIEcCeMnyR/WrmXUQ2NnZCy4L8nlrw9rMF
	P+
X-Gm-Gg: ASbGncvEUeOg3Y7KEzoSLfRqpVxDf+bjOVOdKGyiKblGl0xdNu7xTDnvhGQhqoLWMQ5
	d2RZeAJ7U1lq2H5OMcJ5sTDDm4RZ21LK5uw8Krsn00F91mjNbbQf0Zi/IU7lC5xeUq7CwPDQ4IA
	53/BxIn+ZUF2DD11VZzubbG5WAyFmNsG+B0nYKOqrg4XVwA/9LS5veXRjZv+UK1SEqBYSthMMBm
	JLKsodAq0unR2ERnWNhQQ2m5tYx2AMcY/fOfMw3xafSAK4QQjiNrmcoa8mmuAsY2eDsXGAw1Tq4
	m+SaWlHGbW8093sm2eYI3/tTSXOkmOQEISyi+eUWcA==
X-Received: by 2002:a05:600c:19d1:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45a1b6614bamr1774415e9.16.1755117691541;
        Wed, 13 Aug 2025 13:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZUnYwIAOPn7DHgmGP8oaqqq7HJdTWwhYbAqJhLDNgROKech4NZKaObKqud71WSCyJ04rPfg==
X-Received: by 2002:a05:600c:19d1:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45a1b6614bamr1774235e9.16.1755117691090;
        Wed, 13 Aug 2025 13:41:31 -0700 (PDT)
Received: from [192.168.0.115] ([216.128.11.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8f8b1bc81sm26709722f8f.69.2025.08.13.13.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 13:41:30 -0700 (PDT)
Message-ID: <146fd5f7-c694-4606-afa5-522c5c05d9ff@redhat.com>
Date: Wed, 13 Aug 2025 22:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Virtio networking issues on v6.17-rc1
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
References: <aJycJvs3xztfD5Rm@pluto> <aJzU1JsV5we-QqgQ@pluto>
 <aa46dd09-a450-4633-a647-b04781599c87@redhat.com> <aJz1_HzPsEyvY6HN@pluto>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aJz1_HzPsEyvY6HN@pluto>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UlJLFvt4by_yuX3XCGALv-w9LMdAGH-7Wr-gSsZXj0A_1755117692
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_134305_744855_7D661CD5 
X-CRM114-Status: GOOD (  30.07  )
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

On 8/13/25 10:31 PM, Cristian Marussi wrote:
> On Wed, Aug 13, 2025 at 09:51:30PM +0200, Paolo Abeni wrote:
>> On 8/13/25 8:09 PM, Cristian Marussi wrote:
>>> On Wed, Aug 13, 2025 at 03:07:34PM +0100, Cristian Marussi wrote:
>>>> Not sure if it has been already reported but in a kvmtool/guest setup moving
>>>> the guest kernel from v6.16 to v6.17-rc1 I completely lost host-guest network
>>>> functionality....in a very funny way, though, I'd say...
>>>>
>>>> In fact NO error is apparently reported in the guest kernel log and the
>>>> interfaces seems perfectly up an running both sides, but looking at the
>>>> host/guest interfaces you can see that ALL received frames are indeed dropped:
>>>>
>>>>
>>>> enp0s1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>>>> ....
>>>>         ether 02:15:15:15:15:15  txqueuelen 1000  (Ethernet)           <<<<<<<<<<<<<<<<
>>>>         RX packets 125  bytes 17948 (17.5 KiB)
>>>>         RX errors 0  dropped 125 overruns 0  frame 0
>>>>         TX packets 1207  bytes 51182 (49.9 KiB)
>>>>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
>>>>
>>>>
>>>> ...on the host same..(taken later on...)
>>>>
>>>> tap0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>>>>         inet 192.168.33.1  netmask 255.255.255.0  broadcast 192.168.33.255
>>>>         ether 8a:10:f6:df:a1:70  txqueuelen 1000  (Ethernet)
>>>>         RX packets 804  bytes 43904 (42.8 KiB)
>>>>         RX errors 0  dropped 804  overruns 0  frame 0
>>>>         TX packets 101  bytes 14408 (14.0 KiB)
>>>>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
>>>>
>>>> ....and for a good reason, apparently, since sniffing around on the Host TAP
>>>> interface I can see a never ending stream of:
>>>>
>>>> $ sudo tcpdump -i tap0
>>>> listening on tap0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
>>>> 22:40:42.309158 00:00:00:00:00:00 (oui Ethernet) > 00:00:00:00:00:00 (oui Ethernet), ethertype Unknown (0xffff), length 54:
>>>> 	0x0000:  ffff ffff 0215 1515 1515 0806 0001 0800  ................       <<<<<<<<<<<<<
>>>> 	0x0010:  0604 0001 0215 1515 1515 c0a8 2102 0000  ............!...
>>>> 	0x0020:  0000 0000 c0a8 2101                      ......!.
>>>>
>>>> ... DST/SRC Macs are just all zeros WHILE in the payload you can spot my guest
>>>> SRC mac address 0215 1515 1515  :P
>>>>
>>>
>>> I bisected this regression to:
>>>
>>> 56a06bd40fab64448aa6b84aa06b3dc470c1254a is the first bad commit
>>>
>>> commit 56a06bd40fab64448aa6b84aa06b3dc470c1254a
>>> Author: Paolo Abeni <pabeni@redhat.com>
>>> Date:   Tue Jul 8 17:55:02 2025 +0200
>>>
>>>     virtio_net: enable gso over UDP tunnel support.
>>>     
>>>     If the related virtio feature is set, enable transmission and reception
>>>     of gso over UDP tunnel packets.
>>>     
>>>     Most of the work is done by the previously introduced helper, just need
>>>     to determine the UDP tunnel features inside the virtio_net_hdr and
>>>     update accordingly the virtio net hdr size.
>>>     
>>>     Acked-by: Jason Wang <jasowang@redhat.com>
>>>     Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>>>
>>>  drivers/net/virtio_net.c | 85 ++++++++++++++++++++++++++++++++++++------------
>>>
>>> Reverting this commit on top of v6.17-rc1 solves for me and network works fine again.
>>
>> Thanks for reporting, I was not aware yet of this regression.
>>
> 
> Hi Paolo,
> 
> I spotted this issue on my setup this morning.
> 
>> Apparently there is mismatch between the negotiated features (that
>> determinate the virtio net header size) and the actually virtio header
>> used by both the guest and the host, which is totally unexpected.
>>
> 
> Have the UAPI headers been updated ? ... I could not see any change...
> (not that I am very familiar with virtio core :D)

The virtio feature space has been extended from 64 bits to 128 and the
blamed commit is the first using the 'extended' virtio features
negotiation.

But, modulo bugs, the extended space should be used only if the
hypervisors exposes the relevant capabilities. kvmtool does not do that.

>> Could you please share the host kernel version, the arch and the kvmtool
>> version? Also I understand you only upgraded the guest kernel, without
>> any other setup changes, am I correct?
>>
> 
> The arch is arm64, I could reproduce on a Raspberry Pi5 with host v6.6 and on
> an Apple M1 (running Linux natively) with a v6.12.
> 
> Both host kernels are from the original distros unchanged (Debian and Fedora)
> 
> In both cases I compiled from scratch (make clean && make) kvmtool on the
> respective arm64 Host using the current top of tree from origin/master at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/log/
> 
> 	commit 	ba6830eec0f5 ("vfio: include libgen.h (for musl compatibility)")
> 
> Run kvmtoool baer simple with
> 	
> 	lkvm run -c 4 -m 4G -k $IMAGE_DEF --network virtio -d $ROOTFS_DEF -p "earlycon loglevel=8"
> 
> All was fine till v6.16, and it is my usual setup and update procedure that never failed really
> as long as I update kvmtool in sync.
> Not sure if something is still missing from kvmtool master repo for v6.17 but it seems reasonably
> updated (July25).
> 
> I wonder if no one else had this issue on arm64/kvmtool....that would made my 'regression'
> suspiciously tied tomy setup..

Thanks for the detailed reproduction steps.

I agree it should be some bad iteration with the arm arch and/or
kvmtool. I hope an arm system is not required to reproduce the issue,
because I don't have any of them handy.

I should be able to dig into this tomorrow afternoon my time.

Cheers,

Paolo


