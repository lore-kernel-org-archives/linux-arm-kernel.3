Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B326CE7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 12:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5qTHACZI0H2lHCiV+JEWtksV2aRmJ/ZPd1E36NpHog=; b=VIEvXY94jtPzRaseQFWfzoYgzp
	BF7LmedKeJgWqNVwN0Db3HC98jP0W9+Fhps1H00+UyiXhEy/lmevCrNtkFG9evAR8gFeJ/aGueEKT
	fAr80Tm5x7QtCQnrL3nXOVPlT6CwSF0oJleZo8yJTEj7bBB3EQXQaaXlxR51wFToc57JOMAjRZAsb
	S9xq5ELdrMlBeO+XkAmjMjLwgNx2oXs83urQSDDqIrcmQH6JsjSzeAENdu3kdIhuOCwmz0LqJy7Qy
	YhcyiksXuia3CUQo7c4VEJ/ZYPvF/6Qx7C94LZYdvHHfCdUvY5GcRaXcdVakqolQlpaKJi8ZTKq7V
	E29ar9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJ7E-000000051Sb-1dFU;
	Mon, 13 Jan 2025 12:00:20 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJ5y-0000000514K-1IaI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:59:04 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YWrN90pJ2z6M4t2;
	Mon, 13 Jan 2025 19:57:13 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 37EBA140A70;
	Mon, 13 Jan 2025 19:58:55 +0800 (CST)
Received: from localhost (10.203.177.99) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 13 Jan
 2025 12:58:54 +0100
Date: Mon, 13 Jan 2025 11:58:49 +0000
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, Linuxarm
	<linuxarm@huawei.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, jiangkunkun <jiangkunkun@huawei.com>,
	yangyicong <yangyicong@huawei.com>, "zhao1.liu@intel.com"
	<zhao1.liu@intel.com>
Subject: Re: [PATCH] arm64: of: handle multiple threads in ARM cpu node
Message-ID: <20250113115849.00006fee@huawei.com>
In-Reply-To: <Z4FYHvbVhMHrGQI4@J2N7QTR9R3>
References: <20250110161057.445-1-alireza.sanaee@huawei.com>
	<Z4FJZPRg75YIUR2l@J2N7QTR9R3>
	<20250110170211.00004ac2@huawei.com>
	<Z4FYHvbVhMHrGQI4@J2N7QTR9R3>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_035902_648723_FDCB6B6D 
X-CRM114-Status: GOOD (  37.41  )
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

On Fri, 10 Jan 2025 17:25:50 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

Hi Mark,

Just resending, but without the screenshot mistakenly attached to
the other email. Sorry about that.

> On Fri, Jan 10, 2025 at 05:02:11PM +0000, Alireza Sanaee wrote:
> > On Fri, 10 Jan 2025 16:23:00 +0000
> > Mark Rutland <mark.rutland@arm.com> wrote:
> > 
> > Hi Mark,
> > 
> > Thanks for prompt feedback.
> > 
> > Please look inline.
> >   
> > > On Fri, Jan 10, 2025 at 04:10:57PM +0000, Alireza Sanaee wrote:  
> > > > Update `of_parse_and_init_cpus` to parse reg property of CPU
> > > > node as an array based as per spec for SMT threads.
> > > > 
> > > > Spec v0.4 Section 3.8.1:    
> > > 
> > > Which spec, and why do we care?  
> > 
> > For the spec, this is what I looked
> > into https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf 
> > Section 3.8.1 
> > 
> > Sorry I didn't put the link in there.  
> 
> Ok, so that's "The devicetree specification v0.4 from ${URL}", rather
> than "Spec v0.4".

:) sure, I will be more precise in my future correspondences.

> 
> > One limitation with the existing approach is that it is not really
> > possible to describe shared caches for SMT cores as they will be
> > seen as separate CPU cores in the device tree. Is there anyway to
> > do so?  
> 
> Can't the existing cache bindings handle that? e.g. give both threads
> a next-level-cache pointing to the shared L1?

Unfortunately, I have tested this recently, there are some leg work to
be able to even enable that, and does not work right now.

> 
> > More discussion over sharing caches for threads
> > here https://lore.kernel.org/kvm/20241219083237.265419-1-zhao1.liu@intel.com/  
> 
> In that thread Rob refers to earlier discussions, so I don't think
> that thread alone has enough context.

https://lore.kernel.org/linux-devicetree/CAL_JsqLGEvGBQ0W_B6+5cME1UEhuKXadBB-6=GoN1tmavw9K_w@mail.gmail.com/

This was the earlier discussion, where Rob pointed me towards
investigating this approach (this patch).

> 
> > > > The value of reg is a <prop-encoded-**array**> that defines a
> > > > unique CPU/thread id for the CPU/threads represented by the CPU
> > > > node. **If a CPU supports more than one thread (i.e.  multiple
> > > > streams of execution) the reg property is an array with 1
> > > > element per thread**.  The address-cells on the /cpus node
> > > > specifies how many cells each element of the array takes.
> > > > Software can determine the number of threads by dividing the
> > > > size of reg by the parent node's address-cells.    
> > > 
> > > We already have systems where each thread gets a unique CPU node
> > > under /cpus, so we can't rely on this to determine the topology.  
> > 
> > I assume we can generate unique values even in reg array, but
> > probably makes things more complicated.  
> 
> The other bindings use phandles to refer to threads, and phandles
> point to nodes in the dt, so it's necessary for threads to be given
> separate nodes.
> 
> Note that the CPU topology bindings use that to describe threads, see
> 
>   Documentation/devicetree/bindings/cpu/cpu-topology.txt

Noted. Makes sense.

> 
> > > Further, there are bindings which rely on being able to address
> > > each CPU/thread with a unique phandle (e.g. for affinity of PMU
> > > interrupts), which this would break.  
> 
> > > Regardless, as above I do not think this is a good idea. While it
> > > allows the DT to be written in a marginally simpler way, it makes
> > > things more complicated for the kernel and is incompatible with
> > > bindings that we already support.
> > > 
> > > If anything "the spec" should be relaxed here.  
> > 
> > Hi Rob,
> > 
> > If this approach is too disruptive, then shall we fallback to the
> > approach where go share L1 at next-level-cache entry?  
> 
> Ah, was that previously discussed, and were there any concerns against
> that approach?
> 
> To be clear, my main concern here is that threads remain represented
> as distinct nodes under /cpus; I'm not wedded to the precise solution
> for representing shared caches.

This was basically what comes to mind as a
non-invasive preliminary solution. That said
there were no discussions over downsides or advantages of having a
separate layer for l1-cache YET. 

But if it is something reasonable, I can look into it.  

> 
> Mark.
> 
> 

Thanks,
Alireza

