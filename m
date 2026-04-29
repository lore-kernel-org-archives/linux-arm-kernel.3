Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80714FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teX1RfIUw+W1+NoFC7Q+/kP3AclaoiM1mcX9824uRhQ=; b=1odR1oCGWiSCvwGI2mZvESdgN+
	SPU+YDn+L/LWkF/leVkHuu+QUk+wMydd1EibTDRtzOcX+KUHVoWJBdJJE62skUoH3+w/Xnv+awigL
	Ql/AGmbYuHEHFkNSBzDdurZ0HbIZYgdvHyK7M9yWctCARK+x6A30zGy8csn/jCEk7nh04K7ydL/dl
	f5C5Bka53hFdmiVHpSKhqP1U2zZAfl4Edi0DBFq/F3WJfdIz4xAm7mPbcZv0fnqBCSKZ712EV48Kb
	XvgL7FD6CF8UV6+M6ODoYeweKv0x5yAXJB9GKGpboU9xDIMVu/KNDijBtJaR9WA0Q4PzvlmDM2XM8
	nRVdovzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5bE-00000003jYN-48DJ;
	Wed, 29 Apr 2026 14:09:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5bD-00000003jY5-0wIB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D5EB60139;
	Wed, 29 Apr 2026 14:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2743C2BCC6;
	Wed, 29 Apr 2026 14:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777471750;
	bh=MyPkCw4jiFzhBkwRoZCQ5vZDCBPFzZNsYDO5Ul8+pDM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=GvkrbslP/xhdKJvHpqOyen0INL8SLOmZNu6E4wYpQdza02dOyBb3PBmTle1kQ/33p
	 Vt919aGM/B+6kb26JcRM2kKyMjjzaZFtJB7fenpPCNK05hEmwhgWo6pw9S8DL+tBxl
	 ngFCz4B7AcO53hXHQ+qdsSRdjCJiu676D5OUIT8yZ3BvOGyDn/k/8VOic8a+Oas+Ck
	 9a6DqRZa/yUvikwYhd6028WYPsOTF5VX0OkNvv01rLSUp0mu0yv5mZdR+g9yYYNYAu
	 fmofb4WU6OVnLbR3kjAClZ/ej+ePosGPDdQbalAovib3P7c3axIb31T+05CW0Ko1OU
	 QrNulooYd/eRg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id C7AF0F40072;
	Wed, 29 Apr 2026 10:09:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 29 Apr 2026 10:09:08 -0400
X-ME-Sender: <xms:BBHyaegzIbsF-36lyYjViSyRSbWG03AfdMOlRVyxm2zRLO_jWi6maA>
    <xme:BBHyaZ1dNGfn8xUgJn5iF7rJDtBrPWiw-FGV1Vdgd4VBs3SKgQDr7rZPNFVuuzD_z
    g1AY688QHCx20U-NPxM_c4SC9ZI7n_LKFh-K2QL4WUTZl6CDT6vaRc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekgeeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieej
    fedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrnhhshhhumhgrnhdrkhhhrghnughurghlsegrrhhmrdgtohhmpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehkvghv
    ihhnrdgsrhhoughskhihsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlh
    grnhgusegrrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhm
    rdgtohhmpdhrtghpthhtoheprghruggsodhgihhtsehgohhoghhlvgdrtghomhdprhgtph
    htthhopehlihiiphhruhgtkhgrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehsvght
    hhhjvghnkhhinhhssehgohhoghhlvgdrtghomhdprhgtphhtthhopegurghvihgusehkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BBHyaRjbJpfo3Sp2bx_kbAgIBsznqF-7o2l8YvD3KVKbNBxsKgDoMw>
    <xmx:BBHyaSWjBLyZpyeGWlwyvH7noyRiDot0fPUFzM4D8_UA7Hm1H4OshA>
    <xmx:BBHyaStXnm6Tst5HguJgmDEkVJO6WSz_MgFXe3fHquwDnJ6GJCHxtQ>
    <xmx:BBHyaTZ-pErfCj9Z36BHMOK4XbgWHcaHgvtLC0GhgQMZfK5Wtgxvzg>
    <xmx:BBHyaT7dF4IIVlcesDLk5ihBXcH9ZhuVpxtkNa4meQGsB6_8ezuitEWf>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A10BF700069; Wed, 29 Apr 2026 10:09:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 29 Apr 2026 16:08:48 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
Message-Id: <5e0a87ad-50d5-420b-ad5a-c2882a619b35@app.fastmail.com>
In-Reply-To: <21a547ae-7121-4cd1-b203-4d8182eb7cc9@arm.com>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-32-ardb+git@google.com>
 <21a547ae-7121-4cd1-b203-4d8182eb7cc9@arm.com>
Subject: Re: [PATCH v4 15/15] arm64: mm: Remap linear aliases of the fixmap page tables
 read-only
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi Ard,

On Wed, 29 Apr 2026, at 15:57, Kevin Brodsky wrote:
> On 27/04/2026 17:34, Ard Biesheuvel wrote:
>> [...]
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 84d81bae07a7..e76fe5b0c5fe 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1076,6 +1076,11 @@ void __init mark_linear_text_alias_ro(void)
>>  			    (unsigned long)__init_begin - (unsigned long)_text,
>>  			    pgprot_tagged(PAGE_KERNEL_RO));
>>  
>> +	/* Map the fixmap PTE table at __fixmap_pgdir_start R/O in linear map too */
>> +	update_mapping_prot(__pa_symbol(__fixmap_pgdir_start),
>> +			    (unsigned long)lm_alias(__fixmap_pgdir_start),
>> +			    PAGE_SIZE, pgprot_tagged(PAGE_KERNEL_RO));
>
> Is that definitely just one page?
>

No it most definitely is not - thanks for spotting that :-)

