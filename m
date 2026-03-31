Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AA61061B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 12:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From
	:Subject:Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOk6ZEMpVwn9Sr5/ED9nqcRWuHKUVnAHgel8wrry+3Q=; b=VVHvJQLgCA3vLdWELFL5KcVvWI
	Tsc+y4h1WfoK9FopnWczm5KctZgMRheBqDXdHR31NyBIEQYuozt9cSWbAzRfknIxhZrdOuaMdiBpH
	GBb0e7XjN1VdhwccKVmado4Jb18hA+t+AnPIHrbltc/ZXnQEVXvSeHwIR1QO/QPReSfzcxVgVxc7h
	hY4lDBKR/mmIpeN31wOCXT9pNSYewFyjo2yKZFAmRETGpn/gNkMKKK7izhN7JgS+LTzFrtGX4HQCM
	po90e+DlYrjVUhwSYbRWxnqJyMfmqZTT+gif2HHojCXrl50U7J0ke8DikRJmxGWlVO8CPpVyPoYV3
	KBP7KLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Y1w-0000000CvMo-0NnQ;
	Tue, 31 Mar 2026 12:17:12 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Y1s-0000000CvLh-2c8r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 12:17:10 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260331121700epoutp01a522367deb75437a61ddd7d318a858e3~h7DBDxHXf0530805308epoutp01P
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 12:17:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260331121700epoutp01a522367deb75437a61ddd7d318a858e3~h7DBDxHXf0530805308epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774959420;
	bh=bOk6ZEMpVwn9Sr5/ED9nqcRWuHKUVnAHgel8wrry+3Q=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=nheSzh6f4Aw1LQD4R7UV0nymhH1AwUj9e89uX/tzhJyfAZd6oIjjZEwbiPi9taG54
	 pGK/4PkhJm3AR0SfWsOFRMJOjrcN5ZRKBBdCBvdlQqfR6gyiVBBg4wyhVIwoHr1M3W
	 rY22kuVDyuw2unphCj0wgzUn+arW7Wi10ejUmuRw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260331121659epcas5p3823b28c5471e5945723233b94c54277e~h7DAic-UE2492324923epcas5p34;
	Tue, 31 Mar 2026 12:16:59 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4flRtz4LSWz6B9m7; Tue, 31 Mar
	2026 12:16:59 +0000 (GMT)
Mime-Version: 1.0
Subject: RE:(3) [PATCH 1/1] arm: get task_stack reference before
 dump_backtrace
From: Maninder Singh <maninder1.s@samsung.com>
To: "bigeasy@linutronix.de" <bigeasy@linutronix.de>
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>, "peterz@infradead.org"
	<peterz@infradead.org>, "kees@kernel.org" <kees@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>, "keithpac@amazon.com"
	<keithpac@amazon.com>, "linusw@kernel.org" <linusw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20260331065230.9T3e_rt-@linutronix.de>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260331121659epcms5p6afd55fcc98037c6d82b3ac32c470ed1c@epcms5p6>
Date: Tue, 31 Mar 2026 17:46:59 +0530
X-CMS-MailID: 20260331121659epcms5p6afd55fcc98037c6d82b3ac32c470ed1c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6
References: <20260331065230.9T3e_rt-@linutronix.de>
	<aa4Lo30Nq_t7qDqK@shell.armlinux.org.uk>
	<20260305070527.719073-1-maninder1.s@samsung.com>
	<20260309055328epcms5p56d16f6cb1e3a5295987c935f35be1d2e@epcms5p5>
	<CGME20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6@epcms5p6>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_051709_316523_FA54EDC2 
X-CRM114-Status: GOOD (  19.26  )
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
Reply-To: maninder1.s@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> Hi,
>=20
> > >=22otherwise if someone calls show_stack() for task=22 ... and the sta=
ck
> > >trace given stops at show_stack() and doesn't show the =22someone=22.
> > >
> > >I'd like to know _how_ this happens, and why ARM64 and now 32-bit ARM
> > >are different from x86.
> >=20
> > I tried to simulate same thing on x86_64, it is also crashing.
> >=20
> > Just a dummy code to save task_struct to reproduce the race:
> >=20
> > +=C2=A0=20=C2=A0=20=C2=A0=20=20rcu_read_lock();=0D=0A>=20>=20+=C2=A0=20=
=C2=A0=20=C2=A0=20=20for_each_process(p)=20=7B=0D=0A>=20>=20+=C2=A0=20=C2=
=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=20if=20(=21strcmp(p->co=
mm,=20=22sleep=22))=20=7B=0D=0A>=20>=20+=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=
=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=20check_=
task=20=3D=20p;=0D=0A>=20>=20+=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=
=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=20get_task_struct(p)=
;=0D=0A>=20>=20+=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=
=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=20pr_emerg(=22get=20done=20for=
=20%s=20%d=5Cn=22,=20p->comm,=20p->pid);=0D=0A>=20>=20+=C2=A0=20=C2=A0=20=
=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=20=7D=0D=0A>=20>=20+=C2=A0=20=
=C2=A0=20=C2=A0=20=20=7D=0D=0A>=20>=20+=C2=A0=20=C2=A0=20=C2=A0=20=20rcu_re=
ad_unlock();=0D=0A>=20>=20=0D=0A>=20>=20//=20in=20mean=20time=20here=20slee=
p=20binary=20will=20be=20exited.=0D=0A>=20>=20=0D=0A>=20>=20+=C2=A0=20=C2=
=A0=20=C2=A0=20=20show_stack(check_task,=C2=A0=20NULL,=20KERN_EMERG);=0D=0A=
>=20=0D=0A>=20The=20task's=20stack=20is=20released=20on=20its=20final=20sch=
edule()=20invocation.=0D=0A>=20Therefore=20holding=20task_struct=20does=20n=
ot=20hold=20the=20stack=20of=20the=20task=20if=20it=0D=0A>=20is=20separated=
=20out=20of=20task_struct=20and=20can=20be=20gone=20if=20the=20tasks=20quit=
s.=0D=0A>=20=0D=0A>=20Therefore=20holding=20a=20reference=20to=20the=20stac=
k=20while=20accessing=20it,=20like=0D=0A>=20during=20a=20backtrace,=20makes=
=20sense=20and=20is=20required=20if=20the=20task=20is=20not=0D=0A>=20curren=
t.=0D=0A>=20=0D=0A>=20Let=20me=20add=20this=20to=20my=20list=20and=20tackle=
=20it=20later=20today=20for=20x86.=20Then=20we=0D=0A>=20get=20probably=20Ru=
ssell=20on=20board=20for=20ARM.=0D=0A>=20=0D=0A=0D=0AThanks=20:)=0D=0A=0D=
=0AI=20have=20checked=20more=20details=20about=20missing=20this=20handling=
=20from=20x86=20and=20found=20the=20reason.=0D=0AOriginally=20show_stack()=
=20was=20calling=20show_stack_log_lvl()=0D=0Awhich=20had=20proper=20call=20=
to=20try_get_task_stack().=0D=0A=0D=0AIt=20was=20replaced=20with=20show_tra=
ce_log_lvl()=20later.=20Which=20removed=20this=20check.=0D=0A=0D=0ABelow=20=
commit=20did=20that.=0D=0A=0D=0Acommit=200ee1dd9f5e7eae4e55f95935b72d4beecb=
03de9c=20(HEAD)=0D=0AAuthor:=20Josh=20Poimboeuf=20<jpoimboe=40redhat.com>=
=0D=0ADate:=20=20=20Tue=20Oct=2025=2009:51:13=202016=20-0500=0D=0A=0D=0A=20=
=20=20=20x86/dumpstack:=20Remove=20raw=20stack=20dump=0D=0A...=0D=0A...=0D=
=0A=0D=0A=0D=0A-void=20show_stack_log_lvl(struct=20task_struct=20*task,=20s=
truct=20pt_regs=20*regs,=0D=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20unsigned=20long=20*sp,=20char=20*log_lvl)=0D=0A-=
=7B=0D=0A...=0D=0A...=0D=0A-=20=20=20=20=20=20=20if=20(=21try_get_task_stac=
k(task))=0D=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20return;=0D=0A-=
=0D=0A...=0D=0A=0D=0A=40=40=20-171,12=20+170,12=20=40=40=20void=20show_stac=
k(struct=20task_struct=20*task,=20unsigned=20long=20*sp)=0D=0A=20=20=20=20=
=20=20=20=20if=20(=21sp=20&&=20task=20=3D=3D=20current)=0D=0A=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20sp=20=3D=20get_stack_pointer(current,=
=20NULL);=0D=0A=0D=0A-=20=20=20=20=20=20=20show_stack_log_lvl(task,=20NULL,=
=20sp,=20KERN_DEFAULT);=0D=0A+=20=20=20=20=20=20=20show_trace_log_lvl(task,=
=20NULL,=20sp,=20KERN_DEFAULT);=0D=0A=20=7D=0D=0A=0D=0A=0D=0A=0D=0ASo=20I=
=20think=20x86=20patch=20shall=20also=20be=20merged=20to=20kernel:=0D=0Ahtt=
ps://lkml.org/lkml/2026/3/11/317=0D=0A=0D=0A=0D=0AThanks=20and=20regrads=0D=
=0AManinder=20singh=0D=0A=0D=0A=0D=0A

