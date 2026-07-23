Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECFAC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=; b=tgU3pO7aZOZxdKNK7QmctbOyPT
	6/q3tsIRsYjgV166Aj6/35le2i8sGWqnxR3N7AR1ZU63kuUp+cM8S/xveAqCsNhcAxLyjAazl99jt
	kIo7ty7eat9TsILSPsP1lJnyK9p+xa9AfvlHEOcFPaNY1lhn6/00hf3pSGOKKPG0fDIZ9qR80/3f7
	cyd5prKqk5TM08CuYFdOi6WxP7sflDOL/m2HXxHdqSGinGOAvGzXhU8QqjjHAcBoqI+IyZx1Frw34
	su1QiUVtjcGrxeAngUz2J3c0wA3OT5/CWpZdfGBiWaaOEGYYtH6yZTvfT9vQzVxz9vtV1pZAi/ujp
	+PQ6FPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiWl-0000000DA8x-0U90;
	Thu, 23 Jul 2026 01:47:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiWd-0000000DA7M-0gIC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 01:47:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WqUh3534961
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 01:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=; b=azy1mT4kMdMyli3R
	YeuVauPdoJXBz8OpeIX8wWo3UoKfEeXTtkejiDeQQrKgJCOO7IvV6hrIk/kzQnCr
	AGjI1jFz/NBj2mtP0Thbv062aK/514fQYmNQkW6xWmFcp0mj9UTDeqDaF/l3fiwX
	4ymgoIOrR73qIztYZJU3Y0ogihl+rMTiGHNbn4NnXwSjwt/KD2WhQRGaTLYZ4oP6
	ukOw6hYUrnFAl1fk+IJLv1CaQMrrPigbdK3ZPD3UkfX4YpSsp1Y5IF6sPEOTDrwM
	JrR4TXpMP2AdEXxK1LKcwkuuWznBRG5oklyc49jqLcKGyZxN28UasqblM32z6Ug5
	MvIGpA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xsmh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 01:47:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso3219195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 18:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784771222; x=1785376022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=EEDAFI6c12OOF8xvk9KQ6ZeXPggEBQKCy8zCAtBPK9XHscIoBpcFGAS4yBnUiBynJG
         mkhtL7aCN0gfJLS+c5EMzk3HaUPY8HAxMS6mQkpgp9zziJudX2lZZ51ckEyvfhx7k36q
         ufrmO1nJkdvRRvdPYMYZ6JZ0UKI6OBxCVlKixXDnMvBpxQl15e48j+gv4bcfYOC6ZR9n
         LRwwAOEr6EkU00ZU++OltamGdJOj145RCkujszeLXUQM7pvkVq2M2ODsKm76kBUMCMdv
         PA18NgHFnYMwDzWODmP1xS5fBrcxoBKe3+uFxeUZEqQRw6oI+oNfrrJXMp8arUm4dHFA
         KVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771222; x=1785376022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=Mpjyxq4v/BU8BbZff6z97aHwANqEuanjHrahovGOkTjX5oE8UcK02aHA7Q7Gsmd9LS
         WlJKYn2a+/jk+Yi6ALcEmSg3l3GdTz7edVJkS02W6aCQjEn0D/BElg+D5kQ5nwZb49Cg
         LVBGmuSGZAN1Ytj2TuZNftil9osJu/AQ1UQaIV+dLQyk8DIRgr9TA1K4oBr8ZJiYGtk/
         NL9Ix03QJQfiQyw9HIfU+YwP663wvpY4FLho9JxU1W+yfXVJA2Cz4FMwGxYSwN70fqIv
         Jg4Xer3KwBRrRycUPrpJKKs6qySA+tSkw8r/E/YpqBOoqk22O5nrg0gKQlPNo6wTxZXn
         HHjA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6wWr2uUA04xvHI//rdhyPSJ4o/j97TTT3xPe4qzndj7AoMUKB4mYTr0PauT5FxHoYya31nm6HhMXpu/L4i2c9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz844cfpn8r+ohBT9PaXotGlZhDqcb9UmnHdnCcQfPDOFwaxf+o
	FA5GhHWaxh0UeOLVKL+fx/WahE4To/WmGQKEV2CISiWGwKDqKIAyn5PD33fRCsoNWeJRburt1xR
	QKq16Zx4kLN1NyM3zo8Mzd1x2gpVvTXtqldqslOOU8Rw1OVTDxlU+wxuGuy79GreKrXS/9tZnrC
	sFdg==
X-Gm-Gg: AR+sD13LKKE85yRGXYR4o1DxhjLwkLoy0Ami7jBzqacbOpaWq/pIxQLxQ9yNp7j40ko
	dJuXKUWc6U4M/YH7/2X7Ej1/3RUVZAZRaUn1cn0euEo92dpuzEYcpG7NJKZ4Ynz/SYWQvMQlP6K
	cvjkcTDEXTxMvSRrWMJjEnSs14SEj06oOuOJ8h2qXEmxu0AC3T3MhCegnAEqz+0uMk6ZMzXybAs
	C1YQTzG/9fWQguJlRRuJMX32yLSlZ5iLIsKOdd41n9UTBIpncd3+3S7JsV4chD6MDfhbvqknv3Z
	guhbITbIi+mifDxAhQw+fFJEf7MpvdyCK8vgnD0eCU+Tjp83lVy4zjkHzE9Bik50FHt6pYqiAM3
	8m+C4M6eOQaqk6Scue+UeLyM68kK6R2oW40prqrsMS2L5T4bj8/+0gKTZfT0uxwg=
X-Received: by 2002:a17:902:e841:b0:2cf:a1c1:c60e with SMTP id d9443c01a7336-2cfa6a5a0a3mr15816525ad.1.1784771222042;
        Wed, 22 Jul 2026 18:47:02 -0700 (PDT)
X-Received: by 2002:a17:902:e841:b0:2cf:a1c1:c60e with SMTP id d9443c01a7336-2cfa6a5a0a3mr15816185ad.1.1784771221548;
        Wed, 22 Jul 2026 18:47:01 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm23389995ad.10.2026.07.22.18.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:47:01 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 09:46:30 +0800
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-add-coresight-nodes-for-shikra-v1-1-992615f9ea15@oss.qualcomm.com>
References: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784771207; l=956;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=KjZAmYYdX486FIyES0cXfj7PWztonIPwwITTJrvXDuU=;
 b=MCVWSdx3kFRU6sl12LLfX/j6oW1cFns1Kbxbiws6kjgs1+ouZvT9ESLEerRVnbqM6vSCEwB8T
 Gej5nGzKwOVAyRSI3jMXfjbVBYm0o2bMwOMcQhKEjsxq1ndFCZSFGQr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: H5c1F5TLn8KPN8-uzCA5lD5qaguARYZW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX04wFY5P029YZ
 MMZBHGejrP35QFX1WO81n3wsjKLcrpceJ4b/I79R0lXvGJA4Xgxa5kVyhEmG0xIC4PPBh5sgvGT
 o/+iSPliKJ1JJTBiOY920SZwreBEfUo=
X-Proofpoint-GUID: H5c1F5TLn8KPN8-uzCA5lD5qaguARYZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX9LKkQbuyqz5U
 n5hMYxvfnOzB1mPMVvNTM1jCZoT6lByZ5KWhBfJROVquEvL6HQRhXypvF3+UMkVmTduIqaE+Ewg
 sVARCswbUMz10K6U2CGlhI8sFgeFgZ5rJeQF8Nws25wnTDUzqw23ZYTUr4JpndecqJ9dLRrl56r
 saRVmCKgAbLw8Ua0207Vz2hx9a4Sf89DwaMu1jwO7m+YINsafYgW333AiMiXrmLjwbuODypVkxZ
 7/9pN0FHLrjijoqaS07R+IVU6CjCfF9Ymj+iV41cNEQqwOC74VpMl//KvfWsOwbtxdBgF4MxJ2D
 xXTR6QEaYA0shleJvYwH7AKp6EqmCPSa1lLMSHQShho7dX5ehFAhUgCD98bvLY6wT/0c0hO446a
 KGDNLLMCQJ9QaufMS/r5rW+0qdmYu5prj1JDyHa3iVnPeDQI92wjQa4su9liW2BZI329x8wAqX1
 Mub8TeCkWbFKtiN3O2A==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a617296 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BZKsYnZZkaJ4N7IUUl4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_184703_205831_B9E5853F 
X-CRM114-Status: GOOD (  13.16  )
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

The CTCU device for the Shikra shares the same configurations as
SA8775p. Add a fallback to enable the CTCU for the Shikra to utilize
the compatible of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1


