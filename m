Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32FDC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=T+tQKDNqFz0vrJcNWHZ7SWfrYWc8+05T1uWtrqP/8gg=; b=frf8mBOgYbScvlwqDfR2OLafeh
	Mw/m+4Ffw9gRRkyYINtw0CIgVCry78xOkyXID1Qr2ZvWfsiWx1qPS01sv+VGCnuPEOsIX5dC9kTzk
	zVoHCdSxDB8TKUh26Mp6Rk1C5phzM7p5U+V3Sl8Jhkg4gx2HmEIk4utakwA+2DhiSAuoxKTvmrT7o
	48ybi7grC7NWW1rikn6Z5wI2e/NzXeT8pHFlO8gB2JeyOpgYfavu2jPz5ROlU0mpV3WrxKWqhiLtb
	kTrH2aZ7UaLBtmaseCfu13ehexJYd65BwHPqPuB9k+p2gWWGoKCfB7M101eBY88172BSd3X+W14kD
	PDcyvaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFShB-0000000HE2m-3vKK;
	Thu, 15 May 2025 07:07:58 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSYN-0000000HD9r-0cde
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 06:58:53 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250515065843epoutp02a775d30b56c83c440e14800fcc84cc11~-oRxaWSjN1356513565epoutp02z
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 06:58:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250515065843epoutp02a775d30b56c83c440e14800fcc84cc11~-oRxaWSjN1356513565epoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747292323;
	bh=T+tQKDNqFz0vrJcNWHZ7SWfrYWc8+05T1uWtrqP/8gg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=gkjnkQNl/C6dvk+3lctfvTFGIxD5XWUnfpc6pxh3C0Ow/CxHtp9r5NDKQfMv6JVwr
	 7ce5MTucoeqX/qrZxjaJY8WYwMtmZ5kfmwizEN1DFCuGziMdgB/bGykgp2KtAe8p/u
	 9RZR0axNtI8cntL5J4ZwjsBqLKjPbGrYx7QG6QBM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250515065842epcas5p39299e3e0ccd1f6d0c9085f006a5b8bbe~-oRwyKJUF0043300433epcas5p3C;
	Thu, 15 May 2025 06:58:42 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.182]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZygzP3YH2z6B9m6; Thu, 15 May
	2025 06:58:41 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250514133841epcas5p1993cdc39779e2e67790c84bdcb95a161~-aFskRMwc1651716517epcas5p1x;
	Wed, 14 May 2025 13:38:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514133841epsmtrp182ecc0d6f6db8ee036d95ebc3a602f8e~-aFsjOVMD2249722497epsmtrp1v;
	Wed, 14 May 2025 13:38:41 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-d6-68249ce06e42
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	77.3C.08766.0EC94286; Wed, 14 May 2025 22:38:40 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514133837epsmtip211d9cfffb87f564e51c11db6b8184519~-aFppGDet2568925689epsmtip2B;
	Wed, 14 May 2025 13:38:37 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, Pritam Manohar Sutar <pritam.sutar@samsung.com>
Subject: [PATCH 0/2] initial usbdrd phy support for Exynosautov920 soc
Date: Wed, 14 May 2025 19:18:11 +0530
Message-Id: <20250514134813.380807-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSvO6DOSoZBu/Omls8mLeNzWLLq80s
	Fmv2nmOyuLdjGbvF/CPnWC2u3VjIbvHn33k2i6Ot/5ktXs66x2ax6fE1VovLu+awWUxY9Y3F
	Ysb5fUwWa4/cZbc4/6KL1WLDjH8sFs/urWCz+L9nB7vFl58PmC0Ov2lntTiy/COTxc47J5gd
	xDxOrtvM5LFpVSebx51re9g8Ni+p9+jbsorR4/MmuQC2KC6blNSczLLUIn27BK6MOXsnsBSc
	Y63oXdLC1MB4gKWLkZNDQsBE4vKKScxdjFwcQgK7GSXeHm9kg0jISDyatpEVwhaWWPnvOTuI
	LSTwllFi+TfLLkYODjYBU4mJexJAekUEepgknl79wQbiMAs8YpI4sOULWLOwgJvEybbZzCA2
	i4CqxKvvTWCDeAXsJDZ+OQy1QF5i/8GzzBBxQYmTM5+AXccMFG/eOpt5AiPfLCSpWUhSCxiZ
	VjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBEeRluYOxu2rPugdYmTiYDzEKMHBrCTC
	ez1LOUOINyWxsiq1KD++qDQntfgQozQHi5I4r/iL3hQhgfTEktTs1NSC1CKYLBMHp1QD0/ke
	SYefVdIWPxzPbfec9p+lQMA17vPV/ff0J/td7I+MXMv3oVb4SEF/1K6wBzmRLIlX+Lk+mHxO
	fBstcMOiTO3Xntti5wO3ctlfcKjbfS61P9YwSdzqpeSu2ckPXcrSzH+pFqldMOfR/rarQdrs
	aMpJm++zMjwYfsl/UPNdoTLX9FdG689Lj6+XVy4Omlgx/0T3+XCGGV3G6b7nTY9GporsuLRA
	n1VcSsZ4ps3fiVuPvBJsnLXg/N3YwDdKr5/KTVC5pqrEtuKMYH9Gn6D6+psTzETeK8t1Jcy/
	+Fum1kj570rJws5302SSXe+59sZeC+OyEjdKlfmqdUXgSMAz5gWH1p+L7jz0LGrCsXmtSizF
	GYmGWsxFxYkAvrs9qhEDAAA=
X-CMS-MailID: 20250514133841epcas5p1993cdc39779e2e67790c84bdcb95a161
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514133841epcas5p1993cdc39779e2e67790c84bdcb95a161
References: <CGME20250514133841epcas5p1993cdc39779e2e67790c84bdcb95a161@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_235851_818211_B7089291 
X-CRM114-Status: GOOD (  12.55  )
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

This SoC has a single USB 3.1 DRD combo phy and three USB2.0
DRD phy controllers that only support the UTMI+ interface. 
This SoC is very similar to the existing Exynos850 support
in this driver. We have supported only UTMI+ in this patchset.

The difference is that combo phy supports both UTMI+(HS) and 
PIPE3(SS) and is out of scope in this patchset.

Pritam Manohar Sutar (2):
  dt-bindings: phy: samsung,usb3-drd-phy: add dt-schema for
    ExynosAutov920
  phy: exyons5-usbdrd: support HS phy for ExynosAutov920

 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 27 ++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 85 +++++++++++++++++++
 2 files changed, 112 insertions(+)

-- 
2.34.1


