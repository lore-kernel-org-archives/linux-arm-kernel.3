Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9BAD3ABF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 21:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9CAj9JaGMN0ybNM1og6EH7btRUNarOLzlzuHTkv93s=; b=uXQmU7mFAl1rxplYufAtj2QlA5
	4Ov9+PPb2hDITpf1p6xsWca5uIciCNBRKNZf6V8mXKBtmZTHo7PCW1/Di5UdFacapd1LMekQioATL
	2T7M9NAXrqK3Yx15ZC0dx7ZJdSNQldPky9zvgNSu78g9/KqgHE0rzLBTHnZG9PRHxJIPm3HVdl1ov
	R3ceIyZDOQUgk1Ek07kO+nuSRg0XbYo+K4ANpR+itlm2413JmFTYe/v4SCOBP6eLvvvqOn9qYAeyd
	Kg7J6m+f5QgCXOzd4dVAby8X2L1F4+O2LkMCEN+jUhQ0xZTQaWoTDeFNoiEOGnXNiu06fu3nOBHas
	0HdIIdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbYC-00000001I4o-3P4j;
	Mon, 11 Nov 2024 21:02:20 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbD6-00000001Dyl-3LnB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:40:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731357629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b9CAj9JaGMN0ybNM1og6EH7btRUNarOLzlzuHTkv93s=;
	b=NSky0qXt3FYZ1uz0lOO9GCgsPfAGi+hlH9gH52cProQINk5600PTWNOFHccqjfU+OaRCfF
	t6d6uVZ5IEdvMi7EPmtGKg214jQbT/V7GI2CRh3Vur2lw6eVacBlV+8dEWOU6KKMJDnZkQ
	qVkuJ46lmP6hM9u5vD/+H6Q6xWS0LZE=
From: Oliver Upton <oliver.upton@linux.dev>
To: ARMLinux <linux-arm-kernel@lists.infradead.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	KVMARM <kvmarm@lists.linux.dev>,
	Oliver Upton <oliver.upton@linux.dev>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	KVM <kvm@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Joey Gouly <joey.gouly@arm.com>
Cc: Colton Lewis <coltonlewis@google.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Shusen Li <lishusen2@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v4 0/5] Some fixes about vgic-its
Date: Mon, 11 Nov 2024 20:40:03 +0000
Message-ID: <173135744708.2975582.6187985686343920631.b4-ty@linux.dev>
In-Reply-To: <20241107214137.428439-1-jingzhangos@google.com>
References: <20241107214137.428439-1-jingzhangos@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_124033_066912_D46CF6CD 
X-CRM114-Status: UNSURE (   9.49  )
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

On Thu, 7 Nov 2024 13:41:32 -0800, Jing Zhang wrote:
> This patch series addresses a critical issue in the VGIC ITS tables'
> save/restore mechanism, accompanied by a comprehensive selftest for bug
> reproduction and verification.
> 
> The fix is originally from Kunkun Jiang at [1].
> 
> The identified bug manifests as a failure in VM suspend/resume operations.
> The root cause lies in the repeated suspend attempts often required for
> successful VM suspension, coupled with concurrent device interrupt registration
> and freeing. This concurrency leads to inconsistencies in ITS mappings before
> the save operation, potentially leaving orphaned Device Translation Entries
> (DTEs) and Interrupt Translation Entries (ITEs) in the respective tables.
> 
> [...]

Taking the immediate fixes for now, selftest might need a bit more work
(will review soon). Note that I squashed patch 2 + 3 together as well.

Applied to kvmarm/next, thanks!

[3/5] KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
      https://git.kernel.org/kvmarm/kvmarm/c/7fe28d7e68f9
[4/5] KVM: arm64: vgic-its: Clear DTE when MAPD unmaps a device
      https://git.kernel.org/kvmarm/kvmarm/c/e9649129d33d
[5/5] KVM: arm64: vgic-its: Clear ITE when DISCARD frees an ITE
      https://git.kernel.org/kvmarm/kvmarm/c/7602ffd1d5e8

--
Best,
Oliver

