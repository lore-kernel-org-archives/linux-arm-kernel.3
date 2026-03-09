Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5550BF513F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 05:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From
	:Subject:Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9LZuSZ/E9KhIu5l5DbkT35bnMP88hltzNhtK32tozw=; b=BiErLtYCZJ7MYiF8n2sGwRba89
	oW4oz9XgOfQGFJnN1yWt9FEvQfX/z/e4T5p3qog2X6esGYUQv1rdAlhNH8UT6Ya5v/4xavUwTMFA/
	7Roud28anhnZLr2F/X5MHkTbolUq0//QiQwAlK4b7L10tlykhSnvJRW/y67WUT05Wue05vcm/9+Nr
	RfLvCPEyNqOpkQEa1xr5jNjuDfjny6NJXl+LzV60kOuQjsC9ZWj0vWcpqJ9ErXA9z60v4S6dB+LDK
	xuUcntg0AmjLTs3QIdqP8x50ffzSpjJ9gr6B1r+FpDAjSgIrR5o3XIHSPpxmZqfhxPnwwG6Jiyu0l
	oo9U7O4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTb8-00000006hhX-36HR;
	Mon, 09 Mar 2026 05:56:10 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTb6-00000006hh6-2gKD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 05:56:10 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260309055558epoutp037c1fd934857611f5a6d1f0b978ebc25c~bFqD32b4f1399013990epoutp03N
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 05:55:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260309055558epoutp037c1fd934857611f5a6d1f0b978ebc25c~bFqD32b4f1399013990epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773035758;
	bh=T9LZuSZ/E9KhIu5l5DbkT35bnMP88hltzNhtK32tozw=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=GG+AfqEmvvYk5PgU8Wpo7QiRvSyWVJs9Zye9NKKQ2Xtjk4jzbcVD4vn+F/NLeewaU
	 tmSKnFIOJNSxzeV7eGVtCCq0W7FO8waBax51qAAqsPJFHtLZRySZBUNoHV6aUX0WYT
	 WM12dPg8yzwXQfronR1iEBwt99PewaCvYy6431OA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260309055557epcas5p1e4c52aafd8b7f13c7a0da36adf0213ae~bFqC6Oxkz0568005680epcas5p1E;
	Mon,  9 Mar 2026 05:55:57 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fTmTT611Yz3hhTB; Mon,  9 Mar
	2026 05:55:57 +0000 (GMT)
Mime-Version: 1.0
Subject: RE: [PATCH 1/1] arm: get task_stack reference before dump_backtrace
From: Maninder Singh <maninder1.s@samsung.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "kees@kernel.org" <kees@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>, "keithpac@amazon.com"
	<keithpac@amazon.com>, "linusw@kernel.org" <linusw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20260309055328epcms5p56d16f6cb1e3a5295987c935f35be1d2e@epcms5p5>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260309055557epcms5p13a5c1e8299d59d05f5b9c79e2d1233c9@epcms5p1>
Date: Mon, 09 Mar 2026 11:25:57 +0530
X-CMS-MailID: 20260309055557epcms5p13a5c1e8299d59d05f5b9c79e2d1233c9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6
References: <20260309055328epcms5p56d16f6cb1e3a5295987c935f35be1d2e@epcms5p5>
	<aa4Lo30Nq_t7qDqK@shell.armlinux.org.uk>
	<20260305070527.719073-1-maninder1.s@samsung.com>
	<CGME20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6@epcms5p1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_225609_010711_CCB646F3 
X-CRM114-Status: GOOD (  12.20  )
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

> So It has to be same way for all archs, as mentioned in Help of THREAD_IN=
FO_IN_TASK
>=20
> config THREAD_INFO_IN_TASK
> =C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20bool=0D=0A>=20=C2=A0=20=C2=A0=20=C2=
=A0=20=C2=A0=20help=0D=0A>=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20S=
elect=20this=20to=20move=20thread_info=20off=20the=20stack=20into=20task_st=
ruct.=C2=A0=20To=0D=0A>=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20make=
=20this=20work,=20an=20arch=20will=20need=20to=20remove=20all=20thread_info=
=20fields=0D=0A>=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20except=20fl=
ags=20and=20fix=20any=20runtime=20bugs.=0D=0A>=20=0D=0A>=20=C2=A0=20=C2=A0=
=20=C2=A0=20=C2=A0=20=C2=A0=20One=20subtle=20change=20that=20will=20be=20ne=
eded=20is=20to=20use=20try_get_task_stack()=0D=0A>=20=C2=A0=20=C2=A0=20=C2=
=A0=20=C2=A0=20=C2=A0=20and=20put_task_stack()=20in=20save_thread_stack_tsk=
()=20and=20save_thread_stack_tsk().=0D=0A>=20=0D=0A>=20alongwith=20save_thr=
ead_stack_tsk=20and=20save_thread_stack_tsk,=20same=20thing=20shall=20be=20=
done=20for=20show_stack=20also.=0D=0A=0D=0ATypo=20error:=0D=0A=0D=0Aconfig=
=20THREAD_INFO_IN_TASK=0D=0A=20=20=20=20=20=20=20=20bool=0D=0A=20=20=20=20=
=20=20=20=20help=0D=0A=20=20=20=20=20=20=20=20=20=20Select=20this=20to=20mo=
ve=20thread_info=20off=20the=20stack=20into=20task_struct.=20=20To=0D=0A=20=
=20=20=20=20=20=20=20=20=20make=20this=20work,=20an=20arch=20will=20need=20=
to=20remove=20all=20thread_info=20fields=0D=0A=20=20=20=20=20=20=20=20=20=
=20except=20flags=20and=20fix=20any=20runtime=20bugs.=0D=0A=0D=0A=20=20=20=
=20=20=20=20=20=20=20One=20subtle=20change=20that=20will=20be=20needed=20is=
=20to=20use=20try_get_task_stack()=0D=0A=20=20=20=20=20=20=20=20=20=20and=
=20put_task_stack()=20in=20save_thread_stack_tsk()=20and=20get_wchan().=0D=
=0A=0D=0Aalongwith=20save_thread_stack_tsk()=20and=20get_wchan(),=20same=20=
thing=20shall=20be=20done=20for=20show_stack()=20also.

