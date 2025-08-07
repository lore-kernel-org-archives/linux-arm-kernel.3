Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3659C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDPf6gw3HXzny6ECXcfcEcO/+p36JpddaMwOtqXSszA=; b=owSB3xtO9Sn6QfQ7A59jE+El32
	FozXZKxx9G/1sU3JUq6LU6/tK1ZpN2xz5qaSyqWDVdqhGrHLEBL2wg97pf4xP6Vb7TQlJBAdeID0k
	iu1Sxizlcn3lnAl/DmqTcYMJu+Y9N2v2xk7eyfWGNf0VyKyYz9OJgp4EXLSfIHsOu4C0O2nGj2AmC
	R0msdQzp0gS4E49KX0jLlNvpSWfJLV+Cx9F7YjlnWlDoj5osYe8p7g35lr8X/tomlso1NSYYsjfRe
	Z+QfVK4jmXlrMnVNa5FuCYovfPythA/E/lYUlJ2wmJz+cjMnNfSCka6fzaA4ZHbNKOLENdqJhplvu
	l8NIcFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvT2-0000000HWQh-2A2Y;
	Thu, 07 Aug 2025 07:55:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvQQ-0000000HVzZ-1HIS;
	Thu, 07 Aug 2025 07:52:35 +0000
X-UUID: 7604e36a736311f09eb0dd999d3936bf-20250807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=lDPf6gw3HXzny6ECXcfcEcO/+p36JpddaMwOtqXSszA=;
	b=ddpZ5xXinw6yjqAAJBZkOiaPdkxiNGneBOJ5xzf08Odw6xbPk+y68wXnxAvDxQGs2HkizCq+Y81CYANcNUO3P9oSMnnF7QA2Ihcm2ayAcIHqsK/KpOre3UkiIFYz9hWCkvkfcRjxvTX9/dRsPq1XmGDLOq+MpeW7a/fNGJii48c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:65e44c44-2769-4b8a-b7cb-ffbee277d53c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:c0a529ce-1ac4-40cd-97d9-e8f32bab97d5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7604e36a736311f09eb0dd999d3936bf-20250807
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1656311445; Thu, 07 Aug 2025 00:52:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 7 Aug 2025 15:52:23 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Thu, 7 Aug 2025 15:52:23 +0800
Message-ID: <9f91f77e5f39857aa84373fe1ae504de2a881533.camel@mediatek.com>
Subject: Re: [PATCH] sched/deadline: Add DL server activated message
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Juri Lelli <juri.lelli@redhat.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Thu, 7 Aug 2025 15:52:23 +0800
In-Reply-To: <aJRSmWCJI-GlApsR@jlelli-thinkpadt14gen4.remote.csb>
References: <20250805155347.1693676-1-kuyo.chang@mediatek.com>
	 <aJRSmWCJI-GlApsR@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_005234_354594_BEA9873C 
X-CRM114-Status: GOOD (  24.90  )
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

On Thu, 2025-08-07 at 08:15 +0100, Juri Lelli wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> Hi,
>=20
> On 05/08/25 23:53, Kuyo Chang wrote:
> > From: kuyo chang <kuyo.chang@mediatek.com>
> >=20
> > The DL server is introduced as a replacement for realtime
> > throttling.
> > When RT throttling is activated, a message
> > "sched: RT throttling activated" is shown. However, it is currently
> > difficult for users to know when the DL server is activated.
> >=20
> > This patch adds a similar message to indicate when the DL server
> > is activated, which helps users debug RT/CFS contention issues.
> >=20
> > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > ---
> > =C2=A0kernel/sched/deadline.c | 3 +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index e2d51f4306b3..8e0de6cdb980 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -2042,6 +2042,9 @@ enqueue_dl_entity(struct sched_dl_entity
> > *dl_se, int flags)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __enqueue_dl_entity(dl_se);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (dl_server(dl_se))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 printk_deferred_once("sched: dl_server activated\n");
> > =C2=A0}
>=20
> Not sure if we want/need this, but, if we do, I believe
> fair_server_pick_task() might be a better place to put it, as it's
> really when the dl-server is called to do its job.
>=20

Thanks for your suggestion, maybe the minor patch as below

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index e2d51f4306b3..82d1091e56f5 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2395,6 +2395,7 @@ static struct task_struct *__pick_task_dl(struct
rq *rq)
 			goto again;
 		}
 		rq->dl_server =3D dl_se;
+		printk_deferred_once("sched: dl_server activated\n");
 	} else {
 		p =3D dl_task_of(dl_se);
 	}
--=20

I believe the debug message could help to verify that the DL server is
actually working.
It will be a great help for users to debug RT/FAIR contention issues
when this clue message occurs.

> Thanks,
> Juri
>=20


