Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB177C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 22:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFntdbcIb3EMN/OdELGR8t9jWDRb5O8yGtjFoBsDQBQ=; b=ULruzlt9Z9EjeyQdHrchrizClP
	RiDlqzIjkTokTcRKevvekgAAzBbF6eZs3NtU1CvsduJKlLHlVdESWM2N40WyqycnFVsHLT90UINts
	t2qDndp0FjYhcvU0WWq8GZDHScTOUq0ECuDv+JE0iYrDTO7G14nnzxKtYs84GBTg3/qM0P1tyHWrw
	qWsuJfUR0CD2A08I2vMEi9EVgE2sIRaiMA6Wi1c0QhLzpWf1J15CpeGz6oeL91hJ+NBfPkAGKo4Sw
	DsTJn6hLLI2OT/ir2tS6LKxJS4NboVZl3PQQnloCNe3wrNOM3dMOS0R/EqPvRx3J3gewQnYQU1Cg0
	sZTBNxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtYVg-0000000CyAR-3dbY;
	Mon, 10 Aug 2026 22:30:20 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtYVc-0000000Cy9n-0aue
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 22:30:18 +0000
Received: from omf04.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id E6FE340112;
	Mon, 10 Aug 2026 22:30:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 589DF20027;
	Mon, 10 Aug 2026 22:30:07 +0000 (UTC)
Date: Mon, 10 Aug 2026 18:30:17 -0400
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
Message-ID: <20260810183017.32db8b80@gandalf.local.home>
In-Reply-To: <20260804112317.1937387-2-fuad.tabba@linux.dev>
References: <20260804112317.1937387-1-fuad.tabba@linux.dev>
	<20260804112317.1937387-2-fuad.tabba@linux.dev>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: xtakhy7qecsge63wfcdxaimch8gwjbnx
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 589DF20027
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19liynQwYzW2cdd/ru5E/BnLybWK79UrC0=
X-HE-Tag: 1786401007-540265
X-HE-Meta: U2FsdGVkX19l/bEg6WyVs62MYOai422ZzDxhronGQpZKSZ4s32iH4P1VGDA53+tbK+BXLKUYFsHv9yDFVr+GrYI2NEUMPXj7HpMSDIQaYc9Nj1Bctwp/Pkrf3ctMcaxVNwTrSGdYSeNYZebmMWL5W/FsZmgRe2nI6yH1kGp7W7hDfHVMN3YMrGVgDrxQcimnv/BgQhppR6tttie8NfRdTPliP0DjxctbAOqHn0KgbbWI8kcTvhonPhC6ogthYw86+2FBdA2vsizcy1JrQIyVAydisG7j19nqTbfB+8Ava2qZG77H02CYKP+uX6GvyBal8cxaWhLuiM5Q8MQxna5x8bs5L70pNOSC5lKESCizsfvyPn9i9o2vs6GbFNgWRZu1r6pNcDt/u6CLtKPN95bmq6hvw+NM6L54
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_153016_250247_C939DACE 
X-CRM114-Status: GOOD (  17.11  )
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

Is there a config that already fails the build without this change? Or is
it that new code will fail without it?

If it is the former, please drop the fixes tag, as nothing is currently
broken. If it is the latter, then sure, keep it, but you should mention
what config options break with it.

-- Steve


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


