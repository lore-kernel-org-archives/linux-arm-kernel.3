Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E67D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 02:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dKkJmoXSHwgOEmZ7UP4UhmBBGJtWa5ekgvOQqU+FCe0=; b=h6wQZSl0XVZsmiENLCCCBfOQTn
	PfCu+usZgyWQmQpQw/dNJJDIcw8U5ViuLQud2OUq+K5VjdT/6JrE5LG3Qd0CWZxLsPpLnfFzDodfz
	cEacRV8Is5EP0QS53f32aHLyAFQAUy32DeaYM3rZ0TwlKALJ3sG9hdOaDsFsvaJnkzjgt37XbP4cI
	79ImxABVxAVUjEosYMzERt+lVg9PWBhdTrpamP8ipOs6ck2tAer6aUmnHL0LTEON/3QujGgddTQKp
	bqn+GP3AHG8DuQCUqSMaEa1gMTmIEQqKsftaygxHozu3i7HQTjcW47Yde2gc0/mo47byfOUmMfr4p
	IIGsP7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQgh-0000000CSUJ-1Mzm;
	Mon, 08 Dec 2025 02:09:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQge-0000000CSTc-2OfN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 02:09:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MRG9c3423126
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Dec 2025 02:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dKkJmoXSHwgOEmZ7UP4UhmBBGJtWa5ekgvO
	QqU+FCe0=; b=CrKMnw2MWzHviiH5Z/70yR6Lwzhicg9W1crhk2pR3TcgHN5FRqd
	ckXhQSSpkFlTMcp6N5zLL4r9obYj7DMLGblR2wxJbf0COPZ6403lSxtZm4fLho4f
	LFLhxHbzxfbORBO34T/xaCvSPOah0PmzCvmFch+msAWy6G6umtBPbsBBPpUPpwbA
	1Wdl+RLqPc2V6y3lGfb+Or4N1WpC23ZystWYahEP6HzNxjX8TIE8zOypY5z+KBuE
	bHrT44nmV9vXsMLdp46WrEMh0GndjZrrrsQ54f5xcWPwWkKpTIS2neQL6Aclx00k
	n4YkCwFDueda4YXBD98RN57Wi0RAeNO3tBA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjvb98y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 02:09:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f48e81b8so53746245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Dec 2025 18:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159755; x=1765764555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKkJmoXSHwgOEmZ7UP4UhmBBGJtWa5ekgvOQqU+FCe0=;
        b=i5WCVo9XfIBMUJTj2MZsqhREo5pFrI4wliyyOGpGA87fb4ueuVUrTkBqOdM7r7oNOX
         U6S4OneTs+8y0BVweIYrrY2iptLKfkJuOFQGBRMgkez7PSmI5fbmYlodDpcn98Gl8et/
         5F1lb+ZhUpzrrzScaI0Ym3aT3DjSdSk+F5lb+IdefCOVYzhb4NJWeONK6nLR5WdzOB9r
         XA3mEJujiA8slQH+cCPzXBDsPPTdTmtXMWGGUvfuTSz/9MCjEvT6E23VQeOou46mTcgn
         7y+8se/oA8v5v/4Akuwo0nAax4KS9S8O9wMQjUojKa+dpcc/+xRTseVhDapxErbkjZco
         qx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159755; x=1765764555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKkJmoXSHwgOEmZ7UP4UhmBBGJtWa5ekgvOQqU+FCe0=;
        b=I3N7Xi5mfzf2MEvmb0UmEpge+J4KPiLTYzdBjMEhLwkrjImK0zNUrcThUeLbVd4wUv
         Ubb+LJj4dfgTO034bso7VGR3D4yUgTvpfGYAnZzN/5/v25zFvKTZoDSPn+Pmo2Tb1AUG
         k8rlVVzBU+9kXU/DcmSwHXu0Sn9qkJf1J+DfMls3hOnmfI9hOM/GF8ROD62MmprcSV6H
         P08EEZRw9owb8QqUkNrmeNZG55pImgLvhkBfY5kCD5mFkL+EkNp5aW39Ak/rPsiw07Gr
         FuZkJSGDEGgN5w8sjNsiRf2gE6APvZObwQJhIuYuF1PrtNxnSr15lg+gL9iiGFQqcDiG
         WcSg==
X-Forwarded-Encrypted: i=1; AJvYcCX6zv82t4saprDMaNH2Vj1r+WRMufQA6pkyUEaBk0g1Sn9mrL/4JGELL+2f/4LQ/UYBwR9UC0gzpTJqw18+39QH@lists.infradead.org
X-Gm-Message-State: AOJu0YxURNNAqd/2D+ezLwWjFNussmwLOICT/hE/LbPiMUrZTVdk5YpM
	f1R45KVa2p3KrdLvkkkNnBOQ3Rr4YvqljA+5ejg5M3BKJ3+aCKiH2+AzGIElXkfBOIL9tNqJmHH
	szobAV08FkC1t1m88Hjpxzned6l+q0UBd9G6S4e0bL03W+qbDa5n0g6GVYQmxUac5LUyx7Uv0Uv
	tp/Q==
X-Gm-Gg: ASbGnct5MC6N4s8ooXrP89KWu2m+hj1z7bOJCphMb2lY1TwhdGlmBFo5dyB1Ym+HFRe
	xuZn9KNr7mnP5ANtgTa9UhxkA2kDhacD9yjxuDzLRPmJItAPkSuqSIS6q9w2sAM2Tc2txfCNhBE
	++V9CBzBsTwrWb8SH18dYZ2HLdlXx0PRNE6moqA/nRgMdIU4IarI5x/7E9r+KP2UijEltQCp2r2
	tTKFgiQLBOPOz9mcNXoefWK/k4/vsDLLIv2qnU9TPY56p+WYNnaAme5vMunEHvmPaEydY6+udSW
	/Z4r5XXmIhCVmPwpqQg6iLb7dx3ZZS64A1CS5dgGUQDuXtOfmufiBdM7XCJBOl/zpk2xLlq1Wmt
	JY4SnMcUqYBfEmyfyLTMriQ2a2b1gWsiSFE6YRk3hfvVdUDBgsO0LiOqf
X-Received: by 2002:a17:903:1746:b0:295:592f:9496 with SMTP id d9443c01a7336-29df42a1e4fmr44650815ad.20.1765159754449;
        Sun, 07 Dec 2025 18:09:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2HiKEGWVVMYF/13s6eSajPU59gNFCAfNUhHZX1potan5zoYXxppuI8gWLZg9/BuxTdDqlYg==
X-Received: by 2002:a17:903:1746:b0:295:592f:9496 with SMTP id d9443c01a7336-29df42a1e4fmr44650605ad.20.1765159753782;
        Sun, 07 Dec 2025 18:09:13 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae2552sm105933945ad.88.2025.12.07.18.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:09:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] firmware: arm_scmi: Fix confusing cleanup.h syntax
Date: Mon,  8 Dec 2025 03:09:08 +0100
Message-ID: <20251208020907.5476-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BxRojLwyf+c8qcMEFwrzJjujheqjdTZIXrt0VaiDzxk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjND2zygvphvTpli5om48fSGCk0RVRokty/wP
 rTcOKsAWfGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYzQwAKCRDBN2bmhouD
 13MuD/4wIBFhZBId+jjIeUCLxWleeQsPONBAJTz4zbOsefTT3TYRj/jI63obIrdDTsJ6jaUVlhT
 Wnm09FF4DU20F/hMIe2mcH0RnNnaCMFTt1ObO4Wr3xnCeecMq9tflJYcsvSw4M5njjI/Sz3Sl1G
 KJ3up0mQl38YRxhXyJJ0O9Cvh/nujhuV2oGDI9ABbw9dzDje6HmYNGhmXuge+I28nOasLBTR/UX
 mVOU4c+80Mu9+hF3+iI4N0xoiwLtugwipolcvPRuiaBXImzWbdEvzfm+Y5U2Q7NeaUTDAUw8De6
 ZP5yQnt0C03gmgU+2LFmXt3Su2N3COmTtVjjG7LBy1Yztc/F0NCgWvccENiYkm9p9vyJpYEZqmG
 A8UBNYWLGX9y46pbQ7r5ALzQr4nNRXTjQ0ZAKLI2NWKMiTyU9Y9mp/I8VFy2ts7umzQ0Vi6b6eu
 mtzJsTjFt00zVO1sLaQ3v9in/b5CT3+QkZ95lwc4TzSfvWwqYSh9OS47mMNgdiR9DgmtL3dISNp
 0V1f3h2VckPuo4tTnmAKOf2XkUe3ifQkL5NpTPCRNa5s4mmpslfreItl8sO6zvheuvTTcFN48Uy
 esVdmNfP2mIxlZwcD/x0uTryl/rvjUKEUeAgrgy1eGU7n7DX2Cx/uu+Ijc56/8QMA2Pj0sVXTp3 EJy0BDWi1/fPeQQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=6936334b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=U79RhWn09M75MijRk9YA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX7pCPgHNxUPl9
 6rN+UVHP5DwuTI/WS64hBjA6RTGmGQh9teS8I4GhacLjrsgkfzv2DFYoy9YkavqSWA1czsambvx
 C9+y6spCn69xNQk+xaaJIL/m3CN71ASkO+sR04bw01N6LavkunlQL+FSpynz494Mgu6VOKpW1iX
 Tq3xxNKVXFum5unFRxQ3IUQd0Fr9FjOL9+JdCwDPZHmK1MBmMWGo7aj0/obCNgVM27nIDDV+xgR
 in68xog3lKnL148htxAXm9HY55iWaj3HRzRq6Dzgt9jynEFurqr1tisMJG8gpB5ttoqZKUNKkUX
 l8QI4RjOWdGluKS7sqb6hmqEE7701TmV4LVahxo8oG1gX3IAE8NpuP8YU/1mGT2Eonouyxx6z82
 yklzxx/34X1loPdvBE9Qu25ttz5u3g==
X-Proofpoint-ORIG-GUID: YpE2e1vCfq3H3Um_5yu44SHIPZa7j7fl
X-Proofpoint-GUID: YpE2e1vCfq3H3Um_5yu44SHIPZa7j7fl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_180916_850529_859F88EA 
X-CRM114-Status: GOOD (  16.26  )
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

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/quirks.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 03848283c2a0..4fb09bb8c6b3 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -218,7 +218,7 @@ static unsigned int scmi_quirk_signature(const char *vend, const char *sub_vend)
 
 static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 {
-	const char *last, *first __free(kfree) = NULL;
+	const char *last;
 	size_t len;
 	char *sep;
 	int ret;
@@ -229,7 +229,8 @@ static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 	if (!len)
 		return 0;
 
-	first = kmemdup(quirk->impl_ver_range, len + 1, GFP_KERNEL);
+	const char *first __free(kfree) = kmemdup(quirk->impl_ver_range, len + 1,
+						  GFP_KERNEL);
 	if (!first)
 		return -ENOMEM;
 
-- 
2.51.0


