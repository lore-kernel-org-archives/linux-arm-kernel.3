Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D53CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3jSmj/q7r9XoHpkKM7+f2nT3njbkCtAPLWwJEuoUWo=; b=z6kjM4gZztt4ErJ9Ii507nuKxs
	u31GGx5Khf/YtUeV/mJhv3UuTv3TBaDQGwdUqXiyggeeqSR0mgHHeDrvoDxffmxoYKeDKQe+eA8z7
	lFq/zchk3tHz1SNaHwJJO9kjBopoXcrd9h4fvon2lASKIOTsyMXGbllfVNFjrO/THykKMwI6APZL7
	EpVJ4mDt3lkvhOW5RZbRGDaW/YqXy1d2Rw31d1pXx/5R4Qx/nSKvpMvwWHVC9wHHILxUUmGgSpXMw
	HmIQFlcHf1NxEvoJy0OlHcWQYQRzCI9u7WEho4k+DHDGOKjvShdHFVH9FRqUAGhU7RbArAu8R5wub
	KVVzqIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc0O-00000003trk-1wee;
	Wed, 20 May 2026 08:10:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc0N-00000003trW-1JCg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:10:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 821F1601FE;
	Wed, 20 May 2026 08:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F1A1F000E9;
	Wed, 20 May 2026 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779264614;
	bh=Y3jSmj/q7r9XoHpkKM7+f2nT3njbkCtAPLWwJEuoUWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gKeeVMuDx+rpLUPRiNm+kwdwTIxb4YoqOE2p7OPqYCAUaBjGLkbpYOf0UNb+LUMvj
	 ufElgBTkYq+SWyBRqo9OU6fmKrzZv0CuOrL1t60Vvg7YGH9vpRYVQWdGqxtUsmgPQJ
	 vFOlWmNpONVd1mqqmWyy5gRETqo1jLP/MnqAgjwQ+TD7gaDs0MXUdyq7qr8sOha/qN
	 pRzpwMN8JMQBLin31RBhgDGySb3AlnmkQ8/Jm3Og/co8WeKkbNCrO8AbooxzVSdfV2
	 jt0e65eqhYYJZweXamvlIhg0/S7W2EyMBhkuoYXMI47TN70eYcmvhM0jJSzXIaLp+h
	 MjR8iRHI1HTDg==
Date: Wed, 20 May 2026 09:10:11 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Validate Powercap domains before
 state access
Message-ID: <20260520-wise-lorikeet-of-health-34648a@sudeepholla>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
 <20260517-scmi_fixes-v1-4-d86daec4defd@kernel.org>
 <agw1ueCQ0WjoBX7-@pluto>
 <20260519-utopian-parrot-of-sorcery-eff40c@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-utopian-parrot-of-sorcery-eff40c@sudeepholla>
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

On Tue, May 19, 2026 at 11:04:41AM +0100, Cristian Marussi wrote:
> On Sun, May 17, 2026 at 08:02:43PM +0100, Sudeep Holla wrote:
> > Powercap protocol v2 keeps local enable and last-cap state per
> > domain. Some public operations indexed that state before checking that
> > the supplied domain id was valid, and cap_enable_get() updated it even
> > when cap_get() failed.
> > 
> > Validate the domain before touching the per-domain state and only
> > refresh cached enable state after a successful cap_get().
> > 
> 

[...]

> >  	/*
> >  	 * Report always real platform state; platform could have ignored
> >  	 * a previous disable request. Default true on any error.
> >  	 */
> >  	ret = scmi_powercap_cap_get(ph, domain_id, &power_cap);
> > -	if (!ret)
> > +	if (!ret) {
> >  		*enable = !!power_cap;
> >  
> > -	/* Update internal state with current real platform state */
> > -	pi->states[domain_id].enabled = *enable;
> > +		/* Update internal state with current real platform state */
> > +		pi->states[domain_id].enabled = *enable;
> > +	}
> 
> Mmm, this changes the logic as stated in the above comments...now the
> problem is recalling WHY I adopted this logic :<
> 

The comment captures only ignored disabled request in which case
enabled=true is correct. But I fail to understand what would happen
if the previous call is scmi_powercap_cap_enable_set(..,false); and
assume the scmi_powercap_cap_get() from scmi_powercap_cap_enable_set()
also returned false, but failure to get the state in
scmi_powercap_cap_enable_get() will update it to true.

I wonder if it is due to the SCMI versions to maintain compatibility or the
kernel default sysfs value. scmi_powercap_cap_set() treats cached disabled
state specially. If cap_enable_get() defaulted the cache to false after
a failed read, later cap updates could be suppressed even though the platform
might actually still be enabled. Defaulting to true is the conservative
choice. I will drop this change/hunk. I will assume your reviewed by with
that dropped, please shout if not.

The generic powercap sysfs layer itself defaults enabled to true, but if a
driver get_enable() returns an error it reports false. SCMI avoids that by
returning success with true I assume.

-- 
Regards,
Sudeep

