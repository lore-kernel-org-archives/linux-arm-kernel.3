Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84251F30922
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=; b=2mzkTnfdIdW1FxjJ5VWGeh0mJk
	B3DxqgQmd/kWX4MGPp4EGvez6LKkORNXYm3ZmKgrbS0KnSzy05kqO3Gpz1l9PEDU+Ewj8ZqHFrGrX
	HyLcjdIJupi+98Y8igf7QWdv46QlJF9Om4fyhmM2wy8Kj1+uZa6N039fIGUPZX1AW2QShL5vO7EwX
	NRYC6KEfEaKBmHLU4yJMRFUr2naLvkkrLiq10ReDDS1sIJKktmNl7k4Gss2Byps97/CIDUJ8lTqgn
	+MagqQd7A3RfeFAGBbMflwIk2MOJADCSvIie1cTaWk1IeIZ8AzZITN5qbqBGgKhajbqVNoHU5vpAT
	2+incqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Jx-00000001RdE-0q53;
	Thu, 05 Mar 2026 09:48:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Jw-00000001Rci-1Mvk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=; b=mUwxVF4fybeAViCsjZby32keCj
	rl0uF5nWRrZLDEGxA53DFp7K4p8oneoBsq2MGrwCjXMsNry9sCSYQh5esCft8rlIjGaoFaaHXzT/K
	4KSbyvDvKM1pPqFwH0tRcRA13mvOf6IkGtPnYaztoybWkJaT/qttWfMBwi04Mrsdncf9N2+qS/UXM
	ADNvqXJv6YZSTCkdEWpIukCDw/i/OQOzEJ1uJp+/tEYTtAjm+SSwjquRmWowypFVLJy+lQmCQJaka
	A8USWwLPhZQhIuBW+2C6gRfI6pAuWqYr6Qbdf5h7fdiaA9Y4EwrG3IOnarxymAFrsvZomL+iIVAQq
	q9QsJ2wQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Jt-00000006O5m-12tZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:48:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253AM3m865886
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=; b=Si5A8wQkVIgZLnx1
	siu1KnQufSbALw07L+ODCEEgkm7qe5QlRfWt0ge2kpNv6ovG0sMH6lHz/4AYyHbs
	FHvsfOZoYLuqcgA0D6/4ddqRoc4cdAmYhHzFzHUaCkciVmz9aMAem9IZXf1C+wYR
	rJAxk01tTKSGJjHusbHf4rwFcJyZ3QH2fKtwGiIQOUSMlYnzUdLGvH/xNnI3u5yQ
	rGGr9OFZdvLg4uwvHCvEh6YrVUv8N/YAhimUMXhDTaRZ1N5VPglOlENuJvxdfTqP
	B/jpEt987CcmwUT7ffiOx+4BiwfUr6SiA4+rR81NZwXQcNsKkwPxOfsnn3pFZTz6
	yNhe5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk17tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:48:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50341fddb89so551501711cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704115; x=1773308915; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=;
        b=fFqP5mZearw9RbiwTsxwRCJ+LSgT+bcZ7Q1ExSSI6GE9WjI7LXHhC/w//si0/tM88j
         CQr5xQVjkeAoeST7RYazhN6Sd25F0LpZqCvQy/7OwaTd8UkigLIgJ/M2nbdYaUjJ/r9M
         XmrEvGhlXyjEx5Hhdp12FFVVRqbhbEaK2fYTpgaBclyL8v8OLRkaMgOHo/F3PkoRy3Wb
         +2AJI/Tg6SUiciNyI79uZ9GdTtPqDnnuEpVy6t8YC0RhsIU2miWnDw67gZlnpMVu7sCc
         fVuGM9qxxW6up85STZFGM2RS0NZchvFxgcgqvatWojHB6+vOaDJ1UpXSVsn2rn0y5grX
         6ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704115; x=1773308915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=;
        b=jppxpT+K9PN1+q8bhRux5JUbhoMbB7vZ8GIgpkIGVoTqprRUV4JdcxWC2gRh1EsO+v
         0ngASYeIbIebjIt5baTSNBOo389kX0gWn33yV1hyavyJvMm17tuM9WomuoZkwGSgDsJS
         rbGO7RJGPavcFzVIUeWbHbp4cfO7Nop072BIE2tta93J1WcCvp1EbNmTzqU4mswFnawN
         by6yIuUgPD1MvPo3F4hG/9IloW/b0NIHTgzlj3HDV1rdJrYfnAXAy1PNrJa/lrWSEzd1
         tT6BijW64udNJ5J8s5D/yHWCMBTT4litiVht7IYRLm6HUWCEZRibs6e/vsAI595ZsqlQ
         0E4g==
X-Forwarded-Encrypted: i=1; AJvYcCXWJMmx/Ofd/Kyp6sfKAqvRZP+7aFhPuoNhWbbAULYPBnd/Olf12His0gXj9FFIrzQgfzf3+LpPTHH+P//ZeKrY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeu6ZHvZ7Rem3L/fQ4CRGtmGCQIl3jS7Kj3/N0c+KJgsISgSSl
	EgZb/iWDdpf3KiuA8dCYPlt1YYIhjHRW18T8ABV+hCHm0BFKWJbVGcx3vVUUlHWsnpghQrcoiEE
	qr6Vlbz1oapI9SiH6/il2DXv8ASBXqobAuUmzR/4QCkEJnmuKlQDsUWHu6wDxSqr1Ox1XLWxj6i
	BUyw==
X-Gm-Gg: ATEYQzwKTpNaYGnSfvHzkVVSxvzWvQucmSkmRVvLESxKMCLrNRJnbYBdpsnzgadcfQj
	8qprBVZ4LZpwkQJJHsAx0fRPmWafqAA5y8+tW+8iCwgs8u770yMZPKXxTsGLT1RxTSBaqs3S9wm
	Gxz48Dtq/mmifGW4qgcqf3c9jZTF9Dz05blCShGPWvEswPFr/5r+9mQmaTKydtXQ2YN/c/ExpWH
	MJVdQ9UIy+wIY7E4y04FVSxf/bxxJ2hqHz598fEQvE20KUcwqrozQn0eUh5MQJvOwKei9YvcXCF
	+gQjfHOTOh0Or0QhHr8Qa85bKcFqr5wAdXrpXymHzTgGLw8NJtyF1Pdj44+IjCFeCX+Ya73027d
	PWQ16a6Ek9yFDc0jBcdWOLHczuV0Z/JSRkm6iEbdZ1sQWSUXfYMbgWx+Lk4RCchbQMabUaJ0xNG
	Ixl9PbrMMu1kGv
X-Received: by 2002:a05:622a:354:b0:507:3ee:23be with SMTP id d75a77b69052e-508db25dc3fmr65561961cf.9.1772704115059;
        Thu, 05 Mar 2026 01:48:35 -0800 (PST)
X-Received: by 2002:a05:622a:354:b0:507:3ee:23be with SMTP id d75a77b69052e-508db25dc3fmr65561781cf.9.1772704114585;
        Thu, 05 Mar 2026 01:48:34 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:12 +0800
Subject: [PATCH v6 1/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-1-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=1336;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=i6izUJviyArX46Sxz3psV8CYflgOEvKVmFWmHyN2UJg=;
 b=61XRv9AhrNpd1bojD8c5P7j8kwKYTzIdkkCrl5q3FdMqWSZvfOltv2e354lZ5/0tJ6DNK/Xby
 xvWi93boORvDrN4S40rT/4FyP90rUd7qmkTAai4hPS2SHvehiAcgs0z
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 22pqROhdS0af-fxEPFctWTYqywl3iMOY
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a95173 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UHGjisO4C0SBheCDbiIA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 22pqROhdS0af-fxEPFctWTYqywl3iMOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX6gLLhrw4ELMi
 tHYcbNzSBH9p80eDHeRTPAQ/uN57nt27vbZUMKpkyvAu7etnR7mnZjdKQgEJ5tTbPZclErDo4z0
 nSQU693ZYdCRByaPMKtxJA2NC27su+scZx5zfU7A6egT1HouB/H5ziCRmVa8h7nsSyA3lxQOOjb
 J8+wJqH11pnQZlHFVBay6BaiqJebmI0ZQXoPy8kOGge1sGvw376glbj3J5HK9Vz7mr7FOt//hXP
 prX/kd4Pyj6RAtye2FE4LYMoy6kwi9OPAdmT2WUfgQmmoea/ZPt9wf6Lu/1wDy7rH08NJqxg80y
 i6utwkVBmGWmoAFJBhzwBrVS2ZYXwtcwYjTSbtIdeJf8ojY/6tpCcJ3n+HyZNvys5TcWbm8EeMy
 DbNbQUqTdKT9fqfVGlrHaATO903J5MMSEluuBRvqC3D2KlWkjPBogRi2oHnWDginO4sG6+EACPp
 15V+C5QqTG04njf/a5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_094837_628312_6D099B50 
X-CRM114-Status: GOOD (  11.95  )
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

Add the sm6150 CCI device string compatible.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 399a09409e071b7caad8df7fb831c429a8bc7750..35d3a0685ac4468d49e68621d0359dea1988cbcb 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -34,6 +34,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -251,6 +252,7 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-cci
+              - qcom,sm6150-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1


