Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C365CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qePY1UHlkzuDJ9kRye75Pnmuoq1wKjyrBK5aF/cS62Q=; b=UNpNnvUNRaakbC
	b16vN4mLvM2BhYSvxUnHNImo/UwSulAyLLatyzJ1cto/qNo1VWkMRSXsldhHuHLJ4pVnYFiOlRtKR
	OVSkSMOUOMDwNyWTRrNZr6zsOUowDG6jCiKz68CMMBX4eBNNCLFDOxZMp5mflrvyaSS2WST3XJhtT
	x5hNz0YddEXt8L0relkSavJ2pqKQQPhsu/ErJmtmeIhfPxWz0CuLyBjLoc3LHbBGNY218fVWiXiX7
	enBdrh3TWh2D/aT5/FRw8sV/q+tZSBrsZ/hai/A8AWkxlhbk/OEtT4cX7H7ZoJt7k5d8LgE/X3CX+
	HmAZDMCkzWalfNhwDN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8E1D-0000000CcSY-1Lnu;
	Mon, 13 Oct 2025 08:34:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8E1A-0000000CcR9-2thg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:34:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n6Yu017038
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qePY1UHlkzuDJ9kRye75Pn
	muoq1wKjyrBK5aF/cS62Q=; b=TDe+QfG3DSfdqwCx296DQ7FZ0Xx2pQkR823ql3
	Ggmq0pbjmGuGoZKFwUHqRHraEFnt8b/1VKlLUyMHkqUZJoZFQ+z38K3xB9s6ahYj
	eJDRW1BCYe8ysSQMJUvVXzaibBxN1g7u9RTcZR28CqE0j5D9F3KD8Q7GHhjm8Z3c
	lMATX0TwacEeKtIlPQTrnGKF1xfH4EWNBKHrxrWduZPEiQ2BdZNiRxPErw44cI3z
	c/jxmn6nSEAuNSRanRRuaPeUeA4WDtD8PCJUKsAJ1Tjo0Iu+yzd0LvX/oglMR2wh
	HHIr1tRKq6hWWsmMVvJtFv04m6OW3tBHgqspV4fvrbjUV8/g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk3vks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:34:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-798920399a6so6350417b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 01:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344494; x=1760949294;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qePY1UHlkzuDJ9kRye75Pnmuoq1wKjyrBK5aF/cS62Q=;
        b=oc+9AqWLNrjsWa3/XwsmrL0seHyRX7rDsgjCzA4R1IdWUHbi18ePUrTG4cvNwPquKw
         HCMAFuky5MkrDHysLarM9CYtCBB9dHQWNeXzo9XVGSrIS/zS8B5Kivs2ai+JJVoRmeqL
         H+3xGzcKK69dTgcJxuUvSxWfcQNQx9Ij2Up1/Iu52esvMWZbJIxSL3Ir5vJCKi2Sje9h
         jTAt/3JDXskzTMIP8i6akmkkJa1udcr2HmKxnOCBVMY5PtgcOOVvm/VZvAWUhT38blCM
         owf73+8fE7VJJN82SwrCkO2V1fTg2IU5ut2tUSdaRmt9Ru/xNrZFTNO2OYUi2bLrxDBS
         JQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCXbLSAHCTs8qZTNS2M0b5DP0pdmq4VV7KlGl4QZya7Ppse6uDXqS0jwl/WvxFrG7Nhmk48ncQw+ORl+ZYX58nzt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4gIxsYBoB7oxJNNq1jdXlDGG2JMJzSfeEhLsW1I2P+iFw1cKL
	GLNn9YvZxHIMFbP2WzQxKHuuW9FeMFLEi1x8OfSaNzTJ7AOYB1PiBUVauJygdstenMdvxKwibhN
	0pn8Q/Ph4kyvGjuEyUYYi4zib3TszoT4NVM/RN8ltCop9ttz5iMOItXj8lpR/0MJtmXYqkWq2LB
	E1Yg==
X-Gm-Gg: ASbGncvhFRGAFfjLyLFmnMaEl66XPqTGrVWKtNAQAh2TtDg0NhLu1CC6PPl6Z7lHNuU
	W06nz28GVLtQSsB9104g8QZRdNiCcss3CWV4/s0pLF4LH8xHlqnMXOTgg8NIl2TR8Z+9+c+5xeQ
	rFF8ZkUcdyjY3/dUbu+3kLsLc1xoSPIXMpB8haf4NVd3ZZWT80DzBBfGHg0EtQ7ExYWKQbGlLJU
	Hczq6rj+PHBB4tPc7zXyJ3j7+3NW/5MkZurfLOfh+SIQX3KijqSel7ZE2vrvul5QB+faUnTFJQ/
	peFPdhSScZQBIDEGX2X4A/6xH9resvKpBRlpzu04xnIPtq6U4bIdRGUpuJvVBJYW4SxbP+fn83C
	lnRSDOpvYOYmr0JvIYyURGPmyAXo=
X-Received: by 2002:a05:6a00:a15:b0:76b:ecf2:7ece with SMTP id d2e1a72fcca58-79231df6680mr25872997b3a.12.1760344494237;
        Mon, 13 Oct 2025 01:34:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERV8N7NBi1nNuzIUr3/wdzTu8NLNE5G5dPZcctm7j/03i0JAZc/m2v/3H2x785lew0TsCKng==
X-Received: by 2002:a05:6a00:a15:b0:76b:ecf2:7ece with SMTP id d2e1a72fcca58-79231df6680mr25872972b3a.12.1760344493774;
        Mon, 13 Oct 2025 01:34:53 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09a87asm10773251b3a.46.2025.10.13.01.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 01:34:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Enable CTCU device for QCS8300
Date: Mon, 13 Oct 2025 16:34:36 +0800
Message-Id: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ257GgC/x3MQQqDMBBG4avIrDuQGAyhVxEX6firAyVq0paCe
 HeDy2/x3kEFWVHo2RyU8dOia6pwj4ZkiWkG61hNrWk7a6xjpPh6g+UjX57WzLuU4IxhSHDeW3R
 RRqr1ljHp/z73w3lekvzAfmkAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760344488; l=1382;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=8N6JuyoDxEqzzX4bFNy5c5k0RGnFdELyNLGvZ2MUVOk=;
 b=Dxbu0m74+ExtDuCGfb/jHtefhFrQyDeNasjLJIZgNUvkIyl/vb6yB7Wvpe+DaVF39ceksDB8I
 MVnXQrcNPwVBICQgf0/xKwUdDb/ZugfIQh65tLcFpi6qqOs5HIdCZdE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: ox_vWmzlFzIJ3o8b_Hi6zS3P8TS0YxsL
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ecb9af cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YHNf7BNBHiJKSF8-TtAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ox_vWmzlFzIJ3o8b_Hi6zS3P8TS0YxsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwSZzzOIl9WIS
 n/a7RnWvKlsSrFyxtxLx42E+LEC+vBpBv8yz1397UlHKXguXQRpqoqZdjVeQu1GZGFAFrfBdwXy
 FYxqbJ/odh9VMI2/Pz3z/h3JdQP+2JZSreEO8uRSXVJxb2wEYihLaKY2b+k9uDkZmgb63XLndf/
 TSHu9K6N7rQTkVWK4Td8vAmhXskvr30rMHEsd0+c9loomH1Gy3ESfTrSxqzvOtaGR9uJwktGIZu
 UXbJp+YbRTuMLbsNEat4w9qtKFbz9X6CtSMtjCTxnZdEk/B3i8eEnt8nCWYyUnJkR4NOxo1WLy0
 YZsmgMpWXgAbaCPuzhTwaeR9Mjt7huqFCFnNsJj1hjvgtR//i7S9U4IlTJR5GFtiQ/iFJ4WmfIO
 tedZKyzAti68QP+fmSlBzQmy2oX1AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_013456_850227_D908B2C1 
X-CRM114-Status: GOOD (  13.45  )
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

Hi Suzuki, Mike, James, Rob

Can you please help to review the dt patches? The dt maintainer needs
your comment before apply this patch series.

Thanks a lot

Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
configurations as SA8775p platform.

Changes in V3:
1. rebased on tag next-20251010
Link to V2 - https://lore.kernel.org/all/20250624095905.7609-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Add Krzysztof's R-B tag for dt-binding patch.
2. Add Konrad's Acked-by tag for dt patch.
3. Rebased on tag next-20250623.
4. Missed email addresses for coresight's maintainers in V1, loop them.
Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for QCS8300
      arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   9 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 153 +++++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)
---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251013-enable-ctcu-for-qcs8300-ec83661e5acd

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


