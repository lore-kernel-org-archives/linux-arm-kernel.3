Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66452C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56D9mlZ7M1G0UnSJJ2M8dPTg3+XAXsTfHIm3FcS4+KU=; b=PeLuWN4mORpyHjt2429xP+HUl9
	nxJK/hvSgaAUMVNXducEbnl8Z1yiU8zI940ZnpqnpC7ZjvqlI9gOCAtU1LWNg19t4OrBLty5WUUJs
	anBmxM2zZta2Qp2yY6w/jFVI67MR6T81Px7/u69WYIt10opRwL+u+xjh4XJa5FLZbbHzJVN+Ax+Mm
	BALAxXvJb8C6JUEzS9iMU15iWZeZBVntEutIrQr3iR4SolOJmDwPUJSvvgCJ08r/yBZB+dUYy63IA
	3S8r6N0WIYe1WMbHug6bHYHhQt90C/vrv+zSu5zm0r6Hm4P3H2oKfzWjeTy99P8Lcdj8a6pGeVpMA
	rgQQgQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zbq-0000000Emcl-2IPW;
	Thu, 24 Apr 2025 16:39:35 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ybj-0000000EVsE-3U5Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 15:35:25 +0000
Date: Thu, 24 Apr 2025 08:34:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745508918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=56D9mlZ7M1G0UnSJJ2M8dPTg3+XAXsTfHIm3FcS4+KU=;
	b=uPlvWy8mqcGR38PBfc5+PqGpUgQvemUopmsCBqLVIoh839eUhODfU/26KLKzoSaLttPLvb
	gz7zKbif6GXHNzHYVSixNwTvM02m6fCFHtG9RXkVn/9kR5KcNgxYlVK2zrbq78l4qXykvi
	NmVcZf0rqKXbNPdrMCYklhj0ccawDR4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Karim Manaouil <karim.manaouil@linaro.org>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>, Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: Re: [RFC PATCH 00/34] Running Qualcomm's Gunyah Guests via KVM in EL1
Message-ID: <aApaGnFPhsWBZoQ2@linux.dev>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083524_078439_7358AFE9 
X-CRM114-Status: GOOD (  15.95  )
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

On Thu, Apr 24, 2025 at 03:13:07PM +0100, Karim Manaouil wrote:
> This series introduces the capability of running Gunyah guests via KVM on
> Qualcomm SoCs shipped with Gunyah hypervisor [1] (e.g. RB3 Gen2).
> 
> The goal of this work is to port the existing Gunyah hypervisor support from a
> standalone driver interface [2] to KVM, with the aim of leveraging as much of the
> existing KVM infrastructure as possible to reduce duplication of effort around
> memory management (e.g. guest_memfd), irqfd, and other core components.
> 
> In short, Gunyah is a Type-1 hypervisor, meaning that it runs independently of any
> high-level OS kernel such as Linux and runs in a higher CPU privilege level than VMs.
> Gunyah is shipped as firmware and guests typically talk with Gunyah via hypercalls.
> KVM is designed to run as Type-2 hypervisor. This port allows KVM to run in EL1 and
> serve as the interface for VM lifecycle management,while offloading virtualization
> to Gunyah.

If you're keen on running your own hypervisor then I'm sorry, you get to
deal with it soup to nuts. Other hypervisors (e.g. mshv) have their own
kernel drivers for managing the host / UAPI parts of driving VMs.

The KVM arch interface is *internal* to KVM, not something to be
(ab)used for cramming in a non-KVM hypervisor. KVM and other hypervisors
can still share other bits of truly common infrastructure, like
guest_memfd.

I understand the value in what you're trying to do, but if you want it
to smell like KVM you may as well just let the user run it at EL2.

Thanks,
Oliver

