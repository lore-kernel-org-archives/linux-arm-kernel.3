Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF78CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 01:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkJvgTcI4nUUQ/9kKtwsMfSDSEk8uVrEpeWRMA7wuFg=; b=ePzvwSlXjHnV5L0r8hddYgPHVt
	urvuoqoWoWAfJSBuCZ7LXbHL3vEVTk+ZguYDFZL+4a/+eNYJE6mq+ClwGx69DEPEn7Ik42w0129uC
	5knwdST1ZlCevJLf24UBQz2cliYbk4DWiUigOXn45EKEbY7MMFdn1Z44yoU/sUFiRbcTmfT0tpxcz
	MTuY6onv2+EBT5RU4WCOG4anDME/bJ6Ucdwt5TWoJ0e/8PjXaKxRvefK2SZ98TU6/AWGFF+ofOcs6
	2DeRU5yjftzgQLUeKtavimBlrUZiB+7/dld1k/a8LIdqaTiDlbKvyvdldAkSG0U6igSInbUYmGmeo
	VU8MItXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJLny-0000000A57C-3rAK;
	Sun, 03 May 2026 01:39:34 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJLnv-0000000A53g-0mdD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 01:39:32 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-677f7c29af6so5365118a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 May 2026 18:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777772369; x=1778377169; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkJvgTcI4nUUQ/9kKtwsMfSDSEk8uVrEpeWRMA7wuFg=;
        b=nE3gUPUZlMbulnqWMbjoC3W2oHWVoD3pVW8c75gwikn41NCWGZBoOQjMlziA3Mfacf
         RdEwqRS9IyJGnNPQOyd9EG3qwypIxVn+0DmNlPaiwbbXDMcw3zqcr2q6j5MiXsvMq8wd
         tGQ4poNoeIoa3meC2EBdaxI5MxBh3A6ygbmvpfKy+xsYOY8+3fsfMnML7nA9cyGH5dml
         Gk64hP9alA9VY/k2wjOjWx+wNq94JGQgB5SnP6y5A/Uy4uP0zabSdXb+GfKzvSmH0dhm
         eA+BhTx0SJuP09HK8D3UtDLBJHEf09aKzWJkKR+gZcsBotC/NNERZ4SWYcKX0naxO5Bj
         +bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777772369; x=1778377169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IkJvgTcI4nUUQ/9kKtwsMfSDSEk8uVrEpeWRMA7wuFg=;
        b=E6N/ee2OTvfgKxJAdQm0OZ59L6xpve/UVNHu2B5kdvekbbf0RSozT8Rv7DfNQTWKMi
         WGI+cC4JdTpfwP4WaxNi7cj07HOr4FZAufYBCWUvyqAXaP/8Z8F4kS0qQn3oCG+CYdjp
         WuJrVXcuFEq/hyMP+KjQpVDk+4ZqIee8V3aZlm5SvepfWPyExoDZWQWSumZJTiCHs/wt
         bj9V9WPDWeBCKol2Id0U6WA5G2uAdoFtW3+xVwjCU4xIwaTGR36Cwg7efg1EOovMulD6
         FTYcilQ05ZJLGhQV1/G82CxndcjWRnK/m5Pyz5UMrivMPkz9Hb7g6kSPC7Q5QVYRh3na
         gxmw==
X-Forwarded-Encrypted: i=1; AFNElJ+o0pj5MzUI30Y1iZiDbLU063Zw6ACzCNGj2z3equ/DZJp7IeU2QiJN/1/dkrjTKbDzeX+beQMvQcWWVYUlJ03j@lists.infradead.org
X-Gm-Message-State: AOJu0YxL++f0Wvaglkp62Jec4vK5FlY+AM9xHPYOLTOVvCq7XHA4i9nm
	weZAiPHsI9YX2bhmXX8wemY7AZ3bbBeXijb/w7BkfVj8akmPikDt1LnR
X-Gm-Gg: AeBDievn72JeFmbCKVtmLQZEgdlgow7cmr0vXR4d+SWIk+oNUC+9M0cRGCG/Wdw6xSs
	h1gp/EKnvacPNLSPLW9GTF6W/aGqZgzj2ONvmaTIVNfC2IjRRDwzEnWmJAgcWh0S/7iZzq88spD
	ljxy6a19wDZBss4oYEmVFyXNhlWZuiH1eg4ZWGN1awb1JHaM2M1mCs/MYoFpg1f9QiGbMxNIaVH
	xXkl4zQVa4BRn+NCt7R7oasxdhRz4k+SoeQcVT62QUMcc21Si7yTqo7hzvIDgkVURhGA7DmEZXX
	Bc8VAQ0K1+0i6YJicMn+fs/IdvvTp/vcv04+QYB1ysqQp+eaENBcY21tUSGyE+p9l52YipB/bl0
	MM5E8y+bA81NnZVguXEbeJyusrdxlPOeZnuEyfUtWXKCKtE8VyNtTeAF+NopuHqgM9WujLcOUQB
	dhbhvOPst6qFUE2HCAHZnh0RxsctxbGkLxIe14PbZpiJc950aiv0nDmq/UTIhMzXzc/Vm8hl4bV
	auoa6EVMsVcA3ty5VwLQoT3r5t9
X-Received: by 2002:a17:907:a06:b0:bb9:c62:2c04 with SMTP id a640c23a62f3a-bbff9933024mr206200166b.10.1777772369341;
        Sat, 02 May 2026 18:39:29 -0700 (PDT)
Received: from KURWA.angora-ide.ts.net (mm-39-71-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.71.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1671c1d3esm24796466b.42.2026.05.02.18.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 18:39:28 -0700 (PDT)
From: ElXreno <elxreno@gmail.com>
Date: Sun, 03 May 2026 04:38:31 +0300
Subject: [PATCH 2/2] wifi: mt76: mt7925: don't disable AP BSS when removing
 TDLS peer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-mt7925-tdls-fixes-v1-2-dde847e21081@gmail.com>
References: <20260503-mt7925-tdls-fixes-v1-0-dde847e21081@gmail.com>
In-Reply-To: <20260503-mt7925-tdls-fixes-v1-0-dde847e21081@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Soul Huang <Soul.Huang@mediatek.com>, 
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org, ElXreno <elxreno@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207; i=elxreno@gmail.com;
 h=from:subject:message-id; bh=uAMNZJNELeTW91RepEFHxSC/5cFK8pGWTHntf3vPjy0=;
 b=owJ4nJvAy8zAJXa0WDmKX5v/EeNptSSGzG/LfVlS+BMnzPKMFGComFxwcnOSX4zj+c2njmcvL
 HFa2jGR+WFHKQuDGBeDrJgiC8+5vbU5y+qWTK7nyoCZw8oEMoSBi1MAJiLxiZFhqnGD+9dv22e8
 j+faISvyxHGrrHJ7m+aGV2l35AQm9F8MYvgf69L9rHvtLQuly6/WCE3Q4GHeHtf+XJMp2rL+pbb
 3MxUeAFDqRN8=
X-Developer-Key: i=elxreno@gmail.com; a=openpgp;
 fpr=0CCEBD7D6CA67EA4937F0A68C573235A0F2B0FE2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_183931_277899_7A7455A8 
X-CRM114-Status: GOOD (  13.94  )
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

On a STATION vif, removing a TDLS peer takes the mt7925_mac_sta_remove
-> mt7925_mac_sta_remove_links path. The first loop in that function
calls mt7925_mcu_add_bss_info(..., enable=false) for every link of the
station being removed. For a non-MLO STATION vif there is exactly one
link, link 0, whose bss_conf is the AP's. TDLS peers do not have their
own bss_conf - they share the AP's BSS.

The result is that every TDLS peer teardown sends a BSS_INFO_UPDATE
with enable=0 for the AP's BSS to the firmware, which wipes the AP-side
rate-control context. The connection stays associated and TX from the
host still works at the negotiated rate, but the AP's downlink to us
collapses to the lowest mandatory OFDM rate (HE-MCS 0 / 6 Mbit/s OFDM)
and only slowly recovers as rate adaptation re-learns under sustained
traffic. With brief or bursty traffic the link can stay at 6-72 Mbit/s
indefinitely, requiring a manual reconnect.

mt7925_mac_link_sta_remove() already guards its own
mt7925_mcu_add_bss_info(..., false) call with
"vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls".
Add the equivalent guard at the top of the cleanup loop in
mt7925_mac_sta_remove_links(), above the link_sta / link_conf /
mlink / mconf lookups, so TDLS peer teardown skips the loop body
entirely without doing the per-link work that would just be thrown
away.

Verified on mt7925e by triggering Samsung-S938B auto-TDLS via iperf3
and watching iw rx bitrate after teardown:

  Before: rx bitrate collapses to 6.0-72.0 Mbit/s, oscillates 17/72/
          137/288/432 Mbit/s for 30+ seconds, no full recovery without
          an NM reconnect.
  After:  rx bitrate stays at 1200.9 Mbit/s HE-MCS 11 NSS 2 80 MHz
          across the entire TDLS lifecycle.

bpftrace confirms a single mt7925_mcu_add_bss_info(enable=0) call per
teardown before the fix; zero such calls after.

Fixes: 3878b4333602 ("wifi: mt76: mt7925: update mt7925_mac_link_sta_[add, assoc, remove] for MLO")
Cc: stable@vger.kernel.org
Signed-off-by: ElXreno <elxreno@gmail.com>
Assisted-by: Claude:claude-opus-4-7 bpftrace
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 73d3722739d0..7220bf2c0afa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1265,6 +1265,16 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		if (vif->type == NL80211_IFTYPE_AP)
 			break;
 
+		/* TDLS peers on a STATION vif share the AP's bss_conf. The
+		 * link_conf retrieved below would be the AP's, and calling
+		 * mcu_add_bss_info(..., false) for a TDLS peer teardown
+		 * would disable the AP's BSS in firmware, wiping its
+		 * rate-control context. mt7925_mac_link_sta_remove() has
+		 * the symmetric guard for its own bss-info call.
+		 */
+		if (vif->type == NL80211_IFTYPE_STATION && sta->tdls)
+			continue;
+
 		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
 		if (!link_sta)
 			continue;

-- 
2.53.0


