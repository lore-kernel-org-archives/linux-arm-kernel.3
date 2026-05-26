Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EE7CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QU6H474a0YDo59Ajjy8caYGbQkw3XHZEy73rL2NPd8U=; b=zykxM7w/j4SORPndOxPCYaQ70v
	6sDba/pXW+vapL/5cPKtf5e3RYWeeV/6SdzDvuZTlVSEqAYIfbT2/GigFT+z+zpQFL0tkUmbbsFHC
	rXZXKjYHarBzd0ItnhoFiCGtZRSMVZWOtA0iQPIOkM+EzB4aUdyeftReeITTvIOzmkjlLBiDqCLEH
	qrsMc2m1uBn8E93xmkFTbG8hXbVOLfmtiENoZAvzzUIJgQ5uBkK6axPlQbh+Y00I/d/FY6hvYI+b4
	j+eI5gNWF1SaZexYJRw0jZa7nVnGO6RDrudtAsPwOW+VuMt+xDyvQJaXPAuu0I5tAzHB6/610gDdT
	Ktco8R3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRszZ-00000002COL-1JUu;
	Tue, 26 May 2026 14:42:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRszR-00000002CJJ-1xr4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:42:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QDhwSi2528529
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QU6H474a0YDo59Ajjy8caYGbQkw3XHZEy73rL2NPd8U=; b=Qayyh9SnNbcVlqD4
	48hf350bK8RsqsDr4NQ0GNVo/s7hSkJZalrF35arJTah0tBe2W7pLXHpZkfQ2875
	LBBhAwETUVZ3b7bAcKC4mRRDSJx6jJ1LTEaFQtxzA+XUll8FglUHiQGONllLVYSm
	gG+j+NhEuqa7KdeQdz+sQx/CuURgX+nSWSFnrnqi3wi9kH/Rg+XE8fWBGr3B1Uyc
	TfRCGam9YacO9G+/kbwHIJPt3hSmnhLIOYQISqbiT6NcHeAQSd4X1oLDWBVVoyQT
	5PzYpYw/uJjSejAYzDgFH4lOtZjLanZpFq5WD6Zrto6n5wkI4maKSW2d5iZZ4Ni9
	eJp8Gg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnr8nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c829366cf25so13862003a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 07:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806559; x=1780411359; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU6H474a0YDo59Ajjy8caYGbQkw3XHZEy73rL2NPd8U=;
        b=CemjYIhd2hlltW5T78L1Ay9GCbyA/HdxIjKn51ZLAVKYlhTmUs9zVazQL04YexleiK
         wVb86Bw3jTf1vkjK8+aqIV2t5gFpnexU1OSgNQ6ZIK+BwOibBvIcVax8JvlPxJAdOMhJ
         nc/MBooH3EqtQ3+cHYFtGn92+x3z0qd5jbuT0VqSxBjOhBYfU0FsFxGEgS+mRt70mLy7
         yrFUu1Q7bODR5BpI0kz/GYeZFQWBPo2rmAgaz+Ysy4XENsTvYBMUZ4dftXBv1Kq2bNQf
         /7LK+2EKVXLacEJBB3loSUnxU0WIIHWWFm1BCMbQQB02lklUC45jdyLhk2wAunLRTQyW
         Difw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806559; x=1780411359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QU6H474a0YDo59Ajjy8caYGbQkw3XHZEy73rL2NPd8U=;
        b=fLqA6FQxdXQJ7tQ+RFPT3Lzzzk4bTvssX1NQSJ93OkUSu6fg0KNfN52uHCd1fceeq6
         YG4uGfwsCSvvHZPB3SXY4N/8bZeXgq+aycQYWLXe1lv3Zy4tIucEFUfdItreoh+/5M4g
         PsQREoVelwqNl/Rk/7/WB66H0qX7yGM5Cj7VgW045LZuD+6zMFHUeDSzFsLdJIHiuaU/
         x8lms3VhTWckcph6SSAFrE4p9zQ/sSy3s/bvCoZjaaGFeFweJpIY3+hTX+RtteL2oRPa
         6k0gpvpmFEZ7Pv4nEshRU+TecHQPMb4k9P0hE5OM7qQFgdrEL7QDX35J6Oqyz4Fo7Kzd
         Ai3A==
X-Gm-Message-State: AOJu0YyP4ajnuePP4nnzsyZ4/bigZ7Z8hNUhj2/xxIM/tuoxqCgGvzHZ
	8or3V0ABZn0UHcsiQ0ZftBRijrMsrscQtu5seaKZbhokwxSyH3ZntHMqaB41Jf68feppVg4PcRk
	KNPLxq+9FD0aYY1fpiUtMlAMbGUqqupSjEP+DL99YHb4WZn/QrOVvMznJkPoHnqFJ2UPQCZfZLh
	vbdQ==
X-Gm-Gg: Acq92OGpGLQ+FdMCI/KQHSWT9RobkNp+6P9SFKyNREKcvU3u1ZGAOeYJ0It4zYr1lI4
	KKYSlsWZpAvF6Z09cVozFCJ6cpe0wHEA5NGs1BZ9MXpxMNoa9K9fV2lS4BhM6hLpkNOM3JRIol4
	AUTYjenQqhIO0KvwgFeGr6+MoMUgwkW6/2a3QB1zefh8uN6TNGUOyfxz1odQq/H2sGdaJDuKpza
	s7hY8ec9V50YuepjeQ2sDtuc8Wi/81N+drLkYm+ac290PZbNf9awPQeHL/hKdRrWXo05CBPp9vj
	AHaIzAi0x7I9lV3stQoDJYRfxp9MKGUpko7Cc59Z/ki5ml7439+7/rCpT6debbxLelli3qmmN0+
	nUZyMg8KQaqfF3yGH/AJWpv2gbPoNr/EaaGz7Cgzu06Ls2BTbygNQ
X-Received: by 2002:aa7:9a85:0:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-8415f301995mr17730385b3a.32.1779806559082;
        Tue, 26 May 2026 07:42:39 -0700 (PDT)
X-Received: by 2002:aa7:9a85:0:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-8415f301995mr17730340b3a.32.1779806558448;
        Tue, 26 May 2026 07:42:38 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:38 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:07 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: talos: Add GEM_NOC interconnect
 for adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-6-2a6d8ca30d63@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1048;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=b9Rdi+IfVGJGVd0iCHEmLl2F9yeoA7YYGwM/7TZc/sc=;
 b=fsVa27Uyywz9GSHvUf8xB88UX1ed1IqGjTVwOaAancFT19+AlIGoYxRrcONbOk+rVEKKqPWBt
 6fOQgHbCzBjBJxlRuYKC/eAdYk7fc38gv1W36Pb5JsyTAc5NJjajy43
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-GUID: 5Y9YgPBksD02v2_CdbE-iRvwq7sw0tDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX3DckIvRp4Ba2
 J1k3sGU7JyV+mdIagB5HMj6m6OJg/Hd7c1i0LWJQOZd3iMw68RryfI/rDVaPpCI0by8o4ic5QEP
 lAuH2GxS04UMZmzyiCAjwqAOm4X/iwkQJdZ/mU2T6qbrCcQc/OZaH3AcrTurweodxoim/fncQgH
 ErezRN4QoFOA1yKrfeN3dKfKfYAjpiG4m+C/5572ji1hViKKuGrJm/rogDg5+bResid0hKmjQnr
 BISvaOwXqndFDq2MSnPKs12ZnoMhJTMHojITkFZimck4uXgN0X8C6rOtnvzCPAG/TsBPlWWaCug
 wEaaJBdSCvxDpRtFGzcno/C143DmrPJPVLEsaMhwj7aOmHBXNbj+fBB0P+XZZSxKdMmaXLLFiG7
 uVDw2NEk9P1YKKu6tYHuqiX2W1hoB/p7ERsaggati3ZWEGmb9qJOli4OzX4pvLibrHfUdksKQ20
 Yc0j2TVoioZaeRhMPgg==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15b160 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=55tFDwK73Rs-p4iooc0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 5Y9YgPBksD02v2_CdbE-iRvwq7sw0tDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_074241_638994_4D3C8D12 
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
index fb1bbc51bb8a45832568da26847312e00cae722a..74322507f4e8c796bf9529a9f0adcafbd725ac73 100644
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


