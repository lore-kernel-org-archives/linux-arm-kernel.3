Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B815EC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kWsWE2Tj4+vGczTIqCBItelo2Bdn45ZNtPYeVjBV+wM=; b=Th01K2cvjzQ1lyKLUJDrp1xPQr
	pkZo3vI9iUFY9Yb5REZcO96LSA8LsnLiJueo6SnQxZs2Mjj9XCNurm94FNCRtZeU5zZUXxGuBPyj1
	43TeOzK0UYu8BXxLE7svgKvTI8odilmG9q9M8RJS+Ijg2FnoFSXWOoLNJi3c7oVQU8oSi6fImSsb5
	gcITaCnXR/nlFO0zZl+UcJ09pX7EUSs4eOzg2xcj6nKb7w4xAiN0/YSpV8/mwJfy3xG5tz58RQ1TG
	L199b5slJkHvsDKeyyZ2dTcplMkCIcEIDVCJzAP1peBcaPGHDXhbABs5INVA+013jZP2aLL+bXDkP
	JjCt1UMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15TS-0000000A8eE-3JP1;
	Mon, 31 Aug 2026 17:07:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15TP-0000000A8dl-2Eyd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 17:07:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VGPUFj4073469
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 17:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kWsWE2Tj4+vGczTIqCBIte
	lo2Bdn45ZNtPYeVjBV+wM=; b=WrDcVwYscGtAiyqQuY6yerA+F5Idb0jVo4n/gS
	zU/Ochtki94ese9kCcE9FqxSe4AF8JwtNsAwL0RLcnCZ3mbna0ziPKZyZ+ynxws3
	8agHWDXI18zIgLAdPIMb8kCjt+rtxQ6mbvtq8kUS/5ha1sV6b3YwXewObKNtLVSz
	FnF6moEIMXK3uHA3eyu0qjM8MYD7MvLZ3HXW04l58uanHbAwW9MdLKJALrcJpbMl
	DrkvDrO+ACO8bdASF3Vi2EWmaPfeW4emCb7NM10uOqfOuZsWylrNZGfAMhv+pUpD
	wSDYG9J8e3OtEZGAL5ExX/POu1n2Wpj9MWlkt6Jucj0+FRpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dr6y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 17:07:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494527488so632357685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788196026; x=1788800826; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kWsWE2Tj4+vGczTIqCBItelo2Bdn45ZNtPYeVjBV+wM=;
        b=gtuC5m8+oI4mcWYsOT+wXL1EQQo75N3mD1xDL2NTQXGRxG2Ww9kijPXOuPD4qkGev2
         mSMxV33j1dAjrgKGdM/cVidpND4S0SJ644eHna7FxIaW/qlyPSHyK9FQlws4AtuCBe20
         EqQmdg2DbO+UlXEVorEu1ztLntDu25LelekixSCTfGyxP4t6iAfFMgodQ8MJ/ofumvXn
         xgL0vidhDrsD3OgAWAizs6+qxZgSTJGPBytrkwtAfLjvGr1PiqDSvFQnpfDvncG5fSHs
         XDqyXYcSzsa/MEP7k/+ryxKcGKQjlqhJoQCYMrUNGMvJZktOr9Oe8xG5hocFM+/uiPji
         sVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196026; x=1788800826;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kWsWE2Tj4+vGczTIqCBItelo2Bdn45ZNtPYeVjBV+wM=;
        b=HxXksVcDBqr6zs+L66f/7j8wXu2CTh6fBY+kIn/7jDpHyBDTC1U5U9h70iGHDiAUEQ
         cu4rxEV+IKBrXW8iIWSLKHMwlAo/YoOTEeZy3y/Lkbg6iitaE/fR8BZgctbkldYhZDGd
         MDdLSeQkIpgz8zwwYMsaU8m03z6+zFCwZXzHYCGM2024gTNYrcIJJjjy3SBpjhTWQa5b
         UqlkUNjweBNyIXKBuT5y/9Dk872lIe3Z1g8RoUObOI+Yp2KHU4ye4q2AHaePH7G/zZBF
         5Xa6f3+naY7ppWDmNu0miX2iEBYcGPpGzndz+L7t9M/7a3gP56x1HPZ/OKrKMzXErkoa
         B3xA==
X-Forwarded-Encrypted: i=1; AHgh+Rqx9JnSZidl6sjjbmUTwaHEOdHIdwhDTakaA9mId5D9ig7TcpwjVFvcDfUlJkNFqWg0WR8UYGUX7UsjEajoah/m@lists.infradead.org
X-Gm-Message-State: AFuF++nMJ8UEEnjEWFDH9YvBFY57DlU1YzPGw2/Xy7+NHr0jlLbMVKbT
	y9jG9tCbpt9y96DvaEeTSC+NFmiZbL7+4mj4zHybYgXBXFvuucFl8mIrQa2Uq6tMGQutBe4gmjZ
	p73ZS+RXyGlJTBu4LmQBe5rpNlyWeMeWWX5J2ZQpzB38b72tCz1fwEsvadGBv6vR/2nnnivQxav
	j4gUAyxUIKKg==
X-Gm-Gg: AR+sD12qu/R/tut6VsJ5h+8vk+plenGiDBOeqDDoD9Scjegv2fZHdcCYQBeZZij5QrI
	Nav8+w1HiqOAMvVHgQbt7exjVOnSowETd8o3R4GrGyAfmzH5ub8elSs4saKRXbiogtYPkHooyn5
	G8btAuDbidqNxSxx0yidCe+xOgb21aKw0rQJUwVxHPkfO3GVlzQTpBSvJ6JxqYpr7eiBLgY1EcR
	/sF7CptFKdEvoetXdLmygAeFQts3+lI/dxUlGHB0OFLP5i+evJejV1qqYizsVpza3/8iKKbIq++
	AnvLCM8U7AoK/fL/gonvJ3HxW1XLuaH4EFMIpcl1k033EL3ZDipq7WaUXpu4C+o82Xf9UWOFHFo
	7SLvsDxBbzB0Bxg==
X-Received: by 2002:a05:620a:27c3:b0:939:e62:bf0c with SMTP id af79cd13be357-939137af559mr3428179885a.4.1788196025622;
        Mon, 31 Aug 2026 10:07:05 -0700 (PDT)
X-Received: by 2002:a05:620a:27c3:b0:939:e62:bf0c with SMTP id af79cd13be357-939137af559mr3428167885a.4.1788196025134;
        Mon, 31 Aug 2026 10:07:05 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1a3fesm5455835e9.12.2026.08.31.10.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:07:03 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 19:06:38 +0200
Subject: [PATCH net] net: stmmac: reconfigure RX packet parser table in
 stmmac_hw_setup() after reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-stmmac_tc_cls32_reconfigure-v1-1-21cb459e64ae@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MUQqDMAwA0KtIvldoK07nVYYUF6MGZpWkykC8u
 2Wf7+edoCRMCm1xgtDBymvMcI8CcO7jRIaHbPDWP21TOqNpWXoMCQN+tfRBCNc48rQLGVd/sLL
 WNf41QB42oZF///0NkRJ013UDz/UCFHIAAAA=
X-Change-ID: 20260831-stmmac_tc_cls32_reconfigure-17bc5001829d
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a95b4ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EO0qJuiELdOth16Gsj8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0OCBTYWx0ZWRfXxmtwQGQUSTIM
 fgvoN7gITo+WrcVyDnTMRbBQXCyRBb+Jw3xd5NvssDkicex6Yl7RtwLxSlKh/80ZrpO2wCwysjN
 eMTeZfVCm/9fW7OvK6UIIO82iLV6gp2mdUIgJ0aO0Gfm37oD14JBJnlTBHiPPakWMxLzO7bv48s
 LfKAW1v2KdGIGDcNX4Blq+QcfAglafKOefsJrId0JlVTylWOE/FZgJgBQMh0eF8NTvoV601R41m
 fT0TFd/C36vutv4S5O1NgURmhPCAtTLrBU9B7bh6MLzgqbWMLCtCHoMB/W5g2perSSyKZSYAO4+
 OQ2tBcMijPlq5L6kjpvP6cqQF2Z4H3j8eag+1zQl79pz3MOlibLYonhyOVmdxJyNCdOauOPvumY
 NTResNBkjYdLUGoUDa+zF7qwNGwK0ii9FpEw163jzITrMO/rr3qXL6mide7PP0Ypk1PN1dmZTyh
 FA6IoOIG7sY9sZ5RCmw==
X-Proofpoint-GUID: Le_u7Vr6Fpj8eNt-JUByMghIy9Ks6c4R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0OCBTYWx0ZWRfX5/nLj4rOgdhI
 nQ4JvF9bSKXluj1yDBcjCGwIGcs8iLk+AUvLJuhArsJU+jUhEdhD4bTkVgYrRmt3BOebegtK0Z1
 RRbBvTXjaZe5xNlTwFRGlk7kz6DQSec=
X-Proofpoint-ORIG-GUID: Le_u7Vr6Fpj8eNt-JUByMghIy9Ks6c4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_100707_699839_2F3F7162 
X-CRM114-Status: GOOD (  16.02  )
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

The core software reset issued in stmmac_init_dma_engine() during
ndo_open() callback clears the MTL RX packet parser registers, but
stmmac_rxp_config() is only invoked from the cls_u32 add/delete paths.
After an ifdown/ifup cycle the hardware therefore runs with the default
all-pass table while priv->tc_entries still reports the filters as
installed. Re-apply the RX packet parser table from priv->tc_entries in
stmmac_hw_setup(), right after the software reset, so the filters are
restored when the interface is brought up again.

Fixes: 4dbbe8dde848 ("net: stmmac: Add support for U32 TC filter using Flexible RX Parser")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d576059c04df..24656b35350b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3676,6 +3676,14 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Initialize MTL*/
 	stmmac_mtl_configuration(priv);
 
+	/* Apply the RX packet parser table */
+	if (priv->tc_entries) {
+		ret = stmmac_rxp_config(priv, priv->hw->pcsr, priv->tc_entries,
+					priv->tc_entries_max);
+		if (ret)
+			return ret;
+	}
+
 	/* Initialize Safety Features */
 	stmmac_safety_feat_configuration(priv);
 

---
base-commit: 1376afc7660bad2a1a5ee0876898312a486cf8bd
change-id: 20260831-stmmac_tc_cls32_reconfigure-17bc5001829d

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


