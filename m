Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB89C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 03:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mo63V3QovSHkpNE8wUbgfm1mAKC72zCbSTyRHS1N38=; b=gR0kKEvt9p609VlWRg2yQ2UtZ1
	SfscZDolsUPdqY8/9AQVK1x4olyYVzgtOSxZzt/x4VOc5qpO3EXERPcD1LPhjAYGk0SksAwnGm5WJ
	dA3k66O9imVYTpJK/r/F3vIZU//b0HAxTlx7BH0TyazwV/OEX0hb9jwhpiHeBW+dvow4BSpsSXgKM
	ys6o2pepjap1jPf6ClHCfjgQK8PKXYWsbNrmnlO/RtCeRe13+pwTU388ZfmYcHrp+fOwSC+AeApz1
	i4MS8eUbY0a/2f03WmeWjXPRFBbF30LhEqFPiCJVKf1ysOajk+5C6wejbL0QG/TXQ0C7n60hnNxbD
	f6/WvTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRji8-00000008vbX-123r;
	Wed, 18 Jun 2025 03:43:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjfs-00000008vBP-0PFc;
	Wed, 18 Jun 2025 03:41:21 +0000
X-UUID: 15a328fe4bf611f09eb0dd999d3936bf-20250617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=0mo63V3QovSHkpNE8wUbgfm1mAKC72zCbSTyRHS1N38=;
	b=iC8+uMw+daTGob0NNqe25JWr1gmfaYe/do1VzhKVvzpFEnX+30gLRSI+4q42i8dQJDdU1a3WSGgQBJlB3rn0DrLoM9LY8/wBfhQnkVUfIrrjhDzYT0rmC2c11TBEOVdy/BGyuJVaZ6STDqLvk1kflG646eMUZ2ZCcjKvyJNGqzc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:91bf011f-1534-4e78-9e9c-76bedcc71d45,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:3599cd58-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 15a328fe4bf611f09eb0dd999d3936bf-20250617
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1836231241; Tue, 17 Jun 2025 20:41:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 18 Jun 2025 11:41:11 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Wed, 18 Jun 2025 11:41:11 +0800
Message-ID: <bbb9a1f3b796e8d7bd0010bf0f4862d67368516a.camel@mediatek.com>
Subject: Re: [PATCH v2 1/1] sched/deadline: Fix dl_server runtime
 calculation formula
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: John Stultz <jstultz@google.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 18 Jun 2025 11:41:11 +0800
In-Reply-To: <CANDhNCrUtLCU86hNk4qyfbqn9eXsmbzgzJCxYmXGRCko0r=VbQ@mail.gmail.com>
References: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
	 <CANDhNCrUtLCU86hNk4qyfbqn9eXsmbzgzJCxYmXGRCko0r=VbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_204120_140073_3F410767 
X-CRM114-Status: GOOD (  34.78  )
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

On Tue, 2025-06-17 at 14:02 -0700, John Stultz wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> On Tue, Jun 17, 2025 at 8:54=E2=80=AFAM Kuyo Chang <kuyo.chang@mediatek.c=
om>
> wrote:
> >=20
> > From: kuyo chang <kuyo.chang@mediatek.com>
> >=20
> > [Symptom]
> > The calculation formula for dl_server runtime is based on
> > Frequency/capacity scale-invariance.
> > This will cause excessive RT latency (expect absolute time).
> >=20
> > [Analysis]
> > Consider the following case under a Big.LITTLE architecture:
> >=20
> > Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> > scale-invariance defined as below:
> >=20
> > Frequency scale-invariance: 100
> > Capacity scale-invariance: 50
> > First by Frequency scale-invariance,
> > the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> > Then by capacity scale-invariance,
> > it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
> >=20
> > So it will scaled to 238,418 ns.
> >=20
> > [Solution]
> > The runtime for dl_server should be fixed time
> > asis RT bandwidth control.
> > Fix the runtime calculation formula for the dl_server.
>=20
> Thanks again for iterating on this patch! I've got a few minor nits
> below.
>=20
> > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > Acked-by: Juri Lelli <juri.lelli@redhat.com>
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> >=20
> > v1:
> > https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediatek=
.com/
> >=20
> > ---
> > =C2=A0kernel/sched/deadline.c | 8 ++++++--
> > =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245..f68a158d01e9 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -1504,7 +1504,9 @@ static void update_curr_dl_se(struct rq *rq,
> > struct sched_dl_entity *dl_se, s64
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dl_entity_is_special(dl_=
se))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_d=
elta_exec(rq, dl_se,
> > delta_exec);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D delta_exec;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dl_se->dl_server)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
> > delta_exec);
>=20
> Just a nit, but would
> =C2=A0=C2=A0=C2=A0 if (!dl_server(dl_se))
>=20
> be a little cleaner/consistent with other readers?
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dl_se->runtime -=3D scaled_d=
elta_exec;
> >=20
> > @@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq
> > *rq, struct task_struct *p)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (delta_exec < 0)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_d=
elta_exec(rq, &rq-
> > >fair_server, delta_exec);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D delta_exec;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!rq->fair_server.dl_server)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq-
> > >fair_server, delta_exec);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->fair_server.runtime -=3D=
 scaled_delta_exec;
>=20
Thanks for cleaner code suggestion, how about this?


diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index f68a158d01e9..3ccffdf4dec6 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1505,7 +1505,7 @@ static void update_curr_dl_se(struct rq *rq,
struct sched_dl_entity *dl_se, s64
 		return;
=20
 	scaled_delta_exec =3D delta_exec;
-	if (!dl_se->dl_server)
+	if (!dl_server(dl_se))
 		scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
delta_exec);
=20
 	dl_se->runtime -=3D scaled_delta_exec;
@@ -1614,12 +1614,13 @@ static void update_curr_dl_se(struct rq *rq,
struct sched_dl_entity *dl_se, s64
 void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
 {
 	s64 delta_exec, scaled_delta_exec;
+	struct sched_dl_entity *dl_se =3D &rq->fair_server;
=20
-	if (!rq->fair_server.dl_defer)
+	if (!dl_se->dl_defer)
 		return;
=20
 	/* no need to discount more */
-	if (rq->fair_server.runtime < 0)
+	if (dl_se->runtime < 0)
 		return;
=20
 	delta_exec =3D rq_clock_task(rq) - p->se.exec_start;
@@ -1627,14 +1628,14 @@ void dl_server_update_idle_time(struct rq *rq,
struct task_struct *p)
 		return;
=20
 	scaled_delta_exec =3D delta_exec;
-	if (!rq->fair_server.dl_server)
-		scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq-
>fair_server, delta_exec);
+	if (!dl_server(dl_se))
+		scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
delta_exec);
=20
-	rq->fair_server.runtime -=3D scaled_delta_exec;
+	dl_se->runtime -=3D scaled_delta_exec;
=20
-	if (rq->fair_server.runtime < 0) {
-		rq->fair_server.dl_defer_running =3D 0;
-		rq->fair_server.runtime =3D 0;
+	if (dl_se->runtime < 0) {
+		dl_se->dl_defer_running =3D 0;
+		dl_se->runtime =3D 0;
 	}
=20
 	p->se.exec_start =3D rq_clock_task(rq);

If it's ok, should I split it into two separate patches
1.Fix dl_server runtime calculation formula
2.cleaner code patch

or just submit it as a single patch?

> I'm a little confused on the conditional here. Is
> fair_server.dl_server ever not true (after the first call to
> dl_server_start())?
>=20
For now, it's true.

But based on our previous discussion,
use the dl_server flag to identify and handle a 'fixed time' type of
isolation.
This approach makes it easier to extend and allows multiple servers to
configure it as needed.

> Also, in the discussion on your first version, it seemed there might
> be a need for different servers to have different requirements, but
> it
> seemed like fair_server would always not want to be scaled.
>=20
> thanks
> -john


