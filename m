Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCDAC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KagvglZHupqGniUWXLUyr/N9cxv5t/e8DpCYVteqRYo=; b=QuZXGcDNhiuDrSc2utGuI/frHq
	FP6NqzY94blv2BCIZb0OL6HNmQdFWVM5SnMqfMczk9aoZPIUNN0ZdD1nCbKrdj13BtR7Y3F8aihk8
	5nAQiWDY595x5LHMs1y+HPD3RBoUbhFbnB6ObYYXSb0HA5yfw3CsqUqSw+QTbXbkpBtBPxHJEnBD1
	FQIe00HbQtD4DBUjcVjALYF6ZUKmhV2Li7ofu60t/0SgO6UfZzXOpyjUVSehGuMnjoCOxMLKbGd/h
	QamwXSGalyfrKY48ztfN8vC+Q8W3FCgmEZAnCP8OrFC8/IE/ra/xlGD6eJckYsfT1rG7fB5ufB90p
	3Q+5Dk/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tktUn-0000000FhTQ-31a9;
	Wed, 19 Feb 2025 23:28:49 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tktLx-0000000Ff74-164l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 23:19:42 +0000
Date: Wed, 19 Feb 2025 15:19:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740007179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KagvglZHupqGniUWXLUyr/N9cxv5t/e8DpCYVteqRYo=;
	b=gk7kc1I1O6oTn0eCT9zJmnuPN7tg+wSNX0oO/dv6TRU7OKCSIhapie8D7sPw0A922JNEr5
	xzEFD36nCDkGbUQYa7kQc4wh6VcJWlXWtpKP8DuRDFy63FxfU1kuVz3+BUqTA2R+SYh+8k
	rCDYlcapj2cry4xUSAlqmazWSQwRk0Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 14/14] KVM: arm64: Document NV caps and vcpu flags
Message-ID: <Z7ZnB2z6psLcbfRZ@linux.dev>
References: <20250215173816.3767330-1-maz@kernel.org>
 <20250215173816.3767330-15-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215173816.3767330-15-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_151941_439243_BC423827 
X-CRM114-Status: UNSURE (   6.83  )
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

On Sat, Feb 15, 2025 at 05:38:16PM +0000, Marc Zyngier wrote:
> Describe the two new vcpu flags that control NV, together with
> the capabilities that advertise them.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

