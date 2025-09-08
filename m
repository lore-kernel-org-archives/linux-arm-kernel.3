Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925D0CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 02:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TGELi6yptye/sf1/CYmtXIgm3boebepQSxmdLx8dxo=; b=cK0jHLVuTqbXNq4VNIpUYSw2Or
	hwtyV7wz+1Yu/n1csqKm+cqQlZCvfqfQwxyfoBaBgJBREFl34XWqUsnukBuKwlMBxAondReHLMlqR
	thdWovTarxF6UnjeIaaQw3ZfPyunSQU6NBq3MAIt6d9fxdqYmaa7lWG7a+rN6Y0HHh5j/Bdysn7v8
	LCXMU9OTndLJUJLUXGSIoMW+L+FqPyO7vWUUv0A9CTyjUg1rS51UiZi7p1AjJpOqIaHf+PYNkKnak
	1moFtDZ8J+TtojQSQHzSe3c9NB7h1zipi76+ssc7KXXXPFaV9jZ59ZtPUC5wD+4/L1cVonyLo1KOz
	8+kCcagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo5n-00000003gwL-36RZ;
	Tue, 09 Sep 2025 02:28:23 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgX0-00000001X7N-36Rj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:24:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757355820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TGELi6yptye/sf1/CYmtXIgm3boebepQSxmdLx8dxo=;
	b=iy2ixBtQe/M3IWHUkTU5wSwTQUt36l7G1x4iRU8i4wDJMqtcLGk5slMVa6KrMPbu8ljmxN
	TsiqZ8lZhvB8vbg6O5vhQRNPjZtjFWuOHq4RPqzXPjRqmTQZUi9N0/VCPm/bKU4eXtv0ej
	yAQ9Xws157BFdSQr/qBN1gZHyogF9Oc=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	maz@kernel.org,
	will@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com
Subject: Re: [PATCH] KVM: arm64: Fix parameter ordering for VBAR_EL1 assignment
Date: Mon,  8 Sep 2025 11:23:25 -0700
Message-Id: <175735577926.2363175.17706140210241973919.b4-ty@linux.dev>
In-Reply-To: <20250908163557.2419780-1-tabba@google.com>
References: <20250908163557.2419780-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_112358_930680_C884068E 
X-CRM114-Status: GOOD (  10.61  )
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

On Mon, 08 Sep 2025 17:35:57 +0100, Fuad Tabba wrote:
> The __vcpu_assign_sys_reg() helper expects the register ID as the second
> argument and the value to be assigned as the third. However, the
> existing code was passing these parameters in the incorrect order.
> 
> Fix the function call to properly read the live value of VBAR_EL1 from
> the guest and update the vCPU value immediately before pending the
> exception. This ensures the vCPU's value is the same as the guest's and
> that the exception will be handled at the correct address upon resuming
> the guest.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix parameter ordering for VBAR_EL1 assignment
      https://git.kernel.org/kvmarm/kvmarm/c/9f8073411c13

--
Best,
Oliver

