Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F28CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQDp45cnAJVxV/0vxazZnU0TrV3nMohAa8JAvmgHAxc=; b=dcbUaIJDqsF0BaDYbQ0mCnq724
	CZvS57n8Y6qtJNHMZEa7YdrCYqwv6S/Ei45e4J1PX1hrrfT6P4WbwsekIDVKO5y3DzmLZShmS8weo
	BCLBVrPpefVtx8nX/t50jkQK8SPuu7DFDbnhj20FDz5jrALoMVfHzUPgFpBUsf+EMIrCzDTGOXai7
	XbyTYdmAxlYwQ7ftzUnHhaBp0ZyLrnK8kD0Z9/fa1fOfl9vHe1JbQGsCAnjMgNR03xfwpsPC5iGzu
	Z8zY85sZdDVkvGFj9ez4OPXyImaqk9aLGDBP5D4HpoxgO9eYk0BHnb5cKmBt+I0O4ZllWXX0HDBBt
	cvijukzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBd8W-00000004L6z-03Md;
	Tue, 29 Sep 2026 19:05:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBd8T-00000004L6J-0Fcm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 19:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JQDp45cnAJVxV/0vxazZnU0TrV3nMohAa8JAvmgHAxc=; b=RgnorvmfSE/WFiBKmUYQrV+dWS
	nFPxD1zR3MJzgIOgHIcbyara/frdwA+p3ZO0xwLsCcGSkdB8vU0XKBwS+BWRYa6kcCYmZ35ggJY10
	BABTcXNt8zxpwFs5yNT6TvB24qcGg1sMMDlbxsk2Dmi+x3BwjhLidjunue7d7FCDe4jRG3Q/tj6Nz
	ns4xrw9VBT0uHl3QXU/O77k3TIaEBnBneAl9vYYvL5abUkGbScd5kutm+KvncgDtl22OzfuHXNlAi
	edYZfD6Mx6F7FmhSdRymSwBJcmfPeQNJG9vbXGABxuyDe5Iz513IfmDUlu200M//UCmzR3ioW1iRV
	Kr7mx1Xw==;
Received: from out-219.mta1.migadu.com ([95.215.58.219] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBd8P-00000002z97-1v8r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:05:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Wv2LAC871pIKGb/ciNqR/Im7/rPMRTvo6hq+2IOPT14=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790708697; v=1; x=1791313497;
 b=UduzcDa3HtyddFfgFOQhs537ZhR3Akq9nY8FNQUuSi2lB1XZJe1z9fhTSVFChpDJQRu896vB
 /Wt78sKWrLipsVVdpoN/Ug923S3svXVlefWJyoYZyQiSfG3CadtV2OOtwYQLWaJ8PXkby9cSpBz
 LGAFiOgY4EaFRhNJ/SObWohQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e8e09ddc74236482;
	Tue, 29 Sep 2026 19:04:56 +0000
X-Mizu-Trace-ID: e8e09ddc74236482
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v1 0/2] KVM: arm64: selftests: Cover the ITS MOVALL command
Date: Tue, 29 Sep 2026 20:04:50 +0100
Message-Id: <cover.1790708299.git.fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260929093548.3598547-1-maz@kernel.org>
References: <20260929093548.3598547-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_200501_880753_6D17180D 
X-CRM114-Status: GOOD (  10.63  )
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

Hi Marc,

I wrote this to test your series [1]. It fails without patch 6 and
passes with the whole series, on QEMU with pKVM, VHE and nVHE hosts. On
an Apple M4 host, the series boots and runs protected and non-protected
guests. The M4's GIC has no ITS, so the test doesn't run there.

Feel free to take it with your series if you think it's useful.

Based on kvmarm/next (5c49bb52faf38).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260929093548.3598547-1-maz@kernel.org/

Fuad Tabba (2):
  KVM: arm64: selftests: Add a MOVALL command to the ITS library
  KVM: arm64: selftests: Add an ITS MOVALL test

 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/vgic_its_movall.c     | 341 ++++++++++++++++++
 .../selftests/kvm/include/arm64/gic_v3_its.h  |   1 +
 .../selftests/kvm/lib/arm64/gic_v3_its.c      |  16 +
 4 files changed, 359 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/vgic_its_movall.c


base-commit: 5c49bb52faf38ddf9c3383807b1d814ef8769b80
-- 
2.39.5


