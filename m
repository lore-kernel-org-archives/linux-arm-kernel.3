Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA02CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqBkku5Qzxxz55tdNc8cxCNt7+/y1f76Nxxrn3grExM=; b=19m/8dpuFTB5txUxCcTxr79WLW
	9N7aSIW65hcnXy9a9EjUH2uTH1VZccPZZa3MhkK4skkBD1GJdf3dwFaLifWySUaWTNSiSLqjD1nqZ
	lJ+zB5mz1Q0DuOZphS9pj7JUsZHLKWhZe9MtBArJw2Wrx+Os3dQQpDMMEEEP8KER0E3kx+ISUqrB3
	7zmp7UQxuwvEaL/YB9YukW6j7zveIQegRW2OWyttaiN01+KppG0frzPVtsdRGfqd9iKsX1IVSqtf0
	RwbQkJiV/oNaOt5vp1U8W2MctYk+vpQBL8yZ22PvS2xgLWX+5DzCVxiW3yfIRk+OK7D+69Af8DLC/
	WaHLeV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1Sr-00000004JTN-48rt;
	Thu, 07 May 2026 16:20:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1Sq-00000004JSt-0q5m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:20:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso101385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 09:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778170839; cv=none;
        d=google.com; s=arc-20240605;
        b=a+XVhiCEqCAKDoS4c+8ej/uKwIQQKk6r8NkIJEc+gZhkgQ1E0JNdgZhWhVNpUR/72b
         RgfrAQ8CNv2uBjykR+U42uhAu+uhp+NNuMunVST+Kyx7treX8yRs6ixkB0/XyU4Achz/
         f8nzSkpJC6iNhEumKRsU4EATwjXRA0hpgby1nlZRsTBLdjU5xlV+kd3T3O0FKMRMQYBy
         9TKnWVcPksPvwcEM93TLUXxOBMuynlrhdO6SCxaN+8LiBZPERO4O/WqFrmGk9bt9il3K
         sz6pSkUNoRPUEfrT3hnxupfgpFoaS+YbaYjXCdfZc4bzR0+W6zU6hj5ErDLBjmh/aFLb
         ZHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CqBkku5Qzxxz55tdNc8cxCNt7+/y1f76Nxxrn3grExM=;
        fh=SUTY7o2Fp81VibsFF6hZKToUDd7V6+m8LKBHfR28HW8=;
        b=I0xVpVRfpv2tc3/U3lgBmdPXMbEujRzh1Z53i3JptgwqMBaOO9iUSzzLsLyUbNGBvX
         n4EEQl5qJwHncRcYi+Q+uagbV4Jz3r1/L0GaC3gC2l88IgZgvXrtMtMN4kMpx7RanLE1
         aN3KfZNO4xWVGDaMEJqdXhhu7bnxBf+MNduWmHlQd8rGgMGk4byP2Cahpd+d4wl5iW6i
         hVrk8+G6Wxqx74X0QIRkWEQVRK03+ZaZj6jj8jOpIZymX17wZSoNchhaCNutiNpL/N0J
         LUCgN/F12JmYr90zwXzSHiNE0P+YfWGPrXywfNLnVLr3lCiTeH4M065mtX5qduugHPOW
         HcAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778170839; x=1778775639; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqBkku5Qzxxz55tdNc8cxCNt7+/y1f76Nxxrn3grExM=;
        b=PPeCtPBgfIhUWNHQt3Cvxem8VmxgktC3Qj4YyYJUbO/Wpt4SsjCExle6aIIMmtDYB4
         ZDDhnfUl26Qd/4a+G48YcuVMf2zrSNSIk//2qn1ZGbJ2lj/G2y7WJIUdr38qm7DJRrzD
         hRGBC8MNjJbAVwq0aqBHKGEpVrPVlqlYJbE97OKVfdlEWHAtAV604SVv6TcZXqDeCjr2
         5t8+vAJXFZ8EIysCPbdupIs3YKhN/XHm7V4/mifmoU5qVjutpTy4xU8BDwHYFbzHBtbN
         JbwKzYlPvoreJjLJQGEJXG6hCQU/AVWQKtFogqh9lbe8Xjtt2hHgqXsLESvQjC/toKT2
         wGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778170839; x=1778775639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CqBkku5Qzxxz55tdNc8cxCNt7+/y1f76Nxxrn3grExM=;
        b=TBCdPXMlBbhS615Wkt/o6WAlN0fS6I3YWbY5i5EKScZNRpaeYdPee8zkaq0DrvOXDB
         8P2dNigwI4b1s5Wbr1kWNwQqE8achwLR0i+Dq6XGWqnuIrGEFCVBG6ds6m7nBj4Dq6cd
         OVXEI6Wi7FtoRX4+uhQ/ghK9IYN25bHS+QOdt5d0AgFMvyI1tCo9OX6EL3s4bFln8Vhs
         AsSeJuAzqSljyZO4c3y9Swz1mVCEhb7mo2AkKTHIorFPAYWr0aGQ6gfGcw+Dz6gMbiT9
         asejCBAx/n5bjXK7Q3I9KaxUHGdlUFsj8mLfE5mTasfUopg7Ij3B6+az/Ne1o6+AqJFh
         Wzrw==
X-Forwarded-Encrypted: i=1; AFNElJ/LFzsvWaFvwRd0ryzPlAYV/02moUiwNXdASji11lEpHgAAf+ZR/jVUuG4I/17eWejvs6YyLAdw9lAyyZLU7dmB@lists.infradead.org
X-Gm-Message-State: AOJu0YyMu990rCrliMlHxQafAo8eg+OJAJ1Y3Zi9vA2oCb997jBVbn0/
	MmbW/b1HWmGGcpJ4DfqyhMmfLkLH+qZz/8RsJHqHdHTgt1IWnJq/MSyEuWfEc+HbiWNQvGO00RA
	6gshcrqr7qXBfAe2fXYmtYT5FAwz8DKxNnxYt1YUa
X-Gm-Gg: AeBDiesHL8vKFoH89JSBctkOfI3G7ScdIXjYrNr3yUxu/2gPlbVx2LCoUZCyF++mdv0
	fu3+kHYGa5I/Tl4HjQ8YRtBSZMfM/3HcfE05x9mi+5zyCIMUUR2WDrkRFb89y1ZMaloEsxNa0ih
	/pxWXjYQuEIgViQhTbmezMjFE/YX2Zu80gAm93Db4B3xl/sZ6vYfWK0OHD6FNw61Qup1axAwijk
	XeMGlnfv931yyYOwyywF52CM+mSMAhPiTc9eE1GKSy7RR7U0SfpHoDRCpt1DP6suis6kD/grrsn
	7lt8OSDTaGML/NIFwWy/fWo03ZusJNrHCJb0CN5e1/iveZyH
X-Received: by 2002:a17:902:ea12:b0:2b9:e831:5e5c with SMTP id
 d9443c01a7336-2bab6022d34mr4765365ad.4.1778170838663; Thu, 07 May 2026
 09:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260507063737.3542950-1-wangyushan12@huawei.com> <20260507063737.3542950-8-wangyushan12@huawei.com>
In-Reply-To: <20260507063737.3542950-8-wangyushan12@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 May 2026 09:20:26 -0700
X-Gm-Features: AVHnY4JCG1br-FjDMCr9m_ivxFWAEfG4gdAFmeZaJwlUB0piMStmorNMuqFMp7g
Message-ID: <CAP-5=fXW7_kRBJ_B-iWnAFnwiN2OKD3WsA45JDD_Fqr4+cwTnQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 7/7] perf-iostat: Enable iostat mode for HiSilicon
 PCIe PMU
To: Yushan Wang <wangyushan12@huawei.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@arm.com, 
	john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jic23@kernel.org, leo.yan@linux.dev, 
	robin.murphy@arm.com, linuxarm@huawei.com, hejunhao3@huawei.com, 
	prime.zeng@hisilicon.com, fanghao11@huawei.com, wangzhou1@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_092040_275582_75A6C3BE 
X-CRM114-Status: GOOD (  31.11  )
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

On Wed, May 6, 2026 at 11:37=E2=80=AFPM Yushan Wang <wangyushan12@huawei.co=
m> wrote:
>
> From: Yicong Yang <yangyicong@hisilicon.com>
>
> Some HiSilicon platforms provide PCIe PMU devices for monitoring the
> throughput and latency of PCIe traffic. With the support of PCIe PMU
> we can enable the perf iostat mode.
>
> The HiSilicon PCIe PMU can support measuring the throughput of certain
> TLP types and of certain root port. Totally 6 metrics are provided in
> the unit of MB:
>
> - Inbound MWR: Memory write TLPs from downstream devices to root port
> - Inbound MRD: Memory read TLPs from downstream devices to root port
> - Inbound CPL: Completion TLPs from downstream devices to root port
> - Outbound MWR: Memory write TLPs from CPU to downstream devices
> - Outbound MRD: Memory read TLPs from CPU to downstream devices
> - Outbound CPL: Completions TLPs from CPU to downstream devices
>
> Since the PMU measures the throughput in DWords, we need to calculate
> the throughput in MB like:
>   Count * 4B / 1024 / 1024
>
> Some of the display of the `perf iostat` will be like:
> [root@localhost tmp]# ./perf iostat list
> hisi_pcie0_core2<0000:40:00.0>
> hisi_pcie2_core2<0000:5f:00.0>
> hisi_pcie0_core1<0000:16:00.0>
> hisi_pcie0_core1<0000:16:04.0>
> [root@localhost tmp]# ./perf iostat --timeout 10000
>
>  Performance counter stats for 'system wide':
>
>     port              Inbound MWR(MB)      Inbound MRD(MB)      Inbound C=
PL(MB)     Outbound MWR(MB)     Outbound MRD(MB)     Outbound CPL(MB)
> 0000:40:00.0                    0                    0                   =
 0                    0                    0                    0
> 0000:5f:00.0                    0                    0                   =
 0                    0                    0                    0
> 0000:16:00.0             16272.99               366.58                   =
 0                15.09                    0             16156.85
> 0000:16:04.0                    0                    0                   =
 0                    0                    0                    0
>
>       10.008227512 seconds time elapsed
>
> [root@localhost tmp]# ./perf iostat 0000:16:00.0 -- fio -name=3Drw -numjo=
bs=3D30 -filename=3D/dev/nvme0n1 -rw=3Drw -iodepth=3D128 -direct=3D1 -sync=
=3D0 -norandommap -group_reporting -runtime=3D10 -time_based -bs=3D64k 2>&1=
 > /dev/null
>
>  Performance counter stats for 'system wide':
>
>     port              Inbound MWR(MB)      Inbound MRD(MB)      Inbound C=
PL(MB)     Outbound MWR(MB)     Outbound MRD(MB)     Outbound CPL(MB)
> 0000:16:00.0                16614                  379                   =
 0                   16                    0                16721
>
>       10.180349717 seconds time elapsed
>
>        0.558810000 seconds user
>        2.495016000 seconds sys
>
> More information of the HiSilicon PCIe PMU can be found at
> Documentation/admin-guide/perf/hisi-pcie-pmu.rst.
>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Shiju Jose  <shiju.jose@huawei.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>  tools/perf/util/Build         |   1 +
>  tools/perf/util/hisi-iostat.c | 478 ++++++++++++++++++++++++++++++++++
>  2 files changed, 479 insertions(+)
>  create mode 100644 tools/perf/util/hisi-iostat.c
>
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index c7e5ada3800d..fee9980cee77 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -128,6 +128,7 @@ perf-util-y +=3D spark.o
>  perf-util-y +=3D topdown.o
>  perf-util-y +=3D iostat.o
>  perf-util-y +=3D x86-iostat.o
> +perf-util-y +=3D hisi-iostat.o
>  perf-util-y +=3D stream.o
>  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
>  perf-util-y +=3D kvm-stat-arch/
> diff --git a/tools/perf/util/hisi-iostat.c b/tools/perf/util/hisi-iostat.=
c
> new file mode 100644
> index 000000000000..30041fd08614
> --- /dev/null
> +++ b/tools/perf/util/hisi-iostat.c
> @@ -0,0 +1,478 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * perf iostat support for HiSilicon PCIe PMU.
> + * Partly derived from tools/perf/arch/x86/util/iostat.c.
> + *
> + * Copyright (c) 2024 HiSilicon Technologies Co., Ltd.
> + * Author: Yicong Yang <yangyicong@hisilicon.com>
> + * Author: Yushan Wang <wangyushan12@huawei.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/limits.h>
> +#include <linux/zalloc.h>
> +
> +#include <api/fs/fs.h>
> +#include <dirent.h>
> +#include <errno.h>
> +#include <stdio.h>
> +
> +#include "util/counts.h"
> +#include "util/debug.h"
> +#include "util/iostat.h"
> +#include "util/pmu.h"
> +
> +/* From include/uapi/linux/pci.h */
> +#define PCI_SLOT(devfn)                (((devfn) >> 3) & 0x1f)
> +#define PCI_DEVFN(slot, func)  ((((slot) & 0x1f) << 3) | ((func) & 0x07)=
)
> +
> +#define PCI_DEVICE_NAME_PATTERN                "%04x:%02hhx:%02hhx.%hhu"
> +#define PCI_ROOT_BUS_DEVICES_PATH      "bus/pci/devices"
> +
> +static const char * const hisi_iostat_metrics[] =3D {
> +       "Inbound MWR(MB)",
> +       "Inbound MRD(MB)",
> +       "Inbound CPL(MB)",
> +       "Outbound MWR(MB)",
> +       "Outbound MRD(MB)",
> +       "Outbound CPL(MB)",
> +};
> +
> +static const char * const hisi_iostat_cmd_template[] =3D {
> +       /* Inbound Memory Write */
> +       "hisi_pcie%hu_core%hu/event=3D0x0104,port=3D0x%hx/",
> +       /* Inbound Memory Read */
> +       "hisi_pcie%hu_core%hu/event=3D0x0804,port=3D0x%hx/",
> +       /* Inbound Memory Completion */
> +       "hisi_pcie%hu_core%hu/event=3D0x2004,port=3D0x%hx/",
> +       /* Outbound Memory Write */
> +       "hisi_pcie%hu_core%hu/event=3D0x0105,port=3D0x%hx/",
> +       /* Outbound Memory Read */
> +       "hisi_pcie%hu_core%hu/event=3D0x0405,port=3D0x%hx/",
> +       /* Outbound Memory Completion */
> +       "hisi_pcie%hu_core%hu/event=3D0x1005,port=3D0x%hx/",
> +};
> +
> +struct hisi_pcie_root_port {
> +       struct list_head list;
> +       /* Is this Root Port selected for monitoring */
> +       bool selected;
> +       /* IDs to locate the PMU */
> +       u16 sicl_id;
> +       u16 core_id;
> +       /* Filter mask for this Root Port */
> +       u16 mask;
> +       /* PCIe Root Port's <domain>:<bus>:<device>.<function> */
> +       u32 domain;
> +       u8 bus;
> +       u8 dev;
> +       u8 fn;
> +};
> +
> +static LIST_HEAD(hisi_pcie_root_ports_list);
> +
> +/*
> + * Select specific Root Port to monitor. Return 0 if successfully find t=
he
> + * Root Port, Otherwise -EINVAL.
> + */
> +static int hisi_pcie_root_ports_select_one(u32 domain, u8 bus, u8 dev, u=
8 fn)
> +{
> +       struct hisi_pcie_root_port *rp;
> +
> +       list_for_each_entry(rp, &hisi_pcie_root_ports_list, list)
> +               if (domain =3D=3D rp->domain && bus =3D=3D rp->bus &&
> +                   dev =3D=3D rp->dev && fn =3D=3D rp->fn) {
> +                       rp->selected =3D true;
> +                       return 0;
> +               }
> +
> +       return -EINVAL;
> +}
> +
> +static void hisi_pcie_root_ports_select_all(void)
> +{
> +       struct hisi_pcie_root_port *rp;
> +
> +       list_for_each_entry(rp, &hisi_pcie_root_ports_list, list)
> +               rp->selected =3D true;
> +}
> +
> +static void hisi_pcie_root_ports_add(u16 sicl_id, u16 core_id, u8 target=
_bus,
> +                                    u16 bdf_min, u16 bdf_max)
> +{
> +       const char *sysfs =3D sysfs__mountpoint();
> +       struct hisi_pcie_root_port *rp;
> +       unsigned long path_len;
> +       struct dirent *dent;
> +       char path[PATH_MAX];
> +       u8 bus, dev, fn;
> +       u32 domain;
> +       DIR *dir;
> +       u16 bdf;
> +       int ret;
> +
> +       path_len =3D snprintf(path, PATH_MAX, "%s/%s", sysfs, PCI_ROOT_BU=
S_DEVICES_PATH);
> +       if (path_len > PATH_MAX)
> +               return;
> +
> +       dir =3D opendir(path);
> +       if (!dir)
> +               return;
> +
> +       /* Scan the PCI root bus to find the match root port on @target_b=
us */
> +       while ((dent =3D readdir(dir))) {
> +               ret =3D sscanf(dent->d_name, PCI_DEVICE_NAME_PATTERN,
> +                            &domain, &bus, &dev, &fn);
> +               if (ret !=3D 4 || bus !=3D target_bus)
> +                       continue;
> +
> +               bdf =3D (bus << 8) | PCI_DEVFN(dev, fn);
> +               if (bdf < bdf_min || bdf > bdf_max)
> +                       continue;
> +
> +               rp =3D zalloc(sizeof(*rp));
> +               if (!rp)
> +                       continue;
> +
> +               rp->selected =3D false;
> +               rp->sicl_id =3D sicl_id;
> +               rp->core_id =3D core_id;
> +               rp->domain =3D domain;
> +               rp->bus =3D bus;
> +               rp->dev =3D dev;
> +               rp->fn =3D fn;
> +
> +               rp->mask =3D BIT((rp->dev - PCI_SLOT(bdf_min)) << 1);
> +
> +               list_add(&rp->list, &hisi_pcie_root_ports_list);
> +
> +               pr_debug3("Found root port %s\n", dent->d_name);
> +       }
> +
> +       closedir(dir);
> +}
> +
> +/* Scan the PMUs and build the mapping of the Root Ports to the PMU */
> +static int hisi_pcie_root_ports_init(void)
> +{
> +       char event_source[PATH_MAX], bus_path[PATH_MAX];
> +       unsigned long long bus, bdf_max, bdf_min;
> +       u16 sicl_id, core_id;
> +       struct dirent *dent;
> +       DIR *dir;
> +
> +       perf_pmu__event_source_devices_scnprintf(event_source, sizeof(eve=
nt_source));
> +       dir =3D opendir(event_source);
> +       if (!dir)
> +               return -ENOENT;
> +
> +       while ((dent =3D readdir(dir))) {
> +               /*
> +                * This HiSilicon PCIe PMU will be named as:
> +                *   hisi_pcie<sicl_id>_core<core_id>
> +                */
> +               if ((sscanf(dent->d_name, "hisi_pcie%hu_core%hu", &sicl_i=
d, &core_id)) !=3D 2)
> +                       continue;
> +
> +               /*
> +                * Driver will export the root port it can monitor throug=
h
> +                * the "bus" sysfs attribute.
> +                */
> +               scnprintf(bus_path, sizeof(bus_path), "%s/hisi_pcie%hu_co=
re%hu/bus",
> +                         event_source, sicl_id, core_id);
> +
> +               /*
> +                * Per PCIe spec the bus should be 8bit, use unsigned lon=
g long
> +                * for the convenience of the library function.
> +                */
> +               if (filename__read_ull(bus_path, &bus))
> +                       continue;
> +
> +               scnprintf(bus_path, sizeof(bus_path), "%s/hisi_pcie%hu_co=
re%hu/bdf_max",
> +                         event_source, sicl_id, core_id);
> +               if (filename__read_xll(bus_path, &bdf_max))
> +                       bdf_max =3D -1;
> +
> +               scnprintf(bus_path, sizeof(bus_path), "%s/hisi_pcie%hu_co=
re%hu/bdf_min",
> +                         event_source, sicl_id, core_id);
> +               if (filename__read_xll(bus_path, &bdf_min))
> +                       bdf_min =3D 0;
> +
> +               pr_debug3("Found pmu %s bus 0x%llx\n", dent->d_name, bus)=
;
> +
> +               hisi_pcie_root_ports_add(sicl_id, core_id, (u8)bus, (u16)=
bdf_min, (u16)bdf_max);
> +       }
> +
> +       closedir(dir);
> +       return !list_empty(&hisi_pcie_root_ports_list) ? 0 : -ENOENT;
> +}
> +
> +static void hisi_pcie_root_ports_free(void)
> +{
> +       struct hisi_pcie_root_port *rp, *tmp;
> +
> +       if (list_empty(&hisi_pcie_root_ports_list))
> +               return;
> +
> +       list_for_each_entry_safe(rp, tmp, &hisi_pcie_root_ports_list, lis=
t) {
> +               list_del(&rp->list);
> +               zfree(&rp);
> +       }
> +}
> +
> +static int hisi_iostat_add_events(struct evlist *evl)
> +{
> +       struct hisi_pcie_root_port *rp;
> +       struct evsel *evsel;
> +       unsigned int i, j;
> +       char *iostat_cmd;
> +       int pos =3D 0;
> +       int ret;
> +
> +       if (list_empty(&hisi_pcie_root_ports_list))
> +               return -ENOENT;
> +
> +       iostat_cmd =3D zalloc(PATH_MAX);
> +       if (!iostat_cmd)
> +               return -ENOMEM;
> +
> +       list_for_each_entry(rp, &hisi_pcie_root_ports_list, list) {
> +               if (!rp->selected)
> +                       continue;
> +
> +               iostat_cmd[pos++] =3D '{';
> +               for (j =3D 0; j < ARRAY_SIZE(hisi_iostat_cmd_template); j=
++) {
> +                       pos +=3D snprintf(iostat_cmd + pos, ARG_MAX - pos=
 - 1,
> +                                       hisi_iostat_cmd_template[j],
> +                                       rp->sicl_id, rp->core_id, rp->mas=
k);
> +
> +                       if (j =3D=3D ARRAY_SIZE(hisi_iostat_cmd_template)=
 - 1)
> +                               iostat_cmd[pos++] =3D '}';
> +                       else
> +                               iostat_cmd[pos++] =3D ',';
> +               }
> +
> +               ret =3D parse_event(evl, iostat_cmd);
> +               if (ret)
> +                       break;
> +
> +               i =3D 0;
> +               evlist__for_each_entry_reverse(evl, evsel) {
> +                       if (i =3D=3D ARRAY_SIZE(hisi_iostat_cmd_template)=
)
> +                               break;
> +
> +                       evsel->priv =3D rp;
> +                       i++;
> +               }
> +
> +               memset(iostat_cmd, 0, PATH_MAX);
> +               pos =3D 0;
> +       }
> +
> +       zfree(&iostat_cmd);
> +       return ret;
> +}
> +
> +static int hisi_iostat_prepare(struct evlist *evlist,
> +                              struct perf_stat_config *config)
> +{
> +       if (evlist->core.nr_entries > 0) {
> +               pr_warning("The -e and -M options are not supported."
> +                          "All chosen events/metrics will be dropped\n")=
;
> +               evlist__delete(evlist);
> +               evlist =3D evlist__new();
> +               if (!evlist)
> +                       return -ENOMEM;
> +       }
> +
> +       config->metric_only =3D true;
> +       config->aggr_mode =3D AGGR_GLOBAL;
> +
> +       return hisi_iostat_add_events(evlist);
> +}
> +
> +static int hisi_pcie_root_ports_list_filter(const char *str)
> +{
> +       char *tok, *tmp, *copy =3D NULL;
> +       u8 bus, dev, fn;
> +       u32 domain;
> +       int ret;
> +
> +       copy =3D strdup(str);
> +       if (!copy)
> +               return -ENOMEM;
> +
> +       for (tok =3D strtok_r(copy, ",", &tmp); tok; tok =3D strtok_r(NUL=
L, ",", &tmp)) {
> +               ret =3D sscanf(tok, PCI_DEVICE_NAME_PATTERN, &domain, &bu=
s, &dev, &fn);
> +               if (ret !=3D 4) {
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
> +
> +               ret =3D hisi_pcie_root_ports_select_one(domain, bus, dev,=
 fn);
> +               if (ret)
> +                       break;
> +       }
> +
> +       zfree(&copy);
> +       return ret;
> +}
> +
> +static int hisi_iostat_parse(const struct option *opt, const char *str, =
int unset __maybe_unused)
> +{
> +       struct perf_stat_config *config =3D (struct perf_stat_config *)op=
t->data;
> +       int ret;
> +
> +       ret =3D hisi_pcie_root_ports_init();
> +       if (ret)
> +               return ret;
> +
> +       config->iostat_run =3D true;
> +
> +       if (!str) {
> +               iostat_mode =3D IOSTAT_RUN;
> +               hisi_pcie_root_ports_select_all();
> +       } else if (!strcmp(str, "list")) {
> +               iostat_mode =3D IOSTAT_LIST;
> +               hisi_pcie_root_ports_select_all();
> +       } else {
> +               iostat_mode =3D IOSTAT_RUN;
> +               ret =3D hisi_pcie_root_ports_list_filter(str);
> +       }
> +
> +       if (ret)
> +               hisi_pcie_root_ports_free();
> +
> +       return ret;
> +}
> +
> +static void hisi_pcie_root_port_show(FILE *output,
> +                                    const struct hisi_pcie_root_port * c=
onst rp)
> +{
> +       if (output && rp)
> +               fprintf(output, "hisi_pcie%hu_core%hu<" PCI_DEVICE_NAME_P=
ATTERN ">\n",
> +                       rp->sicl_id, rp->core_id, rp->domain, rp->bus, rp=
->dev, rp->fn);
> +}
> +
> +static void hisi_iostat_list(struct evlist *evlist __maybe_unused, struc=
t perf_stat_config *config)
> +{
> +       struct hisi_pcie_root_port *rp =3D NULL;
> +       struct evsel *evsel;
> +
> +       evlist__for_each_entry(evlist, evsel) {
> +               if (rp !=3D evsel->priv) {
> +                       hisi_pcie_root_port_show(config->output, evsel->p=
riv);
> +                       rp =3D evsel->priv;
> +               }
> +       }
> +}
> +
> +static void hisi_iostat_release(struct evlist *evlist)
> +{
> +       struct evsel *evsel;
> +
> +       evlist__for_each_entry(evlist, evsel)
> +               evsel->priv =3D NULL;
> +
> +       hisi_pcie_root_ports_free();
> +}
> +
> +static void hisi_iostat_print_header_prefix(struct perf_stat_config *con=
fig)
> +{
> +       if (config->csv_output)
> +               fputs("port,", config->output);
> +       else if (config->interval)
> +               fprintf(config->output, "#          time    port         =
");
> +       else
> +               fprintf(config->output, "   port         ");
> +}
> +
> +static void hisi_iostat_print_metric(struct perf_stat_config *config, st=
ruct evsel *evsel,
> +                                    struct perf_stat_output_ctx *out)
> +{
> +       const char *iostat_metric =3D hisi_iostat_metrics[evsel->core.idx=
 % ARRAY_SIZE(hisi_iostat_metrics)];
> +       struct perf_counts_values *count;
> +       double iostat_value;
> +
> +       /* We're using AGGR_GLOBAL so there's only one aggr counts aggr[0=
]. */
> +       count =3D &evsel->stats->aggr[0].counts;
> +
> +       /* The counts has been scaled, we can use it directly. */
> +       iostat_value =3D (double)count->val;
> +
> +       /*
> +        * Display two digits after decimal point for better accuracy if =
the
> +        * value is non-zero.
> +        */
> +       out->print_metric(config, out->ctx, METRIC_THRESHOLD_UNKNOWN,
> +                         iostat_value > 0 ? "%8.2f" : "%8.0f",
> +                         iostat_metric, iostat_value / (256 * 1024));
> +}
> +
> +static void hisi_iostat_prefix(struct evlist *evlist, struct perf_stat_c=
onfig *config,
> +                              char *prefix, struct timespec *ts)
> +{
> +       struct hisi_pcie_root_port *rp =3D evlist->selected->priv;
> +
> +       if (!rp)
> +               return;
> +
> +       if (ts)
> +               sprintf(prefix, "%6lu.%09lu%s" PCI_DEVICE_NAME_PATTERN "%=
s",
> +                       ts->tv_sec, ts->tv_nsec, config->csv_sep,
> +                       rp->domain, rp->bus, rp->dev, rp->fn,
> +                       config->csv_sep);
> +       else
> +               sprintf(prefix, PCI_DEVICE_NAME_PATTERN "%s",
> +                       rp->domain, rp->bus, rp->dev, rp->fn,
> +                       config->csv_sep);
> +}
> +
> +static void hisi_iostat_print_counters(struct evlist *evlist, struct per=
f_stat_config *config,
> +                                      struct timespec *ts, char *prefix,
> +                                      iostat_print_counter_t print_cnt_c=
b, void *arg)
> +{
> +       struct evsel *counter =3D evlist__first(evlist);
> +       void *perf_device;
> +
> +       evlist__set_selected(evlist, counter);
> +       hisi_iostat_prefix(evlist, config, prefix, ts);
> +       fprintf(config->output, "%s", prefix);
> +       evlist__for_each_entry(evlist, counter) {
> +               perf_device =3D evlist->selected->priv;
> +               if (perf_device && perf_device !=3D counter->priv) {
> +                       evlist__set_selected(evlist, counter);
> +                       hisi_iostat_prefix(evlist, config, prefix, ts);
> +                       fprintf(config->output, "\n%s", prefix);
> +               }
> +               print_cnt_cb(config, counter, arg);
> +       }
> +       fputc('\n', config->output);
> +}
> +
> +static bool hisi_iostat_match(struct iostat_pmu *iostat_pmu)
> +{
> +       return perf_pmus__scan_matching_wildcard(NULL, iostat_pmu->pmu_na=
me_wildcard);
> +}
> +
> +static struct iostat_pmu hisi_iostat_pmu_list[] =3D {
> +       {
> +               .pmu_name_wildcard =3D "hisi_pcie*",
> +               .match =3D hisi_iostat_match,
> +               .prepare =3D hisi_iostat_prepare,
> +               .parse =3D hisi_iostat_parse,
> +               .list =3D hisi_iostat_list,
> +               .print_header_prefix =3D hisi_iostat_print_header_prefix,
> +               .print_metric =3D hisi_iostat_print_metric,
> +               .print_counters =3D hisi_iostat_print_counters,
> +               .release =3D hisi_iostat_release,
> +       },
> +};
> +
> +static void __attribute__((constructor)) hisi_iostat_pmu_init(void)

This looks good. My concerns are over:
 - the use of the constructor attribute,
 - the naming of iostat_pmu,
 - we probably don't want a per PMU C file in tools/perf/util as there
could be many,
 - we might be able to move things into json and better share code, etc.

Thanks,
Ian

> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(hisi_iostat_pmu_list); i++)
> +               register_iostat_pmu(&hisi_iostat_pmu_list[i]);
> +}
> --
> 2.33.0
>

