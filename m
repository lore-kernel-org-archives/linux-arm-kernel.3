Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0C8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Bog9bBvqmPHD/SPbNJlYxw3AmH1QILp9mUTrZ8ifQI=; b=GCTiQrOAX/He9GIZbMTD1toGV8
	fZN7tr11OFnncRedVx8Ew2WP6cXX2cTZLjNqk9PoEcgTNr4X04V5pTElDADNUinxPMLMvH1ujglaW
	UWnzukyte2UpTcYLryabShdix/7yKcxnCXB+68JErDPq9wErN2fDnLzf6IfUNFNLbI4govzPhHF12
	Fp6xhYSCyYbzW1p+jduAsHNuLV9TaB7Z1RZS2AsToiCDdMc0/oEJVnCQDjllGaEcmFc4/MUCKscjl
	unlf8U41kzF/g4Yudqszpus0VWa90j2nzCzLliZBqRTOq2XlOSbujUYWBRt0grvHp+a/iPKhCdGfG
	Fa3sJajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVqF-0000000GgJ5-3xvB;
	Tue, 30 Jun 2026 10:37:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVqB-0000000GgFA-0dbl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:37:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1bx1573383
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Bog9bBvqmPHD/SPbNJlYxw3AmH1QILp9mUTrZ8ifQI=; b=MeRfrcS/dNGA9sWn
	k/QHc2h/4JrjGZZJoGVNg589P4iC+JbYaSHjf7KCrWpXMBd0tq8+eoUaqZTCgIXD
	ThA2MfhM7YCPS7LKgJtOtUrJmEU4r2cgRDCdQms2S3cT0ixReVlgSI+uraoMABUE
	SCzCBeJQFJ0gm0H3R7ZTR28rhlv+ISgo/J9IDLRQCKdl15MsDvFoU2FwJmUp98ba
	qRLcLf34sdNjHilntW4O2pTt/v5g+7bK0FTZgOyO+z3We+BRzwlujhRI/d8Z8/xQ
	JVdhSVYVr3DFUXSYF7TmPYVHxyITqhodcNGzkh705En8wReKCrFH6FT7dq46kung
	JVg5mQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46861pyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:37:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847902a694cso1789510b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815837; x=1783420637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Bog9bBvqmPHD/SPbNJlYxw3AmH1QILp9mUTrZ8ifQI=;
        b=ZIZZNlmrHffWtRn0UaM9kURYjKMGt+XnQoU0XdD9Kj6HkjFOxEtMHImOZscZ2IJo8J
         4Db1bbSo4nc7SyShnooeDgddaGGpl14SZmw7RkM+lPbjbbyM38WlsyyUFu6q5MqMx/ep
         U+3FTMLeF/K/Nj91DioMorCojfC5hvJ5V5A5B8N/XtAlVJhy3KuCxMx8wM0APluAeMw/
         4ZGscIJ82qOczZFJc+GHMWJYksmMHRYCMRig99vXV5dSpNcp3N06+1dprFgQCwUz29Gz
         c/2tgOnXCWkFq9h+cNvI1Z4q98mTVv7jEKr2hg+DuOmR9Cdm1f2f+PLEmfXQcnCYIO3w
         kVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815837; x=1783420637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Bog9bBvqmPHD/SPbNJlYxw3AmH1QILp9mUTrZ8ifQI=;
        b=KHujKAzTkPoPPoT44o6HDLMK2XCNv8d8jyP9sMphUDOk5+7MN6fAeO0Ia+x8i/YBiN
         eseTOYfwCxicB3oU36lzp3pd8Q1jjXywu3eNjr/RBIpzRe0Cev6UKDL387BArushmDjV
         TYmxaP8+yEERswoJidhdPDFbuVd+R+MQr9+Zn299hre59oTcT8/Z0WJYOIRP6jUEaAtm
         qYWxbYs/g62G2RQKsQ36XKZEAiwR+eYbZ75HRhnVcDk4zQopL2NDh207TD7pSzjyNjyG
         bzttEMbvtpFjmrmsl0Ia+xKRPCgbNrQsp2yHOpR3qBI38C2QLCyVI2AxfL+PRabl/4tr
         zASg==
X-Forwarded-Encrypted: i=1; AHgh+RrVXK+b+7x6xlnk0puKf36mrKzV46/zj9gl/XOFqbbYJTlKPYLhxIHPYlddTQzwYYud4siRLVfRmvVEEqcRpTI5@lists.infradead.org
X-Gm-Message-State: AOJu0YwatyFoyZZNab9n5Q3mX8IjG8+Lh/UJ9WbxRJ8QwRX0yy+5HytN
	ixnu/ZHqF+UJrl2UNrwvs+9od7LgEyCJo/rzhzdqcuLjNMoJJKxcAi2CBFbRRRpVpazGalqaYNs
	Rr8JNZ5zk8OEIA/V5ztoMMfzkjE8PDV2tWGBN1B2k7ib+pl74I2DsbghfbWXm6l6fE5D51IqPcu
	kG4g==
X-Gm-Gg: AfdE7cnbIciAwMuwnrIyemmCdVbdOlvCrRWbwgLGJj2CuzyVu/HiA9y2/j3sNyUT4Lk
	bUQ0+AIS6L9t6mHbkXcT6BM0goVyknpUSJ9mWOxQ/bJY86OBaAnJPWy1nYMyJUqBTkwob/GUq0u
	L+stWmXBZa9WdnYGrDixh4QufqgDLPJQORCq980v6lzFsB2eLwTDDfmkTYo00BgahBLQHJNpdn2
	vzTE1Mr5MbyiISSj0IslxtTgaMXd6hzkvC1sycDeixAtCmWz7v9asG2ivErYVc8NQrD4mDFKl8G
	/Rc5D+wzF43CDDJv8YSYTNDORyvPl2rRxTar/Zm5cou4U3U0bmMCbE/bLNTvzqV+MF5y6zZo7k0
	cd6VaspkMymGaYTW0UysnNUrETgA01C7DUtOpp3AhTq6oL8OcO65AqmDLOy8mSvlpwDD9T+Habg
	==
X-Received: by 2002:aa7:9a83:0:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-8479f27b428mr2431810b3a.39.1782815837174;
        Tue, 30 Jun 2026 03:37:17 -0700 (PDT)
X-Received: by 2002:aa7:9a83:0:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-8479f27b428mr2431790b3a.39.1782815836700;
        Tue, 30 Jun 2026 03:37:16 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:06 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-4-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=1196;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=3fON6TjZ2nEd848+J/DYzHWC9pCmE8J5utGZa5iaXgA=;
 b=4PewfliGY+OR8SpxKIQ0Y/YO0KAfeJez+GHTWzwcVoY0cub9IKTIyM4LHizFRR/4xDjaWcJ58
 pRF0HxlyKaBA2apTuiu6HXxVKMT4U8ajQTCqmVTdV6aNi1+KZ+MQ8AT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 6tZ7n1i3LOiG9XPfDV0_h8Us4IIGiqdb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX1Mbj0Y22QeZR
 UyHh4nebH77lVwLEtEpi3/w4GplzIms9c4iLeZG/w521VVG/VIGTaM80kxBmU4EuTdcvpC4iLVb
 3gL55q9j/RmJ0CdJOBOTD0U04JvRUg/pP8OZ9inb9iNWwK+XilUuelG0TZXaa6KfBvgLGu8BK4u
 f6mKk4ldlDfAXgDWXZO4ONyYTaHBERXSAJEw7+BUnUiM/x4LSQISbyVC75Ep62tAJH1iHL6wEmi
 0x6md52JlfkVNiEEeyWsF3AA0nbyBZAA7qoeNyC6ZO2hBmfaztQ0fGe7d8S2jIvyPwwNs/dclFE
 UzpIW11URao1eAGwCvHVfpfdhXsCj7t6uofQX7s0MxSY/Qqt2oUCd2erkEvTOBuvEIUV0mfX+w3
 /COKRk0WCd79QR8N60xuuXb7m1a6uBXZ2lV4WrbqVm2/bD7Nf5d9gY8UU/oMKDnH0UxUrEPDCjp
 5HqIhgu9IUaVQ+IUVXQ==
X-Proofpoint-GUID: 6tZ7n1i3LOiG9XPfDV0_h8Us4IIGiqdb
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a439c5e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9-n9NCBYjeJb_QXN7LkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX0flswHaKOd1J
 /r2WnO4uHF36wSzq1RrYWuggUKZc+wJX2o/RwShJI0kY+7lrSkjbCST3wczQN9EVviwCyCJ5WJZ
 VWLtCgWJVp4ihLul5/facUOZz9yZlAk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_033719_711555_7507F6A5 
X-CRM114-Status: GOOD (  15.75  )
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

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. The AMBA peripheral
ID probing fails on this platform, so the device never probes.

Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
Dropping "arm,primecell" makes the device probe through the platform
driver instead of the AMBA bus, which resolves the probe failure while
keeping it an Aggregator TNOC that retains ATID functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..d58483f9f93a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


