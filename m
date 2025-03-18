Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACBFC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kdZV2TPugUFxEY+ozHAQLVsYVfHOOuUGLJ1vgAe5Sw=; b=mAeANA4vU64X7GBx8DGkzd0QQL
	s5hTH6wWIFTvoyDkMp7j5Mc9jdPJOg67N2sYb5BEmWX4hHn0i/aDyyV9f6gbJv2JcjDdmesVG9hnC
	9bfS465hEkrdk+0nyjhe0MkHsf7HQNTGoFBmMswC5rGIIU6uHgIWFi2L+oPQHp43+Sj9hqMwbV8P+
	et8qCHcpeNvpNi0AUxF51WkD+Wbd/5NKbcEQes3+q5aegC+N4ZL63/qhXFweYx2e4x+fjkmjwNtmA
	TNwxrrgoK4UfICuPsQCqEMkpYFQYamcS6QqllyUKjN9o22bBoLtwTo/LQMKE+ZVAwG0r9BNXdRLfh
	dKv2hKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuX6g-000000062P2-3ta9;
	Tue, 18 Mar 2025 13:35:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtb-000000060NK-3B2k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAhmIJ020851
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3kdZV2TPugUFxEY+ozHAQLVsYVfHOOuUGLJ1vgAe5Sw=; b=biZm2DRwvTYjirdx
	h/fRua5eN15ykI0LDncElTrdqqDeCoVEcI8NbrBaFxNeHdGoLS9zIaHl1wxDMs0V
	EB9tByQI8DsrvadKMBzc/qxqpX1fzLwb6XqsxEOyfNleZ7RtcOHl6P3B86CrGyPl
	dkw5SQzX1vLnMYFrPiYh6J1xvMDeh+nt91Ziwlo/atHQPZlUQTaiaeX5malKfWCT
	lYOH0xozZLOCopA8f7kTBxpODTsprg5Cpr9FosdHCO0mzmytgRnX84pJ3EEfbg3K
	Tv3qbDSxy9xFhtu5NoMvPgxLcC+rrhcuTEf8YWRm3F6mescQtjNJNazIxbRNadBy
	r+DvzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbhxge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476900d10caso134267791cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304134; x=1742908934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kdZV2TPugUFxEY+ozHAQLVsYVfHOOuUGLJ1vgAe5Sw=;
        b=RHrUwFhk+DfIWrKdZZr91zT/LpYArYxUK/xxcDFSf1L9OUJdyKY3Y+Z+JUEVRLqUr2
         yyOqKYVMdkmJgWY0aGi10TtWDp0QCBOMtWEnN+uaqq3nodEEHMDks45e/1ZSsm8Uovd4
         19YG1/R+sgFtXTPVlbb2l+mxz1X0WoQTnmHXMKUOhGCPZi85ro9HjuiUAdRNg39Hry67
         qa2d5Paa6aHr1Ur5538drdcHp3c1NSm+SnYxyGvikvG+oW3w3ufFEfK3Xo/shX+flmWR
         7hSM5Jt95rqesNv0issckKE4EwiMLqdgT3YaOd87F6goOh1JZFTrridLvqYTq/PlTtb+
         LeTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjhiM/qEibDubhU88WKw6FqFpynlFx/GcIgv4bgZEXLDiHh0BBcxkmU3p8Uu0UXZu1oQydQREIeHV91S0j0Ab9@lists.infradead.org
X-Gm-Message-State: AOJu0YySJlUTA6H77OMmZecMzACZXOVI9SnWqEIwMQTVqBK/pebSgCNm
	mGPhY8wx6gL+6oeiJWUT6ClZEdCmGfvL1uoGQd+f8BjbPwrjn5f++voXkDUxi2A+79+z3q64n0D
	zHSQErzyocGUaV5wNpg7+F87lt6K29UwK3hobRIRmNHGzQeCtf/MO59w9L4+DjBZMxNznCx9zdw
	==
X-Gm-Gg: ASbGncuE/78CByhFRE7Macn/UKT1U3CbQle0Zkvf/pWr774pOuYQyj1sneYN0kWLnh3
	aY7eiIukqS6BqRWHfz456G8vuh2+Q08geDANQ5BX33ncva76+tOFL36VtEbDQ6RW+FlLAtQkIPm
	NpM8vFgvaJaS+ODBzOu/PppoKtoW0C4gUEUlRG+T9LTdU5zxk4y3x+uMBWNhMGzNHrQjEvf0p+B
	fuwXEKhqANQdgrddfnB6EckEDCAUDcWJ+Vp2n92GjPsgVgdlXdZtf0cI39z1N6Ndjiy/gfogl5I
	vP8hTf0TlmiutZdOxvamDHHa0O9+xFk0WjA/7rUWUqeuRPhNmEtU7Vez+HhfSHIu3Z0UG2YEvN0
	PjUOfBEzu7k0QW/vZlEEYl51nYEKr
X-Received: by 2002:a05:622a:1aa5:b0:476:8ee8:d89f with SMTP id d75a77b69052e-476c8129e99mr183009971cf.7.1742304133673;
        Tue, 18 Mar 2025 06:22:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcRqgTJbzz9P1nmWW4VMYSspiil7SA5Epyk18KgOQDwdyZVrQlwdqOqvzTOWq27UBldAbYCg==
X-Received: by 2002:a05:622a:1aa5:b0:476:8ee8:d89f with SMTP id d75a77b69052e-476c8129e99mr183009551cf.7.1742304133338;
        Tue, 18 Mar 2025 06:22:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:22:00 +0200
Subject: [PATCH v2 07/10] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-7-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4wWGavz3TsyLPGK0obVOVx1Sc2cyC4hcnHKKbsXewI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN1+FeFr2UQjmCcN5vnsKVjIXGHOtibWee8f
 7eIGjLCoKWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdQAKCRCLPIo+Aiko
 1XLzB/4/X3revfWf8/Vsu7jTH6yXa75UYaPHV82DaJLosrJLm3Zd1rPbSqMqC63rWw7qUp8DUq2
 hvv9cABybL+1YAln9EJdTxLrTCdwIpu8EwvoHHzGP1jxxg6MXjFcI3XBniK0i/tXAs/sK9iDqam
 DEHCBL5uHfagJe98Q1ng3CtOWpSfN+o2BWsKzKhBPN73M5IacEyC1+kHZvvbhsJt5gTqfu++CIu
 6Mtbc72+8UcNOYMhhx4xwL5+pTvLosuEzxQIDDL/Fm7S5AR0zOcWQlW2x2WJOXpzXF+32R7UYLW
 zKxl/TAZdRbTa5ytQgZ17GVVnoCBbhvdVHtEgwo+fZrxIzN6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67d97387 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=rbKIQ1AqokDPPu1yVMsA:9 a=QEXdDO2ut3YA:10 a=yUn1A8egHeAugXtLOssV:22
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Uy7F7NlxNIViqmJjTG_jmwge1_rpk1dM
X-Proofpoint-GUID: Uy7F7NlxNIViqmJjTG_jmwge1_rpk1dM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=708
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062215_803993_8124521D 
X-CRM114-Status: GOOD (  13.98  )
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

Follow up the expected way of describing the SFPB hwspinlock and merge
hwspinlock node into corresponding syscon node, fixing several dt-schema
warnings.

Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..41f8dcde20819b3134c38dcb3e45b9e5cc24920f 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
 		};
 	};
 
-	sfpb_mutex: hwmutex {
-		compatible = "qcom,sfpb-mutex";
-		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
-		#hwlock-cells = <1>;
-	};
-
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_region>;
@@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
 			pinctrl-0 = <&ps_hold_default_state>;
 		};
 
-		sfpb_wrapper_mutex: syscon@1200000 {
-			compatible = "syscon";
-			reg = <0x01200000 0x8000>;
+		sfpb_mutex: hwmutex@1200600 {
+			compatible = "qcom,sfpb-mutex";
+			reg = <0x01200600 0x100>;
+			#hwlock-cells = <1>;
 		};
 
 		intc: interrupt-controller@2000000 {

-- 
2.39.5


