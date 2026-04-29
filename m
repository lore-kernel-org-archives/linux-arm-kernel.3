Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6137ECD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwCc8g7Rev9ZjQPcPKllajuzBCuOGfIckkLerN0kfJc=; b=0d+CmoZcMmgISKYjkvLFJ2h+m1
	wd73o7uf4PuLGGIsQ0AAxpnIkcBHg0GibVbxnHzW3WhGiPNyDlxyYh/pSGb6ZsljqNXIqlXTE5d0h
	gaZ74hMT67ZU+fCixI8Iigq85gGES/XVzPksFd819vAW6iaTtYnBAAcKwadwr0s21WTml1MtXmC8r
	R01MGf0Wm9eYIELuYREKikK2s9vmVjKjxxIMoX6jBpY88xUSXk4ndiHSjfs8gNNu0dFOpCi261YvO
	6d3HfYTkW5Nw+e51ibAqMt0eo/HpTrW86ALr+OoOtQlkJRmIIYUv7k7+3kQosDGxkfsRTyP/n/WA/
	3YqgMaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9zo-000000045nE-3CI6;
	Wed, 29 Apr 2026 18:50:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9zg-000000045jw-3009
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 18:50:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFFhQ3901592
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwCc8g7Rev9ZjQPcPKllajuzBCuOGfIckkLerN0kfJc=; b=dKAA2D8vcWcwlALA
	Mj/UhTkYUh9m2Kx8HFPFUJ9c9PVj0SQVbmlEVhOkUSSCS3OX507gQoFhSBTELDMH
	lQPeNxhyzYj/xxLK19PxiCtyo8BJYpI0/ljNjgMxlxYpYp4wt7hHMctFZCfcCsLE
	99t48JCjqgOIWqzEdQLDzrC3md39vURUuvdo1GvV/XoRwoHS59TiW7WiB2Luc0fq
	4Ix+9vydrM2fp3ZloRfE0nwyfiPdyK2MdWHltWQd6V5Lvj/LhM+S0rBrJvTP8Lqu
	WIovxW12s1LJ+pOwuwDF36zaykaErtSqxm7fg92czwPFYtXMc6MJLO9sIKD+udbV
	hOw54Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9k74h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:50:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3c7b989so1118821cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777488643; x=1778093443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwCc8g7Rev9ZjQPcPKllajuzBCuOGfIckkLerN0kfJc=;
        b=TcmYdWq4UJdfReFGAXxtQM4bMWp+e0WCZFS/p6MvgN7yXhiLVtXZuxIyDg4amXNWfW
         9xyKyCARA1bCGSna2L+BLHyQSg08Syki0+e7TasiHOYSeboKLHjnBXmvggoNNoPUIEPB
         uAYYgdA55PxMR1e2AByH8bH9YoPAgAK8jvG2eF9uWl8BGHzVc6g14Iekz8PWgx4W3nV1
         Kqj0RCBAcXiE3xYAqZnU8OdjMs18uVPCDptaeVZznXt66ovmQpiihuw44uyclT9KPDBw
         M2vWO5m86q5Zr7MCoJuQpgzVqt1urXrhJ5ZF7ThLOQcMPltXIR/a0RzNTGakZwsiJAZG
         HABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488643; x=1778093443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FwCc8g7Rev9ZjQPcPKllajuzBCuOGfIckkLerN0kfJc=;
        b=Oc4j+QpIVDxMLuwV1alriDtFdDtSmtDPCLAVfp10cw/roSIlNlvbxyAPCzq6BBNnk7
         dfERcZA+tKDMPmT15I9MdTN+uUdGPQ9ju+Bzhn8v9Cbq3F5Kk12W9641Ipee9ra+mh6p
         PMuR0bPH+z2foaDyxWsYNACBIHIjdSZUUk8YEwakyvPceRzHCNlLhTS2FNcj/kSNlRTD
         63/jI/qPa1nIBZihH/k3Pgr6rxiDNtlOvTKwgvJgYCwYbDbDjiHRDcOUzOSTXuvAUwK/
         YRGIJgZoh8SFR2qZxufcYqqwrwdwRA32p6Zc9TtxrGBdms6n9y0cw6ddIEqFPoXDpuLH
         MJPA==
X-Forwarded-Encrypted: i=1; AFNElJ9SgoyB6K8eB8y1zhrl02N7JpA31ATbrh6HZFDieMV2rFLTmKocpkrVACzPYgwYFPcd4cDygcq/iP4rtKGnl19g@lists.infradead.org
X-Gm-Message-State: AOJu0YyviZ0WMdYoQyoXTLMbt2wO8w64PLkUjkhL6V/hxdUq/TqPMFH7
	LNXV5TyYZb9RQ/TROIkxHgzYR4jcYQgG5qXECh5XA9qQeqfyDgIUIbh+Eag1RP7dWzAMUGG+fTm
	YstOjhi0btpkhwxH60kSX3MED6sQAULBDrrbiS6mnzX4XWki5YuwQ9P+nluUwnogPVSwEAXcxPU
	C0Mw==
X-Gm-Gg: AeBDiesO2A/hO7d+set+PqItnCsUwb4oIe4cSsVLSQsCjYMzonYDXAFw6FsQXAbuICs
	19Y57LCkUneSvO8eB4AaJVJcCkdLFVHPQgOVi/TTaL1IeQ+oXe3Nwiwa/lmHZdnzY1rB3bMdAfM
	gEYMv7hJSVRkw2TIy/kGvZyCBHPkVI4mMS9D8nNtqRSI30hCCZgV2zU0/HNEKOytPys/OjQMOQx
	Cggle7vBJE7JTn8J8rFpMxPV+0Q+i+fg8wxLC0JUvEVWD+SWphFspAA3g+VnMnBusv/s6gpWiV8
	9MVkstYrxF69wdRp3wJ3SHRq+8ha/sndxzAmZXr1SEb0UI8CQ89+H3Hqubs13QIrDjdAYTcjhJ2
	n+hzeXZAWKSRuqvCRQ5Fq4hUDrYzmTFSGuqw0XWpOdhDYsgd/bn+Auzc=
X-Received: by 2002:a05:622a:5c8c:b0:50d:819f:e7bd with SMTP id d75a77b69052e-5100e101d64mr123608961cf.4.1777488643278;
        Wed, 29 Apr 2026 11:50:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8c:b0:50d:819f:e7bd with SMTP id d75a77b69052e-5100e101d64mr123608531cf.4.1777488642783;
        Wed, 29 Apr 2026 11:50:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm10525115e9.11.2026.04.29.11.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:50:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:50:26 +0200
Subject: [PATCH v2 5/5] arm64: defconfig: Switch Ethernet drivers to
 modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5969;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NJks1vkDkfEmwQezyTOQvG4CbAf8E+uRI1mOQW7+lE0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8lL2gh106Xq3K/+8QkjuXEU8MKngkgpmhndxM
 i+f+zPIdBmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafJS9gAKCRDBN2bmhouD
 1yrYD/9Tx0OP4MDw239AKtaoPwcSBLIQGJnAqVUjRAQaNZbaUmm5DQwnGCsCloTDwfmmNwn5NEe
 DDPwWkVqx/0RAHFHQ3SQARd5av9huqIbazMUYjoHui7HDi6QNbz5sGOFyvXngitVLGQapQng/bv
 0SB7zoNp93plDSQdom1OsF1jF5P5jclEH335PuoBDsLjQJgmPZLAgAb75GIEDOCOV74rFQcnlHf
 F9Klgx7A24pGXYn+xhC2xbHyfsiiFDlG7hk1K8zQRVhBjrfViext9KLnoztXVO6NvE/bsbA/94r
 0DcLSlEfAPQOLYVqxIJYFcgSHAIhIwJGBQTXVO7tCKqPfjaqEO64nSn6X+V91eQ8ZDabEaRQDVP
 3zbtPWmJoO6dnQt11y7iJ69i+th8dFw0AM2wcjrgjGEhRNpYzZJF27pWq/Qz+sC2dckr9J3Xbw1
 dxlTAloUVnZaXPpke8vCIWMjaNlM3OYRpo1JTOJMXViRZr8IBshC7ii+BAzZnuJSDKEsBBss7i8
 A7kJhZKcjSwiWZqIMMwCjTqw8F7cHMywWTzvq1cN2lNfNwsnov7CCZTgun2a3jotZiLCy2f7C+m
 8G1zmQ0Ipov2yVdwxjRvPuOoUjBz8vDVlpA+BwFtuHOBf8ecQTH0QYh244k5lVTyiA92QbzuMa9
 /ziFdSZmDIp8lBg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ajIQPG3xGsXfy1jrSGZjG2Ofjiq3aNa7
X-Proofpoint-ORIG-GUID: ajIQPG3xGsXfy1jrSGZjG2Ofjiq3aNa7
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f25304 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uZThdQlqimpIaNIbivEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4NyBTYWx0ZWRfX6xoG83I4fEwS
 KDTNzMH3m9YoYCPMB8+rXZyrfhWy8cOUPCNpLA4wYv/htPw4Lhq5UR9rD8AyULRSvLFijk2pm9x
 /B0HLheB4jzVKWwecCgFbSPiIHc1pqMBOm/Cvzlh3qckSHPm+9rjM4Y7gqdiOeSss28wnzRV8r8
 imgB3eijRthUmBgYXjacxjurwigWzIiR1VvdfZxMc9xs0kBoBYSPI/trhVE1txyfYr77QBWOjWY
 Atj1/7KZ/K/B35iFkeHhFvjyRvdtpLcGpsfc7IRy1eYMhRibjuPUTzlCe16GrvQToa0hJS9OtJn
 wM4wfvlth5q+N9nwWFrpoJ/G5geulbAP0IvH2G2QOcPRbGgE2c/L8AeHMLzkfw3VMfFtcR/6noG
 KhlWWJKX983zjDfTZ1LZ/7CeUzTfkQXsE0aHTOOH9vVeZOz82o8/P019SjTgfQvTyypPUU4EPxJ
 CyuIQwE7yfe5CMCqVSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_115046_205764_B4323C1C 
X-CRM114-Status: GOOD (  17.62  )
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

Development of Linux kernel progressed over last 10 years and it is easy
to generate now initramfs for building own kernel, e.g. with Yocto or
mkosi.  Therefore for a few years of reviews on mailing lists, all new
options enabled in arm64 defconfig were with assumption of having
initramfs which can load bare minimum of modules to mount filesystem
from network or disk.  Basically network driver as built-in is not
anymore essential to boot the system, so switch almost all Ethernet
drivers to modules to save on kernel image size.

Similarly 9P network filesystem for QEMU, especially that testing kernel
unuder QEMU does not have any size or build process constraints and can
use initramfs with -initrd argument.  Note that having network drivers
does not break NFS root, because whatever loading method, e.g. TFTP,
which brought the kernel image can bring also the initramfs with network
adapters (and I have been using such method for years for my Samsung
boards).

Notable exceptions / diff explanations:

1. Mark I2C as built-in, used by CONFIG_IGB as a module.

2. CONFIG_BCM4908_ENET and CONFIG_BCMASP appear in the diff, because
   they were default=y (via ARCH_BCMBCA or ARCH_BCM_IPROC).

3. CONFIG_HNS3_HCLGE and CONFIG_HNS3_ENET are removed, because they are
   default=m.

Moving code to modules has positive impact on kernel image size, thus
boot time of all users not using above drivers and ability to flash
fixed-size boot partitions.

Old Image size: 41.2 MiB (Image.gz: 14.8 MiB)
New Image size: 39.1 MiB (Image.gz: 13.8 MiB)

bloat-o-meter of vmlinux:
add/remove: 3/6972 grow/shrink: 6/45 up/down: 66659/-2333659 (-2267000)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 72 +++++++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 79f6294fffdf..f373549a7c12 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -199,8 +199,8 @@ CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
 CONFIG_RFKILL=m
 CONFIG_RFKILL_GPIO=m
-CONFIG_NET_9P=y
-CONFIG_NET_9P_VIRTIO=y
+CONFIG_NET_9P=m
+CONFIG_NET_9P_VIRTIO=m
 CONFIG_NFC=m
 CONFIG_NFC_NCI=m
 CONFIG_NFC_NXP_NCI=m
@@ -356,17 +356,20 @@ CONFIG_NET_DSA_MSCC_FELIX=m
 # CONFIG_NET_VENDOR_ALACRITECH is not set
 # CONFIG_NET_VENDOR_ALLWINNER is not set
 CONFIG_ENA_ETHERNET=m
-CONFIG_AMD_XGBE=y
+CONFIG_AMD_XGBE=m
 CONFIG_NET_XGENE=y
 # CONFIG_NET_VENDOR_AQUANTIA is not set
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_ASIX is not set
 CONFIG_ATL1C=m
+CONFIG_BCM4908_ENET=m
 CONFIG_BCMGENET=m
 CONFIG_BNX2X=m
+CONFIG_BGMAC_PLATFORM=m
 CONFIG_SYSTEMPORT=m
-CONFIG_MACB=y
-CONFIG_THUNDER_NIC_PF=y
+CONFIG_BCMASP=m
+CONFIG_MACB=m
+CONFIG_THUNDER_NIC_PF=m
 # CONFIG_NET_VENDOR_CHELSIO is not set
 # CONFIG_NET_VENDOR_CISCO is not set
 # CONFIG_NET_VENDOR_CORTINA is not set
@@ -376,33 +379,31 @@ CONFIG_THUNDER_NIC_PF=y
 # CONFIG_NET_VENDOR_EMULEX is not set
 # CONFIG_NET_VENDOR_ENGLEDER is not set
 # CONFIG_NET_VENDOR_EZCHIP is not set
-CONFIG_FEC=y
-CONFIG_FSL_FMAN=y
-CONFIG_FSL_DPAA_ETH=y
-CONFIG_FSL_DPAA2_ETH=y
-CONFIG_FSL_ENETC=y
+CONFIG_FEC=m
+CONFIG_FSL_FMAN=m
+CONFIG_FSL_DPAA_ETH=m
+CONFIG_FSL_DPAA2_ETH=m
+CONFIG_FSL_ENETC=m
 CONFIG_NXP_ENETC4=m
-CONFIG_FSL_ENETC_VF=y
+CONFIG_FSL_ENETC_VF=m
 CONFIG_FSL_ENETC_QOS=y
 CONFIG_NXP_NETC_BLK_CTRL=m
 # CONFIG_NET_VENDOR_FUNGIBLE is not set
 # CONFIG_NET_VENDOR_GOOGLE is not set
-CONFIG_HIX5HD2_GMAC=y
-CONFIG_HNS_DSAF=y
-CONFIG_HNS_ENET=y
-CONFIG_HNS3=y
-CONFIG_HNS3_HCLGE=y
-CONFIG_HNS3_ENET=y
+CONFIG_HIX5HD2_GMAC=m
+CONFIG_HNS_DSAF=m
+CONFIG_HNS_ENET=m
+CONFIG_HNS3=m
 # CONFIG_NET_VENDOR_HUAWEI is not set
-CONFIG_E1000=y
-CONFIG_E1000E=y
-CONFIG_IGB=y
-CONFIG_IGBVF=y
+CONFIG_E1000=m
+CONFIG_E1000E=m
+CONFIG_IGB=m
+CONFIG_IGBVF=m
 # CONFIG_NET_VENDOR_ADI is not set
 # CONFIG_NET_VENDOR_LITEX is not set
-CONFIG_MVNETA=y
-CONFIG_MVPP2=y
-CONFIG_SKY2=y
+CONFIG_MVNETA=m
+CONFIG_MVPP2=m
+CONFIG_SKY2=m
 CONFIG_NET_VENDOR_MEDIATEK=y
 CONFIG_NET_MEDIATEK_STAR_EMAC=m
 CONFIG_MLX4_EN=m
@@ -426,27 +427,27 @@ CONFIG_QCOM_EMAC=m
 CONFIG_RMNET=m
 # CONFIG_NET_VENDOR_RDC is not set
 CONFIG_R8169=m
-CONFIG_SH_ETH=y
-CONFIG_RAVB=y
-CONFIG_RENESAS_ETHER_SWITCH=y
-CONFIG_RTSN=y
+CONFIG_SH_ETH=m
+CONFIG_RAVB=m
+CONFIG_RENESAS_ETHER_SWITCH=m
+CONFIG_RTSN=m
 # CONFIG_NET_VENDOR_ROCKER is not set
 # CONFIG_NET_VENDOR_SAMSUNG is not set
 # CONFIG_NET_VENDOR_SEEQ is not set
 # CONFIG_NET_VENDOR_SILAN is not set
 # CONFIG_NET_VENDOR_SIS is not set
 # CONFIG_NET_VENDOR_SOLARFLARE is not set
-CONFIG_SMC91X=y
-CONFIG_SMSC911X=y
-CONFIG_SNI_AVE=y
-CONFIG_SNI_NETSEC=y
+CONFIG_SMC91X=m
+CONFIG_SMSC911X=m
+CONFIG_SNI_AVE=m
+CONFIG_SNI_NETSEC=m
 CONFIG_STMMAC_ETH=m
 CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
 # CONFIG_NET_VENDOR_SUN is not set
 # CONFIG_NET_VENDOR_SYNOPSYS is not set
 # CONFIG_NET_VENDOR_TEHUTI is not set
-CONFIG_TI_K3_AM65_CPSW_NUSS=y
+CONFIG_TI_K3_AM65_CPSW_NUSS=m
 CONFIG_TI_ICSSG_PRUETH=m
 # CONFIG_NET_VENDOR_VERTEXCOM is not set
 # CONFIG_NET_VENDOR_VIA is not set
@@ -479,7 +480,7 @@ CONFIG_CAN_M_CAN_PLATFORM=m
 CONFIG_CAN_RCAR=m
 CONFIG_CAN_RCAR_CANFD=m
 CONFIG_CAN_MCP251XFD=m
-CONFIG_MDIO_GPIO=y
+CONFIG_MDIO_GPIO=m
 CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_USB_PEGASUS=m
@@ -601,6 +602,7 @@ CONFIG_TCG_TIS_SPI=m
 CONFIG_TCG_TIS_SPI_CR50=y
 CONFIG_TCG_TIS_I2C_CR50=m
 CONFIG_TCG_TIS_I2C_INFINEON=y
+CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA954x=y
@@ -1955,7 +1957,7 @@ CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
-CONFIG_9P_FS=y
+CONFIG_9P_FS=m
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y

-- 
2.51.0


