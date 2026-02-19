Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57E8E9A05E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=; b=MPYE1GZNZBIRLv91LgPFxyERhM
	N+WlpuFjcr4lB3ij4cXk/VcL1CPnViv1Hxo6g0ONfYCTuRE1ibJlB/69H49gCFo3Zhh5qS7hIBUqk
	JFA2kHr21Epct/pIv64wD6qn6mJm5sLqdBEzH057zweUs/ZuabcbE/3iYfbto7ycg7vQ/GZyY+L61
	O3pUWwWvoipZCOtqi4466Hz9dnICS39OOyWkRXduKG2LdZlMPBkuiTOTTGNCzFyPcBO9USJ553cdB
	7hDLPrWXUoOIMyVXVzjkQxq14qEx2U2d39rpXKNCQ5Z6ynt79xQPBJ7SR5XUO0HiHi/sMc1uE5W+B
	WpJHMriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9vX-0000000Brji-3Xa2;
	Thu, 19 Feb 2026 19:43:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9vU-0000000Breh-1CRX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:43:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCphpR160557
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 19:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=; b=P49TaiinQnf3Zapr
	kl0aQrMx7MQCzXDWhzNBGjFa4GzzO/I4lQvuwv3gn7t/7dpgnEnkeel3bzzDzUg4
	pLJSxmJrd4JCG/HxHovQxHBl3sphHqMcvXyngw+pFxISyHvk5VEqmmRJewTGRgHc
	VLqDrcUcqo68tT0NYr26VQc1dR/U0X0HKfIbTO6hXpj/Ikr/Os1OuMpojd8N6Yr9
	0AkfS0F3ztsEz43MAlkJ0hwqQXloESXfWNiiOe8YFnGejoSCV4D+6I0b+oNlTebv
	igMzu5rkmODUW1b+cOLY66Yw7bCZje5NqJfSsxF+iS0O0fvo8v68jFu4m/ADArv1
	Qnn0tw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrpgarjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 19:43:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ab0b2e804cso15446735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771530182; x=1772134982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=;
        b=a7AQtAknyzkzENFn/A81UdjTP6y3BaMlJePmve1HlGO7u9BJk5iS0+l2IztbhYyVHw
         MO0ACMHlJoYIbJWgeZIdwrjGb3gsNh/2yGCDmC++t5U5bpQj6zh4mtOe9DSPfn3KtjqP
         fQ+eRBLzdfTKQ9CA4qPX56H4rvE3f5dI2CH1F5KL+7SlK0X4684ubBEuw/S8cBJqykbL
         x82soj7WGv4SeA7l4ZPJ/Js4rthBPG5DlzUen6fwXJNeYDZRFVSr/41qNBxj7fkq3pv4
         9dWhSp/37S9hM5eQHQMeyCQVCNKQKqFkrc1Tm3l/v7y/gvICbfplUhWaq8qeHvPiiZyT
         GhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530182; x=1772134982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cw6oegE7BJrIH7ye5GHNWs5b/IUa25g+uNiuS7o/4uw=;
        b=KJQ7klCMA0kUomLIfMP5+Vkt0fgqJwkFivAaoo37NbiUZQUgi4f+J6NxdIlYEJ1wVG
         I7Ws8LGKt6tcFJ93q+RfAlxlWT59P3yp6Tsm7n3FjgD7nuIbAHp4aCbDE6A8RdGkJQ8E
         02TCYlnxn4oTUdCs2m6eds5H9pdU7qRniXHsopHNEswQMkHo5zA4I6Zfp1sUFlXn7nSZ
         YR4ADcQY0Ij0lz0XvpuZjC8aIsoIljGLpRm7mCBgeMtX0EYyERpEwBXCZy+llW82BGxw
         GgZc/d8vrdgK3Flbqz1WjbHBlwf7XGznRS9ra2qzlitcKa7oizwV3q3ygjds5FsMwgeH
         GFhw==
X-Forwarded-Encrypted: i=1; AJvYcCWmqIa08SnCyKhWtiNQDrnzhRFGozTOClBpp0/KXZrO6hLvClhAt/FjXVniClmHvGc2oQQk07yPjorFOVZnQYTO@lists.infradead.org
X-Gm-Message-State: AOJu0YwhgqZymBxKvmdO5efKjbBAwr1lgyTXy2ulaalaNZy2le3MZLii
	PtzSvz/1Ot1bSKht999M74/q+MdNquZYOnO83xnHg+PJqzk8lVHVbishXdkduhxQpyvA9liX3P0
	DGz9clECKBrQ/lvzxW/VKQY6S/lo9MlHEWIvp56dFzTH//EoFT31soavKMRvSdd1GxnMzZOYlpa
	VLeg==
X-Gm-Gg: AZuq6aI+pq2/06OG3qqGUvji3Z8XeSyQ/WFZq0xQ6LsrI+rYEZ6AJUzZd/syBQ82hbt
	0krA4Lu4qROGcq93DQ1qEGKVR84riZLyGkrDp75mTEXcz2cyRuQzH/jntcKsTVZGkI+UP4HLRGM
	f3pzmMaDflC1R8OIDCuyMeXUhV9Zto+lVhm+InZZL+enKSRP6H2KAKbOXK7X+LCq1rVQJlOf6Ld
	Pi/smOE5nAkZyMNiabd2zmuJKeGu7BImbhKg+cXioqWFjFmrFTy9DChsWq4G5O+vcvb/7bvS762
	nieWPeWK/n3XbueBcXXRF/ZxdFUbG2XeOWGq3xQKtAxAa3wivjlTsgOQx5ihny7DY7wPW7/xNiB
	9KNBHmbV5PfwrqsgrJS+F261YUeg9YmXx4khWW8LL1OGlx+mvirgyTntkEkhCV3X73clBIfX/kP
	HGbSH1HjLxVWi1tQa5oOgu2Dd/Pb9MgmvibCsvxN8=
X-Received: by 2002:a17:903:2ec3:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ad5b144c92mr33071685ad.44.1771530182053;
        Thu, 19 Feb 2026 11:43:02 -0800 (PST)
X-Received: by 2002:a17:903:2ec3:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ad5b144c92mr33071375ad.44.1771530181608;
        Thu, 19 Feb 2026 11:43:01 -0800 (PST)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a712ed9sm264404225ad.20.2026.02.19.11.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 11:43:01 -0800 (PST)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 01:12:42 +0530
Subject: [PATCH wireless-next 2/2] wifi: mac80211: fetch unsolicited probe
 response template by link ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-fils-prob-by-link-v1-2-a2746a853f75@oss.qualcomm.com>
References: <20260220-fils-prob-by-link-v1-0-a2746a853f75@oss.qualcomm.com>
In-Reply-To: <20260220-fils-prob-by-link-v1-0-a2746a853f75@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Sriram R <quic_srirrama@quicinc.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: IkF_mJ2s4vCby3qMxG6G2RgQVufc-jFL
X-Authority-Analysis: v=2.4 cv=JrL8bc4C c=1 sm=1 tr=0 ts=699767c7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tVayKBx9Dmlhv4CN5F0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfX5GwHaq+UmySX
 3da8CIED8uS4vb68E3uRDJC3wTcCP19ItUxaH7TYiXV/ooqKY5AL8HbsnK0JkAyFcOn2yFCTuvD
 +b7k1JpSRFuTdH/DZx0MdA3vZR5AexBr+vvbI37709l5DVPQyNA5KiWvIEh9VXrHqqfnqtbj00k
 FJelvkTLqvtDv2O9XIx+q9iLgtZ7ud0vloZGm0ptIuMxvs4QWrIiWdk18AzpnCgyXRLSx5hkiWv
 kwU26vOfjzAxij5Y4AEloOFhWN/KHxu4NSEpJ48yJz14q4BEYryX407+/v8aGneJfl6ojBi18sj
 1WbSOtlmT0GlE4djIbMXBt7Hjp0eFKZrllx9XVi+Am6/zRxvhJtK1P0dR4rMQtN9nOjgIgHtZDF
 5qK98QO27EhlSbmBOEZ1IZNXO0krcwL2gZbFiMEnCnP8YEW1J7saULVMaenidOps8M7KvAC+/6t
 LViYydHYkoPqD/jmWAw==
X-Proofpoint-ORIG-GUID: IkF_mJ2s4vCby3qMxG6G2RgQVufc-jFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_114304_842332_6ED58BF1 
X-CRM114-Status: GOOD (  21.89  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Currently, the unsolicited probe response template is always fetched from
the default link of a virtual interface in both Multi-Link Operation (MLO)
and non-MLO cases. However, in the MLO case there is a need to fetch the
unsolicited probe response template from a specific link instead of the
default link.

Hence, add support for fetching the unsolicited probe response template
based on the link ID from the corresponding link data.

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c           |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c           |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c |  3 ++-
 include/net/mac80211.h                          |  4 +++-
 net/mac80211/tx.c                               | 20 +++++++++++++-------
 6 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4776bb6fc889..d9b5eac6c7bb 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3314,7 +3314,7 @@ static int ath11k_mac_fils_discovery(struct ath11k_vif *arvif,
 		interval = info->unsol_bcast_probe_resp_interval;
 
 		tmpl = ieee80211_get_unsol_bcast_probe_resp_tmpl(ar->hw,
-								 arvif->vif);
+								 arvif->vif, 0);
 		if (tmpl)
 			ret = ath11k_wmi_probe_resp_tmpl(ar, arvif->vdev_id,
 							 tmpl);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 34f82cda4197..b281f81039fb 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4320,7 +4320,8 @@ static int ath12k_mac_fils_discovery(struct ath12k_link_vif *arvif,
 		unsol_bcast_probe_resp_enabled = 1;
 		interval = info->unsol_bcast_probe_resp_interval;
 
-		tmpl = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif);
+		tmpl = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif,
+								 info->link_id);
 		if (tmpl)
 			ret = ath12k_wmi_probe_resp_tmpl(ar, arvif->vdev_id,
 							 tmpl);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 83ce06857a1e..2d2f34aa465d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1981,7 +1981,7 @@ mt7915_mcu_add_inband_discov(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	} else if (changed & BSS_CHANGED_UNSOL_BCAST_PROBE_RESP &&
 		   vif->bss_conf.unsol_bcast_probe_resp_interval) {
 		interval = vif->bss_conf.unsol_bcast_probe_resp_interval;
-		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif);
+		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif, 0);
 	}
 
 	if (!skb) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 795a294fa904..c3cb4a33cb3d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2868,7 +2868,8 @@ int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
 	} else if (changed & BSS_CHANGED_UNSOL_BCAST_PROBE_RESP &&
 		   link_conf->unsol_bcast_probe_resp_interval) {
 		interval = link_conf->unsol_bcast_probe_resp_interval;
-		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif);
+		skb = ieee80211_get_unsol_bcast_probe_resp_tmpl(hw, vif,
+								link_conf->link_id);
 	}
 
 	if (!skb) {
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index d36c14a86c8a..89027e94ba5c 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -7781,6 +7781,7 @@ struct sk_buff *ieee80211_get_fils_discovery_tmpl(struct ieee80211_hw *hw,
  *	probe response template.
  * @hw: pointer obtained from ieee80211_alloc_hw().
  * @vif: &struct ieee80211_vif pointer from the add_interface callback.
+ * @link_id: valid link_id during MLO or 0 for non-MLO.
  *
  * The driver is responsible for freeing the returned skb.
  *
@@ -7788,7 +7789,8 @@ struct sk_buff *ieee80211_get_fils_discovery_tmpl(struct ieee80211_hw *hw,
  */
 struct sk_buff *
 ieee80211_get_unsol_bcast_probe_resp_tmpl(struct ieee80211_hw *hw,
-					  struct ieee80211_vif *vif);
+					  struct ieee80211_vif *vif,
+					  unsigned int link_id);
 
 /**
  * ieee80211_obss_color_collision_notify - notify userland about a BSS color
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index f547cfb27666..9f2363a34511 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -5874,21 +5874,28 @@ EXPORT_SYMBOL(ieee80211_get_fils_discovery_tmpl);
 
 struct sk_buff *
 ieee80211_get_unsol_bcast_probe_resp_tmpl(struct ieee80211_hw *hw,
-					  struct ieee80211_vif *vif)
+					  struct ieee80211_vif *vif,
+					  unsigned int link_id)
 {
 	struct sk_buff *skb = NULL;
 	struct unsol_bcast_probe_resp_data *tmpl = NULL;
 	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
+	struct ieee80211_link_data *link;
 
 	if (sdata->vif.type != NL80211_IFTYPE_AP)
 		return NULL;
 
-	rcu_read_lock();
-	tmpl = rcu_dereference(sdata->deflink.u.ap.unsol_bcast_probe_resp);
-	if (!tmpl) {
-		rcu_read_unlock();
+	if (link_id >= IEEE80211_MLD_MAX_NUM_LINKS)
+		return NULL;
+
+	guard(rcu)();
+	link = rcu_dereference(sdata->link[link_id]);
+	if (!link)
+		return NULL;
+
+	tmpl = rcu_dereference(link->u.ap.unsol_bcast_probe_resp);
+	if (!tmpl)
 		return NULL;
-	}
 
 	skb = dev_alloc_skb(sdata->local->hw.extra_tx_headroom + tmpl->len);
 	if (skb) {
@@ -5896,7 +5903,6 @@ ieee80211_get_unsol_bcast_probe_resp_tmpl(struct ieee80211_hw *hw,
 		skb_put_data(skb, tmpl->data, tmpl->len);
 	}
 
-	rcu_read_unlock();
 	return skb;
 }
 EXPORT_SYMBOL(ieee80211_get_unsol_bcast_probe_resp_tmpl);

-- 
2.34.1


