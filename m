Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404AFC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6KOq1zcA4RF8hkL1GnU5zB0hZi9lIcTa8eiKo4zmqE=; b=4VnkMJZ2t8zvWUeXZb496pni4B
	kPUDdgzToMCyeUWn1g6m8N2uq4AAP2J19mH/D3ihJUo+odPliigcBs6L394ItEAod6PsStJYR5p/i
	8GUbqHqJiTUCVCzqYHF9G7slD0v98L+SPaKOOAL2DnTr7YCk7cvhjn87rgl+a+gfsI4JR3b2GZEpe
	TF5ZMPCd3XjQ4VmXCHBI4ijhOf7tc9dY2meRXstSh8s++1FR44JB0cKVP6MxV6M4iZeSQMVXj7vVI
	CyBjg09+ySK/qJcpPb2k5WLKHXQXAFOVBkFG7k83Vhn2WKN6M3QHcG9Xr+/myOkh+wXx+x9XD+yFB
	vZwkA8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm83y-00000009FYX-0TVM;
	Tue, 21 Jul 2026 10:51:02 +0000
Received: from devianza.investici.org ([198.167.222.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm83u-00000009FWY-2n9n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1784631057;
	bh=B6KOq1zcA4RF8hkL1GnU5zB0hZi9lIcTa8eiKo4zmqE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=aJSp6ln/FCfPnydN3Nlf7bQw3fcOxS1+C8/tz6nRA7Vf4vT+PXUY2SOflZOJwHnVW
	 76T//tWS6M8QGlE7/IqgbgF4OD06PUnF40jPWSJTyC6StnUBT+uDQVYYLMZHdaiL0E
	 gdL3eQ+SC+AHAVeoswrKQykLpEZn5e3IIX5RjKKk=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4h4Dh10GPMz6vV9;
	Tue, 21 Jul 2026 10:50:57 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4h4Dh04Yhnz4vyJ;
	Tue, 21 Jul 2026 10:50:56 +0000 (UTC)
Date: Tue, 21 Jul 2026 11:50:57 +0100
From: Bradley Morgan <include@grrlz.net>
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
CC: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Gavin Shan <gshan@redhat.com>,
 Dev Jain <dev.jain@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_5/7=5D_KVM=3A_arm64=3A_Don=27?=
 =?US-ASCII?Q?t_WARN_on_pKVM_stage-2_map_failures?=
In-Reply-To: <20260717130317.1953574-6-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev> <20260717130317.1953574-6-fuad.tabba@linux.dev>
Message-ID: <255752B7-E5B2-47D3-A050-C319CA425EF1@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_035058_858245_B75EE2A2 
X-CRM114-Status: UNSURE (   9.65  )
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

On July 17, 2026 2:03:15 PM GMT+01:00, Fuad Tabba <fuad.tabba@linux.dev>
wrote:
>pkvm_pgtable_stage2_map() wraps the __pkvm_host_share_guest() and
>__pkvm_host_donate_guest() return in WARN_ON(), but those hypercalls
>fail for reasons that are not EL1 invariant violations: -EINVAL for a
>pfn that is not memblock RAM (check_range_allowed_memory() rejects a
>device page mapped into a non-protected guest) and -ENOMEM under
>memcache pressure. Both are reachable from a guest fault, so the WARN
>splats on host input.
>
>Return the error without warning. The unshare and write-protect WARNs
>stay, since a failure there does signal a broken EL1 invariant.
>
>Fixes: 3669ddd8fa8b5 ("KVM: arm64: Add a range to pkvm_mappings")
>Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

LGTM,

Reviewed-by: Bradley Morgan <include@grrlz.net>


>---
> arch/arm64/kvm/pkvm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
>index ba6570e37545..1212a2c5613d 100644
>--- a/arch/arm64/kvm/pkvm.c
>+++ b/arch/arm64/kvm/pkvm.c
>@@ -466,7 +466,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> 					size / PAGE_SIZE, prot);
> 	}
> 
>-	if (WARN_ON(ret))
>+	if (ret)
> 		return ret;
> 
> 	swap(mapping, cache->mapping);
>

Thanks!

