Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1F5CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AyhxEIcTaJ0tE2zF05eMkIwg9pnZjsy1bH02V+XNbGM=; b=M9FLzksDRSTe46ozWRDM2NwUf0
	j3lSWyI4Hwzwvpa8cL1VTqMYykeHMPKPeQK9ipg2vBZY4H2H86SUazM6mf/tW8zZuJHX4EUEUisG1
	sEHo1VtfsTfHkkgejlstSEziZtk+c+YKAdsKZLlbcjld5b7fSNWTQaRtSOhtoqpzkrN2HuGMLYMoG
	BDnSuHMBrJDsUltb9JqnjOLmJGIxkY5PcP9WESk0A+h0rkiyhMHXY00gmEetIG8bKJKRn2hUzboD9
	oxEkKL2oFF7hYHkwSPnhYjcUh9qNt9y8XHj60fgsKm7Zs+VyWbapJm/AINAT3PvaEOKy985zTW2Vz
	TWODzN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUrn-00000005Ezg-12j2;
	Thu, 28 May 2026 07:09:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUrl-00000005Eyx-1rKk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 07:09:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so7419740f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779952155; x=1780556955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AyhxEIcTaJ0tE2zF05eMkIwg9pnZjsy1bH02V+XNbGM=;
        b=SbEfggh85rkPx8ev2XlFttNB+BAjs2w7htNUmZ7lwcRsXOtawJv+6AhF/1OF/2EFZG
         x0sFLSdxUzWsntdhN0wgyokRRTbn2IAFKI8cdBN7y9tJ3h2Qj55C8V/fTMy8b7gFha09
         xkSUs6/S1Ko9lPgbL4yt219Jsxg8b+y/BDpMWU4ewZ01LVIfqsKDZF1L6VJPUaB5ooku
         xvch9oJMdR8xTFaDbiIt5xv4Epunm1C+iw3rn2afh/62qrQsektscQMergOzCwY1mcYh
         bIbtGHy2aIeikxd2m18AeV7fwbXMZT2fMwJ9qYj6B0Cm+eWnOeSbvGokliRl/bW7ZoeJ
         uEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779952155; x=1780556955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyhxEIcTaJ0tE2zF05eMkIwg9pnZjsy1bH02V+XNbGM=;
        b=BW/hN7Amd/jFDzlIBbdUONH0AtNTLIbc3rDKDpYX/iGO44DN302o2ElxJfThx2TP0w
         jfekoIZowxfsN7++KFykwbg4CS5erojCPaICd9WLcoXS2irajT/JEXu3970tjD679aYq
         z1wJnVHYs89712+7gayMeb1Ic+tqfsA1+Rb6G0ALITcqgTHtFLRNScW41wjsD78jfQES
         pf4XzdvNJftXdwC2qP5DpOrFT/EIcATfGtDJ/bKt+JUkAfeFJ5co8C3SjfNWTZkToGPd
         3JLHJ1mLERiQBM9KZtkNlzV7LsMJQUpq3kH0QmGaA6iHAmvEYcb1xUGdFINv71QXjHWo
         vjfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oHT8CM5mVjJ9rw8FhJhuqbduXUR2ax4S4/AhMmO2WGQV3Z8T363gPKE4SdBpE8zbNkcl9oJuPnmBJSCYeBmf8@lists.infradead.org
X-Gm-Message-State: AOJu0YzTNMpZP7ncFyCjfPl8gKj6lLYVvCgXk2FcC8A/jtHM9HitXkp+
	9md+yndBsmFhk0XahWOoDUDKM/bIjyvrrmOAaif23D1LvZIwy6PIznPs
X-Gm-Gg: Acq92OFA/1pYcIb9mACuRUYuOshrYk/ArxeWd+ntMweKDz4pKzLkSC1nzYbHw3/Fvko
	K4Djz99g0xXV7sF2oBD6akdEPfQzdJGeu3rRSIsyAvfDEVY9LDEtM1xFh1Du1ceLub6yeiLiV6h
	JqdVrHtaM+zRiQyXuhQ6AJ/aBRZuf4qDcmzlAhbf20rXm2sai0KvHziHOYYyE0x+8+9JjTBFU+A
	suAm9DmiaITXfJIdXJeP45bryVdmUxnyg41gE8+OxjxCaxC3292ObTzmLUI6WndZM0cfg/XdQib
	omttZva9K/RrNjRKKoU4peBW6HBbyWaQ/tFbOJIBc2KcJ1IMfktUjCfCHE1/RmUVmXaJdxnxD63
	mY68SJ6EMsMHLIqlP16iwmoLslroqqn1JPEPBqmVQTdoCHcohz7WHvNQt8rklLcvIxFiCAxa0DJ
	w2wL88ANOPndyEl+6WsKNf5tOl0Myoda25ydVFVF0qhfXFgxR8mIriSKyaFMnVJXhCkALRfbOI1
	FfvMSRJuoA1WpJ4fYi51HmbI24g
X-Received: by 2002:a5d:5846:0:b0:45e:e5d1:8a74 with SMTP id ffacd0b85a97d-45ee5d18b41mr2471256f8f.14.1779952155005;
        Thu, 28 May 2026 00:09:15 -0700 (PDT)
Received: from localhost.localdomain ([188.27.64.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ee91c34bfsm2722402f8f.2.2026.05.28.00.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:09:14 -0700 (PDT)
From: Adrian Bente <adibente@gmail.com>
To: pablo@netfilter.org,
	kadlec@netfilter.org,
	fw@strlen.de,
	netfilter-devel@vger.kernel.org
Cc: phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	daniel@makrotopia.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Adrian Bente <adibente@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 net] netfilter: flowtable: fix offloaded ct timeout never being extended
Date: Thu, 28 May 2026 10:08:51 +0300
Message-ID: <20260528070851.3913-1-adibente@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_000917_495204_D866D349 
X-CRM114-Status: GOOD (  14.61  )
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

OpenWrt has recently migrated many platforms to kernel 6.18. On the
MediaTek platform, which supports hardware network offloading, WiFi
connections accelerated via the WED path were observed to drop after
roughly 300 seconds.

After several debugging sessions, assisted by the Claude LLM, the
problem was narrowed down as follows:

nf_flow_table_extend_ct_timeout() extends ct->timeout for offloaded
flows using:

	cmpxchg(&ct->timeout, expires, new_timeout);

'expires' comes from nf_ct_expires(ct) and is a relative value, while
ct->timeout holds an absolute timestamp. The two are never equal, so
the cmpxchg always fails and the timeout is never extended.

This goes unnoticed for most flows, but a long-lived hardware (WED)
offloaded flow on MediaTek MT7986 eventually has ct->timeout decay to
zero, the conntrack entry is reaped and the connection breaks.

Open-code the relative value from a single READ_ONCE(ct->timeout)
snapshot and compare against that same absolute snapshot in the
cmpxchg, so the timeout extension actually takes effect while the
datapath remains authoritative if it updates ct->timeout concurrently.

Suggested-by: Florian Westphal <fw@strlen.de>
Fixes: 03428ca5cee9 ("netfilter: conntrack: rework offload nf_conn timeout extension logic")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Bente <adibente@gmail.com>
---
v2:
  - open-code expires from an absolute READ_ONCE(ct->timeout) snapshot
    instead of the relative nf_ct_expires() value (Florian Westphal)
  - change min_timeout to s32 to keep the comparison signed
  - initialise new_timeout to 1 instead of true

 net/netfilter/nf_flow_table_core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 3313f82..a2d08e5 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -500,8 +500,13 @@
  */
 static void nf_flow_table_extend_ct_timeout(struct nf_conn *ct)
 {
-	static const u32 min_timeout = 5 * 60 * HZ;
-	u32 expires = nf_ct_expires(ct);
+	static const s32 min_timeout = 5 * 60 * HZ;
+	u32 ct_timeout = READ_ONCE(ct->timeout);
+	s32 expires;
+
+	expires = ct_timeout - nfct_time_stamp;
+	if (expires <= 0) /* already expired */
+		return;
 
 	/* normal case: large enough timeout, nothing to do. */
 	if (likely(expires >= min_timeout))
@@ -519,7 +524,7 @@ static void nf_flow_table_extend_ct_timeout(struct nf_conn *ct)
 	if (nf_ct_is_confirmed(ct) &&
 	    test_bit(IPS_OFFLOAD_BIT, &ct->status)) {
 		u8 l4proto = nf_ct_protonum(ct);
-		u32 new_timeout = true;
+		u32 new_timeout = 1;
 
 		switch (l4proto) {
 		case IPPROTO_UDP:
@@ -544,7 +549,7 @@ static void nf_flow_table_extend_ct_timeout(struct nf_conn *ct)
 		 */
 		if (new_timeout) {
 			new_timeout += nfct_time_stamp;
-			cmpxchg(&ct->timeout, expires, new_timeout);
+			cmpxchg(&ct->timeout, ct_timeout, new_timeout);
 		}
 	}
 
-- 
2.43.0


