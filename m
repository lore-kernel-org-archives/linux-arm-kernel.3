Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B8FCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j183C3V9YFuT97WgSzXp5t9Qr2ck9VAY1fTHVyPsoY8=; b=nj2oNtFYdO5PeFKfZjAqFslSsc
	/zaIadYjDJj80j15GSWOJYsJL00KnJbDVqn99hLWjNZDb6r/aUUeQu8QKfEmJVaU1Em6Nz03pYgBM
	DUG3EzHarhazTJcw4inhKO/PWn5Hyax6ARmx7l3zG50Bomy2V+8CcMnnuUp5N0cZi65qTY2Y/+Mg8
	ZilCfX5nwqHJNgc4yEPaEAlu0HrAWlLiNtOIkidjP8uzKXl+nC4xv7hHH8hlC1T0oSIaoU/RWxL2a
	AJcpE5THtG/u4jgKXQmOttMOM59BVhmx9XpqLzs9FT1kDg7MHcI/L0S9pY3On1QT4HFNCFbdepcsB
	r4OqEDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIpd-0000000EzdE-25EP;
	Wed, 13 Aug 2025 21:16:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHVd-0000000Esyj-1Ol7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 19:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755114698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j183C3V9YFuT97WgSzXp5t9Qr2ck9VAY1fTHVyPsoY8=;
	b=f3SVif/xuxcj0BvNlX4N0g+cmj6t5I1IVwlztnI4RIeWfPtyCI/qa69u+kvOf7c/BD6PG+
	dND7UNG+YOHsi0114cv661T5p8kwpl4dUnEJJS9/SpjeUtm0zx2oZYPLLNEV0SASyzsqlC
	J4LutyC+Ua6c1SICBejmcTObSzoRH0Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-DddqQY35MgO4fawpnyQVHA-1; Wed, 13 Aug 2025 15:51:36 -0400
X-MC-Unique: DddqQY35MgO4fawpnyQVHA-1
X-Mimecast-MFC-AGG-ID: DddqQY35MgO4fawpnyQVHA_1755114696
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88dae248so6122116d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 12:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755114696; x=1755719496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j183C3V9YFuT97WgSzXp5t9Qr2ck9VAY1fTHVyPsoY8=;
        b=C0eAJvEAidQs1AFCgz72Lhr7QYvh3uJdKxbPRrAAVHdJ6N5uwfueyi+FCdnVacl0tQ
         OjVXPEzi6K2FhAgry+ejvC8F/j0W/1OM6Xq6dfjJYJioB8g9J0LKMGuHH+06m4vdpLXi
         C/ElG9pp8mlse5RjvUMhMAO0IYN65Ic1ULFVr1ncpzmztZbMubcyhQd6CH45hYU6csGC
         iQnuXorD4ZLr/T7IGsJgHJPp8SJOzXx0du9SRsDEl/MuH8vYsG7SaJLjV178wKVyAHCp
         R1P/f6Q2YO48QdvBys0zfyVbXQ9HQL91RN7eG2zMKiJyaAiL39U3r48WwY/yd2ecmLC/
         a3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCV28oBj4hAo0MDTHNKeL5zzo/Lbq/Kht/Tkn+g++2L0Ql+dzAId89cJ4rmSvKfxq6Rd90QarQsCKgo1aRAbkuwa@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz8wkLGDKLEMKSsfBIvT2MHkuTkht6x2WWrAgB5Ie1m0p2pllP
	HTwRJTLvYp70fix70kyPEjdOnXUuZbstX2Ee66Eqs+optUdKoa5nlMsfTWU3f3YtSUMcDPZJ1bx
	a/em24btmJQkPmIU9c7mAsfWaf9xPqOtiXIT35DowbHjzYN3LMy6mjXUs8A+ef7VYA5nvcPOZVl
	NM
X-Gm-Gg: ASbGnctaQZW7EED3OT5MCoL40E4/CETqJ+3F7JlsqvZb4StDgkWX7LUdIMxs2nOItXi
	BTeLOGrYlqP+K1h3rN57a2nR+hFkbH0mqedrYJ+QKV/TITF0gJLwtOWVrxPcf7vADOfYx+R5Hyq
	7DeDWXa6teKxndSdYgEoYXYc717nxXmSI7SbHpPhb3VcMEjj2MQxPGV1vI4RYT9W7XO3+PMLGgD
	BTHo3k7AJwr+3jsUdl+aS57xegDcHIsgnjPQPrNOjVWRWzGcZkgme1SSFIbRPMS0s1AK17YlQZA
	0MIa1uqtj87uzWIUjlI+jjOf44U7P3H5cNOC/AABBg==
X-Received: by 2002:a05:6214:240f:b0:709:a27f:2f93 with SMTP id 6a1803df08f44-70b97d124a2mr897986d6.5.1755114695995;
        Wed, 13 Aug 2025 12:51:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhvqEVSPsc7zEAbTUnL3rnYt5hM0shMbs5IPz3+hwNRA+6JEU6BvOZKIVqTc73WN7hre/z3Q==
X-Received: by 2002:a05:6214:240f:b0:709:a27f:2f93 with SMTP id 6a1803df08f44-70b97d124a2mr897696d6.5.1755114695535;
        Wed, 13 Aug 2025 12:51:35 -0700 (PDT)
Received: from [192.168.0.115] ([216.128.11.133])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6d02f89sm2811256d6.37.2025.08.13.12.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 12:51:35 -0700 (PDT)
Message-ID: <aa46dd09-a450-4633-a647-b04781599c87@redhat.com>
Date: Wed, 13 Aug 2025 21:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Virtio networking issues on v6.17-rc1
To: Cristian Marussi <cristian.marussi@arm.com>,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
References: <aJycJvs3xztfD5Rm@pluto> <aJzU1JsV5we-QqgQ@pluto>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aJzU1JsV5we-QqgQ@pluto>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l1H-ZrbhIlz2U0s9JuaGTZaZrmkmLRRPYkf08iSwC7A_1755114696
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_125141_454010_E623C06A 
X-CRM114-Status: GOOD (  20.30  )
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

On 8/13/25 8:09 PM, Cristian Marussi wrote:
> On Wed, Aug 13, 2025 at 03:07:34PM +0100, Cristian Marussi wrote:
>> Not sure if it has been already reported but in a kvmtool/guest setup moving
>> the guest kernel from v6.16 to v6.17-rc1 I completely lost host-guest network
>> functionality....in a very funny way, though, I'd say...
>>
>> In fact NO error is apparently reported in the guest kernel log and the
>> interfaces seems perfectly up an running both sides, but looking at the
>> host/guest interfaces you can see that ALL received frames are indeed dropped:
>>
>>
>> enp0s1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>> ....
>>         ether 02:15:15:15:15:15  txqueuelen 1000  (Ethernet)           <<<<<<<<<<<<<<<<
>>         RX packets 125  bytes 17948 (17.5 KiB)
>>         RX errors 0  dropped 125 overruns 0  frame 0
>>         TX packets 1207  bytes 51182 (49.9 KiB)
>>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
>>
>>
>> ...on the host same..(taken later on...)
>>
>> tap0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>>         inet 192.168.33.1  netmask 255.255.255.0  broadcast 192.168.33.255
>>         ether 8a:10:f6:df:a1:70  txqueuelen 1000  (Ethernet)
>>         RX packets 804  bytes 43904 (42.8 KiB)
>>         RX errors 0  dropped 804  overruns 0  frame 0
>>         TX packets 101  bytes 14408 (14.0 KiB)
>>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
>>
>> ....and for a good reason, apparently, since sniffing around on the Host TAP
>> interface I can see a never ending stream of:
>>
>> $ sudo tcpdump -i tap0
>> listening on tap0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
>> 22:40:42.309158 00:00:00:00:00:00 (oui Ethernet) > 00:00:00:00:00:00 (oui Ethernet), ethertype Unknown (0xffff), length 54:
>> 	0x0000:  ffff ffff 0215 1515 1515 0806 0001 0800  ................       <<<<<<<<<<<<<
>> 	0x0010:  0604 0001 0215 1515 1515 c0a8 2102 0000  ............!...
>> 	0x0020:  0000 0000 c0a8 2101                      ......!.
>>
>> ... DST/SRC Macs are just all zeros WHILE in the payload you can spot my guest
>> SRC mac address 0215 1515 1515  :P
>>
> 
> I bisected this regression to:
> 
> 56a06bd40fab64448aa6b84aa06b3dc470c1254a is the first bad commit
> 
> commit 56a06bd40fab64448aa6b84aa06b3dc470c1254a
> Author: Paolo Abeni <pabeni@redhat.com>
> Date:   Tue Jul 8 17:55:02 2025 +0200
> 
>     virtio_net: enable gso over UDP tunnel support.
>     
>     If the related virtio feature is set, enable transmission and reception
>     of gso over UDP tunnel packets.
>     
>     Most of the work is done by the previously introduced helper, just need
>     to determine the UDP tunnel features inside the virtio_net_hdr and
>     update accordingly the virtio net hdr size.
>     
>     Acked-by: Jason Wang <jasowang@redhat.com>
>     Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> 
>  drivers/net/virtio_net.c | 85 ++++++++++++++++++++++++++++++++++++------------
> 
> Reverting this commit on top of v6.17-rc1 solves for me and network works fine again.

Thanks for reporting, I was not aware yet of this regression.

Apparently there is mismatch between the negotiated features (that
determinate the virtio net header size) and the actually virtio header
used by both the guest and the host, which is totally unexpected.

Could you please share the host kernel version, the arch and the kvmtool
version? Also I understand you only upgraded the guest kernel, without
any other setup changes, am I correct?

Thanks,

Paolo


