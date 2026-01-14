Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FA8D29FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fATf/St2y2YgIn8oxgkSgNLL6dxB/Sz4b5lYp4lukmY=; b=fjPL4IQ391ifZYKODpeJ1c+DRW
	Z9m+EBDotTyWWxMerVpCdWKPnmAK2U4F1/KGAJIctp5WTAgl7qujy3QnsbnCvVS/HE6ej5dr6rClD
	Qz8joxdfqoFnV0rvXnX3PoMpKHyWGapggYwKnRx4TZaO1nzUKwapaixxa5exgwsC+qpmQ9tjK+Oc7
	AhGwWD9WXrKzkrbOKEWD6OTk5d10PO0WxVGsXoBcmfUf/yxuxmaTaFmc84NI7pOaj0Hq3U6kwWSog
	xdedJ9PmTO4zUMj15H/vNNvNAu3WdGahTWExcqpmARrhgX5413vaKisof/iqf+1pESh4W8YwsD/VD
	jyihvGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzTc-000000093PB-2VrS;
	Wed, 14 Jan 2026 11:55:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzTX-000000093Mi-2FNG;
	Wed, 14 Jan 2026 11:55:48 +0000
X-UUID: f0b55f22f13f11f09f706fa2197c6ceb-20260114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fATf/St2y2YgIn8oxgkSgNLL6dxB/Sz4b5lYp4lukmY=;
	b=nBvJ7pQBl+rUhepdxlTYUewLWBxyYTrV9q1X6WkU5lc0HTB/Yf051M0Bai0HX64yhPciP0GQPeJb9GcAzd/HY9d5sHlCcogZIm7BspCex6XkP/tL4NGA5bc+eTTArZSvStbcJKe3pGAcXc/u8LmbVviQV8o3fjFCDHE8+Jae9vc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:02ca79d4-1268-4268-9caa-ea2c9e8d69e9,IP:0,UR
	L:0,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:3
X-CID-META: VersionHash:5047765,CLOUDID:1a9281e8-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|836|888|898,TC:-5,Co
	ntent:4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f0b55f22f13f11f09f706fa2197c6ceb-20260114
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <dengjun.su@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1647405638; Wed, 14 Jan 2026 04:55:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 19:55:34 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 19:55:33 +0800
From: Dengjun Su <dengjun.su@mediatek.com>
To: <peterz@infradead.org>
CC: <angelogioacchino.delregno@collabora.com>, <bsegall@google.com>,
	<dengjun.su@mediatek.com>, <dietmar.eggemann@arm.com>,
	<haiqiang.gong@mediatek.com>, <juri.lelli@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<mgorman@suse.de>, <mike.zhang@mediatek.com>, <mingo@redhat.com>,
	<peijun.huang@mediatek.com>, <rostedt@goodmis.org>,
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>
Subject: Re: [PATCH] sched/rt: fix incorrect schedstats for rt thread
Date: Wed, 14 Jan 2026 19:55:31 +0800
Message-ID: <20260114115533.2959537-1-dengjun.su@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112163814.GP830755@noisy.programming.kicks-ass.net>
References: <20260112163814.GP830755@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_035547_639666_70B59210 
X-CRM114-Status: GOOD (  30.82  )
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

On Mon, 2026-01-12 at 17:38 +0100, Peter Zijlstra wrote:
> On Fri, Jan 09, 2026 at 03:24:47PM +0800, Dengjun Su wrote:
>
> > For __update_stats_wait_end(), task_on_rq_migrating(p) is needed to
> > distinguish between stage 2 and stage 4 because they involve
> > different
> > processing flows, but for __update_stats_wait_start(), it is not
> > necessary
> > to distinguish between stage 1 and stage 3.
> >
> > As for adding the condition wait_start > prev_wait_start, I think
> > it is
> > more like a mechanism to prevent statistical deviations caused by
> > time
> > inconsistencies.
>
> It looks like nonsense to me.. since you have a test-case, could you
> see
> what this does for you?
>
> Specifically:
>
>  - it ensures that when not in a migration, prev_wait_start must be 0
>
>  - it unconditionally subtracts; unsigned types are defined to wrap
>    nicely (2s complement) and it all should work just fine.
>
> ---
>
> diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
> index d1c9429a4ac5..144b23029327 100644
> --- a/kernel/sched/stats.c
> +++ b/kernel/sched/stats.c
> @@ -12,8 +12,10 @@ void __update_stats_wait_start(struct rq *rq,
> struct task_struct *p,
>  	wait_start = rq_clock(rq);
>  	prev_wait_start = schedstat_val(stats->wait_start);
>  
> -	if (p && likely(wait_start > prev_wait_start))
> +	if (p) {
> +		WARN_ON_ONCE(!task_on_rq_migrating(p) &&
> prev_wait_start);
>  		wait_start -= prev_wait_start;
> +	}
>  
>  	__schedstat_set(stats->wait_start, wait_start);
>  }

Hi Peter,

I have confirm in my current test case, adding this change or not
have no impact. I think this is reasonable, task_on_rq_migrating(p)
should be true in my test case.

Base on original patch that adds this, I think the logic of 
__update_stats_wait_start is:

  1. If migrating and the time is updated normally, it records the 
  waiting time on the previous queue.

  2. If time is abnormal, it updates wait_start to the current time. 
  For migrating, it will discards the previously counted waiting time 
  on the previous queue (perhaps this statistical value itself 
  is abnormal).

According to the current modification, if there is a time abnormal,
wait_start will not be updated to current time.

Partial fragments of the original patch are as follows.

---

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 9a5e60f..53ec4d4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -738,27 +738,41 @@ static void update_curr_fair(struct rq *rq)
 }
 
 static inline void
-update_stats_wait_start(struct cfs_rq *cfs_rq, struct sched_entity *se)
+update_stats_wait_start(struct cfs_rq *cfs_rq, struct sched_entity *se,
+			bool migrating)
 {
-	schedstat_set(se->statistics.wait_start, rq_clock(rq_of(cfs_rq)));
+	schedstat_set(se->statistics.wait_start,
+		migrating &&
+		likely(rq_clock(rq_of(cfs_rq)) > se->statistics.wait_start) ?
+		rq_clock(rq_of(cfs_rq)) - se->statistics.wait_start :
+		rq_clock(rq_of(cfs_rq)));
 }

