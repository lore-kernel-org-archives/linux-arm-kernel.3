Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3031C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JXJPK8Pxeu+1hTQ6X+A9fh/NPx5Fi27JyhWAictUa0=; b=YM6rZ3aHuOrzfjeQ/Tx5EzCvR8
	S/eDknpv+x060bNnscOAf9eJ1Qk3LnwhkpUL/hyosNm7m+lzOVPoh5t642WdU790i5Lw8aESIi25h
	aL09umKdQfEoy6yuYELCoo3me/rIN0eigh1iMdyo0bbrAoRj1BEpmNU6rCvfh1P3FeQO0lL/p/bHu
	wnJW1duaChMydlhKZUhxcEkV6AsCHb9U0hZQkdWEuC8dxPcUvybNFUvXveQ5AA55VzkhcCcGwLMEY
	wbPRFNZfvS7bQITaZzDrBkeKD3MwLiqc6F1HNOcsQUfHekSo2XbjIKuL7Nq1F2JhVV31r0+aV6nV9
	fAXBJ+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxAM-00000008fpu-3Cqs;
	Mon, 19 May 2025 09:52:15 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwp6-00000008Zbp-33YB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 09:30:18 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250519093015epoutp03cefa699bc260a07572c216ca55b47441~A47NkciMd2908929089epoutp03N
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 09:30:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250519093015epoutp03cefa699bc260a07572c216ca55b47441~A47NkciMd2908929089epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747647015;
	bh=3JXJPK8Pxeu+1hTQ6X+A9fh/NPx5Fi27JyhWAictUa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWrJuSD1Bu1XE6n79VK8PSLESyAOwgwXCTZkqyuntj1p2LE+Bl8EeACGopzO2DfL5
	 U87wbJNIy+0Xx+jvEkYgftCnk/KsGbuXrIVfHhfsvp2QxZ44dbr63YUUkDxVxaGtp9
	 UlAhs9j8nF2JtL+3LW9NDKsysZfF+ZFQGNkysMRk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250519093014epcas5p499efbb243762f4c0d7b482ab6d6e64dd~A47NDNaaO0739507395epcas5p47;
	Mon, 19 May 2025 09:30:14 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.177]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4b1C8N23NWz6B9mW; Mon, 19 May
	2025 09:30:12 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250518193305epcas5p263b59196e93ef504eab8537f82c37342~AtgRoIaZN2822528225epcas5p2x;
	Sun, 18 May 2025 19:33:05 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250518193305epsmtrp158ea8f08c187125ab00047b623695cfc~AtgRmSg2r2903229032epsmtrp1D;
	Sun, 18 May 2025 19:33:05 +0000 (GMT)
X-AuditID: b6c32a28-46cef70000001e8a-02-682a35f1b01d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	63.6A.07818.1F53A286; Mon, 19 May 2025 04:33:05 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250518193302epsmtip183267af4e412e5df727520c6d803b916~AtgO3rs881176111761epsmtip1O;
	Sun, 18 May 2025 19:33:02 +0000 (GMT)
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
Subject: [PATCH 10/10] misc: pci_endpoint_test: Add driver data for FSD PCIe
 controllers
Date: Mon, 19 May 2025 01:01:52 +0530
Message-ID: <20250518193152.63476-11-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518193152.63476-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsWy7bCSnO5HU60Mg+kHhC0ezNvGZvF30jF2
	iyVNGRZr9p5jsph/5ByrxY1fbawWK77MZLc42vqf2eLlrHtsFg09v1ktNj2+xmpxedccNouz
	846zWUxY9Y3F4uz3BUwWLX9aWCzWHrnLbnG3pZPV4v+eHewWvYdrLXbeOcHsIOrx+9ckRo+d
	s+6yeyzYVOqxaVUnm8eda3vYPJ5cmc7ksXlJvUffllWMHke+Tmfx+LxJLoArissmJTUnsyy1
	SN8ugStjyYJ9LAV3uSoOrd/F3sDYy9nFyMEhIWAiMX02YxcjJ4eQwG5GicY3+iC2hICkxOeL
	65ggbGGJlf+es3cxcgHVfGKU+Ny2iA0kwSagJdH4tYsZxBYROMEo0XfLEqSIWeA9k8TMBb/A
	uoUFIiQuXNsG1sAioCrxeOtHdhCbV8Ba4sydLewQR8hL9HdIgIQ5gcLb1k9lgjjISmLhk52M
	EOWCEidnPmEBsZmBypu3zmaewCgwC0lqFpLUAkamVYySqQXFuem5yYYFhnmp5XrFibnFpXnp
	esn5uZsYwZGopbGD8d23Jv1DjEwcjIcYJTiYlUR4V23WyBDiTUmsrEotyo8vKs1JLT7EKM3B
	oiTOu9IwIl1IID2xJDU7NbUgtQgmy8TBKdXAFN7Ve33a3sO3D+05uOWgFm//iZDJhpbn2HJn
	Bwd9bWFqfTnrgfqXdTPuPMx+UzDlT46Y14SjMr4VBSs/7VgT+b8xTPTSKj7uE+pn90Yoteqt
	nfuOzeJbmaFz01FbwcthpWziLN+nTvz7dbX+VAPRqA9mN1/9sYtQmcKx4Cz/0We3Zjl7hey+
	nGrdn9T4PLq674le9MkXa8RL9s/SaxXcY73NcG1nb8TSW6nJBUqCu0WPFx/2nCHZVmrZyPz2
	k/UMMcX6HBXhNMm+C9bd7nuvsxoc/LKeOdDE/esO3h5VrZ7p3Qf+rPn1ycK7+vv81iq31NS1
	V1i37Te5pbtBZfu+d1KGrZM6V3RKqwh2LFp8QomlOCPRUIu5qDgRAORarhIzAwAA
X-CMS-MailID: 20250518193305epcas5p263b59196e93ef504eab8537f82c37342
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250518193305epcas5p263b59196e93ef504eab8537f82c37342
References: <20250518193152.63476-1-shradha.t@samsung.com>
	<CGME20250518193305epcas5p263b59196e93ef504eab8537f82c37342@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_023017_078528_5C73D5BD 
X-CRM114-Status: GOOD (  15.56  )
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

dma_map_single() might not return a 4KB aligned address, so add the
default_data as driver data for FSD PCIe controllers to make it
4KB aligned.

Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 drivers/misc/pci_endpoint_test.c | 3 +++
 include/linux/pci_ids.h          | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index c4e5e2c977be..d94a94231ee5 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -1110,6 +1110,9 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, PCI_DEVICE_ID_LS1088A),
 	  .driver_data = (kernel_ulong_t)&default_data,
 	},
+	{ PCI_DEVICE(PCI_VENDOR_ID_TESLA, 0x7777),
+	  .driver_data = (kernel_ulong_t)&default_data,
+	},
 	{ PCI_DEVICE_DATA(SYNOPSYS, EDDA, NULL) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_AM654),
 	  .driver_data = (kernel_ulong_t)&am654_data
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 2e28182c3af0..e0afc5aa1c0e 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -167,6 +167,8 @@
 
 #define PCI_VENDOR_ID_SOLIDIGM		0x025e
 
+#define PCI_VENDOR_ID_TESLA		0x014a
+
 #define PCI_VENDOR_ID_TTTECH		0x0357
 #define PCI_DEVICE_ID_TTTECH_MC322	0x000a
 
-- 
2.49.0


