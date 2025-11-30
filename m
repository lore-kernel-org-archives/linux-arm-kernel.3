Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C28D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=; b=ge2vS3HLi4eB2mDfJQesN5DuQE
	y2LDWyfFeM4AX/S58DqPwztMve9JG7kvAB0S5fvnRPvO7i/4xnEL0k+NBVnT2g0g0zi54hrxbm2xq
	Eb/zXzKQYqBX7yti83AsNLBn1QqeSWh+mGaTtJ9XVq58kfbija7TmHTkSwZjl8825wAvIoTtfT0KY
	DVe078RhRUZFM+QzmHytJp2gNn2rzcj5H7vOoKN/8nXaJgnvufBFzrVVk2EEYGEcFfzRkm+jVnCGn
	yiZ/X270fx5c/umGC3Z0qmqefzKg1sjpV70WDA/U8a+BH/fqh90Z3S0SbIyK+p2K+obTY9wH1LJDk
	yC6Uzg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgfI-00000002I30-1N3Y;
	Sun, 30 Nov 2025 12:36:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgfB-00000002Hy3-1W2H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 12:36:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU6rKW4154509
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 12:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=; b=Psd4w64sy2iM4eCI
	tk6IzNgPxsp0zPjf4ZUTwUfnNWHLeTFuxhK/+qfpmUXarSJ0MAAD5AVhXfqVT9b2
	U+AHwxeEm329DrK4GI1jkIr7MUdaOCiSxbFYuiPwhHDWL1E0oIN9NPlX5WfeQmP5
	lLR5gkp+KywEXuZn50miAxq/ZyBUKfGfhqYKF3lit8j2+lgPQ09ZwrxjcRpOhtzh
	eO/BR5F+hohY1QCKJNFGxWTHKm6SO3L6FDILpOhznRYL7ReI+nN5i4Ym2353BPmW
	Jc+4UjIYbMQG6Qd4C1iQwF3YYebL/h82eJGvfBl1Jq33S4WDx/AqIEJ3wNFFcQ21
	+ckBdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt0j22rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 12:36:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e2342803so648891285a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 04:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506184; x=1765110984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=;
        b=RkHxLnKjGteBWhCGCSJww+ZaqYu7D5CVOKlrAWTC97FlZhvH6YsgilYzMsgU5AycTo
         V2VrdUUPiuO0Sm/qk5NMUzlWhSzyint2Xck5j3e2yYrWu4AgzqUIoOuLv+H3JjhXiBSH
         +V9CDotJZD1q8GhIoWVrP3PlYPgXApuwmslId4Xdw3oJv/0Gsz+AEiRkqbTxuxuvxKaI
         7HMPiUi1gdNS8kAjmvvqOKoiAaswuLNrlXf6rhCfdK393HLHFw5qPR/m7md02fyhdZq7
         XxE9mrsg6Yl6ntUeeJqvLtG4+vknHPKMKA8QRkjxCmbCRgO7+IMfj5sjaolbRpFrez+y
         IUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506184; x=1765110984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R6m7eEIarrZvPjLUe/bOpRLI8mtRBQO0vBtG1dlMFXU=;
        b=dCVow31aW+k1VC7xnGo6dKFBZLSL49AsfLXRGMptEpw1mjHqXrvNPOXwkDpHOYpQcj
         7hrshn8UIDSOXFFJ1ApXvZeNjRRHu/uk4nrbRU9QZlCugPgTiRaEavpj3fak3Jsg5i6x
         8NZ4S+stUGZnERE1OwVklCWvblwGx5KIiUVu3LozJFtd8HtkAvWhileRKcuC1LXEJ9tk
         wR/3PV2ZLcPtLHkA9qB3g8AONqOSuT6p0ACry5y/F0P9rDblFCNyFgoMOfHqLJFDG8cY
         o3y9MCoP+SFs6QUrN1f7DtA3FvrG5y72eD0Tq3eZuyvyMFgq7KHNAoszU3YyjKvxdIBk
         FnIg==
X-Forwarded-Encrypted: i=1; AJvYcCWjEs7yhSZq2yRCCiuFsSGLVs0oADebjqGYO7nezJ6xidLowd/HJ+bZSOe76QIvenuovJitIlQaK55m2qu3BhrV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6enBMW9gEnaFLfm9vjpYzspyTQl1CRz403BrBucT+uO0e5itI
	kjV/nrd3me0w7nOfwTpp7cS+2liay51vT+fZjdgOn7rOBiRjUexRMBkmLaWRjoit2oUcjPNq11U
	5qP3y8lh8FB+DOLrf3jfOMJ2Ye2LgEWkhN3OewnMtXyNw8ppeDuaqDnih64KZGGiaHj6kSKRWEM
	UyDw==
X-Gm-Gg: ASbGncvgZr4JFySviadmKe4LtKcQfYWt74tbJwjDpbcqCKXdkfPc9KsaWNC4Uha3z0L
	NvgQX1fSLcrAH+kfo2hyhowZUSyyX8y2EZZGiznqJXsQLXMiWCd8HTohMakQd6hcmLw6ja7vEF7
	xxI4MqcBnCtd8KPihYvZyXoBb7unUIvexvJBmYLqoQUW0pa8f1jh1V4gT67K78yBgLY2rkTGYCj
	zE1ovZ9oLw39KSDSRnIuAR/tE9uSf8qKFHuQHBwhCaFKpnqrS7nwimcTEM0LlFDSOYI0g5PXyna
	5rSdMCLeHni3rwFEhxsjK6yldtJU6BHPz3p//xBDlKBNpJUgr5CtvDhB6nmSeSuVMqOJFcUAnDN
	zbVIa6gTt0sBlpnhX1EE0+ZFIosI9SmNGwA==
X-Received: by 2002:a05:620a:4113:b0:8a1:426a:2cca with SMTP id af79cd13be357-8b4ebdb059fmr3114732685a.41.1764506183738;
        Sun, 30 Nov 2025 04:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGva41J52XjZOZU7QbLozxUApp8fRFBP8lWVjOor8lQjogi2oWu9rXWmJiA9F+qyVfN4igasQ==
X-Received: by 2002:a05:620a:4113:b0:8a1:426a:2cca with SMTP id af79cd13be357-8b4ebdb059fmr3114729585a.41.1764506183284;
        Sun, 30 Nov 2025 04:36:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:11 +0100
Subject: [PATCH 4/4] ASoC: qcom:: Constify GPR packet being send over GPR
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-4-cb11c7e0a024@oss.qualcomm.com>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5742;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9gu7wWK680Y+R77IwqaMtBNCQ9pWc92nao0jPv5FZKU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo9F3Cb8NTt5YnUJG7vYG29zfGYJNTxXFDJt
 8YjFrKuC3WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6PQAKCRDBN2bmhouD
 10uYD/wL7QRRrhU/H4mmKeOeLk03AFvbCsXoTZfBu3jKO/5Vj4w036GolvoqdUaOp4X6KW4Og9+
 pUtWYb2x2vIX0vXbEqd84RxA6riHyU8uHPxSNqZOefGwtyPcRPL46wGIWL46UFYocJLELTOsD/p
 0eHJ5I10yZhUIA7MzVpPOf8kd2kSWj9UMcIpuhRQvAoMWrWHheaqOQT+ROjlcaaU/1i2rbevMGV
 pcxdKpD7yMwSamCiS5u/cfw9vXZd3DhL7IwoXkwIf6T4J0S6UIKu3vrci5LUgk/bBaAWZqOLySY
 b19+66fFjdfJKD834yt4O/2/9bEYnRm00QUmDslv7+8IB0aOgZB82Ii9JxkNr+AHS4VCUN+ldGp
 VmsGUvWXS8Uu82zG90DZCMUItjg++EcafrVa7lhtCm5tRt5L9eUR61FiEfWRU+ol1u0ueqFgEhw
 psCiNk18Q1s254rhBR7woTjjGBiNih5HVh9yE/zDEAf6IKpu7be0bzO2kPZtVLtyHvKEB+Vdmt3
 LhStPsZf8m0efgknijdb0PwjTbF9Uog2BTkdWwVDY5f2PnM7AEsy39+JKoX/+KKnTrTsleVGpyY
 /zbSdC34+6MGgi//8h91XQ4i2iAP6LivYk9Zz0KQFbx4tBJ1qxQQ4wiCRrRL3/PZ+i1AwxFaqKV
 MRyrzjWyfv2hnZw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: v6f66J7lGlOyzia5bJ6nOEIjPSYZDAtj
X-Authority-Analysis: v=2.4 cv=WpYm8Nfv c=1 sm=1 tr=0 ts=692c3a48 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EI0PQj488oBMEGdooaEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: v6f66J7lGlOyzia5bJ6nOEIjPSYZDAtj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfXx+wltNtBUKQK
 INWc6ZOyIE+2UI9RwqP4t7pe7HkmbTww7CL8zDvZTgqURPJ64e41eZcZ8/SOXMMeiBTcejDolfF
 8XzprijbrjqF2sBZDUg39IdVBrv2tt7CB6p0VPNQvjVnPh2PZSv53tq0IaG6AGPSXROcc0KGodI
 jpRo1TYpf08LemcFN5WhzCOHFVG+ZvqUv+bS4q3eJuA5YcKJZf15R0gOyPo15hNi5VU6x9OgfdN
 fsQQ9KVfXcuGdBoauwHd2/aVDg1idJr9o1cGn3fp9CWsOD01w/a3txwJwVnI00xGOmU8lHL7Ecy
 TX5qCeqwpzVxA9kgB+bvLBFFAzmK258hi8GeKqH12MUsMmITdeZYG/nYtLz5W30dVa8qFIA92Lw
 XG0w5ZYAKx1hqMtX4tFGpVYcMHfKUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_043625_411708_7A588973 
X-CRM114-Status: GOOD (  20.08  )
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

gpr_send_pkt() and pkt_router_send_svc_pkt() only send the GPR packet
they receive, without any need to actually modify it, so mark the
pointer to GPR packet as pointer to const for code safety and code
self-documentation.  Several usersof this interface can follow up and
also operate on pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on previous patches.
---
 drivers/soc/qcom/apr.c            | 8 ++++----
 include/linux/soc/qcom/apr.h      | 4 ++--
 sound/soc/qcom/qdsp6/audioreach.c | 6 +++---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 sound/soc/qcom/qdsp6/q6apm.c      | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h      | 2 +-
 6 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index a956c407ce03..b2e1d9a351de 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -123,10 +123,10 @@ gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(gpr_alloc_port);
 
-static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *pkt)
+static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, const struct gpr_pkt *pkt)
 {
 	struct packet_router *pr = svc->pr;
-	struct gpr_hdr *hdr;
+	const struct gpr_hdr *hdr;
 	unsigned long flags;
 	int ret;
 
@@ -139,13 +139,13 @@ static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *p
 	return ret ? ret : hdr->pkt_size;
 }
 
-int gpr_send_pkt(struct apr_device *gdev, struct gpr_pkt *pkt)
+int gpr_send_pkt(struct apr_device *gdev, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(&gdev->svc, pkt);
 }
 EXPORT_SYMBOL_GPL(gpr_send_pkt);
 
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt)
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(port, pkt);
 }
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index a532d1e4b1f4..3a02bca34b3a 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -191,7 +191,7 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt);
 gpr_port_t *gpr_alloc_port(gpr_device_t *gdev, struct device *dev,
 				gpr_port_cb cb, void *priv);
 void gpr_free_port(gpr_port_t *port);
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt);
-int gpr_send_pkt(gpr_device_t *gdev, struct gpr_pkt *pkt);
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt);
+int gpr_send_pkt(gpr_device_t *gdev, const struct gpr_pkt *pkt);
 
 #endif /* __QCOM_APR_H_ */
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index ded49124581b..297592b77925 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -552,10 +552,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 			     struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
 			     gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode)
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 
-	struct gpr_hdr *hdr = &pkt->hdr;
+	const struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
 	mutex_lock(cmd_lock);
@@ -595,7 +595,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index d1b60b36468a..995a7283c805 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -805,8 +805,8 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph,
 				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 94cc6376a367..d3943d07cb99 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -29,7 +29,8 @@ struct apm_graph_mgmt_cmd {
 
 static struct q6apm *g_apm;
 
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+			uint32_t rsp_opcode)
 {
 	gpr_device_t *gdev = apm->gdev;
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..a39f6046f886 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -138,7 +138,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph,
 int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
 			       unsigned int dir);
 /* Helpers */
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
 
 /* Callback for graph specific */

-- 
2.48.1


