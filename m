Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F5CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FXGRJshnSKv4swI9rc/O7cu1N6KjNCj8MEEMoNffZ4=; b=S2ng6J1bjbBg3TnxjD1I7s9p1p
	aPm4/qU2GjCGfArS03EQZCYjmk+tIf9pOhKmXGOcKMdeAhhuJYB5f9mx74PtQyk5wyYqivA9JuaPx
	lmj0PI5ZzxwRNz2/NB36uI3eFSVhFqebC0jOH7Kfa+nWdBORzmbSEr5ye5khfBOh0RvnSvbDWMSMI
	fErcdPofmlNEak3MXnEvFk2qirFY3gMhIioFNSzLKFpVjix8TQSRPTIeQgDtsbwLCw5kp9nFOeZQE
	fae+tSqfbCtHw6lpLmzFRI2uWJw0bXAEhIOy4eZYinSt8fVWvVtANT4OjA8tlt+DQaWwDVlBwTcwa
	meWp5Cvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut87I-0000000DQhz-4C8G;
	Mon, 01 Sep 2025 17:14:53 +0000
Received: from fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.176.194.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4zE-0000000CmMI-3weZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 13:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756734860; x=1788270860;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8FXGRJshnSKv4swI9rc/O7cu1N6KjNCj8MEEMoNffZ4=;
  b=L6qa3VBgGo4Wrug0eZbuFet7BrbBylLadR5+sL0N+EQgb57sSVE7H9Nb
   5eB1+7p6nTBpwXClbMFrolnfsDhm+98hlcXvLW6PlO2gd2tuK1IxaWdUk
   /tQjNjksCD7LL35qcGv7ZebbqxBxX1PvNiekWwppPRYWgT+fCMh1k/W6p
   QoChBxJ4SgYjPPhPtebaMR0Eyx7C+0ygcdbkBUhAqss3D/Sx/QrKpkj3r
   liErEDWv9BgVDQGYZVsqZCarB2MmmQ/Y1q6oODiCPJt7e+Nh79YLIXWi0
   WqK738bl09/dHok6gfjy6uhmHy+c6/h/Kv0zkXZ3oq1YIdPpIeH+yr+UE
   w==;
X-CSE-ConnectionGUID: gggXs4BvTVmSlkjjgWje9g==
X-CSE-MsgGUID: ND6y5eCkQmyPHrPmUhHHJA==
X-IronPort-AV: E=Sophos;i="6.18,214,1751241600"; 
   d="scan'208";a="1463813"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:54:11 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:18474]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.3.140:2525] with esmtp (Farcaster)
 id 6c2ba49e-6c86-45f6-b459-405011a28a46; Mon, 1 Sep 2025 13:54:10 +0000 (UTC)
X-Farcaster-Flow-ID: 6c2ba49e-6c86-45f6-b459-405011a28a46
Received: from EX19D015EUB001.ant.amazon.com (10.252.51.114) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Mon, 1 Sep 2025 13:54:10 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB001.ant.amazon.com (10.252.51.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 1 Sep 2025 13:54:10 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Mon, 1 Sep 2025 13:54:10 +0000
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
Thread-Index: AQHcG0fkqK4jccjXtUKv/NLtaS3P1g==
Date: Mon, 1 Sep 2025 13:54:10 +0000
Message-ID: <20250901135408.5965-1-roypat@amazon.co.uk>
References: <CA+EHjTxOmDJkwjSvAUr2O4yqEkyqeQ=_p3E5Uj5yQrPW7Qz_HA@mail.gmail.com>
In-Reply-To: <CA+EHjTxOmDJkwjSvAUr2O4yqEkyqeQ=_p3E5Uj5yQrPW7Qz_HA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_065421_268834_A56DD2C3 
X-CRM114-Status: GOOD (  11.74  )
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
Hi Fuad!=0A=
=0A=
On Thu, 2025-08-28 at 11:21 +0100, Fuad Tabba wrote:=0A=
> Hi Patrick,=0A=
> =0A=
> On Thu, 28 Aug 2025 at 10:39, Roy, Patrick <roypat@amazon.co.uk> wrote:=
=0A=
>> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h=0A=
>> index 12a12dae727d..b52b28ae4636 100644=0A=
>> --- a/include/linux/pagemap.h=0A=
>> +++ b/include/linux/pagemap.h=0A=
>> @@ -211,6 +211,7 @@ enum mapping_flags {=0A=
>>                                    folio contents */=0A=
>>         AS_INACCESSIBLE =3D 8,    /* Do not attempt direct R/W access to=
 the mapping */=0A=
>>         AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM =3D 9,=0A=
>> +       AS_NO_DIRECT_MAP =3D 10,  /* Folios in the mapping are not in th=
e direct map */=0A=
>>         /* Bits 16-25 are used for FOLIO_ORDER */=0A=
>>         AS_FOLIO_ORDER_BITS =3D 5,=0A=
>>         AS_FOLIO_ORDER_MIN =3D 16,=0A=
>> @@ -346,6 +347,21 @@ static inline bool mapping_writeback_may_deadlock_o=
n_reclaim(struct address_spac=0A=
>>         return test_bit(AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM, &mapping->=
flags);=0A=
>>  }=0A=
>>=0A=
>> +static inline void mapping_set_no_direct_map(struct address_space *mapp=
ing)=0A=
>> +{=0A=
>> +       set_bit(AS_NO_DIRECT_MAP, &mapping->flags);=0A=
>> +}=0A=
>> +=0A=
>> +static inline bool mapping_no_direct_map(struct address_space *mapping)=
=0A=
>> +{=0A=
>> +       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);=0A=
>> +}=0A=
>> +=0A=
>> +static inline bool vma_is_no_direct_map(const struct vm_area_struct *vm=
a)=0A=
>> +{=0A=
>> +       return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_map=
ping);=0A=
>> +}=0A=
>> +=0A=
> Any reason vma is const whereas mapping in the function that it calls=0A=
> (defined above it) isn't?=0A=
=0A=
Ah, I cannot say that that was a conscious decision, but rather an artifact=
 of=0A=
the code that I looked at for reference when writing these two simply did i=
t=0A=
this way.  Are you saying both should be const, or neither (in my mind, bot=
h=0A=
could be const, but the mapping_*() family of functions further up in this =
file=0A=
dont take const arguments, so I'm a bit unsure now)?=0A=
=0A=
> Cheers,=0A=
> /fuad=0A=
=0A=
Best,=0A=
Patrick=0A=

