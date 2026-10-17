Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B83DCCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 10:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:To:Content-Type:
	Content-Transfer-Encoding:References:Subject:Cc:In-Reply-To:Mime-Version:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOYEfpEwMLQO0bPlTQu721mtf/5q4uehv1PDBQLDVZ8=; b=GGV62lUGHeU36xRat7E53mWTrY
	pzvew5YbCMJzzRyc/zfJsEu1+wSIS1yoeZmKndWpj2QrAyc6hCcq1G4+WIZ1KqrLSDIQBpYPb6A3X
	fIzfKN8tAqZZ87NOIRqJOIsvXPtryszwGrtWweZAc671V/sQjT/rOTJOipLpTusqLSiKOvD0vi8Gt
	Bmn/fyGe0hZpgLi4/6UCP/7fkODb4DlOgKIT+pwiF7WEk9HeozzrLvmVcHFSINwLxb9KDg8khvR2A
	brJXpJHWEYW+48i4i/paCSz/a+Ne8Bu98AKI4DZMAwYzj7NMZKOMYm/VARrcUVcu1Ewt6fIkvn0/X
	6dl+lKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1R7-00000004f53-2BdF;
	Sat, 17 Oct 2026 10:14:45 +0000
Received: from lf-2-37.ptr.blmpb.com ([101.36.218.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1R4-00000004f4P-12lr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 10:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1792232006; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=OOYEfpEwMLQO0bPlTQu721mtf/5q4uehv1PDBQLDVZ8=;
 b=sLAc8YXKYd4YMon94mD82aqzPrkwixXpb9is/QaBRC0ytna+zwFEe10FjrhbhIwEvOuoQa
 S3vNwa8MtaUikrhJRTgPLG0ANnOto7WLqg7Wmr7SPZqSGmw8dh2lce/x7+pbMssl7DReds
 etgZH6EppJ62TMDRHqmPsnbC8ioi7B2fV0W0R7WBklHIkhy5MTyOtXWxJiZHwTmljY1hUX
 snfxLMMsux/gujiPg5JGFYzH7w5bx7i5lycN7PWWncKmGfSg3mErYpn6D4Tptjh6ksMdGS
 Flvu7p9N90Ctf2iRiYzLqjtBfTf5crmmEzrxfpyPyws61w2W2K+HNAOQ8bRR7w==
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Sat, 17 Oct 2026 18:13:22 +0800
Mime-Version: 1.0
In-Reply-To: <DLLOVHIKRXPY.3AGBAPAM8F9WV@linux.dev>
Cc: "Sudeep Holla" <sudeep.holla@kernel.org>, 
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	"Danilo Krummrich" <dakr@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<yang.yicong@picoheart.com>, "Catalin Marinas" <catalin.marinas@arm.com>, 
	"Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<driver-core@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 2/3] arch_topology: Parse die nodes in /cpu-map
Content-Language: en-US
Received: from [100.86.216.62] ([61.141.241.117]) by smtp.feishu.cn with ESMTPS; Sat, 17 Oct 2026 18:13:24 +0800
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev> <20260920-riscv-die-topology-rfc-v1-2-071c0bf61d5f@linux.dev> <20260921-rational-frisky-jerboa-0f2ff0@sudeepholla> <DLLOVHIKRXPY.3AGBAPAM8F9WV@linux.dev>
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Message-Id: <f77689e0-91e9-4e5c-9185-fc6fb9394cc6@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26ad34a44+032136+lists.infradead.org+yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_031442_577248_750BA4DC 
X-CRM114-Status: GOOD (  20.24  )
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

On 9/22/26 4:06 PM, Troy Mitchell wrote:
>> Where is the associated bindings ? Am I missing to check it in the series
>> or it is really missing ? It is essential to add any code using the binding.
> 
> I left the binding out to get initial feedback on the topology model,
> but I agree it should be available for review alongside the code.
> 
> The cpu-map binding lives in dt-schema. I have now opened a draft PR [1]
> with the proposed dieN hierarchy. The PR also links back to this kernel
> series.
> 
>> Also how does it align with ACPI implementation ? It is preferred to be
>> in parity here, so we need some binding there as well IMHO.
> 
> This series does not implement ACPI die discovery and leaves die_id at
> -1 on that path. I agree that DT and ACPI should describe the same
> topology model.
> 
> RISC-V does not define topology fields in hart IDs. PPTT can describe
> intermediate processor hierarchy nodes, but I could not find an explicit
> die indicator in the ACPI 6.6 processor-node flags. Is there an existing
> PPTT convention for identifying die boundaries that we should follow?
> 

PPTT describes the hierarchical processor information but except physical
package and SMT, there's no flags to bind the nodes to a real topology
structure. so maybe it's hard to choose one unless a new flag is added by
the spec to indicate the DIE topology.

may I know the target use case for this die information (as I see the same
question raised on the thread of the device tree PR)? IIUC the NUMA and
cluster information should be enough for the software to aware the
performance differences and the scheduler has already make use them.

thanks.

> Would it be acceptable to add DT support first, keeping ACPI die IDs
> unknown until that mapping is agreed, or should the ACPI mapping be
> defined as part of this RFC?
> 
> Link: https://github.com/devicetree-org/dt-schema/pull/208 [1].

