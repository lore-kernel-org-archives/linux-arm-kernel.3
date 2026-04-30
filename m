Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4008CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYVXjXirmIZR6ZQ1E8Pp2rDSwH80Wsd508YTDXQA1gI=; b=KwocSZewqZWkZmDP31xGY3iBHo
	QO1jTwO4BHpgmdF+oPT6IzDfKPMpil4skKHKtvQJrF2yDeIydUwuNbiuCXRPOQWGXIfrrIC9K/NA4
	+PR1TEO7VTkS4UMaFCNUV1peyz8cqushIGzoUKuYbpaw1ZsPap+ebpq1sLBU6G2Hi2AXf3eIax/pi
	bfwU6MO1WRuPkeStJNjLLsJXKFziwNxrikyQEv6hxbbLNuByQCLBwxTgbI4cQ6K37Zm4if77vREqH
	WrPrCcqoiZjnQbNHYizfx7TFBTBFsdVEF8fPUTduUqhje97CW2K2XpEJytDL02IhpYLsFROmA56n/
	70k5UobA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUWs-00000005lFg-10Cw;
	Thu, 30 Apr 2026 16:46:22 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUWp-00000005lE6-20fe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 16:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tY
	VXjXirmIZR6ZQ1E8Pp2rDSwH80Wsd508YTDXQA1gI=; b=mxSKAux+VowD81jPvF
	oC/9AUlsMcakNJ7xs19RLjcAQ/f7AqLKohf/7DnQRph+7/J7jfjydJTA0Gu3quXE
	QTJODTzgH+C25SZV/h6o5AhpMjMdQaoP2XDwTkXQE0AtoI8NAu2jU2Q5E4h8czxt
	gj9L4nyZeJePP8IR/d6R/ikLU=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDHWJ46h_NpWWQZCg--.13259S4;
	Fri, 01 May 2026 00:45:48 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 2/2] iommu/arm-smmu-v3: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:45:45 +0800
Message-Id: <20260430164545.49637-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430164545.49637-1-18255117159@163.com>
References: <20260430164545.49637-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHWJ46h_NpWWQZCg--.13259S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uFyUWw4kXF45WryrtFb_yoW8Gr18pa
	yUGryY9rnrJ3Z3Ca9rXF47Z3s0g3Z5Ka48Kr45W39Yqr10k34UWrs3Kwn5Krs7CryxGF17
	uws2q3y5GF1UCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi3fHbUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xxI62nzhzwEWwAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_094619_878044_59CF27C0 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index ddae0b07c76b..b62e91e4781d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -330,8 +330,7 @@ static int arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
 	case CMDQ_OP_TLBI_NH_VAA:
 	case CMDQ_OP_TLBI_NH_ALL:
 	case CMDQ_OP_TLBI_NH_ASID:
-		cmd->cmd[0] &= ~CMDQ_TLBI_0_VMID;
-		cmd->cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vsmmu->vmid);
+		FIELD_MODIFY(CMDQ_TLBI_0_VMID, &cmd->cmd[0], vsmmu->vmid);
 		break;
 	case CMDQ_OP_ATC_INV:
 	case CMDQ_OP_CFGI_CD:
@@ -340,8 +339,7 @@ static int arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
 
 		if (arm_vsmmu_vsid_to_sid(vsmmu, vsid, &sid))
 			return -EIO;
-		cmd->cmd[0] &= ~CMDQ_CFGI_0_SID;
-		cmd->cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, sid);
+		FIELD_MODIFY(CMDQ_CFGI_0_SID, &cmd->cmd[0], sid);
 		break;
 	}
 	default:
-- 
2.34.1


