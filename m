Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBAEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nv9JoAvWs6gTM10vR8jVFYgQgKlyEZzVUAlrgzpixKg=; b=4VZouU19XdWk+FUkZDqTDEgRXr
	xB0UInNBswfu685yljyM3d5elCNvR9UatJEnsRjXYWPutuVgbT7VJezbUskIa4YEmyF9ySPCdzxon
	9zf7DestSsfLaivmret+hZxSNKCIvKDyfhQAKdI94mN1jI73yJ76ZNSminaY/jey+t26iyn96EH3Y
	LW8/xwr8xd1gVxCvkIWtVokcdSTWM0kQW7AnaEZO4WsYXo5SNpAv6QD+H7KhiI5HlRdcQ5k8s7SOh
	zKMi0YubxpUFeHcTSD77cYrsdYsp1CIbz9fOdVEpms3pQccGwf/3QqDuYc9z+O0bZ8xYVE5sAQXy3
	mfiHeU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVAx-0000000E2ha-1BMv;
	Wed, 07 May 2025 03:10:27 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCV8y-0000000E2bR-2cyV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 03:08:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22e331215dbso4006175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 20:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746587303; x=1747192103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nv9JoAvWs6gTM10vR8jVFYgQgKlyEZzVUAlrgzpixKg=;
        b=jmMZv4hXFhtr6h5LgAZQD/IgbBWuYYmGj9PaRVMQ6cL/CkHCBfYypV//tOhKZ1t3yO
         YpK/4MKz2rcnOUaTKOff3ieRYF6KBSfkm+8xhiqqu3ZzreSOxbsY1ynyQkNSrcCHMU0t
         Sw8cMhkSAK5E1ZceDh45dkzy1LB4MUQV9mrmxUoy0lbpPrIiENV96eHVrEGUuuSHlJ8r
         4EqciAXxBTEkKvTj+WJweQcnsoi3VhpDY6zuS1xGSoCLvQipqURENo2/FSWgDsa6JkC6
         FZDpZkAxYKHhcpoZ++8DmcQ74qLzA8ECosLEcOlVJfvgAVrOdMUTU77zAgs+TkY4aRB9
         3u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746587303; x=1747192103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nv9JoAvWs6gTM10vR8jVFYgQgKlyEZzVUAlrgzpixKg=;
        b=E/TNdKlkc53LLJ2WnpulF/edV6UFzGueZyGz50wQdjDFYHh3w8NM2WfFgHu7KVyK5j
         KvWqPOhFM2jA0agdelIAXLXjYpA5sKLnl788eAltLhyITeNItAx5YrwAWYIp0uDujJCZ
         PVTH+5OEtGLTmza3PvahwHRrC6Vct787uhfc94cAjg+5vUh9GKdC+zzi1lvVVZiSZvs8
         JsEjNdcxtCjKIqfXB+fhbM67S9btVLOfIwL9hhFJPeiBiX0If4MovtPRt6db/PYwTY/h
         /+5ibojFG5PuFEMEDG1JJ6XhV0SrmnfcOJbGLCxlLAa89bKoxQCT5rEu3BvGryE25rSO
         aJWw==
X-Gm-Message-State: AOJu0Yy/dmD2DEa/BNwRgh1AvK8tTr+WbQpK52x4KiQXDxL6yb3XgCyy
	GTT7AHFsuNKkUQoJ8ljrRLmtMi7BUd4OECuYoCXMIZ0nXaXm/ZLj
X-Gm-Gg: ASbGncsHx6SQ1zZKiX+vfot68C3IHzGJBkxyDNV4MLdjrO/PVMNwnj/8JRZsM0xz16G
	qR5s28F7c69J0CuOHVsx22Lx7gnBek0bwq/KVwFyJZjcLKPNhAEAFaRiFKk57ZQgIBQemqNPJzO
	U2n/Aa+eWiq1D6o8QTapN9eaZ2nVbBHz5fgNhjWbxOEqY8Pkxgc0Ul16osKwEjHLM+sKlo2Nckc
	WGCGYXzVriMoT6W58SQE60Mx+0eFAZMUSKcIriHLnm3JMNhHfvGPNho2TrZm/fG5EkEUghFMcM6
	9AEnaXfTCaGoLERNXvSAd0oxzh2iFLBTBrHebuwohes0rvN+PXi6CztM6zGgQ1m5oswMgs3UxFn
	y4x5DilBbQde8
X-Google-Smtp-Source: AGHT+IFwYs6I2Pfw7TuHODJ37F+9pTjMgxsBR4zPK+jGG6IHXPad4Qe4x81SoqSnB1SFpNl14YmD9Q==
X-Received: by 2002:a17:903:1ab0:b0:215:58be:334e with SMTP id d9443c01a7336-22e61695c71mr22640025ad.10.1746587303170;
        Tue, 06 May 2025 20:08:23 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15231fefsm82496035ad.210.2025.05.06.20.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 20:08:22 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sgoutham@marvell.com,
	andrew+netdev@lunn.ch,
	willemb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net-next] net: thunder: make tx software timestamp independent
Date: Wed,  7 May 2025 11:08:04 +0800
Message-Id: <20250507030804.70273-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_200824_665902_01180D63 
X-CRM114-Status: GOOD (  11.27  )
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

From: Jason Xing <kernelxing@tencent.com>

skb_tx_timestamp() is used for tx software timestamp enabled by
SOF_TIMESTAMPING_TX_SOFTWARE while SKBTX_HW_TSTAMP is controlled by
SOF_TIMESTAMPING_TX_HARDWARE. As it clearly shows they are different
timestamps in two dimensions, this patch makes the software one
standalone.

Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/cavium/thunder/nicvf_queues.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
index 06397cc8bb36..d368f381b6de 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
@@ -1389,11 +1389,11 @@ nicvf_sq_add_hdr_subdesc(struct nicvf *nic, struct snd_queue *sq, int qentry,
 		this_cpu_inc(nic->pnicvf->drv_stats->tx_tso);
 	}
 
+	skb_tx_timestamp(skb);
+
 	/* Check if timestamp is requested */
-	if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) {
-		skb_tx_timestamp(skb);
+	if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
 		return;
-	}
 
 	/* Tx timestamping not supported along with TSO, so ignore request */
 	if (skb_shinfo(skb)->gso_size)
-- 
2.43.5


