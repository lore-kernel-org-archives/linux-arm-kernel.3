Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB12C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ywcP3dJv2UrI0/SI7HlwNNXBw9sTCNkz25zwKrroGM=; b=NgkbH0ZJ3y5UHAe492m9AnaX27
	J5K/gFtujTfdV0KqSBvsB4O3/poV2ohhbUKd/WEglYVGRc/9Yu9xU/+EEA14ogmXIJjr8SyGcUdfY
	K8UQMm03g+LTNy64z5zB0QPbkKxQWSpznIU/IXpJA5m3oH1uDWUHDkGT5yuyYa+S+Ft56L0Zs8zeH
	k3aoHsOiFgeC/Zn5bqMx4FNVKKIGDqZuZkGzkDrddU+G0jzfUiEvVdb1jBZt3ke+FZO8m1AszTKq3
	VGcBeDPXOtNgJ7O/XbbxvMVHSL07JNzR5YKn3LCg8Ix34TeBvYVzN2JIHX07L7Xv3PWe5hAg6mXft
	kRxFinOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o4a-0000000FI2x-0gVV;
	Wed, 02 Sep 2026 16:44:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o4X-0000000FI23-1x3M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:44:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E0F4165C;
	Wed,  2 Sep 2026 09:44:20 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44C7C3F882;
	Wed,  2 Sep 2026 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788367463; bh=fo+Lm5rgAEqscXe3PTqtMl9I58MX7lReZIhCjwIIG0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CY5gEVoCrpvX5hEGWFgR6zCcIbDhyAgXBJKkidDhnKsnwmqjImb9kOGcr2cLLra6u
	 jJOHgJjKS/b8XaTz+KuI0jv21GWI/xGhA9NX+RxqTGaLkXZ4zCkBxIKnGU59yFnLAJ
	 VC9upgRDM6r1EtGVbilhQ8UpkhPYK2PCcE/+nWWw=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 03/14] KVM: arm64: Manage GCS access and registers for guests
Date: Wed,  2 Sep 2026 17:44:18 +0100
Message-ID: <aphSYqKrgUq5Qycu@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-arm64-gcs-v20-3-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-3-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094425_548950_40F30AAB 
X-CRM114-Status: GOOD (  16.04  )
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

Hi Mark,

On Tue, Sep 01, 2026 at 10:47:01PM +0100, Mark Brown wrote:
> GCS introduces a number of system registers, on systems with GCS we need
> to context switch them and expose them to VMMs to allow guests to use
> GCS.
> 
> In order to allow guests to use GCS we also need to configure
> HCRX_EL2.GCSEn, if this is not set GCS instructions will be noops and
> CHKFEAT will report GCS as disabled.
> 

Everything you do seems the correct approach, and all the loads/saves 
are symmetrical, except for VEL2, for which the reason was made known 
in v19 discussion.

That being said, I may have missed something as I am still not very much 
used to NV code. So, FWIW:

Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Nit:
Reading this patch, it feels like it should have been two different 
patches: one for adding the registers to kvm infra, and the other for 
loading/saving it in the code (with GCSEn). If you later decide to split 
it, feel free to add my R-b in both of them.

Thanks!
Leo




