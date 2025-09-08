Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91625CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohW095cble1VBjqBQ22zn5QBKsPigYlkoooE98YHK0I=; b=wZQOoXsx23IhT3H9Bd0XbzPaKZ
	RcG5YudsfT+Rqy6fOl6+KsbkpdLfzrr4Wo9g66bPK/5/mb15C72DY6OORMdjyi4q5NGcPshLQt5mK
	LwDHsNyl6MIix2ANc3q+T6o+EPrgZGakrnh+PvNwtn4LtmbdlawGzN4XsOwvxqJVEDGO6hyi3b0ow
	mh+nsKoY3++cXdyJ+rYyc1Q+mK1FtCz6DgVANjvTlBDaU0tQzpbj7LApzdMhBWB+k35cT93wZ9PV/
	YGIDUWcvEV9YqdOLBU/ooZ03IJTqyo34/eeVDeVenoZK392NXTE6Yc/Nb3exDcVU01kljFwV7zj4g
	MVRUFmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsEM-00000004sb1-1RrX;
	Tue, 09 Sep 2025 06:53:30 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlQD-00000002zVI-0svV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:37:18 +0000
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 7F90A1DDB91;
	Mon,  8 Sep 2025 23:37:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id F243A20024;
	Mon,  8 Sep 2025 23:37:10 +0000 (UTC)
Date: Mon, 8 Sep 2025 19:37:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/24] tracing: Add reset to trace remotes
Message-ID: <20250908193757.079aae76@gandalf.local.home>
In-Reply-To: <20250821081412.1008261-5-vdonnefort@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-5-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: wdbcg9cmz9hgzbiksnz8z5e99z9oj6b5
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: F243A20024
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18XbN7DKfTHTi5CaU0ETRtueyTq0Kn+udA=
X-HE-Tag: 1757374630-126015
X-HE-Meta: U2FsdGVkX1+EtvhnbdP2Gtp4noi9cwQOFuTgiBxTimh80Zt9R2I9RRFZOl6Ad9iETIg8Vo1wn0H3utT0IieAsllW9nATADRweoco0USuPbF/DP4mzyWeE7aIzDtTjPTMCyknsX9vb+/wfUw4RcDhTt6//E9Z3hqrulPr2olWCfWURJbu73yPFEi3lUwCRSODrbQJTtcFs9kbOy6wjiU0k5sLzN78GCaIrqX6j0uq3wxNHph6lidTpEKShX9mn39tAzBAhFD2JHB0HJDOgo8fyH/TPKH5N4qstseJVEKZysaLeFeVQlz4byE2opEgIDC69C7Sll18FkwB6E6vUWqaMXNqzjYegYIr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_163717_314178_2302A099 
X-CRM114-Status: GOOD (  10.56  )
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

On Thu, 21 Aug 2025 09:13:52 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> @@ -400,7 +436,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
>  	    !trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
>  			       &buffer_size_kb_fops) ||
>  	    !trace_create_file("trace_pipe", TRACEFS_MODE_READ, remote_d, remote,
> -			       &trace_pipe_fops))
> +			       &trace_pipe_fops) ||
> +	    !trace_create_file("trace", 0200, remote_d, remote,
> +			       &trace_fops))
>  		goto err;
>  
>  	percpu_d = tracefs_create_dir("per_cpu", remote_d);
> @@ -422,7 +460,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
>  		}
>  
>  		if (!trace_create_cpu_file("trace_pipe", TRACEFS_MODE_READ, cpu_d, remote, cpu,
> -					   &trace_pipe_fops))
> +					   &trace_pipe_fops) ||
> +		    !trace_create_cpu_file("trace", 0200, cpu_d, remote, cpu,
> +					   &trace_fops))
>  			goto err;
>  	}

I wonder if we should name the file "reset" to not be confusing to users
when they cat the file and it doesn't produce any output.

-- Steve

