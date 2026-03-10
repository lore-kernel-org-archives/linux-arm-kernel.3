Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7895DEB104E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=; b=OSz+a9bbiQShN+mGqZJ+YPtRFZ
	GDGYyO9TPjWa2agBUyEt9w1c787hGOo+grNuvfhgQABTNZUdzBhjV7MxmPyTe59z3vDGqRD4rTBt5
	3Cy5eOBZQw20d0SsEQ2WYOniCiCmvsbZD4WNK5NrqkX3cdEBJYNpIpkToAGtodPFKAtl5kv1WXKpb
	XTNAfZSoCRti4TWaqvIBbgBp1Pt+9AO5S7f15n5vwN1EIr7Q4CFV//UGEK/nQaGuRuIwK4fr97LFN
	SXYHcgVUxVwMOsZe8LDxVtoVhqfvm1CZTvSe18iN4kZegdY1Whx1ldY7GNuem6bkUK4EijZsg6/VP
	8wW9bL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAz-00000009HMj-1MSZ;
	Tue, 10 Mar 2026 11:23:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAu-00000009HHn-2xNu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 11:22:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AA4Aoc2501223
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=; b=JXrm2uLQKi7kTLgq
	M7V7Qg6nGlbCoe0gBMQXEx0E76BQcDjn9GoWrYegfbm1H3BfyRxczwgHHnF/D6X6
	xos8XT9TiW6puiE0266007cOQwQIEgzlYToeQcuRE+N1xaWzaG47wFdjrKl9VLqd
	/GRCCMTiXlVj90sMlIXXUMXTW45vp5glpqdgQpRjm6b4O8eT3kA2b76zr2BZfhiU
	jM9QrP89Vzm5HvyePCqwwzgoXkt2aq7ldbf/hRWo7HTpdpzQ0eMbeiLsESVLLU0W
	nYA9iCt5RwjXAVy05ov32SpzNz8J0dTces544DVoZyFfKrPIErRD+QV58eOeGTYJ
	yxGDOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w933e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7ea0bb20so1408832785a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 04:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141775; x=1773746575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=;
        b=iKF3nm6rIQWJzHz6vAiZICkB5TUgKP5n0uscSk2w1dQL9t5hA+fiLvThaaGBAL08H0
         uhsFMj8Fxn8xSdXrWpSXYJ6hZ5aoJoTl4sWid8bVcJ3NL55wZNI83AITipyocFnKZjVK
         sc2vLqxXw5GHkL2hxPV02+jM8/XSuye0hFTWPhnoASm5Evy5VKxuCw2ahXJcfb3zNXQG
         t+ZN2x9wSbuRujylKQuoUoWxqzkYEDRpRGU6fFlRAx/mssM7DQ3sbTAJ1555Iw/DmG8R
         jPrtnV0bI6yj7QzTMYbHaiPOOMuFfYAApxbWqZ7L4VW6vix+FNm0SYws+lEMmRYD0YTl
         D0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141775; x=1773746575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=;
        b=GSd3TMxCR40FEfDnVeAGUIf5gBEdiX+nPIFSw2wUYylFy99JUiafjqFDS6kobSARCK
         HdGW6bXfOVGIOcUkU+OlQl/dA8sSd+Y2fIe4tZXLshB5b6Kc4HZgCOeAgPkg3jFnlIhf
         U1UoBwNzbIX3n4WoAdICQROnBk4ZvPxL9raVsJ8xslypfE/4NghxpXnbCWD7Q3EjR5C7
         8TjSC/Cj4XM3T4UZuyGPPo1xy6VzluWjuC/kNwCLwxhC/0UYD2/AiNnmbx9OUmMBWFHJ
         I06PYv6GVXPHU+ItccspFjCAc02/m/0TW7fEL8lFHEEDQ6lUxRPj1+F7mOKy4H/TE473
         PHaw==
X-Forwarded-Encrypted: i=1; AJvYcCW6OZwRqIU6KjNutVk7Qe0HzxFmUvmW3Kf26rsaRooTw7wbrakzkmiQg4bTEZvFbO9CqF775n1osOZOqAPI4EcI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz/52/nYGwc42mvYNgqTQkCtfASjGHGJjkgalbeUcY2B14e+F4
	bevbUH62c+7oITWIs/ciznKCn628pyPoxzivKhQRT3zCQDGkPzIqucXPYtdLL4Jj+5v3wGGzFja
	9fVTrQCDxbivgKrnyJdn2gkG26or2OJhLcSdzN0VsMeB9Ls3FLzm/T90pjLo6x1MMAKKMqaRCvJ
	M/Nw==
X-Gm-Gg: ATEYQzxIpVXh35sDS/zfHOnRDUZTc1hFMFy3eMaCVHMFQli2zvMswCFIQaYuW2mThtN
	1GglWOgr/wH0LVkduENegI66BWY9qO8GOOUzbfSZBoGpW4qf2OV0pIdMPCfb0BKYB9Vtgm1qXNl
	51F6sSS18D9QXZIzt1Rhzn5zF8JRKouAr4eBZAObcaqXq5co+6Gef1PkiTBK7oKQIjT2vNYaDzq
	Wi8AZhs2cjgWIP4Qk7dFUI8kHPNjNdA9d/vf8c7X2jcw2BwDQXYuBbITVsRLDEdr2nM5FUFtjgO
	YalDG5MiHUCn6+KWNdVGNvaMO39Ck14z6nH1gJYLr73xQM1PHBc+xqncSyuREeggXkbgLrTOWKY
	zOHzYHdltb1bnKEKcphmPRN+erzYr5EIypgLxeQomn82c
X-Received: by 2002:a05:620a:1a0a:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cd97a7a6b7mr115246185a.6.1773141775136;
        Tue, 10 Mar 2026 04:22:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cd97a7a6b7mr115243385a.6.1773141774703;
        Tue, 10 Mar 2026 04:22:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:38 +0100
Subject: [PATCH v2 4/5] ASoC: qcom:: Constify GPR packet being send over
 GPR interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-4-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5803;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ObSXKiR97buxky/PvKOJ1j+VJH8Bidr34n3hBEMA+cI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/8BBvkL7GdnzghQsZVsVzlQ6xuKDR8hY+hPc
 IpGCSsqCf6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa//AQAKCRDBN2bmhouD
 1x0tD/9jKwfDmntMF5yMlc1fEIOn5KFtHA3kOJbdg8NmqavLKwylVyFbeRfeIELfVTuJTZPiP2J
 ntjYCKKtRvS6juhf1SZsWvs0nGc6J1cQ2Z7htGENVpN/h6pr2g9MYj6jOL7rsWyOIlHxGHcBjiN
 I3QNpG4bZFEGc7nU2MzcusCMtM/T+qiYut14SX9K8tZII/QnJ+VofsnR9zT08J0Y6+jvCrFv4LZ
 zXWvC+NnQgfqmOWRaSsG/nFNY5E2tQP7CJf/ZKxwHYZkqTl85W3yBqFsubK57XGQo56jARyyb+C
 1aIHQE3xwTKWpHjtaAnNWFJ0o31UaSBStTRywTRe4UGcKRhqI3HMTXpcK2ODrMO/M1koglao1Be
 EdaZHY84dxuG9b730qn9ZoP/AO/oVFz9quLdSNTq+qR2/n/8ah1dhBOjtQOy+2PhdFowFFxwqlt
 nZgDqMpCjsTqq9AFXe4pUGYrl/pEfqQZEnmx1/8V0azDfVELg697mUAJ3lgjE9yL4wozOBW9jii
 M7E2FpQFh3XsFTajda66ebiHfXhGouXlwFfVKadNOlRenl0XLLb7HOf5DmM88Q8vCzbtU00ZeDv
 wEt+JIrBeEi7p127S6TMq/2mMebHu+00vydMR5HprYQk8jHuivG2cOrKMXgO/FkhTAP9rNqTmQr
 QgwaVSTGAqkjazA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX4Jj1m0Yun07w
 /89kfY0k9aUpLlmAr61px8B3Bn/H2P3ed89qkqHgBdf7hhi0aL/Ne1emLWlaFONDj5+9HmxNv/b
 mkjwQCfkg70vs2tlTUD2SguZOJnsQJIzN5r6PmI4XwEi7wyJ+vyUXM475g4HpU9AaxngB30YWsd
 E8pVBGcixDm9Nerikn7/0vVDb1DUZ3ZoSaLmYFsCwo3ldqrE/9I4UvcA7ssaMZKUMuNfDKEofCX
 S6QzQ6HTN/dY2eoyJyVqQwlAFh6d/iLuGCJlF/vauNdmwH3fhMd4aI9W7xZGgUSNGWbw3gSu76g
 hD/HSfnRaZxvIioC6vbzeQX4d0+aO/Kihxu92++g70Lzv+vc5JidOCF5AMbjYZJsbwWGXfzKj6B
 NsaSuaoitXpRJgzjI7ZtQhAkfT2/hKkeBjE8hucXvgf+ZPvwp6yy112piHaQJo96VHWxWc2tIsr
 A3iq5y+SjU/PcvYo/nQ==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69afff10 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qTtUXMQ633XYL2vtSbcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iwq6TQJas0V8z6n-N8Xu2Y4Whh-Z3KLy
X-Proofpoint-GUID: iwq6TQJas0V8z6n-N8Xu2Y4Whh-Z3KLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_042256_864235_563673E0 
X-CRM114-Status: GOOD (  20.35  )
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

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
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
index 78e72379a6e0..ea7f83916d8d 100644
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
index 6e1b1202e818..58fa1df96347 100644
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
index 241c3b4479c6..c84e098230c6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -579,10 +579,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
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
@@ -622,7 +622,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 89f172aab8c0..6262b9251440 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -844,8 +844,8 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph,
 				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 44841fde3856..3527ad1acbca 100644
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
2.51.0


