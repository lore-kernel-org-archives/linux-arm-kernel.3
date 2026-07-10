Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCEBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJcLj0G6FGt0cvIQzEeMaFLLKWTNo1edV+7XI84Hxcg=; b=IbMZ4lCOW5ZqSpmAgkqrfRU0m6
	H8tEwq5YkjquyLYkZnLQqd9fAeBIHBZRuPjOJ7cC39slB0WrJg2ekUx++BZBpeGc6+hCbSwyFBHza
	ZFTNxtKVqKkeWqc+dN3L/tNH7dkv5hjQYwCuB/2Hmq+1EAM/wpPEt/ps12K4zDmljUVwz5wjE49sA
	Tu6/Lb/6sTf3Yo1s9XjRfFSRGPZmoFQTNDDWEzxs3DJawpwUad4mIn6NY0natXXS81S3GljA3kT6U
	/S/0mKJb1jc4/Q5d+4Nqg1cceh4ichahWtJ6wjs58zj+6DkZeZmC/WUokVAqb+KvnMp6Lz3cR56hE
	foCitBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi19n-00000003yZM-2jb6;
	Fri, 10 Jul 2026 02:40:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi19l-00000003yYj-26kv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:40:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669KZ8xW2917252
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJcLj0G6FGt0cvIQzEeMaFLLKWTNo1edV+7XI84Hxcg=; b=ENeThg6F0zqhVDJw
	wkzjiBPw9g/1cTEV0O25Gvu5jfU1Q2TJbE5nWugoE7sK2L/z6FIszDIny1Bwtprm
	mQLlr1JBkdLXkpO2CnnprHSNg7tPJ2wGP9QRh2AqKnvO8hoLkiHwOLWJW3krJ5Y7
	wQukfNnVa415UqHLQdO8Y8R/G2b5iDsiS83zSHvdgL2YVc1nMQBe1zoFCRpL6sVc
	E1Y/2+Zy5VoK6EecrrIxwIDeQzf0llGOo1CnZpkCR2XMPni2AWDooChZvuqTX4fG
	5YAkixwVVOHJ1TcisDSb142BW6d2+KAr32EXEqIPzCbxbXwGug6KqMG/mbV+7qA+
	WLXcuw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte0yqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:40:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848452dd146so1202009b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 19:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651200; x=1784256000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJcLj0G6FGt0cvIQzEeMaFLLKWTNo1edV+7XI84Hxcg=;
        b=Ux1gvGt9GqABqndQA+TJhL5gB6qO0onR2IO80d/p+e+lQUqcsUEBe684HYI1/AOtPQ
         Dg7Tozfmz8i6C8aH3CJhjf8rOFq3JgHFs2cl1TDGTMsOBcbhZbnpD7XA3uEVYZZ/XF//
         j/gWG/95rqOljHjSz65LucQQY/k+uzDvpbM1DV+6tFmmCmWq11R06IiQKqjPuQOobI2w
         C4lEsjGb1k+/VoSS1S8kKHgpwjibGsEAisINrpPh9AcCAkVbAb0ScTGoaGISgXcgpf4O
         c4UiZCqDvR7oNfCsBRAsTbtB4WgF0V/mbr9xinJnGoPXXMgKNuRYDMlzM4B8of54qtnh
         Jn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651200; x=1784256000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJcLj0G6FGt0cvIQzEeMaFLLKWTNo1edV+7XI84Hxcg=;
        b=H3dfgMgm94YT32e/HfmmEBxvz6v15waOAgxor/Ta9BXb2IZG2TXi/8UxUwPjNeEAvS
         nM9VEIbhVgK3WVwOnLemX2MspAiOtJ9NjBPVxAUQfRSampaT+PJ5Jo8PVJl4oUrxC3Zp
         tn0zWnt+r03DcOlmUFaJClTOg3mNIvol61XB/SM4A+a3T+2crr9HMO2q4LkSoHKRtPYG
         WLJQRiaJqjVwKJHsONDiQHgYg39aB9zFMMDdlo83ecw2uAzXaQjTa/76qdFxXiDl5rm7
         6odi9DSBmt3+0mo/DVdWq+xpkDh9FzFVDrjfKf15i6ERlLcAuSwsOqwQGyN9oDeOnaV0
         XdOA==
X-Forwarded-Encrypted: i=1; AHgh+RrQNp3TmTSHeo0vUDMQJfGZDg2mTPoG5GyjoE0/AVESgGlF3LvqeyYJvdRLawXQNLpvNhKURLEU8OjWwl6rWn2d@lists.infradead.org
X-Gm-Message-State: AOJu0YyVt0wAV6ENOcSZIAam1h39m9Fr46B75pLUjvmnmRFdrbUQHLXd
	ZrsB77pECSXQQbEvmG1dkrDC4XJmXHDcqm6b9ZfzMTRhIY4m+LAYNPm0mCoYaaSlicJQ88oInxp
	9feC1r7hWYGaBsefCs2Zw9uy4WsTI4+limSserzudKvJZfVjsucp4e0crl6gElkjexPSEdoJpLm
	ONGA==
X-Gm-Gg: AfdE7cnmXFWZAcoRuTFs76u3JOJ5E2SNlOe9+Ww7tLHwJe8kCCVYwFXRVPBHbcLR/eG
	Ywpjwj+59AU2rqPdzEzTjgkkVIeA5xfSFJOCDpovUBNM3w3NJ9zJf/PjM1rq2ih9q992R6UA1sO
	/2KeQ0MfADxWtZg+Kr2nKsaQH/K5WaZwIOhqF+D29ZYsY/wEYxg9ma9zRfbhhuHTLe0CVJucRa1
	69JEytXifFwU2ISBEqTgQvUTVdntzw60X+n75EhtUABiqMuHkVzAtMyuKp040bq3HPsYlJhaSi8
	kn3Rcnfm4DtwqeBRm1kskPPObuKpZoou6Xi/hA7zStXxjY1b1JhMrwmfoTux5ca36oESGPxB/g5
	J0+geLOxBVj1NW3BUA9vO3DI609MT2G3UkAIR9eSEwexV9tb0kmZGE24NorZG64tQd/L+VZeVxg
	==
X-Received: by 2002:aa7:88c9:0:b0:848:60a2:4e9b with SMTP id d2e1a72fcca58-84860a25381mr4199181b3a.42.1783651200309;
        Thu, 09 Jul 2026 19:40:00 -0700 (PDT)
X-Received: by 2002:aa7:88c9:0:b0:848:60a2:4e9b with SMTP id d2e1a72fcca58-84860a25381mr4199155b3a.42.1783651199850;
        Thu, 09 Jul 2026 19:39:59 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:39:59 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:00 +0800
Subject: [PATCH v6 1/5] dt-bindings: arm: coresight-tnoc: Bind on platform
 bus instead of AMBA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-1-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1904;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ltdgoUZ6tBDDcLfmDRkC7KQJz9iLegaPyl1qkMs19LI=;
 b=x6U8ATUjYt1nTIesdNn0TIKfMVJvoPUBd42Ap+ISOb1F/nvyCx0LKIGzdKwP1HDzxEC34he3i
 1Fd0UF3+A89D2tnB7KwCVWId/Xb42XoWIJGeTXBLOngreWA7K3mLQJw
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: m598RsHFoACmV1xG0aNsI8GPVe2QD_KQ
X-Proofpoint-ORIG-GUID: m598RsHFoACmV1xG0aNsI8GPVe2QD_KQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX/cQ6cEG8rIYZ
 JgGKbfsqBXoF5c5GAMssEuaZOwcwKzE7IL1ixggRD+2y+hN0lZWugBVr/LlbwfJ/QEJX9qM+NRf
 bs8f2OzF+sL2zOuh5nkwXCrug1XpURbJ53lLSsnSuXG90ydiKGbvRI3nEHIAbmSF2ckaRZ+g/Ql
 Bx4L0thbITPwqJgRH+DaiqJbHeBtsv2kdsayVUBvve7PCln0CWheMMgB2FHaK9hyJSsN/GrwTRX
 T7OhFCZpNKOa2gB3yMIvmmxej9O+KowCLvNKqx4ZAZWZl/+Q6MjG9s5UamUx2NQuAaqDTJdD7DR
 VVbKLdWsanhvx0IrQjtis6Lrws1XLgr8acmen1NWIqeziCizbEhZryH9dHaw5v/h4qYtMwlqoE8
 VokOvCm8SfOnQwm6Eoy+kyFFtk5YQ/ixBYdgE++wfJuneu470E74TuVaZo4TID4tFA6TfmK6zQK
 kaQizmPSkydO0eF8DHA==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a505b80 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vX9vLbfq_6l8qkBHxBYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX3k9swqzDqd7M
 xUhpiB50MqwNtzrq3UdE260xKRbJ2qL8V8T5q+3vn0UA1W4sKemLJd48hj69krAC+l5T4e1gkX4
 aut7qq86qp3s/S4w3Sl/KfCY5wuCQqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_194001_556688_AEFBA75F 
X-CRM114-Status: GOOD (  14.71  )
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

The Aggregator TraceNoC hardware exposes CID registers, but the Component
ID value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID. As a result, the device cannot be identified on the AMBA
bus.

Describe the Aggregator TraceNoC with a dedicated single
"qcom,coresight-tnoc" compatible instead of the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell". This creates the device on the
platform bus so it is bound by the platform driver through its compatible
string rather than as an AMBA device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..72fb1210e22e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -22,24 +22,12 @@ description: >
 
   Note this binding is specifically intended for Aggregator TNOC instances.
 
-# Need a custom select here or 'arm,primecell' will match on lots of nodes
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - qcom,coresight-tnoc
-  required:
-    - compatible
-
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    const: qcom,coresight-tnoc
 
   reg:
     maxItems: 1
@@ -83,7 +71,7 @@ additionalProperties: false
 examples:
   - |
     tn@109ab000  {
-      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      compatible = "qcom,coresight-tnoc";
       reg = <0x109ab000 0x4200>;
 
       clocks = <&aoss_qmp>;

-- 
2.34.1


