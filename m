Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BbIdL/ut92N7LLclhFSaQsYrh/P86U+H6Pgd9R33Ma4=; b=BagSzDGIim/QuuZ5GVoWIYxKej
	N5a11j7lGQ16MOrSaxrbSlFR9OcysIbHgBUlyVOyDyqcK8IHktIN6wyt3mLsBBQhPi49LyTbXH87G
	m0wtcpfTY3HuXOq/1o1p8O1YhTpqxgKsFhHzwlpOojJXxYxUmMZ40Cw8LZtCFkVZWuXe16U3Bo+3R
	vBk0atfbl6ipGx9fOpbXXsDW9Z7LWiN/77j2n1TOW/mfvTCb04lLlg/LQsqUW4K1BEl6sKbFLcmE5
	9Nii/OqV2rD/mGrCudXCsc9hj4kyXyyoaiM1IPbUhIoneM8wi06bRt8YAL6xeipr4ucuadmJytDM/
	GBsl2/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPb-0000000CBCE-2aur;
	Mon, 06 Jul 2026 10:18:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPR-0000000CB99-2CeX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:18:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669pbQI237498
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BbIdL/ut92N7LLclhFSaQsYrh/P86U+H6Pg
	d9R33Ma4=; b=HaBeTuGnCY1aCwaAngzrrj6akDUHI7RDfXUgIo+Ygu+Vs02MZdj
	JYSbxv3RoWGBjy+ye68QxKvuvo8XsTttFwaOPM5GYVfttnt3T69oyZZE/LcM2fMO
	6/iG35eMA3ZsQgV3JAs5UQM1Fl7p7FBCmtURTTYCtZjpkqodccGJP4uB/njoPMwv
	WqNO6YN+NrPenzasLLz8xrQbWGAFxBPaGqt+uKE3tkWhX8JvI1yZtNdeU7g83BUB
	Hr3BMGP+vMvT6L7OvwKf3RepfuKCB+mSZw0CfY1vSlscG003lHUZCnEA5sRmxnOY
	f9GGW96Xt39MjdAm0VnU/eYHiO+G9OwstmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r03n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:18:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e68cb7a3eso531165185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333120; x=1783937920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbIdL/ut92N7LLclhFSaQsYrh/P86U+H6Pgd9R33Ma4=;
        b=XNQi7eF9BZhnBLhMbHRnPUpIk5CZXbuobMxjJuiqlHRhLWM0NfTP7iclsuqC8m307X
         86eLf+uUJZZ9RwQGUMw2ahOvDijHnLmIjS4X9pOevRppGWeyT9sHe43KZOEVPqVWVYCF
         e752r4rMW/Q/y7adgdS0L9Cdx+qfnFdsLNWhQHmPhRjEXFYGEsDVJjfoAIMEHajxiT1Q
         pxEZeaK709ARpCinniDmCfqXs3I9E+sGGN/vGT46H0zPFFlXe6jrAQ7C8k/fWNrEFL7U
         3cAb9p4j+hJ0Hm7rfkeDpDtOUeuTMdat71h5RqPnNeZKJeUB8s3L7OKM8LSzg+cv2mnO
         HIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333120; x=1783937920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbIdL/ut92N7LLclhFSaQsYrh/P86U+H6Pgd9R33Ma4=;
        b=Z9Rfs7HtbfVU6aXm1LqDu/w/mp+jJS5Yw0hJFM3s6lJs1TSt9msWw6KnfLwzzKq4Qg
         Eyqs6Zznajm3fQbT53ExdflbGO2UUKC3htCDjdz8hymAYMkCo6GYOnd2tFU0coLEN06U
         ITQbbNHqBGUzBXLlRRx2j9RyY74zWB7tgDAPT9FSCCCGjo9dPdFA9cYtxuRYJXy+A2gH
         Z5cHK4gDLnICfp9+5DTGL3dZ5/uncUz+KqiPmiw+p3b86uFD43BXN7gceUMKAk4I9p8s
         HbWu1F1fUn4wAlXykcSY1a9KahBTz6t2nyAokspIbtqOC3TlUAzikbsY79VIA30VU33i
         oaKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYj/ZE5JmleC7tfD2h+JLn4rclw229g8YRQxR/rTp1nrI4QbS/0zMTXpHtC6ZiqRmJcNE13mWoYSZ0tLrKdKYz@lists.infradead.org
X-Gm-Message-State: AOJu0YzT0AKj7XOWzCwAvqSuBRPwEJyfCWObLNCvgzSznkELZwrcqi17
	HzWONqvRxwSD1WM4lPIEt26ofz+zijdrZSg4R4ips08ZurJsYHlO8ZhKifNmsiWQcmweUJgknrs
	AmvOeGUnx/2j2UMzGJGPT1fEf8xQq6RX8kqqa7V4zP4SN+APbEhS0Rb67NAT2FvkN7IFQnZYKxM
	FKQQ==
X-Gm-Gg: AfdE7ckTni0EV4wC31289Ly7EcETn+ISIRtchOSjMzTqXRR0bRfz4KhdNdysPvSoS0z
	6XBbm+5gKmWbQhEygywzPXgi0uLcuo+eGe+nwkIfxAaJITZWVQdkOLRgHgfLNTQ8ktaiC3EPfDM
	xew1vdyalGjExN/VF4KzcCnMOH5ZOuYqeSLT1dB8HlZqlf+2afRU6VlfizSPtoMyNw/wY35+dMN
	sINJFJJOmNMQ/olEBoCvHA3qUklz11UtH8OLOYfj99aF6N5mocoSNkmif76z1OhUjOvH16qpOQu
	2lmNXA9tUB9c7aSME80nCjXGGTxiFO31qstn2kUicmReQ+WNF9mJobq7xDljaC71ZPXb5J8/ed3
	oeJ+w0xEsF6hP2jmr+LO5BlxFMOE=
X-Received: by 2002:a05:620a:2990:b0:925:4309:dd18 with SMTP id af79cd13be357-92e9a2f7607mr1265454385a.1.1783333119980;
        Mon, 06 Jul 2026 03:18:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2990:b0:925:4309:dd18 with SMTP id af79cd13be357-92e9a2f7607mr1265450785a.1.1783333119500;
        Mon, 06 Jul 2026 03:18:39 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce0a7cfsm270839395e9.9.2026.07.06.03.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: nxp: ls: Correct indentation
Date: Mon,  6 Jul 2026 12:18:35 +0200
Message-ID: <20260706101834.341292-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=HkD08gDczvf+no+NYEocgk7WQMaRPmHKbsABTJviDgY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4D6ulvmFdrQv8Oykl6GSSQk/2Yx5hWH/zH3X
 bJM2t/wZ4SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA+gAKCRDBN2bmhouD
 12FvD/9FG/s0ZGefd2tEFba6XCFX5ChHG5e7CwFpttWWJ5kNGHtxLBn0ZdhaLWSeg0Atp+wxqPa
 2M0nBhnLP4me8NGyH1lt1U9Yu89XOcAT8aeTCj95zzhkBsFPzYkngxPGq+hSux5B5tVg+FwNvUl
 5H0jBCwVz/nJdRzc1vJr+TBqL14nKWx8yXR4JmWdf3hAjCAIaNY509WlSZ0EuqUWF1oUyWGGsMu
 PNHGhdBki49x2TVVwQzB6K6AW68NBWWnaKcdiZ1UJ17CNxirXbg1Dk0G2nVv3rqPTnFtAo/jWUZ
 LFCkQwZXcR5EyvPorgoalP52w3h0EwqxVh6qEHAj6scDMkzuaYIou3gehBMBVzFGEq+PrCcbBLL
 gZnAOIs/aRifecbuifzUTbzPsBt2rS4qZukz54TGyCFojhKzsWr7Vz+4jVztGyqCrPc9WUOcziw
 g0w2uj1GQcOaMuCO49ngGsf+utm+U7rnps+Nl3V19KhX1EHtCukJ1eN1k4TA5gihM7p/jXXpOoG
 CTYbIVx1SgQBPgb6yjUql17jzC2MtLIT5O1IibjbJwyfz1v2CaDj3p34RCnVLW9T1QROKB1YqvJ
 v7lUPsH5QRaZyhJCI40mHLSxLM9JEGvd+YcKOvvxCmJdcMmbdkWzWr9kOaqFHwbrIXsDm0riXI2 3ATQjFiBCXwB3yQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX4ApZyxh2tiOQ
 mD2XZWVJpNadOOHVJ6YKAxsPi6ibnaX+kHvuBeRwkTZa5R9m1UO5YTWrzULNRC/hW5d499UZns9
 depiC9HiDsBVHTJPT8O241YlZq37chqpY86ub3GUVSQhMNP209STqJ6tZ8I2pkFrERA9vfNZYfY
 KtsajXfwfx+WUZaKt0JU6UKaWS8Pb8Y8fJ4FVkBrCTxFBghYcU95JJZpeMtovWvnEwLbMVzIb24
 I3OoOAed1iIxsLlv7c6j6tdRgZn2pnyNjvoO+pYLaCvFO+k4i8d8wawog+FvpVGvqKSLu9xtYML
 zaCVxAS/Cx5cvnMn1lzeDwLG07J1vs7GS2Y91PF0rUki/rsIJ1wZZnexeoytrAKKO78HL35oreN
 xGXZkU4DBoHk8HWxI37ju2x+J8ZyznhIptNVN2x5PCgfWYj8pha6yLiZDSew/C1xrccUZ7cfgdS
 ZzIr1rqdN/WCXQegTDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX9VBdMVpXiGY4
 pTFCw9bC58ux+bQFZ/fRDHgeJhFYb2UOGv57KBufkw1cPDDTbxjyZFfF6CWmLpZAvtarO/WtYkL
 oJCDe3vdMeBOAbTEHApEiR8YbdHsVfk=
X-Proofpoint-GUID: xUz_81baYeYifwxemYPjjG8pD9csEBpa
X-Proofpoint-ORIG-GUID: xUz_81baYeYifwxemYPjjG8pD9csEBpa
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b8100 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=tLFoKwMCRvoQtr3NvW8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031849_369860_27EAE8C5 
X-CRM114-Status: GOOD (  14.33  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
index 38281b904301..7341945de3ce 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
@@ -190,7 +190,7 @@ tbi1: tbi-phy@1f {
 };
 
 &esdhc {
-        status = "okay";
+	status = "okay";
 };
 
 &qspi {
-- 
2.53.0


