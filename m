Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA5FC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2VmyAImjj4hzOnuu3f/wVygVhYGF647p7FjFNq+/QM=; b=kyL9f0psHyrrcO8+Yg5XPLXd1j
	PO/X+oAelsp8gIk5EH/h9SzzJ/e7aCAuKOzEk9aFaK+kTkZUDJduIUd7mYN/HrauXXjd/eS042KKF
	a+dCDMtQLjOcpPP0YhvS3FWFX6aDoZIWCErZwvT5cZhRDJNmRGbZUpsTsrOqeFes7zVpGDbIxO3cW
	F5fD2O/Kxi+36quSmvpcUgVD3FsGQRjAvT1wdYLpcrqTv5Nbc+JdsFK8i4yCFZivgUi+tm29YBwhA
	xJ5L7OIpMuGNAF2FxvGrkAKG5mL/aT/L04SGy8hBz22b5Bl9wEAc75+1NY55QcHUe4Lkpvar58SRN
	Paw/dFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1pT-00000007T5N-3YjD;
	Tue, 10 Jun 2025 16:28:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzHG-000000071Eu-1lgZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749563073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x2VmyAImjj4hzOnuu3f/wVygVhYGF647p7FjFNq+/QM=;
	b=LkiwWJx7fLx5lxDlT7ibg1gve2GKFd8GiUmhind+iP7/zgeePqtuSOIqz+NicA1fOu0Yxc
	WGKOJ1HF/YXl2NkYId4g0rhG/3tC25UdDSnancm/sxkXugixw43uyTGais2v1YeXjzm09m
	9CttQv9UCn91gFBjhfMwFoEGoUR2j80=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-34IhIaoLMn-4UE2rJ_zktA-1; Tue, 10 Jun 2025 09:44:30 -0400
X-MC-Unique: 34IhIaoLMn-4UE2rJ_zktA-1
X-Mimecast-MFC-AGG-ID: 34IhIaoLMn-4UE2rJ_zktA_1749563069
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so3619115f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563069; x=1750167869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x2VmyAImjj4hzOnuu3f/wVygVhYGF647p7FjFNq+/QM=;
        b=wNovQ0CFyxMRzCRlQ7JHvZCFBC/LGKEQFd+Y3ZnUTQUEW5vFLowZlP01k4ZLxVFioc
         EJu0nVBzLwkTL3ZvbX60d2fR4GqEwEfJ+zdw15Zreqv37v1zH7Tw0AHhAmHGyphGxA/W
         H/1Mr+QPzFCjkLyG2IXBWzHrkZozwchv2kB6muwj+d6erfpZPqko6TT7TtT+Rs9T5LXr
         TpTrNu3GYKf9CcTFwGK6Einq69c6w9CE27EFG1CGuK2eNc8/4qwuIhwaT12/nhUKo1ag
         Rxe5qvj5J9UYTxYci2LWqrw4O3Wq3xhpfM0vKknfXRWJFb1RHblcxi1sPf8H7KtZgxxr
         Cemg==
X-Forwarded-Encrypted: i=1; AJvYcCVYLS17R7RDt94o4gImJiUVkxuAM9JV7kWbZlCGQM6tSjyqLASis3wHcn4qnDCdgklrwtZXQW4Jl5tbEsSV7qom@lists.infradead.org
X-Gm-Message-State: AOJu0Yyps7yA/PJvyvXK8y+Nrdlegqj6/8tjgEyKR7OCp/2CWhPaOIPO
	EG5xOD2GP+3zbkKY2aOt5N/vvPEgd/DgLkgxN79lXgarj9pnpMShjIBhbQw96golvrCmQbPl9cU
	h1OMKawwhF1XNcRsbbOr3oatBmP4LJIql27tnfiX3tINs+BQtVE+Gy19KNMppYQe3QLPVlA18G4
	ukDWQqDLoptAo=
X-Gm-Gg: ASbGncsxkAj+tNS4aGwH/qFGfHryTaTCdjPoAjJCBOVq/uRKfQ/ahnhQVxNJkfd5Ft4
	emrjeyIzOLxg0pQotJ5/0geGV6cidzRfNCv3KvGBdYafjpoBY8TssyC+LH35g/YFTT8ZX0zJEEM
	Tv86yan7vDWD7DsnM8paUFRk8LTYtZ+TgeTO7wGVJP3NeuxzC5boK6viCO0sFrA0jzfgIA9DA4d
	7Htyq8LrsA5lIfHZ9iri34KNU+JS0rQSrNf7k/HAkWZfPGgTQMvBAXyMT11aKEnOGFYjBOwUiQG
	742Z8vyYFxbSeSXd5Aj17Qs7/THn28YFIf96VDyIcplstESfBejPWSw=
X-Received: by 2002:a05:6000:290f:b0:3a4:f655:8c4d with SMTP id ffacd0b85a97d-3a531cafc03mr14432419f8f.27.1749563069100;
        Tue, 10 Jun 2025 06:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu/x/Paa24Rvj8SNK0TN6cfVpKUqZgPCpL5Aazl2BPcT87efCPXFP3jrKdeAxwrMIiICtIHA==
X-Received: by 2002:a05:6000:290f:b0:3a4:f655:8c4d with SMTP id ffacd0b85a97d-3a531cafc03mr14432395f8f.27.1749563068705;
        Tue, 10 Jun 2025 06:44:28 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320b16657sm14394555e9.8.2025.06.10.06.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:44:28 -0700 (PDT)
Message-ID: <881baf6e-8118-4d09-86dc-09dcf3a3cd02@redhat.com>
Date: Tue, 10 Jun 2025 15:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
 <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
 <359668fb-df61-4135-89ee-2675a06a5c1b@lucifer.local>
 <bea0969f-5a6c-4486-aeba-964fa79bd714@redhat.com>
 <1c4714bb-97f3-4261-92b7-34223a32e016@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1c4714bb-97f3-4261-92b7-34223a32e016@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kkBTBHGyutjvuhARJfoJNmDZStAVCdN0RqdNnCgFgyM_1749563069
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064434_539454_30DDE98B 
X-CRM114-Status: GOOD (  16.14  )
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

On 10.06.25 15:35, Lorenzo Stoakes wrote:
> On Tue, Jun 10, 2025 at 03:31:56PM +0200, David Hildenbrand wrote:
>> On 10.06.25 15:27, Lorenzo Stoakes wrote:
>>> On Tue, Jun 10, 2025 at 03:24:16PM +0200, David Hildenbrand wrote:
>>>> On 10.06.25 14:07, Lorenzo Stoakes wrote:
>>>>> OK so I think the best solution here is to just update check_ops_valid(), which
>>>>> was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
>>>>> enforce the install pte thing).
>>>>>
>>>>> Let's do something like:
>>>>>
>>>>> #define OPS_MAY_INSTALL_PTE	(1<<0)
>>>>> #define OPS_MAY_AVOID_LOCK	(1<<1)
>>>>>
>>>>> and update check_ops_valid() to take a flags or maybe 'capabilities' field.
>>>>>
>>>>> Then check based on this e.g.:
>>>>>
>>>>> if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
>>>>> 	return false;
>>>>>
>>>>> if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
>>>>> 	return false;
>>>>>
>>>>
>>>> Hm. I mean, we really only want to allow this lockless check for
>>>> walk_kernel_page_table_range(), right?
>>>>
>>>> Having a walk_kernel_page_table_range_lockeless() might (or might not) be
>>>> better, to really only special-case this specific path.
>>>
>>> Agree completely, Dev - let's definitely do this.
>>>
>>>>
>>>> So, I am wondering if we should further start splitting the
>>>> kernel-page-table walker up from the mm walker, at least on the "entry"
>>>> function for now.
>>>
>>> How do you mean?
>>
>> In particular, "struct mm_walk_ops"
>>
>> does not quite make sense when not actually walking a "real" mm .
>>
>> So maybe we should start having a separate structure where *vma,
>> install_pte, walk_lock, hugetlb* does not even exist.
>>
>> It might be a bit of churn, though ... not sure if there could be an easy
>> translation layer for now.
> 
> But you know... I looove churn right? <3 <3 <3 :)))
> 
> That's a nice idea, but I think something that should be a follow up.

Yes, absolutely, just wanted to raise it :)

-- 
Cheers,

David / dhildenb


