Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A4CCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlgBRANVN3+YbTo+yFypsvxtWyQmICDS3yPCmcNR/gI=; b=UJPT14I4+avk85h/QJ0Bq77Jeb
	bpZEy3KUUA8loWMlaqPKy2WfokWwqMHi7MC73T5XTgkGdKc0m114bLp942YiSBia3LOtV4G5GZ8IV
	h0AGqhM8B+aMcZu4uZGayRzeRghPZmiuy8JzivpOUMXO/C98iWobxJ50vAURl89gIIwUDYPnuwTIk
	evl131uKc+n5KXCECMCEp6WF6lLU/G0mPrvYIBQu7QZ5JFD5IXFZ1NLkYo+Ap5tfeeXg62ZXDXkVw
	VurGWlWt1guXgYGvhVPhaHjF3oAB7T59eWSb9Ea/fVaf+5gtQq33YhAzzTEzlqmzFmWe3gzSnLGYi
	VnBJTvWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPE9-00000003tBO-3fiG;
	Thu, 30 Oct 2025 09:45:54 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPE6-00000003tAB-3kXH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:45:52 +0000
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 4DF4F140AA4;
	Thu, 30 Oct 2025 09:45:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 261E320011;
	Thu, 30 Oct 2025 09:45:44 +0000 (UTC)
Date: Thu, 30 Oct 2025 05:46:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
 linux@armlinux.org.uk, tglx@linutronix.de
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Message-ID: <20251030054626.7a897b29@gandalf.local.home>
In-Reply-To: <20251030075558.sUBj8_6U@linutronix.de>
References: <20251030072339.63vdFNo3@linutronix.de>
	<20251030074507.33863-1-xieyuanbin1@huawei.com>
	<20251030075558.sUBj8_6U@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 261E320011
X-Stat-Signature: 5i5yd6u974bdqbc681j5faaz7soey96h
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19IpeKPkWpvJbWMuwiHyVexD2CuyYZN5D4=
X-HE-Tag: 1761817544-879611
X-HE-Meta: U2FsdGVkX19WE+mtTj5Z7AADdN/XCcXeOMC1S0doOEtQR7wUCgn4ESqevAO6ca/3neOKN5Amzh5LwJeu2ixyJkJOLAqm8+VmvLhFKM8fysbggbA6FqCujy5bOrh0dqh+6TBetfn39y1NXkkIIahwygxj2YdjbAd4IxUauPMy5zZ16m50/+NsjApYD2bDM4qm/MfRhMkIIZNniIKaqbFIc0gYCQrJJ8AllUZKzJQ6Z+JI6H3hsc4e/8EOoJEYylOBMuHhhjEn95q1Fz01x0Jw9TDNRF+X11AKJCa5vK0XNIRNPO94wmHMa2XYa+ESZxoVVz++Syx7mLB9+Uf/ks5nOy7ceAh/rQVb+vbg3ds9F/L5l4ZLu6l11g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_024550_991521_E37855B4 
X-CRM114-Status: GOOD (  12.81  )
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

On Thu, 30 Oct 2025 08:55:58 +0100
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> You can't really control when jump labels are enabled/ disabled. For
> instance this happens if you enable/ disable trace points.
> Arm64 and X86 replaced the stop_machine() logic with something else that
> does not affect latency in that magnitude. If Arm could something
> similar then fine but until then I don't see a way around it.
> There are other things that are disabled on PREEMPT_RT due to latency
> reasons such as transparent huge pages or expedited RCU.

But transparent huge pages and expedited RCU are not user controlled events.

Enabling function tracing was known to cause huge latency for a very long
time and it came from the PREEMPT_RT patch set. Heck, printk use to as well ;-)

Instead, we could print a message to the console stating that a huge
latency has just occurred due to user activation. Similar to what we used
to post when RT Throttling happened (I don't see that message anymore since
dl_server was added :-/).

-- Steve

