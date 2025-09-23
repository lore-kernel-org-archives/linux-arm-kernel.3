Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29230CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6zoQ1uv1s7hqCsB4ZjAaLblPEL6nAmG0LEH7MpxUwU=; b=Kt4IjaG44TZWrz
	ywKvr1uKsnXwoe6TrFmxSkKT2qYTItZI5BAlwozeaKzoABBuXYKJkGHAs2qddrvIHCk+BA33RqRi/
	eSEua0UKqw9hK3YJc76jXaXkM8EnY6JQY0EoZSvVSBR52smr0qeN/scbX0Dldvw7yZo9hLeYuUvyA
	xV1Ham59+TEGNwMVe0uJRtnbCQpQKhQdU0Pb8g4pK+FyXWYFxAB6FXAAHOTrUt5gQC4tixx9mH7LQ
	fmf+igduagjStSLx9zogfbBzlGoVsK15yHTrWLw/EE2PeOevOg/IAK36b1bsc+NVCW0wLepi25h7b
	aLP5vvabrPYU6cgNfI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11uT-0000000DHU5-05EG;
	Tue, 23 Sep 2025 12:14:17 +0000
Received: from fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.178.143.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11uQ-0000000DHTe-1WCo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 12:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1758629654; x=1790165654;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=C6zoQ1uv1s7hqCsB4ZjAaLblPEL6nAmG0LEH7MpxUwU=;
  b=mD0xkIhVDRTDD6UdkT8aj9tqZRAT1M8dvEp1Xglhm05XxCXHdwEQDWjp
   XRqVIjc1+YBP5q/s2A/2u3LUIE73kre3rBM7GmV6yKdFiBPRSpJxHar4E
   jyGmXyuNyNArCjRnLY/H7CNT5nQpUrIYq3isRBa8jv0CfJjG1lSiqKNMH
   t0VNLEaZ/XCfqCsjzVf6ex9gcuS6SHojuY1saWK1drGNOjknXrMFDVVfB
   8V1rnljmyaC6crUwri2CKzDK9QSaAXtlhbUoiVzmffThZo8QufM246akm
   aDvnitNjE1BwJAAm1gQ6+FYHZUCZ77TLVBfI3LyqEl25XxYf2a2lk4GG4
   A==;
X-CSE-ConnectionGUID: FBNj+l+aR1+qu6nlihE2jA==
X-CSE-MsgGUID: h+GIaP0rSfmTrhi4K2iYPA==
X-IronPort-AV: E=Sophos;i="6.18,288,1751241600"; 
   d="scan'208";a="2438561"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 12:13:57 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:7935]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.38.97:2525] with esmtp (Farcaster)
 id 8181f46e-0526-4b06-9460-3a2e1a03356b; Tue, 23 Sep 2025 12:13:57 +0000 (UTC)
X-Farcaster-Flow-ID: 8181f46e-0526-4b06-9460-3a2e1a03356b
Received: from EX19D022EUC002.ant.amazon.com (10.252.51.137) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 23 Sep 2025 12:13:54 +0000
Received: from [192.168.26.206] (10.106.82.20) by
 EX19D022EUC002.ant.amazon.com (10.252.51.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 23 Sep 2025 12:13:53 +0000
Message-ID: <8408090a-d2cc-4b90-99fe-183d49081ea4@amazon.com>
Date: Tue, 23 Sep 2025 13:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] KVM: Introduce KVM Userfault
To: Sean Christopherson <seanjc@google.com>, James Houghton
	<jthoughton@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Oliver Upton
	<oliver.upton@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier
	<maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, Anish Moorthy
	<amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu
	<peterx@redhat.com>, David Matlack <dmatlack@google.com>,
	<wei.w.wang@intel.com>, <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>
References: <20250618042424.330664-1-jthoughton@google.com>
 <de7da4d8-0e9d-46f2-88ec-cfd5dc14421c@amazon.com>
 <CADrL8HVxvwB4JrnUf6QtDCyzZojEvR4tr-ELEn+fL8=1cnbMQQ@mail.gmail.com>
 <aLrXFWDgDkHqPQda@google.com>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
Autocrypt: addr=kalyazin@amazon.com; keydata=
 xjMEY+ZIvRYJKwYBBAHaRw8BAQdA9FwYskD/5BFmiiTgktstviS9svHeszG2JfIkUqjxf+/N
 JU5pa2l0YSBLYWx5YXppbiA8a2FseWF6aW5AYW1hem9uLmNvbT7CjwQTFggANxYhBGhhGDEy
 BjLQwD9FsK+SyiCpmmTzBQJnrNfABQkFps9DAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQr5LK
 IKmaZPOpfgD/exazh4C2Z8fNEz54YLJ6tuFEgQrVQPX6nQ/PfQi2+dwBAMGTpZcj9Z9NvSe1
 CmmKYnYjhzGxzjBs8itSUvWIcMsFzjgEY+ZIvRIKKwYBBAGXVQEFAQEHQCqd7/nb2tb36vZt
 ubg1iBLCSDctMlKHsQTp7wCnEc4RAwEIB8J+BBgWCAAmFiEEaGEYMTIGMtDAP0Wwr5LKIKma
 ZPMFAmes18AFCQWmz0MCGwwACgkQr5LKIKmaZPNTlQEA+q+rGFn7273rOAg+rxPty0M8lJbT
 i2kGo8RmPPLu650A/1kWgz1AnenQUYzTAFnZrKSsXAw5WoHaDLBz9kiO5pAK
In-Reply-To: <aLrXFWDgDkHqPQda@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.106.82.20]
X-ClientProxiedBy: EX19D015EUA002.ant.amazon.com (10.252.50.219) To
 EX19D022EUC002.ant.amazon.com (10.252.51.137)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_051414_703718_672E93EC 
X-CRM114-Status: GOOD (  19.21  )
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
Reply-To: kalyazin@amazon.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 05/09/2025 13:27, Sean Christopherson wrote:
> On Thu, Sep 04, 2025, James Houghton wrote:
>> On Thu, Sep 4, 2025 at 9:43 AM Nikita Kalyazin <kalyazin@amazon.com> wrote:
>>> Are there any blockers for merging this series?  We would like to use
>>> the functionality in Firecracker for restoring guest_memfd-backed VMs
>>> from snapshots via UFFD [1].  [2] is a Firecracker feature branch that
>>> builds on top of KVM userfault, along with direct map removal [3], write
>>> syscall [4] and UFFD support [5] in guest_memfd (currently in discussion
>>> with MM at [6]) series.
>>
>> Glad to hear that you need this series. :)
> 
> Likewise (though I had slightly-advanced warning from Patrick that Firecracker
> wants KVM Userfault).  The main reason I haven't pushed harder on this series is
> that I didn't think anyone wanted to use it within the next ~year.
> 
>> I am on the hook to get some QEMU patches to demonstrate that KVM
>> Userfault can work well with it. I'll try to get that done ASAP now
>> that you've expressed interest. The firecracker patches are a nice
>> demonstration that this could work too... (I wish the VMM I work on
>> was open-source).
>>
>> I think the current "blocker" is the kvm_page_fault stuff[*]; KVM
>> Userfault will be the first user of this API. I'll review that series
>> in the next few days. I'm pretty sure Sean doesn't have any conceptual
>> issues with KVM Userfault as implemented in this series.
> 
> Yep, Oliver and I (and anyone else that has an opinion) just need to align on the
> interface for arch-neutral code.  I think that's mostly on me to spin a v2, and
> maybe to show how it all looks when integrated with the userfault stuff.\

Sounds good, thanks.  Do you think you'll be having time to work on the 
v2 soonish?  Is defining and implementing the interface a strict 
prerequisite for this series?


