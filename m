Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D591CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9tMkyx+mFjMTsynp+oagnyb2993Em6DLluZKM7yh0g=; b=nUDAorG3uHoUnENwjcip9U80Ej
	Q1fZnBvmSVHcm/5NEwFdOz5gPvs/tyFS1k7AOvcujoYMiZHD4TJnh7W1CCvKorLZGQJbTFwrBSGI+
	HcpeUhMgphRM5SuaMWuFMeWVUOvc9CzCuQSEp7yO20FYxBTBKsoCPb5snnhpcZAH7erUtBj30v4Fn
	7oWhQba/t01toY6vlPNeifc4ul/YKHj8+dNR2XW5+mjeweUrWpkgRcjdC1YYp0bavNWtq9FyzOzpJ
	I9dwBA2bb9ZLrCpvVSW0nc8HVaLKeBZD4g7ADKbM73OBSIXvqGJzPaYySumPQoqBn7p9TLTwzDHrV
	ggUktyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQBX-0000000HJtM-28ma;
	Tue, 02 Sep 2025 12:32:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utOF6-0000000Gg2X-43eG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 10:28:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 205BF601D3;
	Tue,  2 Sep 2025 10:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F8DC4CEED;
	Tue,  2 Sep 2025 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756808879;
	bh=e+JGdBZlEQwB2llDtbOT+bOn4vC2kuWun8FcHjC5bks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANsrxkQUFhi5hZBSz0WtooVaJxE5l+wRicHWEAThlbi/a6vHYPAmrVf+PeEhP+Bw3
	 UCTj3+BSvreM/faFHfcW5E49EPfmbU8clrlZS+jEZRc5AkYAeJDkgkov2Ey2yEEdl/
	 mbxujtvTFCk/kmgIH4TMjL/E0bs1+DF630opkefAbqRoJfDmjfKtwOi1tQuZele/1z
	 7FBe5MFj6l3KbH2A1vxqHzAJe9sqx7KrePqCNJ9f+MUBxdhe/HhVogwH7aQZ6vVY3X
	 gvzIoMc3IsV27cOn0QZMjrmUPnwxRk0VHAYfIOYVx+fs0yUL10nK7YyVh6z1Xtj3jW
	 PPxGki5FAA4kg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1utOEr-000000008Uh-0EbN;
	Tue, 02 Sep 2025 12:27:45 +0200
Date: Tue, 2 Sep 2025 12:27:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Jan Palus <jpalus@fastmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: quirk: fix write to string constant
Message-ID: <aLbGoctnA-Ad-Hxv@hovoldconsulting.com>
References: <20250829132152.28218-1-johan@kernel.org>
 <aLG5XFHXKgcBida8@hovoldconsulting.com>
 <aLa__M_VJYqxb9mc@hovoldconsulting.com>
 <20250902-axiomatic-salamander-of-reputation-d70aa8@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-axiomatic-salamander-of-reputation-d70aa8@sudeepholla>
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

On Tue, Sep 02, 2025 at 11:16:46AM +0100, Sudeep Holla wrote:
> On Tue, Sep 02, 2025 at 11:59:24AM +0200, Johan Hovold wrote:
> > On Fri, Aug 29, 2025 at 04:29:48PM +0200, Johan Hovold wrote:
> > > On Fri, Aug 29, 2025 at 03:21:52PM +0200, Johan Hovold wrote:

> > > > The quirk version range is typically a string constant and must not be
> > > > modified (e.g. as it may be stored in read-only memory):
> > > > 
> > > > 	Unable to handle kernel write to read-only memory at virtual
> > > > 	address ffffc036d998a947
> > > > 
> > > > Fix the range parsing so that it operates on a copy of the version range
> > > > string, and mark all the quirk strings as const to reduce the risk of
> > > > introducing similar future issues.
> > > 
> > > With Jan's permission, let's add:
> > > 
> > > Reported-by: Jan Palus <jpalus@fastmail.com>
> > > 
> 
> I was hoping to hear back, but I assume silence is kind of acceptance.

I sent the reply with the tag after making sure off-list that Jan was OK
with it. Sorry if that was not clear.

> > Please don't do such (non-trivial) changes without making that clear
> > in the commit message before your Signed-off-by tag:
> > 
> > 	[ sudeep: rewrite commit message; switch to cleanup helpers ]
> > 
> 
> Sorry I meant to do that when I replied and asked you if you are OK
> with cleanup helpers. Also yes I planned to add a line like something
> above before finalizing.

Sounds like a mail has gotten lost since I never saw that question from
you.

I'm fine with using the helpers here even if I'm not generally a fan of
them (e.g. due to declarations in middle of functions).

> > In this case, you also changed the meaning so that the commit message
> > now reads like the sole reason that writing to string constants is wrong
> > is that they may reside in read-only memory.
> 
> Ah, I didn't realise that it changes the meaning now.
> 
> > I used "e.g." on purpose instead of listing further reasons like the
> > fact that string constants may be shared so that parsing of one quirk
> > can subtly break a later one.
> 
> I see your point, will revert to your commit message.

Thanks!

Johan

