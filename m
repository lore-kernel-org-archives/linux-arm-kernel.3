Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1B2CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 09:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dn35BcCwD1/5zCJNN5LI0dm9d8yRjnvtGBjcGlCtn4Q=; b=ioNIBk7iQ6c3QAKuVyOmQWQwav
	U0QitFu8/F7LY6BifxqQd8gvzQIbBIR1AzgKiQ0SGjgKPA3bP8bUD8L0ZxWgdTb8ojQTDlv8d1pem
	rmI5RVtrkEVXE55/SO61Rjg4xopjlM9pk2WlcGTSGk/Opxxr6JOSj7ErrTE7Tp6uPjRU6CTlzrPaT
	JGvUqgOR2A/1j1AbhYR8VB/pIhInEj16hWcztBUyW+TuUIs8iOWfbfU2TRyYe3DHM924kVJdCTNp8
	rnMDEalO+l0LdaXIts3CyDJzdoTcpMectrx7valIsrZrpASA6AmWKHma96S38FXD4YZhOcanolVY4
	RyJCzTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gXZ-00000007FS6-0KxJ;
	Fri, 17 Oct 2025 09:14:25 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gXW-00000007FRH-2TA9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 09:14:23 +0000
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 9ADC313B655;
	Fri, 17 Oct 2025 09:14:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 569996000E;
	Fri, 17 Oct 2025 09:14:16 +0000 (UTC)
Date: Fri, 17 Oct 2025 05:14:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 14/28] tracing: Add a trace remote module for testing
Message-ID: <20251017051414.7a6e10b5@batman.local.home>
In-Reply-To: <aPIAC0WEVg1pVr0H@google.com>
References: <20251003133825.2068970-1-vdonnefort@google.com>
	<20251003133825.2068970-15-vdonnefort@google.com>
	<20251016170645.15416c8a@gandalf.local.home>
	<20251016171155.0d871fc3@gandalf.local.home>
	<aPIAC0WEVg1pVr0H@google.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 7hdhsjnkap11w1smo8kwhj531mpabhxq
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 569996000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19h6oOCw3PyeGtOXOG42FQa1CMRVS20sbo=
X-HE-Tag: 1760692456-794409
X-HE-Meta: U2FsdGVkX1++vc5wBG8SikSMLzHf4VoFfGg/rJahcryGkvvI9ElFZtxshtAU59/M6z3zeCiupurKvfqBqVpSi9QON0MvxuRjp4x7WAAW/t6bCxIWs7+vT043I5yRJPCh/hVBPfsZaR2hD8NBu1/dJv0+xVmELEl3z9yzwFe2Hf/UCce5cJSFpZIxGfZUzQ36jn6dIZdzH10+D56ZyCGdVBRte7xZK+d/L8Sk1ajc7miz5RzyeNYY8JHRttu3FzjX0F4hJ0sgRTUQ15iYylJNxbSUWpj4SDuFjtdTUDOuS82yx15qiOe9W4jPa+HAyqcIxqrGX1YXMa8nvL28UOsX4e3ItypVwivk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_021422_683190_6A7E7F42 
X-CRM114-Status: UNSURE (   9.05  )
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

On Fri, 17 Oct 2025 09:36:27 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> And of course, I forgot to check CONFIG_REMOTE_TEST=M ...

It also needs to export symbols.

> 
> The following snippet should do.
> 
> Do you want a v8 now (and with your previous comment) or shall I wait a bit more?

Wait a little more. I'm currently taking a long weekend and will likely
play with it a bit more next week.

-- Steve

