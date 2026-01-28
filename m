Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48804D46BFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlzURb0r5uTsnqTUtXXqNHLdxSr12WZBgXqh7lEvIs0=; b=u1tFo8gTbgGV/5PRngTGbn9Bfc
	BoAS1WJD1Mo+mxY6jZ1e3JIoedYPiTU37shK9jI/fYrYJ8NNcG/M8hM/dgPmbdoFTYHTV67F1G9dM
	SrU5Fo9nqm65kr+C3xIeGJVpkildveqZBP+M++vjMZZ0Z5Ioz0N/+JtLzNcT2SWrH2VKogGHbJ9i6
	eSESMy9j0rgdol6Qf0pYDD8DrUlCpTD10xRRhMFuqonPFCFpTBJqDygWIMqEuFUJperv78fZu+m9d
	SLuba2LRaVvG83c02Ph70o6mgSsTNPiu8LCpcku+z0q5qQ9T61D13I3oMedXZmBP7MqVTWhI6AvV6
	hOVZEGkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCWa-0000000Go6B-092d;
	Wed, 28 Jan 2026 20:52:28 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCWV-0000000Go4y-3MpW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:52:26 +0000
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 2220E8C3A2;
	Wed, 28 Jan 2026 20:52:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id A3F2D2002A;
	Wed, 28 Jan 2026 20:52:16 +0000 (UTC)
Date: Wed, 28 Jan 2026 15:52:25 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 05/30] tracing: Introduce trace remotes
Message-ID: <20260128155225.31da0ec6@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-6-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-6-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: f31kg7drewjoy9957a1gqw6gjtfftkok
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: A3F2D2002A
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/vhzK6M22bxGe4NiqcTpWVVnRKoNj9/58=
X-HE-Tag: 1769633536-445104
X-HE-Meta: U2FsdGVkX1/weuzLfX+KUZ2JXl2DZeaNPbJCLkX8KHV73l4PAxpDd89OdEi0bZ16ZfjGJZe2FVxPr9cpEA5fZRSKSeGgJj2k/Si3EWOTHpBAHLHOEeeFWnFsRYJzwIqLpWsv/mz/yNv7gs9jE92Yc7a+wzd3fHkCIWo2Dl2qs5TcPpATF31YuB14nZaJWD5DcqxK3XXWcM1r+pmOH+podcMJAcx47U+Ob3BKvEPhJ3Ksjux7tgHmVDNa8qKx1P3OEmwVJ9HxLh7tGJRb3bUdeH3OOnY9sNpFPqnaTzDWjch2hMJQMFwWjnANppvSf52THV6aaHD+CcGJORorOZHfPcYeqMI0mb2O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_125225_051114_FB9AC2FB 
X-CRM114-Status: UNSURE (   7.98  )
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

On Mon, 26 Jan 2026 10:43:54 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> +	if (!trace_create_file("tracing_on", TRACEFS_MODE_WRITE, remote_d, remote,
> +			       &tracing_on_fops) ||
> +	    !trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
> +			       &buffer_size_kb_fops) ||
> +	    !trace_create_file("trace_pipe", TRACEFS_MODE_READ, remote_d, remote,
> +			       &trace_pipe_fops))
> +		goto err;
> +

Oh, and don't do this in an if statement. Make them each individually as:

	ret = trace_create_file(...);
	if (!ret)
		goto err;

Linus hates complex if statements and I can see him having a conniption if
he were to see this.

-- Steve

