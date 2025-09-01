Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC85CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FO6rXzJ1OSaPqvoH5IT1CQYrfHskP0PMe12nrwxRLg=; b=gBy+ep7sy101LJgxV+3+GxLIDc
	NljrnMvSDjiWWyNPDLmm+kAi6iBL9CxOOPyZ5B6nKdPwGnzTndAdnup/4ax6U1/vgNsTlzRnhnovg
	PkQkM7aTVR1fbiJ3JIjQ3W6/3pQgluKphkBq+P8KFHPxgyr1NbCFmpHjKHMYYTYVF0JPH/SKOTeHc
	doLMtaBQexFFoClu85wrTxqE/cQEFvmz5Ulh8fITAneaRMwDH5lBxryhCuU/vS9KnHkHSHSPnIHRz
	5RaWJi202BoJ/7LeOGYBL0WO/O6UjRCKaGHppM28RUgqfAPzOzZBVVwWnAGWSfr4LvowFPBRwv9h5
	2n5QlSeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut84c-0000000DQMD-0vb9;
	Mon, 01 Sep 2025 17:12:06 +0000
Received: from fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([52.28.197.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4sL-0000000Cjlm-2DMb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 13:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756734433; x=1788270433;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+FO6rXzJ1OSaPqvoH5IT1CQYrfHskP0PMe12nrwxRLg=;
  b=eXIqZNqN8VfZhVqg3dI6jq0WAVx8Lavboy+woNQAAUYFJvew5Bwdq3Eg
   a6uoi65GKEqYyOQ4XfizFc2Si3nBTtx5VIe51Jp75OjfqTkDeIUZnsniv
   PL8cmRW3qyyDE4hu+sfeZbFa61DpBmp81ewnbrvrrPrKJROpcyPQUBQSM
   0TvCRmYeKla19HQUJovo8RatbShbclhkUD8so1S1V2ekrImMxRtHAqRax
   gtWLX11MsNw65Hj6JczdkpN49jrii/yJ9amy0JOdmYB8NT9Uy6Np2R+F+
   X+kjeaGSmpyRW4uSso/20pZjLZjah/EI8QY2TILTCD/HtzcSUAQCpH7Se
   Q==;
X-CSE-ConnectionGUID: m8ytizq0Q1qu8e8vIjnAEg==
X-CSE-MsgGUID: iRZ+qBh2R/uOhlJ6+f0jsg==
X-IronPort-AV: E=Sophos;i="6.17,290,1747699200"; 
   d="scan'208";a="1359904"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:47:02 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.232:16772]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.42.3:2525] with esmtp (Farcaster)
 id ca3958c9-cdc5-4794-b45a-6e9b3384e54b; Mon, 1 Sep 2025 13:47:02 +0000 (UTC)
X-Farcaster-Flow-ID: ca3958c9-cdc5-4794-b45a-6e9b3384e54b
Received: from EX19D015EUB003.ant.amazon.com (10.252.51.113) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Mon, 1 Sep 2025 13:47:01 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB003.ant.amazon.com (10.252.51.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 1 Sep 2025 13:47:01 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Mon, 1 Sep 2025 13:47:01 +0000
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
Subject: Re: [PATCH v5 02/12] arch: export set_direct_map_valid_noflush to KVM
 module
Thread-Topic: [PATCH v5 02/12] arch: export set_direct_map_valid_noflush to
 KVM module
Thread-Index: AQHcG0bk577bUdlDRkuvvFVSrUyVog==
Date: Mon, 1 Sep 2025 13:47:00 +0000
Message-ID: <20250901134659.32171-1-roypat@amazon.co.uk>
References: <CA+EHjTwDZ-FRV2KfC5ZG9SJYeeMRVUHQ8rVtb9dx2AQwCriPQw@mail.gmail.com>
In-Reply-To: <CA+EHjTwDZ-FRV2KfC5ZG9SJYeeMRVUHQ8rVtb9dx2AQwCriPQw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_064713_903597_04151C2E 
X-CRM114-Status: UNSURE (   9.03  )
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

Hi Fuad!=0A=
=0A=
On Thu, 2025-08-28 at 11:07 +0100, Fuad Tabba wrote:=0A=
>> diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c=
=0A=
>> index f5e910b68229..d076bfd3fcbf 100644=0A=
>> --- a/arch/loongarch/mm/pageattr.c=0A=
>> +++ b/arch/loongarch/mm/pageattr.c=0A=
>> @@ -217,6 +217,7 @@ int set_direct_map_invalid_noflush(struct page *page=
)=0A=
>>=0A=
>>         return __set_memory(addr, 1, __pgprot(0), __pgprot(_PAGE_PRESENT=
 | _PAGE_VALID));=0A=
>>  }=0A=
>> +EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");=0A=
> =0A=
> This should be after 'set_direct_map_valid_noflush', not 'invalid'.=0A=
> =0A=
> With that fixed:=0A=
> =0A=
> Reviewed-by: Fuad Tabba <tabba@google.com>=0A=
=0A=
Ah, yes, good catch, thanks!=0A=
=0A=
Best,=0A=
Patrick=0A=

