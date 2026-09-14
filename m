Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083A8C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WitaMeezpBH1+dWiRPc0ZrIoLT1qoUbaF0kcA/pSPBY=; b=Z1lBNEmrvyBDuo5IUtkPWGcm17
	VxWGL+0cynl4sl3yLFKYtaZVWU7asxxgaDXpiCV/aO5v1kenu+zW2geMTjXoMNKneElZZqHsK48nL
	GkCOKmJmrU4yx71rHbthUUnCdf3WAFSEOBn/F6C8uazhv6Ms+yupEMS488vpwp6JB3aWjZc6zv+OL
	c3p/BgXFVm0mE0HZeH/DKDqpPOOagqFNI1SVozcjOq4Bf96B3I04XkrVAt9BfImXgWz1emEskBe36
	jPDnhRJa3Lqqu0U7sA0VNiJfn//VbvhtqccBoua0ZB81lFP5eLV1uoqyOkkicspInWgdK7qRyKoC6
	ms6Jayjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60QQ-00000002T0P-2ssL;
	Mon, 14 Sep 2026 06:44:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60QM-00000002Sz2-2Xe3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:44:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iv3T3739599
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WitaMeezpBH1+dWiRPc0ZrIoLT1qoUbaF0kcA/pSPBY=; b=RTlbJAtmeuWa0XdV
	d084RSUjFGBMQSZg1aD01jCWQ4u8eHSG8W3D5/Mgoul6OR6qF0OSj4cFyFodhhDO
	/APeMBIwaEU5HY9/f1cwKFNOGR5zeB8ILAZFdRny1YwgC5W6LUn4CeE41W0JbeHk
	ooBoI5zkKglhrhGw7FiZpHg7kYEtxqHpwn1UvPD34nDm/nlR/xXsysz4CHhMTNVX
	7I4wt1EayYD0elOkYmRrRw8JLEnmcrJ54nmDtFxa6cBtXzcaEkyRQUYe1Acui+R2
	XY03OIW91nvLILfPTSi2pj6BBWgdUKjrulcQ6kZaoDPjgVkzGlTUkXjWWa+sVVuT
	fWZjAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddc11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:44:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93903622880so803801385a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789368257; x=1789973057; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WitaMeezpBH1+dWiRPc0ZrIoLT1qoUbaF0kcA/pSPBY=;
        b=HqSEp20fdiRKWIJzmpf/ZyJZFBIaAksnaPPVJ1QTQtQ5AsFqshSTXZXywpywpbRyAY
         kGsPtBKXErtAd0KOXH58bUrSgQlacrbBZaA1y841vDxR14QaZ8AZDlg6PG2v0JFLdwQR
         nkFSaCStZ2l4tNEGGQfujeNNlVM15ikL2pnMXFwsDEcZ3Qw4d5rrNIyxFPj7itnWVyRL
         BsxV+LVvwUyvB+qcJ9rI4RfTxtQlhfivyhvqPNWt7Mo0tT7b10fpiwupDzaxEQxvl2t5
         2vA2pceQOcSHxeJxzB8pQaxZSPkAjUYjmrU+7CxxywYUDBvrt17SCLLcGOW5ChDZFqNY
         tK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368257; x=1789973057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WitaMeezpBH1+dWiRPc0ZrIoLT1qoUbaF0kcA/pSPBY=;
        b=fHZdnc/bOz42T9TA7V5Oj2aQt16ilhLlLdMtSMSAOviraI76Ar7qxjhzODkkJ5cngb
         gZkWCJgfcpDeIJJ/RyhOAGLS9FVf4FPN8HteXBkqMlwgPaPwY54q+hdnPM2G4T1zAKa2
         Hw4FVUnYD1eEhefUuNZ+27Seh6Wsl6I+y3bBEoMozrS1dWRDAlcX5DrrYMSy7ZAlLOJq
         cNN3Hb7mcxmbRLbnEJLdG91hSGeYFOkOWB/dR9yOAneskO22cW/E5KKOtEppdsH7/UXH
         wgvvgVfbPwx9g3BCcTEqEwxmrbDPhvftqB730PbkyF5sOkLZ156SHZLg+xbFSprm7L3/
         wD6g==
X-Forwarded-Encrypted: i=1; AKwUvBwzKiohqXaxQnU5JubCQzPo21j+kKpnAyXlPRusFbpUN2XIobgRAeDNeTnZigzQmDRHlD4aOtpgcgw4gl9Pzhzw@lists.infradead.org
X-Gm-Message-State: AFuF++n038SgZ4vDdUX0RILU0Lz4+pWrDt9H+CIwTgzkBOmHaoAOQUez
	Qf4p6GOQeJXo5WUFwRrQbEYwqs69wzR3E15RqtJs7eSyLgqH3X+LiFfkNbcoMtEKWMVPFb/vC5e
	oN7PcaCVeCsJydM4r+xkeZuTnOajliA8oodOHRoaGc+mZ+81tJoBFRJQbKghEfTPhgbR30ITAne
	BBoJiAGvw5jQ==
X-Gm-Gg: AYBFou3Reb3b6kI08w7+1TLpoFFHow2a3GXRhNrQSI8pz3MJ8nVTEDeOCXh8rAqyhPH
	7bzhDEvp8UDSqtbpG76z80/G8UX6uEzndsRNe2esAEu7o/ufi4SOOGtgC9OPu4f4Y6JrDzugxsa
	Gb8TkFpT6qSkBfJdy6HnXWTuB17+Rq3pdgUOIbSS5Na4r2luQTKACmglk+b3ieJ/yrRMUNvVxO7
	yK4LImtAjojLVTxXXLhrrTvMNzrJBOxV56B94Qae0qtDZdGTehMfmsB6WQuPGK6VVECMb2A6N3i
	jAfvh2GFPuADV4Ag4tbeffReBLmdYVK3p1jWWbOLEkDhehva9nF47+Twv5vnWCC8fNksjBvRHCV
	CPckhuCsxa0iFl4QHfjZgPjQ=
X-Received: by 2002:a05:620a:4492:b0:939:72cb:bae5 with SMTP id af79cd13be357-93a1870d2f8mr497125685a.28.1789368256749;
        Sun, 13 Sep 2026 23:44:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4492:b0:939:72cb:bae5 with SMTP id af79cd13be357-93a1870d2f8mr497123985a.28.1789368256212;
        Sun, 13 Sep 2026 23:44:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm23736954f8f.35.2026.09.13.23.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:44:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 08:44:04 +0200
Subject: [PATCH v4 1/2] interconnect: qcom: Make important drivers default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-interconnect-qcom-clean-arm64-v4-1-5b2c0e6a929a@oss.qualcomm.com>
References: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
In-Reply-To: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14008;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ljTerAYY+aVCk3KCGV9fckYvKupvzyRx5lbCBFMOytI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqp5e7k/j3nw397nSk996rnyp72nFn1AZocJqwE
 UbxaKHazoGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqeXuwAKCRDBN2bmhouD
 15RpD/41g8/8E6cdfGexJFjbiUXLpSrIw8q6lKBHrG89q7JKVk8kJ4cIVy1/due6ifScSYeY1wl
 0iqbqRfQ1Lsukl+ZSx19gVZ2ss3GVrcZnLk8sdzTtnKE0vzDa+sx6wwnPkOuetYx3Fmt+c5gEbi
 /ir7RCL75lDR80Gflcv8EvpScCUOHuVWCIXYRKC5JYaSazVSJAaayQfIWzjQ6UALxrtdcR6+3/F
 9NmQ/Mm1uaVy2cHyyOZSiGOP9F4Ie54L4uJFCVtn/vGNCPx/I8IO9JC9bo7wWtJuzCz7Dj8F3N4
 n+Ui11hCBCwOo3sCqegqNylM2L9loebmWGwqrKfagd+q8OLZHUWU+71GOKsFgBTZKw9hqCiOxIB
 zQNuYbXykJ0VcV2+1yNrZSTpgFWH8eLSAz5nU6jEpz1evKBwVDfmhaHg0yC0q1CxFp1aI2RgaBI
 W2PoGEvWxwAgk3/IKTHXICaLY4KRUtWJ2Z9xAFMJ/7w9CRbDbNLh04GoUo50W+4OT5WjH1MedT0
 rD8PgWR9uSq0iAqPOZPqdJpHaNHUo1YhV0OjONI1rCa4rI+nRShNvHKYD8SZIFxZUsT2GvPfHaG
 E3QfW3Vc5Xe23rcz9ndehJrhnN+y9TDi0eGJvNe7URPR7faU4mPByhWgblbWCtW/8LDHu5lTf1e
 DhzznLYc+Uovw/w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX0l7aVDo5VwOi
 zRUWinDuRXHneVpXPh1hM/k3ZFgWClIcLwsiOgW9BW6VYyHW4/jXcNEc/MO+k8TUuY+IIdBKpCf
 SRuM5mh8XqPLDpYL6Wi/XPi+m0x6XXpXj8rntgr6aBd87of0gRNE9exlaviEPMRf1LmX6LRrKMP
 woul643iujdiocjBze4sM/AvsNBkwnkKYuZSilz3CFc+GxB8gsddq1ExHYLVqETG2yhyUPZNb1q
 FTobUym82FXfY3NsUivpiz53iXyVf+Q83yaUhqQT5CwIpzE/2lU9romwXrGd/JmCcZ3bJquRteC
 jiHBPj0ZNzeY85Sr7LEijIWn8bB9jdaCMkzzookSG3imaxKUOZUoAQ1Aj0dNNjFTYLeHcanyyyj
 KXSv/KhYDsZtveB+nQ47wOBfc66P7o78Vf3VSKrc2gme39GFBaRglPByqSlHim7iezNgiybeHxc
 rFSkJr8qHX4mWhOPSMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX7RV4qCrC43Pc
 A8umMiO+LNE1cbzG1khgr1c7wmsaKWPHbM9x2Y60Ksmpx0QKdX5GoYTaX7RI8v6UnTTGc8tI/vU
 nyxTCMnU4Bg+K6GwpGKGPpzqGE52Vjo=
X-Proofpoint-GUID: 9JOT78Nhsa9pulIrj-oUZ0Qkb7mei0ST
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa797c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SgRPkAPvXIXIjLLMwDcA:9 a=taea6FrRQeRdjhdT:21
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9JOT78Nhsa9pulIrj-oUZ0Qkb7mei0ST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_234419_633294_BAF5CC38 
X-CRM114-Status: GOOD (  20.70  )
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

The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
basic or fundamental SoC feature: bandwidth management between internal
SoC blocks.  SoC can boot without these, but power management or
performance will be affected.  These drivers do not represent any sort
of buses visible to the board designers/configurators, thus they should
be always enabled, regardless how SoC is used in the final board.

Kernel configuration should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Switch all almost Qualcomm interconnect drivers to a default 'yes' for
ARCH_QCOM.  This has impact:

1. arm64 defconfig:
   a. Enable as built-in INTERCONNECT_QCOM_HAWI, INTERCONNECT_QCOM_NORD,
      INTERCONNECT_QCOM_SHIKRA, INTERCONNECT_QCOM_SDM660,
      INTERCONNECT_QCOM_SDM670, INTERCONNECT_QCOM_SM7150 and
      INTERCONNECT_QCOM_SAR2130P, which were not selected before but
      should be, because these platforms need them anyway for proper
      functioning.

   b. Switch to built-in from a module INTERCONNECT_QCOM_QCS404 and
      INTERCONNECT_QCOM_MSM8916, which as modules would not make the
      platform bootable in most cases, and INTERCONNECT_QCOM_OSM_L3,
      which when module might slow down boot considerably by having
      caches running at slow speed.

2. arm qcom_defconfig: Switch to built-in from a module
   INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_SMD_RPM,
   INTERCONNECT_QCOM_BCM_VOTER, INTERCONNECT_QCOM_MSM8974,
   INTERCONNECT_QCOM_SDX55, which as modules would not make the
   platform bootable in most cases.

3. arm multi_v7 defconfig: Enable drivers necessary to boot
   ARM 32-bit platforms, which are already enabled on qcom_defconfig:

   a. Enable as built-in INTERCONNECT_QCOM_MSM8974.
   b. Enable as modules (other dependencies prevent from built-in)
      INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_BCM_VOTER and
      INTERCONNECT_QCOM_SDX55.

4. COMPILE_TEST builds: Enable by default all drivers for arm or arm64
   builds, whenever ARCH_QCOM is selected.  This has impact on build
   time and feels logical, because if one selects ARCH_QCOM then
   probably by default wants to build test it entirely.  Kernels with
   COMPILE_TEST are not supposed to be used for booting.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index b3187acf90b8..d6c37704be03 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -2,6 +2,7 @@
 config INTERCONNECT_QCOM
 	tristate "Qualcomm Network-on-Chip interconnect drivers"
 	depends on ARCH_QCOM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for Qualcomm's Network-on-Chip interconnect hardware.
 
@@ -14,6 +15,7 @@ config INTERCONNECT_QCOM_ELIZA
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Eliza-based
 	  platforms.
@@ -24,6 +26,7 @@ config INTERCONNECT_QCOM_GLYMUR
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on glymur-based
 	  platforms.
@@ -33,6 +36,7 @@ config INTERCONNECT_QCOM_HAWI
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on hawi-based
 	  platforms.
@@ -43,6 +47,7 @@ config INTERCONNECT_QCOM_KAANAPALI
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on kaanapali-based
 	  platforms.
@@ -72,6 +77,7 @@ config INTERCONNECT_QCOM_MSM8916
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM if ARM64
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8916-based
 	  platforms.
@@ -100,6 +106,7 @@ config INTERCONNECT_QCOM_MSM8953
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8953-based
 	  platforms.
@@ -110,6 +117,7 @@ config INTERCONNECT_QCOM_MSM8974
 	depends on QCOM_SMD_RPM
 	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	 This is a driver for the Qualcomm Network-on-Chip on msm8974-based
 	 platforms.
@@ -130,6 +138,7 @@ config INTERCONNECT_QCOM_MSM8996
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8996-based
 	  platforms.
@@ -139,6 +148,7 @@ config INTERCONNECT_QCOM_NORD
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Nord-based
 	  platforms. The topology consists of several NoCs controlled by
@@ -149,6 +159,7 @@ config INTERCONNECT_QCOM_OSM_L3
 	tristate "Qualcomm OSM L3 interconnect driver"
 	depends on INTERCONNECT_QCOM || COMPILE_TEST
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Say y here to support the Operating State Manager (OSM) interconnect
 	  driver which controls the scaling of L3 caches on Qualcomm SoCs.
@@ -159,6 +170,7 @@ config INTERCONNECT_QCOM_QCM2290
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcm2290-based
 	  platforms.
@@ -169,6 +181,7 @@ config INTERCONNECT_QCOM_QCS404
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs404-based
 	  platforms.
@@ -179,6 +192,7 @@ config INTERCONNECT_QCOM_QCS615
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs615-based
 	  platforms.
@@ -189,6 +203,7 @@ config INTERCONNECT_QCOM_QCS8300
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Technologies, Inc. Network-on-Chip
 	  on QCS8300-based platforms. The interconnect provider collects and
@@ -201,6 +216,7 @@ config INTERCONNECT_QCOM_QDU1000
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on QDU1000-based
 	  and QRU1000-based platforms.
@@ -225,6 +241,7 @@ config INTERCONNECT_QCOM_SA8775P
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sa8775p-based
 	  platforms.
@@ -235,6 +252,7 @@ config INTERCONNECT_QCOM_SAR2130P
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SAR2130P-based
 	  platforms.
@@ -245,6 +263,7 @@ config INTERCONNECT_QCOM_SC7180
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc7180-based
 	  platforms.
@@ -255,6 +274,7 @@ config INTERCONNECT_QCOM_SC7280
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc7280-based
 	  platforms.
@@ -265,6 +285,7 @@ config INTERCONNECT_QCOM_SC8180X
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc8180x-based
 	  platforms.
@@ -275,6 +296,7 @@ config INTERCONNECT_QCOM_SC8280XP
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SC8280XP-based
 	  platforms.
@@ -285,6 +307,7 @@ config INTERCONNECT_QCOM_SDM660
 	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm660-based
 	  platforms.
@@ -295,6 +318,7 @@ config INTERCONNECT_QCOM_SDM670
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm670-based
 	  platforms.
@@ -305,6 +329,7 @@ config INTERCONNECT_QCOM_SDM845
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm845-based
 	  platforms.
@@ -315,6 +340,7 @@ config INTERCONNECT_QCOM_SDX55
 	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdx55-based
 	  platforms.
@@ -335,6 +361,7 @@ config INTERCONNECT_QCOM_SDX75
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdx75-based
 	  platforms.
@@ -344,6 +371,7 @@ config INTERCONNECT_QCOM_SHIKRA
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on shikra-based
 	  platforms.
@@ -354,6 +382,7 @@ config INTERCONNECT_QCOM_SM6115
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6115-based
 	  platforms.
@@ -364,6 +393,7 @@ config INTERCONNECT_QCOM_SM6350
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6350-based
 	  platforms.
@@ -374,6 +404,7 @@ config INTERCONNECT_QCOM_SM7150
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm7150-based
 	  platforms.
@@ -384,6 +415,7 @@ config INTERCONNECT_QCOM_MILOS
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Milos-based
 	  platforms.
@@ -394,6 +426,7 @@ config INTERCONNECT_QCOM_SM8150
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm8150-based
 	  platforms.
@@ -404,6 +437,7 @@ config INTERCONNECT_QCOM_SM8250
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm8250-based
 	  platforms.
@@ -414,6 +448,7 @@ config INTERCONNECT_QCOM_SM8350
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8350-based
 	  platforms.
@@ -424,6 +459,7 @@ config INTERCONNECT_QCOM_SM8450
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8450-based
 	  platforms.
@@ -434,6 +470,7 @@ config INTERCONNECT_QCOM_SM8550
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8550-based
 	  platforms.
@@ -444,6 +481,7 @@ config INTERCONNECT_QCOM_SM8650
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8650-based
 	  platforms.
@@ -454,6 +492,7 @@ config INTERCONNECT_QCOM_SM8750
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8750-based
 	  platforms.
@@ -464,6 +503,7 @@ config INTERCONNECT_QCOM_X1E80100
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on X1E80100-based
 	  platforms.

-- 
2.53.0


