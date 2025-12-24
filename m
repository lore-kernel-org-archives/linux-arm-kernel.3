Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B68E74916
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O0HiHNgdvKr1KcFvLRFA3WtKpSYqNZAj02smGoT+36g=; b=abQVnx1bG5etndY53CE0VE9Kt2
	CUMWj19Y503HGg9UABcaaIVfGOi7YEo1iB0mRJ+T0g5WhSRdoPCj4TVg57Ba0zJ3rloiZ01Zuiccb
	pmhh7MLxDwJmIT2N6PB85OYGbKLO3YS1C/BH/85s9i+6C5zF5d6rMXyFsSh+3dTA5c5ebrH3z8Fxg
	loFVU2yEAHgplyb8E+R5MZpp4CRW1dbf1E8iXD6k4loS6ZF+K7dNZEVEZrBH6XxNmsWNY5jEb8XTf
	cW+OoOXYeBAEdzZw24U9+6yKWMiUsDtuJQPw42HxkWwwb+NEUHFC8zxVDFZMLQRGFkLjJfm8+I2Pb
	LRpjEJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMx8-0000000GjrU-28Qg;
	Wed, 24 Dec 2025 11:22:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMx5-0000000Gjqo-39TI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:22:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8wHQ21206421
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O0HiHNgdvKr1KcFvLRFA3WtKpSYqNZAj02s
	mGoT+36g=; b=YePYMZ/JOSPFk2ZIO94JsJgGsxkjxHxUuWKp0TFaN749LWeRXjc
	A7rc3kI4UlNqbw5DnwdUMKKvVUge5BJXe8zyKQIOHYtbogsuhHh4j3uYG14brEZw
	7pe5k9kmn0/Lf4ol+FK9IoviY60qcFQ4j90JZ2mkN7/KEMk6M4bX3+TEtzbyk4Tp
	9Drt4a9mDnNnvWjcvcPGZ6i8YWl2lQXzPalwarOEHbemABiTDFu8n65qBXHB7Vfy
	Fm3CKZ/h8Ln0EW/+lHWQh5MYwW1y0kscv3EK7phXhK5qtjBqOqA3yJU6j7FH7G1S
	CeJQsEarYBOvUicmtLfA5LJ7tv3H1VElY5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r1xyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:22:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so127106241cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575366; x=1767180166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O0HiHNgdvKr1KcFvLRFA3WtKpSYqNZAj02smGoT+36g=;
        b=cwZvhx0mW+p72sCUTniawTZn30O6jjHzbbBPq2MOjFoOpLXRv+hQF4YEdIBevWSJIP
         7Jb+fjJ8RboYbMA8iG6BaJ7eb/pVNugoYMULMRGMWez/qbmSVlPeLa4WJb3swqUbrbw6
         esS1ujjpiFUyhlKP+t/FSR0JlnZzrWCUoar1EFMpKG18DUlWO20K9+pFnEtCEbIg8IVd
         vg3c14dIJN6ujwBb1N/n/i4b4v42/MgI3eSrQU6Zd9bo9mTsSHu/XrrTzLNui/4DSOBf
         tTicq1L/LrjYONBjpYBAsTlFrCZowB91C2LuU57XfkXrTOSzAD/anTa0cFMDrSAARjM4
         Ga1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575366; x=1767180166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0HiHNgdvKr1KcFvLRFA3WtKpSYqNZAj02smGoT+36g=;
        b=DOPbKvMi82dAfyzDjHL2MrZgT/tzsvz7/cN7hzovo6BU/Y03OetV2Uug/CvIAHlyDU
         AH0t0CyEnUVE1E8GdIAhFIC7iiSpYbYM/AoXNLrB4lIUXZLmbP8sbO2cVg1TjN6ZNXYu
         +aU2pIIu/RL2YHepqDvp4kIzSgG5Fs1TA3hP8xmev3Y0s7zfDOcxKQXArpjqa6B8XHMs
         +Q/k5NA8DttNpMgE/5OQ3jCAXfOJe1a4SRvv607ZI4qw2iRJuBIMEXYQmaDw+8mlWuZt
         De9lNskwqqISh+1CY0zA8d+hY5wyx3d0nVraIWHwD5qpdHoJoreVNs340BFyBWHg1Hqu
         6G4g==
X-Forwarded-Encrypted: i=1; AJvYcCWEB5ivKGduTscRKY1dFELgiwcc8ZjduDeB1w3CYX3gKWiADe/DsWWllGidSIIczKRrLXVZMrpqQt9SSAhegYre@lists.infradead.org
X-Gm-Message-State: AOJu0YxVvUlYsFHQImU4dWr4zU/2vbZRReH4GHoS0tkU7SNgfhsbnMc2
	RSZLHXGAOsedX3sQcbtcd4P2L0vEybbgEWaGHLA8DZvTlqGoA00lY5EgD1txiyyDyj/n1tdtkc5
	k57Yw/JNbuVLHWQO4lBgQasj9gOXzeFBrwoON5yihhv8srL+a44Q+xogjH0Ce6CuV++vEPHItm9
	ehbDmBSPPKJw==
X-Gm-Gg: AY/fxX7gEpJONVsC+RTF31meEaWmr2+RQHxpBMkl9nk5q5RDVTwqpcNmaWhXpDGyW3o
	1ButGlBqKfYVHudZJJXBioy95T+msWLwST8V4fahErMNA2uSV9PNFt9C1TA0qSEPG7zUbtS3+lS
	cq3qJSbD0zpnQcO/rPeV2m6cRh6g2SuvVFcvagJchW3Xh/3X7oU5gplvMp6SGEVXXt+HcLNR99/
	XEDrly5z3IHOehPtH6g21xmCFz196mQiL4idea1nMbb/0n7hbz+ysawREutiYAZ3Pn0hjHq2bwc
	Fd9DgiGllCrQ2ohPMVOXirY0VwtDSzjZjurw1zRb3et6SiZHyPNa4hIl3YN7ziAaWoQLcTkuDXD
	zpWOmvCS5CPSVAEBHoywRi5oFJcsoAHrP507DOkOoMCpx5CM268fmbxVfjmUqMMZI3gm/Fg==
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr254006601cf.30.1766575365733;
        Wed, 24 Dec 2025 03:22:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIEyJuzFxKiRo26Yf+z+QYqxvtMHQvuEuAVwz/3TiONO7aYne3WRyXt3VVXkH0ZPT1PxurgQ==
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr254006421cf.30.1766575365333;
        Wed, 24 Dec 2025 03:22:45 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64de4798077sm2042514a12.7.2025.12.24.03.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:22:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] clk: lmk04832: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:22:40 +0100
Message-ID: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=eSn/vrPVAqLMf1mV0uK3MSO7Bl5fYmwa8QbVWqjzQNs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS8z/zWNdvmw1CsJTUQVKXfpHncn4h8LFXYkal
 FiGiWnektWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvM/wAKCRDBN2bmhouD
 15aGD/9er+6080n1ivVaVbeXYztVbuBmdlFk04FD5W29D148S8a2VPReYd5iiL6SeJ+ujJrCtE0
 y1//W1akaUv+UqcCf4w/v93WfF8J7f5BAbW0sOtswGvVo9tPUvQWS6GCfTjimsydbLP1UJPvnzk
 qxIhkvGQHo79shSdec5gfonmEdoNjsCyzgsx37cjuJKVRJxjwJY26Pm5V8k6ndxbZpSEXJ3xWoD
 45I63qBY+ypRxSYsVFdaitgiMbUY8hB4I1FQ77To3W4JMg+DjpDSRyDhE8LtZ7jREwz6SBbQQ7d
 N1Z8Yh7VNzhK6+eMjOk4kiqJLW3jWkcHa0ehsVPSk3D7cPC2fBVnkrQHXbxiJKa5ofzeZc1GAx/
 O0Dz8XE6VYAfIEzpSB8p5JPhwV5lsd73uRgv4+dFVGHk9ILtV16yFBPwzgX3Vs5GQZ7UcTI2ctb
 WQInzqMhSWdOXtsTRRrvDBx2iuqIQO4iO7AWd3Uizu9bcc1AebT4aSoq75YhqMNGKmMA7lEFVLc
 0g5K+y0EaVgWzHfDFXyiZRdG7PVEH/dxHdI+KPufXva+WaiGwT1hWNWyLLXi1+m4yM+6s7sIpEy
 3NAzgTJygQsfrmzqMhf3f5hu8ekDXS1geJG9Y9tWahNhfn3RgaV+qhBjbYTgSZgc9zPdJrGuLh1 Y49fvpxM7EApjuw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zbZ8UrMXi8_kIaIYv5gobk2YdjEVmEyG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX4ho1ikttXGMg
 6P8rBX6qfS3kmIN010o97USO6DK2Q2iwYEZyYN24ujbjSf8K3RirP0VdLeZ/AxWgI5oGDEI+H2i
 jF5Iklip39RDAy6YS7ogY1IbKXvkL74HT/ZHUQbDJC2uIcD0A/t5QWfNVnySC2KSD3/CeRXYLNu
 Dv23kWB1Z2ogitNXeFZNFOWodwz2EfPzy7vamnTrBvkmZdAVOLWbqIxHMIaT4BNk4YOt1+cOv97
 35IDYg7Iy9LNWcHLebCbHT67h0UCFINrrqLngOtamJsaZzt/61bKdw+hQPtnJxOBxNYDFnb5mh1
 svdNNbWz6qa6uT9eveWygH5DB1d+Fa8Xi53ZvPMYiqHdJ6lWiXY8WKvUqDApkyTDZZti/3guiTe
 P/N/V+gqX0jAI7T3iqJYv22QztkUStQP8QEn3mkhUlW+g4BpWnDP7izy/wGHNbnajSqTD84tU9F
 P5hpiMKBvjgNeC+WQWQ==
X-Proofpoint-GUID: zbZ8UrMXi8_kIaIYv5gobk2YdjEVmEyG
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694bcd06 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bDIXTv4lkq2VoA6JDjQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_032247_913000_9E1D56C3 
X-CRM114-Status: GOOD (  13.80  )
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
 drivers/clk/clk-lmk04832.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index b2107b31efa2..9bf86caad829 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1400,7 +1400,6 @@ static int lmk04832_probe(struct spi_device *spi)
 {
 	const struct lmk04832_device_info *info;
 	int rdbk_pin = RDBK_CLKIN_SEL1;
-	struct device_node *child;
 	struct lmk04832 *lmk;
 	u8 tmp[3];
 	int ret;
@@ -1462,14 +1461,13 @@ static int lmk04832_probe(struct spi_device *spi)
 	device_property_read_u32(lmk->dev, "ti,sysref-pulse-count",
 				 &lmk->sysref_pulse_cnt);
 
-	for_each_child_of_node(lmk->dev->of_node, child) {
+	for_each_child_of_node_scoped(lmk->dev->of_node, child) {
 		int reg;
 
 		ret = of_property_read_u32(child, "reg", &reg);
 		if (ret) {
 			dev_err(lmk->dev, "missing reg property in child: %s\n",
 				child->full_name);
-			of_node_put(child);
 			return ret;
 		}
 
-- 
2.51.0


