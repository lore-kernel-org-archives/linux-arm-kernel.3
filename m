Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60C9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZTweG2Tf;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=rd3Uzf/l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DDTZCgeXRZrOdO0H7W205aFqDmAAtb4mFnHHlLSHJyg=; b=ZTweG2TfAWmJnalbJRaVZilmkr
	/7/McTLn2yxTwRr5NtEefLEsz49K2YpGutud5UkBmVgdkEcy0Zp3lyxwclZN2PKJv72pwoWlcgAP2
	cncBlsS/XSWLYPsw+pi6Tbnn3GZQNKZ3GcD+WTX5pVHogl8s5qohFi/lyvicNnqVAROsu8RB1BfFu
	oIowzveyfKjPrC1OHi0MAgxihAgq7KThxLwzFRTCynVE73tGu2ZeXKu6yO2MovIXXXR7LxcV+gq39
	EIft9O+vcNd94bSp2D0tiGAwYQddzabKcl3j7tbV0XHyq4jFSONkU2uKhVXpQZoBud7P5E2YXJoIY
	uMZp1uuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgY0-0000000AxBj-28Ne;
	Fri, 30 Oct 2026 06:57:08 +0000
Received: from [113.46.200.222] (helo=canpmsgout07.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgXV-0000000Awqq-451L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:56:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DDTZCgeXRZrOdO0H7W205aFqDmAAtb4mFnHHlLSHJyg=;
	b=rd3Uzf/lVd3dYMhpJWMGIofKdjoCrwY0qYGiyfdrjCFCu0d68gxIe6bHFtsBIdj3n7QOIwXya
	yMfpNKsjgLK0hdIgIr0ykKAimNSJXtsYKZ1a126BmhvxAuXvmEY+aDLxfrm0vVGxfWU6J+de9ku
	mB1+lEy6T8RyLkbphvL+MdM=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jGBhV3sZhzLlt6;
	Fri, 30 Oct 2026 14:56:10 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id 31A144055B;
	Fri, 30 Oct 2026 14:56:18 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 14:56:17 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-doc@vger.kernel.org>
CC: <maz@kernel.org>, <oupton@kernel.org>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <zhengtian10@huawei.com>, <linuxarm@huawei.com>,
	<kristina.martsenko@arm.com>, <pbonzini@redhat.com>, <fuad.tabba@linux.dev>,
	<joey.gouly@arm.com>, <seiden@linux.ibm.com>, <prime.zeng@hisilicon.com>
Subject: [RFC 0/6] KVM: arm64: Add support for virt TLBID
Date: Fri, 30 Oct 2026 14:56:11 +0800
Message-ID: <20261030065617.4090073-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk300013.china.huawei.com (7.202.194.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_235638_235041_9757B0CE 
X-CRM114-Status: UNSURE (   6.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series adds virtual TLBID (vTLBID) support for KVM guests, built
on top of Kristina's TLBID domains RFC [1]. It lets a guest use TLBI
domains of its own, translated by KVM into physical domains via the
VTLBIDn_EL2 registers, so guest TLBIs only reach the physical CPUs
where the guest's vCPUs actually run.

The series adds:

 - KVM_CAP_ARM_TLBIDOMAIN plus two ioctls to configure each vCPU's
   vDomain membership;
 - programming of VTLBIDn_EL2 at vCPU load/put, mapping vDomains to
   the smallest physical domain covering the vCPUs in them;
 - a guest-visible TLBIDIDR_EL1 with virtual domain counts, and
   conditional exposure of ID_AA64MMFR4_EL1.TLBID once userspace
   configures vDomains;
 - tracepoints for the vDomain load path.

Known limitations:

 - VHE only: VTLBIDn_EL2 cannot be written from EL1, so vTLBID is
   disabled on nVHE hosts.
 - No interaction with nested virtualization is modelled yet.
 - The guest is told about OS domains (NOS), but VTLBIDOSn_EL2 is
   never programmed, so outer-shareable domain TLBIs are broadcast.

[1] https://lore.kernel.org/all/20261001110655.461473-1-kristina.martsenko@arm.com/

Jinqian Yang (6):
  KVM: arm64: Introduce TLBID virtualization infrastructure
  KVM: arm64: Add VTLBID sysregs and update VTLBID(n) on vCPU load
  KVM: arm64: Wire up TLBID vDomain configuration ioctls
  KVM: arm64: Emulate TLBIDIDR_EL1 with virtual domain counts
  KVM: arm64: Conditionally expose ID_AA64MMFR4_EL1.TLBID to guest
  KVM: arm64: Add tracepoints for TLBID vDomain load events

