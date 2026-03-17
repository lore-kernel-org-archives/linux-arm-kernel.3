Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32BDFD8763
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJolCzmJ9w3E+51MsIBIekdnoK8ty7dBHT3uu7ZgVUU=; b=fy4iDqcgDXpLNaiPByq+vU6WMU
	DcHv32Lmg3F6OSX3xzXkArQ5TT55CnQ44nePhz8RJld/SQX07DugkvgV9y5iLZ2g6VGL6LJTp2hNK
	Kfszy/2y12yuEK9xCIftMWAMFUZrsg7VrXD5rhDzzA7zfrT/f2quCOmxicFU9rqcg0M1nA24M8N7s
	h3Bb4D2crEtvUYFwRi2O2KkleMoXjYZBMk0KglXXB6tnjWmZ6cudQVHLBV7tV1fnlfNnoRWzztvpm
	QBMeTUXM22MSdyjJZcC6u6sPjM8b5eCwxWB5/XupRQU9Lp+Az4uTp0agiVhZz8fPKgGR1oKsZgJfX
	u2p3io8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ubb-00000006SZz-1k5f;
	Tue, 17 Mar 2026 13:37:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UbZ-00000006SZZ-1qy1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7D5243A5B;
	Tue, 17 Mar 2026 13:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924A4C19425;
	Tue, 17 Mar 2026 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773754624;
	bh=zb+0/FpWFSBGeehYQnYgKbMASYQhs0tC6XBZQs83Cu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=azsZU0HtzNfnw7wxjErPMaACGtdOh4r0Qf0Q4shvlX8XswFL44FCQ9c+ZVPhU2C0O
	 +cu9oDgM3eRmBhi8LWaOUekJajlm+hxAvsWTmbkNzDL07Xx7wSol35e77uViJSSgwE
	 jK5mdFlZQIzcubzEA6MI3yX7saHlItX74fVVMcS9C/lmSMHpFjlNCcQjwYIIIevBnf
	 o/Q1HZmWxRuE4wMeoMjAVs4nZR6A/0lCMoHBkG5+SJJnwq0vP5UkUYcBWLGaX6qNkT
	 AR2Szk/aSG8FreCT98qeFkct8OOSUlhVOf5ivIm62BbpUZsIcaNdbYBdZCSW5IeqtS
	 kruBu8qiV8/pw==
Date: Tue, 17 Mar 2026 13:37:00 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: extract domain ID validation helpers
Message-ID: <20260317-innocent-prawn-of-acumen-68c2ca@sudeepholla>
References: <20260122161728.1225583-1-a.shimko.dev@gmail.com>
 <CAOPX745OsSOuZirpvW5nXDEbjpZXbmXtgQ6zB=dMX2tP+jhgaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOPX745OsSOuZirpvW5nXDEbjpZXbmXtgQ6zB=dMX2tP+jhgaw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_063705_499730_F890B702 
X-CRM114-Status: GOOD (  15.67  )
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

On Tue, Mar 17, 2026 at 03:05:59PM +0300, Artem Shimko wrote:
> On Thu, Jan 22, 2026 at 7:17 PM Artem Shimko <a.shimko.dev@gmail.com> wrote:
> >
> > Refactor the voltage protocol implementation by moving repeated domain
> > ID boundary checks into dedicated inline functions. This reduces code
> > duplication and improves maintainability.
> >
> > The new helpers are scmi_voltage_domain_validate_id() which validates
> > a domain ID and returns an error code, and scmi_voltage_domain_lookup()
> > which returns a pointer to the domain structure or an error pointer.
> > These are used consistently across the voltage operations.
> > No functional changes are introduced - the validation logic remains
> > identical to the original inline checks.
> >
> 
> Hello maintainers,
> 
> Just a gentle ping.
> 
> Do you have any thoughts or feedback on this approach, or are these
> changes even irrelevant?
> 

I applied and then realised it is not necessary to churn so much to just
unify the domain ID validation. So I dropped it.

-- 
Regards,
Sudeep

