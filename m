Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF39BC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jn99D0Cl0qqP0dLcYUH5qLyBPb4aOTAk02AFcH+ht0Y=; b=dZoMRCLBgA1siy
	SXt8EHiigz8HhzOb1n+bGVxOCoIVcYq0zQWF4ZUBQ6svVDHNTHlhMKJtrQGjcmC3Ghj/UBZhW05CA
	HXmteAJYTYEzjpt9+XFVyszaJPsnXDsb/7pXKMTu6ORoM1A68NKPzmq3ageWS+fMwKok3wKAvJgeW
	ukxQAuAjo3fc68Aga8y5omEQ+X4j1xLucaoN+zYVgMs21KXQcJb172GY/A7zhshRmbgqIe87WI/iN
	qtZjD7QceqX7/yuRU+QHViZcUmw6ILuHXOzIHmoeszhGNqKO1bQcnBCn/Tf7mZAzsB+6DrFCYNOYt
	/i1zAkI6qhERNdSxbWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyXk-00000001UpE-2XwE;
	Tue, 25 Aug 2026 21:18:52 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyXh-00000001Un4-1Ig8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787692729; x=1819228729;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=DCkh7zwFwuSOe5fTMEye2Oh1ZEjE4In2M9Rjx+1yMUE=;
  b=VrnxC2lJc4M1+CmM5UuvAsOMGOUTlDdLHVnWdwWs2qHXKySDmiKQZ9Fc
   LVc6E9tgJl0a7m89tge12JPGNV1NVpaiSupRcwXfUOmFxF474sLhrgp1N
   HxLonRoEuAfSXtuyWg0FgMOs0mibh5OY4Jc8vafwWvGTG9T3dbHY6SGEx
   QZorJJdj/qGBD0cM9P6XbjOjr3z/iubAiWrmoSTFgwf7oIeQN6NsswJK5
   9t3brNklzjOH0ekO8GnvgwRvt1+kkwxsEc2fXr6tJk7LGeWmiNCW62+5I
   vHtpcHYaB828vDlLjwltRD4dFIoPrKuF92yuZsCCmaKcoiUXNYvYKOI+p
   w==;
X-CSE-ConnectionGUID: 9dvLXV2SQJSnwRWP1Fy0cw==
X-CSE-MsgGUID: H/8EiyRYTqmsuuA6STFvaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="238776790"
X-IronPort-AV: E=Sophos;i="6.25,243,1779116400"; 
   d="scan'208";a="238776790"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 06:18:44 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 76D495527
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 21:18:44 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 26DE41C00F9B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 21:18:44 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 459B81801C01;
	Tue, 25 Aug 2026 21:18:39 +0000 (UTC)
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Subject: [PATCH 0/2] 52-bit VA guest mode ID support
Date: Wed, 26 Aug 2026 06:18:33 +0900
Message-Id: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKkGjmoC/yXMQQqEMAxA0atI1gZqtCJzlcFFbVONMDq0KoJ4d
 6su3+L/AyIH4Qif7IDAm0SZp4Qiz8AOZuoZxSUDKapVQxpN+NUVaupkwc1gSb7wlXVKKwcp+gf
 2sj/Db/s6rt3IdrkvcJ4X9NTgIXIAAAA=
X-Change-ID: 20260825-arm64-52bit-va-32f1f4cd050d
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
 Takayuki Okamoto <tokamoto@fujitsu.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787692718; l=1855;
 i=itaru.kitayama@fujitsu.com; s=20260825; h=from:subject:message-id;
 bh=DCkh7zwFwuSOe5fTMEye2Oh1ZEjE4In2M9Rjx+1yMUE=;
 b=7XNu/jkIySZnSwyMNQ95NlahI1x9xVp4JU7Z8qoAENLXI9Bg2Mlv4Us0xIz4cTk1mLd3wberh
 apmDZOfqdp8Ag/eP9I4BBkHtOVzEu9B1BccGPvdg0H+ylcLNTr/ecuV
X-Developer-Key: i=itaru.kitayama@fujitsu.com; a=ed25519;
 pk=g9bTnr9giRP7JwNSZHy+OMLQZBEUtSE9tUnXso0hH1Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_141849_813888_109327CA 
X-CRM114-Status: GOOD (  10.49  )
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

This patch series extends the arm64 KVM selftest framework
to support 52-bit guest virtual address (VA) modes in addition to
the existing 52-bit physical address (PA) configurations.
The motivation is to enable validation of LPA2 guest memory-management
behaviour in configurations that use a 52-bit VA space.
While the selftest framework already supports testing 52-bit PA
configurations, it lacks the ability to exercise guests running with
52-bit virtual addresses, leaving part of the LPA2 functionality untested.
To address this, the series introduces new guest modes for 52-bit VA
operation, adds five-level page table support where required, and
performs runtime detection of host 52-bit VA capability so that
LPA2-enabled guest VA tests are executed only on supported systems.

Testing:

Built and tested on arm64.
Verified on QEMU with a V52-capable guest configuration.
Confirmed correct operation of high virtual address mappings by
exercising guest memory accesses in the 52-bit VA range.

Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Reviewed-by: Takayuki Okamoto <tokamoto@fujitsu.com>
---
Itaru Kitayama (2):
      KVM: selftest: arm64: Support 5-level paging in stage 1 translation table
      KVM: selftests: arm64: Add 52-bit VA guest modes

 .../selftests/kvm/include/arm64/processor.h        |  2 +
 tools/testing/selftests/kvm/include/kvm_util.h     |  3 +
 tools/testing/selftests/kvm/lib/arm64/processor.c  | 87 ++++++++++++++++++++--
 tools/testing/selftests/kvm/lib/guest_modes.c      |  5 ++
 tools/testing/selftests/kvm/lib/kvm_util.c         | 11 +++
 5 files changed, 103 insertions(+), 5 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260825-arm64-52bit-va-32f1f4cd050d

Best regards,
--  
Itaru Kitayama <itaru.kitayama@fujitsu.com>


