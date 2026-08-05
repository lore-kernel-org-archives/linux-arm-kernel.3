Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502A4C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NP32AYQSHmO+6xgXTmdEjrL55vQh0b/6Xjmlx1f++L8=; b=o4KvS3mUWGoGRI
	QHiowf4oW7odJjSWGB9JRsfYOG55fSSJw5Q5qtxJywQgxmufzw8PymxGL22VbFfVfTMo1PC8GN+6Z
	mBoDxGCF95CRPfdt7/RKDt6nfzk8yFcxpSz05KZ3bjr8gQiU3IJ/cvsVc/yaVFQ+KvkhNxffdJgXM
	HTRKBeDVjnH0f/kk0/YOycxCqL6gYvOhQFJNPNYAArVl0EOXai2F6Q+bbm8qb4kug1rPXYZ5YSTNO
	hNyaYamfVkAJyl6PySuV0SU2AkdazB8FB3deEyNi56jX/ND47UhAqkkfq4hbaFpAd0ImH03lBZy8R
	05Ud4LvQNbqOkhbOhHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3O-000000041Sv-3TsV;
	Wed, 05 Aug 2026 13:53:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3L-000000041SZ-1aMb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:53:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Bvuqt3124698
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 13:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NP32AYQSHmO+6xgXTmdEjr
	L55vQh0b/6Xjmlx1f++L8=; b=Phra8zm6tPbCBk5x/bOy2O6PLAvMmpNWxLwGfc
	P5SzA0kxRpyE88EfHq6gI19N7SGuXpeEOzeGZCUFNYLFaFpB3iSLzzpYsReOrNdn
	Se+756U6I15PewihFHw7fGlzz4TpSrg2yL4w1ENmMAmEh5S+Y7SbkUz4OLkCGZjW
	sgDJOTvdYbGeWbk0nlyy6zG384HSDwA/lArY/AyH7Tmg6UuFYy/+ijYv0XTcpWEQ
	vEpQn+BUSNMNG643V+CwCKL1nBZWSqrWnKckcVOm8MfaFNxDpVssihylRXsBM6uF
	61bsW2XGN/5b0wgc/u+GJyR4f5VWAtHsbnUnv3VnmdjPGeFA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14w9hm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 13:53:00 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-82014436716so28128307b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937980; x=1786542780; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NP32AYQSHmO+6xgXTmdEjrL55vQh0b/6Xjmlx1f++L8=;
        b=Zd4cqsGEi+H51E5TuZ1tYxvTDDaiu4aqWZQhD9N1kg3unLwEFkuXlIXwy2hglGCnRF
         nPURWWvWSiV9lUO5pSKaP1rz+Hm51ffeXkeQV86aIJG81+lHWgEeRBRwPYaKLGXa66hZ
         QkFJjsSfdL4moZ1bicFIXXePz5e1YY49Tj0/zKg2LD6BuAMFCqcjYuq46yvZBjuN81UM
         Xfo2AMvB1FGN2CH7HI73FaBXH7xmEQx00F5tnUDHBS5LOxRTdswzuU7WKp1QoA9cQB9L
         gO31vFj9NPJlwZ3gd7/6xyzk8w5s7G3wmqvEboyWclKacFTG/oo/QvitPXHVa74q+Jc6
         r19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937980; x=1786542780;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NP32AYQSHmO+6xgXTmdEjrL55vQh0b/6Xjmlx1f++L8=;
        b=A0I9DI2F/30QdxA2XDAO01eYpgqGcEEj4eFo44WEo17l6C0XDjgfk9P28OKm8BUJ41
         KSZm5m+n+0T6GTm629QTTxRc+4yjCsSScqjwfjeC8SEfxb/Zl90OamLeA2q5cZHhnbKW
         T7bAboAGd/25bP+rK/hme80CiZt8VcUh2PKvPTCjAHHWhy+D40yBCFonO9j68QXiWD1k
         SayuzFgGf+GYuH96zFofSIs56gm/mWMTmhRm0HNt37s5nsIDdr0g2cRSJsCOnhmPCv37
         QUMTY8kzeJE07EFn/+5ezNfwDTaSxpz4uDGBeN3t19NplTBTakwYds8y8OYZCerV6mNz
         LQmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1lpgU7dXWtmPUYtpcaxIHapCRUCZtkKzLq1Z85VkJOdURMGWsKjqhhjIPmU6fbhPKcNlFT7sKNLCzellzGGvf@lists.infradead.org
X-Gm-Message-State: AOJu0YzKBAaF4+9Hn2uekx/nZKWANa+bfqw8B6+rZfWpktcJlr3zBLZw
	c6/q+JUUWDCWQjCodR6T++r9JRNM4kqiE+7uW1BiVSum83oLJgeDHi/csgihXB37lDaRGR0NwD8
	N/3kevPPYmMd7c2v5hN+/Vnu/m+Yl+KUKMCC6SS7INinSeJn103ez53jKj68m30Q1u71ojVA2WO
	qANw==
X-Gm-Gg: AR+sD13YVrCnEI1q2nc5Y87CO3J54GhvTwLjSX+9yrNuLC6cDb9HzutX7U+qwnN+pUS
	ZSOOTkjZHyGIp+ZTyKn7/LlDfde2oBu3rLV1eyNCTtxAbwfuEzwVnAnAD6Y8o3xbBG5Bb4StrMw
	yAJSu36ICILKbPjqBuq3unS9RLaeG8Qbk0AWvIi12wXzYdd13apFj0DgaLI66jM9jRWU3cBfHMa
	sF9fZdzSekbxTdmFotBmf2jFsseHh2L8W9zYbSoi+iPREl+dI43gZzdHnyd2yr2EqdaZWTz+Cut
	UUsuNoUv7sPq6jbx+ignb8OTlS+ZHQS4j7yTSOQyIJlTydVnc/zEVm8OyjYv46/wfrGjwe5AVym
	nG6FLkXyYBBAIhB3PI/vBBOy/HFWp+qw=
X-Received: by 2002:a05:690c:e0ca:b0:821:e0a:6cd9 with SMTP id 00721157ae682-8210e0a7c2bmr4624917b3.17.1785937980170;
        Wed, 05 Aug 2026 06:53:00 -0700 (PDT)
X-Received: by 2002:a05:690c:e0ca:b0:821:e0a:6cd9 with SMTP id 00721157ae682-8210e0a7c2bmr4624587b3.17.1785937979597;
        Wed, 05 Aug 2026 06:52:59 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:52:59 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH RESEND v6 0/5] Add CAMSS and IMX577 sensor support for
 Shikra EVK
Date: Wed, 05 Aug 2026 19:22:45 +0530
Message-Id: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1Ac2oC/43Ou07DMBQG4FepPOMqx5djt1MHujLAiBh8JVZJQ
 +M0gKq+O25AaocEsVg6tv/v/CeSQ5dCJuvFiXRhSDm1+zLg3YK42uxfA02+zIRVDCvJkOY67Tp
 DnWlyppdE+KAuYkQ0TiJaUpLvXYjpc1SfyeP2aftwT15+7rtwOJYl/e+jNTlQ1zZN6tcLG4JC7
 mXkAsb/dcp9232N5QYYA3/2GIBWFIX0zGmnpFGbQ5+Wh6N5u6xYlmNkB3alsNLTFCuUM7DiaCM
 wWG3anCcofkOBnKZ4oTRoLjREoX01Q4l/UKJQ1lkJlQbFpZ2h5JVSwKcpWShvJbcBpHcizlB4Q
 7EZCgulnMC4stYKP9XqfD5/A2yXy0VsAgAA
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=4965;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=IU2FxDbVpzPCuR4skclReRjkiNxGfVidNVcC+7xKNfg=;
 b=O7Q39imTU4H44WaXf6L/z63Ee0Hsn4QYm/xw3GR+mn8uCnTi43LT99N6YTCtGR2X5yHGt57E0
 VeF/kQTQvL8D8kG0EqQIIvLcc3f6TToqQBUHpp9YpIDv2X3tGpHZtMp
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfXwUOYxrXarvqU
 U9rr5oby4WiEtWMjN5QP9fg11lAqx3VhFG946aBXM1b+mIsPSa0Gi4MVFcFonBk9UuTBBjStrt5
 /yDC7UmLYZ6Xlc2fIRSivDHHMU/hJX4=
X-Proofpoint-ORIG-GUID: hQ0CdjYpMWQVfwMMfECqiRdtDdjr9HjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX+in/sp1IU8hg
 MESY5O4g9dvfq8z9xrqrelX8WuiaKP0WosMhxG16CDFEIy/4ST7LmCNzuQzUz1FienwIR5VqhYj
 bxh9sdfm17YGxe7rj2dYUjYnTqK+0MKBcmsXyHZc3kHgb9C4nMvG4SB5IxvGdvqDE/v8R9tKMPR
 +fEresTw4I00Ufv57Pngb8zTbF3vNb5rlObHUV82fPae8dGRCJpGpwoHrxyBsjJ0dtHhjgbneNq
 MOvkBtbvkRcLvWYSxa/BU4UMCV7msBEy/8XwOMYJkk29yTvEL7Zo1RgVSK+mnWHhC1CbcCw+Kw3
 MMWZgs0e4e6iFl8g4PNu/ZIku6nDbs6y3EX2dntD4FmKyr00nOduer/B1bCLyw7En9X0IUGox4J
 0YY/4hoUbJVigFB7HBON4m3PBP7y0hCNZu0bR6vAw1xJHuX4aoXJ+FEESn7oTcJNno1nZ1ZppNm
 VGzUw7gdoG8biA9LoNQ==
X-Proofpoint-GUID: hQ0CdjYpMWQVfwMMfECqiRdtDdjr9HjY
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a73403c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_065303_541415_6DCC7019 
X-CRM114-Status: GOOD (  15.30  )
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

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes since last v6:
- No changes in patches
- Drop dt-bindings: media: qcom: Add Shikra CAMSS compatible; already
  picked by Bryan into media tree (now in linux-next as 32179a552b8e)
- Rebase on top of linux-next (20260804)
- Link to v6: https://lore.kernel.org/r/20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com

Changes in v6:
- Rebase on top of linux-next (20260721)
- Sort CAMSS by unit-address numerically - sashiko
- Collected Reviewed-by tag (Loic)
- Link to v5: https://lore.kernel.org/r/20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com

Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (5):
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 ++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 ++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 198 +++++++++++++++++++++
 4 files changed, 364 insertions(+)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


