Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008CECF6A86
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:From:To:
	In-Reply-To:References:Content-Type:Message-Id:Cc:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1FuXjS01s3YMgMgzoZhF0uCB3O/s+D9Jm9fJvlCcWo=; b=SpZ6C/V1PNoz91ajpKIjT0cUev
	FVVAfA3dAbQcYiTkjsJnLwXucg/gkiBT/Dagm7QqwInI5vTpCno37gdf/cEeL6XvsHWGrpdQvzg7x
	wL8tlu0S7bT4LEr35pl5kRnHqVTqXaNoPFx+KDJIGz8OrILOEteqM26w1u7MXnL0klaa2+G2lrz8F
	9nf4XoSjLCvj4wtLZUJQe0oNpfUhqB/udb4Cdzj+0BveIrmYsY31EgeIeMMAXy4y4laDwXrRkpQL1
	RgWpZUqLJbGKtrQgYdoZenoIchi7G0N2W5RgyiuWLZqI7VeONLqUFwqvyapP5LlxJT5Dp6KD/vAKE
	EfC0NwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlcr-0000000GKZ9-2ots;
	Thu, 08 Jan 2026 08:44:13 +0000
Received: from sg-1-105.ptr.blmpb.com ([118.26.132.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlco-0000000GKXR-0vod
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 08:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1767861839; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=N1FuXjS01s3YMgMgzoZhF0uCB3O/s+D9Jm9fJvlCcWo=;
 b=I7EVdV8+EOk9KvCmJ2bXtrKDnFFxQSlMQ3PDAEY+DGJZDgmBzdwHX0bFiCbNnRx8cpI9r5
 mP/6+1GR4WW6p801cbjP5ynNt6mULVvbNzlk8IelP8eVQhtW0/WXeISYz0OiAIAClZ+ouA
 4DVMrUmFIeGScfZm6Ygi4e5d4/+Az/ERBFY4+EV3OtSc0HdrhZEwgpxPqrpfvXd/f2GK1r
 /rHYz6iFmAGpTcmeeMMtAS7CWY9Y8QV5Nd3xQSyAiaVIeXhAhQAc4eWNApSBBaJMBuFq4T
 lSrGJDa5L7aJmJ35pXojg2S2tq3O8f/U4BkyzLulRHj3kETpAyfLbTg8Pz0rsw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: <akpm@linux-foundation.org>, <axboe@kernel.dk>, <bhelgaas@google.com>, 
	<catalin.marinas@arm.com>, <cgroups@vger.kernel.org>, 
	<chenridong@huawei.com>, <dakr@kernel.org>, <davem@davemloft.net>, 
	<edumazet@google.com>, <frederic@kernel.org>, <gmonaco@redhat.com>, 
	<gregkh@linuxfoundation.org>, <guojinhui.liam@bytedance.com>, 
	<hannes@cmpxchg.org>, <horms@kernel.org>, <jiangshanlai@gmail.com>, 
	<kuba@kernel.org>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, <linux-pci@vger.kernel.org>, <longman@redhat.com>, 
	<marco.crivellari@suse.com>, <mhocko@suse.com>, <mingo@redhat.com>, 
	<mkoutny@suse.com>, <muchun.song@linux.dev>, <netdev@vger.kernel.org>, 
	<pabeni@redhat.com>, <pauld@redhat.com>, <peterz@infradead.org>, 
	<rafael@kernel.org>, <roman.gushchin@linux.dev>, 
	<shakeel.butt@linux.dev>, <tglx@linutronix.de>, <tj@kernel.org>, 
	<vbabka@suse.cz>, <will@kernel.org>
Message-Id: <20260108084326.1952-1-guojinhui.liam@bytedance.com>
Content-Type: text/plain; charset=UTF-8
References: <20260107190534.GA441483@bhelgaas>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260107190534.GA441483@bhelgaas>
To: <helgaas@kernel.org>
From: "Jinhui Guo" <guojinhui.liam@bytedance.com>
Subject: Re: [PATCH 01/33] PCI: Prepare to protect against concurrent isolated cpuset change
Date: Thu,  8 Jan 2026 16:43:26 +0800
X-Original-From: Jinhui Guo <guojinhui.liam@bytedance.com>
X-Lms-Return-Path: <lba+2695f6e4d+913318+lists.infradead.org+guojinhui.liam@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_004410_486067_2B39A5B1 
X-CRM114-Status: GOOD (  14.50  )
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

On Wed Jan 7, 2026 at 13:05:34 -0600, Bjorn Helgaas worte:
> [+cc Jinhui]
>=20
> On Thu, Jan 01, 2026 at 11:13:26PM +0100, Frederic Weisbecker wrote:
> > HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
> > therefore be made modifiable at runtime. Synchronize against the cpumas=
k
> > update using RCU.
> >=20
> > The RCU locked section includes both the housekeeping CPU target
> > election for the PCI probe work and the work enqueue.
> >=20
> > This way the housekeeping update side will simply need to flush the
> > pending related works after updating the housekeeping mask in order to
> > make sure that no PCI work ever executes on an isolated CPU. This part
> > will be handled in a subsequent patch.
> >=20
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>=20
> Just FYI, Jinhui posted a series that touches this same code and might
> need some coordination:
>=20
>   https://lore.kernel.org/r/20260107175548.1792-1-guojinhui.liam@bytedanc=
e.com
>=20
> IIUC, Jinhui's series adds some more NUMA smarts in the driver core
> sync probing path and removes corresponding NUMA code from the PCI
> core probe path.

Hi Bjorn,

Thanks for pointing out the series.

I=E2=80=99ll resolve the conflicts and send a new patchset once this one is=
 merged.

Best Regards,
Jinhui

