Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBFBEA4FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BPmaMMJCKmfQnceiVQlewfF4pWyv++KTwwJINk8vYA0=; b=Zr75NbUyTjlrjJ
	HNR23puNU6HsqpOrSIZgxJrSeCIz6vBGEwJeuTBPGtgnYuLOyuct14vF6YHVmAGfcokQNjJKiy8fv
	rk0T/+VJcd1MqH1BqAIErDSBOgL8RYmvr5tMkM8M2++gKgQUflkEHx4PjrBjmmtVx+EZG//XDYFR0
	Lex8DIsqVss6A6iai+sn4mXIiUl494qLH4PYu1N3UiE0VoeOrXHtfZEflxJ5BxqMToYEWQlIxUuJZ
	gqm0nekxnP/j8pNkJnLF+A9xvqAVnPZPUX+4InGAwYJvbOtEb4Nd+odnSO+ypQvpltCFx/a+nIsCh
	NWB26v+M7ZIeZuA0F+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8A-00000000NRR-02g7;
	Mon, 23 Feb 2026 13:37:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW87-00000000NQu-2MGK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:37:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2l013151897
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BPmaMMJCKmfQnceiVQlewf
	F4pWyv++KTwwJINk8vYA0=; b=CcS2jH802qsIIJYTQKLEhIrwqr8D1QKbHK9M+T
	NxhhRoqiHcBMxthLUjI2gG+s3u02zEmYYEw3hPWu84AmQv5LKwdjUeO/aQJDNnRt
	1gU3quLKiTnBAl2CbmFg2N1RLGIrJe/y67bseKH0HTHwN4Tkv+Ya9LJ7H3FBu3zG
	jLwxa1mg94Y2zSYcrRiSqUDAytbyJ2rGyQVqCwM70nXfNjdve/RleIsMiOdlIlEa
	eiyzDSo6PlI2/v/6IyLnlj3ysVpPWy2JBNaSZ8lJILOyi554R6ZU393ewSo8AwAw
	AQIB8AowMsjr2ht1polxdbIYWQvs1Rlqi3ufx8cnu6Ek5Zgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8879v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a129cd2so5688046185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853862; x=1772458662; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPmaMMJCKmfQnceiVQlewfF4pWyv++KTwwJINk8vYA0=;
        b=JY52CiK/5fEBd4Q89tG402Myfaqe0r9WowOkiJE7uHLRM7cJsGoy8MXAry6v2febPJ
         LrR+c6kiJxLkkOup0KrhK/pnyA4shTS4n1e2XGBUyOw5/z7ctduxxjp5aq6zCQP4lBOs
         WZyNB1qq3JkZeuMF5yzyQyE5cC8neiOTHmFe44ELdPUPSixfBho57FSS83SP0A8IbV7L
         KnvNuFtjPjgxRLMIokfZSfVPuSlen/Y0GJb5iNTCOwouLFSU0rZIIRU/38Jb4ZmdoDSG
         /7UAige50E1mzpqy+6T2Z87uVJgCHakxjyAFEVrFgdZdPUwAL7EbGUg+Kq4hLnXxXyav
         sh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853862; x=1772458662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPmaMMJCKmfQnceiVQlewfF4pWyv++KTwwJINk8vYA0=;
        b=qatV3SD67Y1pv/CoRWMgzgeVf1f6jqOjaPQTpYGSvNcnSsfNb/px9MQ4BwusgmEONn
         YRW9PhqCPw7Pl6o7irvbB9WRENSD/neX5/v7q138NrZKW/qMJUV8Zp3Nq+QRUvMkFSjX
         nNIhxaiEzH95Dk1C0/EkAPuNLrZ2drL3HmIK92Wcf21veRCcRze1fzMmqekO4ni84lSg
         KKZmBXsvVCY9mok15Itm8QFTUC44FQOHOnIBOxzS1EbXl8JsSfocmv7e+w4aTixEcR1x
         pFBhHBRZ3UKRZEB36uqOU80W+OokpXIIV0vYwi50Z+fgzTLmSvflY3vVVAQ5mup+EAWE
         4iPA==
X-Forwarded-Encrypted: i=1; AJvYcCW2LjxaIsuNua4TP5rkQJv+vIEdM+bRjzQCZ6u6biyogx1+I68IOA7FCZetckj4xhXhx6WCFpR2Xow/31lsVkWp@lists.infradead.org
X-Gm-Message-State: AOJu0YwGY7J62GVMAgawzJ0JrUIcblDvVzl5A1ga6O3y72xnkjQSUu2l
	iDJ8UiRrtYar0oIMQ6547fD3ObRtwKQtnhfV0jw4lnvHTtvSOJkIXDGsIUn74/LIUMG/hfp3xKo
	X4Z6pypNjjsUKEzPY7ZRvlOOp3cltOtxGyeoT7o3ybOxpRQwQTG+24cRCZbwVEodTXR7aZMUN+v
	zYYw==
X-Gm-Gg: AZuq6aK6G2a0tBvWGKaYTUauozZmygdYH0XjDHLwAmyC/3kVDpi8/MS4oWyQ6UlW5PG
	Ch33I1OOEvEDvjPQlCqInYU1N24VnmSah81iF3EITerb1nPSVL/VfTDpBd8BN6qiCyWgmVYZOW8
	XLZCr2ENcmCc1nB68I+40GdJQM9iDhDVWucThWVNBCpWdwDvUPejquAf1nUVS4MAT6qPGCfYuTb
	YkLsRZ4kjQPtWuMzKVbJLgS/AqK+HwKNX/t626KCiD47gBVDfLdQEtE5yQKeed7ePPyCGBsbIzR
	I26AkEQcUOZk+MSzJE+/EupJZORMcJLWNA6p5fTrbVsEhpY4qT4SQUkDfIJZWvXceIex7Y+D7vX
	IoBS2TGolgMy4L+jRxngkMlvspiS/hGubeMhSBlWHz/GFXshCmEo=
X-Received: by 2002:a05:620a:a1d6:20b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cb7bfe78eemr1160536185a.31.1771853861882;
        Mon, 23 Feb 2026 05:37:41 -0800 (PST)
X-Received: by 2002:a05:620a:a1d6:20b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cb7bfe78eemr1160534485a.31.1771853861406;
        Mon, 23 Feb 2026 05:37:41 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/9] soc: remove direct accesses to of_root from
 drivers/soc/
Date: Mon, 23 Feb 2026 14:37:15 +0100
Message-Id: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtYnGkC/22MQQ6CMBBFr0Jm7ZC2IgVX3sOwqLWVJsJoBxsN6
 d2trN385P3kvRXYxeAYjtUK0aXAgeYCaleBHc18cxiuhUEJ1Qope2SySB4j0YJa2661h0ZI4aE
 Yj+h8eG+181B4DLxQ/GzxJH/v/06SKHCvjPCmN7q7NCdirp8vc7c0TXUZGHLOX4FjjF2tAAAA
X-Change-ID: 20260119-soc-of-root-77c86c54010f
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8U1qrV9VPbA1NurePpOKrOc1y8Pp0LEFx1aO9DiJBzo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgVUenh9qw3oSpou3F8KSCFXav2bvcRiege3
 sGVJWni6mSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYFQAKCRAFnS7L/zaE
 w5uXD/9yJoDbzqFe8HN69sZX6yHCeFb24ey9/QRxDPVxBDUzo/mC1CmWvU9maHjuUi2DhsZqteY
 vVFK/mvqS21ADpPY9IZMhs9bAmGazA5FS6vLdUNPVB4LEkay288yM5di7NV8q+nibyZUd+hsN7V
 X16nMjmBSYZQcTGiOzDHPBzeSgdWvaMLE3VaEh/A9eFmK4duP55S2ax2luP0asf4iUjas6/ENcc
 kLL8b5IE8GN38bvLejihYDytXYJTc3u1PGWEeZF4cfzmOXpPEd07oJp0xSx8/+OLRylFE69VXH1
 8LAwgPhQSnLbfXneimOOuBt62w9ZnCRFc4hMTIju6Kt4wcigTjzSECjR4kbedSz7coD6p8e7bxj
 CzFz+qCGHaam/FvGnBRN8pDaB4hz0RbNofKeXNlBhJlVpAr0G3X+SYpxc0oHh5sRcSNu2stBssc
 FlqN7icTX1KQnCpSbzrB1rE+vXwxe0uBbzuSj7DaEzGdJmDJXx3ars6mFSunWmWbPUr8x3fsieX
 p/iTxe7StpSNuiucKFnJNzAaPYri1PyLu0BQA8gV5IIZ09OKvMPzXe4pLTe5iL9rZQPda+m7wuT
 rEx+R8qYrAT+W/In7OB3eZuTsNFHzTwavJjw1XOfN7LTRrKIPlvd8OxtwgVlbnz+AXam9TwfM8d
 qTt/p/Jo5DS26nw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX3yIHgZonONGb
 6SgB0UlR4CHYJzK2TOtwdbRYphMSnRGwc/WkUZSVPOavsKAyBnkfZSFTUIM5hSfiXIwEHyiG8L3
 +/ym83LSEdIzNNolOTiOEJZlNty8NrFKt7jZPAhDuzKEN0AP292u70zDmPlwa1RFP2IvtazY47C
 LkVNGGzHBlwCb4kK0zeo/NSi8jttxhZGZCcitYMMIRheRZ8tdXhUy+MLV1tC95SHnS1WDLX9cU3
 TfHhXOmN2zqPZVL79KkNi025x0FDZN+Baz8myL6DfzKuhmKREq0+8ZqCieOaIp9L64vLWVXhrhG
 hgBkWiuoqOzD7POq/qqtMPi7MXHnKxEgWZfbEvV3VuxIeTHo/xsR3wwsCbq9K0s2DujbLHUjAja
 K5n6nM246wg8M7igNrcv7gOOdBeWvELHs8/ptld2wAy6OUR8dp6mKAk0GoQ0iDtspKf0q1I9tNP
 NwO+8vSRgxhUhRfqOHw==
X-Proofpoint-GUID: L7NUSEhy5M90-w9Dq1jlkOW5U7r5GxcI
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c5826 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dWNf8gF45q0IjK5QRoUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: L7NUSEhy5M90-w9Dq1jlkOW5U7r5GxcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053743_724921_2557E4EB 
X-CRM114-Status: GOOD (  15.78  )
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

linux/of.h declares a set of variables providing addresses of certain
key OF nodes. The pointers being variables can't profit from stubs
provided for when CONFIG_OF is disabled which means that drivers
accessing these variables can't profit from CONFIG_COMPILE_TEST=y
coverage.

There are drivers under drivers/soc/ that access the of_root node. This
series introduces new OF helpers for reading the machine compatible and
model strings, exports an existing SoC helper that reads the machine
string from the root node and finally replaces all direct accesses to
of_root with new or already existing helper functions.

Merging strategy: first two patches should be either acked by Rob or
picked up into an immutable branch based on v7.0-rc1, the rest can go
through the SoC tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- rename of_machine_get_compatible() to of_machine_read_compatible() and
  add the index argument
- add a stub for of_machine_read_compatible() for !CONFIG_OF
- provide of_machine_read_model() to avoid having to look-up the root
  node via of_find_node_by_path("/")
- rename soc_device_get_machine() to soc_attr_read_machine() before
  making it an exported symbol
- Link to v1: https://lore.kernel.org/r/20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com

---
Bartosz Golaszewski (9):
      of: provide of_machine_read_compatible()
      of: provide of_machine_read_model()
      base: soc: order includes alphabetically
      base: soc: rename and export soc_device_get_machine()
      soc: fsl: guts: don't access of_root directly
      soc: imx8m: don't access of_root directly
      soc: imx9: don't access of_root directly
      soc: renesas: don't access of_root directly
      soc: sunxi: mbus: don't access of_root directly

 drivers/base/soc.c                | 23 ++++++++++-------------
 drivers/of/base.c                 | 28 ++++++++++++++++++++++++++++
 drivers/soc/fsl/guts.c            | 12 +++---------
 drivers/soc/imx/soc-imx8m.c       | 11 +++--------
 drivers/soc/imx/soc-imx9.c        |  4 ++--
 drivers/soc/renesas/renesas-soc.c |  7 ++++++-
 drivers/soc/sunxi/sunxi_mbus.c    |  2 +-
 include/linux/of.h                | 14 ++++++++++++++
 include/linux/sys_soc.h           | 10 ++++++++++
 9 files changed, 77 insertions(+), 34 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260119-soc-of-root-77c86c54010f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


