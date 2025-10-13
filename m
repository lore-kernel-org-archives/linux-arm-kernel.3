Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD677CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 18:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGrRo9gTBbpk9aISf1z9a9GPMtCKGbi1MdkO0Ti4TnY=; b=rksudQt5nIyk04feMcsVzkWqvF
	KGzIzAv+ykfaSlhyS3zaNIldiP+v6+M3gm+ikOqdOZm6MfQ3vBp3QJe2+PEP7WMBXKHls1wQeCwnp
	pjsCh3ASco18ya5q6ksdqQR+m4Y44VKeKGOwVpDSnOmi3/XsIFoETEEM9HDxBYdfByYHcG85c1/By
	2+tG7P9ZBCbIZ/Yu/H3THJZ/lBu6OcBv1QcSLlvrF/1gKp4+5lSZKZ6RsN4mxbbu8ArnNvaITs4oa
	zuMVh0pFVJHDNIjndb20atxwt4BekCcXrw1l+uyiQ1sN4zVHjmCkPmziEHqgbQYqZZprKJOdSSqcO
	9eYXbztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8N1n-0000000E7Zu-0A3I;
	Mon, 13 Oct 2025 18:12:11 +0000
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8N1k-0000000E7Z4-1taZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 18:12:09 +0000
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 63FA31A052D;
	Mon, 13 Oct 2025 18:12:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 885D860011;
	Mon, 13 Oct 2025 18:12:02 +0000 (UTC)
Date: Mon, 13 Oct 2025 14:12:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "CruzZhao" <cruzzhao@linux.alibaba.com>
Cc: "mingo" <mingo@redhat.com>, "peterz" <peterz@infradead.org>,
 "juri.lelli" <juri.lelli@redhat.com>, "vincent.guittot"
 <vincent.guittot@linaro.org>, "dietmar.eggemann"
 <dietmar.eggemann@arm.com>, "bsegall" <bsegall@google.com>, "mgorman"
 <mgorman@suse.de>, "vschneid" <vschneid@redhat.com>, "catalin.marinas"
 <catalin.marinas@arm.com>, "will" <will@kernel.org>, "linux-kernel"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [BUG] Kernel panic in update_cfs_rq_h_load() on aarch64
Message-ID: <20251013141206.0cf358a3@gandalf.local.home>
In-Reply-To: <1dbc8668-4607-45ae-a286-77def1037917.cruzzhao@linux.alibaba.com>
References: <1dbc8668-4607-45ae-a286-77def1037917.cruzzhao@linux.alibaba.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 885D860011
X-Stat-Signature: o8qbnjsogk4pfznskb7sdwi6eza4f7s3
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18a7obeNimm9thiVngEeXwfURZ9kY/r/2o=
X-HE-Tag: 1760379122-398151
X-HE-Meta: U2FsdGVkX1+b5IfbFdRBPPhBFpJF9rnTkKFgqRtXsuZKeXWrPK+qkjk8MIiV6cZZom1mu1Tx5qb79Z0D/5SyvBqmfcYY5Pvnt/5+/CsSIpRPhm3NMjZzXWXZarIZ9vZgcg5q+EZxLk2BAUDqW2ZcdSavvzHNMB2XSuYHbg6Cw6gd4OzNbKT3Hwh4aa734H7HLIVxPNIy26sVZuHfJQUjS6tEdGGLkV8JTP39ygCtnS5MbgXuL602jLVzIQW2JAUQjW1rmpz15Lvzbggye8/Afkg1yhvu3ftCaKq7hpckrGLwtTpY8B5oeYPWni+8jajylDzR3l3rOE8QfwzpaFj7jJ+H0wM6dbhy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_111208_575466_95EAE566 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

On Mon, 13 Oct 2025 11:37:59 +0800
"CruzZhao" <cruzzhao@linux.alibaba.com> wrote:

> Hi, all. We are encountering a kernel panic in our production environment running Linux kernel version 5.10.134, on aarch64 architecture (aarch64 architecture only).
> ### Summary:
> - **Kernel Version**: [5.10.134]

That's an ancient kernel. Why are you sending this to upstream?

Please test 6.17.

-- Steve

> - **Architecture**: [aarch64]
> - **Problem Type**: panic
> - **Reproducibility**: About 40 times per week
> This issue leads to system-wide unresponsiveness and requires a hard reboot. We have collected the panic logs and backtraces, which I will include below for your reference. We tried to analyze the vmcore but have not found out the root cause.
> ---

