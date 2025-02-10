Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B7EC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYWKjcQduNIKs9dJZokUUBWiThkKPtNIV6gvjS6SD6Q=; b=St+mC1GcjnLi0Fu6OmeED7Gkzj
	ONFIpPtUmhjkUhPGfy24vC++9Bcgm2/qmDZWszAos2njrsbM0w/mTIc6DKnaWzISwTnDPdqUlm5ce
	dLd3FNttpmWx4QrQrVYV/ISOc3ZJyVh3hzcCYGG2KDxqBCURueDuAl46wKk+Um8pkUg1Hk4jY+qy0
	Gm1wH1Yi18qxRxeJPKtOtZ35DtaXYOji8gN/vZxtPZXSnfYbV5GBKUE4mS+qBJBlNZ5U40RcYjIF1
	x/S1c6UQQXKVUFUDF4YdPpy7COrS7uxIeIK18y+cOnaTaLF/ENIey9iqISwrAPREWyvASSy5tKudR
	fxBpmuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYQ-000000016RR-2I9G;
	Mon, 10 Feb 2025 19:34:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYh0-00000000y4x-03Hx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uYWKjcQduNIKs9dJZokUUBWiThkKPtNIV6gvjS6SD6Q=;
	b=B2rs4NTGdHoIQkIY0EFl9QvgmvMgc85hLzyHtjTlmz+DTPBQEgVRW224WssO28UDhc0LNI
	i/3Fz9WoBX1sN1A8LjjJ16UVTyL+sSWTYsdC+FwOy1aIy8eSOi8FWYXV6IxH0JTlDYv9dK
	faj3/cVj0UqZPw0Gu7BzJ4i7ouEFJnA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-V9Q_iEBmNUGTgUb-zy7iFw-1; Mon, 10 Feb 2025 13:39:35 -0500
X-MC-Unique: V9Q_iEBmNUGTgUb-zy7iFw-1
X-Mimecast-MFC-AGG-ID: V9Q_iEBmNUGTgUb-zy7iFw
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38ddee8329eso689310f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 10:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212775; x=1739817575;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uYWKjcQduNIKs9dJZokUUBWiThkKPtNIV6gvjS6SD6Q=;
        b=MqMJ/EpJJkLNpElC+hZePpJ5ou4nfz3fQ/mqH6l/xlPEPL68JrVHfDVcfVge8+DbR7
         io8L6yVBpPQXU9JDxhW8N2xU6hXDqOMVzHvXqQulyOAuy+czIB2GEHljspVWpZFSN12V
         eCpvE8v9hyl18bysxxq6rf8BtaVMfR4pM1uuS7qNsigkMb8IlwdziXR0/ySvrAwcdITE
         3gc62/ZsAZ5tzEh3DxbBzBqNTEJECarzgDbYOTVyDA4/E2ViOvSPUswEHb9VqT5dQ43b
         2l6EGf3zNpeflGCfuU6fCkyUJud7W0ZWeuWfZwiaJHmXvsNJaQpAk+41BrHdNyH64fYK
         UO/w==
X-Forwarded-Encrypted: i=1; AJvYcCXPW2kUcAfhLNgdrF3gxdOtj8E7Q7RGlUZSDbFLHMZHHcaChNMONrVjor1vutVrNodsE5CewZ/TaBYUgx9aVhgU@lists.infradead.org
X-Gm-Message-State: AOJu0YxnWwF3IWTkNoX0xvYEjyUzzYWkIzFLjMy/Z48ArMdKYuasHRvk
	cDLOkxyD1HeRUlW65pRC929wy1jRB06uc7GidVbtjXg8Wtk2LqVtlL/yU/hgNpq5bFzs4ozBi+I
	BBB2kxjvpmub9j3EQD7+/MWdHC5v9Uc+rrq18go8chRhezf/pXTSqUHcG938Z7mjW7l+oBInz
X-Gm-Gg: ASbGnctlDH7PKb/v5IyphxiP4vOCHGCwxXnE7al+5EMn8KFxTaNT0RlnPbAcC4vd2Ru
	sBYbJZ6hVOs2Zk/EduCe73Y+bs0H4umhncGpR0xTGNGPqzNwh1xlbC8I/RaK9pCG2I4RIT304Y/
	MtfpC0TltWZoz6FZnNAVaR1tlfxUuVNghEAhIh8PNWQT5C1brI+6OmskG8jGmXXMN7QqdVUZpow
	EU4c8GACXcR63Zri7p15iv3Aj1OPL96qvGIcVnVQoOjTVIfPcvMsPltMHwhyjalkevYqStxzGWS
	l97ip/HW3SiYsUxSm9EKwaoBdAujLVdKbKU=
X-Received: by 2002:a05:6000:1fad:b0:38d:ce70:8bdf with SMTP id ffacd0b85a97d-38dce708d90mr10228201f8f.37.1739212774663;
        Mon, 10 Feb 2025 10:39:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvxARJ76HOuGFHzWjgTSgJca+XchsbC+N32+KUziB434soeJwYLOC+oL+ipLCoVO9VZXSzlQ==
X-Received: by 2002:a05:6000:1fad:b0:38d:ce70:8bdf with SMTP id ffacd0b85a97d-38dce708d90mr10228169f8f.37.1739212774160;
        Mon, 10 Feb 2025 10:39:34 -0800 (PST)
Received: from [192.168.3.141] (p5b0c6c7f.dip0.t-ipconnect.de. [91.12.108.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd2e0765esm7764114f8f.82.2025.02.10.10.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:39:32 -0800 (PST)
Message-ID: <48dec767-3e14-480e-a3df-1298315894f6@redhat.com>
Date: Mon, 10 Feb 2025 19:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/20] mm/memory: Enhance insert_page_into_pte_locked()
 to create writable mappings
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
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
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <7db953c8cc5a066b4aa23dbdf049c6f35cce7b99.1738709036.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7db953c8cc5a066b4aa23dbdf049c6f35cce7b99.1738709036.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SzKqAAtJXsZU2XgVq_rwaTZ-H99yWZzrQCEOXGzz9PM_1739212775
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_103938_129849_B39462EC 
X-CRM114-Status: UNSURE (   7.75  )
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

On 04.02.25 23:48, Alistair Popple wrote:
> In preparation for using insert_page() for DAX, enhance
> insert_page_into_pte_locked() to handle establishing writable
> mappings.  Recall that DAX returns VM_FAULT_NOPAGE after installing a
> PTE which bypasses the typical set_pte_range() in finish_fault.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


