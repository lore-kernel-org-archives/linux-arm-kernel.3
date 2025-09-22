Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8D3CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6n1Wh09NWSlT1hVY5gRwmyu1jzZhXiHGwxzrAq5RhXg=; b=aaHVS5aJIMi2EyP6KEeE2QJV4S
	cNnf7cpB6R3fWR4FM442gIV8eSF2vHtwraKya2lUe/yZ2AuWSO0CiS4O4iqrrAEoim2u+A9PBVGZT
	tYEpuPb7AZb7Fmw3DuouD1eWBdND1oF7r7tlJXPFgtEgweV0j7HZJmsAk60rx7Y8kab2UZrrAv1F0
	hlzWZnmvnYzgUz1PNBuRyBhHnTH0XLge4UG1RcIfKjfXaYbv0R29OAgbpuD5Ui+Xq6VMSuoMpUSHz
	yxQSdeX0kYrGlwdJLYJVx+hFyAWBbRPjkAZGrOH2s5C4tzpET6CrMA/n9aDUS0JFgmgVSR9y+hOoB
	pun1DCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bvP-00000009irJ-12MM;
	Mon, 22 Sep 2025 08:29:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buk-00000009hgf-3Tu0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3A3444EE1;
	Mon, 22 Sep 2025 08:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9780BC19421;
	Mon, 22 Sep 2025 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529730;
	bh=Fx/E7oy6R/UrfCZVgp/oGljSUU8nvVLOsITLcZjwrgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2O1utI3K7Phivaz71zscKCxzb6JQLvDE3hoXpoZ2VOBu+OMSBRmIDU3O+/Doaabt
	 EzxvHROHbgcjvuw9uR09gVay4VfmVtwnYve4G6B6eBBHOdacySxILiN2IMOgA8cpz6
	 FGN3W/1+eocopJ6rARZT2hg6j9LZfiHctgX6X/HZzCjzXm3WxjIiVg4SUGPxfPCxsA
	 2lTs2HpweaDTeB5YIcPDV1xAIkg5Uoc6Stl98SjW6+Eh9L28qW23WYIY/YElg2DwT2
	 kyBSu7u/d1qDUqBdCY3SfE2M2o7e44O3Il+/37J2ABOfT/s7CrnetsbvfyhZ9vWRtH
	 AvzG3fFhaAV7A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0bui-00000008Kds-3VXl;
	Mon, 22 Sep 2025 08:28:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 25/26] irqdomain: Kill of_node_to_fwnode() helper
Date: Mon, 22 Sep 2025 09:28:32 +0100
Message-ID: <20250922082833.2038905-26-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922082833.2038905-1-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012850_891769_A9311856 
X-CRM114-Status: GOOD (  11.93  )
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

There is no in-tree users of this helper since b13b41cc3dc18 ("misc:
ti_fpc202: Switch to of_fwnode_handle()"), and is replaced with
of_fwnode_handle().

Get rid of it.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irqdomain.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 9d6a5e99394fa..5907baf6099d9 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -730,12 +730,6 @@ static inline void msi_device_domain_free_wired(struct irq_domain *domain, unsig
 }
 #endif
 
-/* Deprecated functions. Will be removed in the merge window */
-static inline struct fwnode_handle *of_node_to_fwnode(struct device_node *node)
-{
-	return node ? &node->fwnode : NULL;
-}
-
 static inline struct irq_domain *irq_domain_add_tree(struct device_node *of_node,
 						     const struct irq_domain_ops *ops,
 						     void *host_data)
-- 
2.47.3


