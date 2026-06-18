Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A642ACD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 19:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR6Mtq5nZ+5UapL5g8Gruh6bzm0GAsMPkKV4VGUnpD0=; b=aayCWAznysN8ubebQLsf3BJ1o9
	zbiBNEIoXsWxBgpWpkg7DU+QuSza1K94khomrKQlbVz2qjoxHXBWMhyrEpqXeMRvJshNRzLIbvz6T
	bhXHuALgDeZz8i2n8LUvFbEsBiwnRrzgIA9JF0fr5udaa1kmxOF7CL9o17vxaF1Dz4XkqtzdPR+dS
	lR9MAVRe8XgsvNU0g4YHtFzjXElx3gQ0MsXfRjBS0Dqo32AwBX2f7NsFOrie2TlT2Ek3al/vK4iXV
	SuKUmi8+HZYalnn5E9HCInRmT/rVKgssIk6wUnbz+RzrXaXKSxQtOvT4gtpha1CmCscsDm/9e2lfF
	YvTZJleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waI48-00000001jNx-2LS4;
	Thu, 18 Jun 2026 19:06:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waI46-00000001jNn-1yiw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 19:06:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8D6141B55;
	Thu, 18 Jun 2026 19:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0601F000E9;
	Thu, 18 Jun 2026 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781809573;
	bh=wR6Mtq5nZ+5UapL5g8Gruh6bzm0GAsMPkKV4VGUnpD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QJFYo1fHYvc3pXPSZSAyFDU4Z0SNbW8oFKZ8rnOuhLSFy9g3a3hdDVJ/DyK45vkU/
	 o7sj9BqU7NRvNOIfnVx+H9IhJRHLBnrCTnoGe+MWP+++QpUbpxQ/NB+6eySUFtDWQP
	 fXtMJCCjGqSYFIjJqcXXpVVTGolsmDvW3Pf961XCU1S0IYWcU0rsR5xFV++L+mNbad
	 29wz1z0MgzqDfYbDN/ppBvt+4vcqPHX2uK6nilp6uRIhZ+nRyQMDEooNftiA7d6ejd
	 vi4YMnbwPcLAeTtRHfk8uAzNTofi6LAi2y5dSiC4Jqb2MwQjeq0Yb2AFJHeW3kLZGa
	 skCgxmdzudOGQ==
Date: Thu, 18 Jun 2026 12:06:12 -0700
From: Oliver Upton <oupton@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	jean-philippe.brucker@arm.com, andre.przywara@arm.com,
	suzuki.poulose@arm.com, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH kvmtool v2 7/7] arm64: Improve KVM_ARM_VCPU_PMU_V3_CTRL
 diagnostics
Message-ID: <ajRBpMnlcNkhWzQL@kernel.org>
References: <20260618155001.226266-1-alexandru.elisei@arm.com>
 <20260618155001.226266-8-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618155001.226266-8-alexandru.elisei@arm.com>
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

On Thu, Jun 18, 2026 at 04:50:01PM +0100, Alexandru Elisei wrote:
> kvmtool issues several ioctls when configuring the PMU, and each of them
> can fail for different reasons. Be more specific about the ioctl that
> failed when that happens.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm64/pmu.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/arm64/pmu.c b/arm64/pmu.c
> index 92cacd62479e..78c15f153fad 100644
> --- a/arm64/pmu.c
> +++ b/arm64/pmu.c
> @@ -12,6 +12,24 @@
>  
>  #include "asm/pmu.h"
>  
> +static const char *pmu_attr_names[] = {
> +	[KVM_ARM_VCPU_PMU_V3_IRQ]	= "KVM_ARM_VCPU_PMU_V3_IRQ",
> +	[KVM_ARM_VCPU_PMU_V3_INIT]	= "KVM_ARM_VCPU_PMU_V3_INIT",
> +	[KVM_ARM_VCPU_PMU_V3_FILTER]	= "KVM_ARM_VCPU_PMU_V3_FILTER",
> +	[KVM_ARM_VCPU_PMU_V3_SET_PMU]	= "KVM_ARM_VCPU_PMU_V3_SET_PMU",
> +	[KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS] = "KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTER",
> +};
> +
> +static const char *pmu_get_attr_name(u64 attr)
> +{
> +	switch (attr) {
> +	case KVM_ARM_VCPU_PMU_V3_IRQ ... KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS:
> +		return pmu_attr_names[attr];
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
>  static bool pmu_has_attr(struct kvm_cpu *vcpu, u64 attr)
>  {
>  	struct kvm_device_attr pmu_attr = {
> @@ -32,13 +50,12 @@ static void set_pmu_attr(struct kvm_cpu *vcpu, void *addr, u64 attr)
>  	};
>  	int ret;
>  
> -	if (pmu_has_attr(vcpu, attr)) {
> -		ret = ioctl(vcpu->vcpu_fd, KVM_SET_DEVICE_ATTR, &pmu_attr);
> -		if (ret)
> -			die_perror("PMU KVM_SET_DEVICE_ATTR");
> -	} else {
> -		die_perror("PMU KVM_HAS_DEVICE_ATTR");
> -	}
> +	if (!pmu_has_attr(vcpu, attr))
> +		die_perror("KVM_HAS_DEVICE_ATTR(%s)", pmu_get_attr_name(attr));
> +
> +	ret = ioctl(vcpu->vcpu_fd, KVM_SET_DEVICE_ATTR, &pmu_attr);
> +	if (ret)
> +		die_perror("KVM_SET_DEVICE_ATTR(%s)", pmu_get_attr_name(attr));
>  }

The whole if (ret) die_perror(...) thing is a bit repetetive IMO. A
treewide cleanup replacing this with macros would be nice, then you could
stringize the ioctl under the hood.

diff --git a/arm64/pmu.c b/arm64/pmu.c
index 5f31d6b..0d9f3df 100644
--- a/arm64/pmu.c
+++ b/arm64/pmu.c
@@ -23,23 +23,19 @@ static bool pmu_has_attr(struct kvm_cpu *vcpu, u64 attr)
 	return ret == 0;
 }
 
-static void set_pmu_attr(struct kvm_cpu *vcpu, void *addr, u64 attr)
-{
-	struct kvm_device_attr pmu_attr = {
-		.group	= KVM_ARM_VCPU_PMU_V3_CTRL,
-		.addr	= (u64)addr,
-		.attr	= attr,
-	};
-	int ret;
-
-	if (pmu_has_attr(vcpu, attr)) {
-		ret = ioctl(vcpu->vcpu_fd, KVM_SET_DEVICE_ATTR, &pmu_attr);
-		if (ret)
-			die_perror("PMU KVM_SET_DEVICE_ATTR");
-	} else {
-		die_perror("PMU KVM_HAS_DEVICE_ATTR");
-	}
-}
+#define kvm_set_device_attr(fd, _group, _attr, _addr)					\
+do {											\
+	struct kvm_device_attr __attr = {						\
+		.group	= (_group),							\
+		.attr	= (_attr),							\
+		.addr	= (u64)(_addr),							\
+	};										\
+	int r;										\
+											\
+	r = ioctl((fd), KVM_SET_DEVICE_ATTR, &__attr);					\
+	if (r)										\
+		die_perror("KVM_SET_DEVICE_ATTR(group:"#_group", attr:"#_attr")");	\
+} while (0)
 
 #define SYS_EVENT_SOURCE	"/sys/bus/event_source/devices/"
 /*
@@ -218,14 +214,18 @@ void pmu__generate_fdt_nodes(void *fdt, struct kvm *kvm)
 
 	for (i = 0; i < kvm->nrcpus; i++) {
 		vcpu = kvm->cpus[i];
-		set_pmu_attr(vcpu, &irq, KVM_ARM_VCPU_PMU_V3_IRQ);
+		kvm_set_device_attr(vcpu->vcpu_fd, KVM_ARM_VCPU_PMU_V3_CTRL,
+				    KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
 		/*
 		 * PMU IDs 0-5 are reserved; a positive value means a PMU was
 		 * found.
 		 */
 		if (pmu_id > 0)
-			set_pmu_attr(vcpu, &pmu_id, KVM_ARM_VCPU_PMU_V3_SET_PMU);
-		set_pmu_attr(vcpu, NULL, KVM_ARM_VCPU_PMU_V3_INIT);
+			kvm_set_device_attr(vcpu->vcpu_fd, KVM_ARM_VCPU_PMU_V3_CTRL,
+					    KVM_ARM_VCPU_PMU_V3_SET_PMU, &pmu_id);
+
+		kvm_set_device_attr(vcpu->vcpu_fd, KVM_ARM_VCPU_PMU_V3_CTRL,
+				    KVM_ARM_VCPU_PMU_V3_INIT, NULL);
 	}
 
 	_FDT(fdt_begin_node(fdt, "pmu"));

