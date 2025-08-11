Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA327CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtvUcm8eKqLg5xx/IzAnE0CR0VtQIYJM5TEZnjUYa44=; b=5CTXr1AICsuCw3UWBa23sKmsJE
	GMwCU1FV1uHovs7f6/wLSaHc2A5gxQ+BZfarynx3TNPSoNXg4N32RvVI64I2f5/hAiN05i40/FwYb
	1y1O/lwlaFBqA7EBBKW+cI0t9NFR8OwX4F8g2F0ujheSi2bxcbGfLdMm1e9OAelUXkJ+cSv1nM9TF
	uJ+AX/rdrZSxiwftzkcK3iDbq77/DyZ1MFToKQcJGoGHGh5sIi6O8g4t2CxUFm3eCcI2TFvzV9jmu
	JniJllUS/EMu9pGKdWHfF4EdVVz0YY48pseeAca4rAwCrU6+AlLYc8lGwQXiNghf4amgVpV5uW+Ho
	+BHOmJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOHN-00000006usY-2hVX;
	Mon, 11 Aug 2025 08:53:17 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNmE-00000006pcq-3gNO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 08:21:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-242d3ba2b44so10409895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754900466; x=1755505266; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KtvUcm8eKqLg5xx/IzAnE0CR0VtQIYJM5TEZnjUYa44=;
        b=B9miTGtCrc0RbpawZJDi5QCc40NjFvDcTBKSbd6AtkjDHyCUXePVKQp7OlmKnP69Um
         wmD1lqN8TBXfVl13zBXtpLYaP3JlT33mRqYPmwMyBe6tk7jKVTiCLOhoODh9IApvkXdh
         puFutdAHgpB7w+JJToVRvNaDyDr/8/Rsr5icfZYgBcxqapCRq/MxFttCzaAvl4v7hFE7
         1W2u7K7aEekXT7cPqZTgIxa266Toyyi62M0DSLrbGzKwgBRE0wcDyOoxwyDF1K3ZaUDD
         BE9VMlFRVujVs1QXEUxNDhy+DNDITLjhDH3KI29gkM3QkGtI2uwORS6ix2ziUI8NgvRx
         pdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900466; x=1755505266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtvUcm8eKqLg5xx/IzAnE0CR0VtQIYJM5TEZnjUYa44=;
        b=JPzi1pdwwDdpmDtJrN9fKmZt5mU1Ew19VZEb2i0pMa9RRiVQlSCckBVelj5yeNeqp5
         FbOQqCkQg8XjSlpNX8f4BjL2t34m3irYq2eRcxlpvkgdDjOVtTD0E88qfrpnMpIDTYbz
         Cx8QvbcpDPwena9t6TS4TDZf9PFKYGU2zWYy7aEpZN/BoVoyZIlO6ovhTBvkocqZ5CQ2
         lGxwh/vKTleK27eXQxgFFqgzzal3cAP0+lblxG3e2ybZFvzLBmU/NSsLryC0iVFvfayE
         4PQkaZaSNOudPi9RHaremdpley4s2eQIqZ0fwMa/QWSSjBPFtlPUPo8LKmi8t8nlSK0q
         wJbA==
X-Gm-Message-State: AOJu0Yx8P2uOO5E6GidbDWmlwgfz/rSaLRp+Ks/4+N+rwQRV9/QB/4zB
	Z2sJynPROp9dsMJXCkOwCcooj3D1cfT+TC5V/tyh1Sz6gQQgEMqV5rO5MgpvCy7D10nP8kBH68C
	+F+1PhbGUgtbctkaGYYTDgU4c2Pb4b45d0KMkDigjCQ==
X-Gm-Gg: ASbGnctZnBb+N73nQml9c3lKqPmL3MKmY381RK8c+LSFGh4pIZzuZx629t9epoT70GB
	aNGX15zQql+CrHC2wFNDFqBhg/JvVWsI6P8pzpK4P0BGs1RwNDc84uEzHZlTpgEJjNxj1M0x0GS
	dDav9QkqIkIQDg319cxm6jA0lpxuhICe16fLdvERT3PK2kKgSMjOYuQXNgftfc2XrM2hi0YQ9eK
	PoVMYBbiytIVRm+vkUD8ln5VdyYAlHPprIxNJEO
X-Google-Smtp-Source: AGHT+IG/wrH/Z4PP0pZIy9wjFLr0/V/zaFYS1NMbhK2es383D8DYO570WjTh+eTKECcdm1aWBgEKS2c59dA6CxPHBHA=
X-Received: by 2002:a17:902:d54f:b0:240:7247:f738 with SMTP id
 d9443c01a7336-242c1ecb81cmr194687925ad.1.1754900465618; Mon, 11 Aug 2025
 01:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYumD2MGjECCv0wx2V_96_FKNtFQpT63qVNrrCmomoPYVQ@mail.gmail.com>
 <aJXebTmgnrWw7Ks4@willie-the-truck>
In-Reply-To: <aJXebTmgnrWw7Ks4@willie-the-truck>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 11 Aug 2025 13:50:53 +0530
X-Gm-Features: Ac12FXw5lvgF03ojOkscaSZZ8MEt6jPVgnO3qRgJ61gr4N1xTZBfV52fTLslDqU
Message-ID: <CA+G9fYseoJU0TNmvSEU4sQTye575Jnq5XiwZZrK9K5z_snVM1A@mail.gmail.com>
Subject: Re: next-20250729: PREEMPT_RT: rock Pi 4b Internal error Oops
 kmem_cache_alloc_bulk_noprof - kernel locking rtmutex.c at __rt_mutex_slowlock_locked
To: Will Deacon <will@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_012106_922542_9D741AF8 
X-CRM114-Status: GOOD (  16.20  )
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

Hi Will,

On Fri, 8 Aug 2025 at 16:54, Will Deacon <will@kernel.org> wrote:
>
> Hi Naresh,
>
> On Sat, Aug 02, 2025 at 03:45:51PM +0530, Naresh Kamboju wrote:
> > ## Test log
> > [  527.570253] Unable to handle kernel paging request at virtual
> > address 003f0020f94020a1
> > [  527.570274] Mem abort info:
> > [  527.570277]   ESR = 0x0000000096000004
> > [  527.570282]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [  527.570288]   SET = 0, FnV = 0
> > [  527.570292]   EA = 0, S1PTW = 0
> > [  527.570297]   FSC = 0x04: level 0 translation fault
> > [  527.570302] Data abort info:
> > [  527.570305]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> > [  527.570310]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > [  527.570316]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [  527.570322] [003f0020f94020a1] address between user and kernel address ranges
> > [  527.570330] Internal error: Oops: 0000000096000004 [#1]  SMP
> > [  527.570336] Modules linked in: brcmfmac rockchip_dfi brcmutil
> > cfg80211 snd_soc_hdmi_codec dw_hdmi_i2s_audio dw_hdmi_cec
> > snd_soc_simple_card snd_soc_audio_graph_card hci_uart
> > snd_soc_rockchip_i2s snd_soc_es8316 snd_soc_spdif_tx
> > snd_soc_simple_card_utils btqca rtc_rk808 rockchipdrm btbcm
> > snd_soc_core dw_hdmi_qp bluetooth snd_compress reset_gpio analogix_dp
> > snd_pcm_dmaengine panfrost hantro_vpu dw_mipi_dsi rfkill rockchip_rga
> > drm_shmem_helper drm_dp_aux_bus snd_pcm gpu_sched dw_hdmi pwrseq_core
> > videobuf2_dma_sg v4l2_vp9 snd_timer drm_display_helper v4l2_h264
> > v4l2_jpeg phy_rockchip_pcie snd v4l2_mem2mem cec videobuf2_dma_contig
> > soundcore videobuf2_memops drm_client_lib videobuf2_v4l2
> > drm_dma_helper videobuf2_common rockchip_saradc drm_kms_helper
> > industrialio_triggered_buffer kfifo_buf rockchip_thermal
> > pcie_rockchip_host coresight_cpu_debug fuse drm backlight
> > [  527.570493] CPU: 3 UID: 0 PID: 34254 Comm: mkdir Not tainted
> > 6.16.0-next-20250801 #1 PREEMPT_RT
> > [  527.570502] Hardware name: Radxa ROCK Pi 4B (DT)
> > [  527.570506] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [  527.570512] pc : kmem_cache_alloc_bulk_noprof (mm/slub.c:5343
> > (discriminator 1) mm/slub.c:5403 (discriminator 1))
> > [  527.570527] lr : kmem_cache_alloc_bulk_noprof
> > (include/linux/atomic/atomic-arch-fallback.h:457
> > include/linux/atomic/atomic-instrumented.h:33
> > include/linux/kfence.h:127 mm/slub.c:5307 mm/slub.c:5403)
> > [  527.570533] sp : ffff80008e24b8f0
> > [  527.570536] x29: ffff80008e24b930 x28: 00ff000000584610 x27: ffff800082b30538
> > [  527.570545] x26: ffff8000816b64dc x25: 0000000000000cc0 x24: 0000000000000000
> > [  527.570554] x23: 0000000000000004 x22: ffff0000f7579d20 x21: 0000000000000001
> > [  527.570563] x20: 0000000000000001 x19: ffff000000405b00 x18: ffff80008e24bcd0
> > [  527.570572] x17: 0000000000000000 x16: ffff800081e18420 x15: 0000ffffa2670fff
> > [  527.570582] x14: 0000000000000000 x13: 1fffe000017942e1 x12: 0000ffffa2470fff
> > [  527.570591] x11: ffff00000bca1708 x10: 0000000000000001 x9 : ffff8000816e41a4
> > [  527.570600] x8 : ffff80008e24b850 x7 : fefefefefefefefe x6 : ffff800082b30000
> > [  527.570608] x5 : d63f0020f9402021 x4 : ffff0000f7579d58 x3 : 0000000000000000
> > [  527.570617] x2 : 0000000000000000 x1 : 0000000000000100 x0 : 0000000000000080
> > [  527.570627] Call trace:
> > [  527.570631] kmem_cache_alloc_bulk_noprof (mm/slub.c:5343
> > (discriminator 1) mm/slub.c:5403 (discriminator 1)) (P)
> > [  527.570639] mas_alloc_nodes (lib/maple_tree.c:1278)
> > [  527.570651] mas_node_count_gfp (lib/maple_tree.c:1339)
> > [  527.570661] mas_preallocate (lib/maple_tree.c:5538 (discriminator 1))
> > [  527.570667] __split_vma (mm/vma.c:528 (discriminator 1))
> > [  527.570677] vma_modify (mm/vma.c:1633)
> > [  527.570685] vma_modify_flags (mm/vma.c:1650)
> > [  527.570694] mprotect_fixup (mm/mprotect.c:819)
> > [  527.570704] do_mprotect_pkey (mm/mprotect.c:993)
> > [  527.570713] __arm64_sys_mprotect (mm/mprotect.c:1011)
> > [  527.570722] invoke_syscall (arch/arm64/include/asm/current.h:19
> > arch/arm64/kernel/syscall.c:54)
> > [  527.570731] el0_svc_common.constprop.0
> > (include/linux/thread_info.h:135 (discriminator 2)
> > arch/arm64/kernel/syscall.c:140 (discriminator 2))
> > [  527.570737] do_el0_svc (arch/arm64/kernel/syscall.c:152)
> > [  527.570744] el0_svc (arch/arm64/include/asm/irqflags.h:82
> > (discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
> > 1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
> > arch/arm64/kernel/entry-common.c:169 (discriminator 1)
> > arch/arm64/kernel/entry-common.c:182 (discriminator 1)
> > arch/arm64/kernel/entry-common.c:880 (discriminator 1))
> > [  527.570752] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:899)
> > [  527.570760] el0t_64_sync (arch/arm64/kernel/entry.S:596)
> > [ 527.570772] Code: 1400000c f94002c5 b4000aa5 b9402a60 (f86068a0)
> > All code
> > ========
> >    0: 1400000c b 0x30
> >    4: f94002c5 ldr x5, [x22]
> >    8: b4000aa5 cbz x5, 0x15c
> >    c: b9402a60 ldr w0, [x19, #40]
> >   10:* f86068a0 ldr x0, [x5, x0] <-- trapping instruction
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0: f86068a0 ldr x0, [x5, x0]
> > [  527.570778] ---[ end trace 0000000000000000 ]---
> > [  527.570800] ------------[ cut here ]------------
>
> If you're able to repro this, please could you see if the patch below
> helps at all?

I applied the patch as suggested, tested it, and confirmed that the reported
regressions are now resolved.

I applied the patch as suggested, tested it, and confirmed the reported
regressions are resolved. Our LKFT CI will continue monitoring and report
back if the issue reoccurs.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

>
> https://lore.kernel.org/r/20250806145611.3962-1-dev.jain@arm.com
>
> Cheers,
>
> Will

- Naresh

