Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8ECC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8Dfh++0Ud+IxXdfXwfXS9P60ggh+Cfx9Hb6zf15cRc=; b=W3Zifc12yAhK1M5a4DipxxqX2n
	DnM9ok/c5P2jUZcFvodBsUFs8qBboi6QX9ShlV9fynOyM5ufj2sorqT9FsxQGcDMDVhE8N3qmAYOi
	y9LVmI2k1nQPrrDWZmGwaRwS8Z1Gm6uJ6sVwz9AowZakJ616m1FSWd0JEwiJ7svD9Ee/U/9j/brRi
	CYJ0StCmrv1nOdN/2ol9E/tEeUscZR+5umuffBosrxp4j4rneCBc4EMsZNLJOU5m0AozF2C2agwr+
	dGKiXH4/ImzykEuT/CfpIjUbARryn40Y1oktwHUETwqbaYatJ7Gtk5MKWB4N36xzj388x1M1Dhmyh
	x0iEiz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jLs-0000000EXNT-1ya8;
	Wed, 02 Sep 2026 11:42:00 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jLq-0000000EXMu-1YA4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:41:59 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a68279dd86so801406a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 04:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788349316; x=1788954116; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z8Dfh++0Ud+IxXdfXwfXS9P60ggh+Cfx9Hb6zf15cRc=;
        b=ZzepruNldp91yMHDI91QlZmXZ2NLsHghYmuafWub2VXPK6ZRgd8siT5ZzRwor1o0Qs
         XCsI5KLMRCK7Uot7uAGBE+amu/E/EVMKXh9pofRc8IFqAQSsGgWDP6FQAgDhMD84qzFY
         7k8KLekDUQxxSDN8YvM30ZfV4pQH4cho3/SI73+nSNfQdglZMvd4gGmNwCCWRxVRU7mC
         Nkb44KrppRgzEBv5gxvLXMIqSc0Qkqj85/l8Nqg0COAdG8QxzMxKZQDZoZc+VslfHKN5
         D5KKD4WLxNERendO/LXGqezX1z8v70lFmw76En/oxdfve4+Q7d/KWIs/yhqAZCGTtp7t
         O9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349316; x=1788954116;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8Dfh++0Ud+IxXdfXwfXS9P60ggh+Cfx9Hb6zf15cRc=;
        b=g2S7cSccG+U1evCola4hZImDLApQAZzM2aKzCwvMiYsceo2ta6102NPCsS9n4bPEaS
         wcSuy/C7qBjDpGS93hLWlyCHwmzxuMBXvKTwBaGeRmfR/fzhwGdObdiP6vZuvhkNvfsK
         JrlKV+LV4zz562iP6DIjbEYGRL51GtMfEhZyafsDqF5hAbDhBk9tpoMrGgmxsYyPSpgF
         ZT2TsEfSjj0Bs7WEGojqeZwXNs8m6jdCpT14Aqzuh85476Tt7xWHswZEjY7FFx5bp/DH
         T227etj8rUNCOxUSSbEf/CRKflFBJXofKKD+T548PrfH14aYBRol81ZkwwtgVwY9s0K3
         8X9Q==
X-Forwarded-Encrypted: i=1; AKwUvByajYb1NxbaLXjPG7Dzs/dyoEp+9it/MYAoIyK5oFzxLBKx0kATQlkkeLE7OlQqfF60sqayNgc58ZCIOFbN/7X/@lists.infradead.org
X-Gm-Message-State: AFuF++molY+/zxjWhwG0S7aRYybvK1oa3vYapNXMDFNI0ThJmxZeAolK
	gmCMtHoRZSirxvSNHCE8b9oXaMktE5QDzTRcYavKAqyrWSaeAa4LUfHz
X-Gm-Gg: AYBFou2hvKEdFgQEhNvJndxS7MF/xLHuDNQl/Ia3y/Z6v+soVLaG6lDHi6r5xZUNGvE
	fEM+WXDYBgDStpjpMkmkKpLGWIVALG0p37Q9ilxoVqKhmFQlFCgFfR0KOwgE/VFXYRobR5CYvNj
	OsRHW84V/QI2LnvmyTRFP3BiXWS0GmdEg+lhxDrWvoB5gwn41UG9ZnKYjCH8sDzaoV+9G3AblNi
	sg/rmS+QhTxe7TKYwfpzykpLJbmF5DCdiWaEM6/zGzclx5HZGjKzz+sVu5p5/ouFui6dnFx29Pg
	9VIvilS0xy/wme9SyJq+KXBk+vGuGif0fT86FbAxy1ze2SbxylS5V23T7fCslzoAW6gp3dIaapd
	BMan51EaU6PbPnfHysCun9sEXgZWxXYaXsyCze9Yz9GKFKFmVMgKyIBj2QwMrd3RjzLNYClMmSM
	i90f0GtVAyWDdRnHqC0cNrFKrSdHN5I3MlafjqmkmM3K50sVBol18KzsGKzmMkvXaiYZF9cPOWx
	gPMDn31FUimgIlATLUh2QI=
X-Received: by 2002:a05:6402:3608:b0:6a6:32f5:556f with SMTP id 4fb4d7f45d1cf-6a682ac0a4amr2806106a12.17.1788349316334;
        Wed, 02 Sep 2026 04:41:56 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d044d776sm117567566b.62.2026.09.02.04.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:41:55 -0700 (PDT)
Message-ID: <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
Date: Wed, 2 Sep 2026 13:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
To: Mike Rapoport <rppt@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin> <apaF1HUtJnstuUN4@kernel.org>
 <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
 <apcPg_y-HsMki7we@kernel.org>
Content-Language: en-US
In-Reply-To: <apcPg_y-HsMki7we@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_044158_429037_FF8DC2B2 
X-CRM114-Status: GOOD (  14.22  )
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

On 01/09/2026 19:46, Mike Rapoport wrote:
>> * Does vmalloc() guarantee that non-pageable physical RAM is allocated when
>> it returns?
> It's not pageable in the sense of demand paging. Some architectures lazily
> synchronize vmalloc page tables and this can cause page faults that will
> take care of the page table synchronization.
> 

Thanks for this clarification.

This sounds like a showstopper to me. Immediately after the allocation 
of these buffers, data from the USB device can arrive at 400 MB/s. If 
the data flow is throttled as a result of handling page faults while 
trying to write the data to these buffers, this could lead to an 
overflow in the USB device's own RAM buffers. This is because the USB 
device is an FPGA, where RAM is an expensive resource.

So using vmalloc() may result in a malfunction in the data transport 
where the __get_free_pages() would have been successful. This outweighs 
the benefit of a somewhat higher probability of success in allocating 
very large buffers, and surely the improved aesthetics of the kernel code.

Regards,
    Eli

