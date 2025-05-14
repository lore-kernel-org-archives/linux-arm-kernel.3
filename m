Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E199C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=5ZASWR2F8/aLstx6zx2qdaQhNiFkyY03eKEnIDBlPMY=; b=WIisufiVM1QZC6Y8IjxTHnH0oo
	ZGakc5TN/Kcd4dFToKFSIUUwCaeYHWQHeC1HWNYP4cKT2cZ3HYhhT4hDH25fYkRTkzKLnr2iIsrkH
	us9V8GTxHK36Gf25ifXRvZE0IOxBQsOzNNex2jqBiBhhR0fmlRLZihVU89VIdeAVDC4tNOjnPveeJ
	QBFY5gIiM8YhN9vn9m9TaC4YNilJcs26Sk9ErJndapN0j8Exqpu3RirjSRoYTG1WgmZsDq0/+A8fZ
	9sKFWoabVdZC5gquipoOuPm0NJFVOcIECHpof/gcoqJL2FNIe8xLd48ovh8raU7lFVIPf9p401pPD
	EnlX63pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBi-0000000FuCK-3tjE;
	Wed, 14 May 2025 17:46:39 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEg7-0000000FhCn-0Ngo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:09:59 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250514160948epoutp044bbe95f2e04602367fefc19698a54fa1~-cJpZfyhR3160431604epoutp04R
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 16:09:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250514160948epoutp044bbe95f2e04602367fefc19698a54fa1~-cJpZfyhR3160431604epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747238988;
	bh=5ZASWR2F8/aLstx6zx2qdaQhNiFkyY03eKEnIDBlPMY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=bqH+LKhUmbuvpHStQhZpv3R4meWUlwdJqguz5WHAZfR+RgIGQMYqvXOO7jx/WXIPD
	 lFjp8MvurU4+2u/vrikwlmL/QTHMtX/f9U8BUmaqU8PgbjICkT6iAHJbBztR6qPWlJ
	 T6Nn0m2/Qr+EP7B7jeNn0rZ4Njw1gy/5wogzanHY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250514160947epcas5p1df70417edde2fa2ae8a55591eaefdb7b~-cJom4x1H3248132481epcas5p1P;
	Wed, 14 May 2025 16:09:47 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.182]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZyJFk47ngz6B9m4; Wed, 14 May
	2025 16:09:46 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250514135752epcas5p2c05acfa026f884fabb631bf15d20e4c6~-aWdBD1Zj1178911789epcas5p2k;
	Wed, 14 May 2025 13:57:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250514135752epsmtrp2563895c03fb8aeb0acc1e67de5378004~-aWdAJ_nk1245012450epsmtrp2F;
	Wed, 14 May 2025 13:57:52 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-a6-6824a16036dc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	16.2D.08766.061A4286; Wed, 14 May 2025 22:57:52 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514135750epsmtip2a7aee6cb8b0cbf9da77a2704dae5b760~-aWarW5jT0379903799epsmtip2d;
	Wed, 14 May 2025 13:57:50 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: pritam.sutar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: [PATCH 0/2] initial usb support for ExynosAutov920 soc
Date: Wed, 14 May 2025 19:37:39 +0530
Message-Id: <20250514140741.415981-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSvG7CQpUMg3dbZSwezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi2o2F7BbNi9ezWbycdY/NYtPja6wWl3fNYbOYcX4fk8WiZa3MFudfdLFa
	PLu3gs3i/54d7BZffj5gtjiy/COTxaoFB9gdBD02repk89g/dw27x+Yl9R59W1YxemzZ/5nR
	4/MmuQC2KC6blNSczLLUIn27BK6MXy9vMhe0cVbcfOnfwPiKrYuRk0NCwERi/t6TTF2MXBxC
	ArsZJe7uOs0KkZCReDRtI5QtLLHy33N2EFtI4C2jxJ92oDgHB5uAqcTEPQkgvSICmxgljqw4
	yQxSwyywmkni9NQMEFtYwF5i9/zlTCA2i4CqxO53E8Fm8grYSdyfv5EZYr68xP6DZ5kh4oIS
	J2c+YYGYIy/RvHU28wRGvllIUrOQpBYwMq1ilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/d
	xAiOBy3NHYzbV33QO8TIxMF4iFGCg1lJhPd6lnKGEG9KYmVValF+fFFpTmrxIUZpDhYlcV7x
	F70pQgLpiSWp2ampBalFMFkmDk6pBiaOn3pBewyyfyzKdX0S67fw4HGvqZUGv+b8NPU8pj3H
	6Gx13YaeCsVFl1T2bLsXL+fZoBUZzb/0mkJKVswuzwMPXipPlTVxuuZUXe7cundWccL114er
	V5xwm7pmp1zU5mSuOXcenhN7MME1bc7lx4sTvTU0/y7JP3Ww44i8b1Pgad3tjhkLj83guFn7
	XcP2vvrbRTwbvv88O23Jr9BP8jcqOr5stBZ41S03J3rRzTviaR57WXbLpsy3n7T57cSVl+0k
	WRoOO09Q/BcwbeHJBIeEh+WGDN+Ec38dFee1X/dt0WqmAg8Tdcm2y5td+Jtj5PbnZZ6K8rFq
	yj3yb9FG3fCghDV8HSbnTrw5OlHcKj1OiaU4I9FQi7moOBEAYsMXc/YCAAA=
X-CMS-MailID: 20250514135752epcas5p2c05acfa026f884fabb631bf15d20e4c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514135752epcas5p2c05acfa026f884fabb631bf15d20e4c6
References: <CGME20250514135752epcas5p2c05acfa026f884fabb631bf15d20e4c6@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_090957_382473_30BF82DD 
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

Pritam Manohar Sutar (2):
  dt-bindings: usb: samsung,exynos-dwc3: add dt-schema ExynosAutov920
  usb: dwc3-exynos: add support for ExynosAutov920

 .../bindings/usb/samsung,exynos-dwc3.yaml        | 16 ++++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                   |  9 +++++++++
 2 files changed, 25 insertions(+)

-- 
2.34.1


