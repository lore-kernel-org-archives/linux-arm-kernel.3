Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7641FE8B38A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICNqpcLxE033zAPt4Nj4jDjSx1/KBRtm8fVHSukZhYA=; b=mPdjQSRh84UYfXXXguG7188oNn
	iTyzu6Ce2kx/o9U+wSRUHElegl+lxhJImRQubZVGQIFr321XJrIGgkk9V+VmZXrARhk3Zq6Q6m1/4
	wEOtt/hO6C70XPdraOyeIQ6TltPBGpfEP/ltDnWyDTKuTUaM7fguUM5eY00WMW6+OSecjgy9ik+32
	nWKsPd91S1ySINav+Tt1hagQ+2Gapm1ANqbG35dT83fYuoQsRXXZR9fg/KwUAaUOBWZyBr4CaWJQq
	dCEPlQ1q0vqcfn2Xsy/AXYwXYWTSHgEDSwsctz+mmE92imCr5AdVu3ZqztVauLFr4KqgfjGPzvdcn
	pNxGhNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSXS-00000007lQr-428E;
	Wed, 04 Feb 2026 02:22:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSXQ-00000007lPi-1nAv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:22:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlqB72613945
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Feb 2026 02:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ICNqpcLxE033zAPt4Nj4jDjSx1/KBRtm8fVHSukZhYA=; b=ezdFaQHzZu/J54JZ
	AtO+Ge1+KB+PiTFCvkvzD/ZPRIVYYOkPjY3Vghl3thrKz9aRci4cQjpPCofUpXbA
	w7R/aVxa+PHvNWQ7UbIMIQu893HCFzl8GiGh3LnqxeRCCyo/IsPQXAHP41cdU2zd
	H8QZ/SdUjukYrDRr0gGX60njb/fO1mbL8JaSCLR0+A6xD9/oPmJhmWH8Rt1xPZZv
	DqfnPIjGnET4khabf4ztlyA3zcY0lEXGyMj4Nv5MigWrZAyf05BBRnGtLu+upMNf
	opaHCS5tke62SQNSlmSWAHOEBNANzqmPLyF4sKTa49E+cU6CnW23bYYa/szeG5oJ
	bdl50Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3h07jk91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 02:22:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81d9b88caf2so5730028b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 18:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770171759; x=1770776559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICNqpcLxE033zAPt4Nj4jDjSx1/KBRtm8fVHSukZhYA=;
        b=FGMgBPRRjls2DCiYWy7EfbVkmGS2VH3ZYa0Rt4+ahbssfkKRHb1qrt+iU0pJBRYuE9
         QYlUvUqwdEAl1rvMWV0JNNQugUYDDTVf7Uuq91gwQbA551XLBs9dOt/BEjSgRaUSM5xE
         56iBIYag2JWTDYcDh0UA0AWME9qiaDLgmVDRLUeWSjs9y0GJAfgsRhhtqIeVCG8dAXBu
         ht2MBpePuJ1apGypWRrsOSBgwsY6sRIAnnlxToGPyGJeuCFHx27t/30aaVaoWnOZzMI5
         BGJYG4w/6jWrcS1iCNiqVh/fgJeaGe3bgsCg63JfZ7G7JDtdjp3pmmJoolhOz47B7wxG
         yFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171759; x=1770776559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ICNqpcLxE033zAPt4Nj4jDjSx1/KBRtm8fVHSukZhYA=;
        b=A4NeyMoIsYMmiVeoWhz0gqU16DLxQQCRk38kQdV3nxIrRAgTHIgT9xejWdibGoxenI
         0ldJMUeRGRopX0vu0FR6TnK16J9+zkio85gd5mWsxx8dblUvbG83TFo/JC+CPzoLgPBp
         0hkdC1GLdZvaQo4PDtsKWlGSaMGUciX3z1OGPUut6i8am9r771TQn9Awze+sF7p2FE5S
         fuHHceCE+PRIcOunM9o+fKsTxowbv68BERoQ7WGm5729KwuHIc6ecVDlqZTwb1VK7dOg
         9o/8JpX8NKZKc8pgKvNX+jTP8MnGX+yqXzulDi9tVnZSm4/xRKcVO+Xx8NNu0pcGUd47
         RxVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz/9c8eZNLax2Is6UqWG1EDed3TjMohq4oBcrImqXccJhoOue3yiLrH2lVFsWyKZVjlhEpdcxNKJ1I5RT/RMZC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp40FkP//++yHWJPSn5a1cP/Gmu1nXTNWibPul6YZ6c6z5vZHd
	Yst0nVBKcw2hnPCAe1lYbdMXHM5/lvzXMBzyAkxvR5gLfo8uxNpmP7wYOPkBJQaoIOKJ0ZNqShn
	6MV+Ja1rkZP+/YnpFJqfTHUJSflQPHl0ZOm6jy/geBwttY5Z12HAmCdlfc/TcDjztkVGryxpw8l
	ihKA==
X-Gm-Gg: AZuq6aJRhVkUk4ecgep0KxkzvAQgJEniaa1oQR+4VSZP60LjvDJxENqFX3FZz+EJ8D1
	RW3RQELgUIGfaqytdKEMm+CiIs/k50vlDRcuKLayv7/apccVsGBtBKFpZkNPicEgHMubjQ4t2kW
	1kHGaWs/Lq48iRKOMhTkiOaxRulDWOawa133a4l4pKqeNcromUAtnCBOuJjg8O0eXDTtAht9ZJp
	Q2D8HDKTlIPcII6fNUGtWu1oW3VgTzsK2qnys3mZO380BRUWbPWjpToddVsY96Qq7wJST85yKVL
	S3+0W+4pRJcn0K311pVOk4fU65v6IGRei18ktw3f9ulz+u/yD6+vwTWjakdO7zojTwfDY/yyzNu
	aQX44Pl3d0EZGevK1teqH8zvDdQkkIOceDbCVIOu0zYHNplpJZjLDcI17Vhqa4tG5k10kyRDJ
X-Received: by 2002:a05:6a00:2d28:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-8241c19e012mr1390756b3a.14.1770171759385;
        Tue, 03 Feb 2026 18:22:39 -0800 (PST)
X-Received: by 2002:a05:6a00:2d28:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-8241c19e012mr1390727b3a.14.1770171758853;
        Tue, 03 Feb 2026 18:22:38 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4a5c28sm695598b3a.62.2026.02.03.18.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:22:38 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 10:22:01 +0800
Subject: [PATCH v3 1/3] dt-binding: document QCOM platforms for CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-enable-ctcu-and-etr-v3-1-0bb95c590ae1@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770171750; l=950;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=irlBiV/b/NP192hRJFCI1r2sets1NLWq70bQwhzWFM4=;
 b=NnwtZjOYQ5gMG56D+5VzvPMXMLVJhfLLL/ORanfhkH66weP50084KFgINw0IwgawYLxYTFH2J
 Kz03pVraxeLCKnDwN3OpzD6dh8ouEooAbRNgFEyndtESHCXLnFbpz2y
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNCBTYWx0ZWRfX4/1783YNn8o6
 iiqB0HFl2jTsvCUFunvTEMaHaHPePe1HgGnNI6NqOnhbCseWIhd33USzYNuHSWswBTpzh0xzqD6
 5qd+SR/q0qwH7SSNR7+YUKg5F48L9lTZQ7r4fbD6yAgvnlpPdKsdPrTYjOkZWI76V1jGHhdybfc
 L9AtwjBuq57hBbj1hVRbLPqB7TGR5wdeGLqJp2Qf9Ts17IISJ44lwQt5O1ATtqBCgk3h1xoARP/
 YLUWxYhXOY7ga4t0LxA0xO0Sy+Ir7zihdyCUjxVUFdhV+8GOgVCq35lIdfiSqiUCe43mBGeiAYJ
 rz+MNd1K6MnBe5Oo/bt/5G8PZjAZxggq0bBkHDO+BtFfViHsoYUohcI0z5uiU/ci5NhDHed9uLd
 5RSmcicl4N9F//KyCurJeyZF52M9ufmBJASRFONm6neVBXIqgY64wK4KXFin9Asuz9si3vuvNVw
 mTo8Gb2C0fosk+oRJXg==
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=6982ad70 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K-gU5Sf5JpjFIvSPVLUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: b2s6uJ7SiGN0uHvJ9CG_LGP4dU1mRzJu
X-Proofpoint-GUID: b2s6uJ7SiGN0uHvJ9CG_LGP4dU1mRzJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_182240_473251_BB66E1D5 
X-CRM114-Status: GOOD (  12.09  )
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

Document the platforms that fallback to using the qcom,sa8775p-ctcu
compatible for probing.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..f3f3feac4ce2 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,7 +29,11 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,glymur-ctcu
+              - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,sm8750-ctcu
+              - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu
       - enum:
           - qcom,sa8775p-ctcu

-- 
2.34.1


