Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD64E98DF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 07:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Lif/v6jrZ/kaLcznuMV5NFqGRHxVZU6OFm4P/Ynz3s=; b=fyYLJKE4IAvILQ
	4jeO638EgTGjv6seuhuXLC34vpnQCvaWJrXY43cBvXmBODnYdnfUaSYtP1DX1zxJDEgz5sP30RwHn
	WYZ3TQ1EjJ87tHrkd3H1NCbr3qW0wwtsuigOBVOvr1bR9pFTzrnVjRMS0Ursjbb4cH7xkwXaS1ugE
	4tycyMuXLz7Uy2gwJpHlBy2I765S9J7Ir7G26cV7GkQuLzT4xWKtl6GODcdWZpmedOSLltOF1D+g6
	OiHe5STST883coQSeEI/0IzSMQ4w8JpDASvBInTg4v2mN33dguVYxQpowLNlAitURmGizhxNqQ63I
	7SXYEFI8Rq6pu66rxZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMB-0000000HMcS-1pfZ;
	Mon, 23 Feb 2026 07:27:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQM8-0000000HMaS-2JYr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 07:27:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNHgbD1778082
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+Lif/v6jrZ/kaLcznuMV5N
	FqGRHxVZU6OFm4P/Ynz3s=; b=VIiZZeQ3woW7l8DMziY9OPKkuzrr5WNhrX5twr
	Ot+moTFjx0q5lnDv2or3HQApaGPAmGRN5kBaE9R1gOL4H9XLEJsO2V7GjrwR6KS/
	tjoF3hKqVcrtYtggls9p2aTzeYdDOfWzzeICU7aJZD7k3wBXJLhlT9QO5Th5FVBZ
	J2OFM6fMPkp/Er9l8bdQJEg3PqYWiqCuez3tlzixbMcjJKMvz9CNOy4SRJkIo1xA
	sV4vkvs2yAakQhJTZXYBjOtq6L/Ae8FSE/PS1IcJYsBKCOMJFCMns+gcLB6upM/R
	lI3Lhx/blom9t0CM8AxYew3hhZCFZeaOFLQywNLhRa9aiGKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9usd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:27:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb413d0002so4752973785a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 23:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831665; x=1772436465; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lif/v6jrZ/kaLcznuMV5NFqGRHxVZU6OFm4P/Ynz3s=;
        b=HTGR0vW0SbBlzpXiuZjX1xt1ic/w6AD+VKRFIL3KhVer1vASvFG9QMCcbdyY2WRcz0
         2tg9E6UX8IvoRtx3OtVZJp02HQfUkVff0RysGif2pzhD9mfd0NmeZfRmSpy1bTOvxupG
         6lz1iykZLvv1zxkB07zMxfU9gagJw6CunWnD+3vV3GjMCMrvQwFz0tXrMha7lfQwvYRr
         59o1K2V+0Bm8dq2uKOME73AIeeBhL/DoXOffqi0ip28Hqhe9x4xZH8ZFTyl4UsRv9xgd
         KwqjpDxkd59kFA4boMPGljZ+MfUaU+Y+7w/4fCsXzXXVTT5oXMTjoI1WaKbMUxOJy94d
         86fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831665; x=1772436465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Lif/v6jrZ/kaLcznuMV5NFqGRHxVZU6OFm4P/Ynz3s=;
        b=fmLvdyPA0YISUgzoS79IuP+z/UA5hHUpub6MwHHAkqonKNPylg4a++uOOJ04jLejI1
         J7t5kayYcI9DjG6nAuqrSEoP+4hjgyaUXiKQG7NWcB9edTsaDv+S6Y3qZ2XtmsMx+LE9
         bT7W6eACx0Sp9KMh1kzQ2qGEYjnZug++ixhnQ5MQNTL6XsrrkjCmrySKOoxD01GGdEaT
         GTNs0zBv7bzX70Lmttnn9s3oOogzJlBM3795+KnhT4nnO0njjPKGzN38mHR9yRNiUkYP
         BVw3FFuGzbmzmyf/7eAE0jady8i1bjXelPmwnbjcb1rqigYMhaNutblJg0vxN/Q91UqB
         v7dw==
X-Forwarded-Encrypted: i=1; AJvYcCXUrCpkUeWn08OlDrTrQjAXClTwc/e6Ch5gFE07aCUnTGy6mQ0OWLqPbmN2GtLAdzkedN2nAWbIPD3KoPp1XfSU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwtcx9cHLSlMEINckIUF9WXUnS/MOTmuWr9Ym0OEZUERrf1z8j
	iIhqWw41+/YijwIaRkMHCI///m3rR48NBi3l2aXWmLl0uWfU5P+kNDNjAT7HRUVAGiKyYqEcR5o
	TNCpd0NY4LRKyAG2jg71DaAVW3jM47rhkgmc/9ZwUZy9rcefWcGrmc3Q4SBUcTmH3qr5bh1I55d
	MBaw==
X-Gm-Gg: AZuq6aKUYbhJQlVjM7n9bSkR7m++2WbvSb/Mat0IxgQ4Nla8pQ1ZZh0PFFAPm4zf4fc
	NYk6GrvyxHSskSFSH29SOpoCIc71lR/USNCNsHqI1dFmx5x70F+CwRKEL5Dn2VXPlxe6L8DiHrl
	ZU2ocY+vvUrnmboiMZogb+tBaiRFUqtQdj2X3iOVn2YdB9UUm5JNPusMU6h1vxb5jffBc+dDIs5
	1HpdA0DB/oKI2EnMHJNDYw7pevp/f4BMBY+hGOlank1asCZgaT4NeRmn4Ypt1bHkshkP5oKlsua
	wcX/sr+n/9INKdOSTAkLiOJXCgFMpJ0xD20gqlZWHeSkOL1WKKa80IU4H2Bt3X1KnnajYXEWDcc
	odFg/vkJr4PCiCjMR/o4FYWPVNgKprNAUvJCGUnkQix3P0w==
X-Received: by 2002:a05:620a:3949:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cb7be5dc53mr1446019485a.10.1771831665250;
        Sun, 22 Feb 2026 23:27:45 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cb7be5dc53mr1446016185a.10.1771831664738;
        Sun, 22 Feb 2026 23:27:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/9] workqueue / drivers: Add device-managed allocate
 workqueue
Date: Mon, 23 Feb 2026 08:27:28 +0100
Message-Id: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGABnGkC/x3MSw5AMBRG4a3IHWtSTRC2Igbojxvxuk1LIvauM
 fwG5zzkIAxHdfKQILDjfYvI0oSGudsmKLbRZLQptDFaXbssp4eHsgirslVeZchRavQUo0Mw8v0
 Pm/Z9P35gpCpgAAAA
X-Change-ID: 20260220-workqueue-devm-d9591e5e70eb
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2816;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7mljl1U9eXffJpZ0hBAWdNAHR5m+p0KaG/n8r9LaqAA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFmZkGFLhO7cbL4Sqp0/lLgGV3Z1pGEZFFfE
 0wp1vv9KA+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBZgAKCRDBN2bmhouD
 1w6hD/0ZJmVgKfBwm7gdyPe4n638O/Y+0/1CnXxbSLVvC65RI+b67sjIRddYF78ZDR86k0TSQ/q
 DjiUVn5vZAowj6LeTHrZRaRtHU4IZE+hh4eAQ1lSS/4NgwPBo9lQ7MI1jCAqg/hhcrMyEI1apzN
 uz6mXYcLAmYs176+CiTXgk3dZheGTTQuy1dq216FpqcPC37DNvAo9MRMMNrQphMMBOccJtUBxD3
 FVpfb3ryijGZo7GnGUR2Zl9th+Ckpj/DwAceYI6vXj/GFH9Re/rG7P/HCyXgU4IZTHyprrcN0A4
 +Fimqo16Xxk9ffA8Ay5jkNF5/dFwQpgwMaVL2UJ04reD02gmHC/ib98vWMWTn3f/7w9pHDHAREO
 P6lx3QQKk6T3RT93ubw+O1DmjEMUeFnQHjEzk3b2S24uPwigtCuuaaFwe3gKzE0RhJAa3WROqJW
 dDx5NhC+Xg1aVOvRnLui39fkdqlwI9+AymUaGv3Ywe4BuBFA+lIcaUtPr14MrB329TWkJJB4ESJ
 PI9P0pNKpiPr/7BP05GVUyC8Wog05QRUVQBpPrxGG7VNotOJv1XCvWsNbVW8DMTvYVdkjPGefdM
 gp9gsjavEO6zd1p18hW06CbQu1O3rfae5eMWQTfiESznwD7h8CdoGC1MzLglLGA/ohMND7X7f4Y
 IcMk/BuoVRa2UNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX4RAzm8MgRz8c
 TYxWI6Wvf4+nzZFjVd19Cq+gyqNLZ9cTyceMrzwqguIeAUAOCwsj/k0R2lbBKih6tDDzC196d/Y
 xOviHZFjwb+QjbZb3eGO0530zTTXByOfNHB92I/0fldCVsMMNTFXhzcv5M95tQYG0o23WobhKrU
 y2t+pb7f5d2vT51iVTnDoMwsEi4yxGCv+glvEoAhc8Q15zflPFVjWSxfSQQ9MUTOPFTKNj2HL9m
 oBZZeAiNUSjL+N0VPTPEGoEFhJDASOqgqPVbsEkdCA7kwExCZjxHMIFnIjhv0E25YZpmomXfzMh
 8gGd9ySr8+LjsLNpUrGoPuDfK4iKqc6p+F46oYH2IGhwHywOox2JEV1IOzuA4ang0Mb0+4jqTMp
 3H9JFBbxHOZKdXHKZ9jzLm8R5PSbiM/SZD6P5YCvbUY+WUcVJsNaFj6jKvMBMtLTdw8iBDdSz2A
 UB6YEOBTVnMRg+aFLqw==
X-Proofpoint-GUID: hN9Y9q9XVp6THVIPjGPTMAo_vDl1n6V1
X-Proofpoint-ORIG-GUID: hN9Y9q9XVp6THVIPjGPTMAo_vDl1n6V1
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c0171 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5RJr-VCCejNB9LTRrg8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232748_754286_D780B4E8 
X-CRM114-Status: GOOD (  17.69  )
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

Merging / Dependency
====================
All further patches depend on the first one, thus this probably should
go via one tree, e.g. power supply.  The first patch might be needed for
other trees as well, e.g. if more drivers are discovered, so the best if
it is on dedicated branch in case it has to be shared.

Description
===========
Add a Resource-managed version of alloc_workqueue() to fix common
problem of drivers mixing devm() calls with destroy_workqueue.  Such
naive and discouraged driver approach leads to difficult to debug bugs
when the driver:

1. Allocates workqueue in standard way and destroys it in driver
remove() callback,
2. Sets work struct with devm_work_autocancel(),
3. Registers interrupt handler with devm_request_threaded_irq().

Which leads to following unbind/removal path:

1. destroy_workqueue() via driver remove(),
Any interrupt coming now would still execute the interrupt handler,
which queues work on destroyed workqueue.
2. devm_irq_release(),
3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.

devm_alloc_workqueue() has two benefits:
1. Solves above problem of mix-and-match devres and non-devres code in
driver,
2. Simplify any sane drivers which were correctly using
alloc_workqueue() + devm_add_action_or_reset().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (9):
      workqueue: devres: Add device-managed allocate workqueue
      power: supply: cw2015: Free allocated workqueue
      power: supply: max77705: Free allocated workqueue and fix removal order
      power: supply: mt6370: Simplify with devm_create_singlethread_workqueue
      power: supply: ipaq_micro: Simplify with devm
      mfd: ezx-pcap: Drop memory allocation error message
      mfd: ezx-pcap: Return directly instead of empty gotos
      mfd: ezx-pcap: Avoid rescheduling after destroying workqueue
      platform/chrome: cros_usbpd_logger: Simplify with devm

 Documentation/driver-api/driver-model/devres.rst |  7 ++++
 drivers/mfd/ezx-pcap.c                           | 27 +++++--------
 drivers/platform/chrome/cros_usbpd_logger.c      | 18 ++++-----
 drivers/power/supply/cw2015_battery.c            |  3 +-
 drivers/power/supply/ipaq_micro_battery.c        | 50 ++++++++----------------
 drivers/power/supply/max77705_charger.c          | 36 ++++++-----------
 drivers/power/supply/mt6370-charger.c            | 13 +-----
 include/linux/workqueue.h                        | 32 +++++++++++++++
 kernel/workqueue.c                               | 32 +++++++++++++++
 9 files changed, 117 insertions(+), 101 deletions(-)
---
base-commit: bc32aa8c2aea9fd3acda58dd8a5ea6c17e9dfc36
change-id: 20260220-workqueue-devm-d9591e5e70eb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


