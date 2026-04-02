Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BCFD3942F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=; b=TIGx9CbOHe551uExmWpZWY3+x+
	AASQQWCTM8seWRh68fWyfiNzmbcveicBeDexsDcOJfg/HOV4XDYdPVHTfeetgAiKOVKaqkiLUoTK7
	whDkeI8aZL/7WHd9HxNG2cFAmMmgobLuPTGRRYB8heIgVqWPXcqf4lVNy8bc2yJgO4D5vbyZrMsh/
	uOM9v9ozuZizwxhLNvqdOKmOJQBkePsvTdBFqSDzP3QTV4rr6bhMEs9FnJoiZP8FfjhpzgXqcIr61
	yIsyFWgg5hcmvT9NT+c/9SsGytU85Wvdia9Fl/DmSfdy7KSrISwERL2Mb+Y3hqYt8bAkBngg4glQr
	vi387C/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ipe-00000000Hhy-2KcR;
	Thu, 02 Apr 2026 14:15:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ipb-00000000Hcx-1ijo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=; b=iM/W2qQxh7PcJSb68WxOwO91zl
	1Pzanug6jSKMLY0hercj+wPci1BR8WYLl+r9AyapzEQmmBnPpJlDLaVXmzWTNxbzbUpHwPBPV8Tsf
	jKwDcjlTjqSudp/Po3F+8N37O/URmwni8IBYeoV4tkudKCMrqdZhC3KWUsEi7hEcB2cU9DttyaKbI
	NYqeMVYwxWOS8WuCDWhbUcQLUpmhaNAshu6WvOpD+zVvgX3q9tQ0O2RXibVIG67oKBn2GWcPEkFyf
	THL00CJ5qmALX2G/IMXBOmGlbNHuMck9Goo9FaqZMe6P1LA5UP39OBi4YtS5PFHMJK+OlThtHjigg
	mg3DfgrA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IpW-0000000CPqA-0pbi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:15:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632DDtrZ1128506
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=; b=BCRWECBdceo8emiX
	zVu1XemBIxDnAfpAVprpPRAtAlqgL/yPKHibQWKIS3zbIOD01OFtUiWDAS3pX6Fn
	ucFB4kUiij61guxsMtPANwSlFiRlxBcTqjkm/jybIlqHtlUUaSzprNzh9eUZjlhO
	4SY3Qxd3PEsLR/MdCYJkvauFJGNyoXqrSuxHJI26weardUyj6KzMZgZd0klhoQFy
	0OWz113/0NiJGgwFWJ3SzZVjjjWotAojZrdACM8sI4q5TeA419H56AmYkcgMH7me
	yLWG2u17rfXBltd9QIdNHGVvJfaGXuY9RqSvobF3/XoDleHUGKPlwYOox0/0jbeJ
	NWr7Qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9cg3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:15:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so21269621cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775139328; x=1775744128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=;
        b=MYwDZFjGev6u0hm1zb6YBoXwGEElNC5OKZFC2t4zsA4ElDtKgP/QjaxVxp9Ep19UaC
         jR/pq5HMyi8UdjwjEM3Rm9dNown/TF0Qr2WRszDvsJ+tzrkBgauBHAApK+WsurwIOWlU
         Xc78FpWscc2NlVtjyRBA7go8CjObNR3HmxNJ8bKjXekTnM7R0jwKv5+TedQYmKx+2vSd
         2Sknr40laADO9EaKw2hKMzVxhyLH8Vpx2TySvJrVdw81/Gk4ZkWJJOcKJinw5aGhgtEh
         d6ygGVa3ebyHY0XpOfa49feQErsnpY/qJFyEFpBZ8jvUcf/ZmGwc/en+Sd5hsS1FeAux
         P0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139328; x=1775744128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=;
        b=Y8o9kS9eyIOGemZAyJcQZKDZVChZaqhZcRc4A8arkAatt4s37cl/Vy/sEdgff/Erry
         b5RxokIZYsL2oLLm1YYr511euG+dIVcyneyXZJrVsZ86rprb5G7IHO5YUXVe7mJVXuTt
         A42DJ37zZCS8TPrP/LoIFaadFqw2sIoYKwvbvt7QMVl3WiMdJdH477ghbouvJycmvmph
         t1sEDKCxUh4Vsi7wGUAcR+9XffTjlxHxtq+f5cuO1aJzNk0vNwMih1jYkipOzXtHGz4b
         GUrgd/WUconytEXj2Xj8awmp6qiML4mAcoxT8YpycRqdgRckrMC6go0FrXoTNdUbCE8z
         SZQg==
X-Forwarded-Encrypted: i=1; AJvYcCWF6A5Irx7TDNYanHCGGev1xzXEhB3rC3eD9rCk+eiQsR7txOoUngWQaJ8dSxKnNiDkrYuMHD48M/6hIvfxgFj/@lists.infradead.org
X-Gm-Message-State: AOJu0YxplN/iX5iBqhWqghg5uDFzq9X22hrcB0+yGso6e24hwOL2RzG6
	MwOGPAjXjU+8CKGzmCXNZdwm7qHr0pRu/3Ba9V+sYjb5NmYb0j0rfkdhBFSwrSseW7L5Pv8am1D
	30MMv+sPXwkWAB52i+rznoLShqce8ub3GB8+Em2mHlehrJcNCyiJMyx8lIgaKceYH+1J7/bReCO
	Ov4A==
X-Gm-Gg: ATEYQzzpjwR5jpSmu9O+eBdiYIzqDuvskZHcq1a5/jJDdFOQmnSgISGME37+PaVycCM
	/f8hnmnppaqjfVWW7p6JXeRwFqLyaMlFgx8TGTRiRlQoCRsHhRjts3UW7wFdJQSUf97XibI+tba
	PUr00VSZaRs0ghicC76B0NB1HolC8NDQL0dKlMfDp2z1pA3n17s8zacvQBMwwK9ms4BceYfZXtH
	u1FuSN2LzLN//S5fKY7eZ8vlIuQjeTRIXNb/Ykaial4+urXvVpq2PXGbFQu/JuJvEIBQ6qAfMRi
	g1u0y7xjTFZHqs4p4Mc5do0cWA6BZ9oLSQdZfJCL3YZOtXVy9vJxXC8ZIn4M10GZa9XxEkkHrz5
	6M1MIhAbpBf4U+mS0y/r7xcMQxWmMpOyMJyit/eZAzFw5C92rJ4aG
X-Received: by 2002:a05:622a:207:b0:50b:465f:706c with SMTP id d75a77b69052e-50d3bdace4fmr105255061cf.60.1775139326389;
        Thu, 02 Apr 2026 07:15:26 -0700 (PDT)
X-Received: by 2002:a05:622a:207:b0:50b:465f:706c with SMTP id d75a77b69052e-50d3bdace4fmr105251081cf.60.1775139323963;
        Thu, 02 Apr 2026 07:15:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm192824885e9.1.2026.04.02.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:15:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:15:05 +0200
Subject: [PATCH v5 4/4] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-nokia770-gpio-swnodes-v5-4-d730db3dd299@oss.qualcomm.com>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7115;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=84lA+sQad0KFCHbORyyoFKtDWqR/112mWPWVfk7uVlo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpznnyrQduqYRzaSGCrj/a3Z+EMcoLtnR8gXIhB
 rRkqv36XQ6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac558gAKCRAFnS7L/zaE
 w051D/9/iGB6iVqBzF719/2yLqnIAn9kqb0163tgxIPoz8kXX/FI5zf+t6Q3zmC9Cygm5OUsqgK
 3n9fI+svI8LS2chxUKP7kCbHvxH3MlHHM300iW3hkLUyP9lkdwOHFQ3vvgA4djp78E1MeB+GKsW
 /GMMtvgntw0YwmWqQqY9WFPagO8FSHAncV3ui9H6PZf9TIeQIHwDQVDjqlLZHCeUZ7BxSbwup/R
 +YHFwpxiLdoFtdOX90NVHPpM3Yff462amLZatiXPrHWLaJblB7ZCjKZN+C1n0Gzrz+dDtXDM8sr
 cPfaXSnQjZz68q0P7NWLbFGNqRJAsS58iBbcFWCg5b5gVQMw1LMdMzBHiCz9jTTrDdpG3/MbfS8
 fEgjfM6Lxkd1oaH61wlXPx0Y6lmzjIvoGZb0kshhiQrymMOrMgvWjPuVX56IWKkRpW0GNXUJ0iA
 vLIMOuaxk43lNIX8tl/QmEeYrpw2KFAi8MR/l1JFlADn3xEr+3imTlmUsdyUthTNmqsd+Ot6YIp
 3SLge6ThitT8CX8lKjNM44ZjsAijL3cRu8XH8lDcBwz7pd2Px87aAvJKBoBbwBGG1RtRhMM6pj/
 7bJLVfMTbgMApzwv+lIh6glmEODbiutZfQR3jm5iJfk8OUtD5eXjBLIgH1CiDIkXbpjcfpW0yLk
 W1Ge0RJ1TNMYuwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce7a00 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=mL5-Ybe71cLVbzrCEFIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: eQKoOthRTnK7C0TCVVE2MnPWVmeIJCQn
X-Proofpoint-GUID: eQKoOthRTnK7C0TCVVE2MnPWVmeIJCQn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyOCBTYWx0ZWRfX8Wugkowxh6Qz
 yY495B83kiZT6gEw3uYzJuURjLWHDl4aasJUdu76Q7A3zwd0fbCESDH2PU7q6vC17zyqwcKR/FR
 Xf5BnmEpwZ4F+9XL4+PJCH6AOPcDi0wfjWIIreqof+pa+U06HIPHu0Ey034DzlN7EU5C3k3lmV0
 OMZVfHw6Bx42VIMdInVZEKQQ9D6z1VwUf9tdtPumQaamDM/ueMQR7oJknD9BzUbJ7iybIUO56Ww
 9ex1mQKL0JyZih3YGeRGkuaaWOHfQpIW0dCXJYNJQJvjAKmIrnrQpaZ5X19qURv4kz6P2ss6JEU
 /LlQ4mVsVmnychNXxs5VE/LUQV7x5GmIpvyT1WDuPIMRlmHAw/bTobeo/vY0TlBoFCRW2h2rROu
 0y4BoiArF/VV/DQoLuV8+sr5Cht5wuFp3Uj/NbvBugP2BCZlG8v/y+HDMVFoDDk5eGFTKFk7JzL
 hzB9akDGAddh6RJK2RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_151530_682286_5144FF79 
X-CRM114-Status: GOOD (  23.65  )
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

Currently the board file for Nokia 770 creates dummy software nodes not
attached in any way to the actual GPIO controller devices and uses the
fact that GPIOLIB matching swnode's name to the GPIO chip's label during
software node lookup. This behavior is wrong and we want to remove it.
To that end, we need to first convert all existing users to creating
actual fwnode links.

Create real software nodes for GPIO controllers on OMAP16xx and
reference them from the software nodes in the nokia board file.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/board-nokia770.c | 30 +++++-------------------------
 arch/arm/mach-omap1/common.h         |  3 +++
 arch/arm/mach-omap1/gpio16xx.c       | 28 +++++++++++++++++++++++++++-
 3 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index a5bf5554800fe17b430e84ae421ffa8da2bb11a0..46f817f6316b70ff37bb9dfde86c675fd692999b 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -36,25 +36,6 @@
 #include "clock.h"
 #include "mmc.h"
 
-static const struct software_node nokia770_mpuio_gpiochip_node = {
-	.name = "mpuio",
-};
-
-static const struct software_node nokia770_gpiochip1_node = {
-	.name = "gpio-0-15",
-};
-
-static const struct software_node nokia770_gpiochip2_node = {
-	.name = "gpio-16-31",
-};
-
-static const struct software_node *nokia770_gpiochip_nodes[] = {
-	&nokia770_mpuio_gpiochip_node,
-	&nokia770_gpiochip1_node,
-	&nokia770_gpiochip2_node,
-	NULL
-};
-
 #define ADS7846_PENDOWN_GPIO	15
 
 static const unsigned int nokia770_keymap[] = {
@@ -112,7 +93,7 @@ static const struct omap_lcd_config nokia770_lcd_config __initconst = {
 };
 
 static const struct property_entry nokia770_mipid_props[] = {
-	PROPERTY_ENTRY_GPIO("reset-gpios", &nokia770_gpiochip1_node,
+	PROPERTY_ENTRY_GPIO("reset-gpios", &omap16xx_gpio1_swnode,
 			    13, GPIO_ACTIVE_LOW),
 	{ }
 };
@@ -138,7 +119,7 @@ static const struct property_entry nokia770_ads7846_props[] = {
 	PROPERTY_ENTRY_U16("ti,x-plate-ohms", 180),
 	PROPERTY_ENTRY_U16("ti,debounce-tol", 3),
 	PROPERTY_ENTRY_U16("ti,debounce-rep", 1),
-	PROPERTY_ENTRY_GPIO("pendown-gpios", &nokia770_gpiochip1_node,
+	PROPERTY_ENTRY_GPIO("pendown-gpios", &omap16xx_gpio1_swnode,
 			    ADS7846_PENDOWN_GPIO, GPIO_ACTIVE_LOW),
 	{ }
 };
@@ -225,9 +206,9 @@ static inline void nokia770_mmc_init(void)
 #if IS_ENABLED(CONFIG_I2C_CBUS_GPIO)
 
 static const struct software_node_ref_args nokia770_cbus_gpio_refs[] = {
-	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 9, 0),
-	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 10, 0),
-	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 11, 0),
+	SOFTWARE_NODE_REFERENCE(&omap16xx_mpu_gpio_swnode, 9, 0),
+	SOFTWARE_NODE_REFERENCE(&omap16xx_mpu_gpio_swnode, 10, 0),
+	SOFTWARE_NODE_REFERENCE(&omap16xx_mpu_gpio_swnode, 11, 0),
 };
 
 static const struct property_entry nokia770_cbus_props[] = {
@@ -318,7 +299,6 @@ static void __init omap_nokia770_init(void)
 	/* Unmask SleepX signal */
 	omap_writew((omap_readw(0xfffb5004) & ~2), 0xfffb5004);
 
-	software_node_register_node_group(nokia770_gpiochip_nodes);
 	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
 
 	gpiod_add_lookup_table(&nokia770_irq_gpio_table);
diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
index 7a7c3d9eb84a06c18fbc70e7c94a161b487cd002..c0f6e231fdb4422c5d2c1aa3e33dd6dd99d2710e 100644
--- a/arch/arm/mach-omap1/common.h
+++ b/arch/arm/mach-omap1/common.h
@@ -35,6 +35,9 @@
 #include "soc.h"
 #include "i2c.h"
 
+extern const struct software_node omap16xx_mpu_gpio_swnode;
+extern const struct software_node omap16xx_gpio1_swnode;
+
 #ifdef CONFIG_OMAP_SERIAL_WAKE
 int omap_serial_wakeup_init(void);
 #else
diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index 55acec22fef4e73f20935473602ef6cb2f4f379c..e371183e0213912ebfa7edd34ca7e7683869ab12 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/platform_data/gpio-omap.h>
+#include <linux/property.h>
 #include <linux/soc/ti/omap1-io.h>
 
 #include "hardware.h"
@@ -55,6 +56,8 @@ static struct omap_gpio_platform_data omap16xx_mpu_gpio_config = {
 	.regs                   = &omap16xx_mpuio_regs,
 };
 
+const struct software_node omap16xx_mpu_gpio_swnode = { };
+
 static struct platform_device omap16xx_mpu_gpio = {
 	.name           = "omap_gpio",
 	.id             = 0,
@@ -99,6 +102,8 @@ static struct omap_gpio_platform_data omap16xx_gpio1_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+const struct software_node omap16xx_gpio1_swnode = { };
+
 static struct platform_device omap16xx_gpio1 = {
 	.name           = "omap_gpio",
 	.id             = 1,
@@ -122,6 +127,8 @@ static struct resource omap16xx_gpio2_resources[] = {
 	},
 };
 
+static const struct software_node omap16xx_gpio2_swnode = { };
+
 static struct omap_gpio_platform_data omap16xx_gpio2_config = {
 	.bank_width		= 16,
 	.regs                   = &omap16xx_gpio_regs,
@@ -155,6 +162,8 @@ static struct omap_gpio_platform_data omap16xx_gpio3_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+static const struct software_node omap16xx_gpio3_swnode = { };
+
 static struct platform_device omap16xx_gpio3 = {
 	.name           = "omap_gpio",
 	.id             = 3,
@@ -183,6 +192,8 @@ static struct omap_gpio_platform_data omap16xx_gpio4_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+static const struct software_node omap16xx_gpio4_swnode = { };
+
 static struct platform_device omap16xx_gpio4 = {
 	.name           = "omap_gpio",
 	.id             = 4,
@@ -201,6 +212,14 @@ static struct platform_device *omap16xx_gpio_dev[] __initdata = {
 	&omap16xx_gpio4,
 };
 
+static const struct software_node *omap16xx_gpio_swnodes[] __initconst = {
+	&omap16xx_mpu_gpio_swnode,
+	&omap16xx_gpio1_swnode,
+	&omap16xx_gpio2_swnode,
+	&omap16xx_gpio3_swnode,
+	&omap16xx_gpio4_swnode,
+};
+
 /*
  * omap16xx_gpio_init needs to be done before
  * machine_init functions access gpio APIs.
@@ -208,7 +227,7 @@ static struct platform_device *omap16xx_gpio_dev[] __initdata = {
  */
 static int __init omap16xx_gpio_init(void)
 {
-	int i;
+	int i, ret;
 	void __iomem *base;
 	struct resource *res;
 	struct platform_device *pdev;
@@ -244,6 +263,13 @@ static int __init omap16xx_gpio_init(void)
 		iounmap(base);
 
 		platform_device_register(omap16xx_gpio_dev[i]);
+
+		ret = device_add_software_node(&omap16xx_gpio_dev[i]->dev,
+					       omap16xx_gpio_swnodes[i]);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to add software node.\n");
+			return ret;
+		}
 	}
 
 	return 0;

-- 
2.47.3


