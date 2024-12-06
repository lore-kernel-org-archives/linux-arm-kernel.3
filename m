Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D89E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 05:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeJKj87W9UR5iJRJm8EOVLO3pStgIR+TvO1cTQt7BXk=; b=G29fQXr4eSORrI5JY95CxYrhBL
	Bi4CZR/oh0kW/IuG7jA0MKPRdZ2l6lzb2GcOnpFGDH1Ub436a2kbn3f6WgqgCsGQKzcP54hFfqoU6
	M4lZQ29zRro4sJMbSPemmksnQVx5I28o03bwJI+qf0eIBTpFRxDhrRbjc8gOiWMfgc3X2Lec99oKq
	vbRwkpfirrpFZ27Tp2cc6LdGHMRhqUr9dAqG6dbT4W11ferHCBofOo0PW5POMW/d9zVM/UdOYXXem
	zgN4CofRxJRofBlNBQh4Nyjtwtwih3NmQAej5jESy8GKOtgnXg9iljVtnPa8Mi3jpoySbBvJLMHT+
	TUFLOTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJQfF-00000000aoN-1nOf;
	Fri, 06 Dec 2024 05:14:05 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJQeE-00000000aX7-0N17
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 05:13:03 +0000
Received: from [100.65.0.192] (unknown [20.236.11.42])
	by linux.microsoft.com (Postfix) with ESMTPSA id DB58D20ACD8D;
	Thu,  5 Dec 2024 21:12:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DB58D20ACD8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733461980;
	bh=UeJKj87W9UR5iJRJm8EOVLO3pStgIR+TvO1cTQt7BXk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=evohsIOaYFfQe1eCWrL35euPbFbUcU8YiFIo4DvXuomC5z7qvwnPVNWkVkvtyTO46
	 Yn0Oy0b5pR4/G+4koxJ9PiOD5s1K5XjZ34R/WB69cjeMhwcBdjYJtzQxfZiLMnvung
	 JyqqH7VS1El1YbPoIX5fiIB9chqShvN25PcFIgO8=
Message-ID: <3c5ec65e-93a9-48a2-a18f-f5b89e83e999@linux.microsoft.com>
Date: Thu, 5 Dec 2024 21:12:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev,
 eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, luto@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 seanjc@google.com, pbonzini@redhat.com, peterz@infradead.org,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
 bhelgaas@google.com, arnd@arndb.de, sgarzare@redhat.com,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com,
 vkuznets@redhat.com, ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 horms@kernel.org
Subject: Re: [PATCH v3 3/5] hyperv: Add new Hyper-V headers in include/hyperv
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1732577084-2122-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1732577084-2122-4-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1732577084-2122-4-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_211302_190790_0B0A4F3B 
X-CRM114-Status: GOOD (  17.03  )
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

On 11/25/2024 3:24 PM, Nuno Das Neves wrote:
> These headers contain definitions for regular Hyper-V guests (as in
> hyperv-tlfs.h), as well as interfaces for more privileged guests like
> the root partition (aka Dom0).
> 
> These files are derived from headers exported from Hyper-V, rather than
> being derived from the TLFS document. (Although, to preserve
> compatibility with existing Linux code, some definitions are copied
> directly from hyperv-tlfs.h too).
> 
> The new files follow a naming convention according to their original
> use:
> - hdk "host development kit"
> - gdk "guest development kit"
> With postfix "_mini" implying userspace-only headers, and "_ext" for
> extended hypercalls.
> 
> The use of multiple files and their original names is primarily to
> keep the provenance of exactly where they came from in Hyper-V
> code, which is helpful for manual maintenance and extension
> of these definitions. Microsoft maintainers importing new definitions
> should take care to put them in the right file. However, Linux kernel
> code that uses any of the definitions need not be aware of the multiple
> files or assign any meaning to the new names. Linux kernel code should
> always just include hvhdk.h
> 
> Note the new headers contain both arm64 and x86_64 definitions. Some are
> guarded by #ifdefs, and some are instead prefixed with the architecture,
> e.g. hv_x64_*. These conventions are kept from Hyper-V code as another
> tactic to simplify the process of importing and maintaining the
> definitions, rather than splitting them up into their own files in
> arch/x86/ and arch/arm64/.
> 
> These headers are a step toward importing headers directly from Hyper-V
> in the future, similar to Xen public files in include/xen/interface/.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  MAINTAINERS                 |    5 +
>  include/hyperv/hvgdk.h      |  308 +++++++++
>  include/hyperv/hvgdk_ext.h  |   46 ++
>  include/hyperv/hvgdk_mini.h | 1306 +++++++++++++++++++++++++++++++++++
>  include/hyperv/hvhdk.h      |  733 ++++++++++++++++++++
>  include/hyperv/hvhdk_mini.h |  311 +++++++++
>  6 files changed, 2709 insertions(+)
>  create mode 100644 include/hyperv/hvgdk.h
>  create mode 100644 include/hyperv/hvgdk_ext.h
>  create mode 100644 include/hyperv/hvgdk_mini.h
>  create mode 100644 include/hyperv/hvhdk.h
>  create mode 100644 include/hyperv/hvhdk_mini.h

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

