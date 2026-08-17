Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49529C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kH7KkUchQ9GzCdEH2/N+4hFkX3C86y5nR4n9xjHjDzk=; b=wiXHWNCNW+oZjVN7YOJpAJ3jHE
	M9p5C2IMV5E5WWz6m/8Utc+EUCLQ6Y0xTzGSAhlVraKWJ1FynRCNZNPs1Yip4uGb+mFNSEEvbDs8u
	4Exh/Zp62suhtkqe7Fu1tW3EhGFFvlplg63ihEMMeR4kn8K8L8E+22lxZr5mSfm5mWtZcnUI6xD17
	5go71PdTqmyrjLgwgykg85zgCApc9/qsspi9Bc3aJDsOmK4GeotMHArx7xFyVtYBdz8s0w5rrh7Lf
	sWTDQuRlErqYrhT9MrfsfjUyY1YvgMKPsYKnDScT/NZEvAEwfK6JchFpe1D8N4Dpc8DPJf0iheRQD
	wRsMq2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvfw-000000063z0-3CbG;
	Mon, 17 Aug 2026 11:38:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvft-000000063xQ-0QEr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:38:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9ddh61931824
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 11:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kH7KkUchQ9GzCdEH2/N+4h
	FkX3C86y5nR4n9xjHjDzk=; b=Z0GpaUFSkrKJWadzK+z8wWcdgUNXEceEnn4r0+
	9a8s3v/bLtBnNx2GjZOshlJbkqNr4/8J25HFFVFWNfm4hSeVcOm7jyoEOi5fHMVo
	TddAzlBf82Q0PLN8uNoKT6i+30Y3HCxfr0fdKTA8ISI2XPpzPlQsBqfVY5Fany4g
	LW1ST6F3sj0GiNyHtYHIoCgtKmmkB9ZlP14jkFciCHDuzMxj/LDlzFFzDVZFwRBL
	xeuf3eo5GJwITn+PCarpSYBlzbrmaNq/29aaGqv6AedmYjVB22lynJRD8HY7JS+O
	qbA4X4CtgjgjZhcJBEcPpcgGruDB/4RzUTHwMgDd02kPLUvg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3txy9mq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 11:38:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9309af14fd7so269846785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786966719; x=1787571519; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kH7KkUchQ9GzCdEH2/N+4hFkX3C86y5nR4n9xjHjDzk=;
        b=D40UtNKtJIE9R40I9tAZ3wQQuSnOQYWwkfVbBOFWs22VQj+MyZkqBHSFNu7aSoSWnG
         /qYJ3pCGUKLwu3jAb0AEMIYeXy+QKaMxWxatSzFbTflFmt8qIvIqSeR0TTPLIf9Q0LSe
         Pjoet3bSZnJ+Gdd6i9VPm9o8XwcK9mkXC7GhXJzwleG8xZWm3YVhppARAYowbwhqgP+o
         gm4LB+pwpxCmtFYfDTRJwYIx6Brrja7zmAbYiD6zcQn6kpn53+e48fOK02gj/ZAxcxiL
         tGvrZWeGdRHtyIDKB1WbjH4UtLIxuqIKjEXtdlQRWsUopDPd1eeEQ0wKQB7H4XRhoa9o
         L28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966719; x=1787571519;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kH7KkUchQ9GzCdEH2/N+4hFkX3C86y5nR4n9xjHjDzk=;
        b=Upg3Y6JmRjPk/NUDiC71UUnL+O74JcjI7E5fgvD9MYEA295y9dRci3tJt26ZJjXt0D
         NSVRSNQH3/hHypxaVlC/N1xWknw1oI5OzNujV0Gb8dKMFCMMPS/3BD/rakbOdiOtUPNI
         d8Lo7Mn2pdP7Vwdsv6BhgGlhhGdsIwF5kLmgwLW3I+8elwrBE3eIYy1zW4ZUmnT+3FNV
         z+eVEIzn075uv2Qikn+6iPMHi0dIwZPdRsCaUfnPY459PE4xZy4Y7OZrexT/nbEKEj7p
         gm1ZlK3MxUJhhfkjNh5s39pFtAg6Gt0LF+9ie85JreA4aVTnTfGADhXycbRrj1jMkG/r
         juGA==
X-Forwarded-Encrypted: i=1; AHgh+RrILxgWQH4LCpsf5TU+PzAvJUoQg2eXQuhXKgeo9/3f1e9lsDDd6tAWmeaLH9hKsCh79dyHQ2XBglu4WRyCKOew@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg7Uc39NOEFm6p5Qf2uZ7XvYXW1KEx26RgmS1LTP/IEc9hZV4L
	0QyiSrFpFROZVMh76827c+0Iuks/PvShuPltyUABtTFKPG2vRT8mT/JYE4MaxTMfeMQoKYKujsM
	UWnb8t27Phqjm1848XEqbYxIeSs+a8QjrlhZtS/EjyqUMmYkYqdXMyHHEUMlKsAcEFA/u9v9y2z
	bjlQ==
X-Gm-Gg: AR+sD13rOMH6ZdoX1dzmhM3p3Zfhb2Rmvn7vTxVA6iDMtkw0M07I0uaVYAYVRfcc8l6
	7JWmpZ/gxXEVQm3lv16Dq1sTLX6aCVo0iFPDqJUYg+OEzH0/ITxIGmkd0/OrFoLRabUZrRBlkqy
	V1/zOjGj0xFDGtQvTx3Z33YezCcGFAbQ1LRyOwf+HWJRcM/xCvpgSHaqWSzP2imx8bRMu9jNH21
	KhoMrS+jDZPOtF2syWGxd7arOJAk8BnjHXyFRzPunFHqAKcfB4U6TYuxEuU5pTBe0bwoxlaexT0
	64CIT1nQZWYTR9U0ZY6rynGpQhJvhQkYRDHaTv/BkHUcF3tYVOfyP+s+diT0dS6BTVjE9D/r7Nn
	QxoWZIgNJefiMJmTS3J2WDqAz3OSUcNAagkUNWa9GnIEthuc8+QDHZc2Inw==
X-Received: by 2002:a05:620a:8812:b0:936:d2a2:5fe with SMTP id af79cd13be357-936d2a24ffemr2544634185a.6.1786966719125;
        Mon, 17 Aug 2026 04:38:39 -0700 (PDT)
X-Received: by 2002:a05:620a:8812:b0:936:d2a2:5fe with SMTP id af79cd13be357-936d2a24ffemr2544631385a.6.1786966718719;
        Mon, 17 Aug 2026 04:38:38 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf28d18sm330443e87.0.2026.08.17.04.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:38:37 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain updates for v7.3
Date: Mon, 17 Aug 2026 13:38:26 +0200
Message-ID: <20260817113836.134458-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4NyBTYWx0ZWRfXwwWPTIvwD3V5
 gPaSpzXDQxbtAf+9S4B04O8frLttM2jCrp5cOK/DM1rFrdTGT2aFXJvyUwc61/+Mi+mcELrmN7B
 huQoOafCcLdKEYPn3OvppnXwKSB5Rxk=
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a82f2c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=cA1ofZphUsUmLjTjR6EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4NyBTYWx0ZWRfXw92o4/2N44CJ
 LRU9hXc0ncA5vTOPmLQy/Eq4rzTftJ59SfL7Z76t+lcF11miyvKF5zhf253nHGD0CsNrkpskIsi
 t+cXu6vVZS93PH4L4NRICwkB5WKhQrs296OG5u/KD2rK/Y1orfeINIDT3H6OBxRDIIZCslt2lAo
 6tCurozGATbpuJt+cpIpUQYH1P0u/gCyp1WczjEldcfk3kWEI7WqeXJlkTmUS/E6WU0/NsVMLrK
 /GFtKbKis1XadNVxM5rASkp2fNU6Y3njHpvyOkvvehBBfhiTOSW0Ga1aA6oB+EXba/W3vFeApR/
 kHfAyU/kgw4bNdkHMRoEhrfxop7q5gthihLyBkMQcEUbKji8PldX1Gy9dVlWEBd4iRKM3UwrVPA
 Tg/OWkHbWYHhzdgkiEmOTnwHd4UQwgKRE/y7VowGGuZw5KR+2NlYcFq6YhP0gkBDRwSYvYvkMzC
 NVY6ez+1WAWrRysek8g==
X-Proofpoint-GUID: p3-tD-5kJdo-2OUvIi-hykk2n6sEAEv1
X-Proofpoint-ORIG-GUID: p3-tD-5kJdo-2OUvIi-hykk2n6sEAEv1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_043841_147984_E7DC2078 
X-CRM114-Status: GOOD (  17.78  )
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

Hi Linus,

Here's the pull-request with pmdomain updates for v7.3. Details about the
highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 090a95dbe13df9965279b588d97eda134831769c:

  pmdomain: mediatek: mfg: initialize prev_o in mtk_mfg_attach_dev() (2026-08-12 11:09:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3

for you to fetch changes up to 3ca7b513aec1db32b75b909395be1111c1198afb:

  pmdomain: Merge branch fixes into next (2026-08-12 11:12:00 +0200)

----------------------------------------------------------------
pmdomain providers:
 - amlogic: Add support for A9 power domains
 - bcm: Raise ASB poll timeout to 100us for bcm2835-power
 - imx: Allow building power domain drivers as a modules
 - mediatek: Add support for the MT6858 power domains
 - mediatek: Add support for the MT8196 HFRP DirectCTL power domains
 - qcom: Add support for RPMh power domains for Maili
 - qcom: Skip retention by default for rpmhpd
 - renesas: Add support for R-Car X5H Module Controller
 - rockchip: Add a regulator to the RK3568 NPU power domain
 - tegra: Add support for multi-socket platforms

----------------------------------------------------------------
AngeloGioacchino Del Regno (4):
      dt-bindings: power: mediatek: Add support for MT8196 direct HFRP
      pmdomain: mediatek: Respect PD relationships during error cleanup
      pmdomain: mediatek: Add support for Direct CTL simple power sequence
      pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains

Fenglin Wu (1):
      dt-bindings: power: qcom,rpmpd: document RPMh power domain for Maili

Geert Uytterhoeven (3):
      pmdomain: arm: Grammar s/may needed/may be needed/
      dt-bindings: power: Document Renesas R-Car X5H Module Controller
      pmdomain: renesas: Add R-Car X5H MDLC driver

Jon Hunter (1):
      pmdomain: tegra: Add support for multi-socket platforms

Krzysztof Kozlowski (1):
      pmdomain: qcom: rpmhpd: Sort table entries by index name

Maíra Canal (1):
      pmdomain: bcm: bcm2835-power: Raise ASB poll timeout to 100us

Midgy BALON (1):
      pmdomain: rockchip: Add a regulator to the RK3568 NPU power domain

Mike Tipton (1):
      pmdomain: qcom: rpmhpd: Skip retention by default

Nikolai Burov (3):
      dt-bindings: power: Add MediaTek MT6858 power domain controller
      pmdomain: mediatek: Add support for secure modem power domain control
      pmdomain: mediatek: Add support for MT6858 SoC

Pengpeng Hou (1):
      pmdomain: bcm: bcm2835: handle genpd provider registration errors

Ulf Hansson (13):
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next

Uwe Kleine-König (1):
      pmdomain: imx8m{p,}-blk-ctrl: Add MODULE_DESCRIPTION

Xianwei Zhao (2):
      dt-bindings: power: Add Amlogic A9 power domains
      pmdomain: amlogic: Add support for A9 power domains controller

Zhipeng Wang (4):
      pmdomain: imx: Make IMX8M/IMX9 BLK_CTRL tristate
      of: export of_stdout symbol
      pmdomain: imx: scu-pd: allow building as a module
      clk: imx: imx8qxp: add soft dependency on SCU power domain driver

 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |   1 +
 .../bindings/power/mediatek,power-controller.yaml  |  22 +-
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   4 +
 .../bindings/power/renesas,r8a78000-mdlc.yaml      |  61 +++
 drivers/clk/imx/clk-imx8qxp.c                      |   1 +
 drivers/of/base.c                                  |   1 +
 drivers/pmdomain/amlogic/meson-secure-pwrc.c       |  69 +++
 drivers/pmdomain/arm/Kconfig                       |   2 +-
 drivers/pmdomain/bcm/bcm2835-power.c               |   9 +-
 drivers/pmdomain/imx/Kconfig                       |  13 +-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c              |   1 +
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c             |   1 +
 drivers/pmdomain/imx/scu-pd.c                      |   8 +-
 drivers/pmdomain/mediatek/mt6858-pm-domains.h      | 466 +++++++++++++++++++++
 drivers/pmdomain/mediatek/mt8196-pm-domains.h      |  27 ++
 drivers/pmdomain/mediatek/mtk-pm-domains.c         | 195 +++++++--
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |   7 +
 drivers/pmdomain/qcom/rpmhpd.c                     |  38 +-
 drivers/pmdomain/renesas/Kconfig                   |   4 +
 drivers/pmdomain/renesas/Makefile                  |   1 +
 drivers/pmdomain/renesas/r8a78000-mdlc.c           | 325 ++++++++++++++
 drivers/pmdomain/rockchip/pm-domains.c             |  36 +-
 drivers/pmdomain/tegra/powergate-bpmp.c            |   9 +-
 drivers/soc/renesas/Kconfig                        |   1 +
 include/dt-bindings/power/amlogic,a9-pwrc.h        |  61 +++
 include/dt-bindings/power/mediatek,mt6858-power.h  |  23 +
 include/dt-bindings/power/mediatek,mt8196-power.h  |   4 +
 include/dt-bindings/power/renesas,r8a78000-mdlc.h  |  15 +
 include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
 29 files changed, 1340 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
 create mode 100644 drivers/pmdomain/mediatek/mt6858-pm-domains.h
 create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
 create mode 100644 include/dt-bindings/power/amlogic,a9-pwrc.h
 create mode 100644 include/dt-bindings/power/mediatek,mt6858-power.h
 create mode 100644 include/dt-bindings/power/renesas,r8a78000-mdlc.h

