Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D217CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 13:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiOo/wZD2K62xmIXsdM9wvMcd8ElF/qU/XGwGHVWNnM=; b=4ricGlTuAbwOzvmM38dUR+BZS2
	2udRtz484W0PHAPq2X4Q4a4LFvgluRARaVa/eZ0fBJCbQYafVyUcymgQXjPkr9M+SilV6UA0VL/ND
	2jzm4qIluEs9tkuUeZ+lKX8XdUuen6AkzpaKq3wrp/X9EJD/t5vgUngq4lpANLIsYtKnv/HVod4Sv
	fbWaAFuH+N2i253Jv9vNTZpfZHoJY2b6DeT/FjXf5MuF6O8Y87vqBL1xUjqC6hhuEe7OlqpYvBzzL
	/LSo2+Smmq9ahZxtVk+2HH/CktBfigeBiNBVt879mYw6GBWl4Q/U0BtKmRjtPIf+cQR0BpxeN1ynU
	AyVIQJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGG7Q-0000000AZz8-3MH4;
	Mon, 12 Oct 2026 13:31:08 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGG7L-0000000AZwZ-3EaJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 13:31:07 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6b1afdf5196so600451eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 06:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791811863; cv=none;
        d=google.com; s=arc-20260327;
        b=FaTrlIpHP8OP2iQh6uQhtEKefPI3GkfmyqmvNJwXBlODiklKmpITrRKzp8xvgFFs+r
         yIUNV3Ier4Bt8kBoxytAYoqkCr5m0qY7k4EQbFPUPlafk4x3SX77NymNv8ov4/HxV5nA
         RHNTJAx+9FupuOnhD0c5D2K1Tm10f8/DMwGF5Zsamduz5FyGUnnx42dB2bTopg18O6za
         2tVzT+YRVuIRRPn9K42lDY4qDRV7Yatur8W9logxEgsY6SRgZGC5ySzNCRjUIJg3/5aR
         n+j3sXl1LYq5TdcJoWpK9PWH0OlW8NaI0qZ9PeXtI04kWgezSZULh6/0/B0zKpR5V+nz
         03yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KiOo/wZD2K62xmIXsdM9wvMcd8ElF/qU/XGwGHVWNnM=;
        fh=Og4B71tD4sfSQWa33rgIQMOnP8Uzlco9QJd4edMU/Xs=;
        b=AgeJ7DXX9MDah+kzvZuNhFq7/krYgczR0DnWlmFQaJzXctiy6YNQNOmtOjM+IWIIk8
         px06xlxzka5q8NxG0wVOO3plQwHzTN7ib50zY21vSKsJLt7QnzpFEm08VwXHWHmTSgEF
         OXAkVAnvtIEFaJh66IPRcn80tyrzkrbmv/K8O9sIIWg2ckuXVl25KzZ8to7n2H/GLTxD
         wvrqqJgNqffVAci68fGXQm9pOHcDXZuNLSn5KDh4e50khXRfVuzGdUF/NLqwD9sA4kd0
         OCCSuRuwxFmWeNUkha1BnTtudApNzfH2YrdXdVhDew39AzSRcb+k/8F6hutN30Kfrth6
         5Ujg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791811863; x=1792416663; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KiOo/wZD2K62xmIXsdM9wvMcd8ElF/qU/XGwGHVWNnM=;
        b=NS6w3IRsCY/G1aU2LmtnZoHTKjl4iCTIh3lZAbpbzFAfHpfY+LKtywertArKgXWfBA
         8sAt+8+YaInCgkEhI84F9MOVVZ+j9Ve8s4mBM9tdMSa7kI+/F8APJXILujFE+OQxCL9A
         IbDm6mTmfJ9RGtWjpQLg2M9a5+B0rHF9fASALRIKCP1aGGVXkmNOVg7HV/6OTHf9nh+0
         QUp26dhi+BarqMTbSWcxdsbutP1YqO4uySnSsKuNyzPMdSZKUOZhCcUIQ703E4DNmuNz
         6uJTgSiBdyOFW7676W6S4BGOpiJwQdgQXXL5N+efz9pJjFggh/ZIU4QNP6ramqgAkXTy
         FC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811863; x=1792416663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KiOo/wZD2K62xmIXsdM9wvMcd8ElF/qU/XGwGHVWNnM=;
        b=D34/Fma9G7akXXgDGtKXgkatWhfWlzvCnLCG75DyjFxPegxC9EB5To7yBQ4c0pLZjl
         YyJeP3Vm15XHHkfSxRVMSjkkr/zpM9ViRY+hAqs38Nuzn+ZizprPLL4KjuUynwvSQLiH
         +62r504i1P3SggW7zwOAaltoulTRibBG3dmcX80J7qCKAKCylzlgsAMG6AYHD8IZYcn2
         AEiCwu37mmXHG0uEHXpoNQmyRDoauKrVsQ81mFH8hvwEUb0MfchdZ0CfhHrnoqW0UXDK
         ynJqN4fhH9Ld/2uK7F69MAaf3Y4t6rmdlSOAqrUw/nD+Wb9EPMOZi7M4Q1ivdcRFX5Ne
         8r9w==
X-Forwarded-Encrypted: i=1; AKwUvBzYHEiwvni5RtzmVUhs3VUZKoK0p7oBD089e0Zv3BzTylw/bmmpj3rv1aoiwcBKYySex4gKtPZGm0N6wa2miDT0@lists.infradead.org
X-Gm-Message-State: AFq9FYLgTNU2fw4Co/6LJJL7rmWDqpcw7xBs33m/Cj4yM0YqEeB7CF5y
	mDvctLMhNSQ5w/jydpZDXUnuUnG/LQ1gb97DHnu4zNDP+qLPprqQX1jS97pm1sDbcBXHfmbI+a1
	LEwbhdhS1AQ2N7YTiNfTFVtcuZEtIqOTMTklsJ1SN2A==
X-Gm-Gg: AYBFou3DeUnUxBcjDdScv9j3ezBZ7A45dus+emXyMSZGLKBiTwHHliAsYKxs+kysqPn
	n6ANea+5fR5GRXxvD4b6uqoyTWOQ+4Yf7r7a4ZbHN2s7yHTJWRVQm30lLC1yRCUDZlWbdPXHxtS
	c1RAFhg2WGQfXXq2CPKLvp1FZEMUl67yiDmJ/ILbaC/X62JnEN9BHdEw5lNCGzhuTHhoc2oj0YI
	OfgSuOmCDmVLUxlwaktZP/FCjZo+a9V19pQd6D5u2l5+fsXo1iQe4VC/MxZAgtbvZ043HY/6hlD
	6IL2p1czMlIxr0XEz4c9xDV3uq5Bd/WrwpSU6x5qlRcRl5OFZ230diURv7vX5w==
X-Received: by 2002:a05:6820:1c8c:b0:6f8:3d45:b465 with SMTP id
 006d021491bc7-6f83d460e36mr597816eaf.11.1791811862469; Mon, 12 Oct 2026
 06:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260831172245.42253-1-fenghuay@nvidia.com>
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 12 Oct 2026 21:30:51 +0800
X-Gm-Features: AclHuK_vMcorLODW8hzTAKchqs7y0a8-suXQ6J3y_WfRav5d6A8ZoaK1GGtrHOY
Message-ID: <CAEEQ3wmOqR5M0LzdKqOOH3iYmL04e4tDJ0wS0UqH7FER_2+JHw@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 00/19] arm,fs/resctrl: ARM MPAM MB_NODE support
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, Tony Luck <tony.luck@intel.com>, 
	Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, 
	Dave Martin <Dave.Martin@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>, 
	Chen Yu <yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>, 
	Drew Fustini <fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>, 
	Richard Cheng <icheng@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_063103_840072_F30EBEE1 
X-CRM114-Status: GOOD (  35.94  )
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

Hi Fenghua,


On Tue, Sep 1, 2026 at 4:03=E2=80=AFAM Fenghua Yu <fenghuay@nvidia.com> wro=
te:
>
> This series enables MBA bandwidth control emulation on ARM MPAM when the
> default MB control is disabled, using a node-scoped MB_NODE control as
> the native backend.  It extends memory-bandwidth monitoring and
> control to memory-level MSCs or CPU-less NUMA nodes, and adds
> documentation and tests.
>
> Background
>
> On x86, MBA bandwidth control is typically associated with the L3 cache:
> schemata lines use L3 cache ids and monitor domains appear as mon_L3_XX.
> On some ARM MPAM systems the MBA control is backed by a memory-level MSC
> rather than the L3 cache MSC.  A memory-level MSC is represented as a
> NUMA node, and that node commonly has no CPUs of its own (a memory-only
> node that still participates in bandwidth control).  For such a resource
> the control scope is NODE, schemata identifiers are NUMA node ids,
> monitor domains are named mon_NODE_XX, and a node-scoped MB_NODE control
> may be the only control with usable bandwidth hardware.
>
> Because the memory-level MSC lives on a CPU-less NUMA node, the driver
> must handle nodes with no local CPUs.  mpam_ris_get_affinity() derives
> affinity from the component's NUMA node id, so a memory-only node would
> otherwise end up with an empty CPU mask and never be registered.  When
> the derived mask is empty, the driver falls back to cpu_possible_mask
> (masked by MSC accessibility) so the node still gets a resctrl domain.
> The borrowed affinity is kept out of class->affinity: those CPUs already
> contribute through CPU-ful nodes in the class, and subtracting the
> borrowed mask on teardown would remove CPUs that other live nodes still
> depend on.  Domain setup iterates all MSC components per CPU (keyed by
> component), so each component =E2=80=94 including these CPU-less memory n=
odes =E2=80=94
> gets its own control and monitor domain.
>
> Examples of NODE and emulation interfaces on MPAM.
>
> ** On platform with CPU-less nodes, by default, control_mode is legacy.
> 1. By default, MB is emulated by MB_NODE in schemata.
> info/
> =E2=94=9C=E2=94=80=E2=94=80 MB
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bandwidth_gran
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 control_mode        # [legacy] na=
tive
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 schemata
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 MB
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 MB_NODE     # emulated by=
 "MB_NODE"
>
> schemata: Only show MB, which is emulated by MB_NODE. domain id is numa
> id
> MB:0=3D100;1=3D100;2=3D100;10=3D100;18=3D100;26=3D100;34=3D100;35=3D100
> L3:1=3Dffff;2=3Dffff
>
> 2. root can switch to native by writing "native" to "control_mode":
> info/
> =E2=94=9C=E2=94=80=E2=94=80 MB
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bandwidth_gran
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 control_mode        # legacy [nat=
ive]
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 schemata
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 MB
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 MB_NODE     # no emulatio=
n, native mode
>
> schemata: Only show MB_NODE. No "MB:" is emulated.
> MB_NODE:0=3D100;1=3D100;2=3D100;10=3D100;18=3D100;26=3D100;34=3D100;35=3D=
100
>      L3:1=3Dffff;2=3Dffff
>
> 3. llc_occupancy in mon_L3_x where x is cache id
>    mbm_total_bytes in mon_NODE_y where y is numa id
> mon_data/
> mon_L3_01  mon_NODE_00  mon_NODE_02  mon_NODE_18  mon_NODE_34
> mon_L3_02  mon_NODE_01  mon_NODE_10  mon_NODE_26  mon_NODE_35
>
> mon_data/mon_L3_01/llc_occupancy
> mon_data/mon_NODE_01/mbm_total_bytes
>
> ** On legacy machine which only has L3 MSCs. No NODE scope in schemata
>    or mon_data
> schemata: MB's domain id is cache id, not numa node id
> MB:1=3D100;2=3D100
> L3:1=3Dffff;2=3Dffff
>
> mon_data/
> mon_L3_01 mon_L3_02
>
> mon_data/mon_L3_01/llc_occupancy
> mon_data/mon_L3_01/mbm_total_bytes
> mon_data/mon_L3_02/llc_occupancy
> mon_data/mon_L3_02/mbm_total_bytes
>
> The patches can be compiled but not tested on x86 yet.
>
> The 19 patches are grouped as follows:
>
> 1. Memory bandwidth monitoring and control on memory-level MSCs
>    (patches 1=E2=80=9310, 12)
>
>    Generalise the monitor infrastructure beyond hard-wired L3 paths:
>    de-hardcode L3 monitor plumbing, expose MBA MBM counter assignment,
>    name node-scoped monitor domains mon_NODE_<id>, add a node-scope MBM
>    total event, and make MBM handling resource-aware.
>
>    On the ARM MPAM side, add memory-level MSC and ABMC support, refine
>    L3 topology and class selection, refactor domain setup to iterate all
>    MSC components per CPU (keyed by component), and handle CPU-less NUMA
>    memory nodes that have no local CPUs but still participate in MPAM
>    bandwidth control. Memory hotplug locking and notifier are added.
>
> 4. MB_NODE emulates MB (patch 11) [1]
>
>    Wire MB_NODE as the native backend that emulates a MB control
>    in the ARM MPAM driver.
>
>    If emulation is unnecessary, this patch can be removed.
>
> 5. Documentation (patches 14=E2=80=9317)
>
>    Document memory-level MB control and NUMA nodes in the arm64 MPAM
>    guide (patch 19), NODE-scoped MBA domains and mon_NODE_* monitoring
>    in the resctrl documentation (patch 20), and an MB_NODE emulation
>    example on ARM MPAM (patch 21).
>
> 6. Tests (patches 18=E2=80=9319)
>
>    Add a KUnit test for CPU-less NUMA node affinity handling and a
>    kselftest that exercises MB emulation mode switching,
>    resource_schemata hierarchy, and schemata mirroring on ARM MPAM.
>
> Apply the patches on top of [2].
>
> Testing
>
>   # KUnit (CPU-less affinity)
>   sudo cat /sys/kernel/debug/kunit/mpam_devices_test_suite/results
>
>
>   # kselftest (MB emulation; requires ARM MPAM with disabled MB control)
>   cd tools/testing/selftests/resctrl
>   sudo ./resctrl_tests -t mb_emulation
>
> This series is in https://github.com/fyu1/linux/  cpu_less.rfc.v2/
> which is on top of [2].
>
> Change Log:
> RFC v2:
> - Remove fix patches 1-2 which are implemented in [2]
> - Remove the emulation patches 3-8 which are implemented in [2]
> - Update emulated_by to *emulated_by in patch 11. Ben seems
>   doesn't like to emulate MB by MB_NODE. If that's case, I can
>   remove this patch. But for now, I keep this patch for further
>   discussion.
> - Add patch 13 to implemente legacy and native modes to emulate
>   "mbm_L3_assignments" by "mbm_NODE_assignments" in patch 13.
> - Add patch 9 for memory hotplug locking (Ben)
> - Add patch 12 for memory hotplug notifier (Ben)
>
> RFC v1:
> https://lore.kernel.org/lkml/cover.1784217438.git.fenghuay@nvidia.com/
>
> [1] [RFC v2] mpam,x86,fs/resctrl: Generic schema description Proof of Con=
cept https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@inte=
l.com/
> [2] Reinette's resctrl control branch RFC v2: git://git.kernel.org/pub/sc=
m/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2.4
>
> Fenghua Yu (17):
>   resctrl: De-hardcode L3 monitor infrastructure
>   resctrl: Expose MBA MBM counter assignment sysfs
>   resctrl: name node-scoped monitor domains mon_NODE_<id>
>   resctrl: Add node-scope MBM total event
>   resctrl: Make MBM paths resource-aware
>   arm_mpam: Support memory-level MSCs and ABMC per class
>   arm_mpam: Refine L3 topology and class selection
>   arm_mpam: Include all MSC components during domain setup
>   arm_mpam: Handle CPU-less numa nodes
>   arm_mpam: Emulate MB control with node-scoped MB_NODE control
>   resctrl: Add mbm_assign_scope_mode for native assignment file names
>   Documentation: resctrl: document mbm_assign_scope_mode
>   Documentation: arm64: mpam: document memory-level MB control and NUMA
>     nodes
>   Documentation: resctrl: document NODE-scoped MBA domains and mon_NODE
>     monitoring
>   Documentation: resctrl: document MB_NODE emulation example on ARM MPAM
>   arm_mpam: Add KUnit test for CPU-less NUMA node affinity
>   selftests/resctrl: Add MB emulation test for ARM MPAM
>
> James Morse (2):
>   fs/resctrl: Take memory hotplug lock whenever taking CPU hotplug lock
>   arm_mpam: resctrl: Add NUMA node notifier for domain online/offline
>
>  Documentation/arch/arm64/mpam.rst             | 105 ++-
>  Documentation/filesystems/resctrl.rst         | 135 ++-
>  drivers/resctrl/mpam_devices.c                |  59 +-
>  drivers/resctrl/mpam_internal.h               |   8 +
>  drivers/resctrl/mpam_resctrl.c                | 879 +++++++++++++++---
>  drivers/resctrl/test_mpam_devices.c           |  67 ++
>  fs/resctrl/ctrlmondata.c                      |   6 +-
>  fs/resctrl/internal.h                         |  18 +-
>  fs/resctrl/monitor.c                          | 355 +++++--
>  fs/resctrl/pseudo_lock.c                      |   3 +
>  fs/resctrl/rdtgroup.c                         | 157 +++-
>  include/linux/memory.h                        |   1 +
>  include/linux/resctrl.h                       |  36 +-
>  include/linux/resctrl_types.h                 |  15 +-
>  .../selftests/resctrl/mb_emulation_test.c     | 314 +++++++
>  tools/testing/selftests/resctrl/resctrl.h     |   1 +
>  .../testing/selftests/resctrl/resctrl_tests.c |   1 +
>  17 files changed, 1827 insertions(+), 333 deletions(-)
>  create mode 100644 tools/testing/selftests/resctrl/mb_emulation_test.c
>
> --
> 2.53.0
>
>

1. The logical control-domain model looks useful. One domain can
represent a logical resource backed by multiple physical controllers.
RISC-V CBQRI has a similar model, grouping cache controllers by cache
ID and bandwidth controllers by NUMA node ID. It would be helpful to
keep this infrastructure generic.

2. Since MB and MB_NODE share the same NODE scope and ultimately
program the same memory-class MSC, would it be possible to use the
existing MB control with a discoverable NODE scope? If a separate
MB_NODE control and emulation mode are still needed, could you clarify
the userspace requirement for them?

Thanks,
Yunhui

