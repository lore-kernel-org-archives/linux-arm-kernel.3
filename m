Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C2ECA5FA9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTcPVwIiWLWLVZp2d7a/PJw4jzycciWCXXt4atjEWWc=; b=cFDdYq4qSE6Qa2KiQMOY88tSvY
	w5DK3xM9fFq+B1IPFeCKfw/xiVX+b1ka3yn817dJwl45WmNXOwICkU1e0zI94GjfoGhC9mb1PlglY
	HM3R+PqBuyLKo/mBv1velm6iaMJzccSTxPPS+LLxNmtC+svw08wi2M5ZkARwVG4SDxaXJJPpNlvuJ
	LmqUc0OIdAQLYhecBJnVF+jQT2rdHAtImrOnDf0n8WhkdB/LlL/9zi8EAFkh/W5CyJmy3pkUq+uyh
	GsU1bqvMa2f/0wZGYczbAwjw45SzNouKEl++2jv+eIPCqJp75t0r7fLptPB4A4Q3IRjryYQFBanUx
	tKunwU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDF1-00000000teO-31P0;
	Mon, 28 Sep 2026 15:26:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEy-00000000tbn-01yn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 15:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZTcPVwIiWLWLVZp2d7a/PJw4jzycciWCXXt4atjEWWc=; b=KfscsiKLYhEax8x96swjO6uHQt
	gZWTdWNt1OVDPzYIOwBBHhH0bJhb0gPlzSqmea1I1MDL74UU/XrSrxoppYKBr8e6Mfo6zaD9HI+lR
	FNM1PGzBpZjGoLhLp8Kb5uKK9ymvSJoy2RGBLKkKIJAVmHdrrye0r404iz2p0H8mPmxar4scxB+aW
	hZGxPf0pDHSdNSapXynyYIl06TXXH7lpGs0yp3C57jwcGjcJA3SZQmh21TWB7J6pAMjEleU3Y14cJ
	7cEjo7cbGm/dzagxNxZpcIFg208xzaLlf3SaMUoAYZEOBAzoJdRlAqphPlGxugJEpe5msj6hvWxrw
	oVX4fnvg==;
Received: from out-107.mta1.migadu.com ([2001:41d0:203:375::6b] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBDEv-00000001cmD-0UpT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:26:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=15qFRotLPfvjMOJ1gQJLuHOeW3ckIYvFdOdvtKh1ci4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609159; v=1; x=1791213959;
 b=obeJo6StcivAizKpQ5GgnZ399raDyXsPg37tv4FKHsgZPyVYMzyfgnIx7JE+IDYXSHadONnn
 hNhvppxhR0iv/L1LXC3X4mvdKtgraeX/pf6aNTgVH1V5Cq9UfeZh5nqZnE/2ArsK5UH3M0XyEyZ
 TT3LabDMZ6e+PGHUdFraG/4k=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 39eed6f455da3869;
	Mon, 28 Sep 2026 15:25:59 +0000
X-Mizu-Trace-ID: 39eed6f455da3869
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/10] Documentation: KVM: Fix the name of KVM_ARM_FEATURE_ID_RANGE_IDX
Date: Mon, 28 Sep 2026 16:25:05 +0100
Message-Id: <20260928152507.2116110-9-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162601_192591_5EDD14E8 
X-CRM114-Status: GOOD (  12.76  )
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

api.rst says the array KVM_ARM_GET_REG_WRITABLE_MASKS returns is
indexed by ARM64_FEATURE_ID_RANGE_IDX(), a macro that exists nowhere
else. The macro is KVM_ARM_FEATURE_ID_RANGE_IDX().

Fixes: 6656cda0f3b26 ("KVM: arm64: Document KVM_ARM_GET_REG_WRITABLE_MASKS")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e5efdc56f3d29..58265372db165 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6337,7 +6337,7 @@ The Feature ID range is defined as the AArch64 System register space with
 op0==3, op1=={0, 1, 3}, CRn==0, CRm=={0-7}, op2=={0-7}.
 
 The mask returned array pointed to by ``addr`` is indexed by the macro
-``ARM64_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm, op2)``, allowing userspace
+``KVM_ARM_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm, op2)``, allowing userspace
 to know what fields can be changed for the system register described by
 ``op0, op1, crn, crm, op2``. KVM rejects ID register values that describe a
 superset of the features supported by the system.
-- 
2.39.5


