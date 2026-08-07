Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBF1C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mgSv8+oHtpxPxVfoRcwvHzb7euoA3AH08sFzhJMyAUA=; b=g+qN/CX+iI5pyxS7pu1EWHb0C5
	snt5B0KapvRJB49zbgZ3i2mqm64AyxpmzCc9V4N9gva4awgdmUUokkXFkjPdiAuLXI6WzojM6GhWx
	uI3snoQSzh83Y7GxnnAhhCWcOFEQJEZTAKRMriYTsjD3p9iiSxQHmKxGJgDpxQCnGRDRN3qrJT1Rg
	bpnOqbJ7xOlQ0fGA1PSOtcMUz9XQ5XAq85dBzEWocJ3TqedETtNTxXNS0tNVK/gAQnt6gM6AfhAj9
	i7gJpC9ptl+bVlMXPxBldLcvroPV3E+tWLpJPVPX2hAwiNSdNnRUN3seIB8QoNFZW7iS/4x6Pju8Z
	qzPX/BDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJvN-000000081uz-1nUr;
	Fri, 07 Aug 2026 12:43:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJvK-000000081uP-0d3b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 12:43:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677CgDbv263889
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Aug 2026 12:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mgSv8+oHtpxPxVfoRcwvHz
	b7euoA3AH08sFzhJMyAUA=; b=Kke22YSBGxqVOG7uQykH2NywrhenohZ+X0TrC5
	4r75G3+h5jUWYvvcbijKTPP8ThUa2HFSQ9t92s+s9G6kiz7UX5hMVozCiuGlkFtu
	8sP75ct/HY/38p5De2n0oH/64FbyAzqbjKr8FJTz8v0mlqy6SlPOt2vrk9MDEdu0
	1zz7BUKb5388/x/TMA+DHWWuXKXs3ItjQzu6uH7kt90mgU+9sM33skCdDkTyBrcJ
	dkUBj0cFb6j/tPyDJXZ8vK7FiPIoKilFRd4/M4vKCOFQTI+M5zODOquX45krL9Xw
	fXx71nsFaiZqEu8sub2BEoNuerOxKWJ3NyNEMtTl0VERCFaQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu1cgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 12:43:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso36233631cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786106620; x=1786711420; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mgSv8+oHtpxPxVfoRcwvHzb7euoA3AH08sFzhJMyAUA=;
        b=VJIPSN+XbfjONt3Zf4qqldx/MuInitwvckfsILUYzpZV1ql381sRFFpuErDzaeF4Ai
         u91xgyHEeKmlfiQfi0ovnKTjBXwqsci5dkxLI0ry8+IzqaHFFn33kzJetDGeweGdGb45
         w9tPpE25FxCaHQUjj/1aryz1qG1rGAiWUEQ9sD/bJNeM36ZfhuAorFHeTPuJUax13Bgs
         mKfd5JPBThYqpnkaZhXA7vzGbgxlR/JuGVdENBmLb8pD9OfqK0lkpje/5B8L9LkGjwfm
         V/Vi/GB8r0Zy/Acuru0KC+c27eCg6GKmtt5rhLQccFFBqJu4hhfFhcDUY6iRaMXfmWjN
         C4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786106620; x=1786711420;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mgSv8+oHtpxPxVfoRcwvHzb7euoA3AH08sFzhJMyAUA=;
        b=TafoEl5Q+2/0WOE0IAZ2kFC0LmcbBJIe7XAOndCVU0KImuGh8Sb8/1deDw+GhztEZm
         dcIxcRdmcBjKbqsGZCIVBYI/Y/o9/ETw+/BnB1+7o/yoRQbrS9ZoMcOqoDELHwKy58xc
         3sgH6atOIfuJeD762hYycabCr+gGRfYQ6S09D/726miCLp6aR/olST92Utoox32x3von
         KdqwBUWTW/j3x1tBxsB6urLbDfaQgid2oWpTnrDHyhnCccBv+DHSzd2dHwN6mg8h3isC
         Nkf/MDQis/A5wosr0lTVJh3uIvunZLVFUYPMW/KvVtMfZt1/Skp0UK2YUXGSAtXXDHHc
         BSWA==
X-Forwarded-Encrypted: i=1; AHgh+RorQYDYE1vEn2vskra614aonITr9EexM1KLbsCkyB+BuaNa5jJ1+cTSJawkEaUXeScu3diEyP9DsTJNzDbDfO9v@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2pTgvSx/eDm2qd5aCOt2FxCnkjQLVHgN2J3zZ4rLNBKh4cRJ9
	oZQr9QEaa7qM1IRygDEuYawDHC0JRjsE+hYL8aBMisgeqCAyYZjRzy+0+0pe31FBRNS4pv20hTa
	bKiqkyrbXghtID8NQAMUJVGi2r8V1ajDo0cIJUHoSiA9IILeBfokZgtN/IbljK4WJDVXsN7DHi7
	0Hsw==
X-Gm-Gg: AR+sD10WnS88lrFxmcK4WwK6fTdVD2CgFOs7WkzEIvkSoqps8Ic2lY65aWqwnSjI562
	TIoh8JEzQjqFko+Xc7tgyG7kcENyEwyQ5ch/e52hqf1YRTKWNP13W0tnVk6XvuFx5HYg+9tDuzZ
	OK6oafIq9OKB8BzOpChsnzzydg+tpBFMPwTe/h9m8yNaCt+8cvAYzu9l+AOkFqlPPN/y4Jc1pyi
	+OT0xGO/8gdhFMOQbcF61Y4jlIIzdIWdQZSH8N+upxQxCkVt0rIkl05tzEy/W89bChA3+n3FdYo
	JxrXvwHWNxmnUMLGCDGuwE6R6ZgpKAmYrMpAKMm8jeA+mdxgE9HEEeCJogn3Kteh/WXASJpTF2g
	mgV3G/zOBIU+wRmY=
X-Received: by 2002:a05:622a:64e:b0:528:583:a6c6 with SMTP id d75a77b69052e-52d18e1b942mr26001491cf.6.1786106620538;
        Fri, 07 Aug 2026 05:43:40 -0700 (PDT)
X-Received: by 2002:a05:622a:64e:b0:528:583:a6c6 with SMTP id d75a77b69052e-52d18e1b942mr26000761cf.6.1786106620072;
        Fri, 07 Aug 2026 05:43:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9f060bsm39042535e9.7.2026.08.07.05.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:43:39 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 14:43:01 +0200
Subject: [PATCH net-next] net: stmmac: improve TSO/GSO queue selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-stmmac_select_queue-tso-fix-v1-1-4c4787bad02b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCQAxG4auUrA3EQcfiVURKSX91wE51kpZC6
 d0dXH5v8TYylASja7NRwZIsTbnieGhIX31+gtNQTUFClFYubD6OvXaGN9S774wZ7DbxI60sUfX
 cxuEkIVA9fApq/t9vlOGcsTrd9/0Hklx9k3cAAAA=
X-Change-ID: 20260807-stmmac_select_queue-tso-fix-06cc586d4022
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: oy82DCpMUQBMfiHmulaRPJJgsrio0Ch0
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a75d2fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nGs_K6xH0Xy296EihTkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5OSBTYWx0ZWRfX1qbzY5hu7z8Y
 HELe6XQZeQ4ZTucOAYcfHl+1+VtA6KgZmgEK272avmUFRWZkk1+JxMgAYcOOYsKjYrxc+gbjJvx
 cijTqIQuDXAvO+KjB3pthH613zRniT8=
X-Proofpoint-GUID: oy82DCpMUQBMfiHmulaRPJJgsrio0Ch0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5OSBTYWx0ZWRfX/jDtvQIl5mfc
 0ZjKDIVP6RtEFRcVN3kBvKsk3K3uWSYp6xBlqh8l/JZ392mu+awSwsrzpshqDzNt613IdAbS2jO
 E6VaKc6iKhfsEmFUVP/n1jJpr1qLBjknINyDU7EA2WQnybVaw7qwz4ByViKsO36jl7Vl/jYiEeY
 iHlxWBtFnL2MORSPk3pDhp/1w1/c0apmg/e9WfAeVBElMfUa+cG5AGCJrJRFOtpqiWeo2JkCzZC
 xqxkH2i3gbesUjOOKL4cQ8Ki4/h+Kg8d0EDpn5Kq1OhGLY7gytoU6cQatYHAleCwiswuzHzue6+
 aLHZsSa1MF0axpGcxTCIQ8+cYSMDHX/zY6vr5fbbBtBGGOGZSwx1nflKFx1RFhGcCitCvC6Cx9E
 /bunNmDCZqcksZxlNYN/d0lFnFCR3vbTu+/OnNfbCBl57zrpDKngIzjfiTGH77lGxB7grfkphZF
 nxJGVObgT5jmkaFiFBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_054342_195589_85ED3A21 
X-CRM114-Status: GOOD (  17.43  )
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

GSO (TSO/USO) frames are currently always sent through queue 0 since
the driver assumed there was no way to determine which queues are TSO
capable. This unconditionally pins all GSO traffic to queue 0, bypassing
the per-flow queue distribution and any XPS setup.

Instead, pick the queue through netdev_pick_tx() and only fall back to
queue 0 when the selected queue cannot run TSO, i.e. when TBS is enabled
on it, since TSO and TBS cannot coexist on the same channel (see
stmmac_tso_channel_permitted()).

While at it, base the check on priv->gso_enabled_types rather than a
hardcoded GSO type mask, so it matches the TSO/USO capability actually
used by the transmit path (e.g. UDP segmentation is only offloaded on
GMAC4).

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b2b7d0242dd3..99fc7313f247 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6445,19 +6445,18 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *skb,
 			       struct net_device *sb_dev)
 {
-	int gso = skb_shinfo(skb)->gso_type;
+	u32 queue = netdev_pick_tx(dev, skb, NULL) % dev->real_num_tx_queues;
+	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6 | SKB_GSO_UDP_L4)) {
-		/*
-		 * There is no way to determine the number of TSO/USO
-		 * capable Queues. Let's use always the Queue 0
-		 * because if TSO/USO is supported then at least this
-		 * one will be capable.
+	if ((skb_shinfo(skb)->gso_type & priv->gso_enabled_types) &&
+	    !stmmac_tso_channel_permitted(priv, queue)) {
+		/* GSO frames need HW TSO/USO, which cannot run on TBS queues.
+		 * Fall back to the queue reserved for TSO (queue 0).
 		 */
 		return 0;
 	}
 
-	return netdev_pick_tx(dev, skb, NULL) % dev->real_num_tx_queues;
+	return queue;
 }
 
 static int stmmac_set_mac_address(struct net_device *ndev, void *addr)

---
base-commit: 4fa4977a0d900f936bcae5cd2c510be5554e8dd6
change-id: 20260807-stmmac_select_queue-tso-fix-06cc586d4022

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


