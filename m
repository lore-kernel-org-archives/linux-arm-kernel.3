Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FF2F3C245
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7HBaxrO2k4GTWb2jS1UOroFLGj68Wui7NVYAS6ltQjo=; b=sD2tI5eQwX6SX/
	iiriAzezdPSuOZQdk51qf18p8K/1ql9oVETgiVbclehDjDPZWVdMjSH222AxcNMRnqiXs4bP2YYBv
	ESI2hRHT6crJCIEIG6oWWitpRr+hnoBbbxTvprpovuhxpv72LaZlLvsk2OuLQsPyiV9wJcP/2mlLU
	chKpWyVS/bLQCjK2/cNPVQcjTxPJWIv2njQrGkdpKKlX8Pv/OsRPvYigc5ndm0pITck8MJbuaMKxw
	EqY29D42nOsweesehimdVQB0cux1uxwIbEZX/0MO+2MaGIpeBCh5B31YGWRGy2cz5VPELRJ3el7uR
	tgsaSQlbNbsWaAvdcraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZwr-00000007KOt-3hz0;
	Mon, 09 Mar 2026 12:43:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZwo-00000007KOH-45jz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 12:43:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WGSZ3773410
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 12:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7HBaxrO2k4GTWb2jS1UOro
	FLGj68Wui7NVYAS6ltQjo=; b=lqxw9ISY/iilcf4MLQRNereHLgM3TpoHnFNJp+
	zMCdTJcO0wY9pFjfguyEEnwtK8va3Vsg2ua4IqpzpofAJhUtSYORY7zBiO8LVlzc
	sJqbM0Py3KhePLPFbw5voFB7ISFF0rz/NrPhfkfCmuRTvh4g6UPGQvSVEZYWmGkx
	DfNQmaug/64RokxxpAzH8Q9jMf+tMCDpHkpmLzPZO7ZBsOa0wYKPgOqLVymXBqEn
	mnf1cHjTg1D7iYF57ucmtMD+aGxqqNEVXo6WgGC5gxmM+qdaVQA2QzR2BGY2ftQX
	s5dSt/+W2jjenPz2VhfvDog++ZmtREB540envEBILqbTq1mQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8uq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 12:42:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd83cfb36cso885209185a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 05:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060177; x=1773664977; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7HBaxrO2k4GTWb2jS1UOroFLGj68Wui7NVYAS6ltQjo=;
        b=C/67uRUrUlq495uL9/jvKf+q3ccTm1/06smQI8KQANUJt5EypGi3b2RXGH0pUjWCgY
         icaLWIDQlW70FQgUHQesw9ZY7GOt50eo3ZK3yu+hhxfBhyxvPawaw2Y4dKReaLSe6eUx
         8Fw8wlpiKevCfwLiEEWkaBjnTZUxPnDk9PnXC/hthvd2WTJ8U8EfuWMjr9wEUZS+JBMF
         uy48BLWuJzzKEtniioFpf036X7VUHOKjQVmrIAUVVE9eUISpWgzjVTUAv/eZtclPbzPB
         pu0rcbEQV/AMjjj6kDtVD0tfwMhr3AMoFKsY0FDVrCqU3vYHTVnPI/g9DGd6VzQecbPM
         kywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060177; x=1773664977;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HBaxrO2k4GTWb2jS1UOroFLGj68Wui7NVYAS6ltQjo=;
        b=G3V0wjVwfjrhzx2yUi6dsF48C9RWhC6iRiEz7uHnKtCS7mtVRDo6XbbgQfxgnpYXRr
         9IXh6WGJ0zj9gzjF+AFedw4gX5UBHv1MQUzyJQoQ2N8ObetC934HYZmWNrWbiGN2frFP
         xk9dzmVeIJMlk7FjIMLAjSGUsdRZI+a2iBh0TSJI0Isw+D4kQGVqyJpHF6AFd9ekvKIh
         FBc5r7UtxehnfVzSM44gTaqL/SaBdlpmAyDZUIPl20EuayUdYsaV822RyJE1/VjVS34T
         LZYNCWMF89RuYVK0jNmog/2MvBOH1EcO07NkqB/quTq/T/jvWgPnV0/WKPdTimaSECvQ
         KhMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY7+V9CVkNiuo6ctrTX7cDhwpNGFVekJqwuNlFGFUhy8K2gqshzAEeqln1vwj7pF9ax3CvYAMt4p5z0i4t9LoR@lists.infradead.org
X-Gm-Message-State: AOJu0YzwekkhJGdP9lH7hGrudZ8vhl9ziCiqgu2AeGoxlBU3uextoO6m
	hQc4KyWHemVlo1Z6bZT9Rs9Q88Cz8QMAWQpwK7Z8b7zGke4IqNzix75dl/ivN8OMEozJVMXhtG/
	RRFFtr9Ovr2H20GdZ08IU73yIP3W3yq6Zxr1DvC+/+f3P44OvVt4cvpIp1CjLZ8t4Y5qcsuwYuP
	FmkA==
X-Gm-Gg: ATEYQzyIj9zi7DC5b0Gtt5MaTbstlL6M+gLGfw6uVQ0IF6J/exYMqjWbU+S7pmDw2O8
	lRs+lO+5AI1BLQlWg0+i6YxvfWkdpFMSl4v6CNTPDl49s5+ZkN23pQHdPVkfTB5VPmBoQ6amJxO
	YkgTZzF0Oiw17CRncgJv5vDDICppwYjMDKFbXlhXY6ufSav3YjHYhKbH851NPecgymWaEQqwdcW
	5elxy8//bGOSKbrfSDfsEwb2iXwqwCfgapqH5OOoUsHN62Eumu4CRpktSKrYU2jTLu1q8HLqy65
	5ou95JiyOD1mpHdFOpxtlk7P/MZG7dl08lKuKeFeejsbjTeQIhPCiEotcylTD8wLKA86BmpeuK7
	f2vRlzTG+jebNpsPdZHPmFoFFrO0azqlTNWRVjh2o8Erh+xjP8dRZ
X-Received: by 2002:a05:620a:4046:b0:8cb:4a64:f482 with SMTP id af79cd13be357-8cd6d34ab0dmr1378439885a.18.1773060176737;
        Mon, 09 Mar 2026 05:42:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4046:b0:8cb:4a64:f482 with SMTP id af79cd13be357-8cd6d34ab0dmr1378436285a.18.1773060176243;
        Mon, 09 Mar 2026 05:42:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:494a:62d9:d95b:cb98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm107803345e9.8.2026.03.09.05.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:42:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/6] gpiolib: unify gpio-hog code
Date: Mon, 09 Mar 2026 13:42:36 +0100
Message-Id: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD3ArmkC/2WNwQ6CMBBEf4Xs2SVtgRI8+R+GA9ACmwgLraKG9
 N+tePQyyZtk3uzgrSPr4Zzs4OxGnniOoE4JdGMzDxbJRAYllBZK5TgsxDjygP1zZmOxzXVTZLL
 SqsggrhZne3odxmsdeSR/Z/c+Djb5bX+uTBR/rk2iwKo0pel12xpZXtj7dH00t46nKY0BdQjhA
 9K2p1O1AAAA
X-Change-ID: 20260224-gpio-hog-fwnode-b46a53196253
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xj0gmt0RexpVsqfhALjHcAJE7cfbo9jtVd+NFBum06o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBprsBB1aZLZwdS1DQIku31HGfa2MoNhnTpMGzZb
 JLRFop2WcWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaa7AQQAKCRAFnS7L/zaE
 w+UjD/0ccqlsrSqJu19sPl9xke01einnbpk5+JXINWT54AT2zeHBzHoVQRUkJPxP5iQARZVWUHl
 Ci05G7NvTTpYWQMEbHTKW9mhnCb08ULMAoxCtHR8CFDpOI7xtHKpXjPOaynWMqp9iu5Rsf/34Sc
 asB5k1ehZRzwOh1q+4NQMiYnkuosvGPo6xa2gQkUF75C2lRMUNFDnovS80kjYAt7VBVDzsxnaWo
 PnqrSNRzPKs3TajFTDqc7o3h+QBCMJag4D8vTlIUls/+A9LZ9otxftRgd7p4U2iWvMsdKaBKBX1
 kYWNcRQBX4waH/POSwSRgiXF6LvUuX3gyCELFpxCZmoMNTk97mKIRCE7tFjAiU/FgcrZdceNh4N
 M1lUcY8gTFLLfit52BTuJl3cNuca6HaoA2ptkX6vH3UrHoUWWVE0DMVSgakeZMK8JKE7pN7sG0o
 G90n1LhL9vq/DXJrQoWA71yModHPyQbyWOT8IK7MIOfD3qAmGGbFLGkc83Oi0+D5gU4wZufn8xC
 gSQ1TaX9/M4nIYkl5fhrj8NGlo1bjkGzB57FGB0SIOOs/mdt9AGrHG+KBttYziGAwSJa9YIfYuV
 2zzHgpwsCSpCe/eU3lRRm/ZusPTgG8DJNgxZdPcfVRGhgMPakNTVv7N8Hn30of52SzijfW90DEo
 0WuNsgl4p5SjZtw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: zo5xaEb9MNOMHG7ZN42Y81FF48vEPlzz
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aec051 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=KhiCW88sooxdVpxl3PQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX8WRu2bvZ/jTQ
 vwKpjQN2F7U7o2pkVmjbOF5wazmGQgynW/H738Och1Lng+D8Ac/pbQu5rMmSbHUiOv0cs7Cvba2
 G+oa490Y0t0MhDK/0GLqIzozeC9XcgFLaDKBJQHVBm65NrAfYZJiNUa7p5zFncNV0UQKHovfgRO
 jGY5W0/Tzk5s+se4ZFgIQ41o3gjCtpW14nHoVgfj1LwAPyyBUuarZaN+1mWpff6Zqrw/2IQ/h31
 dVhNZgp5V8WTsai+bdc0V2rt0LlsWJFDhjT0MFn5MlPtzenIgLr7erLUDLLRQ+whvmVvkm/Uz2h
 Yq0PkB9zZS2jbPmcIYO70UHUYNnN1jTqIy+8DXmvuzP4rD5Q9AIU+CNLDs4r7bASiVIcHWmrCcu
 Z8CgKQ4fQKSL6UIeYLb/Z8mqudr5OHSZh29e1PZ5iE05qUnkHG9cxGr7BboKsImUttpb5Qe+YYN
 e2c+6Fc+5uzESSamW3g==
X-Proofpoint-ORIG-GUID: zo5xaEb9MNOMHG7ZN42Y81FF48vEPlzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_054259_165497_8F10A34F 
X-CRM114-Status: GOOD (  19.45  )
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

GPIO hogs are handled separately in three places: for OF, ACPI and
machine lookup. In addition hogs cannot be set up using software nodes.
A lot of that code is actually redundant and - except for some special
handling of OF nodes - can be unified in one place.

This series moves hogging into GPIO core and bases it on fwnode API
(with a single helper from OF to translate devicetree properties into
lookup flags), converts the two remaining users of machine hogs to using
software node approach and removes machine hog support entirely. In
addition, there's a patch extending the configurability of gpio-sim now
that it uses software nodes for hogs.

For merging: I think this should go through the GPIO tree with an Ack
from OMAP1 maintainers.

Even with the new feature for gpio-sim, this series still removes twice
the number of lines, it adds.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- reduce the leakage of OF APIs into GPIO core by replacing
  of_phandle_args with fwnode_reference_args
- fix return value check in patch 2/6
- shrink code in patch 2/6
- don't allow #gpio-cells to be 0
- extend commit message of patch 6/6 to explain the need for this new
  feature
- Link to v1: https://patch.msgid.link/20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com

---
Bartosz Golaszewski (6):
      gpio: of: clear OF_POPULATED on hog nodes in remove path
      gpio: move hogs into GPIO core
      gpio: sim: use fwnode-based GPIO hogs
      ARM: omap1: ams-delta: convert GPIO hogs to using firmware nodes
      gpio: remove machine hogs
      gpio: sim: allow to define the active-low setting of a simulated hog

 Documentation/driver-api/gpio/board.rst |  16 ---
 arch/arm/mach-omap1/board-ams-delta.c   |  32 ++++-
 drivers/gpio/gpio-sim.c                 | 200 +++++++++++++++-----------------
 drivers/gpio/gpiolib-acpi-core.c        |  70 -----------
 drivers/gpio/gpiolib-of.c               | 152 ++++--------------------
 drivers/gpio/gpiolib-of.h               |  10 ++
 drivers/gpio/gpiolib.c                  | 137 +++++++++++++---------
 drivers/gpio/gpiolib.h                  |   3 +
 include/linux/gpio/machine.h            |  33 ------
 9 files changed, 238 insertions(+), 415 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260224-gpio-hog-fwnode-b46a53196253

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


