Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6D3CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 02:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJM5aDMEMhlJm6ksbZAor+Vg6bFxrrvKR8Asi7b/Klw=; b=l9C/MxDFpJsVSXnNEQN+7+TnEM
	ZCRzr+lINGtu9A5SyVuAc4eR3PQ+INXcAQ3IFpdRzw0HiuObJdfiFsCAeoLpOvpkLlMbV8uiq8/e6
	W8Apl4jzxdoYaUpNR2wkfO7GRQvqj9zEVzC8DbS7WpSD59jipvje8qwd8gl8anNX14adWyTyD6vOt
	e91YVAOa5J9IV8Q7Dwtu64Geq13wms1ym/yvoLl2EDKZhDRCguNXp/EAbSr/cj8gQ9hE9kH3plTLk
	svUdNSzF4npUo5RoWlNoV9yzbZWhzbFGuZl4YA/YHj3KuqWEkmLMRCoTKCBBhnM6A/GRRIS9klClX
	SknJ+n7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utd7e-00000003EOF-49v4;
	Wed, 03 Sep 2025 02:21:18 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utczr-00000003Cs8-1qtr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 02:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1756865591; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=YJM5aDMEMhlJm6ksbZAor+Vg6bFxrrvKR8Asi7b/Klw=;
	b=EplhDGPdawyhAAxbg2GK2hCkfD5Tl7wDy41MasFKA0WlqjQktMiw2eJpv+MeCF7WQIvc7J/Ipf2L66Ho0K3MYmsmIY541o78+7LAJp+gAChq25XEtL+nVGMIG9vArDBtv5cY+jBT9BEvWzAfmte7DsinXMinfgdPUwo5vBzV9Us=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wn9UZSB_1756865573 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Sep 2025 10:13:08 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Mark Rutland <mark.rutland@arm.com>,  James Morse
 <james.morse@arm.com>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org, Takao Indoh <indou.takao@jp.fujitsu.com>,
 QI Fuli <qi.fuli@fujitsu.com>, Andrea Arcangeli <aarcange@redhat.com>,
 Rafael Aquini <aquini@redhat.com>
Subject: Re: [RFC PATCH v1 0/2] Don't broadcast TLBI if mm was only active
 on local CPU
In-Reply-To: <20250829153510.2401161-1-ryan.roberts@arm.com> (Ryan Roberts's
	message of "Fri, 29 Aug 2025 16:35:06 +0100")
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
Date: Wed, 03 Sep 2025 10:12:52 +0800
Message-ID: <874itk1dy3.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_191315_650295_251B5B6C 
X-CRM114-Status: GOOD (  18.47  )
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

Hi, Ryan,

Ryan Roberts <ryan.roberts@arm.com> writes:

> Hi All,
>
> This is an RFC for my implementation of an idea from James Morse to avoid
> broadcasting TBLIs to remote CPUs if it can be proven that no remote CPU could
> have ever observed the pgtable entry for the TLB entry that is being
> invalidated. It turns out that x86 does something similar in principle.
>
> The primary feedback I'm looking for is; is this actually correct and safe?
> James and I both believe it to be, but it would be useful to get further
> validation.
>
> Beyond that, the next question is; does it actually improve performance?
> stress-ng's --tlb-shootdown stressor suggests yes; as concurrency increases, we
> do a much better job of sustaining the overall number of "tlb shootdowns per
> second" after the change:
>
> +------------+--------------------------+--------------------------+--------------------------+
> |            |     Baseline (v6.15)     |        tlbi local        |        Improvement       |
> +------------+-------------+------------+-------------+------------+-------------+------------+
> | nr_threads |     ops/sec |    ops/sec |     ops/sec |    ops/sec |     ops/sec |    ops/sec |
> |            | (real time) | (cpu time) | (real time) | (cpu time) | (real time) | (cpu time) |
> +------------+-------------+------------+-------------+------------+-------------+------------+
> |          1 |        9109 |       2573 |        8903 |       3653 |         -2% |        42% |
> |          4 |        8115 |       1299 |        9892 |       1059 |         22% |       -18% |
> |          8 |        5119 |        477 |       11854 |       1265 |        132% |       165% |
> |         16 |        4796 |        286 |       14176 |        821 |        196% |       187% |
> |         32 |        1593 |         38 |       15328 |        474 |        862% |      1147% |
> |         64 |        1486 |         19 |        8096 |        131 |        445% |       589% |
> |        128 |        1315 |         16 |        8257 |        145 |        528% |       806% |
> +------------+-------------+------------+-------------+------------+-------------+------------+
>
> But looking at real-world benchmarks, I haven't yet found anything where it
> makes a huge difference; When compiling the kernel, it reduces kernel time by
> ~2.2%, but overall wall time remains the same. I'd be interested in any
> suggestions for workloads where this might prove valuable.
>
> All mm selftests have been run and no regressions are observed. Applies on
> v6.17-rc3.

Thanks for working on this.

Several previous TLBI broadcast optimization have been tried before,
Cced the original authors for discussion.  Some workloads show good
improvement,

https://lore.kernel.org/lkml/20190617143255.10462-1-indou.takao@jp.fujitsu.com/
https://lore.kernel.org/all/20200203201745.29986-1-aarcange@redhat.com/

Especially in the following mail,

https://lore.kernel.org/all/20200314031609.GB2250@redhat.com/

---
Best Regards,
Huang, Ying

