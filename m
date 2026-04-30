Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F80FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j/TN/sU2SeyLWF88svOm2fJwSQECH2WOcEkvYKP5mE0=; b=eowJua6cqBI0gRpvGJ/b0mCa0Y
	zMRJBugZdCDnkkxpwuTdCbK0p4439HVvNtPE+eBrew8vQBjbiDI7CYsQe8A8P5v+XQy78Shq0alf3
	DpC9GyNieTpp4umKnfcPDPnio5hn9VfAO2Sk/W+qy7Kisau7cUqQKtTiNCIaO30d//cOmBbvLybjf
	FMzft6YR1UwCPfhHU9/7VpLh9yZjRGpgmRL/eCCSyEEc0rPJufVCBBDzaMTwSV9mfQoPJ4dWDUBx8
	dWm7pWYZRbsvr7f0QWLjZzJnVnZ7MHtW36ky96dRu7ZB5UJewSRjCMQkq+Zsys+1c7xKjFYixYfox
	gU1toDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUWr-00000005lFL-41HR;
	Thu, 30 Apr 2026 16:46:21 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUWl-00000005lDD-0Nwq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 16:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=j/
	TN/sU2SeyLWF88svOm2fJwSQECH2WOcEkvYKP5mE0=; b=UlYRivl5PRPN0RnQgS
	apwtnEeuoS/v4htzI6LuAGUZ8b0J3FahGD4DZhAKSp5Ox68WP6p8ifbYbNzaMEmK
	+wvTs+AzQ1yPFtQUg+VMx0Xl97RHx4a8GJHMFnVWDE/zyvRbZ4dw9i1t2VUBzoTk
	3m3Q8SSwCpn/bwm7fsQse/A6E=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDHWJ46h_NpWWQZCg--.13259S2;
	Fri, 01 May 2026 00:45:47 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 0/2] iommu/arm-smmu: Use FIELD_MODIFY() for bitfield operations
Date: Fri,  1 May 2026 00:45:43 +0800
Message-Id: <20260430164545.49637-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHWJ46h_NpWWQZCg--.13259S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry3Cw4xKF4kurW3XFW8WFg_yoW3JFXEk3
	48Aa93t3Z7AFyayF1FgF17Jr1kC3y7ur1DArsYqas3t34DXr15WFsaqF95Gw4xGF4Y9a4x
	t3Z0934fAF97ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRidbbDUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxtH6mnzhzsO+wAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_094615_591472_725D8EA2 
X-CRM114-Status: UNSURE (   6.78  )
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

Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
macro. This improves code readability and adds type/range checking without
functional changes.

FIELD_MODIFY() internally performs the same mask-clear + set operation but
eliminates repetitive boilerplate.

---
Hi, If the Maintainers think it's not necessary, please ignore it.
---

Hans Zhang (2):
  iommu/arm-smmu-qcom: Use FIELD_MODIFY()
  iommu/arm-smmu-v3: Use FIELD_MODIFY()

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 5 ++---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c    | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.34.1


