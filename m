Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E323D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 02:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U3FBb66LhC69xzR90g1eNdryay2txh0Eg4xYtWgJK8o=; b=2GcdhZu5lkRvaEIR+9QaANj+/+
	RRNLQ6plXi4nFizDBsG7pCA/+SIk33cRcwApYOO+cMeLkq4Qt7iP/BZObPgjpoExGUcKvJ/WOfRUw
	IoBiU5f9Lx3A7u/BfrQkYR7CvBIBFliGEEaA8DqdNpcP1RwZC8O9pJRL4YCl3XV5JndaAVkoia6Sr
	uMEpx6rwYDs9OEfhcA3qnm3WX6hnIpKwd96P6DX76GRzP4OyhfUrT77AxNeV8m4L8MN3C/vV7NhWO
	SDHSyIcqirZ5gsqsNfgszTZAZZEdfi9H5zgk6wEayftJsCQuQoSynMDpd3zxiAljM9MmI0rZEQj5D
	OGJFPmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQGXB-00000004jd9-1Lx0;
	Tue, 02 Dec 2025 02:54:33 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQGX8-00000004jcm-27xx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 02:54:31 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4eda6c385c0so40077751cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 18:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764644067; x=1765248867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3FBb66LhC69xzR90g1eNdryay2txh0Eg4xYtWgJK8o=;
        b=Fg3qOurmVMuVlnoHdvEZaZTXGNKQXA2xbVhj+ovdc/O/yPQnrceOwRyG+MM0RHJ2Gc
         fU2rO51R9NKxC2AopUp6f7nTR2DaIQObSFahOfsN8wFgP+uj2c93IjyV7HcOCWslCLQX
         hTPJ4gZMvjpXs3usmxE8BBtoEoAsfU4ewkOnsf+XGcQvlb88ztfHWjk2brIu/Gk3m7Y6
         uXt/LARACB1hTApJyCTfWZYFCiZyZNQ2s1aFQnbJlvXvnDz2c0mcHdBbORlRUiGLpSTE
         4v9O2Unz/cnHNnf3U7Nre3l7wa2ueYw8NJ5G+DS+Qqt5PUG3zmS//MCqKr8CBz2UVp/q
         RORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764644067; x=1765248867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3FBb66LhC69xzR90g1eNdryay2txh0Eg4xYtWgJK8o=;
        b=kaBkAHBXOFh18Px2m2fl8pw01eV7pIzOIBYOSDxqWJYAY1iQMAzoOI0MGwhPHs57uF
         AGu+dQ/fc1TyWR5+QoFX5TdIRGx7RIkYJt4SGWAyfUHM6w1gq7Rok/VH2KypxTyMEPUw
         RlF6oGck4edFZgRCyfpRhZAxCWMYIiA0bkHSkurv6CUjqg3js4Ea+QsMOLNeK3JLm8Wv
         qYdGgOITRycBW3+ptGyubQ2gviJ8ycPucypwVUmCldhgl0IZXnvWTJi7TTBnqsy51QEX
         z2AkAI9qWqeYaxnRV0am4at4SYKKEbju4ZFn9Uzpdtn7uWyHU90PYKmeDsGnedv+l2z7
         0eAA==
X-Forwarded-Encrypted: i=1; AJvYcCV+mKP7Mm+lRTLSta4q8EWYo976KpfG/ITfXnbxdh/f/qWVM6B/XdVqxiW5emTMdTJE0UDSzqbEB42IGuiOQ7iP@lists.infradead.org
X-Gm-Message-State: AOJu0YzOpO6HrsI6C18QlNyu+TC7yG2dRu1OND4VWxu4k95zC8aSfSXn
	qSdZuJpYzTZqpYhkIVhiekb1WrzGOw9HxGLQyZBTWwKwjX1RPhnuI5/X
X-Gm-Gg: ASbGnct8huwbXnXsZMNv+QE8t90vAvdpqrO9WBk1lm4vJnbgpfcp74UF2D58r2KY7Fh
	PBgh3EjBrZnLwyhU8ZQqHV5c665jaQTcEPF75RRyL/XlwhjR57FEGUCKBMJNZJbTBsMCULOLjfX
	5+o7JqPPZMTy+CugawllhGXaEr210FDrEaS26L3o/WGjAWgt5X9tOvIFUrWx6dokRLW6DFXl153
	csk/hxlObdb6egISV5CJ05B25cM4WUoEDJBBbfwIolVX2FBJpMRbu7RxHlBgUXM2P8/KQfENuez
	UAbAPyaKrG78izlPsxW3yXSlRXlaxxDid/J6Kkbyc4qjo87xW+4o3GenwIwTTMKJxo0tGyQ3Bt9
	L8xTI7b2IWiUXNiFa+u2TGu4eRxad6NGqP0PoUz5uYUzhMld1FVK5FrbWm0LTASsc9j+QvAManB
	NCt6Bc54CnF+eXBbKUrTJR/0AalwYn4XeaxREHFPpFTI4QHSOlVLqnpCI+ZYnVPswfnxPrztu+z
	lk=
X-Google-Smtp-Source: AGHT+IF1Y26tarkgHugZ4zAMvf/99cbk/6HuQ3PbtQTRf5s5WQrWhUrkganAuIBkyYpvOL7fPVmVdQ==
X-Received: by 2002:a05:622a:295:b0:4ed:b448:b19f with SMTP id d75a77b69052e-4efbdad012amr355218281cf.51.1764644067186;
        Mon, 01 Dec 2025 18:54:27 -0800 (PST)
Received: from localhost.localdomain (h69-131-24-92.cntcnh.broadband.dynamic.tds.net. [69.131.24.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd344a188sm88508641cf.33.2025.12.01.18.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 18:54:26 -0800 (PST)
From: Jie Zhang <jzhang918@gmail.com>
X-Google-Original-From: Jie Zhang <jie.zhang@analog.com>
To: netdev@vger.kernel.org
Cc: Jie Zhang <jzhang918@gmail.com>,
	Jie Zhang <jie.zhang@analog.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: fix oops when split header is enabled
Date: Mon,  1 Dec 2025 21:54:16 -0500
Message-ID: <20251202025421.4560-1-jie.zhang@analog.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_185430_604954_143873B6 
X-CRM114-Status: GOOD (  18.25  )
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

For GMAC4, when split header is enabled, in some rare cases, the
hardware does not fill buf2 of the first descriptor with payload.
Thus we cannot assume buf2 is always fully filled if it is not
the last descriptor. Otherwise, the length of buf2 of the second
descriptor will be calculated wrong and cause an oops:

Unable to handle kernel paging request at virtual address ffff00019246bfc0
Mem abort info:
  ESR = 0x0000000096000145
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000145, ISS2 = 0x00000000
  CM = 1, WnR = 1, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000090d8b000
[ffff00019246bfc0] pgd=180000009dfff403, p4d=180000009dfff403, pud=0000000000000000
Internal error: Oops: 0000000096000145 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 157 Comm: iperf3 Not tainted 6.18.0-rc6 #1 PREEMPT
Hardware name: ADI 64-bit SC598 SOM EZ Kit (DT)
pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : dcache_inval_poc+0x28/0x58
lr : arch_sync_dma_for_cpu+0x28/0x34
sp : ffff800080dcbc40
x29: ffff800080dcbc40 x28: 0000000000000008 x27: ffff000091c50980
x26: ffff000091c50980 x25: 0000000000000000 x24: ffff000092a5fb00
x23: ffff000092768f28 x22: 000000009246c000 x21: 0000000000000002
x20: 00000000ffffffdc x19: ffff000091844c10 x18: 0000000000000000
x17: ffff80001d308000 x16: ffff800080dc8000 x15: ffff0000929fb034
x14: 70f709157374dd21 x13: ffff000092812ec0 x12: 0000000000000000
x11: 000000000000dd86 x10: 0000000000000040 x9 : 0000000000000600
x8 : ffff000092a5fbac x7 : 0000000000000001 x6 : 0000000000004240
x5 : 000000009246c000 x4 : ffff000091844c10 x3 : 000000000000003f
x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
Call trace:
 dcache_inval_poc+0x28/0x58 (P)
 dma_direct_sync_single_for_cpu+0x38/0x6c
 __dma_sync_single_for_cpu+0x34/0x6c
 stmmac_napi_poll_rx+0x8f0/0xb60
 __napi_poll.constprop.0+0x30/0x144
 net_rx_action+0x160/0x274
 handle_softirqs+0x1b8/0x1fc
 __do_softirq+0x10/0x18
 ____do_softirq+0xc/0x14
 call_on_irq_stack+0x30/0x48
 do_softirq_own_stack+0x18/0x20
 __irq_exit_rcu+0x64/0xe8
 irq_exit_rcu+0xc/0x14
 el1_interrupt+0x3c/0x58
 el1h_64_irq_handler+0x14/0x1c
 el1h_64_irq+0x6c/0x70
 __arch_copy_to_user+0xbc/0x240 (P)
 simple_copy_to_iter+0x28/0x30
 __skb_datagram_iter+0x1bc/0x268
 skb_copy_datagram_iter+0x1c/0x24
 tcp_recvmsg_locked+0x3ec/0x778
 tcp_recvmsg+0x10c/0x194
 inet_recvmsg+0x64/0xa0
 sock_recvmsg_nosec+0x1c/0x24
 sock_read_iter+0x8c/0xdc
 vfs_read+0x144/0x1a0
 ksys_read+0x74/0xdc
 __arm64_sys_read+0x14/0x1c
 invoke_syscall+0x60/0xe4
 el0_svc_common.constprop.0+0xb0/0xcc
 do_el0_svc+0x18/0x20
 el0_svc+0x80/0xc8
 el0t_64_sync_handler+0x58/0x134
 el0t_64_sync+0x170/0x174
Code: d1000443 ea03003f 8a230021 54000040 (d50b7e21)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Oops: Fatal exception in interrupt
Kernel Offset: disabled
CPU features: 0x080000,00008000,08006281,0400520b
Memory Limit: none
---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---

To fix this, the PL bit-field in RDES3 register is used for all
descriptors, whether it is the last descriptor or not.

Signed-off-by: Jie Zhang <jie.zhang@analog.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b90ecd3a55e..848b1769c573 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4878,13 +4878,27 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	if (!priv->sph)
 		return 0;
 
-	/* Not last descriptor */
-	if (status & rx_not_ls)
+	/* For GMAC4, when split header is enabled, in some rare cases, the
+	 * hardware does not fill buf2 of the first descriptor with payload.
+	 * Thus we cannot assume buf2 is always fully filled if it is not
+	 * the last descriptor. Otherwise, the length of buf2 of the second
+	 * descriptor will be calculated wrong and cause an oops.
+	 *
+	 * If this is the last descriptor, 'plen' is the length of the
+	 * received packet that was transferred to system memory.
+	 * Otherwise, it is the accumulated number of bytes that have been
+	 * transferred for the current packet.
+	 *
+	 * Thus 'plen - len' always gives the correct length of buf2.
+	 */
+
+	/* Not GMAC4 and not last descriptor */
+	if (!priv->plat->has_gmac4 && (status & rx_not_ls))
 		return priv->dma_conf.dma_buf_sz;
 
+	/* GMAC4 or last descriptor */
 	plen = stmmac_get_rx_frame_len(priv, p, coe);
 
-	/* Last descriptor */
 	return plen - len;
 }
 
-- 
2.47.3


