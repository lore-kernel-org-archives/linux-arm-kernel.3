Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB58C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57nPLxtLibpkK5qPp8QpRrsWkbDlQlqDET5gkkKYRG8=; b=rLiKdKNU/Q+gdDit+854gWRRno
	mFtVRJ5uYiA/Y6B+mA9BXf3UJ7teJwbbylMXT04nTnpRCTl9AC2t5z4GtPisAOS1r68JalRpi/VJg
	BGr+IvJVIW1oI3eQzC+EyuZ3FxKWFN0im3EZCzmNoBSQ/n6oZ9qeo3j4xzAsTvmCjHUVIg/Tflc7J
	QbLLtgVuEJn36jWEPV+4vv0DcEpIJ5u4xzXw9XeachFk4z9IZHpJ0tcr6zI2it8BVgEEReV2PAzqn
	yWvEyvjuEWODXLcJ9d8ruVXVaWEQKy538AfNRA+tdibzv469jIgfWF1AEEgYAI+OcllMEPj7QQwT8
	PTOywd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkZP-0000000D6md-0AOv;
	Wed, 19 Feb 2025 13:56:59 +0000
Received: from smtp-fw-80009.amazon.com ([99.78.197.220])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkXp-0000000D6ES-3D1e;
	Wed, 19 Feb 2025 13:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739973321; x=1771509321;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=57nPLxtLibpkK5qPp8QpRrsWkbDlQlqDET5gkkKYRG8=;
  b=dxGHxGJ8nRdcWggCk0UKFW6ggY1nqPPPGm7ICMsfZqAz6xXqGfyZjevJ
   En/XbivAJzswh+du7sEsoNSufpzQ8LlBnrZJl5u5IkZiUU5U+IJ5bJIpG
   Rl8YxSAeOKDke3O/XQX/42RcUxgAYp3r5rnZm4a6bbp10w0/5FEX/ojzB
   M=;
X-IronPort-AV: E=Sophos;i="6.13,299,1732579200"; 
   d="scan'208";a="173851478"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 13:55:18 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.38.20:64466]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.97:2525] with esmtp (Farcaster)
 id 109703bc-b166-4b29-a69a-d899c4750143; Wed, 19 Feb 2025 13:55:17 +0000 (UTC)
X-Farcaster-Flow-ID: 109703bc-b166-4b29-a69a-d899c4750143
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 19 Feb 2025 13:55:08 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Wed, 19 Feb 2025
 13:55:00 +0000
Message-ID: <d8c43707-65a2-4176-85e2-acdb4c9d16ad@amazon.com>
Date: Wed, 19 Feb 2025 14:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Dave Young <dyoung@redhat.com>, Mike Rapoport <rppt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Anthony Yznaga
	<anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Ashish Kalra
	<ashish.kalra@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse
	<dwmw2@infradead.org>, Eric Biederman <ebiederm@xmission.com>, Ingo Molnar
	<mingo@redhat.com>, James Gowans <jgowans@amazon.com>, Jonathan Corbet
	<corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
	<peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, Rob Herring
	<robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@google.com>, Stanislav Kinsburskii
	<skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <CALu+AoRMQyRDFS_4L0KQkmrFT_S+yk=uZ-Mqt86JQYKKnj-5Ug@mail.gmail.com>
 <Z7WJD6eBLuIRnLwk@kernel.org>
 <CALu+AoSaEthfed1NOYPiQgm_g-dhibVMRAp0+=_+9qTT4_x=tg@mail.gmail.com>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <CALu+AoSaEthfed1NOYPiQgm_g-dhibVMRAp0+=_+9qTT4_x=tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_055521_861479_E8ECE50B 
X-CRM114-Status: GOOD (  22.63  )
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


On 19.02.25 13:49, Dave Young wrote:
> On Wed, 19 Feb 2025 at 15:32, Mike Rapoport <rppt@kernel.org> wrote:
>> On Mon, Feb 17, 2025 at 11:19:45AM +0800, RuiRui Yang wrote:
>>> On Thu, 6 Feb 2025 at 21:34, Mike Rapoport <rppt@kernel.org> wrote:
>>>> == Limitations ==
>>>>
>>>> Currently KHO is only implemented for file based kexec. The kernel
>>>> interfaces in the patch set are already in place to support user space
>>>> kexec as well, but it is still not implemented it yet inside kexec tools.
>>>>
>>> What architecture exactly does this KHO work fine?   Device Tree
>>> should be ok on arm*, x86 and power*, but how about s390?
>> KHO does not use device tree as the boot protocol, it uses FDT as a data
>> structure and adds architecture specific bits to the boot structures to
>> point to that data, very similar to how IMA_KEXEC works.
>>
>> Currently KHO is implemented on arm64 and x86, but there is no fundamental
>> reason why it wouldn't work on any architecture that supports kexec.
> Well,  the problem is whether there is a way to  add dtb in the early
> boot path,  for X86 it is added via setup_data,  if there is no such
> way I'm not sure if it is doable especially for passing some info for
> early boot use.  Then the KHO will be only for limited use cases.


Every architecture has a platform specific way of passing data into the 
kernel so it can find its command line and initrd. S390x for example has 
struct parmarea. To enable s390x, you would remove some of its padding 
and replace it with a KHO base addr + size, so that the new kernel can 
find the KHO state tree.


Alex


