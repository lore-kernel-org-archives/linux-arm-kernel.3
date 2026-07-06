Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31766C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlsyewBqxauWJCEQm7ANRaFSqV4fDdt46wPdk71U6iw=; b=P6QPYLCUPBSVhbsAtqY7YMxsJM
	0m5M79mqoyoKTO9NkX0E/wn+pmU7DlGk8Lh+tDopozQWzHEWO2FTIxs/GvNb7MpF1DAaeF45LoMId
	Ve7KRAEosT4COswidADt2p/sD4W51AvoS3+3YS86a3DWs1TMW7gNYohVEqKr9XRfpJuDlhxPZyp5D
	UD3m7z8vBQ6n8SPOb0kijUdYaKBR9LuLWM/u2WVTJCJoDfnH3L35eUtFY4D5nsZ0/iwg6yv1yKIrU
	rBlSrJgOx99PPF+RkM9PrMoarEJFHXbm0KbPEn3elJUXOzotatchmBA9E8SHCTHNOph72Jc9Y2GLG
	d4PDyb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmdL-0000000D8B6-3Oej;
	Mon, 06 Jul 2026 16:57:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmdE-0000000D86l-191J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:57:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFEle762370
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 16:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlsyewBqxauWJCEQm7ANRaFSqV4fDdt46wPdk71U6iw=; b=Xc2Q1tBd4ObuSVGv
	Z2uWuZG/ah0C0okCAzSaWsmYSqLXRHVShTyuVimtessLLVDQSDdBC0m+yRsrdsAZ
	Cr5UW7Ltudr9r0M+T191BnRUs5vhxUD49HLonGX2zfl62+emnRDaxycOqYHLeVcb
	wc+Hv71lQ8Fp1QXhlSykLaFSUdyNxvcr0sn0C/RSYIscZwrkh46LUbveP83M2jZg
	HSI47RDxtqeFGMJ/WHZSap7RjmktmAUgCN9hrZMqy5K+KFVh1DJ5l3pDVLvRc3pn
	CSajoF9i6Jbk+rd5c5DXVl1UtTMI5zNr/4CUjAxiBaPbI9Ubn90FAI+kjjvoWIy0
	Er+8Pw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxtm91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 16:57:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8895156101so4884373a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357039; x=1783961839; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlsyewBqxauWJCEQm7ANRaFSqV4fDdt46wPdk71U6iw=;
        b=f2VJ1wLxcxXmVCf3xWrfnNM/HOgYGwDOK1cXvTbCN9PGVwxtxWJxyKtQ78n55g7u1Z
         va92nB8UJXM2TGc0x/JEybCXiKNRHSkytTr/DniizIocX2tuhXX53WGgaFZmyYr37+VT
         URXl7DukogSNprLUnLfvvkUps6FeRgPvIz5SGzrsIDeVC8LYlENa6eHBto0I0/fqEvWk
         ziS/prrEOriihpdkgDiQqZxODQeJLrmnhk7oqPekC4ncznP8HTNn4xVTrgOzs5CIoqL9
         c8HScpSZBYfr6kzpA9yk+GW4Vn00BLcR+9ENMbPZbbMVuL6mMv05YeuFJnZvLyj1VJvH
         Hj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357039; x=1783961839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LlsyewBqxauWJCEQm7ANRaFSqV4fDdt46wPdk71U6iw=;
        b=ItpCw8lv7fmyfPscR6mem9CSvDDs6q83dR7U5Ps9MECNEQsj4M49tfC8uHZaF4BWny
         YYNPM2otkPl5zuQlMkgAnZCmpGHkKDN3qsa5zjBwFchOebAl0DZmpGu/gzX0Rp8eXEGy
         fp/jNbwrKEgsnMluQ9fmFpAs2LN+qkg789fSdl4o6TJkhw26wwzqr5v7LuErUMpfRdVG
         ilIxj9zfFfeTlHoPsft/YyztT7G3bkEfFrMlo5KhoMQOSujiDddNfCNuoaIazUvG6Htn
         VWPnEreXNEghGKDpX4+7xFzm24arNrTZcab7vpQO2UoVDAGO2Hh2IP9yvpO5s9tZg8r5
         9Jmg==
X-Gm-Message-State: AOJu0YwQK0yWzTSfw3zMQbITupEWxIsbCQgIQ1S7SG0ro2yHUhgGYmVg
	LS32XBRL6t/fHoAa1KTPgIacPsNi/X0Z/Wk781YY6jtHe2FUZfBU/F1ImMNKu+spCegMF1A0Y/N
	01LpAhhS4l9g3z/cG9w+JAT83NeorHL3Zty9tLd2R7KM4WTroq72Ks4P6Siuz2nDQC5amDS55rL
	Qrkw==
X-Gm-Gg: AfdE7cneM6bXGUAZOrBAcl/drqGo8hodHVXJ4QYTmLACKmzWOwQkI8xWb/w0cGawLgD
	8lbhUEPi8gvVXne5Rt2LvM84UCcNqJmoXiko+sWJiRXvzEb3Sx6QKw21NZAy4NIX+YCRBeTWahJ
	lkQTYz5XYFGDhCVuogjMHXJYot0/P6EYCpqSQtwq6Y86jjb3OXnCwvnbQJV1V1Nt5U6ZU6Jmcdd
	cPZNHmdwNnUVeb2YB1sHD1odxTfqq9kbk1MZ2azTumR6HNaSAfEo4MeoyX3J0s0Y94/ezVYcm3b
	/xKTtaVTxMOLNkO6+R2l7KYU61MoCQI6tSMDNBZUzZg/sdt3T83mgQAeSov81bmRwvnYMitaMxb
	OH4toiLwpqUIvML5Yel/F8Y8621t6eA0uAnYL+TXnNQ==
X-Received: by 2002:a05:6a21:118:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c08ed0f40fmr1869372637.4.1783357039224;
        Mon, 06 Jul 2026 09:57:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:118:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c08ed0f40fmr1869330637.4.1783357038743;
        Mon, 06 Jul 2026 09:57:18 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:57:18 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:39 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: talos: Add GEM_NOC interconnect
 for adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-6-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=wbPY7V/FOl4cQCe5O2DtEsw3MYaK7JiEV4us8ye3x1w=;
 b=uIp4SJQdb1agf7l0A1zJf93Xn7ky6npMpVlZAoLLOlESlUMOfaywlUkQrpjdFuhJvffGiF/zC
 Wp42e5jaL2MBLNqPZ4dOCIwPH4FLxkvnx1FF0fFlDAOxJ32l0G6R0YQ
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: q6gpyJDJYZckeCDT0LprZv0OElwnVxlg
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bde6f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX8ySWyuZRALfD
 wTUxz3B76bqrO0gRcZQ319+f2/ORo66z55cCHQQzKervDvil2uRavr8Dy3nuMQiJjhFHEDEbciH
 jwlNHfSjq6j5iNEmgnGDyxU0/nq1p7Q=
X-Proofpoint-GUID: q6gpyJDJYZckeCDT0LprZv0OElwnVxlg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXzOpwaBfZJe4a
 XwOcJzjhMY2ySwgCq/o+QhFR8ZSoGILYJwQZ4zD4w/TleN+Zy0TbMJddfo7v0vGXlTXULN6xxcT
 TE6vhZQnv/+b0LLlb3HbyYWHc1CGd8GHZMQB9SUi0biINAQhLgRu7trknWU/Jhn9as4dmvv//VA
 iPp8PZDi/PcqqAC9daMR6xWfltFn3ZCmEzTJkox2+D3U5wznIXxSWKGyIlT8cwkqvbwp63D1SNx
 wDsQDrl9AWGz4QFv9KQ3odegAHHrMWYcOlRw1x64nmdExxVHCbaViff4oqNTjPqZ9KRSORP5Mfm
 lLc5dF9JvBSpqlhOsDG7waCY+OhN+iV8+Dul6r5Yzw8/0h95cVGn8xwgcbocXKUcg9wc4VfHO5E
 /50H/Z6rIyrkzxE+C952qy7nPwMi0pUEfcVZIErywFA+d+6LLg+jZqGTM9+uem4LjMmwDGAG4jw
 ECUJ8UnXwAAGaAnVe4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_095720_509792_D8557D07 
X-CRM114-Status: GOOD (  13.01  )
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

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index e506a16c9070..ec7f2c78ad18 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2090,6 +2090,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1


