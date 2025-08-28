Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B70FC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhePwHpEAaOWHj8GxjUD4EtV9ZXNnl5MLU1KHln2exc=; b=cUtzmcnYq5tM81jfBzMbPwGp47
	JfeCmPNO/W/5IAmq9cBjx8AdYi32Obyu0X+s3EbblxQonX1Wx23LHGYXdlmTFdpW5LVMpi7wbbIAN
	KRLO6/pZENjdinkooYE4CjU7IbAkypXdcWPbuFKjKCA4AkhKDcQ4X/ZoTNELhtCiOn4hGtWq9eEsA
	q9IgmGTMG27zi1mCDoboNM7uAAo0vWQ6T59rzAY68ja8rcjAvPVl793GmLIZrWaEhyvYuYIkGQxws
	uWOtYLxTXzVms2QZxvqRbo86fmjctjXDQK9J75Y4jcMFsHCM9HfJ+KZDlqnRZuiThe1dEeaws1MzG
	9nHEC16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgMN-00000002QwJ-1aNc;
	Thu, 28 Aug 2025 17:24:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbT9-00000001TEY-3cn1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:11:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5oJda030584
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhePwHpEAaOWHj8GxjUD4EtV9ZXNnl5MLU1KHln2exc=; b=ErOIrdgrwTfY3tXl
	y32VFyZbmwxIbH4eBcHEKhNvVwFOlvexYYFNjCmIVygluAkXDzMaYceLP/rHqREb
	JaWv6kBmuIPvNogTo/f4h7yK3G1LxtA3D1wet2NBmZ6ttB42OFkzLhEBE2mAHFah
	drXmeEGI8RZ1FRGXMdrYTu1JHaHQb94GJX6ARX+mKL1n4JCayKnXyFWl+XT718sL
	JzcMzkysTw/etmKG23Sq1i9OJwSkAQw6+RxyB3O7os0Iujokrdk3GGWdEl1z11Jy
	PtmWNqcZTV6feLg+KPUFUjEYFeCYljRKteXouith/glPoRUa8JI0sL3yXMqZ1iJ9
	o1pyzw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unyymp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:11:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-327709e00c1so971211a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383066; x=1756987866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhePwHpEAaOWHj8GxjUD4EtV9ZXNnl5MLU1KHln2exc=;
        b=Ldnb/6zn4elppk0Um9LdLGWVcnryNBfQkC0Hr3bgFSFqvehHTYN69LHUuMJMiTqCWg
         9dl3w4YO6EYVEG9qR62uzs/1/CLKEow7LsWrTDRFNhR3h4By7QK3MCdsaGZJO1VGZ9yO
         5CPUOz+DQqpgQX/LLoWrkLB8oIAjvLTrRerGQTHtkI4zaWhoPSdK9X7e9284jqRsP77M
         OlsKmeOm4eLiSJMFd0nFdnIvf4JqehklFbhtpEg51KiW12k1sebkTwTHftqkzt9MVEe4
         bk64hMOO/VXYyUvGP10d7/SkoDg0VeUUtxUCT0RN1DSxKCfk6LBHdD6rBNKxQcN8+raR
         iXmg==
X-Forwarded-Encrypted: i=1; AJvYcCWS1x04hMH5lNaNmle50NRhem9ly9gS0d8RbBgvChwnJKhGJ510EGuV9RfNP72cnLv3FzqL2FKAsh89e93LOM5p@lists.infradead.org
X-Gm-Message-State: AOJu0YyasQPXy8CvBpdUW31hKu7PgkPK+NbxrFoWGEgel8And92DOD0/
	cNuMCuohcRNukvxfArKKI91DCFHTI7HPo520GCiiqqAB18aKWpXS56M7gnU2jHrQWxx+AfcdS0H
	ol/t4IEigKJWzEav/GiEtLEkWBvYIVJv15MsYnafl6ldsvv+NhtfGDxHEVcI6J7k9MpuJzxFQwB
	1IYA==
X-Gm-Gg: ASbGnctaLoD6gcsNQsHJO75yrFItqCyykSA0uhYuIlckhTP/ggdsczezuvxAU88fuVY
	QHGgj+xakmbm3wUrIOFHfumZv5QznMI23VsysWQJxJSkoE5KnZFfLYYUFSmLDC+HTBHnhKOWcfO
	qJ34+C0IsIc84TaiTzQczo0mI5VRTNXzYdQlYakufDR+EXpfDWKwwuIUBVnb+PUAGV36KwuqJEq
	5JEtTapi+mvmE2esfiz8tbHznKUH5WUuTOOL3un2ctEiRagdxzAS1X9EnazlsQTSypl6+37uGjM
	U3C38SwGOC5E1bWdbqVlt8LGrAL5em4rE8x00HBI9frQMLnV5e9Yo3Za07+2cdMnMjccpQikF0A
	=
X-Received: by 2002:a17:90b:3d86:b0:327:c934:e5c5 with SMTP id 98e67ed59e1d1-327c934e9c6mr1060072a91.0.1756383065286;
        Thu, 28 Aug 2025 05:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzP2wU+CuvXGok9xOucMGBvgqE6LOekvba8Nillw6XuZ8T4Bb1geXsLXy7ey8/aUya6rM7Yg==
X-Received: by 2002:a17:90b:3d86:b0:327:c934:e5c5 with SMTP id 98e67ed59e1d1-327c934e9c6mr1059974a91.0.1756383064683;
        Thu, 28 Aug 2025 05:11:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:11:04 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:39:06 +0530
Subject: [PATCH v6 9/9] arm64: defconfig: Enable TC9563 PWRCTL driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-9-985f90a7dd03@oss.qualcomm.com>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
In-Reply-To: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=898;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tq3IuL7wCC29pby6qPkuO/RCGMkeEsQAVfNt3fPCWAQ=;
 b=bavBQG/YKidnGf9CN7mjFGyftQOzvdExbFhBzxCH8ftSQSOg9DBCr7nJhMBt8rLSZldn4ZdKy
 nnFvOpxZRgTDmfvPkhinzKckUm/4tsly1FDV1zqyHupee0Wu6jTglxx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Np_8W73DPy7BDf5St6IKTdf4Ry-5WvHc
X-Proofpoint-ORIG-GUID: Np_8W73DPy7BDf5St6IKTdf4Ry-5WvHc
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b0475b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5PcvmwL3LSb495PBagkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX9HR4gzwURvhA
 ryTIrEMeg3ZVcqcbsaKjDqtkFamAC9OghAmji7nRqRXBVCrvtuurNMPh7yhgZAqsnQel47UwJjR
 sKC2zRRlvEQT2l3BSVG/AzAxa8J2ty0TKXHyhxg+lsGzKmkMiasCSmT/WUXxxgNnqk3/OU5APk8
 /7g1iH5Je4ui9BHwWp/NcbxNUaRnwImMr0B99CGz+0vC2I2a+rfXCdWea9KeSpvkJWRuCTNzmUB
 f/BGdGaI+Y7XhFwqj9qR9KUBvw4G1m9QAb4ApeNrfSFBxJ11qddgFTh1JTOcjNtNmsDIHWqxfyl
 2OP1Y3KkFl7wrZgSwXh5H1Yt/sJ2tjXLXZrna/L3Ps6tyXviQ3+QP8iE+EYodefTeDAw4xuSbZp
 CSO6jTWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051108_027544_86569C64 
X-CRM114-Status: GOOD (  12.93  )
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

Enable TC9563 PCIe switch pwrctl driver by default. This is needed
to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
Without this the switch will not powered up and we can't use the
endpoints connected to the switch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..c4cc2903c13c526168b592143a81b5e6333b6c07 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -248,6 +248,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_TC9563=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


