Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D257FCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t1dxoly2zHyheShYP01e8EomkwsEO3X8aFPvkI2bEmw=; b=JzeMRZkw+VCGFqqD7Uqg6Y/Rmf
	HMm10g3cPPqAx1Qa4mM0QOnL506Pf15mGRAvNuG/75LIRkhtDDO+lkBJVCPgXtU4wR+NOxc/onGra
	HzFpPktKpqcZ6KhzPJC+oiUuR8947VknxUoEIQaWpoLbEEIIe4v+xLP1cgtuWfNGlHz/Oe0vNtLFi
	HlJwctjqZQ/pNVS5KI6/s0sATMdBJbU/5A8uGOJdQ6rmqWuUUpW9qyI8F0gro5V03PxMVxwZ8aJYp
	t3yZwuafCo/0YVXrW6K837MET/fJG7x/IpM/Rxsby/6Fq8T/iWlc6PQIt7ypbvt0LulT8AZZf3yUq
	aIr2L1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIno3-00000007CZk-0OOQ;
	Tue, 11 Nov 2025 12:49:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInnz-00000007CYZ-43sS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:49:05 +0000
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 902EE3F659
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762865339;
	bh=t1dxoly2zHyheShYP01e8EomkwsEO3X8aFPvkI2bEmw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kU/vwbt6J/Ai6wWKQP0SwT4w/dkuA43Crx4RbOj2hhVlH3L/yIRw+EGr4y0ejSOir
	 BMqJhls05XB7i34NlCQiXjt/fVfvFTfS1HwwMpJs3WGPnYrai/SljQzFOayYHJhL25
	 HUfLXF03O75A5w32G/N+x9y44vZ03AIXaNNgKwlpL5L1v6madcH7r0m5WcrcfufKWV
	 /BKADLAbh2zOS+5BcnKv8uWXSlJy1kijZh9bfzpS6PXUaPhckcho5tEWqv8E2Taatq
	 AuK+TIjt8QBC9owlo9NbCNaZ271leq1fL/EwxX8y5GTSzSMXKB5yWsRw/Ukxw8nZtA
	 hyDPoNkWdLjCkfivEKICeQ8oJUqragwTv0RKt5y/73yRBN7kSwvrBXB0c4lNLqtuRp
	 8ToJu331UYD9lRqaUb/HenRGqXIf73mNYjBqp33j5B2TfsY+uQtO6oKF7jV4g2MoEP
	 YuCR9C3v2Vdo0hM9gwQfAYZ4XM8DkiOHh5Kpy5u/vT+8mdeoAtLDPEGS05boyT6TRp
	 tRO3u2gEHL5tpub9v3qo953/sKvuKve5qbttRHJ7UtQqjP2iL41GdK3AQmGdVt1GGs
	 yCVFIDWH5Vuk91dwnjRKFJ2fG643qIGozOKAz50n1Hd1WrPad9FV/w3cYOVLVURv5v
	 T/lYSM6h3/UkVPQtJHhjOgv0=
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ce1b57b3eso7139216a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 04:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762865338; x=1763470138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1dxoly2zHyheShYP01e8EomkwsEO3X8aFPvkI2bEmw=;
        b=WONKKJSA4WWmo+mjZSpI6hBNfW7nTwLtTzVe/ocng1EGATwKq5C5OOHJB8vYXr5Rkj
         72arRMWXRvPp1swUB9qyItlTs5760OujpKl24Y4pU/k7S3pfChiMdgNQtGTGJm2zhNtk
         H5py2TiDPCleGRHNP++UYToXV6VSx6DPt6YUhN5gknYSh9/46nH67Nf721bQ5JQ7j2J7
         X6WwcxhPY1o/mbn8crY1TpWcnXp/HmlN1dw2+u1Mg8vdA+H4eiw/mezcPtznHgOEgmyb
         yIalRH6HikdjUNt7OxZ3ITWIDkCtBzpXQTky9vSkHUKRc9CtYIwepOJnzQL/CCEIvLP1
         l3ig==
X-Forwarded-Encrypted: i=1; AJvYcCWo9T3B2b0XqBAxUqXgj+CZtKLWDCHGCXjmu9FqjxozXMg3CWmhrH9bBloww+zRiv0EpBQMngr2u7Bk5w1SLqOg@lists.infradead.org
X-Gm-Message-State: AOJu0YzL0mqNdiyIN9XOH/RnPEZmK/IuFpSFPEJ/Vji90MPDMnHMhyZw
	0logC6axR8aunqeLw+ta7jTU6GwYIa0dYuGRN65T0cNBlGQmVf30t89SD0Eleu1obmEWc1Qxw4s
	aldmvgcNSF/IjYBUVlgEByJP38TITpn73rOKvNU8X3NEecsY1uJsMIX2iTefiKMaMbHYI8X/DPj
	ruXPl75h06AnM3JhOnJn+fQu9aTrM=
X-Gm-Gg: ASbGncueWPVID1f5oU2qdvFxkDegcEaQy8jAUuh4ihLJarkGXIOHAuxDUKmzur7r+HB
	ppJJto2rdbZlZWpOkPb4KTZ6TS5TRDPKsqKjj85vHa/XJjVG8RTty8PiqyVMP0WfSoTUC3Rs0/q
	KY6SlLDbuciMlAVHLAYdfRNI80OxVXzHllcc4vH1zNytWHIefD5dCwJ4bDpRaKs6gA2zKJraLyl
	wXeqw0qJqWvBlCDOwK+Mnvv89BIHyRBCpN6FxjO5VDs7qn9RqowWnW8NXaYNk33FNxMKgcfM8s+
	yhTXhOaT+xe5qhysV5feQui/qlM+LSd+9VW4Fl4AbLl8XziUl+8d9bVKhQD4vP/qBVtcelRlwZZ
	6G3UJSemMNZPNk2LdR8cLHF5tSFyH4PFJnsaagu6M0/M=
X-Received: by 2002:a05:6a20:244e:b0:324:6e84:d170 with SMTP id adf61e73a8af0-353a006cefbmr16372050637.15.1762865338221;
        Tue, 11 Nov 2025 04:48:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzfagSBsG8Eak2lf3vPrQsWB9kt+8YkVWrapPqRfRjSpur3KxbAOMYxNP8nKXjprvoDPeZHw==
X-Received: by 2002:a05:6a20:244e:b0:324:6e84:d170 with SMTP id adf61e73a8af0-353a006cefbmr16372030637.15.1762865337888;
        Tue, 11 Nov 2025 04:48:57 -0800 (PST)
Received: from solution.. (125-228-254-191.hinet-ip.hinet.net. [125.228.254.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ca1e7b19sm15055283b3a.32.2025.11.11.04.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:48:57 -0800 (PST)
From: Jian Hui Lee <jianhui.lee@canonical.com>
To: Yong Wu <yong.wu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joerg Roedel <jroedel@suse.de>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] memory: mtk-smi: Fix NULL pointer dereference in config_port
Date: Tue, 11 Nov 2025 20:48:53 +0800
Message-ID: <20251111124853.2916889-1-jianhui.lee@canonical.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_044904_348411_D8D675C0 
X-CRM114-Status: GOOD (  14.42  )
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

Fix a race condition where mtk_smi_larb_resume() can be called before
mtk_smi_larb_bind() completes, leading to NULL pointer dereference when
accessing larb->mmu and larb->bank.

Add NULL checks to skip port configuration gracefully when the device
hasn't been bound yet.

Crash trace:
[    7.605014] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    7.605029] Mem abort info:
[    7.605031]   ESR = 0x0000000096000004
[    7.605034]   EC = 0x25: DABT (current EL), IL = 32 bits
[    7.605037]   SET = 0, FnV = 0
[    7.605040]   EA = 0, S1PTW = 0
[    7.605042]   FSC = 0x04: level 0 translation fault
[    7.605045] Data abort info:
[    7.605046]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    7.605049]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    7.605052]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    7.605055] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000106755000
[    7.605059] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[    7.605069] Internal error: Oops: 0000000096000004 [#1]  SMP
[    7.605075] Modules linked in: mtk_mdp3(+) snd_compress(+) ac97_bus snd_pcm_dmaengine snd_pcm v4l2_mem2mem videobufo
[    7.605223]  pwm_mtk_disp spmi_mtk_pmif spmi_devres clk_mt8188_imp_iic_wrap spi_mt65xx mmc_hsq stmmac clk_mt8188_ado
[    7.605267] CPU: 5 UID: 0 PID: 417 Comm: (udev-worker) Not tainted 6.17.2-custom #29 PREEMPT(voluntary)
[    7.605273] Hardware name: mediatek Genio 700 EVK P1V4 (eMMC Boot)/Genio 700 EVK P1V4, BIOS 2022.10-gb56d2a20f5 10/2
[    7.605278] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    7.605283] pc : mtk_smi_larb_config_port_gen2_general+0x2a8/0x458 [mtk_smi]
[    7.605301] lr : mtk_smi_larb_config_port_gen2_general+0x110/0x458 [mtk_smi]
[    7.605307] sp : ffff8000867f3370
[    7.605309] x29: ffff8000867f33e0 x28: 0000000000000000 x27: ffff80007c403fcc
[    7.605317] x26: 000000000000000a x25: ffff0000d5107c80 x24: ffff80007c4040f8
[    7.605325] x23: ffff80007c4040f8 x22: ffff80007c403fcc x21: ffff80007c43c918
[    7.605332] x20: 0000000000000007 x19: ffff80008685d218 x18: ffff8000863b90e8
[    7.605340] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    7.605346] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[    7.605353] x11: 0000000000000000 x10: 0000000000000000 x9 : ffff80007c403fcc
[    7.605360] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
[    7.605367] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[    7.605373] x2 : 0000000000000000 x1 : ffff8000867f33b8 x0 : 0000000000000000
[    7.605381] Call trace:
[    7.605384]  mtk_smi_larb_config_port_gen2_general+0x2a8/0x458 [mtk_smi] (P)
[    7.605393]  mtk_smi_larb_resume+0xbc/0x130 [mtk_smi]
[    7.605399]  pm_generic_runtime_resume+0x38/0x80
[    7.605410]  __genpd_runtime_resume+0x3c/0xb8
[    7.605419]  genpd_runtime_resume+0xec/0x338
[    7.605425]  __rpm_callback+0x54/0x210
[    7.605431]  rpm_callback+0x94/0xa8
[    7.605436]  rpm_resume+0x484/0x668
[    7.605442]  __pm_runtime_resume+0x68/0xd8
[    7.605447]  pm_runtime_get_suppliers+0x6c/0xb8
[    7.605453]  __driver_probe_device+0x5c/0x1c8
[    7.605461]  driver_probe_device+0x48/0x188
[    7.605466]  __driver_attach+0x14c/0x2c8
[    7.605471]  bus_for_each_dev+0x88/0x110
[    7.605476]  driver_attach+0x30/0x60
[    7.605481]  bus_add_driver+0x17c/0x2e8
[    7.605486]  driver_register+0x68/0x178
[    7.605492]  __platform_driver_register+0x30/0x60
[    7.605498]  mdp_driver_init+0x2c/0xff8 [mtk_mdp3]
[    7.605519]  do_one_initcall+0x64/0x378
[    7.605526]  do_init_module+0xa4/0x2e0
[    7.605534]  load_module+0x24a8/0x2618
[    7.605541]  init_module_from_file+0x98/0x118
[    7.605547]  __arm64_sys_finit_module+0x284/0x380
[    7.605554]  invoke_syscall+0x74/0x128
[    7.605560]  el0_svc_common.constprop.0+0x114/0x140
[    7.605565]  do_el0_svc+0x28/0x58
[    7.605570]  el0_svc+0x44/0x1f0
[    7.605579]  el0t_64_sync_handler+0xc0/0x108
[    7.605586]  el0t_64_sync+0x1b8/0x1c0
[    7.605594] Code: d2800011 d65f03c0 b9808b22 910123e1 (b9400003)
[    7.605599] ---[ end trace 0000000000000000 ]---

Fixes: e6dec92308628 ("iommu/mediatek: Add mt2712 IOMMU support")
Signed-off-by: Jian Hui Lee <jianhui.lee@canonical.com>
---
 drivers/memory/mtk-smi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 733e22f695ab..8eb043ff8280 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -244,6 +244,10 @@ static int mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	struct arm_smccc_res res;
 	int i;
 
+	/* larb->mmu and larb->bank are set in bind(), may not be ready yet */
+	if (!larb->mmu || !larb->bank)
+		return 0;
+
 	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
 		return 0;
 
-- 
2.48.1


