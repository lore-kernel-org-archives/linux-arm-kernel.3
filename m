Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FCDCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=; b=F8LOGZKMlIsg1qm9o8fy7Z6Row
	x+n5Q0ITuzZtinloGKaHyCjwzHt2SqL6W7OV1rBvEQpRpAKAiw4mpmTZ5nsNyv/Z2GgkXbNjKcJni
	wjcVSkzDmp+jjOxbRNJGeI+RGDWhVNbZjhKUCk83zpriJbCu1p0s3mI85EWFjGZH7PyAYB5jgw+V/
	Ht2vLEp00ZdadjcG8F0KcpFAhXEfjxwtfFj3glJKXxucaeDVov11fVSWLWGpaHPx9tbM+h5dlDfyV
	LrqqRGwXJrn73qUs28NR6OVWXTSKTba0Noc6xJvGfiJM9iEPHb2F9VPRIGtsDJJ+ddYZyDvr2ynEw
	s3hIlNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLB-00000002ftV-0xYj;
	Tue, 26 May 2026 17:13:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvL7-00000002frz-2oVO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:13:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH0xdf2977325
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=; b=fP85kTQwAjLmK8j4
	Bt/s9gGVLLQ/MLsVdLGS3ORhK3gKJcWIahzQeokIqZvMK0hye2ZrxAO2J/DOOkw2
	nU6Pchy7qH2n9CHEDOnbIryC6yk6NNEzllAJxoHB4t5O078E9QVpRCJBLS0U2flD
	iNZFW9U2Bzh/0dJv9hfw8gDLh/KAISaVS2Fr9KR63wxsozGbb2UktqHF1f6wMw/A
	QoC+vx0JqIjzuOITbfA9TmjYbJDks0JXkmIpby/XIIxFxvPKFLVCe9JTPeSkJOab
	w6PTPnUKm3JTU8UTtT7WplL8MQO2mfzklkmBuqjPRYYQbmpBkn+llp5tZLDzu/Zi
	s4XK7A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eddqkrnsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8397b14a689so6626557b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815592; x=1780420392; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=;
        b=gAHMxvXFcJ2crZf9+p/j4fTZviSG50pSvHmiDLwQvKXX0TXNFq7J3p11zUy5pE2IV/
         bVjsTZ6fKYTUK6qq+5z3L92ZS4R1m6p1pC+Z6Kp6Jv0nwlfgsyeMBg3KndnvgnI35Toq
         7rhI8krGgR/xJR+LBIT6wqVYFYA5rIunFL21Jho2CaG/NhKkGwEhIHGCtwjAbABx7eSc
         sSs/HatuzPzB4DBeRFOcQpetsLRbNIrCD/pV+7ajGJ5JnFtBkDurnHkdQekFQNx74WZt
         trWyOshZNatqmCRVqt4k2B0ILht7Bylj0PI57eB3QDsznFkG/jx9ZHH+2RAa7iQ73KEr
         c4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815592; x=1780420392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=;
        b=X2TAJkE4bE1ZmZYnsZtwt0aJLiHmPJXW6wAIG6NwMvaG6sX5+F4G4Gz8QVypWbgT7q
         714ExMNetRDD+XVUuhL0j6EB53zRGJ+6v07plFNI1P6m2oJ9FaBkHyKPQ1gAXwIG/T/y
         hOHuSBHD4B1MDih4KZgsACvBY9MVcuOWh5+E9m+t4b6cNhGUjPVvH3S5HpAos4AH4Amu
         O3SAlQz5PhEov/h14OG0jwH5cedI+ibjgh1hZ9DAgWjpqrSSB+rd+dL9ajl1gDvyFbUv
         kj/qqBhYiPUgaN5bDfjKI+I0BAnb4X7GrAu9dEAyYcHGIfLG9xufmY6/oIVbK2X/cFdE
         YqAA==
X-Forwarded-Encrypted: i=1; AFNElJ9NmH6+8hGGTlFf1BAO1CO6qv9YucusR9+PtdVVXHEkp8hxOa5N3H5wRSPBO7fVq+SM+Ap7p38xPsYiHpWqPXM1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5n00EHL0jCJoXCOvgxusUEtdQweLV1Y1BKcQd+zmtOB02hrrC
	zEaFyFETC8pRCmhXhdx/qHssggvoDb1oCi5wGPdiq8lV4i51ye11w3esWO9lR6135X96RfyWVXa
	BB3BQl0F9VFyt3QhJYcFACkK20/Y6/BS58g57OZe8TrZisRyxVaOgVHdlSHDsdMju+PP9J6mSBH
	HK+Q==
X-Gm-Gg: Acq92OGPLiUWpD6DSKKvZ/0msa5cQ+WCiI1X24mRAeS28JXylCK4teoEzEYB1XnCEx+
	Hg1U3HNRrLYjFlVB7P0LodaPgwv3HS/YTkIzsp0dzXHUTR29XXvw7/iLretExKn9+C8AJpbnch8
	0ibhzhIyVL06GtUaNS7NJ+0I3t6IN4slJVASrU2IFTZmkJADoeFcm3GyI9lZF6hEC8Rc/uWwtlX
	i8kzrA8qXTFNjHViUJltxzGyNumJA10BfS2l6kGo+/h1RonafMlcMp9GTLrEXU2V7xp9td3Inrx
	77+F8Cco2H1jQpshmxojc+nhdg4iPAwrYsWc7dR6jwOfwWjo+GJ2zPnuXn9PHItlBf9ahNdyV2B
	NvaMogUsf0rpYSwbFwVgCl6pY9WlmLTekhb/Xhei0P+7NnrobuYVs
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr17283034b3a.11.1779815591518;
        Tue, 26 May 2026 10:13:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr17282999b3a.11.1779815590996;
        Tue, 26 May 2026 10:13:10 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:46 +0530
Subject: [PATCH 2/8] dt-bindings: i2c: qcom-cci: Document Shikra compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Zubd7d7G c=1 sm=1 tr=0 ts=6a15d4a8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX5HsH9kpW2Omo
 N5KhCLwvYy0BsK1QnSImKQTr3NU/+YAcDizSZIwJO9VY9PujmmRoqiUT5RorSWUqYeCCpssX/iM
 9dtx3hsUVFFn0Srwd5sHf6psoGVUGPl4SZ9yFi3dMYEFjIt2U2wcauqcI6L9pUeaXkWQIi/kl27
 L8M7MC1Jmym5eJc1LyJCQyl2ybu8oQhRzdWmelTrWSJZi2EyErCmv11p+03cdzckhUGO3K6NTab
 6qMT8al/QNRg98YDL1+btiU/eLpqyzUcflkeHD/Vm/cvnh9FunVPiFM45vfbc5p2E20IGU0tX6C
 uAbcoWJxrVqzu4lzjnDJ4f5fpiRPpc/EEbRO/R4QwdzOA30YAd/dF7x5tEQ4bBjMArsf/MCtTjr
 +co1FJm9GOQ+ej7jJC+w7U5pJLB4nZ8eHHHJ9082c/uWLfb3bBxnWdbyWojt05ktw/Xli6vlCQ4
 2FMhhJNpIzZypmxvggA==
X-Proofpoint-ORIG-GUID: uaaXvVfoWu6gPWM399JFKFoLee1APFZ7
X-Proofpoint-GUID: uaaXvVfoWu6gPWM399JFKFoLee1APFZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101313_834423_D874EB68 
X-CRM114-Status: GOOD (  12.34  )
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

Add Shikra compatible consistent with CAMSS CCI interfaces.
It requires only two clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49e2de7dc7acdc29a 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,shikra-cci
               - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -137,6 +138,7 @@ allOf:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
+              - qcom,shikra-cci
               - qcom,sm8750-cci
     then:
       properties:

-- 
2.34.1


