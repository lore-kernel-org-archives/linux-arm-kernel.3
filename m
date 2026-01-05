Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767BEC79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyfuLivv0ojzm7fZ5quMbz8PiyW8n+OAjsdu0D9Zt9c=; b=wd/9vUAC6V1TfQnZbvKPYPHRfP
	k3DvbRXc6fjqKrt33qD76ptJ0vxfJXWz9gTe2yIvgEfpIdO6sp/KGkFXmHN1guUEcPFzrYpxvO/uW
	DDMCLrezfYRm8iwS9KwmVyXzL1NACxPGMU5GQOhbpbbsXZdQVWAGbRiz8xFawkQtVtQTS7blPrKtn
	sY2gRIkb/jxG149iFWYubNhLWnzrs4v3gfJ62QPwpejLfJ/Um+2G4++KHOsR5OnTOP5ljN5uo6n6V
	GTq3xSHNquCZcZ03eKyAwXuVtDpuH3wHU5TxZl0zvKpc12Is6IbT17/Sng6b85nP8u3zhr2IlBdGd
	2rIYgaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclho-0000000BYEw-0ELx;
	Mon, 05 Jan 2026 14:37:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclhm-0000000BYEV-1h4x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:37:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058LBE31071698
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 14:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HyfuLivv0oj
	zm7fZ5quMbz8PiyW8n+OAjsdu0D9Zt9c=; b=Rcx6WHlLnRR87CBh5EhFWBW75OE
	hmPh+MPavnUj8b+0ECUAp485HnYgKFOCE0fz2m6gd3I8kExjEq+y1J102K4z3d0Z
	7K+BEW0LL4fHTgez3ybN+uNxK5TiLmwSHfb7v+JJHGfVgM1YkFnQLTHYkUGgsvGJ
	XFIQRbxNsEFNVYqlokBbkL995BfNFOWHgx67paQlFo8j/teUdrlqSi8IZRyQAeG8
	fG7Y24iIimysv/Z1IX6spvynCVciFhN/9S8eQDdM/DKjchyeeqk6JO1EFihdr8FZ
	vYmVGGnoVUPhP54NzFZPuh4teJExyXE66GuFfw5nZqjnGkiw8q9Qih1WD9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hcqfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 14:37:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f35f31000cso194853141cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623829; x=1768228629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyfuLivv0ojzm7fZ5quMbz8PiyW8n+OAjsdu0D9Zt9c=;
        b=EGKwK57Txup8iiCBX1RK1LmE/0Xkwhn0dw7bMKO5pNaiLpz2B57loUrekMDWY8s71F
         xykxFFavtKiaszEpp8KBi5k/t49zRMt7yqql42KB2hdsrK/7RbJwQCulwh8Q04rAtk/B
         ZrqlIL+nzRCpVQ0r2SmJzjlkdunTqhXzOZD3iWh3e+r6kVp2nhQOcH7CrvpwF//fIw2o
         Oe87fc5FrmDlektNE59dFZkjN9I0t4LwLrMP64VpEhk4rLiOPBpfcS+tegdMasfGiMp6
         l1EiIzm+/U8Fd52mX78ispdA3w8EgZGbGwHvh6AnO3rmfHSkqZgOJMlL0dV8HeK9jCLD
         HTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623829; x=1768228629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HyfuLivv0ojzm7fZ5quMbz8PiyW8n+OAjsdu0D9Zt9c=;
        b=luosYjr1umUuiGd/79+WfpwL7Ds/5d3kgBAX9pQjkCuNyZ+gWpsrB6vXWS8trNtYHH
         f8gVdgWE4CbTsLodFD+vNQu2o2CVkjZ7dCor8f5CHsbWvomy7iQjfT5n12Q5YmqfPSzu
         9x5S1o48tOsJ4M75QoHCxJwUSzqcBhaJX5UUL7+r+EbiE3q7VxalWDdQRSrHiKuRn96U
         PtyHBe4Ldo9DIgRYl7Yn7C+Tmel2dQka0SPFnRpRdn+QHdyPt3Cz8RWrAHTkrmLa1qnF
         f266XrGvm8NlMJqZbKCbUFoKQVJvdbf+T5pnk5Ku8pWRUBFoKm0z4OHD8r6V24JPdBq7
         9nsg==
X-Forwarded-Encrypted: i=1; AJvYcCW9cCTRo9dNJRxAXYsFuMST6V05+vxKswmKcSmqj6SW5CHYwGP3OXRlA3rTvNUzRr+YwgSq8XEFuX7xHnZqu2/M@lists.infradead.org
X-Gm-Message-State: AOJu0YwuhsAcP2C4jVXukeY69j/Kj8zuH32m+kLfSMK9meDVV+deORz8
	RSILCT1aMzgn0HJg/mxV3Ov8LNDmsqkz1Ggy7o6rg4srEG5yePE/UEbM0Ya1uu+VBQqZMno9Bl7
	FupUYtAQImSedVEOOBZVARflrqcX3DthF9KN5MaCLpwmqjA9Y8FoDRIkWMwnc8YACHLiTtK4oSc
	HAWw==
X-Gm-Gg: AY/fxX7i+TS0RdTreF7v8XAzQY6BWLH0XuZGn1IZ3VDXab41W731z6oIRZ6wbNM/crh
	RUJUJTxjMH2sddtjrzNy51xJq6dO+iy2huAVHkjxkOenjeduDJGfNwv+umVWWZhJ/bkVILKMSX8
	i4PJs0lz6nQW4ET4zpMsjdDIZzviQ8/fBGtZ49Jtk+2WprdtXRXJsrxMGGPHtcV4fa1fE2NAa1k
	L22lozK8RWASfLoyDH186IR1DDbB1iieTvmTpYMzlEBQXmTOHoAoGQcXHsj+23HeMd0yoSQG4HH
	yRNJUMkr/mw/+A7n8TfC2GeEoAOn0N1b2FJ4T0i/7+Atpcc2xFozhQbUflu9wxFq6UWV844NCN8
	GSU6fY4tcI3DXVtUbKPc9GD7gEw==
X-Received: by 2002:ac8:7e8c:0:b0:4ed:e337:2e68 with SMTP id d75a77b69052e-4f4e18edb62mr524990011cf.81.1767623828577;
        Mon, 05 Jan 2026 06:37:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlPyAVT02REUX2WWFLbiHvvDtYy4oVlLSayGGRdMm53toElZ+gdUshemsdZgp05CtUIgv12w==
X-Received: by 2002:ac8:7e8c:0:b0:4ed:e337:2e68 with SMTP id d75a77b69052e-4f4e18edb62mr524989561cf.81.1767623828049;
        Mon, 05 Jan 2026 06:37:08 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84267ba062sm2914066b.71.2026.01.05.06.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:37:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/3] bus: stm32_firewall: Simplify with scoped for each OF child loop
Date: Mon,  5 Jan 2026 15:36:59 +0100
Message-ID: <20260105143657.383621-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VWNI1jRoAcOtzMgRiNIx1nsy6FziB+nBMqILT49pY5U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8yKK9tMDmS+zd0tePA6QT2rHsIHZg88Ymyoe
 Dk8w25ZEk+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvMigAKCRDBN2bmhouD
 1+3rD/9zZs9oF90xAbOCMgh/+yckTfAbUBo5OCflXmVjKs2R8jj9P9tppyg+0WtpSxckQ2/loT2
 Bz4bdQug4tWNk77DYqF/78UUoiU+n4+MB76xQ52+v6kVidfukNewogJ3XbwWcLqI9bPLzveOXrN
 9qzurfXAqJHyA+QCQU2UPkGeBIGoLtSOO8T6rasnVPcFhL2vVDjyuPJsRGqrvwswQwKrCxo8Nt+
 9woqC8XBTtWsS9PMeNiJjMWKLMJzFihykyxlSWjKFOACfskhm3xwsUr6/EURdqePu7M32NZKr2x
 K6wtz9ZOW5af+wLTbfNwiXgjTa+qm4+Y2ogk9pCUm8bBhM1CsKLHVyJpSeb/pxLyaR+Xr74KZTQ
 L9E0Wj47K1PDu7RY7N/h6VNKDHrc3Nbg1RTaHsagk2rXRjxcMO9buEQm6UzG19y/1tSxsD+NmNT
 BD6Ez+IWf/uyKx2BEn2Pgx8QrEmezCDmfOOQx0oU8p8xsG7CwcoPw6VNosWn2gQ2BMZBXIH7kyp
 KGbVby9ANtxlGYmEt6QpxiH5J3Wc5CsNq1xyrKLZIe41a2vk3Hto5NfvbaiWvXcgm77WiegxhAK
 e3AupRZbgmjnIZ55D8DlyVcfl4N3OJGNCb/VZI/T9GxScXxLZiVd8MwbGc19X/Z/2E4PLt1WHQm rg+KWdcqIjrlHcQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfXzAyMBrHIpESn
 X+I6msySLet/IIvDgHMbiq5o2tyQhQVLFT7+j3DKuH7IKJ31Ga8+ZzInBMg2W/Rvcsl26mUo34R
 jgapLKDEGRD0jM2velml73eUGbKBCajEs2A9tqy/yEWg+PeNI8A0C9GS/OjL+yJFc+oEnq6YIri
 dAvuaYbvEFhgVJ19X7cgUli16bj7babyQX0oSnZvNwgTNiUKjZze+cqn8ixaMfuWtq1z8J8XXhh
 wPx6XcKQSSEvJNr382jPI93nsD/b5A4IVvxJK90MM+KnBeU4DA0ElmkFW6Pw3sAADd5raZUiCaX
 Z5DQnYe+IPE9wBXlXhXWAAamh+V3JeDzOmf5hEHtmdMyCUwPnPh2pOXlj3Bfo0TkCqtbvqPUlgo
 qqZ3Btru2uxrsPGOICMbLSf1/9AZaGcGuvbMEoyms6zdwgRm1ehLyt6kuJM0hkdKb/vt5rZk9iL
 jjy89waC3glUWPWX0fw==
X-Proofpoint-GUID: gN7II141mIcViSManCmbePq-eIH1Up-c
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695bcc95 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r8ysD5ROA9t2CGWeXHcA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: gN7II141mIcViSManCmbePq-eIH1Up-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_063710_452891_00B3A167 
X-CRM114-Status: GOOD (  15.39  )
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add Rb tag
---
 drivers/bus/stm32_firewall.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..fae881cea9a0 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -241,7 +241,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
 int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
 {
 	struct stm32_firewall *firewalls;
-	struct device_node *child;
 	struct device *parent;
 	unsigned int i;
 	int len;
@@ -251,25 +250,20 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 
 	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
 
-	for_each_available_child_of_node(dev_of_node(parent), child) {
+	for_each_available_child_of_node_scoped(dev_of_node(parent), child) {
 		/* The access-controllers property is mandatory for firewall bus devices */
 		len = of_count_phandle_with_args(child, "access-controllers",
 						 "#access-controller-cells");
-		if (len <= 0) {
-			of_node_put(child);
+		if (len <= 0)
 			return -EINVAL;
-		}
 
 		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
-		if (!firewalls) {
-			of_node_put(child);
+		if (!firewalls)
 			return -ENOMEM;
-		}
 
 		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
 		if (err) {
 			kfree(firewalls);
-			of_node_put(child);
 			return err;
 		}
 
-- 
2.51.0


