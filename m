Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5386C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 07:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JYqespCzipBArbkbxwYqmmhBdhSBu5Sof0tluCzWjzo=; b=ZwN1heIcpATwlnlRYIT11uLGdb
	5pakMivKe4Ln83FyAGn66A4ZYEZJ+W2HqccqS6KC5fe+3bouC1JshUoZ2yN4c5xp+G/RlHgEnr1FU
	IJ2rltknPHKTy0zouDFUY1su/puj/M2WMr9gDLd0aNqA1u3W9+3+MbuYWGF/+Ng0WsXKVeIWS3uZ3
	BXK7T59wlfCIPbpv/3YTlR/m06AOi2/hl20MuPLnnP37Uof85gteRibAu2yt/1rkaZZL+lrmnX7R2
	SJCX6ZjTN38N4MMzgxYPJjeecT9EhvggkYTVeIrYcMH8ExWrogGYt7RfV/MG3c7RStzxxMMBzTiWB
	TF2Dmr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DWF-0000000GByy-3OjD;
	Fri, 25 Apr 2025 07:30:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DUO-0000000GBgt-2qgG;
	Fri, 25 Apr 2025 07:28:49 +0000
X-UUID: e9982a3021a611f0b1a74d0c5e11a509-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JYqespCzipBArbkbxwYqmmhBdhSBu5Sof0tluCzWjzo=;
	b=SevJ/7VuOaCdLQhWKJDTlAsQ25Lq34Kp9PokzmhNpcW7MFfLs96ybN+UhzvvZLWCXcShBNh6gXu0wIn+EH/Do9/f250FIdRkJGuQ7XTURxFIzxfdDxndy/MtdXy01W7od7p7d4sFFtuFRijypwYln9g9lRX4LIZJjjkfqHYH7Tg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f5eb02f8-6553-49bb-9d9b-410273377cb9,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:6ab29bf0-ff26-40e8-a637-f0e9524b171a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e9982a3021a611f0b1a74d0c5e11a509-20250425
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shiming.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 418660141; Fri, 25 Apr 2025 00:28:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Apr 2025 15:28:39 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Apr 2025 15:28:38 +0800
From: Shiming Cheng <shiming.cheng@mediatek.com>
To: <edumazet@google.com>, <davem@davemloft.net>, <dsahern@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horms@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Jibin Zhang <jibin.zhang@mediatek.com>
Subject: [PATCH] net: call inet_twsk_put() on TIMEWAIT sockets It is possible for a pointer of type struct inet_timewait_sock to be returned from the functions __inet_lookup_established() and __inet6_lookup_established(). This can cause a crash when the returned pointer is of type struct inet_timewait_sock and sock_put() is called on it. The following is a crash call stack that shows sk->sk_wmem_alloc being accessed in sk_free() during the call to sock_put() on a struct inet_timewait_sock pointer. To avoid this issue, use inet_twsk_put() instead of sock_put() when sk->sk_state is TCP_TIME_WAIT.
Date: Fri, 25 Apr 2025 15:31:13 +0800
Message-ID: <20250425073120.28195-1-shiming.cheng@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_002848_726787_C5C25CD7 
X-CRM114-Status: GOOD (  12.16  )
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

From: Jibin Zhang <jibin.zhang@mediatek.com>

mrdump.ko        ipanic() + 120
vmlinux          notifier_call_chain(nr_to_call=-1, nr_calls=0) + 132
vmlinux          atomic_notifier_call_chain(val=0) + 56
vmlinux          panic() + 344
vmlinux          add_taint() + 164
vmlinux          end_report() + 136
vmlinux          kasan_report(size=0) + 236
vmlinux          report_tag_fault() + 16
vmlinux          do_tag_recovery() + 16
vmlinux          __do_kernel_fault() + 88
vmlinux          do_bad_area() + 28
vmlinux          do_tag_check_fault() + 60
vmlinux          do_mem_abort() + 80
vmlinux          el1_abort() + 56
vmlinux          el1h_64_sync_handler() + 124
vmlinux        > 0xFFFFFFC080011294()
vmlinux          __lse_atomic_fetch_add_release(v=0xF2FFFF82A896087C)
vmlinux          __lse_atomic_fetch_sub_release(v=0xF2FFFF82A896087C)
vmlinux          arch_atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C)
+ 8
vmlinux          raw_atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C)
+ 8
vmlinux          atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C) + 8
vmlinux          __refcount_sub_and_test(i=1, r=0xF2FFFF82A896087C,
oldp=0) + 8
vmlinux          __refcount_dec_and_test(r=0xF2FFFF82A896087C, oldp=0) + 8
vmlinux          refcount_dec_and_test(r=0xF2FFFF82A896087C) + 8
vmlinux          sk_free(sk=0xF2FFFF82A8960700) + 28
vmlinux          sock_put() + 48
vmlinux          tcp6_check_fraglist_gro() + 236
vmlinux          tcp6_gro_receive() + 624
vmlinux          ipv6_gro_receive() + 912
vmlinux          dev_gro_receive() + 1116
vmlinux          napi_gro_receive() + 196
ccmni.ko         ccmni_rx_callback() + 208
ccmni.ko         ccmni_queue_recv_skb() + 388
ccci_dpmaif.ko   dpmaif_rxq_push_thread() + 1088
vmlinux          kthread() + 268
vmlinux          0xFFFFFFC08001F30C()

Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>
---
 net/ipv4/tcp_offload.c   | 8 ++++++--
 net/ipv6/tcpv6_offload.c | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index 2308665b51c5..95d7cbf6a2b5 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -431,8 +431,12 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 				       iph->daddr, ntohs(th->dest),
 				       iif, sdif);
 	NAPI_GRO_CB(skb)->is_flist = !sk;
-	if (sk)
-		sock_put(sk);
+	if (sk) {
+		if (sk->sk_state == TCP_TIME_WAIT)
+			inet_twsk_put(inet_twsk(sk));
+		else
+			sock_put(sk);
+	}
 }
 
 INDIRECT_CALLABLE_SCOPE
diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
index a45bf17cb2a1..5fcfa45b6f46 100644
--- a/net/ipv6/tcpv6_offload.c
+++ b/net/ipv6/tcpv6_offload.c
@@ -41,8 +41,12 @@ static void tcp6_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
 					&hdr->daddr, ntohs(th->dest),
 					iif, sdif);
 	NAPI_GRO_CB(skb)->is_flist = !sk;
-	if (sk)
-		sock_put(sk);
+	if (sk) {
+		if (sk->sk_state == TCP_TIME_WAIT)
+			inet_twsk_put(inet_twsk(sk));
+		else
+			sock_put(sk);
+	}
 #endif /* IS_ENABLED(CONFIG_IPV6) */
 }
 
-- 
2.46.0


