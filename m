Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6144FC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fxqtwBV1yl8Oo30paZH3peKPiKzsEGqLBKYrL80s9vc=; b=JdGq+6L7B3lIkP
	ga19ehAdVZXcWaV/lrlalKe9hUgqBmkbvMjUbxvMzw4KKLbe0FZjtMajiKxKRJcXYVY6cIbR4q9/P
	YVFXHpdFVzPBGDMLfqZ7WhmySTP5KV9v4keGOYq7+S3VW8BPSElhR0PJYCsZDg2e2qPWUKobHrOSC
	U0zy8aeb9I8bTJW1z77rQ92mWjRo6hUC7bASU2cJteHymNBA5SZATJmMh0ZrX9RU+8E8F3TZ41aIB
	jOGT7wVWAkEqFrDe/lyOFlIvCxMH5vDCf/7OdRMX9DBeSZh4euwOW9ldwE5nvO2zQ//puIQdsITzj
	1p5wqsxMh2dOVONXfjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBHr-0000000ElxL-0ZZ5;
	Sat, 01 Aug 2026 15:06:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBHo-0000000Elwy-0T2N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:06:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CaOpc2394028
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 15:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fxqtwBV1yl8Oo30paZH3pe
	KPiKzsEGqLBKYrL80s9vc=; b=S82YpathuThkYFuVhUj4YndQmYRF6kAlPZEw6y
	Qs0c2zxOKMUMKq3QoUfBw/2BPVoqgnj/kGEBXiYHJ71ZyVcYw2qbPqyHleKxnPp1
	2u325ZB8Wk8K2rAltBXC4rg9b2wI69qQR261ArHw98j8c/i83dm/lQeLwhu5UnoN
	juIuNrO/V1Z3ogRjfYaUVhs5u+0kRy1FJ22mMVDR+QAMssg52WmArynxB1JgopN+
	i4eeDm+xLHgWWhTrALbL9IRYYK5vilgN2B2HIAm9LOAvykwoZo0JO3korvcjTt7H
	BVn83Oci05kYtALMYtQxz+6MkybQ2KyynVLHAHfHhtrxw0HQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yggxku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 15:06:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so39257671cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596760; x=1786201560; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxqtwBV1yl8Oo30paZH3peKPiKzsEGqLBKYrL80s9vc=;
        b=P68o71fqh56eXLFoiWSkgk//Y9XiUUy4JBDuFupAPnCY9MSuCMW3qYvU2XcH7M9NAt
         KCdC8rxDCht8uAUWL2zhFw5YQ6+KcmC29+KdZNCY2JmavkGTh5LzZEL4hWMjdsdGwH66
         pL0XJC4pfnRsRkyOjCUsAqNx+fZHUm24O+ywO+0s5bitPZelzxsRtJxgMw7J63nSkkZP
         hA+rDZZMUzIztntT3JGyDCPXKFy9hYvPzxMwbrkbDhVtnnBDhWv+vhNhGYmu0x48MM5i
         1Z6M827vKy8ND0+jMu34dWyZt300PSpAVxCUiwyOwZYaRS3HUsijJM8TMUZRwf7Z95+a
         M4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596760; x=1786201560;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fxqtwBV1yl8Oo30paZH3peKPiKzsEGqLBKYrL80s9vc=;
        b=Tieu5vdONmzEOF/52Uzeq4r2and+kV/OYHoAHI70KLyCoQJM2sLShuGc6QV+LPnVDk
         bY0XS94JLRRze31CxXqkw3kDPxGdA5SynHMTBNOgAhJlIn9vmWu1Y03quOYYgZUaQTsB
         jCT1GDTyUwMAnuJLylJ9djSMrLFCjtl8nFGsBoF3fZqpIIIlNO7GPsF38yhfCGvlmtTm
         35bsYILO+TjD7BbXUEH8e0ylTocLkXwGysmj6lQkm/XCudlE0SxLeGo2N3UsJrzSCSYU
         LRpcehN6Uh/PevRtOk+f++1T4/BzOEHj5pW1SJ6XwXo7gx8Tb6NCZMx8KmSGy3XrusPx
         31+g==
X-Gm-Message-State: AOJu0YyjiR0VjHrRUZp+WQMaPG/wAm5KbASBouN8/1MC2Y6d3xYBSaFl
	d9o5qpmBc3aFw+8C0hteHknRhXM85GeY60m2sQOolkoWTf4V0sGuLU+6MZ/aHc8DrbvIiLDqJn2
	wqnJ2cJNPu9NMd1f8GiLuwM1zJy7kk7+FSuowizkcgSgxKzwcQFe0yLAUxT7JKzEYsPDiuYOOvQ
	8H9A==
X-Gm-Gg: AR+sD12FQ1N7+cH4XNW3E7Im1vKwsOqbF3SZmsyvNowZnTnZMj3gSYwC7kr/UVPyefF
	LwC4+xUT/4X8YSbgh9/cNWsos0x+k85HZ1A90S0mVSgQGuGMJ1qx9cNVMW22yrobGMXm7UaONP0
	HG9mT38FQ0X2F/85tFkbtzCC1aDg+Ba95MyMBR1fbPD8DWezFOmmLL3K5pqRmuDshxF+mkZJMgd
	kGFTXLdOBZcXJNHPdpeaQFBoZylz9BgL0rZBjCSQbvMJcUOt/GZndfq6o1RQmJH6yfzg9LRHlIx
	THH/nfBYToZmim5hY83d7gFKqealOtPzpkczwZ8PqQD6/4YfCF1biK/Sm2v2CuycsTpt8oMWH7n
	SvX+DnWwiqaTYfCaseRz99xiU
X-Received: by 2002:a05:622a:1350:b0:517:96f0:5658 with SMTP id d75a77b69052e-52b566aa84bmr69865331cf.14.1785596760353;
        Sat, 01 Aug 2026 08:06:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1350:b0:517:96f0:5658 with SMTP id d75a77b69052e-52b566aa84bmr69864741cf.14.1785596759972;
        Sat, 01 Aug 2026 08:05:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b85be7sm79293395e9.2.2026.08.01.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:05:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/9] arm64: dts: exynos/google/fsd: Trivial white-space
 changes to adjust to DTS coding style
Date: Sat, 01 Aug 2026 17:05:42 +0200
Message-Id: <20260801-b4-dts-coding-style-strict-v2-0-c0b4c68b2ba0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr2K6tqQUpODKexgW0E6hBqh0CpEQ7
 m5BE7dufvImP+/PShCcASTX00oczAaNHQLw84nIthoaoEYFJpzxjAme0TqlyiOVVpmhoeiXDkI
 6Iz0VTKdKJyIvNJAgeDrQ5nXI7+WHcaofIP1u/DYcjFNY9b9aa9BbtxwvzfF+/Wt9jimjUEACR
 S4KxS43ixiNU9VJ2/dRCFJu2/YGWhHJQvIAAAA=
X-Change-ID: 20260726-b4-dts-coding-style-strict-70f4df3789fe
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3383;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3vp2hLKTmc09zaIHpCig4bUhEfQiMWD47tjAhsEdWyU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbgtJlWfEjoO2CLrZldVzCgLdfG7CgAqjZHVMX
 GdQDs/H6JyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LSQAKCRDBN2bmhouD
 1+fSD/sH8Wl4wRRGrpeoxeC65IdstMKa/hp1c+W0C9K3mzWf6z/wWiDQszD9UoTsBNR2kmWdoTg
 IVZY1dZllJ6CZH2/qX5ecO1UfxhR4uWMEB9HNXiWXo7dAs1vcqTy9s/OdtFDK+4R2l0ZGE/sgQm
 KedNNWtAg2qz2VpLeNmDDLZSFjCWpt9GRJbKOEHB1yLE6e/zuOKx8OGy7HCjtkpj75GnsAs+cta
 d2IkmCI+KG/fm7aTpeDzomCixn7OWYLRY0+yCcaF8buGjlizR3XuYzPoYGNF3UBB+n/3u7vCCjB
 wgEEhnMx0aQUhhEzxdztFC1fZj+IYfgVxtu+OfsxPT5m758+ultp+EfvbJw5Ef+HTU/goZ7VN8X
 Yus5Q8kkgDiooovHc7qT9kEgZlGAug7IE6UZy8rgWexAP/1zRWIAOGFQ83o06KfzfP7ga7qmjuu
 DVerCHEY1ikwbQdRMgxPdgm3z0Q8Qpx6XW6OYi5mtiD8u5gxqj6Gv2hURgHnymcIUHRuCSm1Tof
 HMQTyIh197fQM35/f+GrGHcM+LnS3MK/z6IpjH8QxrZC7PAlYNXhuMAdcwisjGKBHmuMb5o/+1j
 ETT2WpZ+QIpoE/VCTCKXkeBJeLStei71PCrx1xf/HuBmPeosEouFV7uaoZHbXB1/T3eg6o6uSNW
 Jrb8ZlG7tO8zKvA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMSBTYWx0ZWRfXxMpSHWFwr4Ek
 f1MbMEVicGgHE/IojQPRcp/T+wNpzrR0k/4+fIgvO6ZEON6ihq+xoDlcIQwoZXEySWi7+xi01lR
 qisYR8NLG43WYnohGNgaKZs1rCtDhGg=
X-Proofpoint-GUID: gsLLbPl_QV_3i1jKdaWPfVIn73wdcG3a
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e0b59 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DwXAirjAvZakPEmmhRcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: gsLLbPl_QV_3i1jKdaWPfVIn73wdcG3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMSBTYWx0ZWRfX0ylzthBrE2wd
 GHbIUR8U0lZFRod2zj6F5Oep7x/dtbIhroDsaLJkFD7MpBGh2KaSt9p17ZIcRLjJj/heVh99EKg
 /tQsMmIMBTjWQRpchMdTiUCVMqHYTpoLCY020kPDl4/Od2gSx1T2rHCrmUGMq4MKTjiay8Orslk
 L5AFtPzIQY1ESwfmLohzWQGm00a4rzho+4xCjRiJtKU8MXZi9t9YzkYIPayCqvuRP3YNV9tLWby
 5QZRo+J0ZlkuG0/KhkzqvxSYF6gSRwPlNJznNWcQi46ChOELAKUWA/5PHIqQhxPa3NYQDWAtwOY
 1s0VsPw11zaksh56aXMBHL0R0nXyMzDO3lqb8I8KGPrEJ4PCFpb9oskTIMPFGION3WG2SG/Ma4n
 O23pjuJIq8tdBt8Pf2W+NqS5bCkybB3/VWB+jvF1CXFzStp2gUc2NTpW7RskjLz63zkmA9fNYjB
 j9pviq7QRGt9vVPcNMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_080604_168772_E6B34647 
X-CRM114-Status: GOOD (  13.89  )
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

Changes in v2:
- Fix stray blank line
- Collect tags

Fix a few obvious dt-check-style strict warnings.  No functional impact.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (9):
      arm64: dts: exynos: Move 'status' to the end to match coding style
      arm64: dts: exynos: Align continued properties and add missing blank lines
      arm64: dts: exynos5433: Override thermal zones by phandle
      arm64: dts: exynos: Re-order clocks and align continued properties
      arm64: dts: google: Move 'status' to the end to match coding style
      arm64: dts: google: Align continued properties and add missing blank lines
      arm64: dts: fsd: Move 'status' to the end to match coding style
      arm64: dts: fsd: Align continued properties and add missing blank lines
      MAINTAINERS: Drop redundant lists from various Samsung entries

 MAINTAINERS                                        |  21 -
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   2 +
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  98 ++++
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |  29 ++
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |   8 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 167 ++++--
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     |  49 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 570 ++++++++++++---------
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  13 +-
 .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |   7 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  58 ++-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   4 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |   9 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |   3 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |  21 +-
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |  13 +-
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |   1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  47 +-
 arch/arm64/boot/dts/exynos/exynos8855.dtsi         |   5 +
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |   1 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |  56 +-
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         |   9 +-
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       |   3 +-
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       |   3 +-
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |   3 +-
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   5 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   9 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  86 +++-
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |   2 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  64 +++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |   2 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  12 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  81 ++-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   8 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 | 121 +++--
 36 files changed, 1165 insertions(+), 427 deletions(-)
---
base-commit: 392dc8766489bd451c5f20928d01cc24ff9eec0d
change-id: 20260726-b4-dts-coding-style-strict-70f4df3789fe

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


