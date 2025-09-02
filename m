Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D893CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9evSCUFhPyfE/1DrZinPX+qIZoXIJaA0dEYDPoG0m8=; b=hql0/EfbsRDfhQvjb7cEvUbz0M
	3V3+Y5HhhPUicSMfk/SftgxEWqsA3Z/uoy0kMOZH6JbQf0R76MOFuoIOSVtlvPLCbAi5xGAVedraC
	mNt7CNKh3Qr03VPbdr1Oc2BhCtqBYq6hlnn5QDxhge8H744/i+3ACOW7Uk9hpxKTo4aiCLRSymQuq
	C+BDJvl7JiosFncotol0SEgFg7Yt6NPATSzK5OvGlNnRV2Oi1vqMv9CeLhh5LYOv0sCAn7fLX28An
	Jyh1KEbH0D4dCzOe2Lxy/AKhldFU/DUpy376HBHi1s2rErn4S3t5o+1SxgYpBlC97v7fy1BzgeuMW
	aY9rsSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQKw-0000000HOGK-3BPX;
	Tue, 02 Sep 2025 12:42:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utP2A-0000000Gskz-1IlW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:18:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3735726BE;
	Tue,  2 Sep 2025 04:18:33 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D25C3F694;
	Tue,  2 Sep 2025 04:18:40 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:18:37 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Jan Palus <jpalus@fastmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: quirk: fix write to string constant
Message-ID: <20250902-original-hallowed-robin-d030bf@sudeepholla>
References: <20250829132152.28218-1-johan@kernel.org>
 <aLG5XFHXKgcBida8@hovoldconsulting.com>
 <aLa__M_VJYqxb9mc@hovoldconsulting.com>
 <20250902-axiomatic-salamander-of-reputation-d70aa8@sudeepholla>
 <aLbGoctnA-Ad-Hxv@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLbGoctnA-Ad-Hxv@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_041842_388135_A66085EB 
X-CRM114-Status: GOOD (  23.47  )
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

On Tue, Sep 02, 2025 at 12:27:45PM +0200, Johan Hovold wrote:
> On Tue, Sep 02, 2025 at 11:16:46AM +0100, Sudeep Holla wrote:
> > On Tue, Sep 02, 2025 at 11:59:24AM +0200, Johan Hovold wrote:
> > > On Fri, Aug 29, 2025 at 04:29:48PM +0200, Johan Hovold wrote:
> > > > On Fri, Aug 29, 2025 at 03:21:52PM +0200, Johan Hovold wrote:
> 
> > > > > The quirk version range is typically a string constant and must not be
> > > > > modified (e.g. as it may be stored in read-only memory):
> > > > > 
> > > > > 	Unable to handle kernel write to read-only memory at virtual
> > > > > 	address ffffc036d998a947
> > > > > 
> > > > > Fix the range parsing so that it operates on a copy of the version range
> > > > > string, and mark all the quirk strings as const to reduce the risk of
> > > > > introducing similar future issues.
> > > > 
> > > > With Jan's permission, let's add:
> > > > 
> > > > Reported-by: Jan Palus <jpalus@fastmail.com>
> > > > 
> > 
> > I was hoping to hear back, but I assume silence is kind of acceptance.
> 
> I sent the reply with the tag after making sure off-list that Jan was OK
> with it. Sorry if that was not clear.
> 
> > > Please don't do such (non-trivial) changes without making that clear
> > > in the commit message before your Signed-off-by tag:
> > > 
> > > 	[ sudeep: rewrite commit message; switch to cleanup helpers ]
> > > 
> > 
> > Sorry I meant to do that when I replied and asked you if you are OK
> > with cleanup helpers. Also yes I planned to add a line like something
> > above before finalizing.
> 
> Sounds like a mail has gotten lost since I never saw that question from
> you.
>

No I hadn't sent it yet, generally wait for builder report to finalise
the commit. Sometimes -next integration happens before build sends build
report for my branch and that happened this time.

-- 
Regards,
Sudeep

