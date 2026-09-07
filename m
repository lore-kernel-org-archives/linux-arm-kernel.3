Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8418C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JaG7DKTSi7xhDFXHxjPdAJJFng2xHhnPLV5SDhTiMQ=; b=30D6ecyQm4tIfSf9yduko9GX6u
	gHo2LmbUgHkHrlTKjTgUf/Feekx5OnObZR8X3XjhTzbxuXmXwy6f8JuElwbuGxCP2qa7eLKtn/zej
	7BWq4sGB0noH2JKHe/q1YVqQc+eGWnPJunesGSCiNbI34qTltNuj4PldTxh6c/wb6t/GoCjwm6dUL
	tJEz/dDl9qMDwbewOxtJqfRCK0mdH5c6pkV9/Zq3FuY/5WgU3owKwczTq+L2k89dOK9V8DMo4ZtuT
	9VcCE9wUF2jB7TMih5whPH73wQADNNEZJAKdIlLQQmncA7w+0JAfuQknAPrtonE8ql/1lafnexijH
	IDe6RDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ftZ-00000007hTV-1j1D;
	Mon, 07 Sep 2026 20:24:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ftV-00000007hQz-0L88
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:24:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H8B1g3485582
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 20:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+JaG7DKTSi7xhDFXHxjPdAJJFng2xHhnPLV5SDhTiMQ=; b=XfBO1OeDaI8C8yE0
	nMeDOlsvy9eWugwFQNl++ShzxFd/G/y2X2kxXGh4JfcPlC/gdaPLdvswvM5S7iKD
	XDpEj7k9esOziJqN3xCslzyTcWCKh4gTyGJhSFOXq8Jj4VTFzVBjgiheDjCtMpQ5
	IazvdXSZtSj67Uo5Oe368CLMrXbUh3IybztdeJ2vYQ52WpoIfo9MWPnidmQBFMN+
	zxewce3cJaZPR8z0j/CNABPngsvr9KxGgNr4HMfDuTJl55heBScAealMO0czB5dX
	2n0HHdotg4BLQiMPraZMkSRYqrD/pYkq1I64CQzbGiw9VPkCz5iKvWqWXALfMpIQ
	ZBusoA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty259d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 20:24:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfca8558d2so48014095ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 13:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812684; x=1789417484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JaG7DKTSi7xhDFXHxjPdAJJFng2xHhnPLV5SDhTiMQ=;
        b=CXyvbhzsDSngxHfvV0ueNP0xITXMN1X/wW/OqICrzdFThoVCEnF1dMvLUZhSbt6tX/
         TL2iikE2te4jbQStvCl1i1mduFlOavGhYUFNw7Y3K5dkYcM3vHZNBTWD2MM62AuW59bG
         LUB3BQ9Y/f7y1IfjX+rwPbgcCG3HUSWTmiXzPpAN+BTl5jgpc6v1EuajB/l4cb6x0BoV
         D0ckVZcqZZ9kX8Rtcf/F+J+N3y0A1wZIrB5PXyoUKdo0P8x6Ajs+L4sHKIUnMVerYW+e
         4mxIm9DGppDVj4A1wOrE0urdoUp32MNk09ITurNgCjJgekr1vgTCvgRDU5W5GeCUtkSs
         HFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812684; x=1789417484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JaG7DKTSi7xhDFXHxjPdAJJFng2xHhnPLV5SDhTiMQ=;
        b=Pf+s6WP8vxoLZY7RbmnKqDI8pLNMJOXl2c7G1vVY/lQLNc/VY+M1gzVNdNVvlWPsv6
         HcDWMsFWN59HkzzitDbi+5tj3uD80NUWDj4kzO9s7bQsHemX/yRptQZ2w65i183FmBiL
         kAJHe9ul5NHT+O38bTJw8QREx6DAFmX8QqdPidSZMgnncGnduiqEJgwOF7+O3xR51X7o
         h6X0o6t+2ckFyToKs6HQRACWlI4luSrOmlxz1eMsrUuUbAvZ7w277Uz6NFvHf04Vzln+
         YLDfO6Y6suWEc27puExrktkjp8JYPDRt9QEhmiqnT34eRfcYPkVEwuRrMtT2vtGPk/cY
         KPAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLuOnFljKcc01WQwvObY6JFap/UQRPZSwcc2X3sdjmL0FsAhm55f17IpNi8IYjst68uuemUqs3WU/mbtY2X7JQ@lists.infradead.org
X-Gm-Message-State: AFuF++n6hU62nVHtcNDf/oEal7v74k1/UXxaO2wE18cEOW7ZwkUrDKOw
	nLZI/DU0CDsdDJrXa35lL/YY+XDMaToQ4SlPKVYyc7CkuRbzKBVtcihqEK+h+bOftRAe50FKbVV
	NReYOh8Xtfo4diy+EUQ1T5LmS+0X59RS03yLoowGh0dWDtJ1ehgfoI2BbYDV7gu1xQvxzwkEyen
	lrZuzWb3bUXQ==
X-Gm-Gg: AYBFou21dxSG+V3nXOdiNo5WRyMv5WuXSi2CyvFtvnV9CnXZzIYc5WO5ZWOA4psZjBN
	XEIwAW7oBB2+gt+a62Tw0HAKFBc3L4fmK/D1uMu82e5ND2RcF73osC3gJYvtFkTl2OLLUK83PgM
	fWJlnDtAJGbPFEed5aHRhTqVoDhaUkwc6Ep4Gy3XsdHNcF81hVefZiYB6PWXdZ66eS8cMh3DEd1
	cf8i65nMoPHwOwqQruTY/gI9Ygdpp8JXSDo1BjO+QHmji1Po4Y5ABKhPbFHKxBCZrlwmWq9QzG5
	XpffmbOUT951TjC4kE7oRL0XLbDIWFRPjU5zqR3b5sM6POrR8yls4ANMsPG+HBT9vV8mYpiWIQS
	7NKwE4fOJkbzOV3IxvUmXa/wTo0yU6Q==
X-Received: by 2002:a17:903:11c8:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2db1235721dmr345681855ad.4.1788812683846;
        Mon, 07 Sep 2026 13:24:43 -0700 (PDT)
X-Received: by 2002:a17:903:11c8:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2db1235721dmr345681275ad.4.1788812683356;
        Mon, 07 Sep 2026 13:24:43 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:43 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:19 +0530
Subject: [PATCH net-next v2 7/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-7-bbe3389d0652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=1202;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=lnIs5iGMJ1/TyrszL3HdmC9OvNff74ciWiwlTO04duY=;
 b=PlfItwBPYCNw7E604PKTJ17SgNiJIFuqKR0zm4aGtFG1ZqfCDUXoVzeUencwPv+khFYTEm8U/
 eKLk0dGU4CQAJ1XjFA1wGqgeMRDsFUVkiV43j1CRG6ATflSZwIqafK4
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9f1d8c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=oGeBSM6iGANWI8Y-5VEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: dwiLrB_cd5VV_XDyqsqM1e3fmkLW1GBy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX+7dp7iJwR0lR
 K6UVPG/eHRQEX1ri9+nNjKMOa8VNgnDSz91ub9ZA+t7lqFIFm5SWCzv/vZ0T+5MlDtTc+6UYiMp
 xJBk5JiYj8ntwgJ5oSvPMIdxa3ERFpo=
X-Proofpoint-GUID: dwiLrB_cd5VV_XDyqsqM1e3fmkLW1GBy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX0Mj/zd80ql2G
 cw/wKdsYsvWWOnLBYdJ/M/m3uDGHjQYn3IxEy/68c/OQb4b+rJDGkNlXet34y4BHoCidwKNFnSj
 /J8RXOCcY/n8+IfDBB8yqEfq1aSnLql3Zs3dXQBIIQxdWlV9cMN1X/eytb6O8MktF4nIYJ1EZzk
 bcKJ0TV9LYPZBajq5c1udyXneBDhfnueGfDatX92IXEX4Xop/Gbweq9I8kBAcIn8MNM0GNcWZv2
 1PByXnAf5Vcs9yxwyn09Rl3lpLDDzMDXfjJiqkRIApjBXijzstJ8buJCMwo4C7Z2P8FAYbFt3n6
 wdWy9YaB42gqzEt3DlX2QAVBoqvuKFUa2eYW0QixZryQUiPX0JGnqeLKEbl/1fOCBOPt3S81Bcs
 X28rgPbF1KoiS23OykCsneXrVbdQbasquI/9Qc2Dq/PRMHLkSEHNqBhhX3mtZ4tM+BmHhxFgJzu
 huUlI9JDfQNRKYSngwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132445_152972_6650D4B8 
X-CRM114-Status: GOOD (  16.06  )
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

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
a link is established.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a92bf4a6a2dbd987893bd4a3890df770bb7a7e56..2471871562ed9915398614d5c88d1c6673829db8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
+			       SPEED_10);
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.34.1


