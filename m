Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B84EC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAUtxooEebNess9CEi1siJitKJAhCmF0fkozk7XaYAQ=; b=AtIDQH8PJ3xU7W2A7UQac1cn8J
	2osg8hSzlWxp8W0K9Zcc7vlTv3Kc4X0ENtEL1O+AcabAofybnyoFyySohPW41dYp/BMpguQDNgIoQ
	Q5OVdSRHkM0olRaSTOpDpEogkGbneHgkj+RdZsNq0J6n80Uz5yEq8VIVcMpLkkTO9rMYzf1Z4JRMl
	mIxsON+wYkt+lfFf5jRL2vfIvL+twghKEupVO9+1URa50q3cow8BAXw17bJBuBUUt1zuABUv9eQqX
	jq3twyiycIkmacfSF/2ur0HxWFeKUnT+KjKpjBDzK0o75RHaVGlvuxZx60CAxTtgs2yDVBHQu+p2p
	qZYCb16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsmv-00000007fPw-12aP;
	Mon, 20 Jul 2026 18:32:25 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsms-00000007fNz-0XUc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 18:32:24 +0000
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id AE9D91A0289;
	Mon, 20 Jul 2026 18:32:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 73CF12002A;
	Mon, 20 Jul 2026 18:32:12 +0000 (UTC)
Date: Mon, 20 Jul 2026 14:32:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
 mhiramat@kernel.org, alexandru.elisei@arm.com, vdonnefort@google.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, qperret@google.com, ardb@kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 tabba@google.com
Subject: Re: [PATCH v1 01/11] tracing: Include linux/types.h in
 trace_remote_event.h
Message-ID: <20260720143211.0bc5d6a4@robin>
In-Reply-To: <20260720161343.1367007-2-fuad.tabba@linux.dev>
References: <20260720161343.1367007-1-fuad.tabba@linux.dev>
	<20260720161343.1367007-2-fuad.tabba@linux.dev>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: a831g5wityo5unzsfqepbjsayoypenqi
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 73CF12002A
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18V9+EcvOTS50wfn1iUFdmuVa/ykzVCoIA=
X-HE-Tag: 1784572332-903957
X-HE-Meta: U2FsdGVkX1/nUie4EgfVs/N2MN8uYuXasi4IxdlvoavaGWe59c26La92i2jL7d8Ef0hWHk+Gs6YDAwZLoyVdqIXpVxEvu5g7sdhsQYQ128RX80hg4ZjuTEDC3f3aARD6PmMbm9HvR7IQQCVCMx9Xyk5NLs3upKYJSf98tJMMCixZuWNL6pm30wjpZM4XQxKnzFryYh0M2qH2uV8IcIQI1KHfCDaJtD14aaldy6iuuRezR3LRfKUNdAHfAtgH+dnCaYL3cSwR+0rrstNociZI03uZ1ghPYjjLtLJPJNNQ06xf3O1QLr1ywSywYVo0oHbaG7DSLu+AGcJsRqWedIOESDblNETM+yOk0hnRlEWWnVNZuxdBxyjmpTjSoCh0KcpE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_113222_249861_1F0DBDAD 
X-CRM114-Status: UNSURE (   9.44  )
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

On Mon, 20 Jul 2026 17:13:33 +0100
Fuad Tabba <fuad.tabba@linux.dev> wrote:

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

I don't know if this is correct or not, but here's my ack so others can
decide and take it through their trees.

Acked-by: Steven Rostedt <rostedt@goodmis.org.

-- Steve

