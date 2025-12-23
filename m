Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6796E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VQSUi2Jm38REn0xTQtn1Eg7DRDwoW/Og9h2i11+VtuI=; b=kaomSSiV8FioW6egFJU0t4eCgN
	V5oO9NlvYJAiQPWY06nTdfBqIjFkPRuai4FxxsUmDIMPU9oSV765WQYQR91PdTEnw9TV+aUnPOBYD
	8Mml93+QWW/DRwgTLQwl4b/zriPbBziFjw1Cr+f7YF3kTEFUOMkiapGfYh33hNCW2NFko9fn6WUSN
	rcUda09heMbinaioYRLoa5fLbkloa6oZ5ln1KIHPuqhKR4n7xAsp0BjrcsMKEPdEgn2ZJxY1+vQHB
	y5GrthZ1q+NQSKbodeePJg0NAUVJdgLXt5ktWhUgMmkb7DqT31LEPhzY0+KJ0D9vu9wwI5TDzsNlQ
	UeQKuPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4G4-0000000Ffzp-2pDb;
	Tue, 23 Dec 2025 15:25:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4G0-0000000FfyI-15q6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCdMeS559801
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VQSUi2Jm38REn0xTQtn1Eg7DRDwoW/Og9h2
	i11+VtuI=; b=VpKAWGOdOzj9Y4SQOLv7jiOyo2QXaMXwzG0dr02Tx8snY/JURZJ
	tUZ019d8Rd9/BtA4fU4BbSNB1ufM33XplpmPxnSlB+foFevXc877VeyysgYolCqC
	PUjLyr7xpOE1AX9dkf5ryI+5TWr7ikROkbggg9kU0VXfrwmfivIkx730Varqo7uG
	Av+aE2XiqMkv5g5F7TFJ4GB5j8fOyRhcgIP34Z+IX8iZ3JqKFMREtehGzKrSZIr5
	vmKp70LNPnO21cdCfubEm+DE5jy4o9LGDq8YsVFnAO7/xoxUsJnnbNBd4v95/aXD
	z5duHio0ef0hT7dKJDo09UGHXkfCGb0iaHg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9crebf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee3dfe072dso133511891cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503503; x=1767108303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQSUi2Jm38REn0xTQtn1Eg7DRDwoW/Og9h2i11+VtuI=;
        b=kuiqsGAz8IztI51LEVmwqb95u3icbh1kXcGx06/CTp1xB1lXYgTIN5CPr4IKdMKTZI
         UTlNDuZRhe92ku6IhRlbU6duFVsGdB6C/eVhRJ8i2AWq6dfoQ3nDPu9Z+V8Ve0O0/3Jj
         Gonm97GzrxWq5kfWd06s+/AHpX+NWw543IF1rqsbwfOtf9WRsFuPPW+J9dKaTT1xi4Ty
         2Wn7zV3kjrVTqWaCefEiZQ0H/f/EM6008vPdZGh/Np0o5k2ns2LcgYFQxX5Rq4jLqOpa
         6yH0uZ6OTMcEbhO+KNIa2VA4kILjqQDw2K+J5oKs1ijfm8qUH/lzFIISI3SCLeTqmHND
         WPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503503; x=1767108303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQSUi2Jm38REn0xTQtn1Eg7DRDwoW/Og9h2i11+VtuI=;
        b=Gttkh10BjqYCHsS9JDRMse8tj527/pGFGe2dpXLbunIO4yNE13tjpAmzNHSO8b+YeR
         Xa4VKs6mUHLO2wStfmi2MLhO+1+pYD5yUms/W+tPNm5sIbgZqaOA8p9ToY8WEp8EKCVR
         FvnL6l2iBHLfS4EpdR7qEys+mdhO+AwOh6/nhujo77GfLy0Q50hgVOQSHtigteLrA7ye
         /sF7su7+IH4AcCsVvs5hVYzQIBERm/gEhYWpKM9fSpBZByuPG3fGczyEV/jLTdE2Fh0V
         1al8bbNbbwK1kK+uXdR/B+YTFLcx9D+HQqfWohowbGotVnI+DJmsiJe34dYKuzK0lBgc
         JIhg==
X-Forwarded-Encrypted: i=1; AJvYcCX0wlgNDqRb+asQwSv7qVzBFFyg6BsCFsojEhgvuZl2hi+WinrqdoHZJB20xi8uEubOcdyYX42LCB6D5TnhXieC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlp7b0oWDcHPRem8RJuGqemVUXWy1JxwlYMOawFhrz5VYjVrbr
	GDXzfrWVS1/FS0rhNXHiD8eMTZoj8vc/iJd7en7rH+jZjN7ZkLo14eh7qnx4vLFsG9FVk2fa7lG
	/0qMaJcxM04aWpMn7QnX6nUCvKo4XVYUuLwheGA/MmTu09KhOMj7KU0fFu3ZuEYQCfgOJKBNpn6
	YBaQ==
X-Gm-Gg: AY/fxX7jjCo2akRJLbdjZTBy5Tkx3IucPmxwBKhlIuKrfa+UIxloTikT44uRlWx+oRk
	v4An9CyV5FaxC/lEr9EDGfvhBbfrE9i2gEQRY5ti0+dBKVVpguqKENUgKjp7BGLsUnWf5HB9Kzm
	vXDElgdDUTZ0RWpUEbfVVvVAt2eV94+VjleImWUGgm1zyEG84Jb+ljy9/cFGLVucUzM97nh06yi
	T1GoPA34wmXdhCF0JKkba8t+pm0CSGn9DkaujRtRgkChR1GwPhRcBeKzbXfgdTsig74ejcOb01l
	dxyOws8Bs9r75VhURAP7uklmDFuUthaB55nvW53F9QyQo4or/QdtkEf/cv0Iz3atGuRDMbSfYf/
	5jrnXY+gMHBMDd8tZzhbc7HxtbkftGDBCojeCI2AR0O6I58keuqMrh3kxhfwqgp3JUQA=
X-Received: by 2002:ac8:5a8a:0:b0:4ed:b978:91db with SMTP id d75a77b69052e-4f4abdc92bcmr209398401cf.77.1766503502411;
        Tue, 23 Dec 2025 07:25:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcPT+gD5SXBdZvwjAGfOntj6UCaTZ6nE4IqmJl/QiDaN67WkF7y93HBGv6jAUXHTvTrCCOXA==
X-Received: by 2002:ac8:5a8a:0:b0:4ed:b978:91db with SMTP id d75a77b69052e-4f4abdc92bcmr209397881cf.77.1766503501865;
        Tue, 23 Dec 2025 07:25:01 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f51144sm1465699166b.69.2025.12.23.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: arm: Use hyphen in node names
Date: Tue, 23 Dec 2025 16:24:58 +0100
Message-ID: <20251223152457.155392-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=CyHasZARUIToKekzo5W8gitTyhricg3uALdaqRbAcsc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrRJsi9feer7Yl/XFUSKS9pSWGt6OOPFsHfuT
 7b1bsvOUrqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0SQAKCRDBN2bmhouD
 11+aEACItNCFLGMNtTxcwpZOojdtp+T02GGzIOKFhNJLRNDCNqj5F3KBftC970QzVyOOdlvSWgP
 lGgjXlZ9zNzwuGhKydHfKFAfWklXRNVEm2q+R5LYKI8x5mFIHOqmWwDbYN/uzCv/npYJaInfSIh
 Q7EId+Uso8T41HPVnuattK+VeTS8HZoIGpu1XFqWkMJf+7aRv0Omh5P+bqOjrS9nEYHsJg11RMt
 WcPbC1ce1iDVCJikEiKoUktb7fkYi6hjYRvZDVGLW1aBFsHWPcL4KIOLbkzscAiYauqssog4t0l
 zEgsy3+sRzRF27YQynMvi8PSjGc1s8bwpLNk/h2ajZLqrw8Q8ePddIEBNNyrBo+t88IabSE6zo2
 fnT1z3NNGhcJ1BKvk5r46jboxvAULv2SUq8A/iLIv5fFuPHJXFfemembmxei3tnxyRpibVdN4rz
 77GLohVmrTFV1ULEtVuyOl4H0/8NguyV4P8c2cSVr1UcsQ3AJIWdMrsJtfP7FMhXNm/HRrHp7GT
 cqYU3kDTgb/r9EmxTk8shGoE4nsPwoYzq9yWP9PjOQ9FARjIWA3FwRELjX6JTNIxIJgF7NKdijx
 7c8/Nl2gjVe05oZh3AoCGtNCh8d05AKQlATw8bfaoJH87cJZGjJoTCn+ZmM3Yj5OddbS1sU5eb4 cn082R3eNog6PdQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AazqlBtIpq3ZXf078ZOWMl3qVwzReSfJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX1CDMKY0N/sZa
 UMCsNJrQBiri/u5qb2kOiutmaWxvMTeNTOdd54jrrV9McLGaJEDG7Tgrg7P8fB8LsM5tTxGgOSG
 wiO0Pce35ybMfpGdD1kXoHHN+32cHEI2HCjeAlFQY5v3YZKxTZFoc+HzAURyc7+U+31wEXlUCKf
 HT6Zcz+oj9JpZbyP8ogGmh9NGYNOQONL+u4TNSxWksNEV/CnIyK0u24VhlvbI1ZkALuLD96Niw+
 d7EiwjZ+mAIv3Z+XQ+p9i4jlVl65OfIdxKoR5eIaMSpgqemxVaIClK8YdBy/ak6ih+VuwVaRiAq
 9/1bOlAzUZpRLYroG4H7FmQnV3529v/vJdVemmpBkA+ESJs5mv5p7lAL/2DyAu3abROoQSYzRoe
 lpPgMbnMStsoHq4F+yP98Me0nOlOCCrjTEM6sNyJkR4IWNeSoAGrW1pFfjBvupfEsFdhSReUjQc
 F47Iu6eQ5ZNlHffvC3g==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694ab44f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZcZdOxe6BgGqELRYw9UA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: AazqlBtIpq3ZXf078ZOWMl3qVwzReSfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072504_421103_B48A1534 
X-CRM114-Status: GOOD (  13.08  )
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

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/arm/morello-fvp.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/morello-fvp.dts b/arch/arm64/boot/dts/arm/morello-fvp.dts
index 2072c0b72325..4a3f217555f7 100644
--- a/arch/arm64/boot/dts/arm/morello-fvp.dts
+++ b/arch/arm64/boot/dts/arm/morello-fvp.dts
@@ -25,25 +25,25 @@ bp_refclock24mhz: clock-24000000 {
 		clock-output-names = "bp:clock24mhz";
 	};
 
-	block_0: virtio_block@1c170000 {
+	block_0: virtio-block@1c170000 {
 		compatible = "virtio,mmio";
 		reg = <0x0 0x1c170000 0x0 0x200>;
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	net_0: virtio_net@1c180000 {
+	net_0: virtio-net@1c180000 {
 		compatible = "virtio,mmio";
 		reg = <0x0 0x1c180000 0x0 0x200>;
 		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	rng_0: virtio_rng@1c190000 {
+	rng_0: virtio-rng@1c190000 {
 		compatible = "virtio,mmio";
 		reg = <0x0 0x1c190000 0x0 0x200>;
 		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	p9_0: virtio_p9@1c1a0000 {
+	p9_0: virtio-p9@1c1a0000 {
 		compatible = "virtio,mmio";
 		reg = <0x0 0x1c1a0000 0x0 0x200>;
 		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.51.0


