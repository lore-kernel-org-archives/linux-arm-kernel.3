Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE313CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BT9+oU/cNR1uwwYCBK9wtqRUevMJmNyMkvw+gKM/JZs=; b=JtMifS6O27CDHd39kcNV5eZmlg
	BV+D0n5H8KEsBkZyE9Yn++zgbwU/5CpYU2T7XATuwxAEg+Z8vRvXzPEMsltYe7qxwGItPvnOjUXRo
	lkZHZu5yNiE0X37jowVdgmFByYqaS7UQH4fhiNLLdgRfB7aa2r1T0I72m0XUUmRmoU5bB2be6zNqO
	OG3+m7HWmhG1QV/9cjdi0Ytb3KZNDuua3Calr5JEnDYJU1ecrSftdkBVlLk//O1hgbeEmzIWkMxSb
	/Pl+63IKquNcgjA+zgDrc8kwPpFDjNddkafM6OLxIazXnWwAxpjt1/83zMhLeGQWsbYf2XiWl/b2+
	fZlx3mWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSARW-00000003clz-3auU;
	Wed, 27 May 2026 09:20:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSARV-00000003clc-1DiG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:20:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05FE043656;
	Wed, 27 May 2026 09:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BF11F000E9;
	Wed, 27 May 2026 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779873648;
	bh=BT9+oU/cNR1uwwYCBK9wtqRUevMJmNyMkvw+gKM/JZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BDwEATUAsKocB0ms53S782vGeKroChaJ1jHdkqySX/Uo5vdtFWtMMU19H23sKaRBy
	 kD+A5qJzoxFUwjDycnF4CZYiBZORXP20dR7q8CAQ530mJpWO4rbhv3RClhXpjXnBS6
	 h0ACYHhi2XXHf9NOOb9kkYBfDrwAHI/JDLYERGMQeF5l61jYXTVo0eUcYs7gXDbV2A
	 wzwIE/w8ZA5tJF8hpitKFSpn5+Jx7pejKyAr4Uu2/ApcvnqWG8HAfFHl/CKRaKer9Q
	 WYOSfNHgjg/iWn5oFWoj9dqt/dioVr9F73aKFzr14/12Ggvy4D3hJkFpSeAxvHOkQv
	 D7vr256TQE2nA==
Date: Wed, 27 May 2026 10:20:45 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <20260527-invaluable-crystal-hamster-eedfc1@sudeepholla>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <20260521-loutish-lurking-koel-229bd9@sudeepholla>
 <CAMuHMdWA1UpZSiN26fd71LUMYatVOwJos6bGb4zR0bnPUqBF8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWA1UpZSiN26fd71LUMYatVOwJos6bGb4zR0bnPUqBF8w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_022049_354065_952FAD37 
X-CRM114-Status: GOOD (  28.94  )
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

On Fri, May 22, 2026 at 09:56:32AM +0200, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Thu, 21 May 2026 at 18:26, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > scmi_power_name_get() does not validate the domain number passed by the
> > > external caller, which may lead to an out-of-bounds access.
> > >
> > > Fix this by returning "unknown" for invalid domains, like
> > > scmi_reset_name_get() does.
> > >
> > > Fixes: 76a6550990e296a7 ("firmware: arm_scmi: add initial support for power protocol")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  drivers/firmware/arm_scmi/power.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
> > > index 3aa84ceb6d2bab68..4a7215e02dec035d 100644
> > > --- a/drivers/firmware/arm_scmi/power.c
> > > +++ b/drivers/firmware/arm_scmi/power.c
> > > @@ -204,8 +204,12 @@ scmi_power_name_get(const struct scmi_protocol_handle *ph,
> > >                   u32 domain)
> > >  {
> > >       struct scmi_power_info *pi = ph->get_priv(ph);
> > > -     struct power_dom_info *dom = pi->dom_info + domain;
> > > +     struct power_dom_info *dom;
> > > +
> > > +     if (domain >= pi->num_domains)
> > > +             return "unknown";
> >
> > The only user of this function must not call it for domain >= pi->num_domains.
> > However, I am thinking if it is bit inconsistent within SCMI core now. I like
> > the way pinmux/ctl handles this as I don't like the alternative for this
> > (i.e. ERRPTR(-EINVAL or something)). Worst case if this ever causes issue
> > we can change the signature of the scmi_{power,reset}_name_get to follow
> > something like pinmux and update the users. Thoughts ? Happy to apply this
> > for now.
> 
> You mean returning an int error code using return statements, and
> returning the objects using passed function pointers?
> 

Yes I was thinking so, scmi pinmux seem to follow that.

> Depends on the number of returned objects: if it's just one (e.g. a
> name or info pointer), then the valid pointer/error pointer idiom is
> very common in Linux.
> 

Makes sense, I have applied it now. Thanks!

-- 
Regards,
Sudeep

