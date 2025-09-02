Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1677CCA100C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3121Ksby9vgseoaEWxEHU4vRAFZeQ1OVILTcsYl54A=; b=G92XaqBLCiLnyaJhcq5Z+vsGtk
	DkNtxw1yn8kFImwKDuiRf76T26QB4U5OJlThKyJGqhXZ0z8mUN8IkCY0+NdoXaihKSLpVB87hZISi
	MqQsvoKtMDKvwP4CCNr6TSye8Zxvo+hHadjbp4z5p+lrEz/24b64jBm1JoKyVqbOqFt/kT0QUulzb
	JE2k2ooc3F7BhYaVBLpBnOQ7zYsmI4qR6NV2gvcWG3EqEPmwCvExzl282mjtaliHunzBbDziU6CmR
	qBkuXe5MD41cKhw47Dpl94LZH0HVnFZ+EuY6YAGeHHabeb5VudkoEH8EJiuZaHZqr/UAiJzwt7irX
	BmsweB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ70-0000000HENf-0SOz;
	Tue, 02 Sep 2025 12:27:46 +0000
Received: from fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.156.205.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utN9l-0000000GJgt-1cQi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756804705; x=1788340705;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=b3121Ksby9vgseoaEWxEHU4vRAFZeQ1OVILTcsYl54A=;
  b=h52vrAzuONRBHlrWz88Oj8aFeL9+eTEd8eTxC1KltBVbD1PPY+7bCMUM
   +7xkeg6sWjT7B6D3Nj8FJYCkwGcvGJV6yR17mdqBRqQc2iPiZrxp8DTqZ
   U+D4M/YtiR7hz8iASxSgc07shCJ6LY8czhL4YPmWBGOJFMp2bKYiShI4P
   yjiThgkgxRVhA0gFCYlpGHJcvIDbQ+kuxxWDo5r7kn/6ws85KCFZCl2Lr
   wj63gWGsvxJzNF1RxJCqJWzCdlRt78FXCZe+wxl2nX+VJZL50Ho/6lCAj
   py/nD19YGBQf2Lx21/QTgO9c/6sAfiFeKhUDLyNyyInMu/IZpoPkh3mhs
   Q==;
X-CSE-ConnectionGUID: 857AEqg7QrqTm9k0lMss/A==
X-CSE-MsgGUID: VIb4ccPwT16IyAIE1hvYkg==
X-IronPort-AV: E=Sophos;i="6.18,214,1751241600"; 
   d="scan'208";a="1502449"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 09:18:13 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.234:10410]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.3.140:2525] with esmtp (Farcaster)
 id 250cd30a-1333-458c-a5c1-5df8fd2d5adc; Tue, 2 Sep 2025 09:18:13 +0000 (UTC)
X-Farcaster-Flow-ID: 250cd30a-1333-458c-a5c1-5df8fd2d5adc
Received: from EX19D015EUB002.ant.amazon.com (10.252.51.123) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Tue, 2 Sep 2025 09:18:12 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB002.ant.amazon.com (10.252.51.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 2 Sep 2025 09:18:12 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Tue, 2 Sep 2025 09:18:12 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "tabba@google.com" <tabba@google.com>
CC: "ackerleytng@google.com" <ackerleytng@google.com>, "david@redhat.com"
	<david@redhat.com>, "Manwaring, Derek" <derekmn@amazon.com>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Roy, Patrick"
	<roypat@amazon.co.uk>, "rppt@kernel.org" <rppt@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"will@kernel.org" <will@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>
Subject: Re: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
Thread-Topic: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
Thread-Index: AQHcG+qBqyZs7keLDUCAS7X1QtiGSg==
Date: Tue, 2 Sep 2025 09:18:12 +0000
Message-ID: <20250902091810.4854-1-roypat@amazon.co.uk>
References: <CA+EHjTxymfya75KdOrUsSUhtfmxe180DedhJpLQAGeCjsum_nw@mail.gmail.com>
In-Reply-To: <CA+EHjTxymfya75KdOrUsSUhtfmxe180DedhJpLQAGeCjsum_nw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_021825_758951_D44EE4B7 
X-CRM114-Status: GOOD (  19.23  )
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

On Tue, 2025-09-02 at 09:50 +0100, Fuad Tabba wrote:=0A=
> On Tue, 2 Sept 2025 at 09:46, David Hildenbrand <david@redhat.com> wrote:=
=0A=
>>=0A=
>> On 02.09.25 09:59, Fuad Tabba wrote:=0A=
>>> Hi Patrick,=0A=
>>>=0A=
>>> On Mon, 1 Sept 2025 at 15:56, Roy, Patrick <roypat@amazon.co.uk> wrote:=
=0A=
>>>>=0A=
>>>> On Mon, 2025-09-01 at 14:54 +0100, "Roy, Patrick" wrote:=0A=
>>>>>=0A=
>>>>> Hi Fuad!=0A=
>>>>>=0A=
>>>>> On Thu, 2025-08-28 at 11:21 +0100, Fuad Tabba wrote:=0A=
>>>>>> Hi Patrick,=0A=
>>>>>>=0A=
>>>>>> On Thu, 28 Aug 2025 at 10:39, Roy, Patrick <roypat@amazon.co.uk> wro=
te:=0A=
>>>>>>> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h=0A=
>>>>>>> index 12a12dae727d..b52b28ae4636 100644=0A=
>>>>>>> --- a/include/linux/pagemap.h=0A=
>>>>>>> +++ b/include/linux/pagemap.h=0A=
>>>>>>> @@ -211,6 +211,7 @@ enum mapping_flags {=0A=
>>>>>>>                                     folio contents */=0A=
>>>>>>>          AS_INACCESSIBLE =3D 8,    /* Do not attempt direct R/W acc=
ess to the mapping */=0A=
>>>>>>>          AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM =3D 9,=0A=
>>>>>>> +       AS_NO_DIRECT_MAP =3D 10,  /* Folios in the mapping are not =
in the direct map */=0A=
>>>>>>>          /* Bits 16-25 are used for FOLIO_ORDER */=0A=
>>>>>>>          AS_FOLIO_ORDER_BITS =3D 5,=0A=
>>>>>>>          AS_FOLIO_ORDER_MIN =3D 16,=0A=
>>>>>>> @@ -346,6 +347,21 @@ static inline bool mapping_writeback_may_deadl=
ock_on_reclaim(struct address_spac=0A=
>>>>>>>          return test_bit(AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM, &map=
ping->flags);=0A=
>>>>>>>   }=0A=
>>>>>>>=0A=
>>>>>>> +static inline void mapping_set_no_direct_map(struct address_space =
*mapping)=0A=
>>>>>>> +{=0A=
>>>>>>> +       set_bit(AS_NO_DIRECT_MAP, &mapping->flags);=0A=
>>>>>>> +}=0A=
>>>>>>> +=0A=
>>>>>>> +static inline bool mapping_no_direct_map(struct address_space *map=
ping)=0A=
>>>>>>> +{=0A=
>>>>>>> +       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);=0A=
>>>>>>> +}=0A=
>>>>>>> +=0A=
>>>>>>> +static inline bool vma_is_no_direct_map(const struct vm_area_struc=
t *vma)=0A=
>>>>>>> +{=0A=
>>>>>>> +       return vma->vm_file && mapping_no_direct_map(vma->vm_file->=
f_mapping);=0A=
>>>>>>> +}=0A=
>>>>>>> +=0A=
>>>>>> Any reason vma is const whereas mapping in the function that it call=
s=0A=
>>>>>> (defined above it) isn't?=0A=
>>>>>=0A=
>>>>> Ah, I cannot say that that was a conscious decision, but rather an ar=
tifact of=0A=
>>>>> the code that I looked at for reference when writing these two simply=
 did it=0A=
>>>>> this way.  Are you saying both should be const, or neither (in my min=
d, both=0A=
>>>>> could be const, but the mapping_*() family of functions further up in=
 this file=0A=
>>>>> dont take const arguments, so I'm a bit unsure now)?=0A=
>>>>=0A=
>>>> Hah, just saw=0A=
>>>> https://lore.kernel.org/linux-mm/20250901123028.3383461-3-max.kellerma=
nn@ionos.com/.=0A=
>>>> Guess that means "both should be const" then :D=0A=
>>>=0A=
>>> I don't have any strong preference regarding which way, as long as=0A=
>>> it's consistent. The thing that should be avoided is having one=0A=
>>> function with a parameter marked as const, pass that parameter (or=0A=
>>> something derived from it), to a non-const function.=0A=
>>=0A=
>> I think the compiler will tell you that that is not ok (and you'd have=
=0A=
>> to force-cast the const it away).=0A=
> =0A=
> Not for the scenario I'm worried about. The compiler didn't complain=0A=
> about this (from this patch):=0A=
> =0A=
> +static inline bool mapping_no_direct_map(struct address_space *mapping)=
=0A=
> +{=0A=
> +       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);=0A=
> +}=0A=
> +=0A=
> +static inline bool vma_is_no_direct_map(const struct vm_area_struct *vma=
)=0A=
> +{=0A=
> +       return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapp=
ing);=0A=
> +}=0A=
> =0A=
> vma_is_no_direct_map() takes a const, but mapping_no_direct_map()=0A=
> doesn't. For now, mapping_no_direct_map() doesn't modify anything. But=0A=
> it could, and the compiler wouldn't complain.=0A=
=0A=
Wouldn't this only be a problem if vma->vm_file->f_mapping was a 'const str=
uct=0A=
address_space *const'? I thought const-ness doesn't leak into pointers (e.g=
.=0A=
even above, vma_is_no_direct_map isn't allowed to make vma point at somethi=
ng=0A=
else, but it could modify the pointed-to vm_area_struct).=0A=
=0A=
> Cheers,=0A=
> /fuad=0A=
> =0A=
> =0A=
>> Agreed that we should be using const * for these simple getter/test=0A=
>> functions.=0A=
>>=0A=
>> --=0A=
>> Cheers=0A=
>>=0A=
>> David / dhildenb=0A=
>>=0A=
=0A=

