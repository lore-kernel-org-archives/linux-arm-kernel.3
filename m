Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A476CFD0068
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 13:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pHUoDHbp/fO0Pu/cIw4kKzW9BV89I3stMND+VHsatJw=; b=yRYl478ajvvaeeCOVosTAEyIzE
	Jqr9pmP1QJa1GlqiAxNnJcuExCGjBny1Vg0jkRj+0inbhNDYlSrbbGVa4nhV4C0IhyJNDdlEOqaMT
	sFMaCALyVzbWWr906+FRAbTeygcMPZlOO9oot6lPSSndyTO0IdHVp6VDYgAqDfZaWgRoOMDoWPiR3
	E69yFd2AN/cNxNH2ynqR2GbUKbtCv63+deXwdY3AoxNh3sqvBwXVhlGKsvrYFg4a8+U6bO/Yme0Z6
	vFUXS8Iyak5z0VpK1nfwcQ0QZlTcr8TrE13fL4WXbx6mjtJHh4caCMgEey82cgO44uTvMgsyGN+do
	kG8U0P0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwh5h-0000000BXuj-0PCK;
	Sun, 01 Mar 2026 13:44:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwh5e-0000000BXuK-08qW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 13:44:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6215uS021623667
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 13:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pHUoDHbp/fO0Pu/cIw4kKzW9BV89I3stMND
	+VHsatJw=; b=YoC2H12TlUdmCqPm+6MqRsNm9EMrVXnC9pYTKWMN6Kb7W72NanR
	344KcSP1B5gws8rw5x34WoLeKyt5pf567Q55Q/AlJJct/yb7ZP1aP/3kt2P8m0Ai
	+9TnhpdEmypwRhAGTrolraL7t5L/sdH3pPY5S59+eGJ986PeMzc74+GLpGJGriir
	/FmO6kVzQVpplHhmkveC0xaX55eaqQYc/mSlhjSk8dPUBUAi2HsvI0LNm6Ti0XdG
	/O7NYhOsVkzwQKK2SrxoIHQWxTRW/6JRtZCN5YqdjmW0Iq+zFC7I/SQV0AGqcQQs
	TKXb/cAtGRQznLzyaCsyLP7Sf2Q/hx1qgTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfytpj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 13:44:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cbb8040f48so3428743985a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 05:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772372648; x=1772977448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHUoDHbp/fO0Pu/cIw4kKzW9BV89I3stMND+VHsatJw=;
        b=RElEkV5yu/ovpMvTVeRl7QXoJUrI/BmcKxwbDTdsjh+9oqG7dXLgrMneXFnbwzRYr1
         cmFLq7BJdtCO96/HbSAWI45uYLPoWBdl1Pd+wf/yNfB35f0/KToC1hKsIcaroZ7HMAuk
         TLJBX1oN1YLgApkuS8xS6NAYiTTLdEyUVJ9bGx8GofHPOTQ0Oh7mQ2WSXqvVXNb5MlqJ
         wZUVuRx1K57yikC1MdiDGphJztxnEemlCbLtYWBJmdFoeFOrKow5NILSSO5GRlV/CwES
         NVFe75HgC8EBfwhhBIFdDASCNBqerHVp0QmsWYkgO3JKySPMdrOvvHWdUQcVwevrJYck
         TIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772372648; x=1772977448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHUoDHbp/fO0Pu/cIw4kKzW9BV89I3stMND+VHsatJw=;
        b=tiiNlvi+mPISjy7ozluZfmtGvkvr6g/D9PrD+l0vxNk7Bbu2ufbjJfiChQ51fNZV/d
         CTEXoB1sFoQnct9Sy2DpzbBXxOT825h9ArUQsQBaphrUFbwuwJado+egsB8G5XZhdihI
         nxi38/DUneuzZNnlzVptLHxXa0j7fiXvtzfzomTl6awGCgTub2JZ+D4VI0FK3iRqReNG
         xRFT5gPukGtNaLIfOK5duQnZh/WU+3tTU4Ph5PGkMdlTLt58Prk6hBLwYaqaIHJQquaW
         raleB2vGnYvsbZ2wb0jEsnW0syC4e77fkL9coe1jgOcr5c+McafRBmU+nDTIvXutfkqh
         h4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXOVhAA5QDPGDQYpxBuI8CckM8vskZhaiYBaQ9a2IkNSTILDWln1wsmlXMWa9YolnukwQSi6VcNaZWEJOl2SEKW@lists.infradead.org
X-Gm-Message-State: AOJu0YxPeLDJ8kWQJUCFbaOSXeho9PJ1qL0K1nIG5UzPo0MnNZPywUEi
	TZ+Bu1xVXnjKk9FwBIZJl6Ml0/a7WeYC9EHkC5Iz8rXs34KXF7Qvx+uh+0bJml96BhA2/FN0rNu
	56mCy1MpFDI2UOg50jH8E5CdJSpQbwKfiCLRVJPoIJ58NrnrFzHbd/DLu3DSdqaVFwXiyWXmn8d
	nQ3A==
X-Gm-Gg: ATEYQzyUx97MZ53EvIyenAljT72R05tOY/2BIHSbJ2ymeiSoMjT2IWGdO67K8qTLyMX
	3F2gs/QUx43BXf5f7bVMvU8iHYr/r6sjWch6WR6IYed/eiVdK4tWhhI6xJ/10g8SkC3oD5kKJWj
	TkLhX7bRqGrJx3YBBdFl7e/psjaDHGkA8u+iookrOqFSjxBf0B0rsaGVDTadd0w+wXtKYRjxC3A
	GB+fcmSiApQyWuXe7S9deZh91JqVrgEMaZcEL4uyzs6x5ZuaLV9cFiaisbZFhYy7AtYl9ug4S8a
	KQJXg0OfnTctxlBvZT4aUGq7P5fBEMTYxqpDBkybgcSuozJIr6dhfv/VbbO5QqnMUPU0M1VDAX6
	fsYJkCm9tZC+0vhsUbmTlJh3aB9WUy2FHHKi8
X-Received: by 2002:a05:620a:4041:b0:8ca:2cf9:8198 with SMTP id af79cd13be357-8cbc8e4b61bmr1095156485a.40.1772372647992;
        Sun, 01 Mar 2026 05:44:07 -0800 (PST)
X-Received: by 2002:a05:620a:4041:b0:8ca:2cf9:8198 with SMTP id af79cd13be357-8cbc8e4b61bmr1095153885a.40.1772372647508;
        Sun, 01 Mar 2026 05:44:07 -0800 (PST)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503424fsm3255099f8f.22.2026.03.01.05.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 05:44:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [RESEND PATCH] media: samsung: exynos4-is: Simplify with scoped for each OF child loop
Date: Sun,  1 Mar 2026 14:44:04 +0100
Message-ID: <20260301134403.53643-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Nl2z5pbBFpfOc1vfgXgntSunMp2sjl/kx8Im9n4HFWo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppEKjkr5yXjBNan9e9zB+KhsoKO0yxOdrIhWWq
 hE3WdibZ4mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaRCowAKCRDBN2bmhouD
 1xGwEACFxUx6NzonYDuGcQoqsqmeUmGszDXJzjs+0xdap5PwKOQCBZ3dsb6IOO/7WEnRXubAxu5
 6cJfqMec63F4lj7Av2bE4feHgptCk3J/0dm+nIpdAVA8W63oS83aNqGJaZrjb1CFoGJ5kTaMOxb
 en84EczYSG6ci1de/QSptEwSNZ3+A7jfQgYG/C3qXsEcxkscEJ+FmP/lXA0togmnGIJz9Rh8rhN
 qAttIolSX83+qGRCZ87yQZG5AfTA8yoxxzZp5FoLktNhnN/sI/MA8m5GK7UfivCJW+axTSsUWfI
 jfqaqaBrZc1mHYygVU0/Dcv7FlR3tNOqkpChGH3zj312RevyKaUfvWk/D9Aqqn2aswFZwdn+VcB
 2ZD8ETv8qxXMGDMOKBq/HhTj4Bta8FudKYHge6s/0YKypHgRPTLheVt+bcVgcgYXaaDp2zuqORJ
 ePyBZkNWeImaU12TFBz7z1MeWEpe1iENYk5uFUsb/i1Dtu0bH3pi4UyyVbSlwgcXOYpiPq6ibYB
 LwX4iMug8vaIIRxBhU39JrMQ2eIJDWdorxOsX6AgJ4NQqEIOmuG1lPvCMDYFyO7IL+5ll5x+yuC
 vsrBoDjQAWj2rcRr5tK3ZZAo9wZNL9g91HhZtBAolUEbqlhsc2DI9ZOQ1X20GVG8UMLcw7NjD+G oVTeP95SHPCv1pw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEyNCBTYWx0ZWRfX5Z20vWq/EYbo
 C0qBn77shCC58F22njMeZt21+IwUHUK46MzxWZQsR4az9AuJ8SwJc2UWP0ozgP98jyJ6UqomOj9
 uNoSXa7JOMjTawWz/UBBLy4Fr88vEYZfssFhPPeimjezyJQV9p2opEOA1InIRfF5BY8SwVjyTVZ
 FN4wSggi6YdRjuX0UONM/5HvXFjLBWzjB2eGxKGFxV0IPHmdzI184kdzi0uYwv6dZUfAUsDzI1s
 q+MqNGonR7lcqqY5y1Bjk4jzV945MmBIacJjI7XZaIeBY9TxC3K8k1SFmN3aQxrSSzokskZY7KZ
 l8v9R0oYvdbFR8E3rdFUdlJ9GmpIiJrfXanJjIO1jc1QcCHwcyCpMZU2ljtJP+RiesHptlulO6z
 BIEz6fYqtZ2CMYnwqmeZgr9Utw6qMVXWz6raXklbtvcOpqPWa0B4tRGqDQ5jfoaoTooN305lHNA
 IP+b1xuSOnn2SrZpEyQ==
X-Authority-Analysis: v=2.4 cv=avS/yCZV c=1 sm=1 tr=0 ts=69a442a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=i4aJ-GEgVbPWXsRE1ngA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9XbqNJKUdsOvzk3-3fanl9udoozv4c49
X-Proofpoint-ORIG-GUID: 9XbqNJKUdsOvzk3-3fanl9udoozv4c49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_054410_190976_DDBF740C 
X-CRM114-Status: GOOD (  14.85  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Resending after two months.

 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 0827fdaf455a..14d84cc96831 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -200,7 +200,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
 
 static int fimc_is_register_subdevs(struct fimc_is *is)
 {
-	struct device_node *i2c_bus, *child;
+	struct device_node *i2c_bus;
 	int ret, index = 0;
 
 	ret = fimc_isp_subdev_create(&is->isp);
@@ -208,11 +208,10 @@ static int fimc_is_register_subdevs(struct fimc_is *is)
 		return ret;
 
 	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
-		for_each_available_child_of_node(i2c_bus, child) {
+		for_each_available_child_of_node_scoped(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
 			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
-				of_node_put(child);
 				of_node_put(i2c_bus);
 				return ret;
 			}
-- 
2.51.0


