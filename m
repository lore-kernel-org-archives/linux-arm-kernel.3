Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7627C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gC3niovTNsKcfBpvniJnuYKmRNkE6NrDTmNF28rL3a4=; b=F25/qMbL1ksJJ0pMawak2vfRq7
	KyWtN2Ea1ZyS1Nov5/L1ONjrm8HhJCjO5PqR8iu4doVj4FaeGMR2C65bywzqtKFpiQpqbhb8zP/Gv
	2TTDKIC34bCFwwwvDbeY7W/riX2lFDLJKrhZxwVmTAjbVbBcgTM1SJOfq8dSbRqUiglfHCOclYmS5
	fG/AUsrekdknHao0LL2rEaaFieppQ6PpHU+avLGpvrH/8nR/lTdI4rjvxk7gSKzW+k5nQ6HSNIn8h
	x833z1LYfdS3HK902TNPboTtpT/YSqUu4ID+foIqhlxGOJsblR59vT/nplHrHxMre7QnEmEIb3doZ
	NOyTABqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKuQ-00000003GJ1-39Ew;
	Fri, 09 May 2025 10:24:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJyt-000000036M1-25i5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746782722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gC3niovTNsKcfBpvniJnuYKmRNkE6NrDTmNF28rL3a4=;
	b=dA19gBvb+zrRZoUddLB6UKnLoQppR8GI11nXoYF9WU4iRyjiHTfkIrARtT0kCl/awVEylK
	L1zrCTZTAuqomboDionH4VyvyEIrta8La0SaALd4EU48DQbRqW0qZo4OnOrIKLohxVpVoy
	5M2+SzwJlj6ZbC8JYeMBWXV1w6gp2VQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-a75GpSUIPR-Tfj43oTX2BA-1; Fri, 09 May 2025 05:25:21 -0400
X-MC-Unique: a75GpSUIPR-Tfj43oTX2BA-1
X-Mimecast-MFC-AGG-ID: a75GpSUIPR-Tfj43oTX2BA_1746782720
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so777894f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 02:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746782720; x=1747387520;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gC3niovTNsKcfBpvniJnuYKmRNkE6NrDTmNF28rL3a4=;
        b=rb+NeVZBUnU6JI+c5t4u79lnru5hLSOEJCgFxF7iXhpmMiUpGLy1KumPG7WiEC3Sbn
         TQP+sD0DqXCYDVL02ZNfwxGGVmsIStoDRjDxQpA92ubNXtEQH+Wt07gXrKeTvN5lzIHg
         d1a+V0lEHh8iclueuCdIcFh8MgWcj0k0DDEBJkgYTf6Hj9nnQ2cXyDRr41ypjpD8KQtO
         lWKizdSsZ1rlNWfcoVFQLJ/yZNJzgYd83ydSN8J41Hnflwg2TPQgXKn8VtXwa2KxCD46
         gmaX3W+bStgNV3Ec2YWkfaj0HiUzXsq7QfJee7QwlD7WGLnfoATN837Wt2eFhvQZOMo4
         39Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUqNRWM6JGgpRb6xP6mjpmgb3qvx33cS5WXdSbv9cEfXnXZ5rH4Pypj84ZuuSj18vygZyXex+beVM3w7MsA49hn@lists.infradead.org
X-Gm-Message-State: AOJu0YxT4CAkY/zNdtB4udb6Esv9Vbgzr9s6ANq7OZRsC+DjjclQDHZd
	OzAdD37kgmRe81bGszEt7hzKXmSSdXN6hTQFpBW+ns0IadzBplwIDoQOb7HgXQEN2XgO25ByLGB
	QYHUCQ9RNAlSwOzeesgoyYQfDgGYWEJUybkFSBPwQbluZ17pFpdCbMvEwN4jLCas24v3sQl02
X-Gm-Gg: ASbGncsnAtCGJs54HovhN47YTkUJM3qHA789Nv8i0qjgTfouXYawSCfQBftmsUyhBbe
	bJa3jteaZEZvb8X5cEdcjRHNdUuxNMY+GjsLYxlVvr1GluacXlqj372KhqLAyMy5QsmB/wJ0N3z
	Aa/M6aXwDuYDPD5EgWoaR2nFVkX6BYrpTcXcd5HSQWCVsO6OaDB08SGR7xlV0hDX+70jMcywWMI
	aN97e6KJL3mbb+DOI+0yFd3hjLcKZfBypHtUkDifrl5jxCi2msiSZ9LBQCmER/IgjRohiVui+mp
	7mjgelkVtssyr74j4LuUcDzAm7+p505eGV5+HSi/NqpmDzOtRAf2gUw4xfypkrOjlud477mUWsZ
	7kKZXZ9gZE+447iQ5gb4BJFmIHQ6B2xjnU4e0SYI=
X-Received: by 2002:a05:6000:1a8f:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-3a1f64a4beemr1911766f8f.56.1746782720181;
        Fri, 09 May 2025 02:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyyuyKxffd2MwgFvIsx7BZh9gLdSEtqPQS6R9hlTmutbGZYTSY+BF45tOubAe4+GSiv5pt3w==
X-Received: by 2002:a05:6000:1a8f:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-3a1f64a4beemr1911747f8f.56.1746782719842;
        Fri, 09 May 2025 02:25:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfc9sm2642810f8f.5.2025.05.09.02.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 02:25:19 -0700 (PDT)
Message-ID: <8bdde7df-15d7-4f24-b358-e9ffab0de1d0@redhat.com>
Date: Fri, 9 May 2025 11:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Xavier <xavier_qy@163.com>
Cc: 21cnbao@gmail.com, ryan.roberts@arm.com, dev.jain@arm.com,
 ioworker0@gmail.com, akpm@linux-foundation.org, catalin.marinas@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
 ziy@nvidia.com
References: <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com>
 <20250508070353.2370826-1-xavier_qy@163.com>
 <9ada79ec-f2b4-42bc-84f9-3f7b461ad829@redhat.com>
 <29f1ebb9.8e60.196b45626fb.Coremail.xavier_qy@163.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <29f1ebb9.8e60.196b45626fb.Coremail.xavier_qy@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FixAVHHnQHDY6z6qQA3neo_1THEZ88VZbF7CmPVe3IU_1746782720
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_022523_609540_CF1EAB1E 
X-CRM114-Status: GOOD (  11.96  )
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

On 09.05.25 11:17, Xavier wrote:
> 
> 
> 
> At 2025-05-08 16:30:14, "David Hildenbrand" <david@redhat.com> wrote:
>> On 08.05.25 09:03, Xavier Xia wrote:
>>> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
>>> function by adding early termination logic. It checks if the dirty and
>>> young bits of orig_pte are already set and skips redundant bit-setting
>>> operations during the loop. This reduces unnecessary iterations and
>>> improves performance.
>>>
>>> In order to verify the optimization performance, a test function has been
>>> designed. The function's execution time and instruction statistics have
>>> been traced using perf, and the following are the operation results on a
>>> certain Qualcomm mobile phone chip:
>>
>> For the future, please don't post vN+1 as reply to vN.
> 
> I will pay attention to it when I submit it later. Thank you for the reminder.

The rationale is that many people will just treat it as some discussion 
noise as part of vN and not really have a closer look, waiting for vN+1.

-- 
Cheers,

David / dhildenb


