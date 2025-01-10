Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A229EE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 18:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phVUzrK2S3UTxje1BkTQlVTjsBLGG7/v7Al+J3wil0U=; b=sWL21LbGAD7K2GtbQFEOY342e3
	zQuh6NVP9MPx3+kPZS+j5kLWK/Ld5guSd+TM0COTQFq71MqReYks0QbTQlxY/8djDIclXoL4qZgvD
	FBxyVSOfGvLqFNTQde6JynS5K4qIBJABilEqmklnXPu6rtsZUcC8XNSnNOuoEPoV41sYNQ4FY5B0J
	df0SZv7Aw3CTJaJJ0SVgtVL1+AzAsWXI2QsIthMbBo8Kc24IfZW5yHKxgfGjexXXokL53fHx1Qlvz
	yDtHvq90Y15vd5PdL4HEYeajWklcqUgaT5M0zsJhHiEwtYUFeLe8AKplOhpkbfb/4AS+d5U06Ttd4
	MBdB2jfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJPx-0000000GWFI-3HIZ;
	Fri, 10 Jan 2025 18:07:33 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIP2-0000000GMZk-05ph
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 17:02:33 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YV7G72NMwz67K2K;
	Sat, 11 Jan 2025 01:01:03 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 30E121408F9;
	Sat, 11 Jan 2025 01:02:18 +0800 (CST)
Received: from localhost (10.203.177.99) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 10 Jan
 2025 18:02:17 +0100
Date: Fri, 10 Jan 2025 17:02:11 +0000
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <robh@kernel.org>, <linuxarm@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <Jonathan.Cameron@huawei.com>,
	<jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: Re: [PATCH] arm64: of: handle multiple threads in ARM cpu node
Message-ID: <20250110170211.00004ac2@huawei.com>
In-Reply-To: <Z4FJZPRg75YIUR2l@J2N7QTR9R3>
References: <20250110161057.445-1-alireza.sanaee@huawei.com>
	<Z4FJZPRg75YIUR2l@J2N7QTR9R3>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_090232_346748_900B9F1C 
X-CRM114-Status: GOOD (  40.78  )
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

On Fri, 10 Jan 2025 16:23:00 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

Hi Mark,

Thanks for prompt feedback.

Please look inline.

> On Fri, Jan 10, 2025 at 04:10:57PM +0000, Alireza Sanaee wrote:
> > Update `of_parse_and_init_cpus` to parse reg property of CPU node as
> > an array based as per spec for SMT threads.
> > 
> > Spec v0.4 Section 3.8.1:  
> 
> Which spec, and why do we care?

For the spec, this is what I looked
into https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf 
Section 3.8.1 

Sorry I didn't put the link in there.

One limitation with the existing approach is that it is not really
possible to describe shared caches for SMT cores as they will be seen
as separate CPU cores in the device tree. Is there anyway to do so?

More discussion over sharing caches for threads
here https://lore.kernel.org/kvm/20241219083237.265419-1-zhao1.liu@intel.com/

> 
> > The value of reg is a <prop-encoded-**array**> that defines a unique
> > CPU/thread id for the CPU/threads represented by the CPU node.
> > **If a CPU supports more than one thread (i.e.  multiple streams of
> > execution) the reg property is an array with 1 element per
> > thread**.  The address-cells on the /cpus node specifies how many
> > cells each element of the array takes. Software can determine the
> > number of threads by dividing the size of reg by the parent node's
> > address-cells.  
> 
> We already have systems where each thread gets a unique CPU node under
> /cpus, so we can't rely on this to determine the topology.

I assume we can generate unique values even in reg array, but probably
makes things more complicated.

> 
> Further, there are bindings which rely on being able to address each
> CPU/thread with a unique phandle (e.g. for affinity of PMU
> interrupts), which this would break.
> 
> > An accurate example of 1 core with 2 SMTs:
> > 
> > 	cpus {
> > 		#size-cells = <0x00>;
> > 		#address-cells = <0x01>;
> > 
> > 		cpu@0 {
> > 			phandle = <0x8000>;
> > 			**reg = <0x00 0x01>;**
> > 			enable-method = "psci";
> > 			compatible = "arm,cortex-a57";
> > 			device_type = "cpu";
> > 		};
> > 	};
> > 
> > Instead of:
> > 
> > 	cpus {
> > 		#size-cells = <0x00>;
> > 		#address-cells = <0x01>;
> > 
> > 		cpu@0 {
> > 			phandle = <0x8000>;
> > 			reg = <0x00>;
> > 			enable-method = "psci";
> > 			compatible = "arm,cortex-a57";
> > 			device_type = "cpu";
> > 		};
> > 
> > 		cpu@1 {
> > 			phandle = <0x8001>;
> > 			reg = <0x01>;
> > 			enable-method = "psci";
> > 			compatible = "arm,cortex-a57";
> > 			device_type = "cpu";
> > 		};
> > 	};
> > 
> > which is **NOT** accurate.  
> 
> It might not follow "the spec" you reference (and haven't named), but
> I think it's a stretch to say it's inaccurate.
> 
> Regardless, as above I do not think this is a good idea. While it
> allows the DT to be written in a marginally simpler way, it makes
> things more complicated for the kernel and is incompatible with
> bindings that we already support.
> 
> If anything "the spec" should be relaxed here.

Hi Rob,

If this approach is too disruptive, then shall we fallback to the
approach where go share L1 at next-level-cache entry?

Thanks,
Alireza
> 
> Mark.
> 
> > 
> > Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> > ---
> >  arch/arm64/kernel/smp.c | 74
> > +++++++++++++++++++++++------------------ 1 file changed, 41
> > insertions(+), 33 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index 3b3f6b56e733..8dd3b3c82967 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -689,53 +689,61 @@ static void __init
> > acpi_parse_and_init_cpus(void) static void __init
> > of_parse_and_init_cpus(void) {
> >  	struct device_node *dn;
> > +	u64 hwid;
> > +	u32 tid;
> >  
> >  	for_each_of_cpu_node(dn) {
> > -		u64 hwid = of_get_cpu_hwid(dn, 0);
> > +		tid = 0;
> >  
> > -		if (hwid & ~MPIDR_HWID_BITMASK)
> > -			goto next;
> > +		while (1) {
> > +			hwid = of_get_cpu_hwid(dn, tid++);
> > +			if (hwid == ~0ULL)
> > +				break;
> >  
> > -		if (is_mpidr_duplicate(cpu_count, hwid)) {
> > -			pr_err("%pOF: duplicate cpu reg properties
> > in the DT\n",
> > -				dn);
> > -			goto next;
> > -		}
> > +			if (hwid & ~MPIDR_HWID_BITMASK)
> > +				goto next;
> >  
> > -		/*
> > -		 * The numbering scheme requires that the boot CPU
> > -		 * must be assigned logical id 0. Record it so that
> > -		 * the logical map built from DT is validated and
> > can
> > -		 * be used.
> > -		 */
> > -		if (hwid == cpu_logical_map(0)) {
> > -			if (bootcpu_valid) {
> > -				pr_err("%pOF: duplicate boot cpu
> > reg property in DT\n",
> > -					dn);
> > +			if (is_mpidr_duplicate(cpu_count, hwid)) {
> > +				pr_err("%pOF: duplicate cpu reg
> > properties in the DT\n",
> > +				       dn);
> >  				goto next;
> >  			}
> >  
> > -			bootcpu_valid = true;
> > -			early_map_cpu_to_node(0,
> > of_node_to_nid(dn)); -
> >  			/*
> > -			 * cpu_logical_map has already been
> > -			 * initialized and the boot cpu doesn't
> > need
> > -			 * the enable-method so continue without
> > -			 * incrementing cpu.
> > +			 * The numbering scheme requires that the
> > boot CPU
> > +			 * must be assigned logical id 0. Record
> > it so that
> > +			 * the logical map built from DT is
> > validated and can
> > +			 * be used.
> >  			 */
> > -			continue;
> > -		}
> > +			if (hwid == cpu_logical_map(0)) {
> > +				if (bootcpu_valid) {
> > +					pr_err("%pOF: duplicate
> > boot cpu reg property in DT\n",
> > +					       dn);
> > +					goto next;
> > +				}
> > +
> > +				bootcpu_valid = true;
> > +				early_map_cpu_to_node(0,
> > of_node_to_nid(dn)); +
> > +				/*
> > +				 * cpu_logical_map has already been
> > +				 * initialized and the boot cpu
> > doesn't need
> > +				 * the enable-method so continue
> > without
> > +				 * incrementing cpu.
> > +				 */
> > +				continue;
> > +			}
> >  
> > -		if (cpu_count >= NR_CPUS)
> > -			goto next;
> > +			if (cpu_count >= NR_CPUS)
> > +				goto next;
> >  
> > -		pr_debug("cpu logical map 0x%llx\n", hwid);
> > -		set_cpu_logical_map(cpu_count, hwid);
> > +			pr_debug("cpu logical map 0x%llx\n", hwid);
> > +			set_cpu_logical_map(cpu_count, hwid);
> >  
> > -		early_map_cpu_to_node(cpu_count,
> > of_node_to_nid(dn));
> > +			early_map_cpu_to_node(cpu_count,
> > of_node_to_nid(dn)); next:
> > -		cpu_count++;
> > +			cpu_count++;
> > +		}
> >  	}
> >  }
> >  
> > -- 
> > 2.43.0
> > 
> >   
> 


