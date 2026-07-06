Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xy8ZAHUZN1wDyXUZpqHr7pd7Qxsxq2dcB4YVK2d78UM=; b=AZLl6LnWBj4bdPwb6LnAOI/8tL
	0mMpT/op3cEF5NAgCYu8/cu0ErXchSwwqNAbip3eKRWM4xe5enMauMDNZ/HugFThdiVPqgxI/DZaI
	8N4gVfjElNucXJCWa8zSXDJyUxj+zKIip5JDibaSCMYg4fqmtbLrHoxPqdZVm4HWKcrkQI/kUpDRm
	kI0+f4uQ8WtFekF5mtYQrXBU+3dTshPyc2cHPI6bco+uNSRcU3Kh7s2ozlC8oUO2Ck3Zi01NaFFKB
	OIlxcXx/TcGwK/J85viJh1LZy9J0ENHi5xnY10TNvRB64rWyGNCqlU8q8ScXQ3ycrSZN1zf6c5qza
	CaE+Y59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnHp-0000000DDlc-2ZyG;
	Mon, 06 Jul 2026 17:39:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnHo-0000000DDl9-0Afq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:39:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F05E42B18;
	Mon,  6 Jul 2026 17:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193131F000E9;
	Mon,  6 Jul 2026 17:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783359555;
	bh=Xy8ZAHUZN1wDyXUZpqHr7pd7Qxsxq2dcB4YVK2d78UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d2725Cv2SbkjroOwXMCQ90Zndp1LCuuP+oxD7Hh1kJOXd4cBLnMayT8qAJelXWBI8
	 wxwtlzFw59VLpTzpvISqrJp7o8+KHZg2XbWqJtSV2ePjsrcZMQM9+7wxE1AtoN8lhP
	 oOEZaDxRF15LYlsQQ3CJIiEW6aiz2tpMHHO1reqpVuHFtdyTssr3YAJLHHuxNYl7x0
	 9CtYw7IRPgP8iZr/D26YVgqq17gzEp8bdc9vcEPf4+W1tivITxsqzgFgkIgsVj1a9a
	 EbMcEECvf7SpMo9X7E8VDwa04ifSCb2J8VD32DgfuB+EDAm3wNAzgeb+YwhbE4ooAB
	 HblcgOXbvch/g==
Date: Mon, 6 Jul 2026 18:39:03 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, tsbogend@alpha.franken.de, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
	nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
	david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <akvoN5vvQaW3MdmI@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <ajvKkLw5bL-FT5JC@willie-the-truck>
 <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
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

Hi Jinjie,

On Thu, Jun 25, 2026 at 09:34:36AM +0800, Jinjie Ruan wrote:
> On 6/24/2026 8:16 PM, Will Deacon wrote:
> > Please just give me the time I asked for. If you want to help out in the
> > meantime, there are plenty of patches that need reviewing...
> 
> It was a mistake on my part, and I sincerely apologize for wasting
> community review resources and disrupting your schedule.
> 
> I will absolutely back off now and wait for your official series. Lesson
> learned. Thanks for your patience and for calling me out on this.

So I've mostly got the old series back on its feet:

  https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug

but there are still two issues left to resolve:

  1. The printing that can happen before RCU has started. Although I've
     reduced this somewhat, there are still error paths in e.g.
     verify_local_cpu_capabilities() that print a message before dying.

  2. check_local_cpu_capabilities() can mutate the system capability
     state via update_cpu_capabilities(), so it's really dodgy running
     that prior to synchronisation.

Since you've added patches in this series that try to tackle these
problems, I'll reply on those two so we can figure out how we would like
to proceed.

Cheers,

Will

