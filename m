Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961E0D374A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUZmGyOcCXowYm37TdE3gRiV6SuHuDodVz3NI/T0JMg=; b=ge+Xrh+FkI5PEswJKwLkM9UGDR
	YO3Op1jIPylUv5+q+SKMmVgQL4uXBbY9SHLGZzA1pT7+5STu0fm+azeW0qgx5/zTd0CtngbVjPAqf
	7YI2I1Dui8Hk0mggIaqKljxxFLtyIAI++oXurHt21D7niwpsCFFqO7Lb1pzZGtFngWlxO3d7Z7jV+
	7ob+jEHJDd1xUUcehI9rKKtTK1xVMto+ioWZSuirFxczXT66Eva06jATLWt1NegncQnFBJQRJjs0y
	uNnt+keEBTSww3dW1zj436Sucr8JMGJxbYOlf+5GKcBKpk0/vvKt7c34KMK2ve5IAiDkLzrPNpgzW
	Qp/Kg4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRe0R-0000000A8QC-1FSz;
	Fri, 05 Dec 2025 22:10:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRe0Q-0000000A8Pr-1GLO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 22:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SUZmGyOcCXowYm37TdE3gRiV6SuHuDodVz3NI/T0JMg=; b=DJFgRsoVv29RobodWrqXe17rK0
	TdrAV8G+J3n1RjGpy6W3Zx+MlZq2T3Y6KkhxjWc334O8MhfDYj1bkLhsbB2Oal2mRyjV60QiM9u2j
	pB1EBnRYmHEG0oMxJyNj7OHxazrwIGolPyN1X0J59Y6n+6dU+kPTOhuhTYHI7TY+HZ/qYohl6NNZe
	rOyf9k+KtmHF6twWA4KLF7Vltg8AqG75fbIZl8Wvp8lioBGO9SrI9E4LjlYcahAbWD+vQnOfFTFia
	/3YDLNq+os9nU/cUehnqkrI7xcWN0KScqhYTzUKgCrCNzJYU1w70piFN9AcoXJwH9wGFIkE8eCMH5
	WdkJRx6A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRd8p-00000006tnP-25YX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:15:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0251F1BB2;
	Fri,  5 Dec 2025 14:01:19 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 868D13F740;
	Fri,  5 Dec 2025 14:01:22 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 29/38] arm_mpam: resctrl: Call resctrl_init() on platforms that can support resctrl
Date: Fri,  5 Dec 2025 21:58:52 +0000
Message-Id: <20251205215901.17772-30-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_211504_195939_A81B3BD0 
X-CRM114-Status: UNSURE (   9.91  )
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

Now that MPAM links against resctrl, call resctrl_init() to register
the filesystem and setup resctrl's strutures.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 00455de3efe9..eb3caee45470 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1768,7 +1768,7 @@ int mpam_resctrl_setup(void)
 			pr_warn("Number of PMG is not a power of 2! resctrl may misbehave");
 		}
 
-		/* TODO: call resctrl_init() */
+		err = resctrl_init();
 	}
 
 	return err;
-- 
2.39.5


