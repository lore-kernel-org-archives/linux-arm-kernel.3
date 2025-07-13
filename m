Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BD8C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcAfXwZTwhsFOnTv8hjkbY6OakGWxcNlPUDqFClSedg=; b=LQWze3AIsprLuAgSyfjNdI6wAc
	v/RRuSz6Kai7XXQKNhLSi+dWI0PS1mhv3YGv8HRZiVtOeJE1QHotzNc8uWoGiE4rNG09MDIvLVYiV
	/Bt4+FU45+8LGAeAFAWPzb+dzrcEDB14ZR/gSvAunBpIODRkMWnoFvAW5PSPIhHBVN6uFKKXkv3lm
	iJ02leJTo49DXpc4dpH/mhiFyYD2fkGpZr3163n7B06PPLdlKRZ7t8LXTKKU66L+LKMPdh/FI7DYD
	a5rU5YQbhvKnBjOXHGQHgHfnVATxG/C8czwQjeEVVzcgHc8RCeBx2JOHouewqvhq4pG6os/UaCwxa
	vm8MWkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazag-00000000NvB-2VX7;
	Sun, 13 Jul 2025 16:30:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazYD-00000000Nl3-1jFZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 16:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42019A4FD1C;
	Sun, 13 Jul 2025 16:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CD6C4CEE3;
	Sun, 13 Jul 2025 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752424059;
	bh=os7v1CoGQxJnQ+61L30sCkA48/y+wIkRcL+WdNgUE2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I7hUGwAQ0aw2rJZSbXsemST2c73iBGjy9KFwZLcz2MUTMNqDO83PmoEvO7Me/DsWv
	 q+3ngqUR7q7ytHY5Ep5lKshzJKaz68BGGlr+ch0YAaGGJvI6yIrLYCn/pxG3EyS0ET
	 tV4zRluMnf75avHqkJp69JcTh/+uWac30GeutgLhczSsoOG+CuwRip+jaBIF13xgcT
	 KyKQ9KwWU+qZYL0xEkLkIVPCWWDXqcg1NouSEApPiYie5W/T8Knha/C9jMzlQEKS1W
	 wYykANdPHZyn3Agn3Xzeb6ZBBMzDMwRSAJ5zvKs042xBaSTrbm5yfPfDXvi0seMyMl
	 nTv+jFHqq0xfw==
Date: Sun, 13 Jul 2025 17:27:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <will@kernel.org>, <mark.rutland@arm.com>, <yangyicong@hisilicon.com>,
 <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
 <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
 <wangyushan12@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v3 0/8] General updates and two new drivers for
 HiSilicon Uncore PMU
Message-ID: <20250713172732.13100182@jic23-huawei>
In-Reply-To: <c5a99a5a-20d9-ef07-1cc3-cb025f446619@huawei.com>
References: <20250619125557.57372-1-yangyicong@huawei.com>
	<c5a99a5a-20d9-ef07-1cc3-cb025f446619@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_092741_589510_95DF1FAA 
X-CRM114-Status: GOOD (  23.01  )
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

On Tue, 1 Jul 2025 20:36:11 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> Hi Will and Mark,
> 
> just want to make sure the mail's not lost somehow, it's been skipped for the last cycle and
> no further comment since v2.

Hi Will and Mark,

This one is still outstanding and Yicong mentioned some recent issues with
some Huawei emails being taken out by spam filters.  As such, a quick
ping from an account that shouldn't suffer that fate!

Jonathan

> 
> thanks.
> 
> On 2025/6/19 20:55, Yicong Yang wrote:
> > From: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > Support new version of DDRC/SLLC PMU identified with updated ACPI HID and
> > register definition. In order to support this, we do a preliminary refactor
> > to initialize device of each version by using driver data of each HID
> > rather than checking the version. This will also make the driver easier to
> > maintain and extend, since only the HID specific information along
> > with the new HID will be added to support the new version without touching
> > the common logic.
> > 
> > Two new Uncore PMU drivers is also added to support the monitoring the
> > events of the system bus (by NoC PMU) and the DVM operations (by MN PMU).
> > 
> > Change since v2:
> > - Rebase on 6.15-rc1, add Jonathan's tag.
> > Link: https://lore.kernel.org/linux-arm-kernel/20250321073846.23507-1-yangyicong@huawei.com/
> > 
> > Change since v1:
> > - Fold patch which extending the struct hisi_pmu_dev_info into its user
> > - Use bit shift rather than bit mask for SLLC PMU registers configuration
> > - Address other comments by Jonathan, thanks
> > Link: https://lore.kernel.org/linux-arm-kernel/20250218092000.41641-1-yangyicong@huawei.com/
> > 
> > Junhao He (6):
> >   drivers/perf: hisi: Simplify the probe process for each DDRC version
> >   drivers/perf: hisi: Add support for HiSilicon DDRC v3 PMU driver
> >   drivers/perf: hisi: Use ACPI driver_data to retrieve SLLC PMU
> >     information
> >   drivers/perf: hisi: Add support for HiSilicon SLLC v3 PMU driver
> >   drivers/perf: hisi: Relax the event number check of v2 PMUs
> >   drivers/perf: hisi: Add support for HiSilicon MN PMU driver
> > 
> > Yicong Yang (2):
> >   drivers/perf: hisi: Support PMUs with no interrupt
> >   drivers/perf: hisi: Add support for HiSilicon NoC PMU
> > 
> >  Documentation/admin-guide/perf/hisi-pmu.rst   |  11 +
> >  drivers/perf/hisilicon/Makefile               |   3 +-
> >  drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 354 ++++++++--------
> >  drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |   6 +-
> >  drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   | 355 ++++++++++++++++
> >  drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  | 392 ++++++++++++++++++
> >  drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   |   2 +-
> >  drivers/perf/hisilicon/hisi_uncore_pmu.c      |  11 +-
> >  drivers/perf/hisilicon/hisi_uncore_pmu.h      |   2 +
> >  drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 220 +++++++---
> >  10 files changed, 1098 insertions(+), 258 deletions(-)
> >  create mode 100644 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
> >  create mode 100644 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
> >   
> 


