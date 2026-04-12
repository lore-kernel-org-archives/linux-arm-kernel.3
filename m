Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0E9E937EC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 16:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NitPcSx6Ja/m84eHfJTpLIKNXIwXFgYazEdJ+UVoxSQ=; b=D+F1MRQrBpKl01eyF4cvXY1RM7
	JfYsPi3I+43nvkcaytGQ5ySmzt8+onvzRBs1f+YCt2bWvWZRhTTtW/u7sjy6liXAy6jrr52QJkhDg
	2dxxvInWKHHaTtD9V4d/cdr1yObLbYheGIUwVQ1Rd/mzbhSShPU1m3aJbgy8U0L+EfEjncMIVnaCy
	CbE3W+ikAXW5cqw8WG2UgJB1IAxjWUmp5FKUHU+8mxx4+GA9oTW5B5YarRoxIKWF0En0xfT7FMe1r
	XAgY/ZrtBEyjkFOIz0FavcowafeOu1A+HipAaTG3qyG9ov702CZxPouKXTmfOhD86HpMeBHxY7Vje
	pvc6dOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxZ8-0000000ETmH-1BSO;
	Sun, 12 Apr 2026 16:21:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxZ4-0000000ETit-2JcW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 16:21:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE53ba1121311
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NitPcSx6Ja/m84eHfJTpLIKNXIwXFgYazEdJ+UVoxSQ=; b=H4KU+daeGzXZZh1O
	GWGmu4z2nIKMwUCQPnADCgoz/rI1ByrhQz4IqqHnoLHNLwSm+ZI7oKTGJ8OLZ8r5
	FhvzHovjc3MfF677n7a1uUM/sNspu/J6gxhCy9dQSN2YvyVQY0X3XJYVELSyYDVQ
	OD4KmpjwfG2S9DZ8yl16XChg7KkHJBlTYFBlNf7TI35mFEdEMhSY7Mq05xDAlWp+
	Iye+vwXgkWmhDz6x5PUwJz8uy5MUZ20MtA64aptE7HzaXp9iXC8uSysyeOJjM5ku
	KB8IXU9AqPpvxGUTiJQeksWrpGiKxaYdbwWxDzYOfzU/v2MSYJZwIQwxUsSgQXul
	BPwopw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jtkvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d58bed44aso109789651cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010897; x=1776615697; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NitPcSx6Ja/m84eHfJTpLIKNXIwXFgYazEdJ+UVoxSQ=;
        b=VeSUYp0y0GMy6Oz1Tk5DtnhN2dmOdIhjwvILl+2gzOpHqUp693CghzCgyXMnNoUjrk
         fo0UP/ms+CIe5CtHg33wnimXXjol0rXdBa6D4F+BirMoxQkN4gqZvyWp3kOdRNuMQO/R
         yBuL1Rk/RpB10Mo6OVaw0x5rVlL6NAjJkLRiLU+1hxV+ib2mHLI5IISz9QeKXQC+REve
         6A370zNcmMkLZG+wMMAxBLopoFWUH++uvAM3hXPH7CYw+iCHF4QAEKARyVDgs9w6chhg
         hn9KuI/Uxh05XHS8NHWn4TSmzR5NCeIpxSHqIoVe5Mh4cvPdKpXjgBy+pFVZVMMvz4p4
         U3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010897; x=1776615697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NitPcSx6Ja/m84eHfJTpLIKNXIwXFgYazEdJ+UVoxSQ=;
        b=haJA/t5tGCfPFEPLToOch3ymAgR7OiE+CGOJv3LSsZlczXdcTgNX0MmbngP1F/lBv+
         VzAgnEJnnDUfsZEgd8fLpEmXHJi//l+CSsJZcjMWGrXKPZTU1ho6CTmY0XjosZDOdplo
         P38CQIacQideMasi0nVXj8D8DBj7xdN7h1zi8agOEqaukEAawbK/NzKSB//1GT8G8mD8
         /2h8XpBwsZ718xZA1KrGqELJhwKa4TPxYY0fYlXIVy4iSVIaVjoMXcWGjGcJFjeqvZzO
         dQYFpWWN12UAdopaKFE46XaXen5WVN93VafjCIvdcuQae4gz3Dw7SN+xFxb9Z/gqC9kk
         tJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXU2Y0nWkZnxm79v/VjdnCJB60PlsqCvmFnZV4XO2DwBSUyTRCbgWrHJIm1BY2xB7P43RT3PdsSB8oVBd/D8p61@lists.infradead.org
X-Gm-Message-State: AOJu0YxNXlgKdd9MD8vStei9QxxgbkqG09EbMlr39VQm37AHVpbpCiyt
	PzyEDrm6enAYiy+EKUuvV4XVxSxLtUJoQaWNoYwSUGryhkMGL3tjw7iKTSL7LXl8tEcDaafdfMc
	nXUR8NX8VtmgF3JWba6fm/o7PfCESqTTPbGZijCam1ZuIle4bndSF2pcz942lS/+IaJ3VCFZYlA
	VjXA==
X-Gm-Gg: AeBDievtmRR+UGAs2AT1dsV4bKNzXard+P4TxxoPKXVael4sOMyv1TIGWHg1hgdexyl
	BUWMR2Msa/Hbw5st63+QKvnM181TJSYthqgbQxDbgbD2iMqPFwj7OjFFhmCc8ug1ryYD59z5of9
	mkJTZONDXmn68B5cJLkHrtAbKlLEe3zDhV4IiNtBG1SCauyUNEk8bMVNYEQ1qc9rd8L8ZCDEf4o
	XpFiS6A+Ek37MP3fCnkrFrFMghkqDZrN5zE+/6HCBmql9Aer18iG0pKX1qhY52KuYMCkeKS4Sfg
	qwNwX1PyCp70NA5aKlTMuTrVV9O2+EazSZUWWWhTW+hRxuaCpgKeeR8rIiJzhR0eVFmwN2YqS7v
	z56B/frh8+S7SLIh/15vETsaISv4Qcnq0Cqm5GapYoLzk
X-Received: by 2002:a05:622a:a95c:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50dd5cc6a5cmr130724681cf.40.1776010896690;
        Sun, 12 Apr 2026 09:21:36 -0700 (PDT)
X-Received: by 2002:a05:622a:a95c:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50dd5cc6a5cmr130724361cf.40.1776010896239;
        Sun, 12 Apr 2026 09:21:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 18:21:08 +0200
Subject: [PATCH 6/6] arm64: defconfig: Switch Ethernet drivers to modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-defconfig-v1-6-a46918286451@oss.qualcomm.com>
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5302;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6hjUMCUeW/jKtCLOjUKJmC9SA5p+CIWzsfQo2ryaNME=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Z7sA5rjDUcsmAbUznz8NXAqE7Mk+lsV4kRt
 cD2pVMvLXuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGewAKCRDBN2bmhouD
 13XTD/wNF+xifLCfRmTmHr6SsP9In9fl4flNZO8Unwc9+AMFTciJ3wW7s0qeTbyKO2+VwYIxlVx
 YnkP6fOCOdhgJRoma823+9B18QvnugpzfabDCvz0HIL7/WGXg37OF/vJD6Fi3bmR4kp1PyFJOGg
 AX5glfGva11oQob03406Ye8xPgxbV/gK/V0MuyLgYRo8B6+3rOoRBwVoYoxBr2zywuhlQ1zQPO2
 M2sqd+yRvBDyuy6mlZEOTEKV4iYBr6YhYmGols8IGC5BmjHnPh0pXqKKmzodgge8h/OWf7ZdqwO
 LPDcPxz82R1XTrWdHYka2RXiTjZoahLeiHHRCJFjDcQeO3Y8V/3NsnTWmWBKMyNigm6x/EySAQo
 +bBGCi26GPkCmV4MFoRiZcl+1/wyhsLxv+E03sYNKf/EH1hgPVtYlLf3VRksMFiWUnBc8YpeNiv
 3L0O95S9cE68RonjetC9C0F1A6VtM/zeNX1Ulfj12wFeFuAC5k1hjsGfcsiTl7+2vnC5K/ht9vA
 slPzlOlEL8uJCVvU8utcqOfuz5jcASrRwC9B/ismBy85lEArvLZHcumo5OkUWX1keLqy+StbB0V
 pX2VTEekHFM8HBDCokwkQVY39owuKY1vstWmUm71wNXbV5YmFW2EbJffNxEXt5x0D8XZYgkCndK
 10KaaEKddb5ej9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfXwF6JnasCIVor
 G2AtnVravxsbLlFQWKxq7ECgjPy/KMhPp+lCUSgUt8ZxkwZeo9tFw4BXLnKoNTHyghzobcTyODF
 amk/RMYIWtPEcWRc1RUTUk0kEpZ0/vglrdkeqUMYIM6MQxF037EEawBwRyGewptqNpcNDT1cY4g
 8OHPbb/7MPNBNQ0VrCMXF3iVBKZkLFq84jLcQ16INPgDDIu9lmAuZ85ixHIsPiQa2CshhfESN1I
 HIFIhm72TOdR1X4n74E7aDSgVYmlD8yH/eC2dOSELHZUEHdk6PBsR7n85gHfwB/EsNZYwvRGf/b
 ITZgQZFR9fpeXhJ+mPauAzrh+Wt8beYjB2/JnTipReoMBM/I5vgRw/5LzwuDcFxMxmEFwkRvK8s
 Ib1qVJ5kwk8qyWe/03+l/1G9TMk0luvJNIr4uUMsANuQVzL+cwqs6NiVjlWpQ3T3pEpsSxqe9vi
 +QeOoaVlK7G8lxZdk1A==
X-Proofpoint-ORIG-GUID: h6qyMmVu7-dRDFRUWHgUeSK39MymP8Ur
X-Proofpoint-GUID: h6qyMmVu7-dRDFRUWHgUeSK39MymP8Ur
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dbc691 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=D03BasQ1alSNJwtn-a8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_092138_739505_D7FFDC19 
X-CRM114-Status: GOOD (  16.00  )
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
use initramfs with -initrd argument.

Notable exceptions / diff explanations:

1. Intel CONFIG_IGB stays as built-in, because of dependency on I2C
   which is also built-in.

2. CONFIG_BCM4908_ENET and CONFIG_BCMASP appear in the diff, because
   they were default=y (via ARCH_BCMBCA or ARCH_BCM_IPROC).

3. CONFIG_HNS3_HCLGE and CONFIG_HNS3_ENET are removed, because they are
   default=m.

Moving code to modules has positive impact on kernel image size, thus
boot time of all users not using above drivers and ability to flash
fixed-size boot partitions.

Old Image size: 41.11 MiB (Image.gz: 14.69 MiB)
New Image size: 39.14 MiB (Image.gz: 13.82 MiB)

bloat-o-meter of vmlinux:
add/remove: 4/6139 grow/shrink: 3/51 up/down: 34547/-2046619 (-2012072)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 67 ++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 63d4a0f2e388..7d82e90b0405 100644
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
@@ -362,11 +362,14 @@ CONFIG_NET_XGENE=y
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
+CONFIG_E1000=m
+CONFIG_E1000E=m
 CONFIG_IGB=y
-CONFIG_IGBVF=y
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
@@ -1955,7 +1956,7 @@ CONFIG_NFS_V4=y
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


