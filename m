Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A04CD232EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 07:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8qggB+ZqQxK1gpWWS6Ztd+cnpOCo+EBfWlyX/Zk/QU=; b=3YPAsjhTr/AmveFdJJxYvg0J7I
	Oy26FqNEMIhvALmPDpyGB9V2RFUXM9dtO94W4CAxq07VxM85gLPfTtK5+cVPm1yiOhqvHdR9Cp3nN
	1or34ChISuXqBC/GU2X1LOekwNvCz+czU9Fx+Y/iEcMlA2HlIAMIgC5697x6ago9cwp/e/FMwrtHG
	+h/ZANjnxbqBYEB7MetqJKUEcr526fjHkPdFZPYHL5oyhd7nb8zg+V7MqqbXkbO9ASk4mjuTOqc2G
	m4mmSugDb8g32VA01xr49dTKZQMheswujdYw0ieAZqF98J9tfkh0RH0fpMGT9nJ3MFQ6C2DxIfK3a
	7gvHoPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6ro-00000001i8Z-0RXL;
	Fri, 09 Jan 2026 07:25:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6rl-00000001i6j-3BxV;
	Fri, 09 Jan 2026 07:25:02 +0000
X-UUID: 4bc7381ced2c11f09f706fa2197c6ceb-20260109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=F8qggB+ZqQxK1gpWWS6Ztd+cnpOCo+EBfWlyX/Zk/QU=;
	b=YAMd5PRgKEqkVlkWbhinoK83VfI9euK8jb14MdoZxUq/thtKdbo9lr9ni7RwTWmSsU3hdNqPTJO8ehXK2jspOxawNbktaZCiALrHU/qhHw8vF7/9OSeYOCOP9Ah/GoEaNYCTCm5Fe2irTVpJxYgMKGgW9w0HFGYECGUWWxpIn0I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:6d1a39e1-4d1e-48c7-815c-f8479757e417,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:56f19779-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|836|888|898,TC:-5,Co
	ntent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4bc7381ced2c11f09f706fa2197c6ceb-20260109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <dengjun.su@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 878093480; Fri, 09 Jan 2026 00:24:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 15:24:52 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 15:24:51 +0800
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
Date: Fri, 9 Jan 2026 15:24:47 +0800
Message-ID: <20260109072451.2843331-1-dengjun.su@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108111632.GH272712@noisy.programming.kicks-ass.net>
References: <20260108111632.GH272712@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_232501_823402_BF767025 
X-CRM114-Status: GOOD (  26.00  )
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

On Thu, 2026-01-08 at 12:16 +0100, Peter Zijlstra wrote:
> On Thu, Jan 08, 2026 at 11:13:07AM +0800, Dengjun Su wrote:
> > For RT thread, only 'set_next_task_rt' will call
> > 'update_stats_wait_end_rt' to update schedstats information.
> > However, during the RT migration process,
> > 'update_stats_wait_start_rt' will be called twice, which
> > will cause the values of wait_max and wait_sum to be incorrect.
> 
> Right, that looses time. Also note that I think dl has the same
> issue.

Hi Peter,

Thanks for the feedback. Yes, sorry for miss dl class,
I will update it in V2.

> 
> > The specific output as follows:
> > $ cat /proc/6046/task/6046/sched | grep wait
> > wait_start                                   :             0.000000
> > wait_max                                     :        496717.080029
> > wait_sum                                     :       7921540.776553
> > 
> > Add 'update_stats_wait_end_rt' in 'update_stats_dequeue_rt' to
> > update schedstats information when dequeue_task.
> 
> This needs a few more words on why this is correct -- notably it took
> me
> a little time to find the 'task_on_rq_migrating()' case in
> __update_stats_wait_end() which makes this not actually 'end'.
> 
> But then the corresponding clause in __update_stats_wait_start()
> gives
> me a headache:
> 
>  'wait_start > prev_wait_start'
> 
> I mean, wtf. Should that not equally be using task_on_rq_migrating()
> ?
> 
> Can you please take a hard look at all that and fix up things
> all-round?
> 

A complete schedstats information update flow of migrate should be
__update_stats_wait_start() [enter queue A, stage 1] ->
__update_stats_wait_end()   [leave queue A, stage 2] ->
__update_stats_wait_start() [enter queue B, stage 3] ->
__update_stats_wait_end()   [start running on queue B, stage 4]

    Stage 1: prev_wait_start is 0, and in the end, wait_start records the
    time of entering the queue.
    Stage 2: task_on_rq_migrating(p) is true, and wait_start is updated to
    the waiting time on queue A.
    Stage 3: prev_wait_start is the waiting time on queue A, wait_start is
    the time of entering queue B, and wait_start is expected to be greater
    than prev_wait_start. Under this condition, wait_start is updated to
    (the moment of entering queue B) - (the waiting time on queue A).
    Stage 4: the final wait time = (time when starting to run on queue B)
    - (time of entering queue B) + (waiting time on queue A) = waiting
    time on queue B + waiting time on queue A.

The current problem is that stage 2 does not call __update_stats_wait_end
to update wait_start, which causes the final computed wait time = waiting
time on queue B + the moment of entering queue A, leading to incorrect
wait_max and wait_sum.

For __update_stats_wait_end(), task_on_rq_migrating(p) is needed to
distinguish between stage 2 and stage 4 because they involve different
processing flows, but for __update_stats_wait_start(), it is not necessary
to distinguish between stage 1 and stage 3.

As for adding the condition wait_start > prev_wait_start, I think it is
more like a mechanism to prevent statistical deviations caused by time
inconsistencies.

Thanks


