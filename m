Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0C5CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpDM1obzK12bUteESwrJgWTMch0DIESyPnVssVZOnU8=; b=b9WFUqY5eDygNdzCx6jb9Z8Tbg
	BIQu4UjBbE2OSljg2okiiwNMmvD1Jd04pfKqWaxNx6E6WjKMvR37alMVDesK6MCj88nFmxAh7ZMgU
	t0OiAIwYaIKDhshq79QCPasR9iuEOMP5XL/a6PVzqJieGHr7CtZw05ogE6OOBCbyfW0FrAnyx40oO
	Wqj0SzWwWURx42YrIbDyagBCwJnonkDmTl1Anc1mnvytvrLnS+lZTJLrGgEc1OiUnTTtWcFNCttgg
	6yP296OAwJ1EIR+rxAjo4OeGAEv5wbqzlnoQbda+puW+6UhxYoGPI+aH8HbuwgoFWdJdManJOqF1g
	6dL7yJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8Cg-0000000DRPw-1CPd;
	Mon, 01 Sep 2025 17:20:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut57y-0000000Cnbv-47gC
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 14:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZpDM1obzK12bUteESwrJgWTMch0DIESyPnVssVZOnU8=; b=erZ3y/6yUNjjjS/7fKG8pdr7SW
	ygCO9K5N+Q2UOIS1+I8AkwMlKauCAQRMIvwKjRiycVxLpMZ92PnyYTjLqjpYLiUkWUtQWzy6z12OD
	jKrvWpNZ5C7MAGqhHgYl1JwcPfLmYdzOIaQ/rp1rkkDOubhz7Vcai0fecTs/8yHLeWGNfvZCi23iC
	m0C02nHdQaRmYLOOUs1d9kL59sWkrS8sqetVewCppXZG3X1hfuUlfvIJmLs4ga/J6npR3o2txohfd
	C13BnnZ8YWw8ZFODilvN4+e80Bp06VFRWuULnf8ztMqRvh1MoaxbcIET7/dQTUbGEqGHxqU8snDSp
	w8md1P6g==;
Received: from fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.158.153.154])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut57v-00000003kus-2dbm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756735399; x=1788271399;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZpDM1obzK12bUteESwrJgWTMch0DIESyPnVssVZOnU8=;
  b=osup1+2Hxd2VCATgNX4Sy/fSKzR0ljxUGXKvtp0y/B7TYaiUyb3c84O1
   3QE5F1FsasakihqSrHIBB+KrR/0v+956c0BAqSjsUOG8h0Hfe8baifZQs
   1frwva4LiVyzns5Qlxa6J1uJkYUvl5jgEiK+nxzRA0GkCutFGz0AxFjkE
   LE+mIcmiklRV+bK4GPa74eh4xmdkh8f/ubOu+6ze81Z0uE5Jh1bETmMCP
   z4u+7Wj5tJnk9sX07jcDVzFF3Dz8G3kbA8QHEpdN9jvk+oaWJR0huWXy3
   LqAN164x+gDIoQ4I5uOxSnt+A4NGkfTxx0Aj/zt8HvN2MNu6knSq6RX/x
   g==;
X-CSE-ConnectionGUID: cy41DMtgQzWT9ehlwIF+7w==
X-CSE-MsgGUID: AJVPOO4OT6GsjUOkK8ggbg==
X-IronPort-AV: E=Sophos;i="6.17,290,1747699200"; 
   d="scan'208";a="1356650"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 14:03:07 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:17259]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.42.3:2525] with esmtp (Farcaster)
 id 1e95fe30-2115-4c92-bf6e-bd2030ad81f1; Mon, 1 Sep 2025 14:03:07 +0000 (UTC)
X-Farcaster-Flow-ID: 1e95fe30-2115-4c92-bf6e-bd2030ad81f1
Received: from EX19D015EUB003.ant.amazon.com (10.252.51.113) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Mon, 1 Sep 2025 14:03:07 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB003.ant.amazon.com (10.252.51.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 1 Sep 2025 14:03:06 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Mon, 1 Sep 2025 14:03:06 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "david@redhat.com" <david@redhat.com>
CC: "ackerleytng@google.com" <ackerleytng@google.com>, "Manwaring, Derek"
	<derekmn@amazon.com>, "Thomson, Jack" <jackabt@amazon.co.uk>, "Kalyazin,
 Nikita" <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Roy, Patrick"
	<roypat@amazon.co.uk>, "rppt@kernel.org" <rppt@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "tabba@google.com"
	<tabba@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "will@kernel.org"
	<will@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>
Subject: Re: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
Thread-Topic: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
Thread-Index: AQHcG0kkyhDN15WuC0qLRSRUvcsDSg==
Date: Mon, 1 Sep 2025 14:03:06 +0000
Message-ID: <20250901140305.14081-1-roypat@amazon.co.uk>
References: <7ef927d8-190d-4b22-8ec7-dcb9f5f75dba@redhat.com>
In-Reply-To: <7ef927d8-190d-4b22-8ec7-dcb9f5f75dba@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_150319_860800_8E8BE385 
X-CRM114-Status: GOOD (  12.80  )
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

=0A=
On Thu, 2025-08-28 at 22:00 +0100, David Hildenbrand wrote:=0A=
> On 28.08.25 11:39, Roy, Patrick wrote:=0A=
>> Add AS_NO_DIRECT_MAP for mappings where direct map entries of folios are=
=0A=
>> set to not present . Currently, mappings that match this description are=
=0A=
>> secretmem mappings (memfd_secret()). Later, some guest_memfd=0A=
>> configurations will also fall into this category.=0A=
>>=0A=
>> Reject this new type of mappings in all locations that currently reject=
=0A=
>> secretmem mappings, on the assumption that if secretmem mappings are=0A=
>> rejected somewhere, it is precisely because of an inability to deal with=
=0A=
>> folios without direct map entries, and then make memfd_secret() use=0A=
>> AS_NO_DIRECT_MAP on its address_space to drop its special=0A=
>> vma_is_secretmem()/secretmem_mapping() checks.=0A=
>>=0A=
>> This drops a optimization in gup_fast_folio_allowed() where=0A=
>> secretmem_mapping() was only called if CONFIG_SECRETMEM=3Dy. secretmem i=
s=0A=
>> enabled by default since commit b758fe6df50d ("mm/secretmem: make it on=
=0A=
>> by default"), so the secretmem check did not actually end up elided in=
=0A=
>> most cases anymore anyway.=0A=
>>=0A=
>> Use a new flag instead of overloading AS_INACCESSIBLE (which is already=
=0A=
>> set by guest_memfd) because not all guest_memfd mappings will end up=0A=
>> being direct map removed (e.g. in pKVM setups, parts of guest_memfd that=
=0A=
>> can be mapped to userspace should also be GUP-able, and generally not=0A=
>> have restrictions on who can access it).=0A=
>>=0A=
>> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>=0A=
>> ---=0A=
> [...]=0A=
> =0A=
>> +static inline bool vma_is_no_direct_map(const struct vm_area_struct *vm=
a)=0A=
>> +{=0A=
>> +     return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mappi=
ng);=0A=
>> +}=0A=
>> +=0A=
> =0A=
> "vma_is_no_direct_map" reads a bit weird.=0A=
> =0A=
> "vma_has_no_direct_map" or "vma_no_direct_mapping" might be better.=0A=
=0A=
I went with "vma_has_no_direct_map" for now, because vma_no_direct_mapping=
=0A=
would imply (to me at least) changing "mapping_no_direct_map" to=0A=
"mapping_no_direct_mapping", which also reads a bit weird imo.=0A=
=0A=
> With the comment Mike and Fuad raised, this LGTM.=0A=
> =0A=
> =0A=
> -- =0A=
> Cheers=0A=
> =0A=
> David / dhildenb=0A=
=0A=
Best,=0A=
Patrick=0A=
=0A=
=0A=
=0A=

