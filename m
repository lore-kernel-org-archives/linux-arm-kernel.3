Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C37C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 02:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDv7yqQhXCn/WwLVae9uHSPtlIKjf+0DhbUVabTmYD8=; b=sdNtg9pwCwb0QfOdVuUQzo9QTB
	dd2iedX5F9986/3R4mWnNlZsiNkUThs9QAMKT25+/AGIs0E9ga10RPm4tp9BrL3atE0pkOH3MUNwQ
	bCn0ctvZEHUTvqndsKuYtJIKe3ZCULzuRNwNCPhV6LN5BIamw9N9If0QJY7xtLx7cfrIGx6SIU5L8
	xr+iDSFRIc47g2P4JgxZy/+mL4l3uE/LM0OHSMBsuq42Vor2GZ2SS24F/zlQ0rWLXEqSazK7Yq/HG
	ovuVtL5PmMTV/OqBEPTK+sLbqj31MnpbIfPt7NB+uhlrENecYxoGEUMX7OYNq9vR3f+x5BvfBdRIw
	CopVNP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSoR1-0000000H0X3-3kZH;
	Sat, 21 Jun 2025 02:58:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSoO2-0000000H0DO-3d8D;
	Sat, 21 Jun 2025 02:55:24 +0000
X-UUID: 2b00a2924e4b11f09f706fa2197c6ceb-20250620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=CDv7yqQhXCn/WwLVae9uHSPtlIKjf+0DhbUVabTmYD8=;
	b=mp05lNgv4aa9B/4S8oHLdmasi5oh1mHVJB0O9/6/s+Olbf2z0tTTT5j5rqLpEvLmPSGET7Gj+Siw5oHt5H7XHt6RIicZ+K0thEXrEplxNl8YvAOymsu3IYWAA3N5Nu0W7UqZttWZnbyiOlq4U/58CCO1zOjKVVjlhk/hgNztdUk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:1856e71d-6754-41a2-af4f-6aa5637cdcd9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:c5ddb128-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2b00a2924e4b11f09f706fa2197c6ceb-20250620
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 502462539; Fri, 20 Jun 2025 19:55:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 21 Jun 2025 10:55:15 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Sat, 21 Jun 2025 10:55:15 +0800
Message-ID: <a1103727ffaaf5f4d1b077bc09a3cc5168c5708d.camel@mediatek.com>
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
Date: Sat, 21 Jun 2025 10:55:16 +0800
In-Reply-To: <aFV8qeH__bw0chWM@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
	 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
	 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
	 <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
	 <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>
	 <aFV8qeH__bw0chWM@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_195522_913161_EA7AE827 
X-CRM114-Status: GOOD (  22.15  )
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

On Fri, 2025-06-20 at 17:22 +0200, Juri Lelli wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> On 20/06/25 11:00, Kuyo Chang wrote:
>=20
> ...
>=20
> >=20
>=20
> Thanks for the additional explanation.
>=20
> The way I understand it now is the following (of course please
> correct
> me if I am still not getting it :)
>=20
> - a dl_server is actively servicing NORMAL tasks, but suffers lot of
> IRQ
> =C2=A0 load and cannot make much progress
> - it does anyway make progress, but it reaches
> update_curr_dl_se@throttle
> =C2=A0 only when its current deadline is past rq_clock
> - dl_runtime_exceeded() branch is entered, but start_dl_timer() fails
> as
> =C2=A0 the computed act is still in the past
> - enqueue_dl_entity(REPLENISH) call replenish_dl_entity() which tries
> to
> =C2=A0 add runtime and advance the deadline, but time moved on so far tha=
t
> =C2=A0 deadline is still behind rq_clock() and so "DL replenish ..." is
> =C2=A0 printed
> - replenish_dl_new_period() updates runtime and deadline from current
> =C2=A0 clock and the dl-server is put back to run (so it continues to run
> =C2=A0 over/starve FIFO tasks)
>=20

Yes, "DL replenish ..." is the critical clue for identifying the root
cause of this issue.

> It looks like your proposed fix might work in this particular corner
> case, but I am not 100% comfortable with not trying to replenish
> properly (catch up with runtime) at all. I wonder if we might then
> start
> missing some other corner case. Maybe we could try to catch this
> particular corner case before even attempting to start the dl_timer,
> since we know it will fail, and do something at that point?
>=20

You can consider the patch more as an error-proofing mechanism, and so
far, it has been working well on our platform.
However, it might be better to catch this particular corner case in
advance to prevent the issue.
> Thanks,
> Juri
>=20


