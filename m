Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62C9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZQa/mqvt93chY0RVU5zPGmb1at+p5NGdnFyV5RZOgI=; b=ur1MGObKpKAcpGIH+YwIWiVN+J
	hhufybS7amZ4EhZ2+HeYq79d4ltMrcXmFYwHMXDqh3o+HNoTDRN1VWSZpNkCDAbM+n9vfZEhSsVod
	wA2G4EngK7VnFw8W0bNE1zldlFrB2xyopRkJbQFVEWVEQnxjr9BrwSSnWM++nBqYGdi1/+/EBfdyu
	PReMBHnfJxNuXS1KOI1e264oZfrhDojjB4Dr+Vaw1KWMXMlUWWKGm877VdaGkipYfzjZe0MQ/AIrm
	B1101j4uddkFrAm+7Yfq5sKxycO8pNfUlQYbE7+ht3QgxGYxFPFxRZZRwGZEKuwIYQIWGDL32UG84
	YdCCBsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtiW-00000003ILC-1Bdn;
	Thu, 09 Jul 2026 18:43:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtiS-00000003IIg-1t47
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:43:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWq712373957
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 18:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZQa/mqvt93chY0RVU5zPGmb1at+p5NGdnFyV5RZOgI=; b=kttAp11+1wwuB+SO
	rITOqpWpy1QK9fpn+uMaZKyNalwD7bIGGLtFn5BeOZkpPVi/+zNYM+KkfvzDRdlL
	J3kAbwQhVdMMv4BPn6OIPeS+XTWxyKuz+l34yGxtPHIgNHjbFd7nrjHkeC7Jnkcb
	tDLPYYOdjPN7VbH++3Q33STz9tgjxtB8ptOCoaeNIpVOt/Y8+wpeHCWudekjg5Q9
	GIAfy1rL70lAHnOuviXTOLTLdjlupoibNXJ5f2gtBsntJ5Jnai9X7QKapndaPOk3
	VpVPC/mEFbUhgFNzGW6NNAyTxDPyW4x3YesjtJ8I7BskFT9hDf82Z/qilaa3KWiU
	fg/eEA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5gwka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 18:43:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccafc5e82cso590925ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622599; x=1784227399; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZQa/mqvt93chY0RVU5zPGmb1at+p5NGdnFyV5RZOgI=;
        b=WaQAWbgM7xAivum9ABHlJgm1QAg7X4IRQYC9a9WtNX9M2Ixoo75uLCs9HKaDbtdL74
         /sYfVcBsS2kxvLvXIEE22K+idJFUYmGoM1Dqg4c/3V5S1fRTdWFJw8hxhBWbGy4ij3wW
         jCfTDThB2qV+C8RfiLSlMaFIYu59CnJC83p/5qAdV73W3g0EtfqXuj4Die8WAG116WUJ
         Qh2NBLaUhSmwUEvuUmGBpAh/NCIbNxLFUC/rVnEBGf/JX6507eeJvUlzcraaExyrhUIQ
         fBj0Nu44KzMhVyoHiKpG2mKzgnMbszyxxWahTj/m74p0JnZNCkBFvFnE38AfOE0iEAV5
         W/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622599; x=1784227399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZQa/mqvt93chY0RVU5zPGmb1at+p5NGdnFyV5RZOgI=;
        b=P6Oenz88WADr07CwqB/UWmd9zZjuKV8A573n/Cbfr5ZZhDr3KLd6e3gp1g1xJqTlZT
         Fj3IkRv+5aMVuKQtGOVSdWL0MsxKdSlZjkJOCqwMNcAFnRy8TExx8Ag17gGXcgvx2ILJ
         CDWTEPsMWaL+ZQYJ1xWeUC7pa031adI+dADK8QO/eFWuHlm1HrWc2BXvwOuZt/2/IFoS
         HvlFtFfh/iYHHumY2TYjkkzSK0z70Sx6bcbnbZw/gPZLDCnDJi7ZcuNl0DY8q7yZSu7l
         sgs5NBWJn5RL1qtJkIo9bA1achkaoiwVOpY9wHdc6RLSYNKCfHqS54GaUsgnybV+dhue
         QwOA==
X-Forwarded-Encrypted: i=1; AHgh+RoVpneK1UnHFXXfB+qv3CEvQzpn1qSto7j9rQnUTWjGGLbnxrCCDkQ+QLP5pkOJMSox+Lce2WqVzt5rmuIb+RYl@lists.infradead.org
X-Gm-Message-State: AOJu0YzDwNyjXI3fCOj8P0pxq7IEAHxfxXzTrFM1d3Y5BDP0v/C0IOyG
	iQhqJkEy3offxiRxJ3vO6BDaihS2tTOmbCIZzEwKcORIQ3gns+IlCi3iAq3DzBbQmwZUyWrLJrU
	WP5jr0SOyHh/QaCGMFYVcC084rHe+dc/WRhRt9xYy3nzpbugg5wE3Tg0sLb7FpG3s2NSZYjZAhj
	uNXA==
X-Gm-Gg: AfdE7cklENSBZlSF3AjTYEWelJpjkdnf3jyez5fVgiZ5aEKIFccEea7FhR7tNZEOx/h
	e1s4XDslFGzBNzCwb7cNDEAcbK/ua7vrVC+RhkOzGOFimay7jmO8Gn2t4ISpvRPzmuOAsGjXGE7
	H09kyFYBwX1W5Lab7EyZRF2hhfWkAYpFeoWwq5TBPXpbVMSm5gL3viDPmeEDMuOhcO6gaMai24s
	oHKpYPxZvtR455JyZeRbySMNt0+ClBtjmHqp2D/Ld79KGI+MCKJ5fe3jfxbLcMcy4dl5uQ+/c1n
	fOPUFs/ScvtDob/Axl+ImA6YgQU9CxObxQ+3YvRsijWNl+liP2umX/qQcmWeN2nSG3XYL3u+e4f
	kW41qxyoVcQmgqGwGRFzCMfEWtpOBeWlx5ho=
X-Received: by 2002:a17:90a:e7cc:b0:381:9ff6:3dd5 with SMTP id 98e67ed59e1d1-389415e9f47mr8816700a91.25.1783622599286;
        Thu, 09 Jul 2026 11:43:19 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cc:b0:381:9ff6:3dd5 with SMTP id 98e67ed59e1d1-389415e9f47mr8816665a91.25.1783622598836;
        Thu, 09 Jul 2026 11:43:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:05 +0530
Subject: [PATCH v6 6/7] arm64: dts: qcom: shikra: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260710-shikra-gpu-v6-6-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
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
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1606;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hyEGcjwM6KENpeiGPhvJEAD4XFMZNW+63d9GkBZxZpM=;
 b=NnPL1pTXwyODmjoz9V6QImzaxRVMlFXSMFKP0EI3HRuym5woRxSxuwPBcZ6F2RmFq4guFSEBF
 HlxdGGQu0CeB7RqV2YL9E3KoLSDrA8wK8H/NZ1rspf394vAZc1s+TfN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a4febc7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tZdy-_Mj5ciOPZFqPb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX7tM7vSBMlstf
 GzJ6c0NxcD9TXoosztMiNa9yyaCzWw7ZmCbjnJPQdwcYtwQPaK5vto/iV3uvprhFpSYUohEVh/w
 uQWINJTuc7BF/GZ9FRn/aOowA+n/XCg=
X-Proofpoint-ORIG-GUID: 3xr4x2aAQ_uXzNbPxSvFURWmJFwA8aUJ
X-Proofpoint-GUID: 3xr4x2aAQ_uXzNbPxSvFURWmJFwA8aUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfXx8TAqSUif0qF
 434SjqSgZj7L9UimdSyV5Gv3BYpm3GLUo/7hwRA46twOAIF0guIS25jc0rhGT9k4gkP8wbzNQsL
 9sI5qDQv9Gp9wH7IaCA92m3sWQ2rYn/nE4T+csEhJUDsBvdQfFF+xa549iKN2TBtw9y+aiBuGbE
 AEu9yps+lsnc1/uogTBJwLaCpQ+Ydw6gJlMM7MjTPWlUClxedQBzT4gF7M81CNn+ac8lT9NwBxR
 Vr7c0k0sKh44DFZfYZKRd/dUvIsKN3fWxD4o2CyZwVQh39wbfk6O06pHN0Aps761GqDFPoQBoS+
 vqLfRHW8UwBkLnR94tRcpzF2ohCgq31Y9iVdmdfEv6US+YvU8t8uIZIqZbevSBzREI/1UOOLBTf
 lDeBlePRen0N7JnFEwD3+bxi5yKM9sbcNKotF3mOrXsSYAhd2gtTuAIdvFMX5owijDISFfx4CqC
 NF+DigeDkNe5ektGA6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114320_507412_74772BAD 
X-CRM114-Status: GOOD (  14.06  )
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

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures. Set up GPU cooling by throttling the GPU speed
when reaching 115°C.

Without passive_delay, the governor fires only on trip crossing
interrupts. Temperature stabilizing between two trips generates no
interrupt, so not all cooling levels are applied. Set passive_delay to
enable periodic polling to ensure all cooling levels are applied.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 34261221664b..eeeaa369d3a7 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2510,6 +2510,7 @@ cpuss0-critical {
 		};
 
 		gpuss-thermal {
+			polling-delay-passive = <10>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -2519,12 +2520,25 @@ trip-point0 {
 					type = "hot";
 				};
 
-				gpuss-critical {
+				gpuss_alert0: gpuss-alert0 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpuss-critical {
+					temperature = <120000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-thermal {

-- 
2.54.0


