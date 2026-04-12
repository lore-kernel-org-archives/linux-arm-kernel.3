Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C77AE937F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHqPy9452OV1rd0GrBkZHUJHwoVr/weQUOYEivz1UIs=; b=BD+7VpWAl+vNfSKVW6EMUeK6H2
	9m5nXgXtOj0e70hjnJY0JilHm0CpZpKSsygKZFtvaGfovbDb+r8ptNAb89mMk2oQeCcnTv56ojWmL
	HcQIwxz5JhrRRQVJC6U+IZtqTKW/06cjDkZ656Rg5yMkjzOdDRc5EYSH06xyTaAR+AGq0ZhQEKznU
	e1CyOz1wKjY4j2+MjIVzOhVA6oqf4nZdPg94KBiIz4TzoQK6b5uAH1SZ6S5bV8PwgVW37c4TKAdLY
	d35NJMMUtXwn+CSxekVx3wuQjXk7UYc2igFAed6tDhwIMkAVAj4NGQJeQKrhlv4kFJegcYeC1CA6G
	vRph85Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMs-0000000EWUs-2nSH;
	Sun, 12 Apr 2026 17:13:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMp-0000000EWT5-3kAG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:13:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4rGl3561249
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yHqPy9452OV1rd0GrBkZHUJHwoVr/weQUOYEivz1UIs=; b=WGjNG6ZAVrKjB4Eu
	GHyNilxI8K/STwBqR+nLyhFRI+JtCsjON10S0pnqCN+9kRH8tIv/GmDGj4rEHJT3
	GEebZsVrhKhYlNYHeM7m+JCdwBXOeH066a39YJI66VraG2j5ekANkeV7Obkr5SHl
	ltoXL9Qx7VuCx7RS3WJdHhpdOZpGkhs92ySeHRLYHGoQmQSeDpoXRzH/4L9eRxbv
	FFqBusiUOxMglOz+sjw55J0zNMliTQESZ9ctn48CwjHD7aFMFppzTWv73D9ePIeY
	Xc7oJvuYZ4VKK/phOGEg2noOiTYIGz1CXRizT6NQZeTx1Xh7JBJyYQlw0mwtzKNc
	1BeFfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0jpj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:13:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e8c47a3so44054501cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013982; x=1776618782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHqPy9452OV1rd0GrBkZHUJHwoVr/weQUOYEivz1UIs=;
        b=YuyJqB/XMzvz+OxX03tkiX6bBVPYCYKOGVeBt52QTnKbF9Qu9y4o8f2sL7LaM+zoIW
         V+sx+ZqmN5/KSn2kbVWkXat4yFNrugW0DawIigLlS+C4j1H+T5WyfdHatbcKQumGaGQJ
         GLbinqxsJhpdhWi7/ESBEjI+V3wNkJvanbNMebbo8z7nxjLIgOr1b4/XPRdvGtFQydJi
         41Oq4ozuJStTrBeekORy5p00u2INxMssPpy3FMTwVQ4qSVNvA+vs07T0vw2lyp5+RNtc
         k4d9dgpk7Tt73NoG6c7KRIKaUCH6RNINjhjdaMEkJwiQoJRXDeS5Ym6BJlUSFccIQ1ma
         cpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013982; x=1776618782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yHqPy9452OV1rd0GrBkZHUJHwoVr/weQUOYEivz1UIs=;
        b=L7viGH9F9YhZBikYQA9ax820jWJACni13lmDPzp8w+iCzUl9a7FLr5E+NcL7uyqv1U
         cm61+Cjvv/lNfiuYSA98j8h5t9S4S05WW3tY5lzRV84aH7UeHp7rBfilftLG7tYDODQH
         gl/iw/5Lig4oO+JHDkgzFn18uJl2bwikYjJ2+JjxpYc8P8gfz0KbquToGq+lcUEWorH+
         j1YOT6TMUdCrneZmukbdUcC8u47IadHMRLJRLKttpop24TJjbcoZE4UImv/4zG6IMVP2
         ECy9uCVl0VDzUD2zkY5VcwTzhmAIVGIH7Gk2geBz/ES/lJMq90j5BYXM1vuGEVwryQVu
         H5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUW5UMqjYmEXJiXr7mHexyp+AAIWQZoNRL8JCYVC14L0qGX/U2O9Vhpwu165Qx6P2wkXAWH0C/3KQNA9zY3M56A@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf+BVVzYVb8GWfx10IfuRR9G/bx0AW2QNK1o6APtxrGW3EqXce
	Ybra906Q/8xu6f1uDQ64VyXwZBm5Ly17BBHDr3sxXIZUBcBo8srmXEzZu6TYgHO/dkPZcwOE1J1
	gRBnCM0u8OpxBOEoeamLjWXL18ueCPcu+4ykKfvhjVNkHcNOkBanfGyh9Q+fgmwoFjjKeiTVGPn
	qGJw==
X-Gm-Gg: AeBDiev0LoDbgtfTtOqsAnpZLoQKsf93us7WZmg2kJ7DMLHX4xP/m5Xlccz41l6zgCg
	cFqSOKZUfj4NyhvjD9X8qDk1wB+sYFllmGJJhdjtSdjHSToPBt/BEr4rlNkAa+GX+N8Paz2oVT9
	zqKq6Vj3yInccooqyIuvvynDzhjbAcBhxhL6FaZqswdtd0NyvA+hbHRG7nNEfKNpIEheCLLe4Xx
	zTeUR8XAgxdk8roSa9IFmX9g6PU+q8meugerVg5XDcpAKL32hZbDkuYXd1/QjXKOeSlUf6HMfUj
	xx+xYbsMWle0276qRJpnKDToz7eR77OB6Uf9GDDqfrA+2VfildFpm0S866vOkIw/ZeGyHSq0uKF
	X0svep5AqQr+jKOPOphFJfeYxUmcmGThmbEnVj1K24Yhz
X-Received: by 2002:ac8:590a:0:b0:50d:9073:f8e with SMTP id d75a77b69052e-50dd5b3f2f9mr171621411cf.26.1776013982424;
        Sun, 12 Apr 2026 10:13:02 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:50d:9073:f8e with SMTP id d75a77b69052e-50dd5b3f2f9mr171620861cf.26.1776013981941;
        Sun, 12 Apr 2026 10:13:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:13:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 19:12:48 +0200
Subject: [PATCH 5/5] ARM: multi_v7_defconfig: Correct QCOM_RPMH and
 QCOM_RPMHPD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-defconfig-multi-v7-v1-5-e76de035c2df@oss.qualcomm.com>
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wEYAV5h3ZypSxV89EQNiKmAgaFdkQMYELTHmmNYH/Eg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KRH/OkMloWyWX8eI15BKYO+AjvAW58VoG/u
 ed+n5tKuxaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSkQAKCRDBN2bmhouD
 176sD/0baYJg1pUAzOINXpihfdHhicvNtXQXsokzmJ6Lx5u/c64I2Xm+VCoFyYTL2NE2mx7WobF
 gnQNF5KhUVWE7MnvtI8J6vLif9SdhYxQ+OBQIJJWHiam5ZYAXqz8/hfonL65S3WqE9K10LpbjRt
 DCasEJ+BAplwK9zSBjYisNZgAe5HNz90WppILagbzW1Q/dwBXLxfqbLS0WvkOEi2zDeb8WNPogt
 DhWzHKRzD4YKhCiOO3PT+4gAv3PVkiisUX/twRr7MfktZJPBefMaluOWVGgUIMUfoP8589aC1hy
 PQjVxQWjSlYIzIteSKjOfUS6bGk6lAVvSWbkX+5pvzTTvJZdckPAKAf3lEmzV2oTZSJVFnyNOiu
 eeHhc7tIVfMver6zRKI+pz7gM+iVjR2tf+rrpV0pfD7CWhRoHPwXuCxWXCe9lRtL/EknbNOW+82
 TN5sckp120cxHZWvYXIqOE1jTH+71sLCwTJRPANX6cthyo9ih1XfNZ2OpFQP9MDaCZWkImh2sjV
 YPXplBKSvEvqRES0+lVWbr2IUlSCO37WQ8cc7eQwI3lv8EktwcdENxlUMt5azGdppSEG3S3nP+9
 PtolZXpx9U/954/p8t9+ycdRn+ucsEJR2IrCJNZHnKAEOSB9YX7H2in3tOjZqnuVLn210s17L1s
 Zq9IRVmvYtz2e5A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dbd29f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CQzOjKuoA5NHZMXwxhoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2OCBTYWx0ZWRfX6nLxnYYhDBcL
 MV0ULCarj4vAY2GrJR4pPO3UnbBBJVYP/VdLMbDD7qwr2uhaDkxURhhNyOOG6YSg6cZvfU+ehlV
 8btvmoaWOj70uUN2aFWeIQCyYbAsdX71308KWjSAPFL2a12UdB7FFk2I0r7iySAA9WaTxt/AxLy
 pJVzRq1T/cpNaD3NMu1D1f0o19ZNJbParkhI+oEF9JbOTNPCN9IbPXrXWvt06F3P++6KV+Lkhze
 67FgtvupQa+XEwDTgN+V+AViHN7Vh97EgEl++AyvFYuzTVccLg/w/+vZoLeBSG6IjVtNjPv9ZWW
 EwO8ttVPE/oB6POWGRi88oHp+73Kwvk2MmuFjSGDPF6kJwy5AJl8a0NH8yxetvvKF5FoyRXfFlP
 2l3sG9mGb7Oqyb4av6n4dLxdgLMxswRkltujDuRk9B2w4SCJF5lalenXEPTrMK6ChasW1//aIw0
 kr+IreRksE4F0Ckg+fQ==
X-Proofpoint-ORIG-GUID: uWjMv5UcOyVMdVd_WhekPD6or73MDlAj
X-Proofpoint-GUID: uWjMv5UcOyVMdVd_WhekPD6or73MDlAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_101303_938717_E783E681 
X-CRM114-Status: GOOD (  13.51  )
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

QCOM_RPMH and QCOM_RPMHPD can be build only as modules when
QCOM_COMMAND_DB is module itself.

Fixes: 1c25ca9bb5c5 ("ARM: multi_v7_defconfig: enable more Qualcomm drivers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 520e2dea77f2..f4f98ea5c4ed 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1146,7 +1146,7 @@ CONFIG_QCOM_COMMAND_DB=m
 CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=m
 CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=y
+CONFIG_QCOM_RPMH=m
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
@@ -1161,7 +1161,7 @@ CONFIG_KEYSTONE_NAVIGATOR_DMA=y
 CONFIG_TI_PRUSS=m
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_QCOM_CPR=y
-CONFIG_QCOM_RPMHPD=y
+CONFIG_QCOM_RPMHPD=m
 CONFIG_QCOM_RPMPD=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_TI_SCI_PM_DOMAINS=y

-- 
2.51.0


