Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC016C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 02:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyDp82KCRlSHuCEPLpsxX1AlbNKLH6w0nwFm++2Pqzg=; b=zSKpSI1CLpqij1fz3584I8ephI
	aqoD0QWsbHb5PIdtlkznRr+/uArdb3PwJ9mPtxL39N68dQA2/2tbKyv+Q1dOI6RuPNjLtYDoD4N/l
	H1JMMmLfEgE2tB+XIT2RzdDysr1jh9Uv1lknWApbM5r0OaCKhbSxfkDBjBgD+dSngkgM+tQxXBIQz
	DMVemyJhTp/mssPtMdgLQw6M2LPrmecWp8VJf7hiw0HhY2p12rJyitI+DIRJy6odhU5sdvGlCNwLy
	dO+GbF+OJ5/XQYkGVWuTsSFIBuNP+t2v271XXZCfR87Btcztv1wC4rhPKQ6yF9jTDi+h2znazHww6
	ntUtu+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcJD-0000000ARqb-2J2B;
	Thu, 26 Jun 2025 02:25:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcGv-0000000ARiU-1ic5;
	Thu, 26 Jun 2025 02:23:30 +0000
X-UUID: 878d167a523411f09eb0dd999d3936bf-20250625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ZyDp82KCRlSHuCEPLpsxX1AlbNKLH6w0nwFm++2Pqzg=;
	b=ldvoke6y4aLhExvCAcLJZTVNh5E9UVdOKUhdxXdz2QGvZvXDfl2nh0klGLHObobnCjChtzGknDw0vmMWSnpp3Re2kdfnJYHAO3yxtVvc1GFqsvlAdCgSYLJ8Ni05Bv/c/KwYCoHBcWuwC9O9HwQ3/b7fzFHdD84LD3wwCjlnQ+U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:021440de-e106-4653-9068-9ed25d863c77,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:beee3582-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 878d167a523411f09eb0dd999d3936bf-20250625
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 57364837; Wed, 25 Jun 2025 19:23:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 26 Jun 2025 10:23:18 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Thu, 26 Jun 2025 10:23:18 +0800
Message-ID: <78d351cf981255e48cdf7f5da79ba1eb54dcb42e.camel@mediatek.com>
Subject: Re: [SPAM]Re: [PATCH 1/1] sched/core: Fix migrate_swap() vs. hotplug
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Thu, 26 Jun 2025 10:23:18 +0800
In-Reply-To: <20250606082834.GM30486@noisy.programming.kicks-ass.net>
References: <20250602072242.1839605-1-kuyo.chang@mediatek.com>
	 <20250605100009.GO39944@noisy.programming.kicks-ass.net>
	 <8e1018116ad7c5c325eced2cb17b65c73ca2ceca.camel@mediatek.com>
	 <20250606082834.GM30486@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_192329_456754_BB14A21E 
X-CRM114-Status: GOOD (  16.71  )
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

On Fri, 2025-06-06 at 10:28 +0200, Peter Zijlstra wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> On Fri, Jun 06, 2025 at 11:46:57AM +0800, Kuyo Chang wrote:
>=20
> > Thank you for your patch.
> > I believe this patch also effectively addresses this race
> > condition.
> > I will queue it in our test pool for testing.
>=20
> Thank you; I shall await the results!
>=20
>=20
Gentle ping if forgotten.

It works well during both regular and hotplug tests(more than two
week).

May I know if this patch can be merged into the mainline?

Thanks!

> > > @@ -101,12 +98,12 @@ static bool cpu_stop_queue_work(unsigned int
> > > cpu, struct cpu_stop_work *work)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw_spin_lock_irqsave(&sto=
pper->lock, flags);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled =3D stopper->enabl=
ed;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (enabled)
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __cpu_stop_queue_work(stopper, work, &wakeq);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __cpu_stop_queue_work(stopper, work);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (work->done)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cpu_stop_signal_done(work->done);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw_spin_unlock_irqrestore=
(&stopper->lock, flags);
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wake_up_q(&wakeq);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wake_up_process(stopper->thread=
);
> >=20
> > BTW, should we add enabled check here?
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (enabled)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 wake_up_process(stopper->thread);
>=20
> Ah yes. Spuriously waking the stopper thread is harmless, but
> wasteful.
>=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 preempt_enable();
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return enabled;


