Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D92DC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlRQKNRf80EKD5H4fFxuznCQOO2T4YSG9TIr3YFeaIE=; b=gzfDbBVPK7Vd/O537lx9Vxaqid
	PZQF+ZKHroQbHkt//ncUTMop2tWMG+O/OWdiXCVX5WpIRu7K3bO8O1GaylIK2br1Iwjj40NbDFARa
	P08FByQb+FPwLCnduB/hJ4MZa63O33wUzXnurdCcmKm72znJjVQoE69BDEdK1/jeYfSouAwgnv9kY
	+zOlKrYiPgC9vWrtdYlZ+56BNZe7PH97w76pY9hiL0tWNR+nCYJ2hes/nuIVtiiSNh+vTw2qRMQhL
	hHUg4uX3KIc82XoMpLHOI9i0mcOjsreemz91xFMLtVNUgS2rYaPqGRdu9tARVwHqpgkaYn0bgiEme
	VgcnwxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrici-00000004Xxx-2qsX;
	Wed, 05 Aug 2026 20:54:00 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wricf-00000004XxS-3Jc7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 20:53:59 +0000
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id A84C81A059C;
	Wed,  5 Aug 2026 20:53:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id CC2332002C;
	Wed,  5 Aug 2026 20:53:46 +0000 (UTC)
Date: Wed, 5 Aug 2026 16:54:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
 mhiramat@kernel.org, alexandru.elisei@arm.com, vdonnefort@google.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, qperret@google.com, ardb@kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 tabba@google.com
Subject: Re: [PATCH v3 01/11] tracing: Include linux/types.h in
 trace_remote_event.h
Message-ID: <20260805165432.0118a513@gandalf.local.home>
In-Reply-To: <20260804112317.1937387-2-fuad.tabba@linux.dev>
References: <20260804112317.1937387-1-fuad.tabba@linux.dev>
	<20260804112317.1937387-2-fuad.tabba@linux.dev>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: CC2332002C
X-Stat-Signature: pxsw1pa851hmtm4bd3fsfd3rxys5wq8o
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Ii2lk289HP5RYh2cytm4riV8/kWfoNK4=
X-HE-Tag: 1785963226-84509
X-HE-Meta: U2FsdGVkX18LjkoLn70IBd+mdTzL3BBwKziwL1mftDUpVecf84v6aX7M5PCYnIXzb3JQz4/epiui+kwQlLFVoL2Azwhvfdb88Up8yzvb0bvWgRI4ScImgQFztoVKY9LKRRV1BQXpd18qgWqRbUPnsSMIKYZa9wrECuSSAGeq1u/Z1MZVzTUcXbc2Z/vztp7CwPRw8GqypKKKU4AaBflBm4JaLIOJud2J0TMLmFwQaRfvi3RYxypub6O4sBv6U2TcDfaH9/mucJ3j3C4zPxZEDrxcvYR+qiI1NHTLwJ6U+FiyQvhC7pRNUJq68ys8Elsrsj361ai54w3QngssXiaH4gWgeldMRHqjV2Nt/d6496G2vWH4XCmAGVtUjMjpfhg4FY+8ipgFHe0trTnE9E/aSncSmKfO2fw2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_135357_901831_56407658 
X-CRM114-Status: GOOD (  15.63  )
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

On Tue,  4 Aug 2026 12:23:07 +0100
Fuad Tabba <fuad.tabba@linux.dev> wrote:

> trace_remote_event.h uses bool without including linux/types.h, so a
> translation unit that includes it ahead of anything else that pulls
> types.h in fails to build, as with nvhe/trace.h at EL2.
> 
> Fixes: 072529158e60 ("tracing: Add events to trace remotes")
> Acked-by: Steven Rostedt <rostedt@goodmis.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  include/linux/trace_remote_event.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/trace_remote_event.h b/include/linux/trace_remote_event.h
> index c8ae1e1f5e721..e4cc2d4497bcf 100644
> --- a/include/linux/trace_remote_event.h
> +++ b/include/linux/trace_remote_event.h
> @@ -3,6 +3,8 @@
>  #ifndef _LINUX_TRACE_REMOTE_EVENTS_H
>  #define _LINUX_TRACE_REMOTE_EVENTS_H
>  
> +#include <linux/types.h>
> +
>  struct trace_remote;
>  struct trace_event_fields;
>  struct trace_seq;

My ack still stands, but I wonder if we should just not use the include and
instead s/bool/_Bool/ ?

-- Steve

