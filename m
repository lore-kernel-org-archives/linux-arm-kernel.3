Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48C7C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3o/ZDMC/htvLXK6XDyZdoYYF/W+enLQOn8II0EvNtTU=; b=D5sqqAGLZuSspGSRNZRyKDcBns
	BxdN8N+Ih4KiUpSGQqcx/pkqfHZBc9ZBdPAvQjZVBey7MjShBbN1qGnH3eIpqvHvOnZwsEEAxT3Vv
	AM2AIEVfJ+7W2KnjhVRGFUrKzma9cKad+dIi7tf/e4hV/VKoKVUjUNauj+WAvLZID8DoPuj6CMRDa
	bgSUPe2FFmN9AJ32THFEg1MUg6am6vyMyfv5Aq2uTSmgEZUbYQjsPwap1Iqx0ci5GpULaygpeA7bR
	6P5xu/BanTeGYDCVWObEFeB8e9e5WMKe0mSc747V/l50ys1dFEY3VrUu3hfu0YuF39I4hxVzHOSXs
	IpFaga6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ayu-00000001dJJ-3Pv2;
	Mon, 21 Sep 2026 10:10:40 +0000
Received: from out-118.mta0.migadu.com ([2001:41d0:1004:224b::76] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ayr-00000001dId-2OcX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:10:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Yuf6CVS5HHsFju/bVLT2UkgQQk/AjuyAU2D19bqRojI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789985435; v=1; x=1790590235;
 b=Dyh42vJlY20BNiB1peouSmWJzMaHH5EuTE1D3HavSkiCPbEeaeb0zQCBhxINxHMOYs5l5jMp
 nOvKBVIS77Q31d31EZu1hx8KZYaXREU0iydi0FRUxC3AadNQTX//EMziJGL2MiWUoqOTagRCPjo
 sVp/MBI2OUYY/5WSHt+d4kfY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 26de98a1c1e4e5d7;
	Mon, 21 Sep 2026 10:10:35 +0000
X-Mizu-Trace-ID: 26de98a1c1e4e5d7
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: Fix a vSError staying pending after delivery under pKVM
Date: Mon, 21 Sep 2026 11:10:28 +0100
Message-Id: <20260921101030.1231605-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_031037_758351_3C5AABA0 
X-CRM114-Status: UNSURE (   9.79  )
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

Hi folks,

Changes since v1 [1]:
  - Added a cover letter. (Marc)
  - Rebased on 7.3-rc4.

Under pKVM a vSError the guest has already taken stays pending in the
host's copy of HCR_EL2, since the lazy state sync for non-protected
guests stopped copying VSE back on exit. That's a 7.3-rc regression.
Patch 1 reflects VSE back on every exit. Patch 2 makes the
external_aborts selftest check that the SError is no longer pending
once delivered: it fails on the unpatched base and passes with the fix,
and also passes under nVHE and VHE.

The "Confine protected VM vCPU state to EL2" series [2] carries patch 1
as its own patch 1, since its later patches change the same exit path in
hyp-main.c and don't apply on a tree without the fix. It isn't part of
that series: the fix lands from here, and so does the selftest, which
that series doesn't carry.

Based on Linux 7.3-rc4 (93f51579e7df2).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260829071120.2522788-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260914113338.159227-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Sync HCR_EL2.VSE back to the host vCPU under pKVM
  KVM: arm64: selftests: Check SError is not pending after delivery

 arch/arm64/kvm/hyp/nvhe/hyp-main.c                  | 4 ++++
 tools/testing/selftests/kvm/arm64/external_aborts.c | 6 ++++++
 2 files changed, 10 insertions(+)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.39.5


