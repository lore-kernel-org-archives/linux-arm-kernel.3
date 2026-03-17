Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB1CFD8764
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=; b=yyxlrpss0wyTnjwqnTjaTKO7cf
	NdnsjoieqdTBNisQkrmZj/SFgdubfZ3K1SzSHQIKji0/meYKzZWaSvPeO6Mbe/L6Y7cotfWiL6jnS
	MZMsJR8tVEEMPR8rTOO2SUC01YxNAMDF1FOXom6cr9KI82pUwYyNx00QDiPti9CoZTCj9VBojhsty
	BVs3/o/yHhi8O6+RVy4aWXKU66IF041SVJUOYffTs0ZXsbCkB2FqecCo3Pr6de/FrNfVy46od76jV
	xTSBOWxiAZerAXxQKPjPc39Q6/Ih3boq/+YxqYd60KWZeZ0zWaHtQlOgmO7QDox5qAgKamq3+7v4J
	hMQhJ5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfk-00000006JJN-3hhD;
	Tue, 17 Mar 2026 12:37:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfg-00000006JDc-3Qz0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 12:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=; b=a2t2DS+GjzabgdnU4whin1s7U7
	gU17lhD0cIRPAHwLgVPy3vsXETMTNPjFvrvzSP2CQX4dl03x3zjvZvJTcXkhlLlOdgxTweC3Kz1fK
	JCSTz9xkPzQ1oLrqG0d0lraLyFNUkY20cfR2cWAIYLeJG2fev6+JXhexqt+wBYhgmNq/DCOdPMvUI
	UrOaqOuVuhbqsDPL4E2ouMjLyJWWhdcheSkQJxqbt1TyxAmQjclcFqB0fXncePea851BYTxplOA5a
	/gIIrQT/vF3NbO1QFS3JGpa1Mcnair0STDOgxiMiw8dn/wnsnpU5+KGDdYpqS1qvA+HQhz6gmkrUg
	oYwo4HZQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfd-00000008z1F-2k9T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:37:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H95QaK2314566
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 12:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=; b=bmxbsWPsiiKK1sv7
	MAIjjzQGA6Op4Ez+yNJNtT0yUpe54FD8rLVAcdlkp4yN3Nn37ghPw9Xl69vFIEed
	kplsOXxKGglYkMIohmP3GYibKd62/1XpfC2Ii/EZq/p927zTqmcdARCJQ4QBzf/j
	PZjUDaiCYDhsYkDi8F4gtMy5g5cbzCCx29uj6/pexDv+q1ehSmmI6R7r1iNTFVXI
	TYRhVJK2EKQt9WKG7X4mqBR38jwppv4MWBG4/e8+s16BkJY7de3Gv6I/aWJ7mk9X
	ZG9Wo3qc+xoGir/fCOMor5tUcZX2ECRu/g3XdOYU//7jAN4OCSGwASDHrbha6Vdh
	oK6AtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2bunf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 12:37:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7a25c5a9so547391385a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751032; x=1774355832; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=;
        b=JxS7kTIv2gqWT9hYAoQ+bFdQB3gKgT+DX+OcqGl43cbB2eN/pDsPgjoLdIfpgFAAQg
         KPeJvDewjgx4tnOIDjIJ3+qFy8e9QNSoM3g7kBIhfTzVlWDPtcB0KLJbzql1nZDX04RK
         sXdUyPmvcWmEfH1E5mO3iPON2gTvwPolbvkNODfbl2qzGDS63NgDGx4OUXqdAFPfHlAP
         z/zj82WZX4kPDw7/W6qIBrPrpF3Ml6WIW+bnx3vnlGNyf6N4FaE7Ds/WY5KDxSRuFs78
         TYGHWxmxB0IUgm66x/iVLf0pz6iBMonqTNz+rsjdgI69LHOMRTHmdLZ14ANonZEPHQs5
         c1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751032; x=1774355832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=;
        b=fQ4n/ruuBwbhyQzmtR5mbszMVLpTmafGI+AdhFQthtUioxng2hDh/s7oZpS1pG8Eau
         0Kbx+65bJ79GR+oUNX3zZyYJJiDzYvUTRJqqRMLLkX/jEygghF00vc59E2trSI088cPz
         eATXTSA+0kX4AZAc3HlpkoKJSiHrRz+X9QXCJwCfGLqwJJ325alAyaznhewG8gjQcgdh
         lfCWbOZ6xUO7c0xVyIGATA1UnUncuBHPXSRUXB6eye8zWcrfp3b0ajiyIeDGzL69uq3U
         6uk1BIEgiSbn44WQeldG3jXnHghh7A//CsLe3v2rrFFc94RUhRiJEkfjeT74v5myJFdO
         Qj3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7UjV0ot66KvxZAvDTJCaBkZerWEOM/jKuhTGj0HLvwud92sJxt//DOdPGGTLHDEucsjtwzcMfSzTRDgsZWJs7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3QdxL/LiUGJMt2lhAF9Q1vHO4FWiXndfaizzwZD0x8ZU0mAZU
	U8AdOOKQOcUU1HoSziZ1M5zjnVEOC2T/U9dQG39UWdGfQgNKx9qOoss3vzechvu3ct15mj9nXvp
	eoftoemci0hUebmoykTNud5PZLpDoOiX5ai33kULeMrhooKQlBHqb5Agmy1Ey4/N3ZhF7dpifVl
	Af1A==
X-Gm-Gg: ATEYQzyzbZeqMv7XK7EoL4xbk6esGAk6mfHwg/NyE8AKpEPeAAyUSt/luHSUR5EqbE1
	f+lB+R/EPfmKaxNQ9yBOgi/4MKwvIZEnzOZlp4OvMi21xZBmUzAnJJcBUlI83xqqz+zspq1QZ6r
	L8Dizut4mkqgSXI2nFdQQEi3SdbhQm0/K0X1J5eCuzjQGTRwlYYuQc2ViRUUojo5UOOP6f7paiy
	1CBGcVANGic07QpmpjfgGytpiq+FHy4qA7YYWwIaCiIr/Bd0C03uy8awOYF1AT8Wlri3f4OzmiB
	DbCjqBfNYCQ/85/E9GHNvVEM8H1iSTF6czirruKdnAmwJ1t6/lvAk2Qb+i7eEa28e6yaFdlo4gG
	Jm1sna6KdzUAglYZL9EPYNdSMBe8jOjmsW8yEXU0C+Rph
X-Received: by 2002:a05:620a:4510:b0:8c6:a034:9224 with SMTP id af79cd13be357-8cdb5b1b110mr2171252585a.47.1773751031481;
        Tue, 17 Mar 2026 05:37:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4510:b0:8c6:a034:9224 with SMTP id af79cd13be357-8cdb5b1b110mr2171248885a.47.1773751030947;
        Tue, 17 Mar 2026 05:37:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:53 +0100
Subject: [PATCH v3 4/5] ASoC: qcom:: Constify GPR packet being send over
 GPR interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-4-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5845;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZGaNsAO6/SWilsi2TVuYP5VxbCn0rn/v0fIwUe7gK7E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrpKjAofV9NFYyslhVtg3eHvNPA6ap61m6fl
 5lWEvWjp2SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6QAKCRDBN2bmhouD
 1/kED/4imG8+I9OWKdgGF1mHR2e5RwwQa3uvCrPu6Qx4PoY20Ahr55T0gbApJbEYUeAG8PigeMj
 LtznsMoQ1QW4zL6ULOlc6nO31/NJq5HpGcmjWGYgvPqN6vB/FEhUgeYv2JF1lkvbncWLnEvzMgM
 2KDPbRUZbY9v9sO9dg8QFhRQnUtWPvB9aQY7h365y8nYk96vj2HGnwoN0IfxbDwjNgs0z5ceP2q
 mHVNVCgEw48tYM+WzM/NNhVLvCPFfSnvFicB1mcrpHNgpfsqz+TEcmGU0jtMDMKbiiYuT6J9ZcF
 /anoRDwwKdrw67UWj6RZXlpSr3COQ0sqe4d3ey/w6Q2hKLZ6uH91YLbJZ3Ql1zhV/X3t/rjmUu6
 519R0/5bkegtNGqCtcIFW9SAVKyInWRUl71QP0P7stUU8Y2ljB0Z3zm1x42M0OV2veiAvbjk5Kn
 1GpCKfjhNHwqFTeG9u1v36c9SazZvbs8+lIjsvynNvEzN2EFMFCfx6Es4PwZIiDg7+Z1Ux6wHj8
 lC9/QzoCGVxz1PqmoRJWbg81XO+4WCA7xAFOn5a2pShtQFZhVd2aphq+HE8ohLSn7rIzzx6BTSh
 7YTjJerhe5V2lyQVY0ZQXQXkurlQqlhm/Mnlgf6GGlSFKSvGogqyvCNoTIBtru20aq2EuLgTyPX
 PRkYwDHw2n6+kwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: bdK0KI_0n_BRFfdlZY4T2TLHamCWMpEY
X-Proofpoint-GUID: bdK0KI_0n_BRFfdlZY4T2TLHamCWMpEY
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b94af8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qTtUXMQ633XYL2vtSbcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX9UMn0nQ8Ob3N
 Jddj4JnnPMhaeuIapkAqTo2S7cavcAm8jkx07eHLhuj15Vf+Mfse14TrXTf9AXbh7+v5SV745y8
 dLdX4EL6XZ32DeN6bVyDxSmtWcB0ggY5eGEZjl89VBTAZ9+IkO6RiAMXEDC52D7blWcxVVFvIIf
 PlqYk/ZrNjyM9EAQ8a0ubWMwLGuuJdaqHaTJJusfvG2niWmbdoOzQIPVkf5axDfsHbB0+WgjUe3
 kK/nvEqpROEnMstNj0JKul4ULPnXXPWKPJxqUeRU52m59515Mn1DQYj/UtCy1Sn5Sao8NMPm+Ya
 5+u26gZKqtwEESSEQqen6BYsHi+hxaRYLbPEi4Vmt85QX9fUY29JMW1C5HpAQcFcCI6DhxrDIaE
 Zmzq0Id+4oqOK4n9KfjQ2sADnnvzMqXLCisuUsuLQyz4LmaWJbn3M3UTq7KhnoJUm9m1hEit3D+
 9eRQhR7ETmPW4vk4FOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_123714_061055_E8A70D5E 
X-CRM114-Status: GOOD (  19.91  )
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

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Acked-by: Mark Brown <broonie@kernel.org>
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


