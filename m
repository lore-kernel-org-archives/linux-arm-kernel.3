Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD8ECE8E61
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExS2YFrD3MkVQ1daF9oDB0ymAMdP+Sw651k+1t5+V7k=; b=3t30VXPMHEThMAK6A1kGOrr+BE
	VBShUwfNWMfqimrO3LeN2az7BYj4DMTgkk2MyvMQk+6esPMZrRatld4DIPJQlvlUXh3R37Ohl2JN2
	AG9sVnilYMqxwQzef+q+WFp42QwUWx6dY55QllFbRqjHEgzgJN50e/+PUWGpNrCKW6yEoUPEXO4ch
	ZU7+LyNL4wcx/cGjOJQl48axFL86NZ4Ax7rnqzbgKufFLqYQAvrszzM8zFSAfeLlqwBEYl+dZp11T
	3+J2kzw0NHSB+hEIGunfmGXVT0RmF+cfPEqR4wQHcUAKM2r6yQMRwFNrv783GR1S+X/YHtkga44iA
	OBwKhQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vpi-00000000Bew-16Pl;
	Thu, 24 Oct 2024 11:16:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3veZ-000000009xd-2X1k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:05:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13C46339;
	Thu, 24 Oct 2024 04:05:46 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 912863F71E;
	Thu, 24 Oct 2024 04:05:14 -0700 (PDT)
Date: Thu, 24 Oct 2024 12:05:12 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE" <arm-scmi@vger.kernel.org>,
	justin.chen@broadcom.com, opendmb@gmail.com,
	Florian Fainelli <f.fainelli@gmail.com>, kapil.hali@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Support 'reg-io-width'
 property for shared memory
Message-ID: <Zxop6E83YId0et5o@bogus>
References: <20240827182450.3608307-1-florian.fainelli@broadcom.com>
 <20240827182450.3608307-3-florian.fainelli@broadcom.com>
 <20240903154000.GA2080277@bogus>
 <ZxJbJa8Q3V02yf_z@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxJbJa8Q3V02yf_z@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_040519_711187_F1A95814 
X-CRM114-Status: GOOD (  29.43  )
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

Gentle ping! Not sure if my earlier email got into spam or didn't land
in lore/ML. Just thought of checking again.

On Fri, Oct 18, 2024 at 01:57:09PM +0100, Sudeep Holla wrote:
> On Tue, Sep 03, 2024 at 04:40:00PM +0100, Sudeep Holla wrote:
> > On Tue, Aug 27, 2024 at 11:24:50AM -0700, Florian Fainelli wrote:
> > > Some shared memory areas might only support a certain access width,
> > > such as 32-bit, which memcpy_{from,to}_io() does not adhere to at least
> > > on ARM64 by making both 8-bit and 64-bit accesses to such memory.
> > >
> > > Update the shmem layer to support reading from and writing to such
> > > shared memory area using the specified I/O width in the Device Tree. The
> > > various transport layers making use of the shmem.c code are updated
> > > accordingly to pass the I/O accessors that they store.
> > >
> > 
> > This looks good to me now, much simpler. I will push this to -next soon,
> > but it won't be for v6.12. I have already sent PR for that. I want this
> > to be in -next for longer just to see if anyone has any comments and
> > doesn't break any platform(which it shouldn't anyways).
> > 
> > Just hoping if anyone looks at it and have feedback once it is in -next.
> > I will apply formally at v6.12-rc1 and report back if no one complains
> > until then.
> > 
> 
> Hi Florian,
> 
> Just thought I will check with you if the content is -next are fine as I now
> recall I did the rebase as this patch was original posted before the rework
> of transport as modules were merged. Please confirm if you are happy with the
> rebase as you see in -next. I also had to rebase it on recent fixes that
> Justin added as there were trivial conflicts.
> 
> Another thing I wanted to check is if [1] series has any impact on this.
> IIUC no, but it would be good to give a go in terms of testing just in case
> that as well lands in -next.
> 
> --
> Regards,
> Sudeep
> 
> [1] https://lore.kernel.org/all/20241010123627.695191-1-jvetter@kalrayinc.com

-- 
Regards,
Sudeep

