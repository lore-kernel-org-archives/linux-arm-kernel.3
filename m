Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9209103E19D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABwVqJEKXShJhu5wwW+xosk19sSXIbsBUFMd4LxmJkc=; b=AcNnoEZguvlhxiBH974cR/BgOw
	u/YbN8hU34YF+H01U450+Qv86ZDElJbdfhum19n/pH1shVTP6LZF3H0/95RtcFnL8SOu+5WKxlX83
	J9JX5DgfNkcCVTaWib9odvk0xIoW4Yil5EB/3t7KzFFMYOoKBNMq19Bv3ZVWCsvvjuz8iWhcguub9
	wNMMHXwnlG1INGHu13htSEHzqhXI06F9rADYJshxDXA0Jh1Jn4xfMSX9/7UqR4tTZdZDStmlqYDW8
	+fVjMJCj/yGBHjxEUygWaNHvWtq/1vxXVjeOttuRh+3nGbyldeDJrk4OEds/Cxk/doXc30QGDg23c
	UVOMuQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tHU-00000008rNM-1nCY;
	Wed, 18 Mar 2026 15:58:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tGq-00000008qdu-3LMr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 15:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ABwVqJEKXShJhu5wwW+xosk19sSXIbsBUFMd4LxmJkc=; b=Qkk4oJzlbBOg7eb6NXmyiMyMq9
	pcaU+HMzdgauD32Xs0DliXhnMu4kwfeT6acpE/8vd05Lh6TFZBpk19P0sbL2K4QyZuWyfKrFQlBZX
	XrLpD56Phe1z9TVFs636AAyzgpu29iTOGyCctKrUEqaM+qsTjn490jzT0cnEsXxmRT4M9k67+NWZB
	vkzyuXsBQWA1NCRUXzxrFuiD+zTDwxNGJyG8+K0OScnxUYto7FAMrgtqsi1xcEQV0SGpaTmCAOKkW
	DL0X6c2j+yuddb5NaPkGSkS+XqdHHjEkCZi1DWB8SyfJPmqNCep06bsd2G2cNel+4x+IFIgNBXky5
	8bjb1CNQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tGl-0000000Be4w-3so5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:57:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6A0F2103;
	Wed, 18 Mar 2026 08:57:08 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAD883F73B;
	Wed, 18 Mar 2026 08:57:11 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: [PATCH v13 47/48] arm64: RMI: Enable realms to be created
Date: Wed, 18 Mar 2026 15:54:11 +0000
Message-ID: <20260318155413.793430-48-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_155716_111796_9573B421 
X-CRM114-Status: UNSURE (   9.51  )
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

All the pieces are now in place, so enable kvm_rmi_is_available when the
RMM is detected.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/kvm/rmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index f69151d4235a..e76e58762f55 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -1723,5 +1723,5 @@ void kvm_init_rmi(void)
 	if (rmi_init_metadata())
 		return;
 
-	/* Future patch will enable static branch kvm_rmi_is_available */
+	static_branch_enable(&kvm_rmi_is_available);
 }
-- 
2.43.0


