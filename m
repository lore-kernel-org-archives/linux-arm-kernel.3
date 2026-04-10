Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE76BF44858
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=; b=3+D91r7WsaFgdPSrvlgxMnw547
	LtHIty2nLSTjcKU/dDpNGZ8jcVdyGuMIyBlrj0UjKa2fciTwJIwyMnNMszV46nD2pfW1cggFHwdlp
	Rge8OXz9SH0lrkpCeNLQG0u9OMvSHFl297buUOVZpe4Ha+3rVSFwnscPi0ZUn2eYcFsNj2nwPaN9U
	4wW5VqsaPO+nIuxCmUGt1oJO7ehefghxwptMu3C7xCSTiiPnVYrjsslBygGOqtvTj/Wn5Onva0xSR
	eI30TOTsfIx5+1/Qh83YHAcfMMihSeWr070VwwwF2Qy83bf54Q7lQpvvGewYCq8zVvjbD4D7D2PuL
	7ssHXDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBY1-0000000CHgp-2IzR;
	Fri, 10 Apr 2026 13:05:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXy-0000000CHe0-0Bgg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 13:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=; b=Mjcip4uLxSP0A5nAV7MtV9T87Y
	ErcxvB0CPaJOtsvV7LfrvyM2iEqa+ukstSf+P0jo0AXBPHGCpjCzd9Wa+7Z5Uj37T+BmszUhePA/i
	7ZLJrnbybuSvq1PGQBheecxYHNhG9W/IwPSb7MSBd4g/rgVBYNGkCUA1hvcyKnfXuQCWMyVUUuUiY
	eBvy8nukWa+LmYs6OjDDF68GldexiJNaeTrE4ju6HtUtf9TMFpNm7/hQAk6hF+ioyeobnvQa5DN2q
	PzkJk359kXeIpwPjf7eR4eiJeLVnQKGPKslb0Boz+fmP+nTIp5KuRvZv8gaxuuUGltNLqmCZs8HFp
	TybVaLSA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXu-0000000DXI6-24qs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:05:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA621b017421
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=; b=ZzQizyouKxOj7eUR
	TrKLsJVmCHGzlHU+ObSntif3x+mSaifPmnUzHf9gtI5VkJL8Ab1uQRzun8W2uU7o
	CzDEPHLBdxHjqtuCtBSJ1qxhJqPHk5aebf+u2gXh/cVjaGkJaB8rTJEYQ/+sXgcF
	xTdVWMlwJmSSWvm0PaGE2GuBHU2SeYv4QoZs0pZsCcReMGn9P93C/G9xsfBGVt6d
	3vw2PXX6Yss35zeWSSSVP3uJKEq46EDaexAaSnYtBbiUMEu9YssdFcIJRMwxQfXT
	4c1+GbEbBErMt6L1FSE+2vY1Oph8+2AE25sbdw8LhNSe9MVc/00cRZ8JSis3CW9x
	GD/9tw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j0hf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:05:13 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-68826165bc9so1649009eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826312; x=1776431112; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=;
        b=TeHmB4ZmWYqIzEjLSUYA5lDxxqiyin7W0A9m+ph9ltr/3gx0fJy2jGdqDcDFnUb51m
         yPJYWowWXhJv67BdCtMsWfNNePf4VXBUsAR5mVIzafi9WHcPDSaPpFThHtn3rSnrf34/
         XDqB8Ue+IciU5X14kllcjrhrCjo1DW3yalXEY+WMY644UW8CRbfk9cUwO9AL/QFpKjsy
         lQctktcBvlg0QBd4/6fFie0oe4s/blD09hbk2MKngGegzm+N31dBlj213RsEuhyUDmAb
         nuGJmmh/5mpsAadMbRRPdEhtYI8moo9nXWrxD/GAfRE9VswG46d47TWEKBgg9fSMEr01
         xAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826312; x=1776431112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=;
        b=aOcE7tcZrZgZ4upSovKMo8prKPp67Ju6qPt3ipQ+0IWpwqXnBIPr5fd0U3BzgbN+Au
         jH7GueBVyI39Kqgav/UYgwBTg0e84m+nRroj709PFVF90sz7B5qUTfspNXfC/0TlQEyF
         fJRWHcQTATQXGA4EapKW6yVqGLLqxaLioNn72MRpCsyYlvR75DL1YXlB9s0t1B9DIuAg
         S8Z7Ykm7TUr6HzoAyrVMttb6GvEsYk5h466EgpI9Evq7UAqOT1aHeJqOKAoBxDYNPdXP
         6M3Kx/Tshp4tEgOv1ydZUK387EZXZYnIiiDVfrjc4DM22saUtkh2+GcKmOQ5uXdt5Vye
         c/Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4HFvocLWFfF3EiSWSfLNhU1vCoqU9jbq768ue5GDxd/r/ALySiTm8k3ye+sUeKJ4kyLm1Z7YpqXSzu4PmQ8W@lists.infradead.org
X-Gm-Message-State: AOJu0YygFn9qTS+i3KimpAQs1YG6j5iFEGrt/8zqCawxR3Llq4J0qN2M
	8jm7mlzglk1y2o0Mg5DRNxqEh22Wjnt0kBM3CdQwNCFSyMFJQnfWpwBl+H2nA8G/LdW4KqL3/Sx
	FIsvL+fCr0mhL0FgKCxPZ6SW76k6o4YVIrQ5zzQyAnHD75VAVc8Ve8dh3/qd154yKH/4tRmSzHV
	GUeQ==
X-Gm-Gg: AeBDiev0MsjnfgWHKORtLGWM6Ne3+NpZHyKsGbtJtLqux1fAqYYemh8y+oKteuPo7Xt
	06p9utuy0fsX72ArtThryqI0Y1n7pLysLl2tg1pMIhQoOz7H8OEmfFfSsHm9RrlmoCbAu2sE3tI
	32UE6yun5YF1B3oKRbVQV+R1PJyDKDbTRRTiPxfAtzuTUecE7DOKchzXRdV3VM8Wm7ieARPZdEa
	9wAnTMbtuu4/7kLcq3Km6csiwZtEeMCeP2y016M604/DNpKsbp9zyAIOmpcIj3mHatsOYwFKxFO
	/zlSvObJ5mvHsWynH9Te2g9k5zww4w4XbIGKwAJ9Ibqwcuhc1TFON/cJB//fPZy/tfs/DeyJSd4
	utu+qR6Y1Qpq4ET8z2MpfMTeS9wAh1/PVI9cWgHNuXqmI
X-Received: by 2002:a05:6820:f031:b0:687:6b:9bf0 with SMTP id 006d021491bc7-68be596a68fmr1446326eaf.2.1775826312177;
        Fri, 10 Apr 2026 06:05:12 -0700 (PDT)
X-Received: by 2002:a05:6820:f031:b0:687:6b:9bf0 with SMTP id 006d021491bc7-68be596a68fmr1446257eaf.2.1775826311405;
        Fri, 10 Apr 2026 06:05:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:58 +0200
Subject: [PATCH 3/4] pinctrl: vt8500: Enable compile testing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-pinctrl-testing-v1-3-6f708c855867@oss.qualcomm.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2546;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v1WKkbTNzuGJnWXiDHEXgh523eXI61Yj4tEY2tsMGp8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV7euszaR8Gmdeu5++cpU5XJM5Syz0Pg715P
 yY26qxUHTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1ewAKCRDBN2bmhouD
 18LwD/9YC/NRlFpzIIOUW2EStYSQlD9cd/XeuabDzqY1gNQA8T17aTwNbQq0OH14Z1WMLxlw4Yp
 rsp6yQJuF9mktdynv+cNkpC25n89c4j67EtZPKLwaXxrc33sj5xJwvJyFG3WZvat+oBvT0cR8aN
 NAsQuKLXJq0+wwfHSscLf1an7safGGAV2YtpWFrmnQp01MYGhyLPa5xqieGQkl+sRlahFsHclvL
 fuxNm4+goyCx/WHPto5DeRzq0+qOjcnrHwKKlcc2yQm4BDzCBDv5S5IcwtpONq+RayvW6OH/mJ5
 qcKTv6yh2e5+uD4vjJERFPBeTfCb+pPaRvjaUo0LoiC3vhPOru14i4icXJPDkS0NukIQ/nn0UXl
 ljLdinOe92uAj+qPJlSTPJ7Dthgq04026rrtHNc7iOOKSI2UdBPOL9XR1v3F1KYXCe0pjHQQgXt
 BOyuyO27scgSZu0cr4UyIr5nCaBq7uyvbOtsP+n0Jxi/rq8YNL2+ExePu+aGxDPZmL9H73xgG9v
 tt/OnXPOR1KE371DPwvUXZbzlSNG99fkHTPnmtudI7Q0txM1x75FUkEXoPAdpmQZPcPwnBltiAj
 ONnypah+0Xgn8JpjmGCieqbU/2OyfXEDHs3/fEzwqZjpqxa9gh+Voz3oHvMDG0qjWpQD80BV4Nd
 4NWItbY3Vlp8e0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: fw9phEHrNnl-e_z2HpdtN7yaskaEyEWA
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d8f589 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2GgY1jd2P1PdBW9LpxUA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: fw9phEHrNnl-e_z2HpdtN7yaskaEyEWA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfXzvSBb79w1TAB
 PnDsWtDQA3JHfLCZBzq9/dQQVd9Hs1v9iiNVZWWAUV2QDx4DNSSqWHi5P9KyG0OaLI3bJy4MCbB
 +L47K/F8muaGDIt1RoBM208ymvQiYthIQJADZA5nbLQZbz4fyiKKNi1un+hhDemkQyZ7W766sRv
 XPgBc/d6+/BYemFpHuHpAX4nQjayeh+rG5y+fDw14tHNcDI4ik2Lc1OnzEwNVTz4V1VG+mufSlD
 +RvN4x3rzkqPaAQD19zA/TiJOSJKFgkgxeZopg6b39gRztUefbIUZ52vpx1U8lGNeldN87F1/DS
 5X/8y+BbkmnRvDwkJUSd5F9cTjX04EaHWwnTkwi/Z3F+wPedR6OKNw0T/dRkCP/xganr65Encs0
 UeBLJm9AaagF1d7R7m+meGJqjfDAjSj6EJDN+J+LJZ+aGEnI+wC4e/HqTHqM/gaiy32ItKITm3o
 udVJdQGUmiHY7b2EqmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_140515_481745_947907D3 
X-CRM114-Status: GOOD (  12.97  )
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

Enable compile testing for Realtek pin controller drivers for increased
build and static checkers coverage.  PINCTRL_WMT uses
gpiochip_get_data(), thus needs GPIOLIB.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/Makefile       |  2 +-
 drivers/pinctrl/vt8500/Kconfig | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 9320ffae5f31..78135ee963db 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -97,4 +97,4 @@ obj-y				+= tegra/
 obj-y				+= ti/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_PINCTRL_VISCONTI)	+= visconti/
-obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
+obj-$(CONFIG_PINCTRL_WMT)	+= vt8500/
diff --git a/drivers/pinctrl/vt8500/Kconfig b/drivers/pinctrl/vt8500/Kconfig
index 2ca00b54b7a8..1a40c153a82a 100644
--- a/drivers/pinctrl/vt8500/Kconfig
+++ b/drivers/pinctrl/vt8500/Kconfig
@@ -3,16 +3,17 @@
 # VIA/Wondermedia PINCTRL drivers
 #
 
-if ARCH_VT8500
+if ARCH_VT8500 || COMPILE_TEST
 
 config PINCTRL_WMT
 	bool
 	select PINMUX
 	select GENERIC_PINCONF
+	select GPIOLIB
 
 config PINCTRL_VT8500
 	bool "VIA VT8500 pin controller driver"
-	depends on ARCH_WM8505
+	depends on ARCH_WM8505 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -20,7 +21,7 @@ config PINCTRL_VT8500
 
 config PINCTRL_WM8505
 	bool "Wondermedia WM8505 pin controller driver"
-	depends on ARCH_WM8505
+	depends on ARCH_WM8505 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -28,7 +29,7 @@ config PINCTRL_WM8505
 
 config PINCTRL_WM8650
 	bool "Wondermedia WM8650 pin controller driver"
-	depends on ARCH_WM8505
+	depends on ARCH_WM8505 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -36,7 +37,7 @@ config PINCTRL_WM8650
 
 config PINCTRL_WM8750
 	bool "Wondermedia WM8750 pin controller driver"
-	depends on ARCH_WM8750
+	depends on ARCH_WM8750 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -44,7 +45,7 @@ config PINCTRL_WM8750
 
 config PINCTRL_WM8850
 	bool "Wondermedia WM8850 pin controller driver"
-	depends on ARCH_WM8850
+	depends on ARCH_WM8850 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on

-- 
2.51.0


