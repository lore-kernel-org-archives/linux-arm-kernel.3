Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465A2FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8BXF30rYIbp1AFSMQS7md7DuGRyYvVsJVET8/FPU4oo=; b=f+TA+jsDzSiquy
	GzlJJoo34gKtCUrQ39g421RE20KRGL/a5ZYhCKxtvoPGkPJhI6KUPhiGXv9rwRoXqqjbV2gxujHHh
	3J3GR6ZqUCPnxrbutFa8/ctU0SEumTPVlrpeTzUBwzXBYGhLbx5geUNpY9xH9WoHsd5QGk5n/cZOD
	g/BcGFJ9VM/+QojzzOBN6UC1wYRDCTbnJdpCfRTF9JSaV3zIX3RNUFu5eX12G1R4X2fnXlLdgGtWc
	84f6FRzDCXCiyl2S/POYuGRQL6jUgUuKwa+E2gXhL1f6uqsW5M9g8XZWrEfleQ149n+INDn/L8ppC
	/84zfvzfxFOgiC+2uj+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJUP-0000000GiZX-2PK8;
	Mon, 27 Apr 2026 10:46:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJUM-0000000GiYs-42sy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:46:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TEQ4665693
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8BXF30rYIbp1AFSMQS7md7
	DuGRyYvVsJVET8/FPU4oo=; b=Ry9QQjobYnoN0yZY5QYzJCvfP/8S9zvBWQgLlt
	n/nvl3ogvZPaWQAnVYq0nGzk5jd8SNKIqudewE8X0wuzGnpgNZzLuR4Gh+v0K24M
	1ndKEvpi2U7IAjllwV/UC3Fdatt0vjl42rORzQBNAxqG5A8Pn9EYi/koproGgaCt
	+J993EA6pDClMijoH7uMnjlr/4LXIxBcC9VJuDvAEYfbGsHYhUMTfEpAXBxK1V8t
	t7eD4bFeJTf8acCGTr7QKj+VUaPt8N7LvILZTWXwnHrPiIge0aype5VmPfsdqZyd
	U5GRBs2zdMvNr2tZusNcJafAm8vijDkLTvhR0jABSMv2iz1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n10j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:46:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso268062411cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777286813; x=1777891613; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BXF30rYIbp1AFSMQS7md7DuGRyYvVsJVET8/FPU4oo=;
        b=Toc3ujgycPwtJoT3Rhg1zhPGYbl8PMvRz04PGtGRtyGmPC4/dopcG339q26FpRxw59
         rm3epFDr8EgNlSj8BoV/YSHISV8o2veRRuntHs0YvpPWKcopmtT9MnExejndLBcBYb2u
         /Xouxfj74W7IPDEb3gD2w4ZGC3UoZnZSkyS/bX3qGYTci3VyPEfmtfMWed1gUfDcbzkD
         +0C9WMq9g2ZExi9CWaSIV9fXfdj2Lev9Hf7Fj8gTijvYRaKi9ZcuFjZ2DcRYnbOq7j4T
         DUGEeiZ979rZTE96L3I/Iw3s1CTlP7awvzPpsaJsC/mBgD4zJXhbR4092tzqMhGfrGcI
         VW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286813; x=1777891613;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BXF30rYIbp1AFSMQS7md7DuGRyYvVsJVET8/FPU4oo=;
        b=V72HQJ5/HkJ7lZ7BQ2aqMV8Y0b8G1QQVoell7eoex7oQI7xvz2ve62KCPEPQOe2CMh
         PGHC5CdmUsKlJ1TOS7my+6McMiK9OdfX66vwXhfDZ4z3o3kqmhmYd3U+zkeVZ6NBwjgO
         MkJOtQv1fK3K4la7/4iUtZLnb3h6DpjJkcxf72EVaspZEea9S7Q+yn6CbDw5y2u5ZpTt
         uZE0EUOwgjyrSNJKgyU2qTW5BZI9TlHT+z8rJcSmMT/lsbBjzHjF+afxXfTmEcS882NB
         ja63ocUVgNcjxSuX9A4umnUAJfgWLB6Jz8+766Z0Ybwjlf6AXmiA9NIKaHuDZ3I4ukih
         a+lQ==
X-Forwarded-Encrypted: i=1; AFNElJ/s+mek3EoMeoKi8LNALRmbEE59AXW2mZjQaEnS1fKi0NGGM2s8QnpI8rMGZRyORJp3y3SEZrnWg/y2U6zZcov0@lists.infradead.org
X-Gm-Message-State: AOJu0YxgygP2jTjF11wdIyL4Qy0ko+VTTLSgBYuecNwmeICQHifVP3Bx
	7S4cOAZUeBNcI0iAVKBW0olA5V2Aofjinf5Fn2OIGs9s2jconCZxjWULipDt3lNlwOUYqK1A/rc
	9BpdQ47A+UGWnFoW1kurD8h2azBdAP2TWre914VIRp82cAGfCWUKTrEK18PnLE6ESRT4WKF/0IX
	MDfg==
X-Gm-Gg: AeBDievwfufqK72pHobIIXsPZa1kZ7bCySdv0IMJ+lJc4JAXi8yjgKq4HIRFexu4XjF
	5SQZkjVMlmhUvnH6rRPeW+NKhg2CfCtMuxXVOInmIus+8I6xVYn2M8bmlJAjgxJOkY0CRo6YZuk
	6myjEu0vuhyM0EO8oyo76YS7jRkEyB6PIyeFxJ3ZGDjk0KXVu3uz2AlNOboi0HBheXVq92GQBEL
	2IegBTUkU5fnRlEW4YvmL8XluWqyuRruLGQMWlXNISMnHGF7hzPqtm9uAyvD2ZrZ88XUTNfcNn3
	8J9ymsu430z/9WnazitpQudDXOgLfXLZEIeF9Vkd6WKQc+0NhujThhpz5LFhEPC5Z0YdXqVj+Jk
	Fzhr/QS2XXq/RuhSr6XVsPXmRJytrbnT+89XTI/vWunJKGbvbeM3vu8ZiiR44TQ==
X-Received: by 2002:ac8:5790:0:b0:50d:8cad:2381 with SMTP id d75a77b69052e-50e36f18d42mr627543451cf.54.1777286812903;
        Mon, 27 Apr 2026 03:46:52 -0700 (PDT)
X-Received: by 2002:ac8:5790:0:b0:50d:8cad:2381 with SMTP id d75a77b69052e-50e36f18d42mr627543071cf.54.1777286812430;
        Mon, 27 Apr 2026 03:46:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm80353681f8f.13.2026.04.27.03.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:46:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 0/3] ARM: omap1: use real firmware node lookup for GPIOs
 on Nokia 770
Date: Mon, 27 Apr 2026 12:46:31 +0200
Message-Id: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIc+72kC/4XNSw7CIBCA4as0rKUhPIsr72Fc0ILtRIUKipqmd
 5d240bjZpJ/kvlmQslFcAltqwlFlyFB8CXkpkLdYHzvMNjSiBIqCWME+3ACoxTB/QgBp4cP1iU
 srGlaw4Tm0qFyO0Z3hOfq7g+lB0i3EF/rm8yX7T8xc0xwKxuhqdNKWbILKdXXuzl34XKpy0ALn
 MUH44T+wkTBrGLEtsxaqvUXbJ7nN/iScG0OAQAA
X-Change-ID: 20260330-nokia770-gpio-swnodes-5da8ba35946e
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YRML3/4wubgO3BKLVRzWveh6hjcAaWgMYaQc9TCSNb8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7z6PK3nq1haznfGr8//ff9K8BQVl7mgRVhqYj
 +aI9ADMb8KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8+jwAKCRAFnS7L/zaE
 w7nnD/9AMYdqg75oZStvRYC5FCyQ2IE2ivLl2cj1MByL/F7KHa5TAPL4LF8aDOusADUsd4Vgakg
 AJO23vfiElRCFVsqBY5W7BaTdW90nZRPr5zZmhqq9OkKThMiU/K1HF4bBuNP0cGEnep7lW0CoxZ
 6LruRyg4K6P2fDvlzH8u9x31q7g2r42VQsHg8za9Y7mr432v9+xQsUcfMAvZkDAfu+tNt/5+naH
 RQvRICsNPsXsxblDLO+qwLOcwFvoUPeiRfCC2DJaU8anql7CqdHch3QNjwp9q5exov3+I9WMU1O
 OK1HvP27Jso0PH7OPQohRYz2iDnzSvsESBVpVlaPwxXjT9/U+zmdmYiEKPGAHthmRwNWDg29ZB0
 fqV9VcdUVhVAdTAJzPm+Od+4kuBCQcfDTn4y9opqei9iXIr6ox55NItZdV3BSQcxiQSUH+YIUfp
 xDQjfc76y8My1uXMA9ZdZUr7tUkkV1ZCzr4i11EQP8VbL3NfCKmv0s+RVb5OKLuIX6NJmq8lx40
 1vBv1n73Iz36Xu66+PFeckqSSITHNnMfy/TdmjJv0xFBaAqyftoANFjx61rrCCRaQvXluMtVemX
 YmW13Yf615p1HgSgiskOrwLGVkaRMh7LTSMvJ/XnweiMAnK8DDGPXm6XKZdcBHyOgHtTZ7L1e+s
 2ygmuEHqFUOXj6g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNCBTYWx0ZWRfX60fvJj7J28y/
 yp2jhYJJnA80YS9AuGbQjHrkRvKPITGzxxIjzV8+kIV5hsmy7wBYnrU9ML2Z8WW2vl0OQCS0hym
 xLkoJGjeuOl7aQMJ58K5igdG8W6NFEp78IiZdwYaucmNjPM+mQZx74JQr2FeZqUOm8PxWHmmPNs
 nOfx1MB//SUNfQegl390YLAkNuH22CEyRYIar08U9gPwol4Ky7Wh+9RPDn2iIsTjLrXrhtiDqFl
 /nluwaW0n76FTfX9xTxs10wvEUpgw4KIYKI6HoV/a+4u7hkxbCtBFP4vM29MQOZQgiMSa1NB8fx
 zkQbQSEwfdF8+HXLK3NTIQPtSZNXIhvSBFduSdxlHSzV3ZhhEb+qZZGH9a4GZNt63qizO5WQfK0
 QtauJcgAzubnXKCqOKpavWlhlSnYio1NmFRdjE/P+LT67Gnv8+DEhbAmiOs4eL9GtooXF9C2m0t
 N75BW8eLJX+A9W3cdYw==
X-Proofpoint-GUID: C5E23YUkeAFkbV3zCZGZJuiaMiWKG7UA
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef3e9d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vccPQ2CF_Qf-qLDx940A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: C5E23YUkeAFkbV3zCZGZJuiaMiWKG7UA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_034655_072430_DB56B27D 
X-CRM114-Status: GOOD (  14.76  )
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

This converts Nokia 770 to using real firmware node lookup for GPIOs by
attaching the software nodes describing GPIO controllers to their target
devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v6:
- Switch to using platform_device_register_full() and pass the software
  node via the swnode field of struct platform_device_info
- Drop driver-core prerequisites from the series
- Rebase on top of v7.1-rc1
- Add patch dropping an unused variable
- Link to v5: https://patch.msgid.link/20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com

Changes in v5:
- Put ksysfs_init() in a separate new header
- Remove software_node_exit() in a separate patch
- Link to v4: https://patch.msgid.link/20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com

Changes in v4:
- Add patches making software nodes available earlier
- Remove stray newline
- Link to v3: https://lore.kernel.org/all/20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com/

Changes in v3:
- fix references to the MPU node

Changes in v2:
- fix build with CONFIG_I2C_CBUS_GPIO
- only export the two symbols that are actually required by the nokia
  board file

---
Bartosz Golaszewski (3):
      ARM: omap1: drop unused variable from omap16xx_gpio_init()
      ARM: omap1: use platform_device_register_full() for GPIO devices on OMAP 16xx
      ARM: omap1: enable real software node lookup of GPIOs on Nokia 770

 arch/arm/mach-omap1/board-nokia770.c | 30 +++-----------
 arch/arm/mach-omap1/common.h         |  3 ++
 arch/arm/mach-omap1/gpio16xx.c       | 77 ++++++++++++++++++------------------
 3 files changed, 47 insertions(+), 63 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260330-nokia770-gpio-swnodes-5da8ba35946e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


