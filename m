Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCA5CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqtuY6893ZMKAPfP3UotyEfU6XvkTSj7lMBiTda4vZg=; b=KDW8qfwtZ6eEM/CNsy82iiyl3M
	iOUS5w8sfuwTYNr08BjskMXyGiRcfBkAzUC6QXFjUIT4DX6onlcw1pFC/skTWpTL4cQ8qTZeSXPe9
	BcDUeGVYt02HMyA9qoXA7w2lqq3GzRIvhYpD0LKsDYnzG5QW1v0F6Ai79TQV67jVHx62tkKNugrNO
	8eboLWAvbUWwj20FYnsjJRjKn76YOb54ucFbZqlzu5HzKD7McRe3CtN0BM9FG6Z9om1NAsjKeFjtq
	KZPzEcdCwy/pbS7I1oIpVn6SX7QMMqjAubFoSZYQ+9V7yDoMLbAgzMrdfz8HBSGtByC7oJDtdtpss
	mhlLs+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFxy-00000007MQB-0wgl;
	Wed, 10 Jun 2026 10:15:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFxx-00000007MQ4-0SBo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:15:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9980A406CA;
	Wed, 10 Jun 2026 10:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7751F00893;
	Wed, 10 Jun 2026 10:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781086520;
	bh=BqtuY6893ZMKAPfP3UotyEfU6XvkTSj7lMBiTda4vZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n7cs4Pu3UQIrQN/8NOJW86bcYr5KD3XHreJlIMDp8MbvuBM20iyrF4JNMQaEeP+dn
	 Zv7TIT95ubvs1tHySw9OWRVhaj7Qoo0K0eiIYFBnteEM2UHNvpKnbsztEtqpWolMrr
	 cNMHVN17sOZIDrsDHpcln5wbzGtG7q6AwzUyjeTajksossw2afAk5MQumHXBp2C467
	 eD3Mnk639vXK4Bt+UIXQ7D10CYFSbXDJNqoQ9Fd8WRcQjoGh+JEP0IH9oO/+cbMuPi
	 VTaBum+aEyXvOicmFVMmdUKYrYNaTOKh5DC//c925Bqs6ir12dXOi9VIm5ZfXKrY4e
	 jKvKKpS8PBDvA==
Date: Wed, 10 Jun 2026 11:15:14 +0100
From: Will Deacon <will@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Sebastian Ene <sebastianene@google.com>, catalin.marinas@arm.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to
 TrustZone
Message-ID: <aik5MtvOlnQDmzjr@willie-the-truck>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <aikt44sVnpL3_dYi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aikt44sVnpL3_dYi@google.com>
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

On Wed, Jun 10, 2026 at 10:26:59AM +0100, Vincent Donnefort wrote:
> On Mon, Jun 08, 2026 at 04:55:42PM +0000, Sebastian Ene wrote:
> > Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> > FF-A proxy. This restriction was preventing the use of asynchronous
> > signaling mechanisms defined by the Arm FF-A specification to
> > communicate with the secure services.
> > While these calls are markes as optional, there is no reason why the
> > hypervisor proxy would block them because:
> > 
> > 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
> >    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
> >    Because all forwarded notifications are inherently attributed to
> >    the Host by the SPMC, there is no risk of VM ID spoofing
> >    originating from the Normal World.
> > 
> > 2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
> >    operate strictly via register-based parameters, passing only
> >    VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
> >    not contain memory addresses, offsets, or pointers, forwarding
> >    them doesn't pose a risk of memory-based confused deputy attack
> >    (e.g., tricking the SPMC into overwriting protected memory).
> > 
> > While the pKVM proxy behaves as a relayer, it doesn't currently have its
> > own FF-A ID(only the host has the ID 0). The behavior of the setup
> > flow is covered by the spec in the: '10.9 Notification support without
> > a Hypervisor'.
> 
> As it is only a relayer. Is it really important to check SBZ arguments and
> fields on behalf of Trustzone? It doesn't feel it brings any security. If the
> host passes broken arguments, I don't believe this puts pKVM at risk. Does it? 

I think the problem would be if an update to FF-A allocated some of the
currently SBZ bits to implement some functionality that we would want
to filter at EL2.

Will

