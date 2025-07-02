Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FFEC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 02:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77p7M9umS3J+/3ObTGRJCqc6auPs2iEQ+ZeZ7lurq9c=; b=nQc8K/kuxRZE3vbU1m5qfvuSDk
	qm6ENS/stE3Qby9J/HiS//bo965l0fEfo0QR4tAmoCwffIQNd8ExP2pCutjOxD0qt7d4TdCCXyryg
	YE0d9M17Yq6R57bIecajTQtYzCmBZ5bHDc/0Iwz4ijZP6xtcZww7+05GBgSxOkNtOwpPLRrxK1/Gs
	e7IXqAB5jpJlfajd4stjCtWSGfGxVYlIjVW+OqasxfyZ9rq7oBGr5LlJJyR+18ApxLzVvUJ3IISyZ
	DHa1g7IkzofSviXw9WRNCyTR8CjNJ+7vDGqSYczUx7BEN+IcAXixzTFJCaeTRHkr1lB+uRxYeAt4+
	hJxr+H/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWnPE-000000074SY-2DAM;
	Wed, 02 Jul 2025 02:41:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWnKh-000000073lh-37EJ;
	Wed, 02 Jul 2025 02:36:25 +0000
X-UUID: 5536c19a56ed11f09eb0dd999d3936bf-20250701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=77p7M9umS3J+/3ObTGRJCqc6auPs2iEQ+ZeZ7lurq9c=;
	b=gwMHFrA4RyL6iGzGsMMgfXydsbzmPEhnFZg6rNcNSClLlqL4xt6EPZtHmPmhwRRx3nnipx0hv5qDKcMPFWFmD7GFLUXX4faacqZSm5KzFQu4jG6osqEqW06AHFEZ+j+IP80jBLO4Sz/GeOCjGjXujaDAiC0pBUFG7fiOK7DE9i4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:1efc3a4c-8b18-4136-973f-649fe12cf60e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:f414da5f-2aa0-4c76-8faa-804d844c7164,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5536c19a56ed11f09eb0dd999d3936bf-20250701
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 792088127; Tue, 01 Jul 2025 19:36:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Jul 2025 10:36:15 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Wed, 2 Jul 2025 10:36:15 +0800
Message-ID: <fbfc47b461a890eb38552e94b0d07a8315ecdff3.camel@mediatek.com>
Subject: Re: [PATCH V4 1/1] sched/deadline: Fix dl_server runtime
 calculation formula
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Juri Lelli <juri.lelli@redhat.com>, John Stultz <jstultz@google.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Wed, 2 Jul 2025 10:36:15 +0800
In-Reply-To: <aGO9KyiJNAm7DLb0@jlelli-thinkpadt14gen4.remote.csb>
References: <20250627022837.3331827-1-kuyo.chang@mediatek.com>
	 <CANDhNCorm58L9CqHyNORgfk=++HkCttmyCkM23Pn8rXV7cF41Q@mail.gmail.com>
	 <aGO9KyiJNAm7DLb0@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_193623_788938_5DDBD246 
X-CRM114-Status: GOOD (  36.58  )
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

On Tue, 2025-07-01 at 11:49 +0100, Juri Lelli wrote:
Hi John/Juri,
>=20
> >=20
> > > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > > index ad45a8fea245..96a21f38fcc3 100644
> > > --- a/kernel/sched/deadline.c
> > > +++ b/kernel/sched/deadline.c
> > > @@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq
> > > *rq, struct task_struct *p)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (delta_exec < 0)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return;
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled=
_delta_exec(rq, &rq-
> > > >fair_server, delta_exec);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D delta_exe=
c;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!rq->fair_server.dl_server)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq-
> > > >fair_server, delta_exec);
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->fair_server.runtime -=
=3D scaled_delta_exec;
> >=20
> > As I mentioned earlier, I still don't see this conditional as
> > making a
> > lot of sense, as I don't believe there is time when this function
> > would be called and (!rq->fair_server.dl_server) would be true.
> > And even if there were, I'm not sure it makes sense to scale the
> > time
> > interval based on the fair_server.dl_server flag.
> >=20
> > From a separate discussion, you highlighted that it might be useful
> > once we have multiple dl_server types, which may want scaled
> > accounting, but I think in that case we should use an explicit flag
> > instead of the dl_server bit to denote if the accounting should be
> > scaled or not.
> >=20
> > So, since your patch is a fix for a pretty bad bug, I think it
> > should
> > be focused on fixing the issue in the simplest and clearest way for
> > the existing code, and not be too worried about integrating with
> > future changes that haven't landed.
> >=20
> > Then, as those future changes land, we can see how best to
> > generalize
> > the decision to scale or not scale the accounting on a dl_server.
> >=20
> > That said, the conditional is a bit of a moot point, since I don't
> > think we'll actually hit it, and I'm motivated to get the bug you
> > are
> > fixing resolved, so I wouldn't object if this went in as-is, but it
> > seems like it would be much cleaner to just drop that conditional
> > as
> > you did in the original version of this patch.
>=20
> I agree. It would be better to drop the conditional.
>=20

Thanks for your feedback and suggestion.
So the original version of this patch for fair_server is much better &
cleaner.
Updated to v5 as below link
https://lore.kernel.org/all/20250702021440.2594736-1-kuyo.chang@mediatek.co=
m/

> Thanks!
> Juri
>=20


