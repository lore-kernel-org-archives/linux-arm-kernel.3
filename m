Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB50CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XhG846dx3wUP7VIK3jHmWBz5V+euKd+Q9cGqdQ/lxY=; b=UBo3M7Pd5TfQPNfbRcxohpJQ5p
	t7J/9fUVoSgZfXNppotq8/wcCWdzSGWXcsr6oFSFh3KUj7qywi84PhAoe26q5KKN+Syj8LTd+eP2g
	/PPBZdgp0TbWel9XkzB5RJvYbDLAApgTRuiCoLgoucc4zvIErXEXE2+IBaSYK3g22xFoyVkLyQYzj
	XPZTZx6wCJMV5nInUggLSJMazUjIEbUDWb2hc5xSJzlru9wyh7PzC2BPHjIUFDZGtl4DCDAE8u/zi
	SZuCXLcVGb4j9ScQ/83qavv37Y5fFVI15mtCMBRdWGGBcwJjbwM2T0I0wu+dVr9pIGZiUG3uJGpk4
	0N5iTgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9VGM-00000005xtK-2Ev1;
	Thu, 16 Oct 2025 21:11:54 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9VGJ-00000005xsO-2KN2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 21:11:53 +0000
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 09BCB1A0421;
	Thu, 16 Oct 2025 21:11:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 9489E34;
	Thu, 16 Oct 2025 21:11:44 +0000 (UTC)
Date: Thu, 16 Oct 2025 17:11:55 -0400
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
Message-ID: <20251016171155.0d871fc3@gandalf.local.home>
In-Reply-To: <20251016170645.15416c8a@gandalf.local.home>
References: <20251003133825.2068970-1-vdonnefort@google.com>
	<20251003133825.2068970-15-vdonnefort@google.com>
	<20251016170645.15416c8a@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 33hbw6rr73jtdzwf8bckjrt5why11rej
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 9489E34
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+mzqTR6rqbkd1NzU33NlFjpBTX4YYBDpY=
X-HE-Tag: 1760649104-568230
X-HE-Meta: U2FsdGVkX18UOnRfo5/M586ViFyUv6tsn+gOTfw2M0Y9noR3McpUrJwpsabHTvpL2/5wzsDCaUL/d12GzAjhNNf2t3Mhh8WD1Kmh+O8qlcvBgcXVf/dnXrigVY66PAvWoi1nhL66TQ68n9IiyyDAd1Yy7C8R2HGrPEXZuNIGll4R/6JVAlCDDccqVf1UpNW9JDuwtJniNcqNR3SLoNhCyIPEGrDKQrN3u9E0qhCgI5ih58GR5+Hc4f3tG6AszSfxvRCkVDTjfUprjZDI6HBrwKxPjK/jMfpJxezYVYWqtgRGBWg4teEiBTVO+M+ApM8vuZHp8FfUOBjYmshmFZTZO3HF5KgmtxNNnnyv6IZZXWwe2EQmzloM3nL1370pPrbXF0lrENiGYgHtfF+Z96qFqQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_141151_674850_2D2DD991 
X-CRM114-Status: GOOD (  13.90  )
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

On Thu, 16 Oct 2025 17:06:45 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri,  3 Oct 2025 14:38:11 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> > index 918afcc1fcaf..52131d89993c 100644
> > --- a/kernel/trace/Kconfig
> > +++ b/kernel/trace/Kconfig
> > @@ -1244,4 +1244,12 @@ config TRACE_REMOTE
> >  config SIMPLE_RING_BUFFER
> >  	bool
> >  
> > +config TRACE_REMOTE_TEST
> > +	tristate "Test module for remote tracing"
> > +	select TRACE_REMOTE
> > +	select SIMPLE_RING_BUFFER
> > +	help
> > +	  This trace remote includes a ring-buffer writer implementation using
> > +	  "simple_ring_buffer". This is solely intending for testing.
> > +  
> 
> Nit, this should go up a few places so that it's with the other "test module" selections.

And when I tried to build it, I hit this:

  GEN     .vmlinux.objs
  MODPOST Module.symvers
ERROR: modpost: "simple_ring_buffer_reserve" [kernel/trace/remote_test.ko] undefined!
ERROR: modpost: "simple_ring_buffer_commit" [kernel/trace/remote_test.ko] undefined!
ERROR: modpost: "simple_ring_buffer_unload" [kernel/trace/remote_test.ko] undefined!
ERROR: modpost: "trace_remote_free_buffer" [kernel/trace/remote_test.ko] undefined!
ERROR: modpost: "trace_remote_alloc_buffer" [kernel/trace/remote_test.ko] undefined!
ERROR: modpost: "simple_ring_buffer_init" [kernel/trace/remote_test.ko] undefined!
ERROR: modpost: "trace_remote_register" [kernel/trace/remote_test.ko] undefined!
ERROR: modpost: "simple_ring_buffer_reset" [kernel/trace/remote_test.ko] undefined!
ERROR: modpost: "simple_ring_buffer_swap_reader_page" [kernel/trace/remote_test.ko] undefined!
ERROR: modpost: "simple_ring_buffer_enable_tracing" [kernel/trace/remote_test.ko] undefined!
WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)
make[3]: *** [/work/git/linux-trace.git/scripts/Makefile.modpost:147: Module.symvers] Error 1
make[2]: *** [/work/git/linux-trace.git/Makefile:1960: modpost] Error 2
make[1]: *** [/work/git/linux-trace.git/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/work/build/nobackup/debiantesting-x86-64'
make: *** [Makefile:248: __sub-make] Error 2


-- Steve

