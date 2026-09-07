Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E019C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDFrSG1eq5takqmdP2umAB+q8t+A/RdaXA3/66CSsJw=; b=LecpfGpqpunoHH3mpfv4QZ3/AE
	L+1hpus8heqiXpFr7TsaW4qrE4NUHVNEM30/s/eQY9UorL8y2qlB7yn3ZoXCX5S326oYUaZ0Fgxd6
	nOBgCiTJnWdYqDKaYzK6j6Q2UOBRvVGkpvkZpwW4GCXgcB54Z93Uw0j/5Gnjtbl6aQe0NW02pYeX5
	DBKY/Y4YhObv1Y5//cwaYSSyScneviZvK/buqE/47I4Sph89L18a3b3qyqYcp17ZvalwF+hggoW3h
	i5d7G/SHwvZJ5v8mRPiQ46Qi6NscqlvWIHhm4CkQGCldglpt1fEf+TetdKcWmMQnKAeEtPABaMdhq
	DkNGevJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fsr-00000007h3u-2DTi;
	Mon, 07 Sep 2026 20:24:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fsp-00000007h3C-0tOW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:24:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7nZa1314403
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 20:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BDFrSG1eq5takqmdP2umAB+q8t+A/RdaXA3/66CSsJw=; b=Yjo8of4eO3dgkOiY
	3Rn9v30BZ66pdFQUKXMgX8BAub6xKgb/nufZWLzUux7OPOQLCLCC/TC6/AGgKfOz
	4reUvEh/QQE9hU+83G6rTyOi31ty/YJUCdOLeOMRalgulqn809B7eCwy+E0Fe+wB
	/dXpmAtjUhu8yN1jzsIznLFwpUeD7s4/sCgAD3auxPNjr/7Y43/+Qv2Nzf/eNLHl
	7YzYHI/YJJlesEAnUutY54DoMf+rGAqpj+c4BFpKDlDdU1tQagWQZAbTl9E4EGMi
	YgLKX85rPgpXT+dixMPAwL4qyPCc6uj6rgM4jt2lYRbugqda+9tTKyXkQ+6UMbvC
	+JrMVA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk9uue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 20:24:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so20500a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 13:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812642; x=1789417442; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDFrSG1eq5takqmdP2umAB+q8t+A/RdaXA3/66CSsJw=;
        b=CRZSKFauaVdrnpUItrbLvPFo1KDI2tt/V33SrIEnGO1heHPYY9BozCSpLM8MXaDXkc
         2EM/AKmlRcvgIiYfl0fDdfvEE/PAbQTsx6o3y8S3YtVLub1Nm7LxxLbuEt8WQiKBv22o
         6kcMXiTBpbCgSTHgvlHI0Ss3zjm/VyeNT4eMHmfAVX/P6QEfH+wx5JXXQSi3UsqYGxl1
         Nojr/wG05uIbvt1AkubbjHK1xBmxqFx6PCJ+aeWmsYpg78HL3GQf4cdMgd834/ncJFtg
         0b4m02wuaYlByKG6CTncTD+QuYxs6bR9OXmOlOHpv8HZwQDTaoyn0wZ6Cz5O+PBuH7ji
         2Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812642; x=1789417442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDFrSG1eq5takqmdP2umAB+q8t+A/RdaXA3/66CSsJw=;
        b=rdPEGkkn8Pehr+rzsYplE+pjT1QyBoNgdCtKb9u52/7Ts1OcoGjnJZEjnZh+hTF35b
         PM47Kn61XpU12aqyKLr3a+nSxv6cQO2C9gyuspb6wFhI0q3hqALY3z2QiyOp0lL1CoSM
         T/cI/QNsBHImX2ZVwREe+n5ASP7nHRGpetFxhXb0pqkfOEDsZmeKDK6dzB1M0xH5XOdw
         RluUJb4lnGeOZM1CN7yRgSLOdmTNnW4b3xoXm/TWWhqhwwoJccJVJlMtcVuYTb5It/6T
         7MiZYUcf9xRZEUR88d6MGPnkVt6E9H1xRr09xPSq4guj79wdxvfxdBzJ1q/KN8YPeH82
         DW7A==
X-Forwarded-Encrypted: i=1; AKwUvBzkSZGffmnxIisHNru9VZaFFvAecD1FzYVqq/xggr4HUW8wrQ4j383sKnx8YHXGcOKwt5rs1QTa47/mWB4Mui12@lists.infradead.org
X-Gm-Message-State: AFuF++mdR+a5H6VlmYtXiMt7dI2omt3L2WcABM0p49bN3s8e0EWYTmUg
	d1VVnkWT7AxHsfqusJRUPHDreLo5PabWa8tYgSQdjFAyUMZZq2zlD7IcVhMuBEgvBQJGIck3hEy
	Zi75K7Mhi5OASTaKNyaUQYEhQiCieHmcMw7q1AL2+dPIo4tnLZ1ahw+UuQAeediK2qjbZiDqKSh
	6JfEmHeGhH2Q==
X-Gm-Gg: AYBFou2spsYNWJduIMl964nd3sS+9RuR503PmLOWaaRb3r5/cyhKNX0EGz+SU7RS/1P
	FGkDOS4Ik2/ySg0+rQe4BH5j//ciXczxgAdpBcOBIwyYdwuTOWwOr6h7uzseoh1cBCYetb3M+kB
	+096mUXtOLRhuY5TuhTGHJF1tqBp3NXjcCOzyteZPzH14aHC0aSwtfY/fGKyE2/7L5O3aGyrqAL
	K2uUjWO7x/w5J9H7HDgXaq1jUgrRgx5sAeahVSYWEQqVFZKQH3MZnjhxzc5tGFTTbzhmZDnXrUR
	urWJoh/W4qlkF46kl/2YY8TePsDFBwpjwlkUNOSju0DKcyD2iGsPsQmkhyyeqn6N9a5gMpkRfhe
	cFN082I1Gy6Sz78J1yeBIg1ik2xkIAw==
X-Received: by 2002:a05:6a21:510:b0:3d3:adbf:777e with SMTP id adf61e73a8af0-3da3a167fb9mr39912019637.19.1788812642091;
        Mon, 07 Sep 2026 13:24:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:510:b0:3d3:adbf:777e with SMTP id adf61e73a8af0-3da3a167fb9mr39911964637.19.1788812641662;
        Mon, 07 Sep 2026 13:24:01 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:01 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:14 +0530
Subject: [PATCH net-next v2 2/9] net: phy: dp83867: add regulator supply
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=2136;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=jAZUog391waib5poEaz5VaRKy/HfMl4AFD+Z9YWtswA=;
 b=DHYLaLQ+gXL49XZqtb6eATiMimarC5O+tgQ+agl8xwwu1/xxfwpt8n4/qEUHFiyLy+f77rDwd
 TUNDQALem7ZCzzJx56lUODiCdje998TmLDFIHjtXVqoGFBNUxXf/UFH
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXzDrwcL8rpJZD
 9PLeHuzLMmVj9Obj6ypwEjSOVWWJlsjE3lbhT1MlTWxTfynxnudbeGfaQvIfaeXManAZ2vwcWAC
 NBe5Gm5+UZMjiQegv6WT8V6pHum5M80=
X-Proofpoint-GUID: ANitu8SZHZ5jVxXXG6R2o9hOReb4PDna
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9f1d62 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: ANitu8SZHZ5jVxXXG6R2o9hOReb4PDna
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX3yBkNlFqU4qg
 HoppHnUitdi56DojtLLd8dDrhuspYoZXvutSWWoJ6pq+Hh8FWOdaKDpzD+NtETndWHPAZnEkcFB
 CjaChkcizoFLE+b22kifJ5pYwSd2rufhBPu+YxKWcd8hi5jK3RJEN/tr0GSbMaOLlocHYMb1INZ
 5qKzR3WPatcMdmdKaAqym8KULyiGoW6rwvEcMGX1F+hFrG15r4x/eg1U9ZfL6+uCrNGVhdeHpn2
 YepbnQE60X32V2pTvuOXZoNoTOHKAvcKshbBF7KscmHTFEOLqg/Rm3zYs2YYTq7hgkSta3nW20a
 x9riKf+3FdHOg95OyOM4YkPE1It2ugR7442JyoTAHpXYM6719Ll8QKsF3oPAyuNMXi1AIiplEmM
 Oh76KIwXRkvXyN6JKStcvwlknzNqQE6jbSYZZcUocs9/b1vZYIDZc88krVVHMEMvK72HK7C/dxM
 iyZSoAlGIZhuCm7iUfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132403_267478_BB669A54 
X-CRM114-Status: GOOD (  19.73  )
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

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning.  This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/phy/dp83867.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index 88255e92b4cdbd6da2e2c1d10f9c72348d28dbc3..dbeee7cad6f0cbfeb127bfd28f43ee2a16c78879 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -15,6 +15,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -719,9 +720,41 @@ static int dp83867_resume(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83867_power_on(struct phy_device *phydev)
+{
+#ifdef CONFIG_OF
+	static const char * const supply_names[] = {
+		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to enable %s supply\n",
+					     supply_names[i]);
+	}
+
+	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
+	if (count)
+		fsleep(200000);
+#endif
+	return 0;
+}
+
 static int dp83867_probe(struct phy_device *phydev)
 {
 	struct dp83867_private *dp83867;
+	int ret;
+
+	ret = dp83867_power_on(phydev);
+	if (ret)
+		return ret;
 
 	dp83867 = devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
 			       GFP_KERNEL);

-- 
2.34.1


