Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0F9C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Si13RHoLBWIyuPF06cIxoa9EFvca7cz+q6+0wc7xEeE=; b=p18XZiUTxdn059
	8SzbT1EzGAIyukN3RF2AAlU1T9VzZwl7vkUqBEH7zpon7oZNzxxLg1LfiWUN+K6nDEyealdHSAMie
	0JZIqY6pBq0rS9goQy4JIMYS8XgB3Ptl/hSRgVlW1TG0AB2/vzPI4J7+bg1w84P4FCUgtKmUnFtOX
	bqLylGDoDMnPKPE7GxMpxvJCYbbPHjUSgUwMOCOn1Ql1R41tKIy42tet4LkExB176+fZbmSb5CEAD
	by4CA6ZUCfdFOgrxDz2DUkuNgZQXk5Isind1lYIPgGmp7zCIiHerOxuUaTfmTrhk8SpMdbtPIxgXl
	WTG5z/JiXU+mGbrWG2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2tD-00000001QrJ-2qgj;
	Sun, 26 Jul 2026 17:43:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2tB-00000001Qqw-3a9o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 17:43:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH74ao1371419
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Si13RHoLBWIyuPF06cIxoa
	9EFvca7cz+q6+0wc7xEeE=; b=PgZxNITueHYgajwyqd4SiujmWwdvjfsfgV0jlo
	U58crE0tlB77ZvmPzZPIqxdg/JziKcwP4kDUjpGdmc6wREjlsVaADb/q9n8EbZj3
	KmQfVL0eDTsmvmpfXgaqca+blVKRBt+RqYYYMAqe94/gjWghvzvtsyOhXMA63RzR
	0B4u9AbzSbWeWdiwJo5NuVnXjHi+E5gNfMaGGFQQzIKgNDfxFtjniAsiQR5VSCdi
	SdOp3AcnDFyOWZK5RKbjtJYIK9nMPA/PxsbEd8+cTjZUnIowjwLwyT3u1w2+arxj
	m4wHHnQ7kl/353txXTctyE5kOwHGqGs0RPjrkGCpfkzN+ctA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysrn12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:43:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso25660811cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087826; x=1785692626; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Si13RHoLBWIyuPF06cIxoa9EFvca7cz+q6+0wc7xEeE=;
        b=NiiWLaNxd3E7G2Pc16ymrAM5eNtfjhn5j0l5DnlL76k48VoL9/x/Ip9RoC2/DnS8ny
         vfopbsjjGXwaBhnQkHB+8PkGNdlQiY5hmQZTWeiWQFJleTaceO/WmV7kEnVbXLk1JuMq
         n9v3CqcwOdpmh6nrMR5ZV4TY//7EWs/G+mWm2N6/+7pSINzfuDmvn/3aKI5N9uo+fy+h
         kOCIDiffzA5UGdq/pZH5D2A7wsOSbnph34HWPPnlXKT4K2IWgFt/rRIHsWZfmYOBUueg
         3vTqBCkwcRduqTh3SPm/EhnJD4x+twbvK2fxhwQ9JWVCx+bOVQ4dIbz57F5pw3dty0V0
         PU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087826; x=1785692626;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Si13RHoLBWIyuPF06cIxoa9EFvca7cz+q6+0wc7xEeE=;
        b=pYJkiKEc5jfKn/TOXsVe2s8xDhj/YuAqvi8Sd0XtuoG+VS7umfyBQ8fexKBresZ3cZ
         aJnEpsZ4bky8f6Rn5EzBdV9U/DSRV4mXB0fFQ4blh9fGVP2qeHIvNvSS2p9cVseOlaFI
         ghdPtEfPjk6DheoVVw/a1KLXltpHO/4qEO8Tc9kkRv1eFT6Xy9YFG1HZkF9GfTOnS1hz
         FI3jEsuIlTV6HJIGlL7xSOLb0ZrWLeL1XP9WFgfNo4YGVWXfK2J8jF4aGm1CnQ08hYLI
         yKcePaHzXRy7J6xTC8KB5X1DEzvLfhKZ1ZZenEU9ePGHryDtIjggfIVq2I/cA1j/Fdz5
         IWTw==
X-Gm-Message-State: AOJu0YwhYIRk3u6OfIaqcPoCGILHOCgRSftvtrvz/YUDzo6yO++WNnz1
	QEhuRbyEhbAHN3WxK/GGcEuATVxaBjrMV8teOxH2Y57qNim3nkVzPAk2xCqqb86BmLfrfzIKCcy
	VAJ6gNC+PLrfrQXf/8swGKZhujg3WnA1fuzp+Ic0w58Tmp/hz2NkhNODZZVsnAUr5YLluJ3HDmr
	GN8w==
X-Gm-Gg: AR+sD111/S9QWRuZiqUtFw8ib97d1cw05NI5a/o3h9iH34u/X5uFp+Jf4wXOO2ElkMz
	Gn6zPI4Y7v52TPNJitj+o+jcvuG1I3nUy5W35Eqe5kGPat49QFPUZLo3Nx4ctVK71rtdWDz+3UE
	2f1FXUMUIiwtnpC+dsHBeuQ1cTrBLKMOfpd0gbG0Wl3WSoPdmZUnDEMgQQEcCIsi6plfO54TjzY
	naL8ooZyIz95Aa8irLXVXBDHs3TGQF+XueV5NIH+i2mx7EXnArgmfY7EfFNXtZJP63opBqit1e/
	Cz8yxJwZAqW916F55DoiLhh9edyQ54shkZF+veLDWgvdG1hy9YHVGvov/3Fm9IdH5TNRIZqdgBD
	nksgD42ro6ZSNzJO7WuVZzZqo
X-Received: by 2002:ac8:5f47:0:b0:51c:2149:52e8 with SMTP id d75a77b69052e-529a871379dmr57979841cf.70.1785087826457;
        Sun, 26 Jul 2026 10:43:46 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:51c:2149:52e8 with SMTP id d75a77b69052e-529a871379dmr57979701cf.70.1785087826028;
        Sun, 26 Jul 2026 10:43:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:43:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/8] arm64: dts: exynos/google/fsd: Trivial white-space
 changes to adjust to DTS coding style
Date: Sun, 26 Jul 2026 19:43:33 +0200
Message-Id: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrCMBBFr1Jm7UCMpVGvIl3YZFJHJNVMWiqld
 3fUbj48eLy/gFBmEjhXC2SaWHhICvtdBf52TT0hB2WwxjbG2Qa7GkMR9EPg1KOU94N0M/uCzsQ
 6xIM7niKBBp6ZIs+/+KX9s4zdnXz5Fjcj02vU17Jp6/oBTqPmaZMAAAA=
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3194;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0heBfNfOncdb0dF9IwkvyA9GBPaKA9+Er+Dg3z10Wak=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdHPyln/j2ooJ2F7tYvn7cFNfhORymfCNuST
 Dx/SbUU7VmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHRwAKCRDBN2bmhouD
 1zSVD/4+1jmer9co03ZaY5J58u3UM2b6wO4SMgEAuZMpX282OHXbvhVsyG9lolbMXkn1KMm7ACw
 9XBjFwL6azYrxSvtjz4PYvPsRZOgbl7jbxJX403das1PvYD9D+pcDWE/cMPF3P3pYFH3aCt5Hkl
 E+ljIoaXK/PukiEq2xikrr7BKgtU58YNtSCfqyU+uLDVN8vWYoYfpzoBvrpM1P+5fBIp4CLg3ao
 LWeKwBH7hZV4YHHD+eSJw/4JaZEsqnzXP5ARWArjQ0Kcr6VPH7KqpGyzWSpzGvBn9VtpTgxHW8O
 HxRYkpa+YYeSQTZ00baN2/iW7hO1oSfAbJXfDAJy7g1fziy6nez5p63ByA9sIWNbmpkX5nndUUy
 Gs8LBYafbCY0nH8Z0dSRa9bLaBT5wz6xnSxQ1ykzy2ep4c9xzEJPVilz95ipBQjS1bkm9FhskNa
 GisDYuIOALwfUFc/sH8l7E9ccUC2GilnuWQs0D3nwqAoVnMKEMW0UEYtTpoyfhEhsXLvXzr0A92
 sUtFPsOkRUeyQC+6k3dpyH7r1SeimO56P2tBJmuWdLTbqEqsfJiKBrcIsHP7fddX+Sc2DV3iOdm
 TI53AtHFgZzUCvszVNxbg1ZIGghsxY1wzBrX4rKjYLIoQdiNOJZkFmpWixUTQBHA40+7dXxFOxN
 NoxHH3Bf+ZXeS3A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX2iAjzELnkRi3
 3hjZM11gmcUfuA1HcXdHfM/4OjwDU2zJLqXSsRZVvYdbQs9kd7/+MjIgVl6wlrGqUu0pJkveqnZ
 LvQ5WBI79fDQwYHwtmwwqbZLqHtTAlkH6bw2jTzhtgg+scgHYjsToB4x9qj7VrJtufbd/wo7nHE
 2MBIySPVK/ovRlf6pFOLRa+jx4AOmT0r2F+HXWHP6+S4c2NQooxjZie1bOpN14Er13A5JjbdDv0
 f44+4WpIW0ItrJrnibWWa7AP6LfgsahJyk47CYMHmVVPMbngnEGD+WPCwT+zMKFXk5jnpsiLlx2
 DVrVjpmmZExfFuPq3Ql9XzAhT0Rud6y6vxGec2pTOFMpX6vA8c/TVzKbc2qxOBvqHbTIuHPpSDJ
 1VrHGzNiT1bVUw+vmVvzww4gdQPdP2ZopNGtObV8tPo6W9GOyfvLlkoVI3lIj+wEgWjdsGiSjT5
 wX7ZbT6JfGscRVl6NyQ==
X-Proofpoint-GUID: EtB2Tj9uGXY24ljZHmjoFraVbwGZjz28
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a664753 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gZx7o9k1dQs2gHzPI9AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX61b3nPeKEWPk
 y3ftzlEWx1TuziwItk24sG61wjz4JibGwlKapsHuN+oLTNR7G4FdBWAw7Ks8QPRkV/TUwwY1yXM
 HPgScu26aTBm9FcXOSUi1byz1DVmYjQ=
X-Proofpoint-ORIG-GUID: EtB2Tj9uGXY24ljZHmjoFraVbwGZjz28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_104349_926922_C5DFC9C3 
X-CRM114-Status: GOOD (  13.39  )
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

Fix a few obvious dt-check-style strict warnings.  No functional impact.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      arm64: dts: exynos: Move 'status' to the end to match coding style
      arm64: dts: exynos: Align continued properties and add missing blank lines
      arm64: dts: exynos5433: Override thermal zones by phandle
      arm64: dts: exynos: Re-order clocks and align continued properties
      arm64: dts: google: Move 'status' to the end to match coding style
      arm64: dts: google: Align continued properties and add missing blank lines
      arm64: dts: fsd: Move 'status' to the end to match coding style
      arm64: dts: fsd: Align continued properties and add missing blank lines

 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   2 +
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  98 ++++
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |  29 ++
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |   8 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 167 ++++--
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     |  49 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 571 ++++++++++++---------
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
 35 files changed, 1166 insertions(+), 406 deletions(-)
---
base-commit: 392dc8766489bd451c5f20928d01cc24ff9eec0d
change-id: 20260726-b4-dts-coding-style-strict-70f4df3789fe

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


