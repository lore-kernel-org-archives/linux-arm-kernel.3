Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB39FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqnqCn4cZXyDxg7HbQo5XVyJJlrveywBJsp1i/ba6n8=; b=dX8Ocnc/29jxJAiHxGhTQJTg0k
	RADVX6upvCAoEV0iHOKePrsObw/HUlsUzSbiKoG4GL38SjxRC2qm4bKicrZEggNslpBS1CXe/X6x/
	VD0fJEL3DJIi+bu666X8MxebXrW9Y2aZ8R/ACLpSeVjO9lVkyWCQZPfrhEHm+hH/SR9HCmVTzr+VK
	Z5N03svID0t+msRfEs4VCOuroI+jW5yHeShpiEdWQGILsLBOaXETuRMsNxWcKy0FPu0Jn+J9KneEC
	8e+ZJru4cWVSeBriVCeeeXjkLl0lXhVHodot4yMxhRkPAY604SOim4QaGu4zjS95Z5z3xL83TfeVa
	bv8U5THQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIzT-0000000GfT5-0De7;
	Mon, 27 Apr 2026 10:14:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIzP-0000000GfRW-0GFZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:14:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TEL5665693
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wqnqCn4cZXyDxg7HbQo5XVyJJlrveywBJsp1i/ba6n8=; b=NaZcWdoelHhp1r7D
	WDMFSc6GlXXs5lAv4cEi8KDVwqr7V8hoif2ShF38/mcY4yHT2k95AOGKZs44R9kw
	NsaKguoWV5UPUijKZbZbv3M0kuUTnAcybYi4AI1gan18Glkx8+mxnNjlqfy7ZPJ5
	k84sAc/ZRXemxIc4ZolG6zJOJJGRUiaCl9pv2MBNYAP8iQaF96tFh+1xouQIJvWv
	kh8ErIpsBxnEXg3Lb3NBJkOmhk0MnUYYKkuNyLXGwpkkjjS3TsHBEvJvoHP4iWDU
	em6kkDL6kJ2IPJEk/1pAqbmwM4nnrsko9BvJvgJoLEadn43VK4UQPdKUy3ABT09R
	T/T2Dw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0w2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:14:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fcdd579e1so73987091cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284893; x=1777889693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqnqCn4cZXyDxg7HbQo5XVyJJlrveywBJsp1i/ba6n8=;
        b=QFfbTenxmcVVKvWf9YkbInoptRhrdZjORD0ExV9IBzaZcir+0UbJOJb04uhKWe6sXV
         reXGz7FGhEAdK/AD1xgnnN6YNmodH/bq3d/TpgHU3EoPKlj7gXwgo2uNvR6CR/ofTUHd
         LgkWcpPi0WaeZkvh+nIQt+YaAYyWDRgcyEQ9CfGZOBehtqPphRGtVNInVar+BApYG+Dl
         7/uKfCp8daVsSVb91dK5WI3RdvVn0GIwvR7edhoIteoPDJ02OMEGXdfjquyTDpriA1Jw
         ifSpXKWxlCZkL4o3pIoJ8ZcXi4qCqxLvQV9voQOFrzMyu13Yf20cV/MYX0vW3huxwFgw
         b14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284893; x=1777889693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wqnqCn4cZXyDxg7HbQo5XVyJJlrveywBJsp1i/ba6n8=;
        b=C80ITf3nr6nhLKFrUFUgHVDpJn0t7mHpqJMfXtndVkpahB+UmcIwE14MZHvzsd1fhd
         8YQ4UYDLbO0g+y8jcw+E24c/klou0uO3uWy7HCKdP3wmfQTQhDlBQzunFUHtz4t96Jp1
         kwvuPuYX1Pcck19yUn0PzTYcaU1Tdq6ZscWzJ3SY9+zbtO45linEWT+hmHpM8CcEaoJw
         oV64ZpV2wWCP5ua7KH4plEp3OfLy8AsdO3rWxYlbfXULvccf6MwKWAsC9ntvXCkn5YX3
         GTmplvjGPH9X0EknuKTeDx7+EHViJWmMLA4sFI4XnipfG7gFh4Kxin6Re0uA8bhcHgEn
         /OvA==
X-Forwarded-Encrypted: i=1; AFNElJ+y88qos0DjjOh12d5bz7kFD+RuZclIdt0TQBAjf11KXaCyfwiiRJLjRZZIxT9t13X5tdDdnu5bCJbqmHROxP5l@lists.infradead.org
X-Gm-Message-State: AOJu0YwoMTOL/8EngnQ9/B8Sm9gd4Pm0H+oRR9NK/XpvrCiwfmtxotJT
	S++3QdBsNJNMfqvx450+Ad9xFKQEgL76WlNWeKgH+vVEL2zgupfxBXfuMyxldzlZoM/NdCYD5Fp
	A8ByLuKqj2P3icpA7u/XAKhAYCcqRwFRy9QYdsZAXAO5bW7/74zbk3pSi7y5+lPo5KTjz+9JsxG
	f+2pmiFbC5lQ==
X-Gm-Gg: AeBDievM0M8T+AdTwkhpcaL7qrYnMLusINV7DBXxukXvzHg34EFq3QS1sk0PmBedHta
	EuT4LVoQ2H/Lk588mhvep51vo9a3j7CrNQmjAnMTOtm+QDLRSiz6io0q0jbzu3XCVSX0x1CfKmB
	2s82gpFrlSqT8cK6nAm+gJoi7FSbU+QICcI5Ib5iB9w7HdHsqz0f5W1aScBXcFZNFbkWK9DzyHe
	0eBLCSRDtaIH4vZHro/1VGHgAMg2mIFbsWBxsZb1xVSpSXIrcntgtNc+smhymHlw0p/pJdCs+uO
	K8SWPsSn5Mq5yr5Ic2j4aKdXtG44Gs01MMeloUbI90jQlf7JXGDsI4n9F644t73YjcK5phnEyu0
	IJoFdpjxxu2avQvG8Ij+40VCP8YDQwnoYX7WTYSFwilfpWO9UJ6zrBIIyNd1aAw==
X-Received: by 2002:a05:622a:60d:b0:50d:819f:e7bd with SMTP id d75a77b69052e-50e3681f0b2mr623923351cf.4.1777284893120;
        Mon, 27 Apr 2026 03:14:53 -0700 (PDT)
X-Received: by 2002:a05:622a:60d:b0:50d:819f:e7bd with SMTP id d75a77b69052e-50e3681f0b2mr623923051cf.4.1777284892702;
        Mon, 27 Apr 2026 03:14:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm235103445e9.5.2026.04.27.03.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:14:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:14:32 +0200
Subject: [PATCH v2 1/4] ARM: pxa: statify platform device definitions in
 spitz board file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pxa-gpio-swnodes-v2-1-86fc24b9e714@oss.qualcomm.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gZ8HxVxR6CO/QMlFwEJ8NsLYc1VojMlajTKt3lIExak=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7zcT1ZX+q7okdWU8iseN3wCyeo8KZNdef2p9l
 VbPp8bCEIOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae83EwAKCRAFnS7L/zaE
 w4kGD/4+d8ojwTOZYDVt3UZ+VY76Tk/37KPy01+TvO43/5ifB26tZ90bT8gcnggAm0mZt5m0rJm
 r768JDv+cYcdp4OOos/7Z+tTMNycJvuWNIKndVbpQOddhMBDg4ITMblRkvKYxCHvrWJQ5JFQPln
 g9esaeZJLbdGkfnl1WId1iMIhL/wtEdbJJzduW1xpJ9gJ57SoJImXz/SXV14hYEpzUMoVK1OgRT
 jlRJQWBar0fxaEIPEiOQuZ0c23ReBS+ib47+Pyc0QXgC7LDaALJ5n8VBPDROR82ci1/QqAGVXCO
 X0x0egS5hK3z555D03Kg5L7ee0yoKGa0amFhprcMGBll/n0OdcAx2PPLrw23ydPD9ZrHOEf8V+a
 uxQqlASbyungRW4PZFPo+eFhPWKMyI/gJBb3WeqLG4EvH+pweLeIchQcn/6XW+GohFh5jaYcvPM
 RZou/PUGDsVv3JXcXVA+XNLsXrNR+yZb7UInhIgfvY3hR+pjkAVHbMqFCHgDmNFFGveP153rIT6
 55T5DATnpJRH/Yvl+VB7KGMXccIOnBWYH8AJD3n41QNbqhxerRXA3I+AExGLE/3en7exmCIZL25
 9kuXIWiMEDXJ/lk+ZIb2OCn3QufrieOKiIYnuOnKMnwvhWu4NYWhzc19XwgtaIiD1ohCktcS1e+
 UlOkZLe1f1TddOw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfX4EiDD0eewFIA
 h736Pr1f6u9DCknH0/uMP7FTDXjBmrorjhL5puUtHR52XuEPSPOfclz2fYmB1N0MXWIPB8IXcG7
 CY2XVi7Iszaek1ycptt3K0DfY9/rva3ZdiakcXPy8lyqzv3Wt0LiF94nohS/RU5cZSx6hlLxG4r
 LKi0EW3zdcy4SSz6asAqjkm18Lziv9REgTb0KXZoez9yCuDWOh0UoKKYCite15dGD4SVugZgxMC
 cjYdHvYmovO9rRo4zhUciueB6TSe7xXgzz36d2hySeKr6JlpHuk8OSIWPl3TEj+MN4Hm6/ebKET
 skYwX1tvVi8w8j6gScaVVAF7Si5m8eyahL816KLL0s0pf0hwXF4oy+HBb1JKxHXVHQJQegid4kQ
 HXRywyQ+OYwmGalKCoYg+XqMs0xZbVhKcAL1pZYeBa5dlQ4LI59nNZ6cZj3afUsFGJEBcKlSwh9
 RphrhVVUU4ERalSzElw==
X-Proofpoint-GUID: rlze_TNtIlol33U77x-UVYLrzk8wXS2K
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef371e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EpCYgoSSk4DMBEGV6jgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rlze_TNtIlol33U77x-UVYLrzk8wXS2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_031455_109896_8D10CE80 
X-CRM114-Status: GOOD (  18.29  )
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

The scoop devices are not used outside of this board file so make them
static.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/spitz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index c0b1f7e6be87411359b0020257ff12c73bbcbae3..3284b9f62be970555042a7292993e45d56fde47e 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -165,7 +165,7 @@ static struct scoop_config spitz_scoop_1_setup = {
 	.gpio_base	= SPITZ_SCP_GPIO_BASE,
 };
 
-struct platform_device spitz_scoop_1_device = {
+static struct platform_device spitz_scoop_1_device = {
 	.name		= "sharp-scoop",
 	.id		= 0,
 	.dev		= {
@@ -192,7 +192,7 @@ static struct scoop_config spitz_scoop_2_setup = {
 	.gpio_base	= SPITZ_SCP2_GPIO_BASE,
 };
 
-struct platform_device spitz_scoop_2_device = {
+static struct platform_device spitz_scoop_2_device = {
 	.name		= "sharp-scoop",
 	.id		= 1,
 	.dev		= {

-- 
2.47.3


