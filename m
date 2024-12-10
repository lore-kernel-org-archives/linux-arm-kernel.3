Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFCEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1+yRGBwPfGnb+EMVLsYMgGZR1S7zUQhuHKZuzoGenI=; b=qAEoAgexnbbC7WO5luJrGz0LF4
	SMGZTt7MZEMjPndl77JBwXg3FnnqSFOE8kdTHHQS/GD/U603TpFOJi2IvlDYG25pwxUP6WIjSiDdO
	g7CdiVInpA6fFVMvGM9X11xyW58O8oSRTQImrYO/KeqziHHFoB22lAUxQe7gRVY/qrhVld6SRivno
	STRoE3Govg4UKoh0WKuNsXBGmGzDUUlZ3zo5PZ1cP33dEqVTonTBfbOpGNZCQH6EdjhSVNw6nGiDE
	hoGTBun85B6CcVnqeOjyH3uFBxlQheZQxtr8iru5yaHikvr0eS+vOqwbCVwkIE4uRuGMipupdIUmX
	edV6un3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKz1A-0000000BNzT-3nrF;
	Tue, 10 Dec 2024 12:07:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKz06-0000000BNla-3OMd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 12:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B09685C5B44;
	Tue, 10 Dec 2024 12:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AA4C4CEE0;
	Tue, 10 Dec 2024 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733832361;
	bh=FvFZp70ctGDvp4To62uUbmitx5iXeIthOprZf+Eo9ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CrKm4v+fpaoBW8zdmjdPmVeatZyfGVXqELBMAguUuedNBKVhvsLjypQLQo84VWjs6
	 1xk0j+MsGMDed1a7Psc3QLxrC4WMPf0drfc5V6PS02Ae+TybErh7ve9o8W0REBey0q
	 Up1McXyr0PzECJQlPrK3UsBxCsHBTtursPjc2hn1YDOkt3mlAncM6vA5gfaMbg+D6v
	 eOoooHP2D1dGh8jLWIxqAanLco+unTdedrakjAsmxInOYt+Id+pCqMpXQixSCj3jCE
	 yOHWdtrwVTnkfDs6v00s5UKFQGcsZTFVvBaKVSUsmmS/sdmk2l71WaNLkldUiPoQcL
	 CTv48f9M5/w0g==
Date: Tue, 10 Dec 2024 12:05:57 +0000
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: jonathan.cameron@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, yangyicong@hisilicon.com,
	hejunhao3@huawei.com, linuxarm@huawei.com, wangyushan12@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v4 00/10] Refactor the common parts to the HiSilicon
 Uncore PMU core and cleanups
Message-ID: <20241210120556.GA15398@willie-the-truck>
References: <20241203125049.39458-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203125049.39458-1-yangyicong@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_040602_931904_59DD55D4 
X-CRM114-Status: GOOD (  16.23  )
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

On Tue, Dec 03, 2024 at 08:50:39PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> This series mainly contains the refactor of the HiSilicon Uncore PMU by
> extracting the common parts from each drivers into the core:
> - the retrieving of the PMU topology ID
> - the common sysfs attributes like cpumask and identifier
> 
> In order to achieve this, we need to do below preparation:
> - refactor the detection of associated CPUs for PMUs locates on a SICL
> - maintain the topology information in a dedicated data structure
> - provides a generic implementation of cpumask/identifier attributes
> 
> Besides also include below changes/cleanups in this patchset
> - add one new sysfs attributes for better describing the topology information
>   of the associated CPUs of the PMU.
> - define a symbol namespace for HiSilicon Uncore PMUs to avoid pollute the
>   common ones
> - two minor nonfunctional cleanups of DDRC PMU
> 
> Change since v3:
> - Split the associated_cpus refactor patches according to the functions, hope
>   will be easier to review
> - Drop the use of cpu_online_mask out of cpuhp
> Link: https://lore.kernel.org/linux-arm-kernel/20241026072424.29887-1-yangyicong@huawei.com/

This doesn't build on top of -rc2 (see log below). I suspect this is because
of the recent MODULE_IMPORT_NS() changes to use string literals [1].

Please can you send a v5?

Will

[1] cdd30ebb1b9f ("module: Convert symbol namespace to string literal")

--->8

In file included from ./include/linux/module.h:22,
                 from ./include/linux/device/driver.h:21,
                 from ./include/linux/device.h:32,
                 from ./include/linux/acpi.h:14,
                 from drivers/perf/hisilicon/hisi_uncore_hha_pmu.c:11:
drivers/perf/hisilicon/hisi_uncore_hha_pmu.c:559:18: error: expected ‘,’ or ‘;’ before ‘HISI_PMU’
  559 | MODULE_IMPORT_NS(HISI_PMU);
      |                  ^~~~~~~~
./include/linux/moduleparam.h:26:47: note: in definition of macro ‘__MODULE_INFO’
   26 |   = __MODULE_INFO_PREFIX __stringify(tag) "=" info
      |                                               ^~~~
./include/linux/module.h:299:30: note: in expansion of macro ‘MODULE_INFO’
  299 | #define MODULE_IMPORT_NS(ns) MODULE_INFO(import_ns, ns)
      |                              ^~~~~~~~~~~
drivers/perf/hisilicon/hisi_uncore_hha_pmu.c:559:1: note: in expansion of macro ‘MODULE_IMPORT_NS’
  559 | MODULE_IMPORT_NS(HISI_PMU);
      | ^~~~~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:194: drivers/perf/hisilicon/hisi_uncore_hha_pmu.o] Error 1
make[5]: *** Waiting for unfinished jobs....
In file included from ./include/linux/module.h:22,
                 from ./include/linux/device/driver.h:21,
                 from ./include/linux/device.h:32,
                 from ./include/linux/acpi.h:14,
                 from drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c:11:
drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c:595:18: error: expected ‘,’ or ‘;’ before ‘HISI_PMU’
  595 | MODULE_IMPORT_NS(HISI_PMU);
      |                  ^~~~~~~~
./include/linux/moduleparam.h:26:47: note: in definition of macro ‘__MODULE_INFO’
   26 |   = __MODULE_INFO_PREFIX __stringify(tag) "=" info
      |                                               ^~~~
./include/linux/module.h:299:30: note: in expansion of macro ‘MODULE_INFO’
  299 | #define MODULE_IMPORT_NS(ns) MODULE_INFO(import_ns, ns)
      |                              ^~~~~~~~~~~
drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c:595:1: note: in expansion of macro ‘MODULE_IMPORT_NS’
  595 | MODULE_IMPORT_NS(HISI_PMU);
      | ^~~~~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:194: drivers/perf/hisilicon/hisi_uncore_l3c_pmu.o] Error 1
/tmp/ccKFrDMm.s: Assembler messages:
/tmp/ccKFrDMm.s:7: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:8: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:9: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:10: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:11: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:12: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:13: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:14: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:15: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:16: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:17: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:18: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:19: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:20: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:21: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:22: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:23: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:24: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:25: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:26: Error: junk at end of line, first unrecognized character is `H'
/tmp/ccKFrDMm.s:27: Error: junk at end of line, first unrecognized character is `H'
make[5]: *** [scripts/Makefile.build:194: drivers/perf/hisilicon/hisi_uncore_pmu.o] Error 1
In file included from ./include/linux/module.h:22,
                 from ./include/linux/device/driver.h:21,
                 from ./include/linux/device.h:32,
                 from ./include/linux/acpi.h:14,
                 from drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c:11:
drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c:556:18: error: expected ‘,’ or ‘;’ before ‘HISI_PMU’
  556 | MODULE_IMPORT_NS(HISI_PMU);
      |                  ^~~~~~~~
./include/linux/moduleparam.h:26:47: note: in definition of macro ‘__MODULE_INFO’
   26 |   = __MODULE_INFO_PREFIX __stringify(tag) "=" info
      |                                               ^~~~
./include/linux/module.h:299:30: note: in expansion of macro ‘MODULE_INFO’
  299 | #define MODULE_IMPORT_NS(ns) MODULE_INFO(import_ns, ns)
      |                              ^~~~~~~~~~~
drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c:556:1: note: in expansion of macro ‘MODULE_IMPORT_NS’
  556 | MODULE_IMPORT_NS(HISI_PMU);
      | ^~~~~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:194: drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.o] Error 1
make[4]: *** [scripts/Makefile.build:440: drivers/perf/hisilicon] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [scripts/Makefile.build:440: drivers/perf] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:440: drivers] Error 2

