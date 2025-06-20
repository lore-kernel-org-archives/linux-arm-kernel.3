Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0D2C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 03:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yK0QfK4ZZxsvW9hBbrEOHPwZIvhCT7JXP6hfmrcRiuA=; b=V4emWgQhUBvt7BLu195Xt82Xbo
	X6wcpQb7n0mWtAboQVqyEr15aflNjN7ko+zWeW0WoPI6uU//07iFUpkmFih1mMmmRomkVNyePBuPd
	ArarvPi/fY0pkIxqZ0/OGYAsqtkWRygidYiR+94hpfibilAcdPcpiG4+ETqq3NO3NqbbPggJXhDyN
	i9Ytd8wnsCBHdAqQlCWHz8u1h0ZY75R/HbQYDgGdesknlwtC7J6X7wCcY6TqfkVXbMYYZnRstpAIS
	qj2cPMPLq04q4xCDqna0aYMDPV3Xtxwgwm3hPXRjYENuLNr0tiXm5W9keKWdfVe2VKesDQNw48g5v
	lPGeyeOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSS2I-0000000EdF9-23Fj;
	Fri, 20 Jun 2025 03:03:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSRzy-0000000Ed3y-2Opn;
	Fri, 20 Jun 2025 03:01:06 +0000
X-UUID: c93470704d8211f09f706fa2197c6ceb-20250619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=yK0QfK4ZZxsvW9hBbrEOHPwZIvhCT7JXP6hfmrcRiuA=;
	b=pi1JJyOnWxkyPEfTE5AYixZMXKSt8WyfyXAcX9lineZ2knnwS9U7whZmzzoSIwAX65vp2htCCLc+WoCugLimEHbs5xRjZ17tsfAxLtwcSl0o/osDblSy/OlDcUnMoaVxS6Epk34o5v9+WhU94/6soy9DdKgA7Qls4PkzMoBNUPo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:f7d29fc3-0f11-4838-96ed-385a108fe559,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:06b9a828-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c93470704d8211f09f706fa2197c6ceb-20250619
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 27328747; Thu, 19 Jun 2025 20:00:56 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 20 Jun 2025 11:00:53 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Fri, 20 Jun 2025 11:00:53 +0800
Message-ID: <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential
 starvation when expiry time passed
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Juri Lelli <juri.lelli@redhat.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, jstultz
	<jstultz@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 20 Jun 2025 11:00:53 +0800
In-Reply-To: <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
	 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
	 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
	 <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_200102_618675_D7A470C2 
X-CRM114-Status: GOOD (  27.29  )
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

On Thu, 2025-06-19 at 15:13 +0200, Juri Lelli wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> On 18/06/25 22:20, Kuyo Chang wrote:
>=20
> ...
>=20
> > When dl_defer_running =3D 1 and the running time has been exhausted,
> > it means that the dl_server should stop at this point.
> > However, if start_dl_timer() returns a failure, it indicates that
> > the
> > actual time spent consuming the running time was unexpectedly long.
> >=20
> > At this point, there are two options:
> > [as-is] 1. re-enqueuing the dl entity with ENQUEUE_REPLENISH will
> > clear
> > the throttled flag
> > and re-enqueue the dl entity to keep the fair_server running.
> > enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> > =3D> replenish_dl_entity
> > =C2=A0 =3D> replenish_dl_new_period(dl_se, rq);
> > =C2=A0 =3D> dl_se->dl_yielded =3D 0;
> > =C2=A0 =3D> dl_se->dl_throttled =3D 0;
> > =3D> __enqueue_dl_entity(dl_se);
> >=20
> > [to-be] 2. To avoid RT latency, the fair_server should remain
> > throttled
> > while replenishing the dl_se.
> > Once replenishing is complete, we can ensure that a timer is
> > successfully started.
> > When the timer is triggered, the throttled state will be cleared,
> > ensuring that RT tasks can execute during this interval.
> >=20
> > It is a policy decision for dealing with the case of failure in
> > start_dl_timer().
> > The second approach is better for real-time (RT) latency in my
> > opinion,
> > as RT tasks must be prioritized.
>=20
> OK, I think I see your points, but I am still not sure I fully
> understand the link with the issue you describe in the changelog -
> the
> relation with "DL replenish lagged too much", that is.
>=20
> Could you please expand on the details of the situation that is
> opening
> up for the issue your patch is addressing? Do you know why we hit the
> corner case that causes the warning in the first place?
>=20

"DL replenish lagged too much" means the fair_server took much longer
than expected to use up its running time,
so the deadline fell way behind the clock (which is also why
start_dl_timer() failed).=20
In this situation, just replenishing one dl_period isn=E2=80=99t enough to
catch up.
=20
A corner case is when there are too many IRQs or IPIs in the system.
In this case, runtime gets consumed very slowly, and the fair_server
keep running without being throttled.
Even the runtime is exhausted finally, the fair_server would be
restarted immediately.
In the end, IRQs, IPIs, and fair tasks can take over the whole system,
no chance for RT tasks to run.

> I would like to understand exactly what we are trying to fix before
> deciding how to fix it, sorry if I am being dense. :-)
>=20
> Thanks,
> Juri
>=20


