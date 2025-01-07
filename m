Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86099E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPWLOfPPpQOf9nQB18V4X5aXAnWnhoDaHH+uIltQ4Xk=; b=XuPZymQCZgLa8P+FqkWsUZDmTN
	ttdEpg3QzG1bVwzhMzD/6urh3Nk80JM56VlQxR1Xyx3LVHsDLhRdY9QycZEU2uAg8Fo6imAIMvmwO
	EBv1Hj4nXAYm5RjYN7L4Lz0REzeo//K+cA5Fz81KnjGfYtd67LGuuF1WjOmLptivu9ty938dw1RMr
	jzxC66hwZDUtQEPBI+BriOUzB0QxauWQTk/LRIHwWhpnn6BRjIbxdn0tle7XDEfmbs+ijodX6x6fX
	4R15qbwmhRoaqWooPqfO3ncuSP3PJvC4MKscWQD+Nmiur80zi5CoNZggcgEzYNL39aFQQ5M5DbfLY
	VkYrNqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Av-00000004eNN-2e6P;
	Tue, 07 Jan 2025 11:55:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7tM-00000004aUS-1BfB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736249819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EPWLOfPPpQOf9nQB18V4X5aXAnWnhoDaHH+uIltQ4Xk=;
	b=Jtgof/lKu0Tm5zJLEbTAlesqcaGtffjwM+qeV0AhwIJ2JkSQUICatjuc10aA6Pw7iGb3WL
	7mSEKdF3YZZ3c40PhS5LyjgYo3a5gbRjMFkI0/OykqoxxAaO2ZWk5dOeeKDWqfFF8ZlfWj
	0zlYO7tW3u1JwvKtoeYt7U/7GOohbKw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-Jut6KsetOY-SP9kR--HZ9Q-1; Tue, 07 Jan 2025 06:36:57 -0500
X-MC-Unique: Jut6KsetOY-SP9kR--HZ9Q-1
X-Mimecast-MFC-AGG-ID: Jut6KsetOY-SP9kR--HZ9Q
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43582d49dacso104667625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249816; x=1736854616;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EPWLOfPPpQOf9nQB18V4X5aXAnWnhoDaHH+uIltQ4Xk=;
        b=P+Ev/+Z7eKh5wEQLTciD+kJmRwgtqykxP905GFrdBBCqh/YTgB8hwnlaOuKfJ4J1u+
         Ff8jxgT2WqiK3XGVUpk1UiWmgVftdL01vJefeBVYYtvIpY3JxgG3yQNnEl6KGxE8m3hC
         Io4MJsZTGc9kI1FEZQwLTcB5hqhXi0GwEymYA5EEQM5+kmUZdX8n9r3+0TgMyScnxHdf
         GyPRT20tjptYhzuaN07pleGVM3slX9+QOQAuYA9pCraobAxzOgun5TWRB4Pb9OHuof1L
         bM9pKvhvNwwCAAwvkJUPq+yd7q1RJKpO0bOlDVofBXVLys+iuKgxgOXtEEQVwgCPuRbW
         euhA==
X-Forwarded-Encrypted: i=1; AJvYcCXsOhAyGhgBt153zorgMLHEMVYAGxYsgxwIMx4482BP4Xq0Cpcr8FqxLAw49hmq6OJvq1Tq8QeGdFqxOTZtvgcg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7AmDktwvC1wY9fQ1qO39h5wbexpri2GqB2GoZM79aAYr/4YmY
	srKcA37UuuPJii/5jcm3Awm482cxnxjpMEhwHSprlt0RZDLLEKmvyrv+bnwbpqwLQtuzPi/MvCa
	LNXT/tiYLLOw2sOZaJCkx2PK4yHaV76DAyEhMEJFhmOPaklQwpEroUaSyeKe7j58c4J3Ge4G3
X-Gm-Gg: ASbGncv3YJX0w/unvh11aVa7nKM1RItXhacgvPJoR45XjPJ1p+fQcWscCNiKbfrADy0
	ViBEjrpWJ+amZfFGfnheup5uCk3HNpqDhBOtLNvjd+SeMpXokg5lojH7hgXoX+WoWcIZLVuhYcX
	ZQVKjlJc1GoR16vAufblHqRFI+vXI6YbJOo1W4OXRaAZ8tVSZEWVuuxEJXVaGfO7gM2RvZNNkgM
	Lk1C8QupVekYkwTFlGfnC4FVd5GeSZrWJL007c5RX0iASX8OCvjBvzV6MF06a75udA7+9HDSHj6
	KU6wXjLS7QvIuptCa3WcqLkythut6RO0WWu/2/7o9ieVTtNbTsION/hF84uAALw5q4YFeFuynJA
	83k1eDngU
X-Received: by 2002:a05:6000:704:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38a2213d33emr54453852f8f.0.1736249816127;
        Tue, 07 Jan 2025 03:36:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaT18MaorKDc8f0dPQnq8Hx4Fd5WTGife38GGjyhvgZNdMgf0zcRP1rbdU6qLK3Zfzio44ww==
X-Received: by 2002:a05:6000:704:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38a2213d33emr54453824f8f.0.1736249815752;
        Tue, 07 Jan 2025 03:36:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c719:1700:56dc:6a88:b509:d3f3? (p200300cbc719170056dc6a88b509d3f3.dip0.t-ipconnect.de. [2003:cb:c719:1700:56dc:6a88:b509:d3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8292f4sm51029779f8f.3.2025.01.07.03.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 03:36:55 -0800 (PST)
Message-ID: <758c0441-2cb9-41c4-bf70-c5810726779c@redhat.com>
Date: Tue, 7 Jan 2025 12:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/25] rmap: Add support for PUD sized mappings to rmap
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
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
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
 <8830827577fec4c6c2a0135e338723a5b532a2ee.1736221254.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8830827577fec4c6c2a0135e338723a5b532a2ee.1736221254.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fUo4ZE3a21HubM9r3tZYz5iuvD4dHjrJX_Ky-Fbw7Es_1736249816
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033700_402874_08D42E6D 
X-CRM114-Status: GOOD (  20.11  )
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

On 07.01.25 04:42, Alistair Popple wrote:
> The rmap doesn't currently support adding a PUD mapping of a
> folio. This patch adds support for entire PUD mappings of folios,
> primarily to allow for more standard refcounting of device DAX
> folios. Currently DAX is the only user of this and it doesn't require
> support for partially mapped PUD-sized folios so we don't support for
> that for now.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes for v5:
>   - Fixed accounting as suggested by David.
> 
> Changes for v4:
> 
>   - New for v4, split out rmap changes as suggested by David.
> ---
>   include/linux/rmap.h | 15 ++++++++++-
>   mm/rmap.c            | 65 ++++++++++++++++++++++++++++++++++++++++++---
>   2 files changed, 76 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 683a040..7043914 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -192,6 +192,7 @@ typedef int __bitwise rmap_t;
>   enum rmap_level {
>   	RMAP_LEVEL_PTE = 0,
>   	RMAP_LEVEL_PMD,
> +	RMAP_LEVEL_PUD,
>   };
>   
>   static inline void __folio_rmap_sanity_checks(const struct folio *folio,
> @@ -228,6 +229,14 @@ static inline void __folio_rmap_sanity_checks(const struct folio *folio,
>   		VM_WARN_ON_FOLIO(folio_nr_pages(folio) != HPAGE_PMD_NR, folio);
>   		VM_WARN_ON_FOLIO(nr_pages != HPAGE_PMD_NR, folio);
>   		break;
> +	case RMAP_LEVEL_PUD:
> +		/*
> +		 * Assume that we are creating * a single "entire" mapping of the
> +		 * folio.

Misplaced " *", can likely be fixed up when applying.

Apart from that LGTM

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


