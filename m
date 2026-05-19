Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78DECD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlT44GAjdS7aAUiPvcR24JmsWeLTVxOUHH60gHBMn6A=; b=ktlGI+9xbn7XtUYTvdAzQq3EAY
	UsZAfS22+ui0DnKIMxgk7OgKGwymNHslRqbFL3xYuXj1ri2X+f5kJ9htltrdWPamdATEqUN3ap1XO
	qwuiVkJ27oYe1bwCWZ7DHT98RDBTajWz6vhhdM7lGUyXHHH0EzTI1IysJ7bdo3vB42bhno4Cds5FX
	hQFn4o3qsltpAQXDqa/1xubDgbouewJWyX5RL8h6vlArw1tX7iL+AvdT0sjQgVP8lo8V6Ll6yMO8L
	kxNAIvI5oGklBY+VtogLFo/myZdinbHV3jg5ZmjT5gJR+8ndW6BHE1WL9qOOTYfH2GEgeRHiiMTXy
	SNBoSLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG6R-00000000jMf-35xw;
	Tue, 19 May 2026 08:47:03 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG6P-00000000jLH-1usP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:47:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45e7c636e74so1353178f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779180419; x=1779785219; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vlT44GAjdS7aAUiPvcR24JmsWeLTVxOUHH60gHBMn6A=;
        b=DmyFpUsvhy0GZa219c3xIqxpk8qgNYSkDfU+M6IyLpgK+vXwba7OOsZQZdGhO9j14V
         GU57sTK3JtSZcJF/KziKM14KCGaEypo20SQkmAAGGpKTLd7mzy8dGOItqkJyq81yBhzd
         OeBYMi1NozNeHqz+ZPM785uZMtOKdemfeTG8rrW5JsBUlnFRKflBu+9MIsgyMLPgseMv
         WevvPM2z0lOWMuc8BQe5wcmDYF7/bbgCl1ITDO8AzQ6ppdeOy72qwyVyWuFLJIiDOJ+S
         2P5QTOfkaW7QnySorO2EEw+xDm4uzd9RRtKAvCprE9q7l/7AFEurKVz16G4g03RDjKI6
         cLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180419; x=1779785219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlT44GAjdS7aAUiPvcR24JmsWeLTVxOUHH60gHBMn6A=;
        b=nduLvi3v1YyPe7cp7UohSMLSRDfgECax0h60ScZMB8Q5zd1YT02E/1dboZA+0GgFFB
         JZTgdNmJCDVGVNJNWjKkaj02Y4BkG+NSz7SNJPnkjT8knhqpKCcbEEXvH9vma96iBLgD
         3G5vx+giTFroF68b90ZNFQzl1KoppzuNJShh73oasTE+p+dlbOP18EqWubU6VMKmZGN/
         W8q63PGGZ181N/qId6sGJ/RBHBxvEWDnwvLzH9o+TKv0NNpq51dLd6TSJvSx1lNq9MlT
         FH7osK0OJhe1IMvA1zp3RvI2n6QqT0uPaJx84Y302G+96U+1GRXN5zKe0B0cMr2AKTck
         EGaw==
X-Forwarded-Encrypted: i=1; AFNElJ9RwtmGptBooImHuCN5CDycE+4dqtunRsBHz+75lEkwF7W25w4FvaeuCJD+xx1PjZmWo7whl3jAYoTZpbivY1DB@lists.infradead.org
X-Gm-Message-State: AOJu0YzjaE2D9yFFaB3B/WRa7nBsM5430epWX45HKIh/PuoXSwPth2zZ
	FYi655rN/C4+S5INbfeOE7odKeU/in2fnUHyu5190/+v614B4Kp1BRL1
X-Gm-Gg: Acq92OHmRKg0aKEFzpwFsRQNGx0hEKrkzPn1/1VgBgiTjcOnTGqBX+RT/hZABXeQvIP
	99lUGC4FLCGazAoVrjdCtBw221PJkaz0MesvdEGHtcJjoqZJNHcwsjtSglV5AErfsLhLuwu5M1l
	e379bO5HHLQWS7kHe9nHvWOL4zudSx+SzTLCZHn9ViB16oYAop97XLYO6/NgbEG4ukQByd2a6wH
	TNPGhYDcGNij4iwHFmzGeeiw6nI2dEE0DsserJizPgolf8N4e9hMLHacMLAZ58qCHVQhqadmSTJ
	zg/xSuqm9Ci8LyyJqtz6avCeSGN8DbDs96W3rsFwPLWV3zaLCvaEWA/ZsTk7ml8VFzulOXgnkWR
	BS8GnrSqm40689OM3t5JiktOeOG0SAsHWpVN6k/ySIY6s2VEpJuhEtH/UzxPBcOTxnznDf9q1Pu
	Xd6E0pVHVvxaCiQ0EWBz0imC4=
X-Received: by 2002:a05:600c:630a:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-48fe632663emr343949425e9.18.1779180419176;
        Tue, 19 May 2026 01:46:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm529862995e9.1.2026.05.19.01.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:46:58 -0700 (PDT)
Date: Tue, 19 May 2026 11:46:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agwjfyMykDJTlrBd@stanley.mountain>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
 <agcHnzzdhV36j9eH@pluto>
 <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
 <agcNULwGvCACUYx2@pluto>
 <agwhGERAdaKepqgT@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agwhGERAdaKepqgT@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_014701_514822_0FE9D586 
X-CRM114-Status: GOOD (  34.97  )
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

On Tue, May 19, 2026 at 09:36:40AM +0100, Cristian Marussi wrote:
> On Fri, May 15, 2026 at 01:10:56PM +0100, Cristian Marussi wrote:
> > On Fri, May 15, 2026 at 02:00:24PM +0200, Geert Uytterhoeven wrote:
> > > Hi Cristian,
> > > 
> > > On Fri, 15 May 2026 at 13:46, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> > > > > On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > > > > > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > > > > > scmi_power_name_get() does not validate the domain number passed by the
> > > > > > > external caller, which may lead to an out-of-bounds access.
> > > > > >
> > > > > > Is an external caller an out of tree caller?  So far as I can see this
> > > > >
> > > > > I meant a caller outside drivers/firmware/arm_scmi/.
> > > > >
> > > > > > is only called by scmi_pm_domain_probe().
> > > > > >
> > > > > >         scmi_pd->name = power_ops->name_get(ph, i);
> > > > > >
> > > > > > where i < num_domains.
> > > > >
> > > > > You are right. But this seems to be only API implementation in
> > > > > drivers/firmware/arm_scmi/ that does not validate the passed domain
> > > > > number.
> > > >
> > > > Yes we tend to validate protocol operations calls even if apparently
> > > > safe from teh caller perspective...indeed I have this fixed locally
> > > > since ages in an horrible patch, that does a lot more, and that I
> > > > never posted :P
> > > >
> > > > Usually, if it is worth, we also build an internal domain get helper to
> > > > reuse across the protocol unit...but here really there are only 2 call-sites.
> > > >
> > > > What I am not sure is what to return: "unknown" is safer as of now than NULL
> > > > for sure, but really, what happened is NOT that the name was "unknown" (which
> > > > by itself would be out-of-spec behaviour) it is more that the whole domain that
> > > > was referred to that was invalid and NOT existent...
> > > >
> > > > ....mmm I suppose we are opening another can of worms here :P
> > > 
> > > Like scmi_perf_info_get() returning ERR_PTR(-EINVAL) instead of NULL,
> > > and scmi_perf_domain_probe() never checking the return value anyway?
> > 
> > ...oh probably more than that...and related vendor FW that already exploits
> > these missing checks here and there to arbitrarily skip domains and return
> > out-of-spec non-contigous sets of domains becasue they cannot bother to
> > implement properly the spec (or they have simply forked their codebase from
> > an old drop and never updated it again...)...so that any kernel-side fix
> > you made along the road carries the risk of breaking something and a string
> > of possibly needed quirks...
> 
> Anyway, it is the safest option on the table until proper checks are in place.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

If it has a description like this then it's absolutely going to get a CVE
assigned.  We're used to hundreds of CVEs and all but I really feel like
this is a bad habit.

regards,
dan carpenter


