Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DAAC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vRh6KGV70ia1LMOel+OgjjkWMd2+zpPSn4EusQLoafs=; b=jRgVbE9Qg1iSmT
	fVjHUvqjCMx9hl9AGrw6Cdyp7vAEsexslUGU6/LpeFvmJz62295s/NYDAiUPgyjw1xQTIgnAHpV3E
	jL1D1xdq0eY6+cjqMyFhr7PIRYBLBXLvWYNgDAvGCN3dOL91upXjEE7lie7No53bh8EFBoDk2aMlu
	1wAPuN8Og3DODyE2m+GFA/rpvU79NSk74CE69hYXxox27rgZ/YXhlCTHv5bFxi1YYFjCCkXK8CNjf
	fl5tOFU6QuU9MeNxruoJJj/+C/hvncx5wVeny7Se+m1R711qPl+WP8Th+7lfxA2qTfG0Yyh/bKfv5
	Ey8ozpSL5xDVrIvY1RTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumOe-000000029t0-0lo3;
	Fri, 14 Aug 2026 07:32:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumOb-000000029ri-2j6h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:32:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QWxL1172877
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vRh6KGV70ia1LMOel+Ogjj
	kWMd2+zpPSn4EusQLoafs=; b=O/Mqmya65j6II0i0WRSS6OSUFbWclONlq1xD5i
	yOZYdVlO44Ypq5kepVOf41jOFxH/HHH2WN2TgjVvdqtvgG8lImaXPcIDYMVei9nN
	P10Hj+Rz37wHnkLrALzMyGZKGH5kIRp4l0OcNrXAz5yXx9Uzb8dRc9YWDDOazbZ0
	AWNdu2PJ4oQ7k7XuF5cj41x4itlMACyYmwLGavsS/P8T7xDTcpDX12lj7GJe19Ye
	65M7CTk/+HJen09yTroTPPbpfAmGYA5ey8ZUqj0dZS7pZMZehB6RK+LlVGUYXy1m
	hgW+7GqxtNXHIyRRax036NgErvEhoZFv0fTdb6Lhp2K3oZow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1nugstn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee894b3d8so13314005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692723; x=1787297523; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vRh6KGV70ia1LMOel+OgjjkWMd2+zpPSn4EusQLoafs=;
        b=DcENhfLeOejU/xxG6MmjytpnDso9SRYWoQ6bkne2ivob8P4JA3RW5pwgVws8NDxIwd
         dfpcbP9U/u4OyZZeJxQXxzh5VdHldA+Bfb2P+soQCE6jxLW9Zqgswq5t3hDnhgsJltIh
         PGXB/LP4CLSfm403x/IqdcPT10enf8gK/dqoIcow12q/ZkD9YnrP4VSSjJQRnBj0Jr15
         Pt7Ye0lzEaZ8utnuYYbvUTP81VB0xuVz7iX77HtdCX4v9XTHj9Rmuxdq3IFA/VwNInzy
         MsiQhXZOgwdcv1A5GFmCf4N5uWZljbM8xpJI5iPfOKdmEqocqZOrRNfTom0Wpfub+59Q
         vTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692723; x=1787297523;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vRh6KGV70ia1LMOel+OgjjkWMd2+zpPSn4EusQLoafs=;
        b=QuWyv3UGMFnWTwCdNUX0ml1l5ZoQmBIUrKWxYjgEOyf0YNCudvzkkN5tPRD/zHpslD
         AzydN5cbTxzrwq7m4/CusJyLP4XDo5yfUcSBVq7i/msaBXhrcB4TNxXazN9aCYXnZ0KZ
         GlsMSIhZaOgYDE8/wP/5EMlg+EcNRkMpAubbzm2EB5Pok5Np/rfJTgma6QLcIqR/vkj1
         5SoMfxWz2zmA79CyrJSKCqpHq8h3nZTF5AncdGsK6shTAN9t37/N7IgdcwOqLLu5FtIU
         HtMAjnYnYwzYyzPirmjkkbqMwkPP6nFvipeDtYu9Nx2SK1XgBttlRN3/tIgL+Aaa1ZXt
         4vuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8UUlKNLczjdN9o0JArFUocd7b1aiv/kosJ7KioNG5cOYk4WY+QJ8lY9PUjHLH7+Q316JEUApy4gVRNcc0l7pd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf0i6EnW2gWwkRN16GTZgxHmK/o/GIoCd9ypi7N54I5UDCis18
	OLZ0BcEeVD+nHLJ/JCls9XXZpdvKJj9Q38DMjWQIwUE5KhOiTfd5OrZKp3ZhNZwjAjk489k+KxA
	FIIaK80P+L4LgGFf1f72nOeD6d7QvzlkyGnaOyRwBW7JaCBp9+EUizmOoa4lTeNkXdVTunLo9AQ
	8bIQ==
X-Gm-Gg: AR+sD13gttsd8LeMJpczpVAyko4s3EDx2oobYuG4ZOjh7uncuI6KoxsB4LOSY4He8h9
	asMILlPFSuuud6oefN1hdouOb2RtGshmAB10cqtdRobls0GIEVZUN98Y8fphNXQ0Zl++3CeIXCG
	LqyJps+Bv5NnuTkFST9ZvVoTb9Qr4sG1RIGa3I8Fg9zGzRC6kcrQielwHORG096tOL5tLB6RhfC
	EHGPEeGc+gyEeJLXowXmbCPA0NBFrPWrnSq0EStjMPn9fV3V1kFQYOcZidihc5fnpHtK85+/z2h
	4v69btd/R4oaX8yoEtBEcC9nl7/5GfoMimfhKeermsg4CcjdDfNK5Ec9YaeOzNWcoHzpxAYCSPA
	j3hWHUzxegUnHkGA0Sr3XChcnLFk+9fFQJb2OJWEzOZf0pfuOMhUluN90JfoO/DwuRWnKDLHvDF
	a4cjZsOaN64yDJdiDrhE4Ayc0=
X-Received: by 2002:a17:903:1b23:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d3b08727e4mr47012505ad.6.1786692723250;
        Fri, 14 Aug 2026 00:32:03 -0700 (PDT)
X-Received: by 2002:a17:903:1b23:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d3b08727e4mr47011435ad.6.1786692722691;
        Fri, 14 Aug 2026 00:32:02 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:02 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [PATCH v2 00/15] Add initial support for Qualcomm Kuno SoC
Date: Fri, 14 Aug 2026 13:01:31 +0530
Message-Id: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTEfmoC/32NwQ6CMBBEf4Xs2ZLSKKIn/8NwKO0iVelilxIN4
 d8tePcyyUtm3szAGBwynLMZAk6OHfkEapeB6bS/oXA2MSipSlnJk3hET4LJCI7DQGEUhdVNpUq
 LsmkhzYaArXtvymv9Y47NHc24etZG53ik8Nk+p2Lt/dFPhZDigBIt7rU0R3Uh5vwV9dNQ3+cpo
 F6W5QtM1QZVyQAAAA==
X-Change-ID: 20260809-kuno-soc-support-1dab826de0bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=5037;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=rtXTm0sNcVUQHP6jphCaU+mu+w6xi+uhAxczIqaG98E=;
 b=fUkvttIUx9VCeWiaW8i5QCky33IAmVohtGKSDZr78CLMXqmKNpCHYfU1KEQLV8FLetJGjWP5J
 3ll8FB9xdhtAdIfmrCb/Iua1Pv0CIwTO5xFkvvbomvSJc4M5okPPa4Y
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX8V/okBtRJXsB
 CwORqD2zHJCl5Oi9cQsvAatTJ86K7Aze/JCiVb/aNW/MxOBKcCRSYgPVYM4w/0uyqMP/pNWlvry
 YQ/cVOJtehcmRTlXRlIr8dxznV1c1hOYYLsqnVkY7Gqy3HCl6Drk/Rev8aAuL4A2wEHmYNOvp4z
 A/OQLBSPUAtiISn7N4qvToOIHg+zWQlkpJ6p65bJhiynmcz0WZaA8cOUxLszoSiiLBh5VUitM6x
 Ev0TzMQflXuv14z2QaFL4HCYZNDStGUGgbHUJvfaX/ar05hUJRYyMfU/awv0huWLf5KnOpnehZc
 l8R8Z7rCci5IpgZsUFny37NXDm/qvBLLf/K1W+ZcrHR+GtRtZ6jjadua50uQUQUfhrGs1G6CdeS
 tvjGCfvGEZ6Oc3uLuIv1M2VG21Chvz2ZuYEJDTyuqcod7CySx7B8P0qU7jHeC5IMuyJp16VdETz
 LDgGVK2GwDOms+pNUDA==
X-Authority-Analysis: v=2.4 cv=drfrzVg4 c=1 sm=1 tr=0 ts=6a7ec473 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kp1mlcltsySZhJOGRSoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: xOzAhWmjy7zrUjNt1pJdHYkVgxPLyfF9
X-Proofpoint-GUID: xOzAhWmjy7zrUjNt1pJdHYkVgxPLyfF9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX3WBlJCVb70W1
 yCBSnCP0I0dT2u4cE36Kq9WHrkilDCQ4nEeV5PfkeNJviEE2VJ8OmYjHnUt/RaERv1VLu2jbnct
 VIGzyM+W75fDTATW3EcUdbiT+AzJ+/8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003206_002934_863043A6 
X-CRM114-Status: GOOD (  20.54  )
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

This series adds initial support for the Qualcomm Kuno SoC and the Kuno
IDP reference board.

Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
the essential SoC infrastructure required to boot to a serial console:

  - Global Clock Controller (GCC) and RPMh clock controller
  - RPMh power domains
  - Interconnect (NoC) provider
  - TLMM pin controller
  - PDC interrupt controller and SCM firmware interface
  - Devicetree for the SoC and the Kuno IDP board

The soc: qcom: geni-se patch allows the GENI serial engine driver to be
selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
depends on.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
Changes in v2:
- Addressed v1 review feedback:
  - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
  - Reworded dt-bindings commit messages to the "Document X for the
    Qualcomm Kuno SoC" one-liner form.
  - Canonicalized copyright headers on interconnect binding / driver /
    NoC ID header to the single-line Qualcomm Technologies form.
  - Dropped unused <linux/mod_devicetable.h> from the interconnect
    driver.
  - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
    driver.
  - Extended interconnect binding to optionally allow up to four QoS AHB
    clocks (matches sdx75/glymur shape).
  - Cleaned up brace/space style in gcc-kuno.c to match peer clock
    drivers.
  - Reworked initial DTS: moved idle-states / domain-idle-states inside
    cpus{}, wrapped fixed clocks in a clocks{} container with peer node
    names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
    stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
    idiom; the YAML example uses a named placeholder), dropped the
    RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
    no corner votes / no pm_runtime, so the reference was inert), and
    added a bootloader hand-off comment on the memory node.
  - Collected Acked-by / Reviewed-by tags from v1.
- Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/

---
Hardeep Sharma (15):
      soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs
      dt-bindings: power: rpmpd: Document Kuno RPMh power domains
      pmdomain: qcom: rpmhpd: Add power domains for Kuno
      dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
      clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
      dt-bindings: interconnect: Add Qualcomm Kuno NoC
      interconnect: qcom: Add Kuno interconnect provider driver
      dt-bindings: pinctrl: qcom: Add Kuno TLMM
      pinctrl: qcom: Add Kuno pinctrl driver
      dt-bindings: clock: qcom: Add Kuno Global Clock Controller
      clk: qcom: Add Global Clock Controller driver for Kuno
      dt-bindings: interrupt-controller: qcom,pdc: Add Kuno compatible string
      dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
      dt-bindings: arm: qcom: Document Kuno IDP board
      ARM: dts: qcom: Add initial device tree for Kuno SoC

 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   50 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      |   82 ++
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  109 ++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 arch/arm/boot/dts/qcom/Makefile                    |    1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |   25 +
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              |  419 ++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   15 +
 drivers/clk/qcom/gcc-kuno.c                        | 1438 ++++++++++++++++++++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kuno.c                   |  977 +++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  796 +++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                     |   16 +
 drivers/soc/qcom/Kconfig                           |    1 -
 include/dt-bindings/clock/qcom,kuno-gcc.h          |   95 ++
 include/dt-bindings/interconnect/qcom,kuno.h       |   89 ++
 26 files changed, 4161 insertions(+), 3 deletions(-)
---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>


