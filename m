Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA815C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 02:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JHsOsDckHVo//w2VdgCEPkkctFcuV1bEYTIhxBYox8=; b=lGpWiySDdXHs8GpiXoxejba6fF
	6+hZEQP5nDx0vay82SnS7Um1xurHfU2YN79AU9l0ZotSGtEbVDJoqc8aW3t8CdZi5wx6wOTCjhGuJ
	yebTGU6gJxhpHHpGHOXRGUtRKMGIwgq1HWaxnuegg7pkdVmjjEQHIgRZOxUvaWFnyp8NOqadSTKgx
	0YKHL9ajpAA1qParha5mzJHzKLTkzmddm9q6T+IR0iNtaLu1J+Jiv5pTNSsP+3o6GvU6x/nr3zERi
	C69xbLAZ4YR7enJSOibaAQzsKRelxWHBlGlziz1RRMTAGHTeJSBCdB2Otg3elWV8zYZquztCbNiU9
	8l7qVWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhcc-00000001r34-1DTq;
	Fri, 14 Aug 2026 02:26:14 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhcN-00000001qtH-3xEF;
	Fri, 14 Aug 2026 02:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1786674328;
	bh=+JHsOsDckHVo//w2VdgCEPkkctFcuV1bEYTIhxBYox8=;
	h=From:To:Subject:Date:Message-Id;
	b=mdonYydkaZWCy9rPc3xl60ffhU8oiCOL31GMJAkhVcNqN1ZtlLS8MMPQqa0LIvNAT
	 pH+VR9m4NvAFMSkp+aFNIELoH7iDxMb5/3il03Q7WNx3zZVrslK65OmsgFfdATwd0H
	 XR38N97qhxIq9fHBd6tIjFx+W5YHHHBBHKDZA+W8=
X-QQ-mid: esmtpgz13t1786674319t3b7866cd
X-QQ-Originating-IP: GlwC8Vr0+V7hKAQdo72tO4IUyru3W/s/wqJTId8HJ4s=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Aug 2026 10:25:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9741115489482611219
From: Chaoyi Chen <kernel@airkyi.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 3/4] accel/rocket: Fix the extra iommu_group_get call in rocket_job_handle_irq
Date: Fri, 14 Aug 2026 10:24:52 +0800
Message-Id: <20260814022453.437-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260814022453.437-1-kernel@airkyi.com>
References: <20260814022453.437-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OSUW9vQLVhiZnVnT0iJ0+gB+gVXLNLc+u2f6OAwE7CJ5njNmd42e20Ut
	latgoRVgYiij1hDnX0WX3lh2+rd9DNctZgne9HlJTbUM3Ia601EDVm8mbxyfFc+2ZTHJMBN
	f8XFMcgQGKDXGoLDHeNkRBvFJChIJwUn+jXnDEYPmBhM8fdQ7e8VH/lfRIc8nM8fHSnwXIA
	h/nQWo4wl8VVtx4VVMDBbwhFkDnttuwAxBpoum80VUOb2wGgh637zTuHGWtFoXOSfbEsoiW
	JCUogacEmy90vVhQO7U+V6hrXlQTp8fNsm3Jp2tp3P1hh5L7REpjS+JypKJdj+V921kjxOI
	FxdeluE9nHXczk8tES/frfnaGm+FiT/Le6d0tEZm+kA8pODTOibcmD2lWHHkOSjdaQ3OFAM
	M/kFDI7kSGsMYV/1Rx8EGqvpc+aE4U7Og1wlUhj1md9NmLbpyfv0AclmYF9OcEWBKSoJKaU
	sRg9vzD86KPBBXo4+XN1QCC01llJpEwVoCMMMryW7J1yEzUB6huz99AFvEb8F/Ns/HEzIUM
	Ypyv2yoHb/sedSdOa5eFgC/tHpb1yRKUbrT6J8aVlx2GRaIEpH3XUIGO7io+Zs+iL75Ae00
	lj5+w6tkxrf3pLXQ4Z8PiTCqpchgXN/lC9aZFjxO/C4RYlVy4kBJL9koWMiFVWRfk8SzZP+
	q/IRGJX148MwSiCotZpdxVEYH2yC2AkjUttvMtm/qfJNwpnFKzqNXjjCkxqsppwpFF9oWM2
	r76wCw94soR+l6gBGuEEowGA7BJr2wVUrYb2OM4IouovpKrkG4NYTngcBBSCA3QOCVzNg27
	FdgP1DeNPWeqIQebjrw9zJVqT8KCHVYybpyYMC8pOzltOHgLGw4wQAo7+E2AR06fgzbiO/L
	3032yPvgggi2j9h5NaMJEotRQXhineV99uHId3afSh6MinMIaN2j4VmEKsCIFoABX95iq2m
	YtvI3jzRSdjMlKHv0QsG6e2Fbdte/2+Cs6CCOgy7ZaBSCSRRYrVMAAlGcVFs6DfX12yRZZe
	0VcxriPYjt8C7Oj5Wl
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_192602_652519_390D08CA 
X-CRM114-Status: GOOD (  10.31  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The rocket attaches the IOMMU group in rocket_job_run() and detaches it
in rocket_job_handle_irq(). Calling  iommu_group_get() in
rocket_job_handle_irq() causes the reference count to increase
unexpectedly. And this causes rocket_core_fini() to fail to release the
IOMMU group, leading to a resource leak.

Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/accel/rocket/rocket_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 2f1861f960cc..db10848926d8 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -340,7 +340,7 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 				return;
 			}
 
-			iommu_detach_group(NULL, iommu_group_get(core->dev));
+			iommu_detach_group(NULL, core->iommu_group);
 			dma_fence_signal(core->in_flight_job->done_fence);
 			pm_runtime_put_autosuspend(core->dev);
 			core->in_flight_job = NULL;
-- 
2.53.0


