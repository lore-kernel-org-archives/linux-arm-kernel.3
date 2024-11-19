Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA504D60CF8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 00:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nl8ywQLjASF9Zz0aBIQ1C3qovRQpxOk3WPW3oNZTibc=; b=alkomP24Cnu8BftCIOOqdHE5Oj
	iMrcTZ/Y31Ze+zEnstFLbcDviys1Ek8JWcM5dGXGw3qq9fTEtS+mP7dFsZWqjtSiakhPmzed94Xym
	QBt794y/QFUjznet/HE1+xfDtU9tacEgqAca0kDdgd8Sf61PCwhb2rFD3+WIACMC8h39WKFVzWbSM
	BFGN9Wfmc1EoeGktlGLeASLU2nE53BK9NK9/QaXKgaxWBkmuLVDqUy+LTZgo3NvLmmsVEeIY0qFm4
	ZS8YFc+PP2Q7E9i3cq+2xztdL4Nl43fz6k7c/tuUebS9oIwsZc0lOkILSStY6DZjpOAn7axOpgTxp
	iaQ+JMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDC0T-0000000Avfu-0R0j;
	Tue, 19 Nov 2024 00:22:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDBzX-0000000AvdA-0Og5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 00:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731975672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=nl8ywQLjASF9Zz0aBIQ1C3qovRQpxOk3WPW3oNZTibc=;
	b=jB3jSG9/1RpT3XOfwosYdQ88BW1/aTf0nQzGPWcIkjYvxrIfoI0/cd2rYYE1qTP2QwvVNs
	q1ZVE47Abw7x+Nv8oUMbpiULjoVkndhAJtJ0AIcqrIB1cINqhpZbeUI1DrYyJM1Qws0vxC
	kcZFqSsvAcr2VWJGMyKpebdE1B60iPU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-XFuaW9rPMoW9R673VHcpFA-1; Mon,
 18 Nov 2024 19:19:33 -0500
X-MC-Unique: XFuaW9rPMoW9R673VHcpFA-1
X-Mimecast-MFC-AGG-ID: XFuaW9rPMoW9R673VHcpFA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ECF111955F41;
	Tue, 19 Nov 2024 00:19:30 +0000 (UTC)
Received: from localhost (unknown [10.22.81.145])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5433E1955F43;
	Tue, 19 Nov 2024 00:19:29 +0000 (UTC)
Date: Mon, 18 Nov 2024 21:19:28 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH] iommu/tegra241-cmdqv: do not call smp_processor_id in
 preemptible context
Message-ID: <ZzvZkMKhwmJESpdM@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_162115_255738_FC1947F4 
X-CRM114-Status: GOOD (  12.81  )
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

With PREEMPT_RT enabled some of the calls to tegra241_cmdqv_get_cmdq()
during boot will happen in preemptible context. As this function calls
smp_processor_id(), these calls will trigger a "BUG: using smp_processor_id()
in preemptible" backtrace if DEBUG_PREEMPT is enabled.

As tegra241_cmdqv_get_cmdq() only calls smp_processor_id() to use the
CPU number as a factor to balance out traffic on cmdq usage, it is safe
to use raw_smp_processor_id() here.

Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index fcd13d301fff6..3ea4369e838fe 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -339,7 +339,7 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
 	 * one CPU at a time can enter the process, while the others
 	 * will be spinning at the same lock.
 	 */
-	lidx = smp_processor_id() % cmdqv->num_lvcmdqs_per_vintf;
+	lidx = raw_smp_processor_id() % cmdqv->num_lvcmdqs_per_vintf;
 	vcmdq = vintf->lvcmdqs[lidx];
 	if (!vcmdq || !READ_ONCE(vcmdq->enabled))
 		return NULL;
-- 
2.47.0


