Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61513C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 13:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wDO4niQLIzyaovhzjRfqwUvDa3R9l8wji1/eeFWSTzU=; b=WG1K0dwkjr7iYt
	hUD9HsKeKwMaSl477OGZvUaUxbUYIJOHOxVoaOtZBEIA7Y2zu1zCqTR3KXTi/WyDoVaoNzu+KP63B
	QXe7vcilEwU2rI5suEQvgctlYiWvt3kbPPlsGu7rtEM3F1haxOCno067uvqUrv41hxpIG7v2oGo0h
	obeXOMlv1PM2aXkeSotWOewBmVR/4WMal0iURTEliL1mtiMoN2D058y79/JurtksiGP7L/PIZG28f
	7DG12W4mmd/1SWvxKb1Z8DNpC6PwEyNfNtYoNmucjKdVppf+YlA9CNobm8FJnT/07XJqt3iZLyySh
	SV5ICdXdUWuyDx9FT6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXhu-00000006ZUu-0RM9;
	Sat, 11 Jul 2026 13:25:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXhq-00000006ZUX-20BC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 13:25:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAmmGw3539255
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wDO4niQLIzyaovhzjRfqwU
	vDa3R9l8wji1/eeFWSTzU=; b=BNJpy7j1d6O8rzmlwcS/dMkRHXNmEjaoeiq0/g
	H6luACiPLywWfOidvBGHDgXnaiSbLxo0YhBQ3UERyK91UpZ/Y1i46ynVWGNoQICn
	LDU0cX7cTYWS55z7xXeOk4U+2PK1ztwq7DzIERa3vthcqyvvvfmT5WeWnBJO8QLJ
	LHa041hRZmZoRR+MQ/Tt1qqApQB+Tl1myGaCCPIiXadzUOeesqTlh/cGZI3IVZ4D
	O6caX4IBQmd56pjxLAUtwJ+6F9h82/Uf2ihWBQ74wXgCD/RRQYEX2S5BZLN8/cyj
	VTQqP1YZC4f6szKGxjuajTkW2fjVJ89edBrSQ5OY8Vgj9knA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcgtxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0867a75ecso43790886d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783776321; x=1784381121; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wDO4niQLIzyaovhzjRfqwUvDa3R9l8wji1/eeFWSTzU=;
        b=SUn4oWruKmeUzAvdgiFxtAAxFsTUsPQMLIilqyKk/XVKQUfgbFBSG4fgaV0PGamBW7
         3E9ZoeIca1fBqB/fxBmE5yM1/huczhjmZ2V3osy0fR1S2O8cAj+6A8VulGdilNNevKhU
         nIPd0FktdDY0hi23QyWuVvFrwHcMh5HwMw77lNyfOREUHShdJTAQGcHV2U4jfEwaZy3B
         vYdJvkE4/OKmpv8xPCtzBZ1KaDQ7UkvcrUnOdUZgMmz7keUz3gL8KuW3BQtPFfFrc62v
         WBCjls+bFSRo7l6uZQZUALIS/36eOPa7CCcnfTtHcZLasMUIi1QSlZVRBCQFJ5uSkEwk
         4+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776321; x=1784381121;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wDO4niQLIzyaovhzjRfqwUvDa3R9l8wji1/eeFWSTzU=;
        b=ihGH9yfSiwr+Gm554IHEgwdjv2ILnMJmEdCk4OfyIO9XqPZ4LUmz8d+PM+svdatlla
         a21Cdziv9iwc4szojJWg2u3elK0PuZC3cqRUhZiO0kZW44e2uuS9PSB+tsAsQYYi6vcE
         OtGmYo/Qc0ldAm3OwR15fM92A9+h2BpF8UZU+yMHw3hckxBikDgamw13paERSBcx6FzR
         uuyW4p/776tuqWTjXOEihJNtIMH64esqIIGF42kp7NSJ5Re1aj8FPAA45NkT2BNTSj4/
         4bE582bimSXpY8YvGqVBAi5E3B0OeJBB6MIl6tpiMQlxG3zWT23W01vYDIn7SNslQ1pV
         f4CA==
X-Forwarded-Encrypted: i=1; AHgh+RqmihR2w4VdXDnPlJgifwLPzFEWkXqMwNnEPbk4Y9skoWmApWvtdO0DOv7t+xy7CQGXQLhsohh/T9CxmWf23Dtf@lists.infradead.org
X-Gm-Message-State: AOJu0YyrnjRE+mjA8/GTzW6QTkEH0fhNUonIt+lWIf0Ci1bSn7y7BMBj
	khS15uN3Ayv0/bW9o8oSdrzXZUHXwtyVfQG9gS6ZJwBOapG+vStLlxsgOW5bKmMqTlix93Wa7t9
	z3P0Aq8arRguczUCPUw/XwbOnlouMUOu/VSCUu9xr7yXydlguU6afHx5xL6AzJ95sDt2Lx+j5OG
	8+aA==
X-Gm-Gg: AfdE7cmEb/stVyYTiz1meMCw+47CyO5Sm1prIVo5MZ4CZRJ1OZZTPOFGGlx8OOjSjGE
	afAL/CHFNwsl+HygYcqww1JPxioqHJ67jpV+FA/eevMMYAvE7RWdjus9XOz3++iDoX8l6mAmkTr
	8SnbPcxZ7J911LKwAUI06YCcHENf2HAcqw5la0VYhzjSUnXVu92otlUSQS1mIMyFkDxrsM8T4xB
	n/LKTBMhluMoljUJ/N6xVpp1LEzOwLeaTcHKpMwp5I7gFnlUunMMkF1N4uLW4VXVFswE30Gl5j1
	R/e/+w3fw6WbysJMEWoPsrvrSBqpMyo7W1sU6pxcEmbj6kaswa0cLBAJBF+LkXjE8+dkBRFX5Qd
	nT68LOseiaS/bwhRMZwkxJmMUc2CdoT3SyNU=
X-Received: by 2002:a05:622a:4c0a:b0:51a:8c86:bd3f with SMTP id d75a77b69052e-51cbf2b2fe5mr26441321cf.60.1783776320682;
        Sat, 11 Jul 2026 06:25:20 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:51a:8c86:bd3f with SMTP id d75a77b69052e-51cbf2b2fe5mr26441061cf.60.1783776320284;
        Sat, 11 Jul 2026 06:25:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm67915265f8f.14.2026.07.11.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:25:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] soc: qcom: Kconfig improvements
Date: Sat, 11 Jul 2026 15:25:00 +0200
Message-Id: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0JmbUlbEFNX3MOwaEuBUaHSAaIh3
 N2CezeTvOT9NyuQC+gIrskKwS1I6IcI8pSA7fTQOoZ1ZJBcFjyXio3W94y8ZQ/rhwZbJowymaj
 VhUsNcfYKrsH3kbxVP6bZ3J2d9s5udEiTD5/j5yJ2709+EYyzQhl9zrnJGqdKT5SOs35Gs0/jg
 Wrbti8DWKFWyQAAAA==
X-Change-ID: 20260429-qcom-soc-kconfig-1b9b31d9702a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8TSs9Nfkta2iamspr9QqU/RBcCfAwBGsHHf2WNxtx7E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqUkQvXwITdca0se8nnUoVzfWvtUvYU2JqV28F+
 Ah+iGiqiAOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalJELwAKCRDBN2bmhouD
 12LrD/9Qeu56Tax+tHcvSdDvNkCO3jvyzqnfwDgEkBpej8cfWEplQ9pRvWkATnS1ILpvHa4gqFt
 u5MTCIyW+diVrVI61AC7p4Jt2wgMg6ASH6PmDHVYDgSVgWVvX07KkqXCejXMppy2MN2kEwJUEUZ
 3n+d2pRtjOyST53j0BvjKWp3XhlWQlRJurekbjD1UqKigAoJNRBT/rXt/RxMLy6QW8J0edXiDRr
 jhSDpnaC1wfNUHPUWgc0YNuMIGP3mrqgjaGeTxbLmnHOU4xt0eSN3dMlEgNXezsJ6bCczJUOvt8
 t5iLqXylVgOOrzs2um+dBLs/CQsk7gRfQm9o0lhd+Ls9EXaEsaUCmQQ6QBQuunyb1DuaNTUDr5p
 Mi3m+BlZMfJBJSLRSkxGoU7eTNFF5ES9ZqZgfLmLoyIz/ZSx0478kI59Cih6te1RGhkuU40sl9p
 sLGIpdl+/aWGl168La+vYg02yjfdl0IiT+Y/10l9zbD0QwuD2Ff4u64oOmGb4z2mezBRFjAzWyT
 WDL4DmsJlIE4H2IZi7v3JvFDHdURQYFKlFx9N0YWI287WjjLRnZ3hTDjMwv85/kqLHDJvlmryGw
 R2YOIyDKt+rpKbBT8yE26GwyuCeYTccqxJ/MpicHaAiADp3I/DKBd01dozX5OpNkP6VUkBJTBbI
 vNOD42zU6bxXESw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX2qL8/tVk92Am
 Y7MGh8CqehLPjn53yxcKqQva5D7kzY30tMv1WbDNcDLhC/+ADioZeh1o9wBw/iLCNb7ivDSOrgb
 VMZzm8YGcAnQy7UT3AZ9Fngg4WcEsIn+XFi9waEzWQkvi2MxFb1DGNZliT9JU+SkfFQwGmR5wYA
 2r0Mqh+wFG2al0XoyiwwvSmsm8b1ymf5/poGXV6lMLV6pnVTA+NjYAPyToPM3qtIz8ePBHA8D3Y
 0eY+0/Ep1seILMP1zHVCqX97wPa/z41vH2PGESFTttDfNOhc6UHzuD2A2ZSBKRtDwPlsoyA6LW8
 Bsd+l4LhSWcOsY0OUeYvfxhMA3ThHa4RdyNLooQCTurzJBOOJ4GpYmu9QIyhiz4nYrdzoqPfR9E
 9Qz+Ri5HZLcUbRiamUDQBAAC9yM/l9J1/rqYLyDvhBO0W+SQzKXTeKXVQTv0IrM+q/jpp+xFnmW
 Uh43uy/DsHj8Rwbm9iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfXyym0AlyC1X8K
 jJiTGb8OG/jhJ4cnO9yJP9CB6cbvC7uRmAz6emHyf3Pckwn2Nn12iBwVVa2TbH/uJnQR4wu1TvI
 NITgceA+WAXT1pbTth3AsfM1GaW9Tng=
X-Proofpoint-GUID: ny6T-XRBtgxTyFYcc1IK5_yTpYvjWi-v
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a524441 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jSXdrQWe9asa5pOIQp8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: ny6T-XRBtgxTyFYcc1IK5_yTpYvjWi-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_062522_634994_4AC5F39F 
X-CRM114-Status: GOOD (  12.38  )
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

Merging
=======
Defconfig change (last commit) depends on earlier changes, thus that
patch could wait a cycle.
Alternatively, everything through Qualcomm SoC tree, but then please
keep these on a dedicated branch in case defconfig has to be shared
with soc tree to avoid conflicts.

Changes in v2:
- Implement review - changes in individual patch changelogs
- Add tags
- New patch: soc: qcom: Avoid SCM and SPM for cpuidle drivers

Make important drivers default, so people will not have to choose
obvious things and few other re-organizations.

This matches my other work for Qualcomm drivers (clock, interconnect,
pinctrl).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      soc: qcom: Hide all drivers behind selectable menu
      soc: qcom: Restrict drivers per ARM/ARM64
      soc: qcom: Make important drivers default
      soc: qcom: Avoid SCM and SPM for cpuidle drivers
      ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults

 arch/arm/configs/multi_v7_defconfig |  11 ----
 arch/arm/configs/qcom_defconfig     |   7 ---
 arch/arm64/configs/defconfig        |  18 ------
 drivers/cpuidle/Kconfig.arm         |   4 +-
 drivers/soc/qcom/Kconfig            | 108 ++++++++++++++++++++++--------------
 5 files changed, 67 insertions(+), 81 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260429-qcom-soc-kconfig-1b9b31d9702a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


