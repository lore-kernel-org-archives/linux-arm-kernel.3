Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175D6D46C15
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3NZmPgXSo6Jc5EghyW2Mrg4zQNPcdIvl9JXB2SFb8U=; b=JG5OA7dK9v1emHeu9NW6LUYNut
	PQfzL9yQmJD6VogxZp9klG/WVIdvO4V5liqnpaZJPUkBDa+/zSCvTusTuLxWRk1b1P/ftaa2LzgaV
	VO8TC0x5R83Kpxw81MyGqlg9mVtEPTc6tAKpJpzLwnEp6pgWgEnjHo/pSsVt7+sGm0M1UXqTMEW5E
	FdqNOZTOIpWcGzM8rZisde8W3pOL6KlRfgTfzxYEIeGvItQqBFRPXH1xTx/1RUHGGEAH6+a6D1zxm
	ggzHi9qhoGiR2z5fMf0rOkLj4v4hjn0/6LFaA0OKatIQszZCo1uwKNDPKeltJKk2833yDtOdZhCjJ
	Ia+l9KIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFtX-0000000GymG-1Xtz;
	Thu, 29 Jan 2026 00:28:23 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFtS-0000000Gykq-3Wp0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:28:22 +0000
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id DAB9C57021;
	Thu, 29 Jan 2026 00:28:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 8717320026;
	Thu, 29 Jan 2026 00:28:12 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:28:22 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 11/30] tracing: Add helpers to create trace remote
 events
Message-ID: <20260128192822.6e9bb5fe@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-12-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-12-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ptrpd6mybqqwprs4z7h1jq6r9idfoohp
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 8717320026
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18JGCoAQO5cD/cqcdAx5HTvwj2jM7MCu1Q=
X-HE-Tag: 1769646492-422144
X-HE-Meta: U2FsdGVkX19QOntaKOMDn4PQ1YaFQpLuUFoYTfEH1vRLLdd0Xcuma8LYWD9u6V87SO8G18Q8WhlTlkj+HhLCrKHrJOo0ow8t67KaTT//DaXkroLk1knqXAt+puYamKH7QFh3ip605O/N31oA5G/gO/GPqZE0lhoksjarXMlAV91kihpW6ymKpFxixkRKr13PEsdkt2HEyRTNk//7zzPebGhTsYTKBrtcLX8geuZssDoh7NwlHh4/Ts32/MSAcO08JGNNAusqsUAIzBdsQIiMQC/fBop35eSNEP4G4vzlQQCwUpPsLAQSwAz3LEBRknlJtdTlUxLjZCvBszdkG/Z3O0cYxEUM5duoFhPRiq2M58Ar1KwqR1tOHnWBT5hB9QCupBDtZrcxXTkRPY/l19s8/g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_162818_939621_7D603392 
X-CRM114-Status: UNSURE (   7.95  )
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

On Mon, 26 Jan 2026 10:44:00 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Declaring remote events can be cumbersome let's add a set of macros to
> simplify developers life. The declaration of a remote event is very
> similar to kernel's events:
> 
>  REMOTE_EVENT(name, id,
>      RE_STRUCT(
>         re_field(u64 foo)
>      ),
>      RE_PRINTK("foo=%llu", __entry->foo)
>  )
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

