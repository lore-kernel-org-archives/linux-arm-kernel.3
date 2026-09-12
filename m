Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C9EC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uLLbPlKs0eaia0hhi+j+T5BP0erZ1UFOrHpPsEsvnYA=; b=Tjlg5qXDtmqSLk7tkZJS2dqDpE
	XBOBXmpExGjf76AaayKY16XN4U/JvLk9F+MEU0H4PUpdtG6pTnQuOgMMiT/dVmJOf0R9muguJ3LsR
	dQjnbKPWw5iGj0nz7Hge0hgx/5QqzseOZpFyyNVUQmVLDBCJapHKrtCmTvi64C5V0RvQ/lRYA600l
	h8RBRhHds4S/7g7PSgdC+EIVcBIMylp3kJyW2djXTqdafCkDF4qxjDrekIO3N2tarIfk3odfojJYD
	XIFxddlLMES/Q3KQqmWHriGtyX2UqUX8Znm9TlqyEC7ORRQLo6izW/gbSHH3x1Uvxjgvxu8p4LSa7
	rLMNNFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5V6B-00000001DGr-48B9;
	Sat, 12 Sep 2026 21:17:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5V6A-00000001DGX-15wz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 21:17:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI4aUr3220341
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uLLbPlKs0eaia0hhi+j+T5
	BP0erZ1UFOrHpPsEsvnYA=; b=WKr5pMx4oqJuMQzKdl3Zf58VxP5VlSkg03WAHw
	rFNpxNzm0F+9V9qV6DXDAcR0sR9abAowCmU6P06/4Ls/SiCM19PBn/ihv5Tfr7BV
	c3b29C96z+F6KRz71br4npGvg6rteaR9Ohxsob0+aN2gjXURYmG42L/RBiNhqckj
	+WDN2As+lsn9DQJ7zd1037WVqKzldhR6R0NrmGy5/0aAeItrZ9NzS2F6S+fYG6cX
	kJ3J5ZDLoPx1XYpZ/rkvKOiAoQxZ1SzSGrrYcg0QfForuYD3XpGiDql09GRPX94J
	9qErcCESUerW7yeA/13/qxmQar964MC8BMpMhDqaqRJa5Zyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd1y6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:17:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0312937eso84487085a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 14:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789247827; x=1789852627; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uLLbPlKs0eaia0hhi+j+T5BP0erZ1UFOrHpPsEsvnYA=;
        b=W4WEdHT47lUyHixvvRK+VGJddZYsr1hNMImOwXHDwxudOBotvquGW/Ca81M9tnRpsi
         o0Ix8wL4fEXmhLM1YfZ/d0DbH64iTcr5VlRmqzNyY6nqhe9bGBeLprEDG128644474RG
         J3+hWC5CysEsax4K6vIWPm/95kHgHxg8VkQdx2Dsh3VOjTgFkHeHfihTsBE+CW5vVBqA
         dwyEY5mjqvQpnbi16Exgw+GrBKMsfhuFP4ShySXnkCb3KI4FrOLG01zO5NaYeeVborMP
         1WJBzmtAhIAcPfXwWTxiN/7f3ldX3C0vhuECW0U/D2Kd3FW0JKo+RJRd1UULyT+WmYX5
         P5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789247827; x=1789852627;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uLLbPlKs0eaia0hhi+j+T5BP0erZ1UFOrHpPsEsvnYA=;
        b=nFAlo+ZztuREp2tO98xXu05SoNP0UJty9h7jRsuqbEbUghyycLrKCEXCaZU38KY3wj
         rP78ERgbZvbTyoZjJx1uh2abrvXLaIRxnoIfxterWzwpfoE4/aWowcXqpSTug1YGaCWA
         7U0S650qayWZJ1ej1HJ1OMhlvcVi1S2FPG3/4XiKw8yxZgoQx5wbumiURpa3HUPMXGoz
         w/8qP+w1U6PWh9f8tVKjvJFdIwazryw85Nr4BvjwEFZJbI07C2ufFuTgsiDL799jxlOJ
         34u/YoYCovPVGlgyQF8g1r/+IMoV/w6VUqMXq7P8m5RH+xx+gIqTmGMSkOdCIY3q3yjv
         pY+A==
X-Forwarded-Encrypted: i=1; AKwUvBwQyIe7iLbXlJHvgsMvDj67+R4zSrtvkjj4zAa/RttLjrxUSAU9J2RjvYimbveY27zA0B7znHP+0bQmAdGQ2AEa@lists.infradead.org
X-Gm-Message-State: AFuF++mG5VsSQBx6f7rsfhx40NDN9TJCxrf37Ouv1E6rLAaKgrtkunko
	zIGL8zijvZoEbI5IoBOxqz8pR86275BuQbxW9ZBM4+m6sgFqZd4nRyFtxYR3gpMdOpm3s96IHnN
	3Y9554seyMTtRXtUlV1ZddiNMnsriNLFpHI6VYvHYB4oBUG/vb9JDX2W4O8FqO66YaT+HHgzXQ4
	5vaA==
X-Gm-Gg: AYBFou2HcT+/T84dT+cYibiXpfLcDSSPSQx8DMGW+JaHG41MeD/Kq3i/r+TVUEytPce
	Oix+n48E6BR0EK1mIAtsXLyxCTJOOi7Xx/iClkdmekJPqJFCOcbkN2yzS7Fo5qvqYzHDopy0d0s
	1HiD67i8qeJTbA8NFjDqiU4HSsgMpFkIJ/q/6gA1un1bVDKNHurKhweHdV0J3yk8bpM/k937TZT
	e9WRxDHYK3ScdTAXkYqjK82TAru0snvVhx8lg9qdn2PF2sNW3zKD+qhQunwiSIThiAed0791Tsy
	DYeMbwPsoPDFPBxz+R3SqmFMC1qvgFCGHizb5P56RlQQNUBa+e8PcC/PQjqP4prGOIFV84n5T/3
	ElT12L1Kbck1l9A==
X-Received: by 2002:a05:620a:298a:b0:93a:824:ac8d with SMTP id af79cd13be357-93a0824ae72mr586286885a.27.1789247827485;
        Sat, 12 Sep 2026 14:17:07 -0700 (PDT)
X-Received: by 2002:a05:620a:298a:b0:93a:824:ac8d with SMTP id af79cd13be357-93a0824ae72mr586281685a.27.1789247826890;
        Sat, 12 Sep 2026 14:17:06 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm454971865e9.6.2026.09.12.14.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 14:17:05 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 23:16:24 +0200
Subject: [PATCH net] net: stmmac: report phc_index as -1 when no PTP clock
 is registered
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-stmmac-fix-phc_index-v1-1-26e1ead25324@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMBDEviJ7dqHtQdGviIiuo+7BKq2IUPy7x
 WMgSaKIoIjUFokCbo16+Ay2LEi20a9gnTOTM64yjXUcr30fhRd9+NxkUD/jYYtpsY0ITF1RTs+
 ALPzbjjwu6t/3A40yBohrAAAA
X-Change-ID: 20260912-stmmac-fix-phc_index-1ebf19cce076
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gal Pressman <gal@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Carolina Jubran <cjubran@nvidia.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa5c159 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=N7w_mUtDbW-LDaCnSHMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMxMCBTYWx0ZWRfX7PM+WvCsErvD
 w3CMRytdY1kV4xii5wnGYWB/3IBHWMtEpk1kAAUviFJeWO7j6aQJc/q1xqyCQYcOYPfAV9VksX1
 NbpMYcnatchWyG76NqvtSSnjY+x6ua0Bf2h1Fka4Kz089GAgHvbf7kgN/DTf043khpyes9DhcyW
 0mvZFxmgq5vtDdm+rk53OTqxy9GjfxmZ6/S5APk+0btfsmeFaApoPTidFUMcHS5W7K4c/uD+/7C
 uQBCFYCb390z1tS1kZZxE1LxMEdoFEwjyBxH6o/raQzifIlmk/+yOe1CeNcknN8JROKTtEPF/1L
 fUgcYTzToL2L+e6IGS51+ZDfBqIHfYY0jwlCNc3vBKTw2Dfi93zYyC4rt5N4mzeJdYZeHWpS3co
 SZcU+I0a2HNwp+Gn+ZZ3VVGxBVxdzXgm6YVWzUmgDYO0wY+P4MC9H6HHaNGTvVslD4UjaJepX5h
 QrXC7DfOGpGc7dIMKVw==
X-Proofpoint-ORIG-GUID: vyMO6WLpbrTv6br-WODg0CQAFCH1YXS6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMxMCBTYWx0ZWRfX8sRf4+Jx6db7
 jK7E0fWvzOs5u/Fht7gBmsJieMXVUo3z970aST64gEjlrgt8204GGYF2/i5gujU9WKDbtM2tk2O
 w7jOzes+ZzWzIXbabkJeXXsVa1Fcxis=
X-Proofpoint-GUID: vyMO6WLpbrTv6br-WODg0CQAFCH1YXS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_141722_351993_87D41252 
X-CRM114-Status: GOOD (  16.07  )
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

When hardware timestamping is supported but no PTP clock has been
registered yet (e.g. while the interface is down), stmmac_get_ts_info()
currently reports phc_index as 0. Zero is a valid PHC index and would
make userspace resolve the wrong clock; the absence of a clock should
be reported as -1, matching ethtool_init_tsinfo() and
ethtool_op_get_ts_info().

Report -1 when no PTP clock is available.

Fixes: 9364fa7fcf12 ("net: stmmac: Remove setting of RX software timestamp")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 154cc0c7623d..eced707131cd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1017,7 +1017,7 @@ static int stmmac_get_ts_info(struct net_device *dev,
 		if (priv->ptp_clock)
 			info->phc_index = ptp_clock_index(priv->ptp_clock);
 		else
-			info->phc_index = 0;
+			info->phc_index = -1;
 
 		info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
 

---
base-commit: 78445023439506ebd83b86d40b1e428a3b309d4a
change-id: 20260912-stmmac-fix-phc_index-1ebf19cce076

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


