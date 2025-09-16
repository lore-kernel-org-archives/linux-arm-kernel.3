Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6071CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdBjosARmBSEo7aiSHM+dIdoMHfCZY2WlWe0Fb0A5eI=; b=uT5YZeraduSJXJPVstx3Xo2Cjq
	fIdQs8f2UBPJuG+J+L3qZHTtg1GA4ZPzxxrc1n25VRhmliWarQgksfj4hg9uyOaH6KPyt9Pjoug90
	eYORj/yw724+oJtjh/Wb3S7KMLRAO3srrZxqI6Ps2bXWNsdxP0I+9LBxgWX7L7Af1V/DyL8sJCWWZ
	H/yu9/Ixvsrey2XipfZdaA39OPMnkBr9L+d/dIIGOe6keHhHh62FwXzjTnSB7zlloQBRfR2nMJKXz
	9lrM9g4KmZRFNVo3kdYVG/19kPI+HScw1k2uNfi6Ohgz3I24+6KIUhVDh/CUWK9vEJ0wIL/HBo3Yq
	RP5SiNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd2V-000000099vB-2KDt;
	Tue, 16 Sep 2025 21:16:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd2T-000000099tG-16pu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:16:38 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758057395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cdBjosARmBSEo7aiSHM+dIdoMHfCZY2WlWe0Fb0A5eI=;
	b=V22XGrXJlCZ5AQ9pe37LMtlOlaa5uG8osxrLsqv/+DC/Jbi/gaOpvLPA0WMtTQxFy0AUdp
	ocZJsSczCxILdgsmO4GMKTUFDP0xpwY6AtIXURDTCI7YBHO2vUnZPIuwtJw2bNKQ43jRR/
	SrnGkYVy74kqALkz23Q9mSMTMN61R3tuGvD3/VSh+ybJMd55BYszvtovTcZU3B8sWL/oxK
	m7Yx3U3wdB0a8EHseRTc6f9n1GflXL/nu61iIYkP98BgbC6HF97j1UXSi1XiE2URbMvERJ
	DzKL9myXEOmPWxsz4yNEbIW3+Ka6Elq8rzhi9TN1pUtrkyuBilYL6aLIOL/JOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758057395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cdBjosARmBSEo7aiSHM+dIdoMHfCZY2WlWe0Fb0A5eI=;
	b=CqWJ884fvJ8/FWHJRwkFwD617d0BLRtMBNrP3oVIvDrTlG1B/A3pQgDgnF+3bJQdmfDYNc
	0I7SSpqMR6U7YOCg==
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
In-Reply-To: <87cy7q9k8y.ffs@tglx>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
Date: Tue, 16 Sep 2025 23:16:34 +0200
Message-ID: <87a52u9jyl.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_141637_441428_D4262C55 
X-CRM114-Status: GOOD (  10.30  )
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

On Tue, Sep 16 2025 at 23:10, Thomas Gleixner wrote:
> On Fri, Sep 12 2025 at 18:08, Eugen Hristev wrote:
>> nr_irqs is required for debugging the kernel, and needs to be
>> accessible for kmemdump into vmcoreinfo.
>
> That's a patently bad idea.
>
> Care to grep how many instances of 'nr_irqs' variables are in the
> kernel?
>
> That name is way too generic to be made global.

Aside of that there is _ZERO_ justification to expose variables globaly,
which have been made file local with a lot of effort in the past.

I pointed you to a solution for that and just because David does not
like it means that it's acceptable to fiddle in subsystems and expose
their carefully localized variables.

Thanks

        tglx

