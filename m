Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB713CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S778EcOwu4vfuWOJY2mnN8fiVuQl9UxyQh8QCZUHwJg=; b=GJv5aR87DNUW3XxTs18FCyw1rD
	4Jw+hPOgOUl+SWuOF5cGi+y67aq8yO9INj2DW8Q+II76C6BOFpfAu6iWSpVNEVTq9tbe/o5A3umBv
	WoD321saKGimv/P8tUS09GXneAH0OrS/qyDIEe2ULTdLvZxA3UA/Iz+3ERMmnCf6mIRKLFzqE07Xv
	h5K+tLEgWSRkDaHDuzoj8aqzeUSwhZOS2SSE31v42GlVPgcTvZSZbf+XHB12ItafB7mVMxCKy9C2H
	l8RNakJgOFyg0GNIKo0jFDTORYIlgPZxvIK76amtR69gU8CBticALn4mg0t8ZEfVYgXebN8Ctgwj1
	F/8z+4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hgB-0000000HFrC-0CGK;
	Mon, 06 Oct 2025 09:38:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hg8-0000000HFqG-2AzY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 09:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759743527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S778EcOwu4vfuWOJY2mnN8fiVuQl9UxyQh8QCZUHwJg=;
	b=XuJLXB8H5M+47YRIYpNZH+Ch8zkEMPo8mknFVreLwIKBITORNwsvxtofD3fxidbGKBr0uh
	PlpgnE0jBZfnSLtE7KloLxIIXHe65394MIQX45Y/o9kbBkhZuBtRDoh5yuX+7mgEAkxqpp
	OHvrnfpHzkPG19kWJtD0yNvOvkT2eL4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-vubQM6mpMB2RXGj7WrQjzQ-1; Mon, 06 Oct 2025 05:38:41 -0400
X-MC-Unique: vubQM6mpMB2RXGj7WrQjzQ-1
X-Mimecast-MFC-AGG-ID: vubQM6mpMB2RXGj7WrQjzQ_1759743520
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e31191379so29750175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 02:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759743520; x=1760348320;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S778EcOwu4vfuWOJY2mnN8fiVuQl9UxyQh8QCZUHwJg=;
        b=rgiaDw07Uu7kYndRFOqc/FV82v31QAIOfzKMvMJCMhDHhlWlQjooe+NCFZq7HsSVOP
         jN6iDUOmnrHVG5d8bHh3Rm49oLK+Ecw/vuGK9HAcgwBy6bIlQH2MCWa1FH0mibbcmNJ6
         9wMtQff0DYBDf+AwSYKddSgp+e+iiDo0WUfa4Og6UhmQzCkJTraIEVSM9kXrR7WE9+4m
         c6Qg0gjn0QmqtcCYDx+6KLRIRs9VmVCTYrkw1gGUgg4Xo5fTO8ia6vTzvpe74X04QaPF
         m8Y4XQF6YwMKgMq7rRQzK064X9eYArDUhR0Sl6JZ8sRY7z1ITD6Yia4MhZpxfp0a8RFK
         0xqA==
X-Gm-Message-State: AOJu0YzXJ7VevD99gLb8Ro2YoWI8vhNzgB7LY9hpuT9VSX9WFEFIOYqB
	/dJVQWV4qr0wgPbHZkRJhgZwwLW3rERDrj/OvdtUBK0aol2DpytgWW3etCwBRP2XH7gHBzbGlwi
	QBkf2ISJYrXbwvY8R3p8OTVJwzzQO3y8xRmrvoyJ/L+RiLPD4AaIFtLk4vR6+t8SJJbMfWb4dau
	6t
X-Gm-Gg: ASbGnctFKcDALXeU+D/PE/caZY8/zWVq7gMno9Ci1t9yjC6crPJPMLx77r2D+jW6wXb
	W9ruAqF8W88/Wtg/M9nEzrqFHYZg0QegV+fXt9x1RSOomCQJKXTcMY+kJrWEbNU+L+4Z/2lQ6lh
	IsdG4r2i0AQffbN4+U4/a4tj0ZRmwBbZihkihGc0bUaB3qMe5SNpHhtZek7ZGhG5l857byPGitV
	0GcFSB7d6/ikKALMu2zpVfRY3Cphdx6yKbUBTN47j4UZaOCEMPu93D0kXTbDlM/bjpHXSo+5I27
	HgXvVX+o9P4s/YtEj41/IaURPL+LXsZTAa9oRqS4tQnIvQSd5zSOKJcQx+be4cgi+n+0KeDQx+Q
	mDxdbgeHX
X-Received: by 2002:a05:600c:4fd3:b0:46e:477a:16cc with SMTP id 5b1f17b1804b1-46e7113ebe5mr85456305e9.24.1759743520370;
        Mon, 06 Oct 2025 02:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM7OAxHoyOGk3NDN2YecoVvGgjn5cjalQKALBocWZeZM1YsBnGlW1kvLUy1HZOfdNvBaUkxA==
X-Received: by 2002:a05:600c:4fd3:b0:46e:477a:16cc with SMTP id 5b1f17b1804b1-46e7113ebe5mr85456135e9.24.1759743520030;
        Mon, 06 Oct 2025 02:38:40 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-110.customers.d1-online.com. [80.187.83.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c4dd9e4sm137515865e9.10.2025.10.06.02.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:38:39 -0700 (PDT)
Message-ID: <99564dc2-f3b5-46b1-a755-25d73598516d@redhat.com>
Date: Mon, 6 Oct 2025 11:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [arm?] WARNING in copy_highpage
From: David Hildenbrand <david@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
 syzbot <syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, will@kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>
References: <68dda1ae.a00a0220.102ee.0065.GAE@google.com>
 <aOACSWYIOD3llWnj@arm.com> <7af02ceb-563a-4bad-84ee-620aaa513bed@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <7af02ceb-563a-4bad-84ee-620aaa513bed@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xt8rIVEkqj2RiJWQNCsuUdSQ9zxyDJrKHe2RDmVeP_E_1759743520
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_023848_632107_13BDCC02 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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


> 
> The most reliable way would be to un-tag in case folio_mc_copy succeeded
> but __folio_migrate_mapping() failed.
> 
> I'm also wondering whether we can simply perform the copy after the
> __folio_migrate_mapping() call: the src folio is locked and unmapped,
> nobody can really modify it. Same for the dst folio.

Answering that myself: obviously we don't want to fail after migrating 
the mapping, that is more expensive to recover from.

And I think that also explains how commit 060913999d7a ("mm: migrate: 
support poisoned recover from migrate folio") likely introduced the 
issue by moving the copy.

CCing Kefeng

-- 
Cheers

David / dhildenb


