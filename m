Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D07C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZGf0xi/4b8W9mpMXk16WtP1In4vsvOrm+YoAOgFYnY=; b=mu0zE6k/0CLxvk
	MyfE67mVEVjVXAVizXi4HmL47y/Un/ZDGvE2Gth3W7SvkGDYa4L5Ez6lZetNJBMwmApzsKn+Eq5Vw
	js9lN4crPoB6hCAck8MLm41I07L7gvSwATGZoo+v0P9Taj6mCsdphLTXpUUzXJP9Rw/Tfbady+u4N
	CvtgiTVCYlvcRogqHAghtncCKSFUO9EJujb80kmZP6xpZIPshsKG9NDqOTU9MGBetndljFzajvfOA
	K7EypzK4nRGsRJkCmNer1+zim2sXj6axBE5Z87Knbb1kvS9vFtEkniCsM3AqMXiQoR6Xi8T/bwmua
	8RuvJGtlq1LlHSOOJdRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmgG-00000003C4z-0f9U;
	Tue, 11 Feb 2025 09:35:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmal-00000003AkW-26HP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 09:30:08 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21f61b01630so54643935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 01:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739266206; x=1739871006; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZGf0xi/4b8W9mpMXk16WtP1In4vsvOrm+YoAOgFYnY=;
        b=ZSXhBw1U0mbR2TRp2cct4a/5WCV8TpEUelCWEvrSPCRrD8estdM3Y/WeclAXEtSqIS
         V5fMj11wVAoDWg9+l6Ihd8xwLoUWLBUfi5orhp3NXF74gtz/BzdIaHlJTSAtPyV9hhVt
         dTR8JQ/GH3n03r7GtLy4leGfIqYzjbohqrXQjR/hy3o6x5HNVKGD9kz06TWD0UqPRhqU
         qlWV4Tv/2+rvFUcrCGEO7cGkzj8c6T/PzRYP3TNdbGrtSeyqqrXfn9AFiyqCxIcGmQQC
         EQueb687cYoRw5NnH8QSQRNAPGrtpTiBj7kUBkXQ6vEODMmCTBjYNDSzW7+9dty+xYaK
         mTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266206; x=1739871006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZGf0xi/4b8W9mpMXk16WtP1In4vsvOrm+YoAOgFYnY=;
        b=e/H/HxiqyuIwEjK1cyEbK4LZ9NF3wBxEo59DviDXG95eon8x/lAsdKdXEZ21jtekaA
         4RX+s5QgpYKXZlIzVpLOQaO5M3pGEsORZ4sI7sj3u6qmr0KJ9JdZjuMIQW7ANOdGa+Bt
         h+A1DbS6xl7gSY4KPi0awL33ElNUIx+cubfwubtRIPNbP4zSB+6p0/aM2+mCgQQIf2c8
         4ffKoOCF4WM4hPhFtt4nnU7nH0nTuNYIwXG1dXZ9f6m9Zm59P1l1WcViDbw/RjrOwdl/
         0HL+78lgrwxXohhCwuKfZUJd4xDEzWx9ATgZ6xmTfixLxTXRu63dGP/COXPv1NSlNFQp
         mr5A==
X-Forwarded-Encrypted: i=1; AJvYcCVAWdGfwIaKKrAZ6rz7egX3nAcblmc8CDlRbutb1SQ1nqVV3RRM3HnOfy1qClEWD3ozF/dsdVaO93yaOzKe/0Xv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6BRH4NGfViHp/+LvsuTSBp7cZ4Z0xRxxkedkV27CakzHuWbh1
	ihxj831MD+N2ZuiREUu0NLIBgU+UdA4ab4i2jBL/QhY+984vqqe7kzLysiboL+g=
X-Gm-Gg: ASbGnctG8GUV7fcd2KJ/LWLulbsnWep3KHGfCI3aFJg2fzZXonVCc8yv7sKOVxFmq87
	OlZEgcgrWsvZ27pMyuN4jud54ZpJNY0Dxbx1e86E850YTm9Gday926G+4biXgwguiOwz3ywwgt4
	OsciTWZQv1AdxG5Gay4JdouQUxC2yET/FlQ1o5uOvI5nfnlGrNb81lGfPtMwlLCKTM7Rd4CcIHE
	vJoYP50IMhDOr4Qz9TyT3aiUzAvbShjjVzrumQM4nY2PHiTBrmtYu0psFjMrIRW1RJqxy23ElQp
	deE8guKcOnxZ48CWVYIEzGfzx7Y6wNEVbPmWOqqn5g==
X-Google-Smtp-Source: AGHT+IHz2wraFOMYkQVidUPLFFmnf8k8K12BClWjhTy636Rw37Ve8wP0uUjF/xA18SklE94GG5V2SA==
X-Received: by 2002:a05:6a00:194e:b0:724:db17:f975 with SMTP id d2e1a72fcca58-73218ca2438mr4671628b3a.12.1739266206470;
        Tue, 11 Feb 2025 01:30:06 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730932871f1sm2921625b3a.151.2025.02.11.01.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:30:06 -0800 (PST)
Message-ID: <3f7babee-b232-4e6b-a896-947150dcd1ef@bytedance.com>
Date: Tue, 11 Feb 2025 17:29:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
References: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
 <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
 <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
 <34bcf011-b4ac-479c-92ce-852623e73039@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <34bcf011-b4ac-479c-92ce-852623e73039@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_013007_554689_9ADC3DC4 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Roberts <ryan.roberts@arm.com>, open list <linux-kernel@vger.kernel.org>, Hugh Dickins <hughd@google.com>, Muchun Song <muchun.song@linux.dev>, Ezra Buehler <ezra@easyb.ch>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport \(Microsoft\)" <rppt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2025/2/11 17:14, David Hildenbrand wrote:
> On 11.02.25 04:45, Qi Zheng wrote:
>> Hi Russell,
>>
>> On 2025/2/11 01:03, Russell King (Oracle) wrote:
>>> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>>>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>>>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
>>>> dereference resulting in a kernel panic. The culprit seems to be commit
>>>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>>>> Reverting the commit apparently fixes the issue.
>>>
>>> The blamed commit is buggy:
>>>
>>> arch/arm/include/asm/tlbflush.h:
>>> #define update_mmu_cache(vma, addr, ptep) \
>>>           update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>>>
>>> So vmf can be NULL. This didn't used to matter before this commit,
>>> because vmf was not used by ARM's update_mmu_cache_range(). However,
>>> the commit introduced a dereference of it, which now causes a NULL
>>> point dereference.
>>>
>>> Not sure what the correct solution is, but at a guess, both:
>>>
>>>     if (ptl != vmf->ptl)
>>>
>>> need to become:
>>>
>>>     if (!vmf || ptl != vmf->ptl)
>>
>> No, we can't do that, because without using split PTE locks, we would
>> use shared mm->page_table_lock, which would create a deadlock.
> 
> Maybe we can simply special-case on CONFIG_SPLIT_PTE_PTLOCKS ?
> 
> if (IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS)) {

In this case, if two vmas map the same PTE page, then the same PTE lock
will be held repeatedly. Right?

This seems to be a problem that existed before commit fc9c45b71f43
("arm: adjust_pte() use pte_offset_map_rw_nolock()").

> 
> ...
> }
> 

