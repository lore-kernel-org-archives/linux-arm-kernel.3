Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24860CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KPPBz32Obx/gObmdEjVCsA04oyU/9osrvcmTZJ6JNI=; b=Ugi5RyT5hgXeuVLJknhmDfQ91y
	PfFcuV3XH1/y0tcOwc6WSbJWZG2SbDNUqQ5kZwVXGWy/1SXf3SpKb/k3v29No+mxC0snDvASHoq1g
	HgrsvrZbvcVWes+7W2/YhPGPYcZs+VO+VS8/KzDuQIgCj+M8jmFpeCinAeeWbAG1+GSN3fCodsEFl
	8o1eFttOh4MfQoxWezY39KkyuoCGEEpesz8C3EVVch1TipeTggsInUyDPc5PJX3qYVmX+u0yC0b6L
	WXEJA4wiDvA5AON76+mHTGl/ZPMTLRspAp/3D3fP0rd6pJgK+ZwIRqnRCLcEDky6fnaghZ9LiHYbO
	sH0uHiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp4R-0000000DUte-31BM;
	Mon, 20 Oct 2025 12:33:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2D-0000000DRjc-2SaL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3KPPBz32Obx/gObmdEjVCsA04oyU/9osrvcmTZJ6JNI=; b=LcIBl9Jo2JqElFT6i34uObwfwz
	XAXhH21sYZ/KkOvTei7hnqcpADE479ZULaEQx+FUvj1AQP5UFyuPyddXRTc/C0UKrtx8NHunKD5v2
	X1tmRxE/u3QUxXwelcwpSR5y8el4peBiaVF1IZWSkP2YiZfM6TaMVn2pYtkGcqw7X9s4YORKzT7Ts
	XILsgHp+wNNn6728Ylj2Jces8v8WdXm8IwU6QlaJTljzbBYHtQseOYKvL2bAK3lXO5vzW8DzSXmBY
	WLlv+3u+tlULDto5ebzanlXbT8ivl2/+SsiKg/23hxr4xr/tBu4fuUkQ8kjJVyA9xH0PMhKaha5qT
	DuZWl8LQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp28-000000074KR-21Ez
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1CE348AEB;
	Mon, 20 Oct 2025 12:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2297C116C6;
	Mon, 20 Oct 2025 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963416;
	bh=KFo9i6r6U/JFUE2elWOLNVjZ2iw4+N5AISZt4DbS7Jw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bupIhxnQIKiXor6iYFfK547TwX0NFDQhvmyIW0bHc4SADgKdCPYduSw+HL66ASY4G
	 t7ycP3Z63Ogk7tZudbD4I0QcMop9dq63ScqLdnrF46tTwHBy+1D5RzlhH/B4cJfZ0e
	 +YvTEaILplNWiHmC8/t+ncceUGIk2VFnkiIr/g72K+djU4pr88qPu1Qog7Wmqake/c
	 +Hu4Fksc2Wpf/NSZeAImKwvWLy3Frrmce1aNfGdRZ87+Rscyb6y8kl9bfbk97MBW1O
	 3qlKaihHY+ThXQb000EyLJE+UQ19bDTmtp7WnO044o4V91uKwFw4oYhJVQDnOcS2nw
	 ozurH7CJ2LC7w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1j-0000000FUu2-0AXd;
	Mon, 20 Oct 2025 12:30:15 +0000
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
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 25/26] irqdomain: Kill of_node_to_fwnode() helper
Date: Mon, 20 Oct 2025 13:29:42 +0100
Message-ID: <20251020122944.3074811-26-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133041_913679_DFE2BBC9 
X-CRM114-Status: GOOD (  11.13  )
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
Tested-by: Will Deacon <will@kernel.org>
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


