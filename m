Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F230DC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Av6N2v99kQHQnPnSJFrkMLTImKrQ1RUbvtaexxYCx2o=; b=BVSYjCC5la56885zXrzgxfviwo
	qXYHUq2ek5r0hK7+pooiSaBwWZq/8ZjO2hrTRoXiT8DtRJEaOBnK/BlyXzhxnbiW9KxhiAuyuNHML
	B3kUcTxa6CSb3bhEtK++B5YEWo+oaOaBfNihRJ6pbTz4CURbVmDODpwUlX/ZfGFYoZNLb1atMFWKk
	d6KXtaH9dkJBGTv3KAIokvPCYkVQsOoIzwkxhWKv0Mgqw62W6BLehG5Y3eyIOlkevmWLdqUMSPyVm
	cWQrnxXHHzPte+gBcB78gujcitNCL/7ItFSPR8uNRgwVxOmEP3JVHeG66iQnjjlaEhpIm/neX1A9A
	w3Dzwejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2ki-00000004zYr-0XzF;
	Mon, 17 Feb 2025 15:09:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2ZM-00000004xgh-2UcZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:58:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83D1F5C580B;
	Mon, 17 Feb 2025 14:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58F0C4CEE4;
	Mon, 17 Feb 2025 14:57:55 +0000 (UTC)
Date: Mon, 17 Feb 2025 14:57:53 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Beata Michalska <beata.michalska@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	ionela.voinescu@arm.com, sudeep.holla@arm.com, will@kernel.org,
	viresh.kumar@linaro.org, sumitg@nvidia.com,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 2/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <Z7NOcd3IamyMTjbH@arm.com>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
 <20250131162439.3843071-3-beata.michalska@arm.com>
 <CAJZ5v0g+yax=pT4m_2MTd9kUwbk5VBp2wkctTYJpFRU3myEjPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0g+yax=pT4m_2MTd9kUwbk5VBp2wkctTYJpFRU3myEjPQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_065800_709710_7E913156 
X-CRM114-Status: GOOD (  24.57  )
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

On Mon, Feb 17, 2025 at 12:52:44PM +0100, Rafael J. Wysocki wrote:
> On Fri, Jan 31, 2025 at 5:25 PM Beata Michalska <beata.michalska@arm.com> wrote:
> >
> > Currently the CPUFreq core exposes two sysfs attributes that can be used
> > to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> > and scaling_cur_freq. Both provide slightly different view on the
> > subject and they do come with their own drawbacks.
> >
> > cpuinfo_cur_freq provides higher precision though at a cost of being
> > rather expensive. Moreover, the information retrieved via this attribute
> > is somewhat short lived as frequency can change at any point of time
> > making it difficult to reason from.
> >
> > scaling_cur_freq, on the other hand, tends to be less accurate but then
> > the actual level of precision (and source of information) varies between
> > architectures making it a bit ambiguous.
> >
> > The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
> > distinct interface, exposing an average frequency of a given CPU(s), as
> > reported by the hardware, over a time frame spanning no more than a few
> > milliseconds. As it requires appropriate hardware support, this
> > interface is optional.
> >
> > Note that under the hood, the new attribute relies on the information
> > provided by arch_freq_get_on_cpu, which, up to this point, has been
> > feeding data for scaling_cur_freq attribute, being the source of
> > ambiguity when it comes to interpretation. This has been amended by
> > restoring the intended behavior for scaling_cur_freq, with a new
> > dedicated config option to maintain status quo for those, who may need
> > it.
> 
> In case anyone is waiting for my input here
> 
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> 
> for this and the previous patch and please feel free to route them
> both through ARM64.

Thanks Rafael. I indeed plan to take them through the arm64 tree.

-- 
Catalin

