Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D684DE68149
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqwKX0Aj2qB6OoFKo+B0WIg5ODpH3WcnUHpTRarQoSk=; b=S0IzV6jlrxsB9xWXhy3R7OmnQ5
	uNHjOB3wLVnrtAaENmusPefQrvTmi5Jw2bX14po04K1B3IImI8+CljbPYvxnBD5UmhCkazcfy0tBw
	9xatQ3bkBcWXd41RPwL+O/Ch05xSKDH/97+ZqY4PzNtrNyhsifP/hBLEJBH6tWE3R9tHTeAIRtThM
	DaBGnEcrDvgjvzAka0enNhHLZsPJlJTalaXY8MTMvCXksDxVZVhTO53I3tEwf1GBE4T3kO/ubtZYw
	jk76/zfWpSzUcowh/ezy2gJF7lTOjW+T5GVzK574BBjSrRit0HHnNmTyJh3IVmmIYIkMH5V1sslMq
	XDw2MAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHCT-00000007vFm-2ygd;
	Tue, 17 Feb 2026 09:16:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHCQ-00000007vDY-0YiM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:16:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7qgp850154
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqwKX0Aj2qB6OoFKo+B0WIg5ODpH3WcnUHpTRarQoSk=; b=DieQGfnoRH9FQRQM
	Qb4AXq1+w52vkXqkrA//GAhQyHvG0Y7MOqnaD4v7rsLh9It/CMr2iGHHU0xtO6fg
	0SMBmD5UOq8FA2W47WN06Fkb8yQd1/uVJNw/oJN3moaNshcDSZ45XmuT4rBMX9K5
	ae/drvvoQIG+umZUM78KiglZTMu+3RVvBa/3/N8iVwzSPoOmQqT8mL5d9gzAfBOQ
	fyIozj08d8F1KZbikRTuW6RsIS7dn8uxUdyV+jMTu6PYv6s6uezeYtUvGFPfmKyU
	+6WI8tT6ZK2R8dnzxFsAUAml+mDuaOfD/6s7MT62AFm8TjTsMJrTv/y2BoHcnbNb
	cTN0JQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrsqp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:16:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b0d938dso2677750285a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 01:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771319812; x=1771924612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqwKX0Aj2qB6OoFKo+B0WIg5ODpH3WcnUHpTRarQoSk=;
        b=I3Od3QHr4q6H/nz71gp50lWZirxZRoT+dbFa53+EhSk0oJkIs0yJetwaKwEmeI0GK3
         BaIllfn0Yzr4cIQiVYkIPgkoKL1ixaAuL7a6BT6rtSMyPgZG1byMPa42gPSCv2gE9+mJ
         0ckB5mOJ5zZpXIT7uN0m4qF1kd8/r331peoo6wtjcO83dQNPhNmS+G5kORBzyAZOf+MH
         H+/Na8Mk3Em2DCqWmbS77TMyEt9TNI29GOtjt3bAkBhOo5O8Km9taBVFFQ4zCAGEeU1O
         7IhmwLVHFQDWJsqWfV/2+31508N3vhQwxXc3hN5G/zGwVk5UW/9bBVfI4M4VHUUm2ezZ
         w1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319812; x=1771924612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QqwKX0Aj2qB6OoFKo+B0WIg5ODpH3WcnUHpTRarQoSk=;
        b=KhGOVomu3e/KT1X/XtttXjS5mPEQoud/2uKgdjz0Z/NZBVwvkde40Ti18iwPFHjjXZ
         yrID8bS3c2SQ/aK8p9iHw5oTP21THoY70heT43uo690ZPN+1ZC1I7gI6qsyHv8OYIo1n
         iFVQICxHjtyzq/7KTgfzmm0JWLUAsX4Vc4WyFs1wwgCEqjQ9sVWu89WVgunq8AYMM7E5
         vnp/6Er+FLC+YIrtPXYSLi9YJE4fhXK81QlgPUnNO6MZEkPZsmf04nsxBhKoMSsQuug0
         y0EgRMe6hGf0MZRkVQbLVxoAr27Mk+JbQEM6gtdGmqQG1r5X0+5sCG+dBW+ZfBjEy6au
         L2mg==
X-Forwarded-Encrypted: i=1; AJvYcCXquvaUoPDqBdpZqbIZwZxK1YHB2mFlRhxp5JLDPUg06QUSu2LOzEVUlnoyKp0BqdGqOvVie49U9eVDtoqcHSVx@lists.infradead.org
X-Gm-Message-State: AOJu0YxOoFgFXOqNdipSIEGB4xRGAe5ArU/fI95nPdI8qTp72XBc/JZK
	R55shtNWknteJVmT9OHU7hVDuMtyKWKURrc4qDkC4D4aEbukFQw3dGw2aJDPkkZkdZClkJI/fpo
	lCueapHgsXbcy4BnjTREE0hPkybz8E9TPxUM5Vab0+FN6KCVBokjugXmBB+jTbDX7Fb5mLH935n
	iGHPf2W2MorQ==
X-Gm-Gg: AZuq6aJgGqOOhGpC8pW2zd1dVx25eUD2WykOrSADyLf/mzwvKI+PGSk8aroF2mOEDv8
	zzMHsNINWloxQD9e5zDAIEKgBzUkbGgVXFxqckchb3yvQuZOTLye57fqo7nJDzYb0DIGKmx6ndz
	mnm1haLY0fw+WOs2EJ/HZtOBIXuipqiGxNoK9ZV+BZ/NZjDLqcqjCdCfuXj4TkirgZb8MlXOHfz
	exyOJ9PpqD4qbX2imo233oRBhpNMiySgYzBMUlMcC5H8lI8qtCGCuYmuXmyMo6cPWwfmuIbKKH3
	3Plpt/92d6akI5XEc0UKTkTjQL6N8ovVP79qNE3rZAH3zGGv6bzc0Ek298UAu6PSStlYfueQCVa
	d+mezJESGMLQkNfIwDgLJ+aeG++a3T0VWS6PdsxdOmPdJKA==
X-Received: by 2002:a05:620a:7f6:b0:8cb:50e4:feef with SMTP id af79cd13be357-8cb50e504cdmr769423885a.84.1771319812092;
        Tue, 17 Feb 2026 01:16:52 -0800 (PST)
X-Received: by 2002:a05:620a:7f6:b0:8cb:50e4:feef with SMTP id af79cd13be357-8cb50e504cdmr769421385a.84.1771319811697;
        Tue, 17 Feb 2026 01:16:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a23c6csm149659595e9.7.2026.02.17.01.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:16:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:16:38 +0100
Subject: [PATCH 3/3] arm64: tegra: defconfig: Drop redundant
 ARCH_TEGRA_foo_SOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-soc-tegra-arch-kconfig-v1-3-81bf5674d032@oss.qualcomm.com>
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
To: Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=975;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=k6c+fAFCq4pbzIoeXXWdyPNMK0NSCD4bVWRNlKzSlyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplDH83G9cfAJ6hCZ73fC6UdA+oV2rRkP/Ue4vw
 dziSKdWGumJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZQx/AAKCRDBN2bmhouD
 11bAD/sG+mX70qf+GTxnc+gi+h6tT32b41ytT/LdH3r/Os6HFuRk552uDGIjmjcVQHC/wFapmqR
 Rz1xZNJIkJmi6Rzh9hOoInLr/C5x4AIXs62acPSZAYtqcjjTvRc2GFE+iEznB79660aLl6qUN9q
 0jmhFJ02qYYHevv2bpZugLS4lsBOGR536M5jUgVPpRCuEi8vqR1qfzIlpku5MborOnoAS8LzFXe
 ogUc4imT+YJ0btrPNdbJTNklf5cYAFgTWhesjXaMjDo0twYEmaPyVlZ/p67vAHIbs5I0G3tHePC
 6+YfvltfFMY7L7bfxjUJKKHGiUOaPqYfMTQI4i3ydYCU9HUp7OjAbq9LZM10cr1syDjm8fC6vjk
 mdp09XOM0lm4ECj40JGsUBsawz3zRaJQcJrJPUoiDe0LcHRNkhXAUAbKshmh0/gWhvd3JslBgaf
 vf6/RXxcUyZBcMTPotOTFWzMqlGubBpUG9N+TH0TwROwmuqPIgkjo12BNOE/QvvkuKxzLBa9XSC
 ka3N/yX+Cz3CSX0pVzDjes22tesvT6ItkEDfbUIO4rIy7tJanQKCb4hU60T4TiUkfr6y1VNQqsy
 BDuBHiY91+itZYJlidHx18jz9wu2lm17VWRXb04cVy3Je5Alb13P4l04RE+TZ3xepJyR2NM8xQY
 Ov6jeCWiTA7asrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=69943205 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=llQUqvZ7wNClwjE0nKAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NiBTYWx0ZWRfX5MmaNvto1GA/
 0opJ0CXsbU96lo2swatHbJvfX4Q/bgkAumkyQZYPya7LkJwE1NFgMnxSvzlFV+q79rAJciIRv8M
 RSfk+T8wYPdBsXjsdFCOJy+KeFbrHBlAe24n9v3RtkI4w6pYoTnVnCek/OIV1EDWVxKUVaAUIvx
 +BUicebEhT6f1qocv0uhmfvac9O/36MElliPCVUqkmvQngbYo5ayqSuDIa3MRClkkU9E0rhoD+a
 BEIzPjtH3o4F12GquE/AmNPmNVfJz1ilktXCyJtaZaP9llNPUKD6iCrc8w5pdtI97xT3eoD+GQ9
 MAJpdfW3YbDPijSzwjiONovOPljOfkmVHWu1CoLvySWhbdfTEtDdDiu9hhhkGQdPpnWnLdiU9Az
 zX2UCuo3yjnpYPuMfNMwxElImN3Tl9UM0Iy8QZVeOVRNxvy7j//JVP3Nz5kbs40clnJlSUl7s4n
 8qfYx3vlaCnjpXHETGQ==
X-Proofpoint-ORIG-GUID: AiRFcaDdBYCIAyTprTGlUf-OzdapmXmG
X-Proofpoint-GUID: AiRFcaDdBYCIAyTprTGlUf-OzdapmXmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_011654_294191_DA983812 
X-CRM114-Status: GOOD (  11.36  )
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

All CONFIG_ARCH_TEGRA_132_SOC-like symbols are now default for
ARCH_TEGRA, so drop redundant lines from defconfig.  Tested with
comparing include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the previous pach.
---
 arch/arm64/configs/defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..08971b92303c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1641,13 +1641,6 @@ CONFIG_QCOM_APR=m
 CONFIG_QCOM_ICC_BWMON=m
 CONFIG_QCOM_PBS=m
 CONFIG_ROCKCHIP_IODOMAIN=y
-CONFIG_ARCH_TEGRA_132_SOC=y
-CONFIG_ARCH_TEGRA_210_SOC=y
-CONFIG_ARCH_TEGRA_186_SOC=y
-CONFIG_ARCH_TEGRA_194_SOC=y
-CONFIG_ARCH_TEGRA_234_SOC=y
-CONFIG_ARCH_TEGRA_241_SOC=y
-CONFIG_ARCH_TEGRA_264_SOC=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y
 CONFIG_RASPBERRYPI_POWER=y

-- 
2.51.0


