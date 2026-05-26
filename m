Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0A4CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJ/lc59p7BwOjZy3Mym2EBtQ9PV9HmJ7odtYIVkNmW0=; b=fbj8gkS3RK36qqkvzsxoRVU+CB
	n6m9Ftkpg4wCIJR3yyelnix80dBxVMhW4b3cALv0k/dgtADuHbXXkPD1ZPP9EyfM8joN59xkru5PK
	RJTtVVKRmQ2MMFyQoTYkfjJdTUHsZEKfrQlRS9JXiuqsI6t4gQcav+5Bd/NIYr7vGm+ADORQ/4DpA
	wm5USBegOsHjT6qwqOg9Ff17WBnTH6uNtNUj4FfEjFMG1M9PF2SJ4xLYhkmZii9x3wSG0q6fhHXpf
	2nXYSTGLZkw462fyWYFer6wwvKHFpYN4ubN3rO+4jd+q9YeB3t2orP+2kBanm3S6HkVqAZ05q3LPA
	svQlK94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRszP-00000002CHr-0eJ3;
	Tue, 26 May 2026 14:42:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRszM-00000002CFB-1LVD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:42:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsBMN2554447
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJ/lc59p7BwOjZy3Mym2EBtQ9PV9HmJ7odtYIVkNmW0=; b=id8xhIpr0lPQukpV
	WJswVOwAOr5F9LTpVLcbIs0I/1dzkuDWfSlWtyO4/Qdk6kuqsfe0KTji01h6fRpX
	aE0Up+qe1i943O7cQUG3TOE1hegqhm+dUtdJxz9x4mkr5t2z2he8DkYMOgOJ4E4d
	TPpcbPfd6FYs66V4tgZEHUmefs3BbVZVVX5J+gapLPVCeR8DmX5MssCXuWlOSPF5
	G0kG5taBkXVUvbcuX8PryRckr3rqp2VzOnSNJ4X4i2DhaVRNERJJk1zpiQB+6mss
	MeKeuRaz36WEpm4qawT6ZMaqiuVf+eZsKp0/RQ4pyLWbEyop1TKDvsvVQrdUsv/I
	GFhkXw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3tc18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9429f49cso14846836b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806554; x=1780411354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJ/lc59p7BwOjZy3Mym2EBtQ9PV9HmJ7odtYIVkNmW0=;
        b=R/67amFH7JnoAqW5241vGEa4PQ/vsrLKma5ZJEQCTTWxjw4131fl5jkHEjjZpSMDjk
         kKAZi82lPP1oP/pZKRX2JUqAkI/HvAMYLLS01lm409Qq/lThW/SXfJTzf/YztUAH5d+F
         3ZwK3WSRoryTHR6Gtck3qoDPyz9xGyvMMEuKrTWdytUUi/G43BUNZOQ0Lk3dnQ+IPPBL
         z/dbZZoCr85XW4oio48WEXp2eUUX54VmaOiGwinGvxRpqiXELX/MRq6gM0r1eYKVQusG
         Bx2/7mG6jwVyQkQbUVlu8NF54m+BPRdYMakp2XYmgt/pkpUemhqU+REkrtqnHs9o1d2D
         h67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806554; x=1780411354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJ/lc59p7BwOjZy3Mym2EBtQ9PV9HmJ7odtYIVkNmW0=;
        b=gQVp4nRV8B8SFOGowHHjOKL1hgM+8as8Rl+1yUqFQ7uBq8yXjVLrzxiQLgUvvRgWg+
         3fQSPCewpFN+Serbs77QckqgvtPtjy+I6yYxeqZWrr0nLTld6fIbcv/v/cbRjCUXP9VZ
         7HseViG+JQTAeR2/vci4p4MAc/FecEqdK5dxTFWJWNCLYhDiB5A5/0dv6jaJX2eCggJQ
         FvCtjF0y3KKYbyMWWPYBaUK91LgO9zBLWLCxUOxDBNlWWj/9FLQHv2jNNPw4HNlDh193
         vYt9fjm6idB9GwNMkZ2QPvfNpYilYyDBbuLfybsNXgNwLEn4vambOlN4aTbCItAzpVZx
         93iA==
X-Gm-Message-State: AOJu0Yw4RiI/ubV2sls0yFfAxVLUaD9Yv3ICXJggiQfQV8PRh5N6KtkA
	xya92Z4RmW0ua3RG1P9jEi9Hbjah0daol2TOeVlRJhzqTdtC3aM88ceIcZF5qGtK7MhPdVcnFWZ
	m8RC++pv0NnpB7LXlSx1hdjB/DMHzLWXvul0xbG/ZCUq/JbodWZLLvndTnuLaWXcOa1/8TU278E
	i/hQ==
X-Gm-Gg: Acq92OEz9b8cP7G24+v4Ho5IoUxj3lEnp5zzUP/HWNPn54nXFeodtzosBIngeQ/06kv
	dRNVx3Mb4EL3XFrNPGUz7WMDvKQnF5J85/pgnnQuNWFA00uS0eQRKtSt78QLy6Kei+B/VzYPlGf
	EO1RbaD86GKHm7ehFHV1yE5bALze5B/EnkcPl6S/HEX/N26ImPzaWLQdfGEbPVuLNsoJ/GgQ9V3
	+MpTLPyMX+j4tUjGSRYMALvZtZsFdSLYJQL6PxxMS+YCMu/PL+zmtNv0igGxCs4gDI2LtwmmArI
	5RL27xWUOkf4a2XwglEndd+cgSTnt5thYr9ka+Ddxm6q2SUzC3gM3wZ8a/HAZ3UCFuI2Qd5+Flc
	vvLQZ+skqwnFofySWZ5d5172M8wEBhtWESx+100mAh1JhCW/R/T1r
X-Received: by 2002:a05:6a00:138b:b0:83f:9c6:9c with SMTP id d2e1a72fcca58-8415f11f645mr19443830b3a.10.1779806554411;
        Tue, 26 May 2026 07:42:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:138b:b0:83f:9c6:9c with SMTP id d2e1a72fcca58-8415f11f645mr19443777b3a.10.1779806553947;
        Tue, 26 May 2026 07:42:33 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:33 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:06 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: monaco: Add GEM_NOC interconnect
 for adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-5-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1074;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=lWkUuj08lvraeSSyxOex2Hdt1a0/ULuWaFXQJiE4zls=;
 b=mIdUsT0ginPBt0NEy5rr52A+F4ILAPui5UJEns91Xrujoak/KyGU2jmd3zW303drZHEnRi6ae
 ReKZYHSyJHRBGAYXCc6RUDVjmkYlFt0lVyd7y87izB/po3f0Nt9KRjj
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX7XScfw2dEjbV
 8ZEjVgn8OmHnREpJady3cNnPqJ1UmWK7dTyfBnE8PKKDd8If54/liv6UyHe2p/mDQoBOFG8IpVe
 B9ACudAzkyeLDMKrHBVwr60IyDEGfLv3a6CvmYSRpaNuE42P7T90Y0AEySp+Ye4byGi7+ODroYu
 28WGUpW0/RFvwNI7ij6TkCABO1Vx41eH+gL8hzzf0sJt13v3OAGBRUkaF+OIVaUnKasvlY9e6Nw
 rPmLTwuPGuyQPYjTPFfaoNhcl4Npagnfy7FCw+pqejVVv5kUVvpXEsmNskXk1iTYO3m7Qww7F4a
 PTOYphafeZgUXT7zV8aoVdj/ufdCvN/XD25dSB8UPCOO60NiLtWeQg0CFKS7PkaCQcFuzNqPyiK
 KSKoAuqr9dTjb5Z8UPOWaf2stn+WOd93mcKO7q7wbaD313bEc7w1ep5N+0mpKaS9YHJSWWP7ZUX
 yLfCDCEwGCdrRcgp07Q==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15b15b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EzTgQT2ADBj4VUy-sZYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 4eds-yHKGKZvxlClSIGprLhAclM1jai-
X-Proofpoint-GUID: 4eds-yHKGKZvxlClSIGprLhAclM1jai-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_074236_491285_36DA1A0C 
X-CRM114-Status: GOOD (  12.56  )
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

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 2660c161c3d74f4002aebff40634509e885fb3b3..00183ed67ebf0645e1da0c4674248354fa2af941 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5088,6 +5088,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1


