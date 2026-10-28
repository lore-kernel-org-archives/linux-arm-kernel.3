Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F187C60A6F69
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lThYSxZo;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvmFqyUy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CAt0d5ylylt8eW+LlxYd6ss54lXkb9DQcvfjrPX+Thw=; b=lThYSxZogyeiRrgpcQyjdGs976
	wcaD5JbyKhA0wdm3P4dz7gMRPximgij2r9FQO3MGshDNlwTdJ9Zsa4vgC9EpEfXz8aQH5h9ElEr7k
	KP9oaPHVrqwGnlz4waqikgJwD4hPIWe85lWtVMrA6DF0uLAktfIubKPz/ZrXOPBqehh1uZO111uAm
	TMVCwCbl1nN/3svKsAacqlJwvKvhrHAZHClkqVkZRO4JS5goNCVQkAOUF7AuoKSpLAbeBWm7PLHAk
	YBySwFB2JlIKJ9EODmZgPJh33iqcABJr2X/GtBw6JcZFTKhWLjyEcyiIO4Vl4GB+kxrjlMC4imN7l
	QokzsqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Xd-00000007MyV-3DTo;
	Wed, 28 Oct 2026 15:26:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Xd-00000007My9-05Ep
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:26:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E929445E8;
	Wed, 28 Oct 2026 15:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678FE1F031E1;
	Wed, 28 Oct 2026 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201176;
	bh=CAt0d5ylylt8eW+LlxYd6ss54lXkb9DQcvfjrPX+Thw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DvmFqyUySHpUvxKNU6qRygBZIY+lpdJ+uHpVbKHq9HS5UeSmcmMC9dUBwX8iplhrZ
	 wCHmTngQ6m83iipwvMqWvn3IUGbaNt9zogpn9Tp+Ob/VgyZ4II59nTZtZQLAfuvfwE
	 0hpm1yZ9gjXNlmyOeHYzLeThFwP82DNITlZLKDF/L6Zk9rec/VtkPyvQvinfK5KzRv
	 ONFcMyomZVlIuh4f8id5FMbupEKeJ+ijJdHaY6AQGVVCnnkhXNe3dL4ggz9L4g2fyw
	 VEeC6jaaAeDUVADLBMab9KSR8q0m7UId7hfUpA/1rIw7Ltv+XiGqYhBScioArXDrCo
	 vZlyQ1qegZTpg==
Date: Wed, 28 Oct 2026 16:26:13 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 49/49] ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING
 post stop_machine()
Message-ID: <auIUFQL35gon7cU2@localhost.localdomain>
References: <20261019130856.49711-1-frederic@kernel.org>
 <20261019130856.49711-50-frederic@kernel.org>
 <1f1260db-09df-4d42-bfc7-34f9a787176a@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f1260db-09df-4d42-bfc7-34f9a787176a@broadcom.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Le Fri, Oct 23, 2026 at 10:05:30AM -0700, Florian Fainelli a écrit :
> On 10/19/26 06:08, Frederic Weisbecker wrote:
> > Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
> > all the teardown callbacks while stopping all CPUs in the system. This
> > doesn't mix-up well with running RT or isolated tasks.
> > 
> > In order to transition smoothly from global stop_machine to finer
> > grained synchronization between teardown callbacks and the other CPUs,
> > a new stop machine post function has been introduced to be executed
> > after the main one with IRQs still disabled while other CPUs can exit
> > stop_machine().
> > 
> > It *looks ok* to disable the cache readahead globally while the other
> > CPUs are running.
> 
> Yes I think it is safe given that b15_rac_dying_cpu() will run on the dying
> CPU and any CPU that is left will basically re-enable the RAC afterwards if
> necessary in b15_rac_dead_cpu().

Good.

> 
> The hardware to test this is quite ancient, but if you give me a test case
> to exercise, I can give it a spin.

I don't have the hardware either. Otherwise the only test I can think of is
to simply shutdown a CPU and see if that explodes.

Thanks!

> 
> Thank you Frederic!
> -- 
> Florian

-- 
Frederic Weisbecker
SUSE Labs

