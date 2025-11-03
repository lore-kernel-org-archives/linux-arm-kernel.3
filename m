Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19B1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 07:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMiAzcEtWsm2GpmS8Mvt7u1so77xL7gySGMapgJ2dos=; b=Zo0ykG5koRMRH2TbTdm71GDboA
	KHzpigvyz4ASpXEyRKla/3kg/5J9xKF33gIBvVDx5YB1OvUzJpVi+QuUntDykLFGQ+zxfFiIAHhir
	WHEupYAMv3b8qfLxhsDiJ7KK0rpqj3XOISW5I4a5fO8uwqbyHa1DQ1coKmdWJiDR5jjuAivBBP872
	lNRqn9fNCutV0mYZS3PjSzzuFcEbV2VsvdJrHZpbFZadeaqff4MpHRomLE8dDxMozswOXnX0x14R3
	2Skn/DPGG92XxcW06XXe+UdBgSlSYP2T2I/1YQayrSQRKRBuYRsTX3aXaF4m3O+cDjnPyxyksKEXI
	/nX28jLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFoeR-00000009KT7-05Ds;
	Mon, 03 Nov 2025 07:06:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFoeO-00000009KSC-1aWj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 07:06:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2Mhbqf1457857
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Nov 2025 07:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMiAzcEtWsm2GpmS8Mvt7u1so77xL7gySGMapgJ2dos=; b=orCV1CB1h45GUHdk
	uH6RhMtC5KQ0W8DOWfy6OEkEi+JS6r3yLtj9NMyn5Cp5F5BK5n2q2wweSQvCGs7j
	DBmCYMpBlsj2pj5DJW1QK8w+KgmchGqroESQSYFfPNDuDaN94cndWnbBMAGL0q13
	Ac5auVxMQlHcAgDn0rIJf8Uo+LdIZcxfjKmMwLY67e+vEitNHHz39/aQPs7D9/Oy
	ME3C0rYcCPTkJJKgFIR90qiSOwmonJ4m2ed9dsykAMiYez5aNU9MxsGWPDtRzNzc
	tTSzdfkCI0NtfOvYmjfNDeRoWPkK+OAvuyUWNXw/2Co4yYRtAvDraK2lAF2SfmeE
	K3HMTg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57jn3u0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 07:06:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340c07119bfso3879222a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 23:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762153606; x=1762758406; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMiAzcEtWsm2GpmS8Mvt7u1so77xL7gySGMapgJ2dos=;
        b=Vky+f974p+1DITMD4G8KzisPAuBFuFzGrjO/BfwzQItq84hvekDXdzRse0+BOM1FMO
         P8MXnfAtiXtqstlHME1fKtxHzGAiA1MCu8lAf7wN3oFVlBmDFGnUVeT9GzEEAH3ubnUw
         cqmvqV69o587h8VMCWDOs9yn1zPyw9grctOOezei5KY6MSuNQ+Z9l1VMTyKXL2qDke/v
         oDykWA1ubOPXeYkN429322UFRJtw6Jw/EkbyDwq9lIwniiERCG7bCX+JK4RSvVPM+LRa
         PYMRX1DMr6JwGyVakUZYEnZsjh71enZNgz35ZzbF/oLtw09LSLtFCxTUE3nxaWgJ+uO/
         nXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762153606; x=1762758406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMiAzcEtWsm2GpmS8Mvt7u1so77xL7gySGMapgJ2dos=;
        b=ocdGogR/fQKQHxNVShQzCZtJogSEbfZuXgq0eT00rhR9VBF/R6AplMt0pEAhKBO0X8
         wSx1sEccPTyg88ph5ZQGh57pb5XvRyXSiY6U9dtC/EUaGoyCCjjXDOMq/+WsBCeT7ikg
         QSdm414Qfq8zSyt8HY4Go/v4QoPfqgGUenK8W7KS4JBtHu1NPbnC5rtO89yTptKAY2gh
         1r7c86nLDB3DZ4J3r9iwNHxUlJgRn7qEInU4ye9VKQrDL/IMalGaczvPPV0hHpmqeP70
         Hjp8YbDBkjFgahzAU0JB25f/JxS6L1iu9FxG807x+gzznWEfgzyYnLjv+hX7/tpH0lxq
         eGyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxAx3eK8s5w4mkyPZz9G7VlRHlwFbKbknvK66hgyz6XnuMQaHfcNjnjZVS/ljrG4c7oXtk2RLB7dbUU1QUQAZm@lists.infradead.org
X-Gm-Message-State: AOJu0YxrodbCrPYDI3H8YEw0K8GJ8RqEMs4ipJPqhwFYCrmPV2xcY5wQ
	6tUm3kS0aPnoZew0Zxia5T27WhTbz13NnEFQ8CvVH4ICG9upRMWVIiTBHB87oRXuJErt7xssIUR
	HX/bau5jAKkF006OpB0NLRbvwdvCiQ7APCUeXCCyId8GU2A5h8h8nS8JOhR0uQ7QZPg2RKupmHb
	ngSQ==
X-Gm-Gg: ASbGnctbUSoW3cNcOBTDT/lGEF9Sy76bhMql9fgP2yg8gP37qxsQhtfAvSCFQCQq68T
	hri/UDKGidvilKC2iSnpLu9Q9cOxRXFZtnY9tRhD79IFneOjlkK+SG2/g7gUea3udIzd7cco9Aq
	qyM474h+/w9yjeyoodQyeSe6WccaFw2d1oDPL5IMVuWraJXnPAt9BDhVCPMF47X1yscX6nlhhUL
	QJerQHHLLghO0mT0/S0k5vb3oQgcJIfe+7TdK7hW1VqZPdEANyp6TpQ4SAp98RqiNOEEryIZ3t0
	paBnCjCfz+6UmFhNhoFvxNGHLDooC7kb9KKUMDqs33ZMSDgxTZa0w5Gnpkbc/6ts1TRqGDMnMyS
	XQifTAFMqYeONiQ6qUiEYfIF+OzLdoB9tXS0I7mMvxR3/ZxwBbWbOtEkGaKi30A==
X-Received: by 2002:a17:90b:51d1:b0:340:2a38:d45f with SMTP id 98e67ed59e1d1-34082fd9dcbmr15875278a91.16.1762153606386;
        Sun, 02 Nov 2025 23:06:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc4H2LRGClZtWN81SzIchmgkncf9wzDlUy0SH6VKxxQ3RTVsKby5uuHb57K49kE/2mymOotA==
X-Received: by 2002:a17:90b:51d1:b0:340:2a38:d45f with SMTP id 98e67ed59e1d1-34082fd9dcbmr15875253a91.16.1762153605909;
        Sun, 02 Nov 2025 23:06:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ef49da8sm5808704a91.1.2025.11.02.23.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:06:45 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 15:06:21 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762153595; l=1171;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5feK2N/IK2O6e9qopvnZcd3fQLzy4a95KobwSy+NIHw=;
 b=wSQTSdvWIFwS8IjlZpSNpP8OrFOJfB2BlcLGf7sNcivE6BG019LCbSQNR8PfHS+18qv+MV0kn
 UpnqjY4VYTJA0HvQJC9yx5JbVBIC5JEBHABC5QH9WqixYL3WueWT8OQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=69085487 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ekrabmmykuFM9VwHVzQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: -_CX4Bb8F6Mk4Al2Me7nm_Rdv9ZHcTya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA2NCBTYWx0ZWRfX2bB0ZbdAh74+
 g1MSR40KH+oEXHgTqsky6cy2hp8u7HvnqUvlnIZ2DFyOr30BPq8dZvsRzD+cI8LQnAjUYitFT3s
 wBcMpNJTo0He8EX5h0ZFelursnC2/j9cC5nmGF8djZEv70Tfb/5FSGd8TjdV+j1UjGZpga8D0IV
 QGAgWHVJgqNBCyL8jxywiGo/kiZpAXGK26nYCRChbjZlV3qIUKGyoKJg95bl7XW9m2jv2rmeJYw
 tEtjGSqpFpx29IQEVfQzRQNeELa1ZsJ4SmK5ZhNOPPS0O5+84FhlD7s/xyw+6cg19xGuBKMPrFO
 9AGSarYAH1Lwspauqe8KE/1jKOFbjEgj3mPRP9+yp1kUCMZjklzLHHTIrmWrgKiY0zKNts40HgC
 u0pBDqS9wpM2vXiuxPxDQG+Ei7ab/w==
X-Proofpoint-ORIG-GUID: -_CX4Bb8F6Mk4Al2Me7nm_Rdv9ZHcTya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_230648_542977_6889481C 
X-CRM114-Status: GOOD (  12.84  )
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

The CTCU device for monaco shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for monaco to utilize the compitable of the
SA8775p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..460f38ddbd73 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -26,8 +26,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-ctcu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-ctcu
+          - const: qcom,sa8775p-ctcu
+      - enum:
+          - qcom,sa8775p-ctcu
 
   reg:
     maxItems: 1

-- 
2.34.1


