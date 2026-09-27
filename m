Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A399C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 08:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T9NtVLRAdrEtPzIkGo9792VQNjKKs+MEA/K2ye7PZBM=; b=T8YIPu6LenNcOUuB72gMdBykOS
	q8Kcgh2F+BpoPquvb0wFh0caoYqo+f/tPo4YLpyde+cR8w7lAgxcAitTmHra9pswqdPc4WFm94GKE
	v10lonyRVrwGYRyKmspCFZ0c/p0X95kt0tMHrjqAAtD8risFVTeLoBtu5uLT736LMXTZt/aK3gCaW
	6+uGDNkqmTNgSzEF8SqVFWQjP1/V9N0H7/sdrjMZcs6G9thenBjdEHRvaaYIgUHDjp50DQhigczUn
	5cLdtYkE/O88khr+iEWY6TDa8WOjbYwXZO68kkQArNPWN5xAPXN3JZ8ZYbgQQ5fjZsH1Yl5RoA1Dh
	fCB5ZwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAjy7-0000000G83p-1GL8;
	Sun, 27 Sep 2026 08:10:43 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAjy5-0000000G83S-0nAW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 08:10:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so12178675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790496639; x=1791101439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T9NtVLRAdrEtPzIkGo9792VQNjKKs+MEA/K2ye7PZBM=;
        b=HCRQmU6oYZ4rPretO7KAsMN/GSs7/hGn4aNNXzfdLYFid9nmuFG1H8IQZLKDVAoIl+
         bUeKAXR206GPTzeHTN0/R+6zIKoF5ns5CPDScNSdRTY9LkkS31GycKBMvgOZcuWXhQ7K
         rXuvKiBY6FZZOiI356xUB0QzQqMZK5/wENf4VGM0QyqInebdyrVz9J6eAkknaeg5xUnf
         Z8n2QvZm7xC5rnAFRwwXiCm0bdkgJ4vtOHBIwcxZKPWQ9tjGL+gN3iEAd3mpJZY8ogC3
         94tuQnlgBMT/ZgcKpDGXmLaYjTdVhY0XPb5wR68DDxLj5YLbs/1e/5v+0IyXdCIMNBAl
         hKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790496639; x=1791101439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9NtVLRAdrEtPzIkGo9792VQNjKKs+MEA/K2ye7PZBM=;
        b=ihhf1YZBlf6711vU1fXJaIapuC8SwTpfSso/Sh3EWrwuClfMsLOrASgG5ibOzis+UK
         B1ASbS+WaolYvcWSZwpG1lgwG3d2ZfGCm+Jm+/UKym3jgC34g2hrnZ/HbeALnq1X6XG8
         eLJi2UPLX2QsIK6DpsaMXMAR6/YScwwwoxvnPfhIlIC4uZKAleB1+dPX0vsZ75KMRJDt
         yUQmuErCW0j7FkO/ndGYRCusvcr0XCg+LE4ZcMxaDH2p6qT+CqPFlsSDVd/hxh7tJTdS
         GiLHuHWC2+wsxutNvIC42HbWNg8wZfv2VFWzzBfQxTwn67EyLfzZV5LrKHB0QppKkpFB
         x9Zw==
X-Forwarded-Encrypted: i=1; AKwUvBxipp7eDuK4icil2T1c2UUb/YIREW+bvkT/DygnIKLT0A5FOerCd8kIZ+StNb9tgvBzmXoodTEpfTKUrd1yD3Nd@lists.infradead.org
X-Gm-Message-State: AFuF++l/bsFb2t/EPFP5U50VIuR65Iy/Ru/2njgvm+rs4PiMiwsTifwr
	o/EGzisnjLZ8Fox9wWgHfbRQs+XTfc1eRCS/9FjqtELZJks/g93w4OrO
X-Gm-Gg: AYBFou0pFXhBl+NqlpM4vWVdrSlt9qjT/kmA3Dv5mDrof/RxoAsdn9BST+GIUzYoCi7
	w8KUVcotiNEGJeyUuR4d0kYBzZQmQfFOui6P4fyJlP01sKntoNByEpVaUrlncm6fkxBRGjpI/t2
	cqtoR0dORv2wtULa+dgcYFAMsJC6XBKbXbmbO4xUOhLC7nhtI2+fe7uNr0gApTfaTQ0kBEUGQ2b
	O4QQeds5sHTO9zoFXQSt1U5uFWC0aFLdvuqpKEOhfTbH70xwJCWyWbCHGc7W/yI6EHuYKIzAnLn
	sk/I9YkkV3zW0S/8MBfQjTj3hCsyM2r4gB1Zign+9TCr/sLhCwOE2XpqkBcpRbcjtb2LuHBbv2Y
	jG0NiQ+yM9tS3fbY5OXALfAuyO7JYTrgHgd6XB3gv/c8GmMbp6/9LW/Pjwr3CWG+jW1p7eRHVNt
	bAdMwuQaqJ9McNmbvOh0ZWGuSQM/LK7ZcOj3WQqmOdeRJwPUUCO+C/7bVvYzoxSgf/s6q7GQPuZ
	BJAoU97olzprFe6FuXE3Y4EXT5WgAgqTyrBqjhu
X-Received: by 2002:a05:600c:a4c:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49fe67060cemr178391235e9.31.1790496638952;
        Sun, 27 Sep 2026 01:10:38 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a002d1d8d5sm12462615e9.0.2026.09.27.01.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:10:38 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel@iogearbox.net,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
Date: Sun, 27 Sep 2026 11:10:34 +0300
Message-ID: <20260927081034.350422-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_011041_277011_0D4F7153 
X-CRM114-Status: GOOD (  17.38  )
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

axienet_dma_bd_release() walks the RX ring to unmap and free every
receive buffer before releasing it, but frees the TX descriptor ring
with dma_free_coherent() alone.  Any descriptor that
axienet_free_tx_chain() had not yet reclaimed still holds its skb and
its streaming DMA mapping, and both are lost.

axienet_stop() disables TX NAPI and stops the DMA engine before calling
it, so nothing reclaims those descriptors afterwards.  Bringing the
interface down while frames are in flight therefore leaks up to
lp->tx_bd_num skbs and mappings each time.

Walk the TX ring the way axienet_dma_err_handler() already does: unmap
every descriptor whose cntrl is still set - axienet_free_tx_chain()
clears it on reclaim - and free any skb still attached.  The DMA engine
has been stopped by then, so the hardware no longer references the
buffers.  On the axienet_dma_bd_init() error path the TX ring has just
been allocated zeroed, so the walk does nothing.

This was reported by the Sashiko AI review bot.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes,
and after each of ten down/up cycles and five module reloads, all made
with traffic running and each running axienet_dma_bd_release(), traffic
resumes and nothing is logged.  The leak itself was not measured.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---

Notes:
    Found by the Sashiko review of v2 of "net: axienet: bound TX completion
    cleanup by the NAPI budget":
    https://lore.kernel.org/netdev/20260917115657.20697-1-maimon.sagi@gmail.com/
    It is independent of that patch and applies on its own.

 .../net/ethernet/xilinx/xilinx_axienet_main.c  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1722b7038f34..02bcb89d1bbe 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -187,6 +187,24 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 	struct axienet_local *lp = netdev_priv(ndev);
 
 	/* If we end up here, tx_bd_v must have been DMA allocated. */
+	for (i = 0; i < lp->tx_bd_num; i++) {
+		struct axidma_bd *cur_p = &lp->tx_bd_v[i];
+
+		/* axienet_free_tx_chain() clears cntrl when it reclaims a
+		 * descriptor, so a non-zero value means the mapping is live.
+		 */
+		if (cur_p->cntrl) {
+			dma_addr_t addr = desc_get_phys_addr(lp, cur_p);
+
+			dma_unmap_single(lp->dev, addr,
+					 (cur_p->cntrl &
+					  XAXIDMA_BD_CTRL_LENGTH_MASK),
+					 DMA_TO_DEVICE);
+		}
+		if (cur_p->skb)
+			dev_kfree_skb(cur_p->skb);
+	}
+
 	dma_free_coherent(lp->dev,
 			  sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
 			  lp->tx_bd_v,

base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.47.0


