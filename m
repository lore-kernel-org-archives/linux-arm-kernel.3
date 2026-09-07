Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CD6C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=; b=2uoID/qQbLe9Kjf+KP5yhzuPLQ
	B3pdM3W8biYk9U1kgBR/3aDyRuYxH5b84ZbjBPjYWkVha21YgyFMVxjXK9j0BBdZbTO9AezVKjgmZ
	L28oKB6t06P/icfbvaUqTPVurNalCJWBxGmfI0GsIa5VZKFkBrE1rZEwrTMxqT4RcvsMHoQza+bav
	MhQ7qsCeRuyOV3F5/A53+Rjf4uQxmKjsBivEVQx3kOB0z+EWvVlNBeoSpH5kPgVOFThwIXfeE5Duo
	jPcPe2vbPOxSO+655MQj4aZwR8VzVOdGNu+9S9CrscYwrwtEorjk9GrQx26LqydTjysF/8HXMPl41
	Bc0KVcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ftR-00000007hNu-17Kq;
	Mon, 07 Sep 2026 20:24:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ftM-00000007hKR-3PVy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:24:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7pS23484715
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 20:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=; b=AI5J/XubM63NeOJ3
	Q0bl4Hg1WHZkUSuOSn8ZBIYajlndQ972eHqh4oLnplJDTzTB0jiFrdTRBjwWFKs8
	2sC/wg6jfndPfvJhPSLsXWpKIA+E2Tx96s6QwcewE4roBSavGwIHxXsRd3+BjiDE
	ayrmAyYnFn2vsH25i5YtTmz4PYGNQU4sTHkgCDkqELzHOYsEKK+q6x+b4nHhrkw6
	ioeeJ31U1m/qXh3F7/3Sx5Jh9IBiBCFX1XSuEYIMt+qCS7/8fiWGHvkL+17UdBqf
	CV40sUX4mdlZ+dTFwaWjHgTV3uOw054aEcVSHkFrEVcHw0uZTEzcXO9B9TzdAdfU
	le6LkQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty2592-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 20:24:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so719040a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 13:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812676; x=1789417476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=;
        b=HIxaBjPs6AAZ43MzTUbeMsIJqPtam7YOVnYHJdJVBKgwBZ42ST5Kvfhj8pfCbh82yz
         bb2+SCEQJH3lg+pdN4Eq5G61RxN36xqlnQwvO+SqGEyIwvDEGoN+YfWIXtCyCDaZwb++
         eClZswr4Bos3BjFdUhgvbVkCTCD7OK2Hxp1z7O2d2sAVR39YPJ2F99Qcf2P+Fc69m7vD
         UMqgDZkrNBSApFKl9HojOGqkN4Oy/BGsyTiN07pzXRuhou16dGDVpYSWR2i2aT5vgMdj
         1uw0IZ+raRAHBde/odE/1Bniy+Z9ggUyKLK33GTOFHAeQ0fJvwtVUuhQtOiTdeqp+cDD
         8Jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812676; x=1789417476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=;
        b=T15xgxHLZ+naW69+VLjj/jBKvLrq2ATHnpJ/Gli8ZxSFuwMFQbW8JywqpDMJXe4I4z
         4IIXx4eoBcU9A4JYj0gWc25S7c/8VsHyGOSzbPAAZzGsVtuFpggsyX77HImVKRijNuuq
         MekdA2rP/RZwhd536NyAVzW/D8RDH14YYfjZovh+JeLQ6K4zXWSDe5qyiPFpvepnDBgN
         Pm85/NUf6fKVnG1yBseAMrcXvexr8p59ZIb20hyMfBussoyD96YHNpqOdQYZmB3OYhBF
         Obdksp9q3Nc0iN542w5DYJBPBlL9wGdFbM6/bdjVs9KeBssYx10YZ2QaciA1oqFxxanT
         sqlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpsU2iuUtep92Gx8ObC5PvnSlHKIhTVz1ffGTFvw4NcVU62cdg6R45CJd0ITttHz2OId6mmSYgUIy2aoOUUfpr@lists.infradead.org
X-Gm-Message-State: AFuF++kJ/Plp8KpJY/RrV1JUchn5GIS6Ayr3+5p8qXIS5lIk03izG+zq
	QIYqs9mm8X6SooiDlOxo5L8SpBGkq3zKALOzNY/C/2/75YShIs3gCdS9PpiOtiuTv1NBvIvq8WL
	mfHQbNZYpR9ECNgVWa4nRBapDAp+G9XGSop/XH92rjiCr1/Ws52H43Fep15XG4UtbGHY4GKxbqu
	naIassva5RDg==
X-Gm-Gg: AYBFou0HGFbEzDBM6Qct8kPuv0TNAXIhgoeavb4eFn4edbwQgLSulBRxsDHimwgQpaJ
	0a3QrFX4e4y1aL7668MWRSYV6qIeJTQKq5bYGGyIhxcY1zqP/6DJWZuNAulxAJJDdBn99FVKRB6
	XjLN/KBKSkjn3yIyrqTajVJ43J9F9PTfJBQCKHut48Hbso+AqdqnJFRZkfKemqbOsWAeKoHtnN+
	EoAOEWzsJgKidbvs7daZJ17qKwTkNO22wCshhwsJh0qSQxY2jgm69pcdIAMKw6EoMYUMyJyeVlt
	luW7tGeJC2Uhd9/2TzZA4EWzZCK4cd4F3VsisHWrLmQ2QpoQUr4PD2aT4ton39sRU11iL9RgzXl
	or8R1AulW56aQZ17AZBr8Nnj3WC6brQ==
X-Received: by 2002:a17:90b:268d:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39b261e1beemr40352064a91.16.1788812675479;
        Mon, 07 Sep 2026 13:24:35 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39b261e1beemr40351940a91.16.1788812675029;
        Mon, 07 Sep 2026 13:24:35 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:34 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:18 +0530
Subject: [PATCH net-next v2 6/9] net: stmmac: qcom-ethqos: warn about
 legacy RGMII PHY modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-6-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=1435;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=OvmGJXWTrtFVyiq8kkMO2myxFyrf9kt4/dp6hHNffZ4=;
 b=gZT/4dzpGgbBKDcmTineyWKwhP2SiV3nr0psphFKz3N/i048ZPv6oxaDasRhwQFJ5SZTNwxcI
 osJt7ozA19pDbpIWJx+1zSZf5asWNRUm1a7D4FQHFRm3p+DbT2ldB4N
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9f1d84 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VSm8jR0bnqFplKljzc0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: bcXUOg_8WFOMUS8PoxpDx1QiYXXNDNG1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXyNOPiQnoFrWq
 bR7akvIcno3bk8VPwN0tLeTNNxJ/hxPe1YIA1y0XJTpq6wQr8CE9Ea8k2KVvxMZajtAFNDiD3+F
 IqxOfPOvWI7FDZRezU/l4UVThYw2PWM=
X-Proofpoint-GUID: bcXUOg_8WFOMUS8PoxpDx1QiYXXNDNG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX65fbdnfhS1UY
 4hPNMvROqxdNiBIV6xsk5KPnPNCa+4EiaspQaDrXUTC7kBbyC1dnMDgyEjphGpUt3QvTuOBsqq+
 TotPQQ0S2gxCEfYQnH0JHf+8cBtmihMc90vcWHbgnCb6FplB/xj6jH3rCgE3kSY2coXv6G/h1re
 ZF+Z0fwBu9wwRNMmeqmak+x/64y/IR6abQ3i++9uyFYKKpawpPOUua7ZaCtqv8l3ah+WnL3jonK
 g8mN4EsE8SNZ5SPht1H0//VqJy0M2QztesQ3SmPAWOc2tUZxknLFiD01pRfzhst/cFRlMoHCG0w
 /d0JQQMW9EDlLhLc0BR5GzZrYrib+0Uyz9psd4sVpQIpm8Jsy8G3OMZYuLHfU32u+CgltyDuusQ
 0sDRNEKHIW2Gw5Fv5+bhhuAcU/Et0wFLFHatG4rkmOWUJ3zLbAPOeZhImvAPSdAJcBEOEd1X/kL
 Wiq5/OFWpsIMmmwxWQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132436_898216_AC342A76 
X-CRM114-Status: GOOD (  16.31  )
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

The qcom-ethqos driver is moving towards using "rgmii-id" together
with PHY-provided delays. However, existing DTBs use "rgmii" and
"rgmii-txid" and must remain supported for backwards compatibility.

Warn when either of these legacy PHY modes is used to encourage users
to migrate to updated DTBs using "rgmii-id".

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 53fb9de4d92c7f1b3c51c183064024f06150444d..a92bf4a6a2dbd987893bd4a3890df770bb7a7e56 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -764,9 +764,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->phy_mode = plat_dat->phy_interface;
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
+		dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
+		fallthrough;
+	case PHY_INTERFACE_MODE_RGMII_ID:
 		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:

-- 
2.34.1


