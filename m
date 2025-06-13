Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2042C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GV5IiH1lX/tVnEyhZKXJm4snMe5XD+W9EpFTNssURzc=; b=P0N8xA4YjXkB7c39pkuQOu4tVi
	eIqLB2+Fu1Rh1C7UIbYfY2+V0wS4dzuS1V0yCK0kVCdAbfSXm2RqIdqB7M2N7C+IEkILhRz8KZf1Q
	rdTuVacdtxH6ynyrv4H4uINcMPN7j44HDuANzJDqbCwhjy+XVlYr2XELdesktBBIjFv8p2S4HBckX
	N3EnXtLLhR82AyMZ1Ogr3K21zUKs8VMqcMIzw954nBQjvpsd5oXez9x9uj/IHaQ10JfNjh05TML8j
	BZ1gq/Dzu7MWQnv9mUX46DiUGwgqzN31aSyaJAkP+MtOe/8WDv50NskFE79cJwwbm+reFUvPHXTmO
	Nwu6uSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzH3-0000000Fhii-0Qn4;
	Fri, 13 Jun 2025 07:56:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPz8m-0000000FfUK-1JOB;
	Fri, 13 Jun 2025 07:47:57 +0000
X-UUID: b46be22a482a11f09f706fa2197c6ceb-20250613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=GV5IiH1lX/tVnEyhZKXJm4snMe5XD+W9EpFTNssURzc=;
	b=PdyK+4mM1oc1I9BPeVs75+3anIPHYhq+C8lxZOMSwykkzH34K/5xQ2RWxUka6eFSioRlg6b5Xo2mZt1qjuaA08CA/EbST3ztjVKMRsmAi7hWuH7UFvOm7xUxEoypaY3j/nEfMxq4KjQG7fD60PTgwtgKSviydtA4STLBYW8fTsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:afb0436c-caaf-4ef7-a3ae-8bed88675263,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:c769a558-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b46be22a482a11f09f706fa2197c6ceb-20250613
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 347310490; Fri, 13 Jun 2025 00:47:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 13 Jun 2025 15:47:45 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Fri, 13 Jun 2025 15:47:45 +0800
Message-ID: <c32fcf451dad1cac40ad827e53ac6c027403b07e.camel@mediatek.com>
Subject: Re: [PATCH 1/1] sched/core: Fix migrate_swap() vs. hotplug
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
Date: Fri, 13 Jun 2025 15:47:47 +0800
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
X-CRM114-CacheID: sfid-20250613_004756_359617_B06BA3C8 
X-CRM114-Status: GOOD (  16.05  )
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
It works well during both regular and hotplug tests(one week).
I believe the patch is workable.
Please help to merge, thx.

>=20
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


