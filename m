Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0225EC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FvxpSXO+bFgB1St+7rEJp93C352vyZIr+mzbHjB7ijA=; b=0Zn4Pzls54i6oHdrgbX+kMiWAs
	ZQT9FI5YZ+SmQX2ccX8v2J6t7kWOr81f0KfWmEIYkS9u+nDjBe7K8YVIJ+CCpqAsE0sawQBLiMXAu
	i/zro1HYWd6At/7s41aZzVlHKc5XL7YK9luSlFWxA+WfdxsNOL0yG0dCf757xMTkRy0HNZ30TqoJg
	vv5fcFS7V50tjvJ9S9a3FbokhQaFyU+nN7PGpLQQBnoNtwThBXgV/YwAVu+2hPbZe85nGVh2+zBPy
	EZoLBUSs6dr9n4hyJui09bDJk3ppBWjSk+cHt6gqOE/9z2S/8EWYKP8HZtgJM1yJhjSIfIDT7L++O
	R9iscRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Hpp-00000001jcF-3PF2;
	Mon, 14 Apr 2025 11:18:41 +0000
Received: from smtp-fw-9106.amazon.com ([207.171.188.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Hmv-00000001iZi-460n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1744629342; x=1776165342;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FvxpSXO+bFgB1St+7rEJp93C352vyZIr+mzbHjB7ijA=;
  b=g4VyiZanF+3+99IKm9gy3KsBGNyLVfDMNqEmyNPbm3oDudjHEkaoS1ZH
   CBv5KNB4w9prV7Kjxp0F7lqXYB7BiyPg4dZ1XwHXZx0E8INfpGSL6YXz2
   ztIbR8SAb/k+oFhvmSnbgUrWd8aybUBaC5nYtUd4VOV1N57IO8cwk85tU
   A=;
X-IronPort-AV: E=Sophos;i="6.15,212,1739836800"; 
   d="scan'208";a="815825200"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:15:34 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.43.254:44527]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.12.56:2525] with esmtp (Farcaster)
 id fea6780a-9d42-46ff-ab79-6f921b6f0769; Mon, 14 Apr 2025 11:15:32 +0000 (UTC)
X-Farcaster-Flow-ID: fea6780a-9d42-46ff-ab79-6f921b6f0769
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 14 Apr 2025 11:15:32 +0000
Received: from u94b036d6357a55.ant.amazon.com.com (10.106.82.24) by
 EX19D018EUA002.ant.amazon.com (10.252.50.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 14 Apr 2025 11:15:26 +0000
From: Ilias Stamatis <ilstam@amazon.com>
To: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<maz@kernel.org>, <oliver.upton@linux.dev>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<eric.auger@redhat.com>, <andre.przywara@arm.com>, <will@kernel.org>,
	<dwmw@amazon.co.uk>, <ilstam@amazon.com>, <jgrall@amazon.co.uk>,
	<ugurus@amazon.co.uk>, <nh-open-source@amazon.com>
Subject: [RFC] ARM vGIC-ITS tables serialization when running protected VMs
Date: Mon, 14 Apr 2025 12:12:43 +0100
Message-ID: <20250414111244.153528-1-ilstam@amazon.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.82.24]
X-ClientProxiedBy: EX19D041UWB004.ant.amazon.com (10.13.139.143) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_041542_067957_56DEEB70 
X-CRM114-Status: GOOD (  33.38  )
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

# The problem

KVM's ARM Virtual Interrupt Translation Service (ITS) interface supports the
KVM_DEV_ARM_ITS_SAVE_TABLES and KVM_DEV_ARM_ITS_RESTORE_TABLES operations.
These operations save and restore a set of tables (Device Tables, Interrupt
Translation Tables, Collection Table) to and from guest memory.

This can be a problem when running a protected VM on top of pKVM or another
lowvisor since the host kernel (running at EL1) cannot access guest memory.

# Page declassification and why ITTs are special

The Collection and Device tables are page aligned and their sizes must be a
multiple of page size. If the lowvisor knows where these tables live, it is
possible to "declassify" the corresponding pages and configure the MMU such as
that the EL1 host can write to guest memory directly.

The ITTs (Interrupt Translation Tables) are different. They are NOT page
aligned, they are 256 byte aligned and their size is variable. That means that
the lowvisor can't declassify pages containing ITTs and configure the MMU
giving the host direct access as above since those pages may contain unrelated
data.

If the lowvisor knows where the ITTs live in guest memory it could instead
perform the guest memory accesses on behalf of the host. I.e. the EL1 host
would attempt to save the ITTs to guest memory like it does today, that would
generate a data abort, and then the EL2 lowvisor could perform the copy after
validating that the faulty address belongs to an ITT in guest memory.

One issue with the above is that the ITS save/restore happens at hypervisor
live update which is a time sensitive operation and the extra traps (one per
interrupt mapping?) can introduce significant additional overhead there.

Another issue is that it's actually hard for the lowvisor to know where these
tables live without trusting the EL1 host which virtualizes the ITS. It is
especially hard knowing the locations of the ITTs (compared to
Collection/Device tables) because that probably means having to parse the ITS
command queue from EL2 which is complex and undesirable.

# An alternative: Serializing ITTs into a userspace buffer

Rather than writing the ITTs to guest memory, the EL1 host can serialize them
into a buffer provided by userspace.

The struct kvm_device_attr passed to KVM_DEV_ARM_ITS_{SAVE,RESTORE}_TABLES has
a currently unused 'addr' field that can be used for the buffer address. The
upper 32-bits of 'attr' from the struct could be used for the buffer size (even
though that feels hacky). Also a flag in the 'flags' field can be used to
determine whether the userspace buffer must be used or not.

I'm attaching a not-so-pretty RFC patch that does just this. The format of the
blob stored in the buffer is the following. There is a 64-bit ITT start marker
which embeds the device ID owning the ITT. The start marker is followed by
64-bit ITEs stored using the existing ITS Table ABI REV0 with the 'next' field
being replaced by an 'event_id' field which stores the event ID rather than an
offset. An end marker indicates the end of the ITT and is followed by the start
marker for the ITT of the next device.

Note that I haven't actually documented this new ABI in the patch yet, because
it's unlikely to stay as it is. There are many different ways to achieve the
same result.

Also note that this patch treats the ITTs specially for the reasons mentioned
in the previous section (harder to declassify), but there could be flags for
choosing between storing all tables or just the ITTs in the userspace buffer.

Finally, the patch is based on an older kernel tree at the moment but from a
quick look it won't be too difficult to rebase on top of 6.15. However, I
wanted some initial feedback to see whether this approach is something that
maintainers would even consider before rebasing, adding tests and making this
as robust as possible.

# How can userspace calculate the size of the buffer?

This is another big problem. Today the guest is responsible for allocating
memory for the ITTs (and other tables) before passing it to the (v)GIC.
However, if userspace is to provide the host kernel with a buffer it has to
know how much memory to allocate for it.

Userspace should probably account for the worst case where ITTs are fully
populated. The theoritical maximum depends on the number of Device ID bits and
Event ID bits that the ITS advertises. Today these values are fixed in KVM's
vITS and set to 16 bits each. Therefore the theoritical maximum is a very large
number (2^16 * 2^16 * 8 bytes per ITT entry = 32GiB per vITS) which is
unrealistic.

However, it should be possible to make the Device ID and Event ID bits
configurable by userspace. That way by using smaller numbers there, the
theoritical maximum for the ITTs can be reduced to more realistic sizes.

# Please suggest something better

I'm fully aware that this is not a great patch and feels hacky and potentially
non-robust. However, I'm struggling to come up with anything better and this
RFC is meant to start a discussion around this problem. Is storing the ITS
tables in host memory something that makes sense or is there a better/simpler
approach that would work for Confidential Computing?

Thanks

Ilias Stamatis (1):
  KVM: arm64: vgic-its: Add flag for saving ITTs in userspace buffer

 arch/arm64/include/uapi/asm/kvm.h |   5 +
 arch/arm64/kvm/vgic/vgic-its.c    | 213 +++++++++++++++++++++++++++++-
 arch/arm64/kvm/vgic/vgic.h        |   4 +
 include/kvm/arm_vgic.h            |  11 ++
 4 files changed, 227 insertions(+), 6 deletions(-)

-- 
2.47.1


