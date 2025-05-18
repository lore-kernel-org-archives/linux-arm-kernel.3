Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45A4C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuTIFNEhjuQ85+QQGzAj+OEG2nYx+LsLsWxFAqZ7y7U=; b=B8U6gQD+so7Bt3A35Ia5tz09kG
	2O+EgFbry48oeR90nH3ECbGHImGUX665XfCCb9vPKcb9ABmrlR5KOnYNzAjGwZp4vDuMAKvAr1axJ
	+wZUQfKxANm52xYE81uAZZZJJwp/43EET/HoNAWTu1yf5u+VS27lYQk/xwEPsLu/MAznuMIdyOJVj
	IUMqv84NMzqmudadbIlfbF79ixYHCj8uH87GKcicy4gZHRRXRrjCAoLO9y6A2B4p1qvm2mbgdAaZ8
	AR1GnXP3SSHc31GiRIJZ2Rp1nyOp68sp+kCk2OUQv6KwbR0GDjfNbNIiK86PBcQEVOnAgAVoYFT5Q
	XgzJO+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx4Q-00000008dxo-3esN;
	Mon, 19 May 2025 09:46:06 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwot-00000008ZVf-1dyM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 09:30:04 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250519093000epoutp0229c26683ca3bea118f3e3227a3352ff8~A47Aek_Ei0861508615epoutp02E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 09:30:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250519093000epoutp0229c26683ca3bea118f3e3227a3352ff8~A47Aek_Ei0861508615epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747647001;
	bh=HuTIFNEhjuQ85+QQGzAj+OEG2nYx+LsLsWxFAqZ7y7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IvLgBCEl5pTCow6NOOqjyk6Gmz8F/b/2sdeNFArtgBhv15nlINVfFavUliJs/EWOT
	 fZuunkwRM5gX0G972BkdGNIL8myI5mWSisEf+ES0Ov/9zf99PI4qV9bfTSp6OPUDCV
	 4Oe3mNf/5ogWJF0M0tugqgwH9fc64pfQ/sLffbpI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250519093000epcas5p3c547f22a4a3250d09ced6e4c9d37dbc1~A46--ak0E1502815028epcas5p3U;
	Mon, 19 May 2025 09:30:00 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.182]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4b1C863Wsfz6B9m4; Mon, 19 May
	2025 09:29:58 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250518193252epcas5p3e4d1d329f1e5616e842801ceb26728b6~AtgF5nFzO0813608136epcas5p3D;
	Sun, 18 May 2025 19:32:52 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250518193252epsmtrp2afa5e6b63a5605d32da707ac5717baef~AtgF4rZI70226302263epsmtrp2b;
	Sun, 18 May 2025 19:32:52 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-dc-682a35e4c1eb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	16.6B.08805.4E53A286; Mon, 19 May 2025 04:32:52 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250518193249epsmtip1c2eae81d2f215bb8b46b8b517bb25941~AtgCoIpr01176111761epsmtip1I;
	Sun, 18 May 2025 19:32:49 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, Shradha Todi
	<shradha.t@samsung.com>
Subject: [PATCH 07/10] dt-bindings: phy: Add PHY bindings support for FSD
 SoC
Date: Mon, 19 May 2025 01:01:49 +0530
Message-ID: <20250518193152.63476-8-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518193152.63476-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsWy7bCSnO4TU60Mg2lXuCwezNvGZvF30jF2
	iyVNGRZr9p5jsph/5ByrxY1fbawWK77MZLc42vqf2eLlrHtsFg09v1ktNj2+xmpxedccNouz
	846zWUxY9Y3F4uz3BUwWLX9aWCzWHrnLbnG3pZPV4v+eHewWvYdrLXbeOcHsIOrx+9ckRo+d
	s+6yeyzYVOqxaVUnm8eda3vYPJ5cmc7ksXlJvUffllWMHke+Tmfx+LxJLoArissmJTUnsyy1
	SN8ugSuj/fV0poId7BXfj09ibWDsYuti5OSQEDCR6Pr7nbGLkYtDSGA3o8T+SbdZIRKSEp8v
	rmOCsIUlVv57zg5iCwl8YpTYfj4ZxGYT0JJo/NrFDGKLCJxglOi7ZQkyiFngPZPEzAW/wJqF
	BXwlrrzbAGazCKhK7HnbztLFyMHBK2Al8aG7GsSUEJCX6O+QAKngFLCW2LZ+KhPEKiuJhU92
	MoLYvAKCEidnPmEBsZmBypu3zmaewCgwC0lqFpLUAkamVYySqQXFuem5xYYFRnmp5XrFibnF
	pXnpesn5uZsYwZGopbWDcc+qD3qHGJk4GA8xSnAwK4nwrtqskSHEm5JYWZValB9fVJqTWnyI
	UZqDRUmc99vr3hQhgfTEktTs1NSC1CKYLBMHp1QDE6vGcv9Wqw0nbHbsjLePvrcp82FWTYj6
	lfmS91a0FCTJ3nwg9He/FOPnptxOl6s2vqKXn3AEb+486bBm5blFahdkVMrTZq66HKf6Yek1
	7d3nPQTO5nhP31r+85N94frIorMfrx+LiTnokOBsfV/npvtOj86mfWzLF2ZNuHD5VkrF0+9l
	/Knf257XvxfmuzKFgbGq9F/B3wf+52927NHdUPGjfa2j1alzPjzpCgcd8vsNtonmXDjq8PhN
	o8GvC68OR0xdd1508qfU7siH1+98POt2mzNr7onpZoJmErsUBX8VlVeeDP/xpDhL3CH6MR+j
	WdVLQZOJG/20b5zdk77utOeR0lgjs3uW+vFR3zjd2pVYijMSDbWYi4oTAV1WeJEzAwAA
X-CMS-MailID: 20250518193252epcas5p3e4d1d329f1e5616e842801ceb26728b6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250518193252epcas5p3e4d1d329f1e5616e842801ceb26728b6
References: <20250518193152.63476-1-shradha.t@samsung.com>
	<CGME20250518193252epcas5p3e4d1d329f1e5616e842801ceb26728b6@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_023003_742791_D895D89C 
X-CRM114-Status: GOOD (  14.31  )
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

Document PHY device tree bindings for Tesla FSD SoCs.

Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 .../devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
index 41df8bb08ff7..3a5bff0fb82d 100644
--- a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
@@ -15,10 +15,14 @@ properties:
     const: 0
 
   compatible:
-    const: samsung,exynos5433-pcie-phy
+    oneOf:
+      - enum:
+          - samsung,exynos5433-pcie-phy
+          - tesla,fsd-pcie-phy
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   samsung,pmu-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.49.0


