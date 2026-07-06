Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7FEC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=; b=nnWy80ZXOP+yiftFSPUcHdjN/E
	G4SxCVBeS+MGVeV/rVJMV2b1kLt9/BS+AMZ7/leyiearYwenQySWnoHXQ4m1/JQRlwmIHEPJ1y1x0
	rOFpQWPnGSyPA+9Gf/FchStxCIzzdF3Z1IAJi4lGir/3/kjNTO4aSKwOHE2/O/mgnSazhywo0n3Gb
	rshS1CCEwhHIcLCp2aB6NREFJ+HQSBuS+JgdWAEsPT1PDWXG9Agl1XK/CpOeZXkAVdQwOG9qQwsMy
	bQbc4bNObxCFis72JuQm+Z04lUUTHkeOQqtX1g2ZB+zA6QwyLx16ThVj12iZwYHpAIqh3F/CM0rC5
	UsD3A1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVx-0000000DbOe-3S9D;
	Mon, 06 Jul 2026 21:06:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVv-0000000DbLZ-2NLT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:06:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDqNk1628698
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=; b=AbccwYnywChyPTgF
	RBrC4+h2W36mvrkx3GLid2XD8jzQPcYsCBVJGtpVUJgTXhdJutcHjTzD+D4t3OmW
	lAYD/YbakPxt2eAcAAgatuogf9tjrG0N3iZnhxmtMXA+tqUfaMGgFLTSup/4a7uv
	Ai9+L9f6UpPHNpTh5q4IE4Pf/vvUYu1QZathG5DaDd80P7UTdzhStjUgkoSyK+lQ
	WulOaq6W7+4URzgUeBfR5sepN6WbPw4AVMZYzUHzxtrLvY43BLm6GhQXeLDN7FFH
	SFsdkd+9rhUtY/gn6R1ofBxxyGg3sYXhf8F+1gFjx9+PAI1fjgUsEukv3e4jEKij
	JNNF/Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw18qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:06:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9667280edeso4178933a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371962; x=1783976762; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=CzxM5kYNwsLvXe3xpz7K4ZjdBfN8F2qf47P2QEDXUPclqmDFyfpw/PPbDOrClyJGgh
         o0BkU0tLZo/+bPo8oA6ISUpshkpMg8nUNbkbnmkIuZn4p5aXGCVe9RccYrspVmVoxorT
         jLDXiRXM9/BkxCs6AV1V5kWGVtw71IvDgpJWXXrkjtlrNrEg7D2dn8Q7sqTYD0Fyaq61
         QxlRMdITHxzzYonF6bE5MjPzmTO/Y+x837oWB53yBPzd+fJCebThGSHr7HxYaHAHVjH5
         HcAVOwh9kthwWzZPzAxHIGd785vz0SxnvZwG8F8P4QERyIqW8QP6pUODP5hAOrzV1b/E
         lVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371962; x=1783976762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=SeEFm2kZvzIbwuRko19b99nY20xohAhzOmjSsv6LXFM6rvK0GLA6ppMEhz+ED0Pfwh
         6j9ZQH7RCDr2ugbCgkf5dXwX3drmi837JmtdxkJ5WGlf9PgIVSL2WlKJ3kROA6JjIjUQ
         b2uDxwTZ4nSgRcPBK3z0aO3CpNYKIIxbP59v2Xvgm9IWd4NRhecqG8lSkMzkwHxeP/iH
         qeWyVXRzZDjX8QtUoe499KZoeJP425XsnQmia37wLe+nIKLG6WIfk9fSRXTOVO0zo7DD
         BofdHGTvGZ0yP249F/dKvptfn5q6ec3QjNSIjjEjLbdaVCqOimoSzZj8Ph0Jag9RRlOi
         lb6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rop8qtjSBMkJV4BPjhGEBaF7dR+dKq+h0B5+PXewlegadaM8sTSnmWe7CdjmoEJd4DJaEuBkmJLKQEgkdHumpuu@lists.infradead.org
X-Gm-Message-State: AOJu0Yywxq4HPktKX4wuvMY0Q6OW82vnNeC/3ZrVKEKPBbhtlBxecZpo
	hRaGZGHSxKcTb37wgiWBiOz/rgsA5sv8F8aCzVksoNTcZAv9Y55Agr0kjVTPIXxDTK96GFM2BPD
	D5pSCY4QQjY/dJu/dHVzK6ejH4PniPP7HdeqDy6sChVN9QxcKfzgSa7rTzP+NZ0h66nHBdUeWsu
	MFtg==
X-Gm-Gg: AfdE7cnwr5e2LEFn1TYO/OWA7+6jh4accCH8RmVHVA+SZbh4Ure1/SSuQih8hZ2HYJr
	NO8+C1dRJUYawvVDEus7g1IMaf/UN7YLbYgIX4wojfdDd90RpL5eywLK8lIZkChETO50uaAHXfY
	7/ZYbgHf/weaLOVdnkFGuFfy4mTVXX6NZvA3AZK6iplUtJ1uBK8qD5kDaiEdr8SMy3iVm4aINrI
	VLeM3k+VSEfmNdR2KRb9iirF10u1yrI7u7v1DxZ6eXCduMOm6MS6ceT+ktmN3yttEBYDvxS3G0U
	OYl+RTIJfTonE3G0lYjQC92L62nypTJ66O5bXmku1xhUe9yZBGL78gic9vST7SGsPa+vWL1fFcr
	xyu/RDrQDbZTX7XEj9wmG2Oo2emiIiuGNEkc=
X-Received: by 2002:a05:6a20:be8f:b0:3bf:9615:12da with SMTP id adf61e73a8af0-3c08ede1ea1mr2865629637.23.1783371962477;
        Mon, 06 Jul 2026 14:06:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:be8f:b0:3bf:9615:12da with SMTP id adf61e73a8af0-3c08ede1ea1mr2865583637.23.1783371961997;
        Mon, 06 Jul 2026 14:06:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:06:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:39 +0530
Subject: [PATCH v5 7/7] arm64: dts: qcom: shikra-evk: Enable A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-7-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=849;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TpvtLBwihWHNEKd1VwQvgAfHhzoeB2GGOqDfiPe0Xho=;
 b=dfyRRLzk6X22LRvVuarzLJYhr4uXZga/lIRc5OYOiiD8py29ZoBlA877+GkX+z7ssquDayLoS
 i736/Elf9UxAHI+/pIfeTDFCmYSKvza3YQP347A19hJlyWFrrg1G205
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfXwW5Gc3VIbHcp
 JUKB5RbV+/PFQSyvX/rWOurrOrYeLGFrfXugWLwBbEvZ0JL1dNunXa0fdwFV1xN/8N2cqPDAUx2
 PUMHYjdQw4ifyzaOCasVFo+NyM/pqLQ=
X-Proofpoint-ORIG-GUID: LVu_l7BJtjtXdFF5r2pyXfsDaxkfe6dd
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4c18bb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX31ldT/Pe7Ec8
 zFxEHU+WBp+SXVRM6DXo5oVZff8pe/KmmgyeO1RxXirT6pWJ6FNwNGfomOTeZigIP7SIUHlZipJ
 Dqv5Dc39TPF+YcFnAikbJCGNSv2zqVbbPL3b2N/XI9Je9sEgf41Bk1BtpWoip/+P5NXnGMCx4up
 jzbUiKf9wU9bLmSxzexRzc4TyHjuwk1uHEHSiHK+OO3ohpGX6f6ZGB8ChXC7kt8eBEwmzdwofMD
 MoFLeDIJ7ja/zl8yOHKFjvY/cWD7+LMolOVKtx9X7BOsQ46SjIN56KUtpKL9c/DolxK4oyL/+at
 /Vq6U4/0/19Ty2fDmy5/9/D3WP70xr/RLz+Sjp7S+wksUSaN6CcZApuNnDNVY7d91eXOo2tdUF6
 SjFW4HOLiDq40RugILjJHpmWtMsxz1emxiJpYftE5KcBFvySFoarMoEjimRzDLFM3s96ECU5dDZ
 1iEwIwdUln2edZQfoNg==
X-Proofpoint-GUID: LVu_l7BJtjtXdFF5r2pyXfsDaxkfe6dd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_140603_654793_A5902DAA 
X-CRM114-Status: GOOD (  12.76  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra EVK boards.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 4b7be09eb5a5..9febbf200f10 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -36,6 +36,14 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.54.0


