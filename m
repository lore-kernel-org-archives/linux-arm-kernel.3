Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FAAC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=oDUn4vGxqZ0dgmjFCUlqP7z0I19O5uz1oFEJFFgwGN0=; b=LsjJYrVDIU87RvQCm9p3o6fzrn
	CJhHF7mqaqGJOD8AR9Sq4S1JlxLgWyCuh/tkeFFYHOp2htdCPp6bf08YvZG6z3iWgwUsF9hiIhloT
	f1BShLH2UrqGQAi7csoAE/bXYgqDSErglBrDhMXPfN+ztP7J8AREXIaHYI2PosUqSMbdO0w2DHKfA
	2PAalriLYM55pZFLQ8oTrrzi0M8JHHuq1t0h/QA++7nBX6c9j4iL8gs2WUbKrxJoWOuiyWHfrEGyq
	6LTfKNDsaRfctRh46Ra7xemDkfxjId6zt0ZxQgbUJ8xuYXBEa4NoHD5u4IZG8F2PVvOI2mVX/Uzhw
	+hbSEmAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqjl-00000002uN5-3EOR;
	Fri, 16 May 2025 08:48:13 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqfm-00000002tbh-1b8o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 08:44:08 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250516084359epoutp02c46d2a8053760137f1d073a9a9866b40~-9W9ykZ4-2248522485epoutp02B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 08:43:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250516084359epoutp02c46d2a8053760137f1d073a9a9866b40~-9W9ykZ4-2248522485epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747385039;
	bh=oDUn4vGxqZ0dgmjFCUlqP7z0I19O5uz1oFEJFFgwGN0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=UoyyS/jHUfHBgn2s40CTQovf0uZEDIjk1ZbQcmnfIyarsh1XUGGVlDRHYt6u0OpWv
	 otsyupWW1nChjaSPUyKv5ykTycdpX7qvi1I6TmqZw+BUYG9U9pvA8N5mqtvsBaX8Vf
	 hW5KrDb1bpNe3/ZJvT9xfzi2YgeNRRyaBxsgwKTA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250516084358epcas5p3efd61ab4296640f46f59d806c92959a9~-9W9Gz9vg0984709847epcas5p3h;
	Fri, 16 May 2025 08:43:58 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.177]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZzLGN1Lchz2SSKb; Fri, 16 May
	2025 08:43:56 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250516070436epcas5p4204b77c1a146ab05ff897d930c32041e~-8AMna2Bk1740617406epcas5p4y;
	Fri, 16 May 2025 07:04:36 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250516070436epsmtrp2a81743acebd8ecc647593b88a5676dd0~-8AMmgodn0262802628epsmtrp2H;
	Fri, 16 May 2025 07:04:36 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-95-6826e3840519
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	27.A0.07818.483E6286; Fri, 16 May 2025 16:04:36 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516070434epsmtip25ce2feee6b9c38117999b0188e44db32~-8AKM8aYr0738607386epsmtip2I;
	Fri, 16 May 2025 07:04:34 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com,
	pritam.sutar@samsung.com
Subject: [PATCH v3 0/2] initial usb support for ExynosAutov920 soc
Date: Fri, 16 May 2025 12:43:31 +0530
Message-Id: <20250516071333.3223226-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSvG7LY7UMg5MTVCwezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi2o2F7BbNi9ezWbycdY/NYtPja6wWl3fNYbOYcX4fk8WiZa3MFudfdLFa
	PLu3gs3i/54d7BZffj5gtjiy/COTxaoFB9gdBD02repk89g/dw27x+Yl9R59W1YxemzZ/5nR
	4/MmuQC2KC6blNSczLLUIn27BK6MbSfaWQs281S0r7nB3sB4l7OLkYNDQsBEYvom7S5GLg4h
	gd2MEnsWvmbpYuQEistIPJq2kRXCFpZY+e85O0TRW0aJzTMusoA0swmYSkzckwASFxGYxihx
	pGE/C4jDLHCcSWLKymZGkG5hASeJSbe3MIHYLAKqEl8+bwVr5hWwl/gyQRxigbzE/oNnmUFs
	XgFBiZMzn4AdwQwUb946m3kCI98sJKlZSFILGJlWMUqmFhTnpucmGxYY5qWW6xUn5haX5qXr
	JefnbmIER4SWxg7Gd9+a9A8xMnEwHmKU4GBWEuG9nqWcIcSbklhZlVqUH19UmpNafIhRmoNF
	SZx3pWFEupBAemJJanZqakFqEUyWiYNTqoEpI0tmZuqJOe6/tNd2cv+fdqDccR3vncR8nug4
	Z54NslX5e5c0MP7a/GH7Qgl7h3jFuI0K84Qc8jL3H22Z9FFJv351aNVd03bj4t5m3wuTL52O
	9BFP0Giz65FWTeZp4uO6KL3o7C/mNt/Hq5an7vq0ZF1gCOefRfWn/OxXcRXO8AxOfR476/X0
	bW3Sq5VYRf96y5xsmvlPe/om/ReCnFN+CL1oua53QdZNLdvxObfpbtdaUdaJ+2wU8vuPX11w
	/C6r5bOPYs+U37BJMEgwvrmyVm+e5Puiv033gyeXPmfZEM/ZOr9yeWR4jt//iP7WtoByi/Bb
	3tFJMd97Ygp/ybl9F/NSU74qe+DKH+1VD5VYijMSDbWYi4oTAWqHKu73AgAA
X-CMS-MailID: 20250516070436epcas5p4204b77c1a146ab05ff897d930c32041e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516070436epcas5p4204b77c1a146ab05ff897d930c32041e
References: <CGME20250516070436epcas5p4204b77c1a146ab05ff897d930c32041e@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_014407_055040_76B93D3C 
X-CRM114-Status: GOOD (  12.74  )
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

This SoC has a DWC3 compatible USB controller

The USB 3.1 DRD controller has the following features:
    * compliant with both USB device 3.1 and USB device 2.0 standards
    * compliant with USB host 3.1 and USB host 2.0 standards
    * supports USB device 3.1 and USB device 2.0 interfaces
    * supports USB host 3.1 and USB host 2.0 interfaces
    * full-speed (12 Mbps) and high-speed (480 Mbps) modes with USB device
      2.0 interface
    * super-speed (5 Gbps) mode with USB device 3.1 Gen1 interface
    * super-speed plus (10 Gbps) mode with USB device 3.1 Gen2 interface
    * single USB port which can be used for USB 3.1 or USB 2.0
    * on-chip USB PHY transceiver
    * DWC3 compatible
    * supports up to 16 bi-directional endpoints
    * compliant with xHCI 1.1 specification

changelog
----------
Changes in v3:
- Added Acked-by, Reviewed-by tags.
- Added the usb mailing list.
  link for v2: https://lore.kernel.org/linux-usb/20250515225815.23sxkgior5wzsgsc@synopsys.com/

Changes in v2:
- Grouped compatible string "samsung,exynosautov920-dwusb3" along with
  the other Samsung compatibles.
  link for v1: https://lore.kernel.org/linux-usb/20250514140741.415981-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (2):
  dt-bindings: usb: samsung,exynos-dwc3: add dt-schema ExynosAutov920
  usb: dwc3-exynos: add support for ExynosAutov920

 .../bindings/usb/samsung,exynos-dwc3.yaml        | 16 ++++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                   |  9 +++++++++
 2 files changed, 25 insertions(+)

-- 
2.34.1


