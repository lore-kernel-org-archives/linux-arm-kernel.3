Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E434E98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n82k/w55FcgX53/IQIrWIxDm3R2DN+nUhmvaKVw8RtY=; b=4rqYiQ8oK2sL2Nf0f9Dph71ODD
	Ppld8YOMCIc5FR3+m4o+OZ0vdRL1jfwc7/MgHwoqdPj7Hsu3/FtY9CugXv7S5YNAWo2ECYnwsKpZ3
	N1Mb6qIgHjzb8D0WFo1LBVYIwQoFG0ZbglolfV41w/o6U0l8cI8ujckm0AhWRx81c+MIwaQkkBJrS
	sVTmFOf/eR4b1czbJP+NsOOBqDhycXR/NqtmNYyqjTfQEco5wpsxa7OhFIRSaA1IksRlU1H0PvQsR
	QgZYqDLhJdb6dHLzPgzHbTNLtDTMG58MnO8QRxduwXJLNx/eUKS2632SXZ/byU2kD9029jvrFoRXi
	jTT76Fqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRaY-0000000HRHY-3MyH;
	Mon, 23 Feb 2026 08:46:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRaW-0000000HRH8-2nXn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 08:46:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMtkbK1198815
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 08:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n82k/w55FcgX53/IQIrWIx
	Dm3R2DN+nUhmvaKVw8RtY=; b=jCwqAXMU9nDaE6lanrFtjPTBEz5aOVF1yvjS0t
	vHqw0UgdoC/mZT7Iul4bm2wpBCkPpXmAJhr+NHTVf4cTfdRyyO6cmd7+FWOkJSih
	M6y1zY8iEhp85VHK4Zi6HtzAWU+rme7600bWU4dmJMGXPhl0phNaoTBlUQb5DSNu
	4TI4uv9M9iA75421TmyXmC4qcMUx9WlbLotml4Y4CkK6re7IWdbhkwqQt4Ksce5+
	MOI902ribAwL96WYxz7GYJ0oxcdEOBA14ejNK0zBVP6x78vtGWzPnf6WUT71oImO
	PxmtH/L+ERXGr8gN5DJG0tVYemJHDkZGHZ8pCYW24RDFLBPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m0y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 08:46:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so4595520285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 00:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771836403; x=1772441203; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n82k/w55FcgX53/IQIrWIxDm3R2DN+nUhmvaKVw8RtY=;
        b=dDdoMs/rU2k/94QpdlOtIZw28+Bm2VDtRTc/ySTN2TS300Kv8Ig4nPWw+ehVaZs4uh
         innWbG9RZbJlhRFDi6jjFnQv+m3cmYD/p+m1ab20rsBZxHsyMqipmTGQvumXcpnP+K0I
         M9vcloYZ8T6M5wAxZGeMwjrwiQv65/lHwFWLnKLEKXGgxb17P5Qg6OfrD2WPRwlfL6Eg
         US7ox73ot32/t+m4xdi5mftEDwKTz4AX+m/Bd3PohhmTWHbkQDhFqGHGXYJY6co0rg9X
         ig4IJwU4UcY+/UsRw6uBt0BKqPatzAv0h3V3HkcZHZ/9DpV2UHXBvXxEbZt8ZZ7jhR73
         TVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771836403; x=1772441203;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n82k/w55FcgX53/IQIrWIxDm3R2DN+nUhmvaKVw8RtY=;
        b=FgcidE1A7R+LFpyv5UeVyj1LHOpmfuEnMEBPBr6cnyMMAUHRrwO2sG5UVXDO524ezT
         oAV8s9Ui/KQjEiH5I2XHlCxrl3mMPLrPwAx7BxFzDkzWRGy+7+9w2lixZNKpuJ+swprL
         0AhgBMzXnpkfmA2433nODOIWYYMLhkjppctZwN24IXE6HM/g5GYnIRgxHmtvJpPiR8Hi
         mY6IMJf40EPL5VQG9GRDHt75lKAEujZQvXqxp85DqehtF8wPbMlvoKhU8nr0/nGVEEPk
         gcm6AlNhXQ//Jka9kpuwytiJzmhUpmLkEaTuKYaiJxDraoSi4o1Y+vCDmwz4ShfSow/I
         OD2w==
X-Gm-Message-State: AOJu0YzKmzzNqw9bP2HsYkh5TSN5h+0cgm0iv2KVHXbQesbkCbnqNFwE
	4RpBFD2YXux3T7eUMXXjuDeoPeuVTfEUBv6lJsF5wQplB86Cv8LKRFvj1STNx/YeoqyqObgHpkJ
	mzXrQPuhnubedW1buLJPQEQisKwuPcM6esfVZGkHhNhIh7xPlEgzW9bdg8CySMvVIBV4DUUoM5F
	ElRA==
X-Gm-Gg: AZuq6aKQmxR20L2z6cruqpWNz7EIshSUWijTzKBdpi9aa3mk/f5aKvDJk0UI3xQnKiZ
	wQ5jcvo460b0PmMrDmYDVpbfRxA3yWKXfB0kM2C7qhIDXYzLsmXhfX+6Lky06s3WzOCrOqHLHDZ
	h3BnuhTGYIlkJ3Y6pHUQGfzgR+5ZhTJr1H3uE/n2UKo6S5fPWaLoIf04Sx9RE+3TdVtN5gW9/59
	esrhjx/KC68xd6kdFoucp5KV1gsQarzGFNCX6x38Md9uOoceKXEJkuxnFn7tVqVZ75uIpF+1ZYg
	OVeHImNNxssC8DNSB0OrA/idqVhABN8hMitNvbLsx9xl+uIjpu97K0N8m8kKzV0mB6sprfRi3XD
	J45R52+t1Ey0IBw6ZOCpW2qhGgTnSZA==
X-Received: by 2002:a05:620a:4045:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8cb8ca18f94mr1010153685a.34.1771836402949;
        Mon, 23 Feb 2026 00:46:42 -0800 (PST)
X-Received: by 2002:a05:620a:4045:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8cb8ca18f94mr1010150785a.34.1771836402375;
        Mon, 23 Feb 2026 00:46:42 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff1csm16370928f8f.20.2026.02.23.00.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:46:41 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:46:39 +0200
Subject: [PATCH] dt-bindings: arm-smmu: Add compatible for Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-bindings-arm-smmu-v1-1-7a35a76201a5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO4TnGkC/yXMTQrCMBBA4auEWTuQTn8EryIu0nRSR0yUjBGx9
 O6Ndfkt3ltAOQsrnMwCmd+i8kgVzcGAv7o0M8pUDWRpsESEfJevw1HSJGlWdDmixljQHn3bdG3
 wQ+ih1s/MQT77+Xz5W8t4Y//67WBdN3ChCx97AAAA
X-Change-ID: 20260222-eliza-bindings-arm-smmu-07c3143fc6f5
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8AJH83rXVfEXW1J33bR0nuh0ov7Mv+Ai5lWlF96GRHc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnBPwntu1jZtnK8ugi9hs0WbYg/8SVKBq55Fzr
 /vn16m6wdKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZwT8AAKCRAbX0TJAJUV
 VumoEACoxr8gPTQ1ALnN+9TxkqknqMgEDfZ05rcBASrOF90m/1O8Hu/FgATUyOdUYKLYM1BmSp+
 FkgsaNhrN5dQ7iWKEgUNm76WbuUiNnsq6AvMkSgbfCxZHD3F2aL3CJqB6FyIk+lGHs7LOXTvw1B
 xNRI+dOD3pL1EEedUG3U8vd/sRbxpZFTvaS8xm/9fTgWwWk1tV7q0ZbeDUT5XTMpVHQkIfuzqDF
 STTbOiumq466QlNR9YKrCyY++aSVGvt1eHw2w5w1kdWLUghTlEi8cs7FvGPvz1zjmBlh98ZA41+
 EsED3oSE3Vxp6k45cLlarvp2AlPcAmBrTk84AyE2GrtvrHyWVB5nCRHPnPQtZP9pzboSCN9tCtc
 cphD6VY5WT8jrGCgM6Y5yrb6d4YQ4i/vYOg6yBNuYwPtb2xaRPs4dmNQqrgLQomYuXY1YzckFrt
 tWDubq/MU4M1Rnc60wGVNOvtnkAnWqOXqTt8QW5ajsLMldrUuO7ZtaPRLdeH+f4dTzbQ/jWWe9B
 weLPgKvGLECz2Efo2vq38NMK3yfysjDHnjSl3tgRX6anAr92myxlWrNjwkG8dYg8rTfm9jmtsh7
 6O7RlJqS4nIjHPZtVB5O5UfFSeJb1yfYHmb3ThFqVi3Wi1b3b60ayatm9zPyFk9WSY4RlY2e0MH
 +Rpvu6wHmDPAJkg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c13f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cTTMG9H1hPCtB3K_XmwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA3NiBTYWx0ZWRfXzszoiMPPuikL
 qWfBMBcWJ88tgpo1uYI8R32qi3ne1zYwcS0T7OC18h8QsrAeDWLX1o8X/b0UtRYtAZO4C0BhxP3
 r+F6rTd4OjvkTETHtscR0hQKp/Y7vgA8SGF6bQ6h0QHzW7IBvFW8Z7pdJW6YwBYwm9hdrQAF3OK
 Y1GeyZLM9diItnzynzz4Km47k0qL6LL9uTXM+vCOQaQ/h8gQXSBNdD3+VcqURnno4U0RKTFV3yH
 3iRLIaUYxNjkdg4GnY6qMkZ0XK3Dq61eLaQ8rfPUVf3lFTHQS/aMt8TR7/ZA9A1IyxWXTzU5dKp
 QISoT3RYmco7gGj0P+PPFOuRPH7HoA6Kf1owa+yOJztGACJWkQQpNhVKF2R9cpo1SJiHrF0qtLk
 f0zaRwtWbp7ib2gWoUKHpZdB0nJGOks0nRQNrrtrUAYEbxGD2bO66TqMpJehtYAKw+Tjzmbln8N
 u2xOjWbREBy4btwynjg==
X-Proofpoint-ORIG-GUID: qdO6MtgEgRA2qUwIeJLunFBBe1jqJ3R6
X-Proofpoint-GUID: qdO6MtgEgRA2qUwIeJLunFBBe1jqJ3R6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_004644_755700_D49447FE 
X-CRM114-Status: GOOD (  11.44  )
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

Qualcomm Eliza SoC implements arm,mmu-500. Document its compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index cdbd23b5c08c..27d25bc98cbe 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -35,6 +35,7 @@ properties:
       - description: Qcom SoCs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260222-eliza-bindings-arm-smmu-07c3143fc6f5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


