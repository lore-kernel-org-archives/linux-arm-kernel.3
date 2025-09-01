Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE18CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLl1oyt4RUhXcYIWGbyNXvmAubTcFciHIOgmTgsswPk=; b=ekwdk58v3S2epRuQneZS38upuc
	/8tSbY2yIQR0NELc8PDffQ9Dvc9El9e7VrIfUrL6p6Ftf5DXXNE3qeRH2xnGHTF5EcXaCaAPKGcny
	tiCZABIgUxXGTVGxfgOfTZHuCGh+YRfj/4D8ZsmInFPtiBJsnHFHpXD4ouwSa4/ufietqKVmASLIR
	Tm4QrEQdwINVzdHnorJW8W/kFYG4dcu0KCLkmsi/WJYXUlzhjmDZv/udef+ngj6gTrogb75N+c+HX
	WWLuB2PT1SQ4cPAcWV21PdBkrrTHKka1Vzhk30KNUqeP/WezUGSMbs432XCVdDqDPenl6y53QN+zO
	BJIxNlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8g7-0000000DUxF-3Frv;
	Mon, 01 Sep 2025 17:50:51 +0000
Received: from fra-out-002.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.65.3.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5Xx-0000000CqIh-41Q6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756737014; x=1788273014;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dLl1oyt4RUhXcYIWGbyNXvmAubTcFciHIOgmTgsswPk=;
  b=W2toBpZruDj06N5msc7008uzKME/VPBjbASPH52Qlgm1HxLjUJaKE/8Y
   5f2M7lfigNk0R3JQ53ozN2rjxlOzqxomsnp0Mc6uC44vh4Pdjz7A1Jf45
   pEH0olpvOTKv/2+OvtSVUmeDPNTGsCHJr3MPPKK/VHIrMJLW0w2/Wlqi0
   8eFr2ZYGk9/4O1hx784qrV7/elazZwQJLh+C78scvOdJf+uLPjWdHjXcb
   sqWLwkQ6YzclJ61pxFwrwG3DALdefHdsRSXPlN1f1oDeWYjibS3UMPYPy
   NHfOafzVZLMpLiOHcLIPYuY1dol+hz+4wBSfakT7/LPLekIYDu3fh98VM
   w==;
X-CSE-ConnectionGUID: 7B/ba3PkSy26ZXnwYQdRbw==
X-CSE-MsgGUID: s/0fbb7eT56B6Mg2WRcDHg==
X-IronPort-AV: E=Sophos;i="6.17,290,1747699200"; 
   d="scan'208";a="1466996"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-002.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 14:30:03 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.234:23216]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.18.194:2525] with esmtp (Farcaster)
 id 24b98d19-0a60-4c24-a3c6-c81ad810034e; Mon, 1 Sep 2025 14:30:03 +0000 (UTC)
X-Farcaster-Flow-ID: 24b98d19-0a60-4c24-a3c6-c81ad810034e
Received: from EX19D015EUB001.ant.amazon.com (10.252.51.114) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Mon, 1 Sep 2025 14:30:02 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB001.ant.amazon.com (10.252.51.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 1 Sep 2025 14:30:01 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Mon, 1 Sep 2025 14:30:01 +0000
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
Subject: Re: [PATCH v5 05/12] KVM: Documentation: describe
 GUEST_MEMFD_FLAG_NO_DIRECT_MAP
Thread-Topic: [PATCH v5 05/12] KVM: Documentation: describe
 GUEST_MEMFD_FLAG_NO_DIRECT_MAP
Thread-Index: AQHcG0zmqnuL2jS1NUKSUglbGWh4mA==
Date: Mon, 1 Sep 2025 14:30:01 +0000
Message-ID: <20250901143000.5017-1-roypat@amazon.co.uk>
References: <786503d6-e58d-412a-a17b-f5e4e481c3fe@redhat.com>
In-Reply-To: <786503d6-e58d-412a-a17b-f5e4e481c3fe@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_073014_302037_73F47A42 
X-CRM114-Status: GOOD (  13.03  )
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

On Thu, 2025-08-28 at 11:27 +0100, David Hildenbrand wrote:=0A=
> On 28.08.25 11:39, Roy, Patrick wrote:=0A=
>> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>=0A=
>> ---=0A=
>>   Documentation/virt/kvm/api.rst | 5 +++++=0A=
>>   1 file changed, 5 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api=
.rst=0A=
>> index c17a87a0a5ac..b52c14d58798 100644=0A=
>> --- a/Documentation/virt/kvm/api.rst=0A=
>> +++ b/Documentation/virt/kvm/api.rst=0A=
>> @@ -6418,6 +6418,11 @@ When the capability KVM_CAP_GUEST_MEMFD_MMAP is s=
upported, the 'flags' field=0A=
>>   supports GUEST_MEMFD_FLAG_MMAP.  Setting this flag on guest_memfd crea=
tion=0A=
>>   enables mmap() and faulting of guest_memfd memory to host userspace.=
=0A=
>>=0A=
>> +When the capability KVM_CAP_GMEM_NO_DIRECT_MAP is supported, the 'flags=
' field=0A=
>> +supports GUEST_MEMFG_FLAG_NO_DIRECT_MAP. Setting this flag makes the gu=
est_memfd=0A=
>> +instance behave similarly to memfd_secret, and unmaps the memory backin=
g it from=0A=
>> +the kernel's address space after allocation.=0A=
>> +=0A=
>>   When the KVM MMU performs a PFN lookup to service a guest fault and th=
e backing=0A=
>>   guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will alw=
ays be=0A=
>>   consumed from guest_memfd, regardless of whether it is a shared or a p=
rivate=0A=
> =0A=
> WARNING: Missing commit description - Add an appropriate one=0A=
=0A=
Admittedly wasn't sure what to say that wouldn't just repeat the commit tit=
le=0A=
or the contents. Maybe that just means this shouldn't be its own patch. Wil=
l=0A=
squash in the previous one (same for PATCH 11/12).=0A=
=0A=
> WARNING: From:/Signed-off-by: email name mismatch: 'From: "Roy, Patrick"=
=0A=
> <roypat@amazon.co.uk>' !=3D 'Signed-off-by: Patrick Roy <roypat@amazon.co=
.uk>'=0A=
=0A=
Heh, my git config only ever uses "Patrick Roy <roypat@amazon.co.uk>". Not =
sure=0A=
where "Roy, Patrick" comes from, could it be the mail server mangling thing=
s?=0A=
=0A=
> -- =0A=
> Cheers=0A=
> =0A=
> David / dhildenb=0A=
> =0A=
Best,=0A=
Patrick=0A=

