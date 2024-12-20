Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0C5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PN5EVM1NmukZNXj0qpicok/RL7e9UE7DI/QNZtLqqyY=; b=dcz/7xAzY2dxzzIY2NjBQL/OwQ
	npkRgyh5bNsCqaKoofYwpbun/IJe8zSxx3TJtUVuMQHGCsyqDOO4TM64pAOCSitWgdw7ra17b7X7D
	RXQIE2vcx/2dSjJS7+0woRXHogkP4CJ6n7pKXqZOtuXsHzIPyvODYxaTVLLWMSBOu6c+FgZIpZnS4
	kl1rtf8XPvU09U+9GFxbOtY+Zcekj/v2R2pR63aAoVXb8vScdN+Z9ZCZ8kGfxmF2N50vR3iBqY1z5
	AWDvWLhWIXOhHBugGKz1RWyT20C5PVXDwTJOGbitmiGsvVJw61S7AsFaqve7Z9KL0+H+gjPU0YoYK
	LI0H+k/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhol-00000005ou2-12Wd;
	Fri, 20 Dec 2024 18:33:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhnb-00000005oh9-2zpM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734719550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PN5EVM1NmukZNXj0qpicok/RL7e9UE7DI/QNZtLqqyY=;
	b=cMtUm2cvMMhL1CEYPZ1QI1juMRTq4ztWzPjlJ0jXsI0o8wQNLCJvIHgRM5XMNOUf+oi923
	ZYyzqUMtPx7UDfVkACHaBgp/HJOY7Iuj8xerBUH0ZMmwQ7Yo2AdVPZIbPJ/CRKaHHNNBMA
	Gt7XNuNzu61NJprXjDigG16i3RaiBQs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-_f1MRwgvN5OSPnpAMLKjBQ-1; Fri, 20 Dec 2024 13:31:07 -0500
X-MC-Unique: _f1MRwgvN5OSPnpAMLKjBQ-1
X-Mimecast-MFC-AGG-ID: _f1MRwgvN5OSPnpAMLKjBQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385df115288so1153426f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 10:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734719466; x=1735324266;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PN5EVM1NmukZNXj0qpicok/RL7e9UE7DI/QNZtLqqyY=;
        b=cykgyc5OtAW1iyvas1658jRAVxs5dm20LIVvazTd0vfG1aZo1YoGKkWH38Hu9BhHXv
         5I39mmVP3cl4OoyEEY2Qb5oCi6eIsK7BFUMk91Af8c9fTAy2AyaVo7NZBZibyq0I8nf4
         BxM7DWBdgz7ZTg/1gDRP/UR1NauMVS6ptHEvIBvuYgNQ7KDBy9J3pvJyObK8k9+fPOY1
         BOChKR4w4s5XqGRQ+adas324UnM9wo4+B3MgN4W97js54hSeL7EbhHB6bfoneJgPeK8I
         yD+zcoSUd9vazuHjvwXpP2HRbGl7MuGAyUlEpzGjqfGdAz4SA+EQCjJ1y352ullr6QlL
         kExg==
X-Forwarded-Encrypted: i=1; AJvYcCXMsCnNMWgAbmTffhiD2cYNB3113R57Uiqj+dnvi9uN9hI576z/PWG49FcQfuSKUzKwtpU2m4h5OOEvNwDZ1zih@lists.infradead.org
X-Gm-Message-State: AOJu0YxtjqDF+z5lztko6jhhPXw3/AlZM1MQFvsymq/F7wat70eX54mI
	DzG/EIEoSIqIYQYruMcZKEGKv/5Low9R2X2iUuKQb2eG3c46U8CHMBVs5Bpjjg4VVv4EzPpZXdm
	5FSuuCp1UjRtfDxpJzjpG1eKmMDXmxWLfrTw73BIpn0Fvd9VcoAu3nwgmZqmeva7fUyPXs6G4
X-Gm-Gg: ASbGnctgnskYHab4dGYhTuwgkbzimbPK40lG6rCiTcx2Sf4PfpsLA1D+YWaHEzvXiQ5
	goF4uSQrBexrnEL+Yn5RBGX11jfoHkBFCyNCC+3dqnchVga8NLXS47t990O+0sgOhJsNCLAAISb
	6V2XbagDGVzTzmJPB6rqQJzGcbStuWxCB/WBLCsmqixhyHP0xZ2lnJtugrfwH6eE/1TxHlmEJkg
	HwHUIis263gHHosuGr5mPJtGbOc+bkoDhOwVAwK9W1bRMCopoVOIqDsiQGAq5rEZiAgb5DLg8Lm
	IpfV/yZ5KxeLN4fBDg2kSE1f6XvkLNxiYOQspyJYS394TljlRBC/4end3LAl9k6ujmSukHzjcEN
	MWlOJN+Hu
X-Received: by 2002:a5d:64c2:0:b0:386:366d:5d0b with SMTP id ffacd0b85a97d-38a22408e8amr3824110f8f.55.1734719466288;
        Fri, 20 Dec 2024 10:31:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElxiFyJ9qIUioQdUCoDL6NC0K4joEuaDrLW1M/n6klr2NWFr2HJs9ZJNS8OQoynugK8eIYkQ==
X-Received: by 2002:a5d:64c2:0:b0:386:366d:5d0b with SMTP id ffacd0b85a97d-38a22408e8amr3824083f8f.55.1734719465905;
        Fri, 20 Dec 2024 10:31:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:9d00:edd9:835b:4bfb:2ce3? (p200300cbc7089d00edd9835b4bfb2ce3.dip0.t-ipconnect.de. [2003:cb:c708:9d00:edd9:835b:4bfb:2ce3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829348sm4641303f8f.22.2024.12.20.10.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 10:31:05 -0800 (PST)
Message-ID: <107dacce-87dc-457b-a2e1-e5a4699d66af@redhat.com>
Date: Fri, 20 Dec 2024 19:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/25] rmap: Add support for PUD sized mappings to rmap
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
 lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <7f739c9e9f0a25cafb76a482e31e632c8f72102e.1734407924.git-series.apopple@nvidia.com>
 <4b5768b7-96e0-4864-9dbe-88fd1f0e87b8@redhat.com>
 <volhyxjxlbsflldgs36ghzartel2tu625ubz3kfed2gdwrsamt@cpfsfhdpc4rp>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <volhyxjxlbsflldgs36ghzartel2tu625ubz3kfed2gdwrsamt@cpfsfhdpc4rp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p9z3aUCFlZgHClBXmFTK-cS2NXlSe_rh5d9JX4bWPqM_1734719466
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_103231_826427_4066B3E7 
X-CRM114-Status: GOOD (  15.93  )
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

>>>    				return -EBUSY;
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index c6c4d4e..39d0439 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -1203,6 +1203,11 @@ static __always_inline unsigned int __folio_add_rmap(struct folio *folio,
>>>    		}
>>>    		atomic_inc(&folio->_large_mapcount);
>>>    		break;
>>> +	case RMAP_LEVEL_PUD:
>>> +		/* We only support entire mappings of PUD sized folios in rmap */
>>> +		atomic_inc(&folio->_entire_mapcount);
>>> +		atomic_inc(&folio->_large_mapcount);
>>> +		break;
>>
>>
>> This way you don't account the pages at all as mapped, whereby PTE-mapping it
>> would? And IIRC, these PUD-sized pages can be either mapped using PTEs or
>> using a single PUD.
> 
> Oh good point. I was thinking that because we don't account PUD mappings today
> that it would be fine to ignore them. But of course this series means we start
> accounting them if mapped with PTEs so agree we should be consistent.
>   
>> I suspect what you want is to
> 
> Yes, I think so. Thanks for the hint. I will be out over the Christmas break but
> will do a respin to incorporate this before then.

I'll be on PTO starting ... well now. But I'll try to give the other 
parts a quick peek if anything urgent jumps at me. (bad habit of reading 
mails while on PTO ...)

In any case, happy holidays to you!

-- 
Cheers,

David / dhildenb


