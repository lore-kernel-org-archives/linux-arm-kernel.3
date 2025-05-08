Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1780C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 03:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YPjH1uIhopChcoYO7jc2DTuBKII1F75cT+E4xkKCk3E=; b=HPbVk+hkF7Rg3ttZpcIL4gWyB7
	cbvEMMbfcGRVbttAuC3TEQwDhrnKuGHs3Lk2HnlQjkSJLeb6nOXyG1UEfQQkX/1QJGB2Qp3AcAnrh
	iNXJYQJfX2Q5ACuayOyx4pPoZ+1n+SCMRO241Nj4u5TRZy2+YbgKbRZM2i++7pid45ibKf8xbjObf
	KQJQf+56xcttF6K4ziipgcPBCW195m0maclEJuggApFUVVpzBOFLjyXF297FXfqTfJSciogxBMnlE
	61CYhoSUb9CGZB81y/PSAHXd76pWOtfaQuUw8Eg9W56safUjdVDDS35qnb0zDf1t7VNcp5exkBUT9
	R17CYXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsDa-0000000HF07-2e4X;
	Thu, 08 May 2025 03:46:42 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsBc-0000000HEum-2xko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 03:44:41 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-736c1138ae5so604693b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 20:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746675880; x=1747280680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YPjH1uIhopChcoYO7jc2DTuBKII1F75cT+E4xkKCk3E=;
        b=W378/Y5nBgdMBs+OT0PXb1zM+HvnhEC9Qk6c8LMLXAn/FzH3IzTBwTGwsCSZaoAXpg
         vQOb7eH9riaEBmDDipggrflcKzIpBh03zD0OFmjHRt2M3jFmvm6A8zwCAPQSYhYtgeIW
         OUcaDlvR5s7Lr/rcl1mFwh+M8K7x/31TURVLxojOONWlwlT5aCz7DPAzpRvofz6bCUUM
         GnR/24wBZhF7lpcIqaBbK94QnbXcz8wFhsZj0ivOw37NrIRM7XDfL/hncT1oIzZrPFIj
         DmYH1U+1AarTjWu4bixIWYAM+j/CUroRjPIDnng512f9AjyOy3pqxpL3jwADEvyWr/SX
         2i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746675880; x=1747280680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPjH1uIhopChcoYO7jc2DTuBKII1F75cT+E4xkKCk3E=;
        b=cHBQAyh/2IURQm+w09RL5L1mjosQyMPCVOL2i/JEUviR+QxFvGYxd9NecFPvENKhQF
         pZjqONv7QAKbhjm4wveQjytVpRu3dxaAWWewAUqdoiVO1yK1uDssdQ5ER2XwKDbL60vr
         GZvTYhs2PvRNobTaGxNu07O943rWPxBDjPB4x+a8e6G7SpooychGHjYjh2znsog56M0t
         MGPTSxWE4xih+/Fwmfc1ilTvOpGOLKliRHAsqiamBAxJi1cvEs7lNRe3cZl1oJFQw87+
         k8pZ75akFoqcVPcLKnAVfWExoxjj+trpga7v4x+1n1kNVtbDzEBuoOfJJ+YGxYPKNs+n
         sbBw==
X-Gm-Message-State: AOJu0YzNfnWbGZoT5rl4HyHIJBvSH4lGdR3qjf7GefcirnWxFAe0I4Zk
	1xxc16XaKmXV8a5iD3M9bS2PfZpQX7ptI/Czq17ELjli8FhRqHxQ
X-Gm-Gg: ASbGncuqS7qEzeqdx9YmmK2WgoWgCskh+kvC81CRex6y+7wnWLDhjFgMYUCD/j7EEN1
	H9XFCGnefOOZAMAaCo0Rga0H0xeh8FB2r5E1xZCVpCPokCdg2rScLHK9ADW4m5KhvORCxaQqqwq
	X9cSYmAESHGHHwvz78jVTJaSznCJ1mUY60w5hR9D7Sb+WPK28Xklc0YhYVSfyzS3ZGxUy29O58v
	TW/vnwa1xKKuWdubFpxEwUwqinYn5JFKvWYQojrig6uGSPam37kDX5cx70X3uEcdY8nJkelgxtk
	q4ZWY5WLQc8ngKjbAgFJRwsDVAlYypt7ZN0yiMW3k4LHh5+9Q31ktKrxmdbZV3jVijl2A+jOURN
	U6IZaPVa6K/ZnUSD6Duv4Hn0=
X-Google-Smtp-Source: AGHT+IFp0O6esA7K6jD1keIhUIbjH1nxmx0VG8UBNNcd8Fa3wvOdZuiRHdY/b56V4j5U8Dx4Ys45/Q==
X-Received: by 2002:a05:6a00:3485:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-7409cfef821mr8771048b3a.24.1746675879775;
        Wed, 07 May 2025 20:44:39 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020dc8sm12188249b3a.86.2025.05.07.20.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 20:44:39 -0700 (PDT)
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
Subject: [PATCH net-next v2] net: thunder: make tx software timestamp independent
Date: Thu,  8 May 2025 11:44:33 +0800
Message-Id: <20250508034433.14408-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_204440_758291_699EDCE2 
X-CRM114-Status: GOOD (  12.96  )
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
SOF_TIMESTAMPING_TX_SOFTWARE while SKBTX_HW_TSTAMP is used for
SOF_TIMESTAMPING_TX_HARDWARE. As it clearly shows they are different
timestamps in two dimensions, it's not appropriate to group these two
together in the if-statement.

This patch completes three things:
1. make the software one standalone. Users are able to set both
timestamps together with SOF_TIMESTAMPING_OPT_TX_SWHW flag.
2. make the software one generated after the hardware timestamp logic to
avoid generating sw and hw timestamps at one time without
SOF_TIMESTAMPING_OPT_TX_SWHW being set.
3. move the software timestamp call as close to the door bell.

Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
v2
Link: https://lore.kernel.org/all/20250507030804.70273-1-kerneljasonxing@gmail.com/
The main logic of this patch came out of previous discussion with
Willem, just as the content of this patch says.
---
 drivers/net/ethernet/cavium/thunder/nicvf_queues.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
index 06397cc8bb36..5211759bfe47 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
@@ -1389,11 +1389,9 @@ nicvf_sq_add_hdr_subdesc(struct nicvf *nic, struct snd_queue *sq, int qentry,
 		this_cpu_inc(nic->pnicvf->drv_stats->tx_tso);
 	}
 
-	/* Check if timestamp is requested */
-	if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) {
-		skb_tx_timestamp(skb);
+	/* Check if hw timestamp is requested */
+	if (!(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
 		return;
-	}
 
 	/* Tx timestamping not supported along with TSO, so ignore request */
 	if (skb_shinfo(skb)->gso_size)
@@ -1472,6 +1470,8 @@ static inline void nicvf_sq_doorbell(struct nicvf *nic, struct sk_buff *skb,
 
 	netdev_tx_sent_queue(txq, skb->len);
 
+	skb_tx_timestamp(skb);
+
 	/* make sure all memory stores are done before ringing doorbell */
 	smp_wmb();
 
-- 
2.43.5


