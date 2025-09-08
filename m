Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF981CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1kQ8mm/mAN0lFlu5TazVnyE0ev7nK4ftoc+AKRkk8g=; b=34AS3o4x0QWL0tYHQXse6Bgilt
	ugnA2nrw5wo7RDT+nsq1f3o9Q4AXqh4uMDpKDCfALcz+shHSoxGI2GDyNSGXtNkhJVR71MJoniHbm
	c7JJeu4zQ8k40oy6P+a00u+U6oxddRib+6a4qSawusUZNdizEZ//zDB9jL7R8VBF4WOBk/NVxR4A7
	nXJEgoqrun9/VpYF11bIYIaeextHU81W5uTZLAdDQayTWfxpZjBFR4tgdvA6LHx0AZoMekFpE0yQC
	9ERKjGxzvQmH4fSGH9j6eiMW8rlzvq19CNCVeEuK1xvSfMSeUnMir9PUHyCsd8I8puUVXNzPOaw7I
	wIYYlpXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvffn-00000001CZv-0evV;
	Mon, 08 Sep 2025 17:28:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvd2C-00000000Abq-0J5A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C464140858;
	Mon,  8 Sep 2025 14:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B66C4CEF9;
	Mon,  8 Sep 2025 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757342395;
	bh=S6WX4UEjuqO1DjiVJfdEOy8b5lP1YnGAEtNNX0N44k4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1mAET3hpxgDQuf9PK8DeAaybICZ6ZbbDQPG8mny4p4OYpZ1YlVDysFNLyIk9JbzT
	 1N2i2qOAyFPjx6/H5ouI5OWihPZQr7NsLYx1dmEROjpd6t9xBUjPdAhsLgSAnwfZGC
	 S4dDV2MJ4ZNfaYquNM7vkyYf69mzvHtFs/U+ohkzS1UEoAX38/tPmYNIQ8/DyHPBZ5
	 S6HyvEQWj2O39/yO+UOVDuBKKPrBfB1VWR9XMMVM+WtbXUQeaYYgRX1CR2QUQzyaDd
	 PJvsv8dzOo0vXL3K8P0vOU1qk97fnFiGPt5oGceWZT3ZsMwoNupBkaqmCz4wLE/LhC
	 us80IcHqaqu/w==
Date: Mon, 8 Sep 2025 15:39:49 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, ahomescu@google.com,
	armellel@google.com, arve@android.com, ayrton@google.com,
	qperret@google.com, sebastianene@google.com, qwandor@google.com
Subject: Re: [PATCH v11 0/6] KVM: arm64: Support FF-A 1.2
Message-ID: <aL7qtRZtT687R2IC@willie-the-truck>
References: <20250820-virtio-msg-ffa-v11-0-497ef43550a3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-virtio-msg-ffa-v11-0-497ef43550a3@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_073956_128503_604E4B6D 
X-CRM114-Status: GOOD (  18.17  )
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

On Wed, Aug 20, 2025 at 01:10:04AM +0000, Per Larsen via B4 Relay wrote:
> Hi,
> 
> The FF-A 1.2 specification introduces a new SEND_DIRECT2 ABI which
> allows registers x4-x17 to be used for the message payload. This patch
> set prevents the host from using a lower FF-A version than what has
> already been negotiated with the hypervisor. This is necessary because
> the hypervisor does not have the necessary compatibility paths to
> translate from the hypervisor FF-A version to a previous version.
> 
> Support for FF-A 1.2 in the hypervisor is added as a precursor to the
> addition of the FFA_MSG_SEND_DIRECT_REQ2 messaging interface. Notably,
> this patch updates all smc calls to use SMCCC 1.2 as it makes it simpler
> to support interfaces that need to accept more than 8 arguments and/or
> return more than 4 values. The list of optional/unsupported interfaces
> was updated to reflect additions in FF-A 1.2.
> 
> Tested by booting Android under QEMU and loading Trusty as the guest
> VM and observing the SEND_DIRECT2 ABI being used successfully during
> guest boot.
> 
> Changes in v11:
> - 2/6:         ffa_set_retval: Add more details about anticipated FF-A 1.3 update. Fix typo.
> - Link to v10: https://lore.kernel.org/r/20250809-virtio-msg-ffa-v10-0-189eeecf8ae8@google.com

Thanks, this all looks good to me now.

Assuming Marc's happy, this should go via the kvmarm tree.

Will

