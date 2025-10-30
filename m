Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE8FCCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbR73pzFZ1oGN9Mnahj63+fWkfMMCnpWzNCW1Tl6/6U=; b=BLbRpZfRKoYOkvYoV7MXNb/Czz
	wyU7IWwAGwN/ctADUK5p9yZpigB/8xVFsorj30qZdyjlFlPHnNsniYlPzhqxS5g84F8piaomb7qHg
	mG/NfCb1rsz9NJ6n/Nj1dr+p3so6S+tLZj95zHeJX7R0bQmm7a+Jc93XXARXOPukAJMPg5pz6QCKP
	sjyhFYWO+399M63OzLaVZhc7EWDwfOXxcGJ9HXW+cBt+zie/Yqgo8r9NECR5iwN0Ll5iSwGEkJuDm
	3ppq2xPsqU0/QdQijR2fSKW6cFzsMgGsta0QIWLpU5Vu+wkPrmHmt4VTv1mMhNpSkJuNEhtzEO1O7
	Pl4XQn0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPWb-00000003vyo-2gE9;
	Thu, 30 Oct 2025 10:04:57 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPWY-00000003vxo-2XPj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:04:55 +0000
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 81F9C5C43A;
	Thu, 30 Oct 2025 10:04:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 824162000E;
	Thu, 30 Oct 2025 10:04:49 +0000 (UTC)
Date: Thu, 30 Oct 2025 06:05:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
 linux@armlinux.org.uk, tglx@linutronix.de
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Message-ID: <20251030060531.505d7127@gandalf.local.home>
In-Reply-To: <20251030095615.ae7bck5m@linutronix.de>
References: <20251030072339.63vdFNo3@linutronix.de>
	<20251030074507.33863-1-xieyuanbin1@huawei.com>
	<20251030075558.sUBj8_6U@linutronix.de>
	<20251030054626.7a897b29@gandalf.local.home>
	<20251030095615.ae7bck5m@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 824162000E
X-Stat-Signature: 4tct77647hn1ouygiy1cqijmkym88pg7
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18xIVP8FdiENPwAdW2uZaQx4Hxlw9FUnNI=
X-HE-Tag: 1761818689-72234
X-HE-Meta: U2FsdGVkX18fud/O/dYe6YxVvNIhorpVgtqv6mOR4YADnRseWGVNwbjKe16X1uEPx0Lqjwaa6pGPMORofpmI5QdXygEaFdHMZPlRlGG4SQOxQASEgOpjE59aFU0G6roTb0lSMr2VPfwCexIfZj/cmz9dYNFA/tjtTAyua3jEhLWIgPU+OorOcPt6c8Vrk4hDWPHVHpJpH0Mn7jc2wGUftm+1TbeblI7jgZRMy+VBl9fkI6z8Xvp92cHW7Tpf+L1keh+TjK0vzCZADKWKT076sCSrynHqvoUWhxN39pTfEya2voktzvfamey8coPSyzeg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_030454_723387_6E3CC437 
X-CRM114-Status: GOOD (  16.40  )
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

On Thu, 30 Oct 2025 10:56:15 +0100
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> trace events were an example and this is used to enable tracing in
> production or development to gather information if something is not
> working right _or_ on the edge to investigate. A latency spike at this
> point would be a timing violation forcing the system into a safe state
> an so not allowing further investigations.
> 
> I hope I made it clear that using jump-labels at this point is not
> doable at this point and a warning does not improve things. Improving
> the implementation on ARM as it has been done on ARM64 or X86 is how I
> would compare the situation to printk. Not adding a warning at boot
> time.

I wasn't talking about the print being at boot time. But when it gets
enabled (like when RT throttling happened). I wouldn't even do it the first
time it gets enabled, but print a waring when it is activated if the last
time it printed a warning was over a minute ago. Thus, even if it was
already printed, but it didn't cause any noticeable latency, it would print
again when it does.

Thus, if the system goes into a "safe state", it is obvious from the logs
it was caused by a user interaction.

-- Steve

