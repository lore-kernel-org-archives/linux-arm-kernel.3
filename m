Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B744C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tf6Cq6cPOgsZxdvzVE+An28hz2bl2bYPUa5Kw/cEUUs=; b=fSAGpjJN3HlvDfWfGR3bmj4Fcx
	hzQArIkpw2R22aHKu+s57cNncRRdl81Qgj122/s5k3Jau3eKpXgfTGAHh3tD1JYbOM07yD/rrt7EI
	Iq5GS2yHv56r4Sa9Oj/m3hg+UsBRVXGBcT+GFddidXTL5RrCY3PySVA9iCCVklduFSK8KsM7Ilzdq
	E5PqTxTT1THXw0whGsedvGbLscJ538y4Q+sCHDMEGs+2GR7oQlc5HsHVFtuyWFU71Q0v0gdoPlNjU
	xjabNNtPZAYSKQcX66YmIU0Iz7/iG2/cAt8XqMw3gIKscRHp12FT2DNynVQf9B86A8NAKsLyBkyoZ
	T6xv5ErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikdr-000000074Ll-3Z9q;
	Sun, 12 Jul 2026 03:14:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikdp-000000074Lf-47Ql
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 03:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB0EC419BB;
	Sun, 12 Jul 2026 03:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B945C2BCF4;
	Sun, 12 Jul 2026 03:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783826045;
	bh=mmOkhodHGtEQly1sJFXQCl0QkPRAuKzorAgvaUlQrpk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Nuav4sd1jzHBwS6lSQL5X95lx8S1SXKL2p2A9cyPJIyOVbXmUPjCmOnEQDI39iChb
	 m7ROshMWdHvDfvHjDNXgi++ec7c96YHppV23Rdoaf9ezqSYajeVQ/X5V4LUDtUmDF6
	 YOX63eNQYDOgHj+nj4EXqsVdqtBQkpfsTdsBvGULZTvIlcBwH+EDvildpXB+QshdGO
	 i+108STxuKEwdMRK7/3taHwCrbgFpTk/mM4K8GXa/BIpRKRCdBSsaifJ17hZqxbldv
	 pfj2aqzzOZKVbEze31SJyJBRQ5qPUpDdEK1OnoiLoa9Y2mBN9GP4vS0RZNAM3Ymi8a
	 BtMc0yFY/fHWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A9BC43458;
	Sun, 12 Jul 2026 03:14:05 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sat, 11 Jul 2026 23:14:01 -0400
Subject: [PATCH v2] iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-sm8450-qol-smmu-v2-1-41a6fba41c3e@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CMBREr0L+2pq2CAVW3sOwQPqRGqHYD42G9
 O4W2Libl8y8WYHQGSSokhUcekPGjhHkKYG2b8YHMqMjg+Qy50oIRkNxyTh721eMw8IyhboUqHl
 aKoiryWFnPrvxVh9My/2J7bxptkZvaLbuu196sfUOey7lv90LxlmqUCIWuit1c52cne14HhDqE
 MIPrXS1FbsAAAA=
X-Change-ID: 20260711-sm8450-qol-smmu-57ed91ed0397
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783826044; l=1419;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=IfJaejqIoPsz18N/gqtzvEjuLMyEPDB5DAuVkODkmwc=;
 b=UvSUTz/MEMZyJa7vizKpKWIYxkiZgRxVdBJ+9EKLTBhRtjyn7HLNnNYv7ncQG/5rvMzEMVbEi
 1LpVyl+XTlpB1FA0BgmVY6yPnRyCCrkkSS8bu45gFrluIVoQYEDttnj
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
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
Reply-To: esteuwu@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Esteban Urrutia <esteuwu@proton.me>

Add the compatible for the MDSS client on the Snapdragon 8 Gen 1 so it can
be properly configured by the IOMMU driver.

Otherwise, there is an unhandled context fault, because the framebuffer is
already configured in UEFI.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
This patch allows the MDSS driver to properly function on SM8450 based
devices.
---
Changes in v2:
- Split series in subseries (dispcc, dts, qmp, smmu)
- Link to v1: https://patch.msgid.link/20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index e2c914fccd6f..795e8ec7e8fa 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -425,6 +425,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{ .compatible = "qcom,x1e80100-mdss" },
 	{ }
 };

---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260711-sm8450-qol-smmu-57ed91ed0397

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>



