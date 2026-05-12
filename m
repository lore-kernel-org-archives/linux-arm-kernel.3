Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0948FCD484E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 06:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2SU0b/R9kMyW/rWWdhry8CNcsvlSGgNqEIUHRWdESF0=; b=S+sE3AirZKhjEu9asSUGe4MTDg
	YTChKcnq9+I6bHSTdSCpQUSFIt5QYAtGSoJcPZCs99vOEgR3KIMc+z+jz6Cqj7OtNvl+bUw/DWbGt
	hBvzUUaGFgwhpOBQMSgdRRVuGprmjuZamvq0uG27nE1d5thaXoPXgM8cnLG1Vy/AUgv/uEoqqM3D4
	yqJRReBPkA7AJF9Y1VyqRmWYs91MVOd+5WtnK06VdlhCUFoOmSkls3E7sF0v9cLHHDyw33uSX3oL7
	uH0mBWVHo3SEPjSnRz8Irh7k9B2LH1fMZkiR+AtMq/O0n9H/+mVok/N63/h6D02/Nlmy8WpdkAurv
	hsMXHbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMguR-0000000Fp1b-3rW7;
	Tue, 12 May 2026 06:48:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMguP-0000000Fp0p-0CV7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 06:48:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5C4Vn2186197
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 06:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2SU0b/R9kMyW/rWWdhry8C
	NcsvlSGgNqEIUHRWdESF0=; b=UEw/GvlX84o4q+ulkg5Km5SZFyOP/B8hQGKbsI
	ber+XvZDoLl7uGz0YXOsEwbGcsFV96SpbVCq1IpqK3RuAoAR57TMUFUPJok9wyOP
	F6WWWYkxEmiY3ogu2Vv7PAEKIwNP8j+qQw6qwytq4Dt62gqBZVv2fm/Phf803Fyy
	myd/MKjAFO3GYJpw/Qy1slIJGqF2NoS1kKmqzI86XbpfYd9JYjVxduqtf7fk3Cmd
	B+05jEMPm3nX2N8osyZLpTOdf3ojz8FN7MNRcWCkGMr6dLq1RfSxFRKqam+fdDrG
	chz4RqkPOhfkilH7mzK6h8TD+ALHOM7CaVAY9QUEEerLpTyA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv29wmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 06:47:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c799ee56bd6so2854747a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 23:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778568478; x=1779173278; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SU0b/R9kMyW/rWWdhry8CNcsvlSGgNqEIUHRWdESF0=;
        b=BrI05VSmPpywzrF4eyUx4HUjj0CXFlPYNc/mrBvhaELMiEFd9KU16OxZJN0KjKb2pZ
         zBsSCkMHulHR7Yhm9Uz7mQGUEjm4DLtW7vooZkqb+h60AtoyKkJD90PE2wTl0s/8MyGt
         FkQBqpymXq8SbAjyFV/xXZziBkEk4S0fr2nXNms7LbjZ8MreUhLp7SXZIu4AvdypS81p
         cfDQ02fMfWeMMfXU1VjkiP+JqXz1yuXct/4uKTFdljd6tY8k/NQJ41JCjRyVQK26tJtK
         i6rMzn4fW6T0udFz3929dnk0CS42/Z0wtYoM/dEjvP4SThZ6Q2FOhHvRG+AhMp4v4/SI
         jzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568478; x=1779173278;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SU0b/R9kMyW/rWWdhry8CNcsvlSGgNqEIUHRWdESF0=;
        b=nQtYXSuU9Sye7byJ/Zyswn5F8o1Tz2gqnBd52LUfKyoo/i4O58Jn73/lCVhUf1MtG0
         nrStSAixfdo9tfDVm2/Kceu/TiHj0W7fgMftNt0OD6nDe3uhdRRsicxieyLUPdBuIGPu
         Hm9mNsPLf6wuOzBASqSLn4YQUiP7Uef29+zJzclEfCImKLVT+fyC346ZmrAEdm8xegBJ
         8km0UYZB2mZMEYyZjewfivnWUBMAiT6p+myORU1LumRBr/k/DF2MwWYwcWDgc7PncvH+
         AkVuW7eE2/VvM9hbqi+8TZasReCN3G9+V9xqLBbJbk1nxwoceS9DkPrPZ/3Y7e9YH9wx
         3aEQ==
X-Gm-Message-State: AOJu0YzU8BT2cQvAVLlqro1l3aFS+zcIuApWOqxEnA7wvp3RHO7++E/b
	r3senzi1iOpJtyw9bDKNYP39OYV2Er6fVpjty8yPN7PDY5S4ZMAFTlLv+rEuFiTp6Rj1JqvwEAY
	LxV16JY53LQFbvPSN44ZNwF18blAkAMj/JDzI4CXNVsbGekU89x4OXv9QLs/160c3rZeNm8LU/g
	q/WA==
X-Gm-Gg: Acq92OFff5W5+Njqi+DqvTONy4LbKbirgqNwHqzQK4Iuxm9oWFrz7xzqK6N+xrLM3Vt
	odhr1bBDDEXlkiaTPLulxE47LkpCgAZW5iUHurrIZN2M7DYOx77Jtz5rbQHjNPrwYf5HMxoWqkk
	DsGOhK7JtyLza+KG64hv49ykXMCkKAziH//GhQ3K9CxIb3JESV5irmGbhtiDAybkA68YGhM7S8j
	C2SXbBFsLr8QuaVhVgjoFYsDOGjHhBPECslXebZ6SfZZg02lYWjgo1u1bU63MnGoG6hzX+QE1Pg
	EDmklSaXw1R112D5s9KekkcewrOlTMsbzIOkJwGGmtrTStnM5NZMhAZI8rrihMF9WsL9x9ChS1O
	gfAhZGk+xFacMGxkZOBh5vNNvmTogG8p4qFPGYuPGLu8TmWB1L9y5LlmEo/0VWF7T1uXtiP0jFJ
	1k3Qts85NTZ0H4I3rM75w1r1Ai3bwd6gGxkBsS9CDT025Z8OCrh3U5GIWR
X-Received: by 2002:a05:6a20:472a:b0:3a8:2af3:ce8b with SMTP id adf61e73a8af0-3aa5a94e12dmr22068178637.14.1778568478292;
        Mon, 11 May 2026 23:47:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:472a:b0:3a8:2af3:ce8b with SMTP id adf61e73a8af0-3aa5a94e12dmr22068150637.14.1778568477780;
        Mon, 11 May 2026 23:47:57 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711b21sm11301479a12.15.2026.05.11.23.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:47:57 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:17:52 +0530
Subject: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for IPQ9650
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABfNAmoC/yXMQQqDMBBA0avIrBsYIwnqVUqRmow6gtFmqgji3
 Zvq8i3+P0AoMgnU2QGRNhaeQ0L+yMAN79CTYp8MGrVFk2vFy6eyBhuZprVpOXgOvSqsd2h8UZU
 WIaVLpI73a/t83Za1Hcl9/y84zx/kotdNeAAAAA==
X-Change-ID: 20260512-ipq9650_smmu_binding-36dc05d39860
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778568473; l=1078;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=6wHpFlaVWQkthUTDK+s3QLO3JjBHD2R8lY4J2EbLGW0=;
 b=WA3d7eYS8WENn5BlKpezS7JDFZq9Qiakj8wOlHNjrws/8ygcUSCPCJ87Cr1QXn049NbMh/6kK
 3kR7G2kvZU3B7dH6SAJwNg6iKQgSjBxHYa57xvnVHZ6wiqOe1mfI3X9
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: V9YOfH2_yo96WJq0yVaRYd5NJIMkQUkp
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a02cd1f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hjL68i5Il40rG0QApAQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NCBTYWx0ZWRfXwx9vhdB8MWwH
 XfofQeBYIUQK09fEbQHl4lWKQcl3YAFL3CN+RhQYpu+zCEWQCO06kldBWGGZC4jZHYso/a3NmPp
 a8brrG0cMTyp6IvNJUfD+tqlitDdoAS3nj/jgoeEAIMYgJcG8iWKexkMvSxyvbuRZMRNcSQGq/S
 Y0MiPx+7sIp/Wie8pmLK8hOzsiRNvxCHilDpZ9T7hQcj0932ee1rdw6I3iwlptGNIBS9e+/dJuz
 t4ZXDLF3eniSa9iOnx3OmCgVZEpi9JcrEmmb4vy7CJv6EjZCfA1/zhhwZMTdMfxOj7iH4WmPdd8
 Z/Y29fGnodSlmioo/+SEXauTD/i3Vd+VQElqp8NEiUkkujaF69K4v2K9uvsqR7YHabNsBInXQgL
 4NusfpB+UvFzAReYXhNm88UfomsznthC3kYyqv/ep667An4msYYDCLCxXJly4UloKQKkxLhP9uQ
 dGHYY7wFo/tCmwKREtw==
X-Proofpoint-GUID: V9YOfH2_yo96WJq0yVaRYd5NJIMkQUkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_234801_212241_F68EF6ED 
X-CRM114-Status: GOOD (  11.93  )
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

Qualcomm IPQ9650 SoC include APPS SMMU that implements arm,mmu-500.
Document the compatible for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..226f16711d67 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-ipq9650_smmu_binding-36dc05d39860

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


