Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBDFC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4gn2eTg00df8U5IdZkWMPepVAvVYYSdUxbjRaptMcA=; b=QxWcPu7mF7CqGJKGoMrhQV0czG
	kePRxt4QxZnWj/1GaZjG7deFwJ1cVWgUZJhHRC0yGKBI3riVqFKDnGNgc5rlvnA3NuhwYRgQmaMbl
	GTCBTtaFubh71jncvLKpiQ7Cfu8F4ni3i+8e4ctewTjDlI9XnaYrvPAODapQqLmr0ph6CyJJDICtk
	5eHzkJHHAMQJ4Ec+zvePRdSzNJ4BPrP01tZ2dDebfbB6K6c+xRYdfv0DznrYlnyFyLPCiGDjRfmm0
	94vlU2yJ+zuwTtP4vYnSM3xpYHa3cdv9bCy1FzcUrrPGvgIGHxeQp+rStd6SLas7+GyhLDn8og5vZ
	JYwcHosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wv5-0000000A7uU-0xja;
	Wed, 16 Sep 2026 21:11:55 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wuf-0000000A7g7-2YuY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:30 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789593089;
	 b=k7U3FkbI8o98DF1/mw1OdcRHM5NUzoAg08Gk2QYb5LgfdXW+9k4mvul8dT9NBhbSLhziERJK4s
	  7JL1Fa/jUCXBikirIfBJURLUDyi1jl2Bv2n4WJIUFTHc2O4i25WT8rs/cp73enIHALrTxC2kNo
	  T0T28qDfzyPvSB9VSXzYHxARu1zbHP/bOyVVBg5P0hJmVe/yQcaFXSbFcW/NrB+U+iK4tuvLYf
	  5sbvg93CsCF84U9X/cUS/1UAmyKeIKIPLV1BMpsn2S4QkspjwV3YZpZA9GuCjS0wUcPV5Wlzjl
	  fNfaKI2PRB+78OqNkc9+aKocbXC0sFKObiJf+c4XkaHyrg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789593089;
	bh=K0aajd5pS48LBp4SgsLFJE8s+5HK9UUUoA1f8WnnLLQ=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=xQgxrfVUFne4xotCAQZegHXVi0+cFMea82qR+1eyU1YWu+bA3kKbALv8F5vIargvpKuyBspiOn
	  +XW6XMMEoGuigvkBn4UpfWBslhp/rqPe/2AOE2aCSC4F3m/xL6SEUOVOvBQrifJo7p/hnuTl0j
	  VzPuxvl+AfM30vprCWq4qcLVRvETf8vefrbIHc62XNWYGJI5MK1LB3kwXYfh7ggG6MhJvEOcpG
	  e8aLVa8t9NF8w8DINE7dNVZ1ck5qxqBoojxJbxO5MIisOZUA+8UXytE5tvTtHQGUnWNg0dHSMz
	  eCBzaRQ9fqU63EqK14gYhna2190b8fpscjWEqjzDgv9OVg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=O4gn2eTg00df8U5IdZkWMPepVAvVYYSdUxbjRaptMcA=; b=QPZOECjtzRlBMua7zsFoy0UqAd
	2WNovFO04X7rEH/6pUDhMUGcycPxVXwgyeUMAKfn3agwNOSuUV40N5JnWQ3TmdPCDF6Rk91s72Poi
	GG/6WPRXZjifL6QlpWUn2j0qq/PtQeV6Km1BYB6oeOJZ1glc+6RRHRQON6VM1/RFc2gU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuN-00000003Kvb-2tAW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=O4gn2eTg00df8U5IdZkWMPepVAvVYYSdUxbjRaptMcA=; b=lImYJULP606lAusNp0RIZVHM1H
	X+2IhcV4MWT1bJsGzKtI6WJJNy9MnK5IlHFu4gvLWCNpMW7byY+jYFgfU/ypI9MVic7iE/igZni1E
	Jy/VMKdw1Y4sewlhk9/OeFOlhmtjCVAYNM4k9l/e4pj2JKzUS//mokZnbxTh81JlMFoU=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuJ-0000000058P-1cbZ;
	Wed, 16 Sep 2026 21:11:07 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:49 +0200
Subject: [PATCH RFC 04/12] dma-coherent: add base and size APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-4-dac8c5eb4aa9@valla.it>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3008; i=francesco@valla.it;
 h=from:subject:message-id; bh=K0aajd5pS48LBp4SgsLFJE8s+5HK9UUUoA1f8WnnLLQ=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWR+3z9Go39bW/vGDvNcGNdnFXRt/XjNkVr17dU37w
 8NRCW+NOkpZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJvOFk+CvPM9lq7Raf75ci
 0k5+zblju7Lzf0v+/oi3C5ts/SekLqxl+CuzM//dPn65SDWJBx+kt8RvlDYztNkjHfP0fE9q2jf
 53zwA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 924a98e2cb61bc36f4eee2bc08183cbb
X-AntiAbuse: ID - 924a98e2cb61bc36f4eee2bc08183cbb
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuN-00000003Kvb-2tAW-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141129_815416_EE23AEBB 
X-CRM114-Status: GOOD (  10.24  )
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

Add two new APIs for the dma coherent memory to get the base and size of
the pool associated to a device.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 include/linux/dma-map-ops.h | 10 ++++++++++
 kernel/dma/coherent.c       | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 8fae2b7deb20..580b69321d56 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -156,6 +156,8 @@ int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
 int dma_release_from_dev_coherent(struct device *dev, int order, void *vaddr);
 int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, size_t size, int *ret);
+size_t dma_dev_coherent_size(struct device *dev);
+dma_addr_t dma_dev_coherent_base(struct device *dev);
 #else
 static inline int dma_declare_coherent_memory(struct device *dev,
 		phys_addr_t phys_addr, dma_addr_t device_addr, size_t size)
@@ -167,6 +169,14 @@ static inline int dma_declare_coherent_memory(struct device *dev,
 #define dma_release_from_dev_coherent(dev, order, vaddr) (0)
 #define dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
 static inline void dma_release_coherent_memory(struct device *dev) { }
+static inline size_t dma_dev_coherent_size(struct device *dev)
+{
+	return 0;
+}
+static inline dma_addr_t dma_dev_coherent_base(struct device *dev)
+{
+	return DMA_MAPPING_ERROR;
+}
 #endif /* CONFIG_DMA_DECLARE_COHERENT */
 
 #ifdef CONFIG_DMA_GLOBAL_POOL
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 45bbae947f4b..f4aa5813604b 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -277,6 +277,40 @@ int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct *vma,
 	return __dma_mmap_from_coherent(mem, vma, vaddr, size, ret);
 }
 
+/**
+ * dma_dev_coherent_size() - total size of the device coherent pool
+ * @dev:	device from which we allocate memory
+ *
+ * Returns the total size of the coherent memory pool associated to the given
+ * device, or 0 in case of no pool.
+ */
+size_t dma_dev_coherent_size(struct device *dev)
+{
+	struct dma_coherent_mem *mem = dev_get_coherent_memory(dev);
+
+	if (!mem)
+		return 0;
+
+	return (mem->size << PAGE_SHIFT);
+}
+
+/**
+ * dma_dev_coherent_base() - base address of the device coherent pool
+ * @dev:	device from which we allocate memory
+ *
+ * Returns the base address of the coherent memory pool associated with the
+ * device, or DMA_MAPPING_ERROR in case of no pool.
+ */
+dma_addr_t dma_dev_coherent_base(struct device *dev)
+{
+	struct dma_coherent_mem *mem = dev_get_coherent_memory(dev);
+
+	if (!mem)
+		return DMA_MAPPING_ERROR;
+
+	return dma_get_device_base(dev, mem);
+}
+
 #ifdef CONFIG_DMA_GLOBAL_POOL
 static struct dma_coherent_mem *dma_coherent_default_memory __ro_after_init;
 

-- 
2.55.0


