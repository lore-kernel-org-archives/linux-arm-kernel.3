Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBADFF494F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1ZC22yEKqv0I/CPaWdZHNu0Gid8fUMzBO/v5Cza4Sg=; b=XD32aZNNc3CRzx
	kuzrHVr3HDrO0NXp/ckBULIGIKblefKlDOELJ2Y4xtFPNiJXUtORchMyZ6DILBp2lLXZG5umF4lS5
	MQ6RjRvv1XnnSn7BJn8g18rvD/oap0OoGDScv2abuIaWHhx8CTMrCVbSSXeQL/eH0RrmkhTtod0np
	efITLu3o4e9mIp3+jUIYGGPKQdxe5kqMCD54LWKBjpWN0pUg711pQvTmMvEVw5NdgvLD0YFfw40QL
	u0f0gZP4gtouCYwEYk5ZohCcV9bTzVPlPmjX6hCBh4YGnJqXDW75+wPrdYHpm85tdi+EmehEnzW0z
	f6k/iR6g071rlSX0JCKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BvU-0000000BH5Y-2j3Q;
	Mon, 30 Mar 2026 12:41:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BvR-0000000BH52-3VV5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:41:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCcVv73195173
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 12:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m1ZC22yEKqv0I/CPaWdZHN
	u0Gid8fUMzBO/v5Cza4Sg=; b=Opung/CBz/HA4ZQjM+P2dBde1ixiEOI+r+me5E
	Hy/q9anjFRYMLlBqwA5yumdAL2X1hfnAv5nk7j5jTRqm1cZjhNrFvXvOfRq3iLaZ
	F0F2NEEq2sHgVFoxHjy3sUVSFi7fYzlHFXJwmpFvZVpn7mLHG48YDOuUIdNlt+4V
	j8eZeId7VspsS33LfIfwMn/O48kGvKq+c5SnxwGY1yi5bmfS9xt4XmLvZFjdIdhK
	6ZepZTY3k91HdXQgOLahDJGoxhA2tWmL4ih07lE/F7taPjWmUgnWD7e7jYhmhmy7
	fxrqDWRhu6eJzJXu3AxZiYceQQva4IJkzKI5cbxBlcs698Rw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sbwg066-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 12:41:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b6f869676so87895731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 05:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774874460; x=1775479260; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1ZC22yEKqv0I/CPaWdZHNu0Gid8fUMzBO/v5Cza4Sg=;
        b=QLls29vmmdAW8AIaErjgvDQ3GsfQf3+7h+ZKz21B0LtXVwpXF2n9FvTXcxW//CFtAe
         yQV+gALCH12bSY4OiwMoinbUSP7kZu/F8YLwn8VPTllGgOCFdo+8+3SVeWmXFkyWo8kq
         VuHQY4h4u+ohaNWKpONU9zdykHnur2ynZFS2uZ0XRgMOaV/JcE/niugiP3qKUTKOjOjh
         a5+xY+vctG2IKzXjpMbnuhn8OPQGCMXu5zqROyKAEmep8++TWg5bvcu0Y0Aob90GQFvm
         ntyL2PLNgAlX8TwwiSFQBEi1EI1JrFjjSlCaO73mFUrrP5IAIYI8gGkJPvm/RUO1bvAY
         CyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774874460; x=1775479260;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1ZC22yEKqv0I/CPaWdZHNu0Gid8fUMzBO/v5Cza4Sg=;
        b=YVzEdqFWkmBgN9BQ1gh7hPbkAaxV/Y5uXGKR616HnFceznQ+U2mi882ksEpRm9e56Q
         FgIhBHjqD8+oFf1yPYiV1qMlKSIG4FWPAUpo34rs/eK8tGWx0xSxUqaUpibD5H31nLyZ
         1msY3MADGshR2Vy19+Y0X7XV3jQLouwOQhpaYond2HGzMI3AfQVGPpZu+Hr3k5Lv1fLM
         TvBG9EwzrCB46mvgw2MZUorEeXenEAja1QNbpVpv5COuufqNnFxWgOrDNorphkXT2tYP
         5AvlkmIYHAhC54gt73anXFEbFhTSD3CjhQxs3Hr1ca8tGv5az8OgSomCfnzAYIEd6VDl
         qIIg==
X-Forwarded-Encrypted: i=1; AJvYcCVU3KodXW1+HdYzb7mwgEIOkRkpfkflrgtRgG24l2XjDI9woKNf6GPwVYXrgIlATZRedcxLCChO5FgWYRSO4o4g@lists.infradead.org
X-Gm-Message-State: AOJu0YzYmqKLaUWecERahky95fW7DHIRmsHtdq+WXx+fDn0qUahB/pqb
	/vU33FGA425nArToqca/y2IwI5s/t7Ib9TTS8Ad6QsP47uH3nHx6xwaK2TMZ1tENT7SR0Y/dj1Y
	8p9ID/maE7nSTyEcg/6IdmJ/R2Rh8+PGSycupGV29QfyzC4iU1g6pp0ndcVowzzb1fgDHgS3UcI
	+g3Q==
X-Gm-Gg: ATEYQzyhmYAmMHBFMe1CvUYrYfA1tqYHVUDvT+mFVlxAdSk1PWffbcREKzFEjtFsDVI
	6jPbJrxwxEPB63pwoOrVJJxuPdd2e8OgNXkbKPdVKeBDimPhrzXQQExi4sxBjvT77Y2hVsClXTC
	VXbhEkfwR4lwMK8VAPTNSXmBN9tsXBEv2bP93qSE1AAnjKvXdVhDFZ47LTUt4m2/kIffPsDckUA
	PC3hxkzfTcj9AQlMpjaohYVODm+0oi+DzT+wdf3xx364eOoByqPnDKqlkTnygiDVhfIZkAtptBQ
	Ktk2xnZjOq5PcU2ODHF9Jr0QNP/4zSWK3t75njTzCi1C2DBCmd3Jz/wuROos5xhqfT4ztKF5ykz
	BqGgCKw1ZB5oMjEVojDJoSZ3Gd1rSqStqQHfRtGFDheEddqeuXCcd
X-Received: by 2002:a05:622a:229d:b0:509:1d4b:f860 with SMTP id d75a77b69052e-50ba397bc8emr179975241cf.58.1774874459621;
        Mon, 30 Mar 2026 05:40:59 -0700 (PDT)
X-Received: by 2002:a05:622a:229d:b0:509:1d4b:f860 with SMTP id d75a77b69052e-50ba397bc8emr179974841cf.58.1774874459199;
        Mon, 30 Mar 2026 05:40:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:e931:8d81:9955:76ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm19576153f8f.30.2026.03.30.05.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:40:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/3] ARM: omap1: use real firmware node lookup for GPIOs
 on Nokia 770
Date: Mon, 30 Mar 2026 14:40:45 +0200
Message-Id: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1vymkC/x3MTQqAIBBA4avErBuQLPu5SrSwnGoINByoQLp70
 vJbvJdAKDIJDEWCSBcLB59RlwUsu/UbIbtsqFRllNYKfTjYtq3C7eSAcvvgSLBxtputbvraEOT
 2jLTy83/H6X0/ncJbKGcAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ebXxP6oyGThso9D20ueCVw32ARrB2td9WDVDT4mVQlQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpym9QIpjWDEaGIC85qzZdl9V6Rcvu5F+r9iru9
 WKPqG41tIGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacpvUAAKCRAFnS7L/zaE
 w2kzD/9NUZiXDzZZSpnZvE7U0Y+j2FXJqL4tLwdObSeStH4IM9mpXwCRyn/c6oGyMD/91QDjPrv
 3DXHCm+kM5GEO5tKMe8LEuZjFE/6n/CuEagUvVTETyucDzV8y9mn6hNvCaLFKCwVWvoTGZR3s2U
 MxEFzkV6egJoA9Zd7G5plqtw1QJHQiAVnmjRj9X8JBwzwJJfrgoJwpxppBG7a/K1l1km1peQRZq
 7RyrC4AS2Cy8uYOOXoqVxD8VfwNE9UC5+ucjUO8sC9Pg/Htq62nkxrtNM31umoP15ttqXLLZqH6
 wxQf8yJpXDhfej5z9KIq/GA38t4XK3lYfga5Cpba6MhKUmPKyebmrL+J7IMuHZwwyXoqmmqEq4z
 iQDw/kik4wEW5u7QOSPYMsN+QMoDLimboGo/esNyyGuikM8eIAmOcSDqOmwfT0+YES8cWzAqyLC
 Ib2ejc/sqHiHKibK/QryIgqjglKpyQ97ashiz6vhHzB4yybu0d+L8IElKavAqTDymIYSvxlJnM+
 iXTd7S24TG/CcztQqKIWbtkbzcRIhiourzV4XFw350GW9vuoqyk64oC37G3/ke+o10XDFxePCdJ
 Z53nn7cIso/rW/Co9BqjlmdawBZ5GFo8Z4zveeJqZYEWgj4bBNvMMZn5KpgWfW3Jxu9JaTmrqt9
 0fLcx3SsNRH9aJA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: MLoUsXZCj2cN5C7LjLtAy3V5HlWfQa_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5OCBTYWx0ZWRfXzefHDu+OyizC
 /hz81zqfRKfN5J/7ljtQsDumsGMWiIAcmpM6KeV2qZm3de+CS5dvWchWZqa0lbyh+33MKK/KCTh
 OlIsaDy/A8fnxDa23wckJHl1vZyo+MFDv0ZHkgNSE5uZ7WD79+WzF+KguRHPWmzIYX0Q+niRDaf
 lo/Y9GylE+RP0/K7ShUe8mmhi/hGApeHO/DZhTwiCVlJkA9wcg2Ow/+IwMRWosPJyD//sQ56Kfq
 VeotCxlHKk35XD3VNa+Tth9hnMPw7KCJiBQXY7y/ImB4GFEy8PwFWAGbsIN/eFji9yMXPIBWE3W
 zTGDipk5GbNtSxoXNhJT0+SKnYCWix/19RP8V4PtpbC3B+ZMGMwqGrIoqLWDkqdMS3mp1+Fg0C6
 p1PUO/ixD05ROpkieajFCtocOgtF1B8XT0DZ7SL0qZMCxsWbWdH/VPg3E/HEZnti7rS+HDfD5Cy
 7avqiXm97A+wGWLwTiw==
X-Proofpoint-GUID: MLoUsXZCj2cN5C7LjLtAy3V5HlWfQa_G
X-Authority-Analysis: v=2.4 cv=TIpIilla c=1 sm=1 tr=0 ts=69ca6f5c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WeWpliTHXVVyQaQyHOwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_054101_882496_E6126687 
X-CRM114-Status: GOOD (  16.68  )
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

As determined by Aaro's testing, both omap16xx_gpio_init() and
software_node_init() run in postcore_initcall() so we need to make
software nodes available earlier hence the new patches in v4.

Please note that while the goal of this series is to allow Nokia 770 to
use software nodes earlier, we're not modifying core kernel code just to
accomodate an old ARM platform - more such conversions are coming up so
the change will be useful to more consumers of the software node API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
      kernel: ksysfs: initialize kernel_kobj earlier
      driver core: make software nodes available earlier
      ARM: omap1: enable real software node lookup of GPIOs on Nokia 770

 arch/arm/mach-omap1/board-nokia770.c | 30 +++++-------------------------
 arch/arm/mach-omap1/common.h         |  3 +++
 arch/arm/mach-omap1/gpio16xx.c       | 28 +++++++++++++++++++++++++++-
 drivers/base/base.h                  |  1 +
 drivers/base/init.c                  |  1 +
 drivers/base/swnode.c                | 13 ++-----------
 include/linux/kobject.h              |  2 ++
 init/main.c                          |  1 +
 kernel/ksysfs.c                      |  8 +++-----
 9 files changed, 45 insertions(+), 42 deletions(-)
---
base-commit: e80f5dcc54bf5d494b725e2932571488daac33b8
change-id: 20260330-nokia770-gpio-swnodes-5da8ba35946e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


