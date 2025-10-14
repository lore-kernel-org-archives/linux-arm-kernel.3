Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4EDCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R75CvrIgcbILYeZyEie2SvMudL4DW8xIUI8yCH+RsPE=; b=IBHyYWIXwNWjz41GIzU2Q6cdpC
	FnxcwOb/Y3WMgUg/8QPUBs/xx5x5Ge7fO4wWKPmHPq88EkX7oJkKwpGnkp8pUU6MpywJfsD8U0NuL
	a2L5Hzhfyo+rgCxgDSxRi2nopM5VdRTVW8SdV7EYeB4WWVfuv+GkufwCc+iCV2yIuZopTdiqgXjKJ
	YnCbZG8UPEdwPHuYYbS1FXR4jiToucdV2S4Z8kiEEQWA6+iUG/b9i61UUk4EN/SdP+C5iAViq849q
	uiBfSVLFrSHw+AVvlmGsTAaSGFz3kL+lRmx961iig34dXcaAhtQGc/0kxTXlIirRERuCD+DzXe0j8
	VnFt8vZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bam-0000000Fnsc-1TqI;
	Tue, 14 Oct 2025 09:45:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bah-0000000FnqM-1gXM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:45:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-46e5980471eso27629185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 02:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760435108; x=1761039908; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R75CvrIgcbILYeZyEie2SvMudL4DW8xIUI8yCH+RsPE=;
        b=G39EaML9Dd4StJhmuK1jG6s6TqT16jw53VJ8vQJ4Esiu2/1ipAQ5ZQaJt6bF1jXijS
         tJLk5HiPxDDB65m/GNtne1n9BVgNTm+x3h/BpQUucc9F7Awla2yqcCvWv+0tFeuJ1tUQ
         hvPIthXGRn2cB7HTS/2Rp+yAvai9isIeDEtlVVVR1biq23yUlG7BRIAKMNswGS2eRdYF
         cTxxp2NAcxK7EUbOJjV1CS1n0wIGJMXs9T+lGx68vVFelCg7dMYruFWMZTcmgqMIlmMH
         V23XE3HiRfrsz3IbKqJR8tZJoXIicIcHYNwNpsYmtsxfFGEgvfEuiBlLNP3V9sCnPJ47
         LpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760435108; x=1761039908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R75CvrIgcbILYeZyEie2SvMudL4DW8xIUI8yCH+RsPE=;
        b=gG+jCD+TH4O/TX1ayYGaFp6UCNrwTV/xzhN0GjBS1UOiwmuG/qh0h0TzOdQ3+FQRqE
         9j8Q0KKx+3sIfd2zzeQWeIGaTfOENQdYiQ50laDR+GrHnnKa+6EyJAmoArarNtIKQ/q0
         r/bHWdgpmc0k+EvpIx++W0Idki0T4j7jpkR9oK5RazZDMeTB+wc0bDldixXawtOhBMRx
         x06L05dus+PLEBtNyxCDPkc0lLgETf0MmROPps4pHv77NnimvY8ReEjT5EE9Wtlnv22y
         yfQWmaCcTVTdAuX+l5NlZqWr1FjlCT8W5gStNFU7j3xK9H1C9ZMrYYG51aqzN2vVOmI1
         sMCg==
X-Forwarded-Encrypted: i=1; AJvYcCV1kSBv2azMxyBdVxcxKVQyVW+0PVkdoFkttLZI7bZtG56vlygHfbErgMU8p/aioQiypPF6jAJtfiN4Om6oBoWo@lists.infradead.org
X-Gm-Message-State: AOJu0YzsXeGoM9OfVTigPAE9ApHPJxGeieL7blHZMsAgPKQwcKJ9zcI4
	SupSnuBZ8UJcWlRXHufZfjaIAWrXx3ErlJ1bw/oAvqTBClKp3785s3s4h3sh+YFrXmI=
X-Gm-Gg: ASbGncsp8ZPEtV0RCLl0Wa5HM88CBpaIHOtsUSWwr7FFDi2iN3k3Kkxa1HTZS6j1nRv
	80cSvG8w34ZWD98nIdZtRDzjfaSfAAQOHt45Wm9iXKSRaFNnfUkQZgQhgzZwEiWmRHIOIQFs0XF
	vRdEl+OqDSz84sepy2754hHwiYyq7jO45xtO1Vmt6WGL80YW9wUORybW3H2yZCYJQucpXo1EJZl
	fAEGRL/Dfc7bhq+jRB91Q9yPJleawFfCK8YCC8dOYedvPlkEwolI+pM+qPvYLkeuBlnCTQxfJ4W
	33B2LLsAcjT9/4TA1f/vx1ICUFp4x7E85B4f7osuIbNn9Xxtazzvw7lGhrq+gMQtgwgEl8ZCp1W
	DHQGGwri1CzVZ7/EPOI6l6tSSGXcQamnWaAyE3KddkJIZ/7sa3FbmiLwjfMLUSjI1MWQMvg==
X-Google-Smtp-Source: AGHT+IFLMF/oRlSecQb1AgZUj9ViudEM8BAiQCOLkhiN8cHZAWDwJ7zBbTzbicn8TdmEii38ZLu7Sw==
X-Received: by 2002:a05:600c:890d:b0:46e:32f7:98fc with SMTP id 5b1f17b1804b1-46fa9af3656mr132535685e9.21.1760435107774;
        Tue, 14 Oct 2025 02:45:07 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489ad27sm230711415e9.15.2025.10.14.02.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 02:45:07 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:45:05 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: lirongqing <lirongqing@baidu.com>, wireguard@lists.zx2c4.com,
	linux-arm-kernel@lists.infradead.org,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	linux-doc@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stanislav Fomichev <sdf@fomichev.me>, linux-aspeed@lists.ozlabs.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, Russell King <linux@armlinux.org.uk>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Joel Granados <joel.granados@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Simon Horman <horms@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Florian Westphal <fw@strlen.de>, netdev@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH][v3] hung_task: Panic after fixed number of hung tasks
Message-ID: <aO4boXFaIb0_Wiif@pathway.suse.cz>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_024511_467871_5848DF8A 
X-CRM114-Status: GOOD (  20.68  )
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

On Tue 2025-10-14 13:23:58, Lance Yang wrote:
> Thanks for the patch!
> 
> I noticed the implementation panics only when N tasks are detected
> within a single scan, because total_hung_task is reset for each
> check_hung_uninterruptible_tasks() run.

Great catch!

Does it make sense?
Is is the intended behavior, please?

> So some suggestions to align the documentation with the code's
> behavior below :)

> On 2025/10/12 19:50, lirongqing wrote:
> > From: Li RongQing <lirongqing@baidu.com>
> > 
> > Currently, when 'hung_task_panic' is enabled, the kernel panics
> > immediately upon detecting the first hung task. However, some hung
> > tasks are transient and the system can recover, while others are
> > persistent and may accumulate progressively.

My understanding is that this patch wanted to do:

   + report even temporary stalls
   + panic only when the stall was much longer and likely persistent

Which might make some sense. But the code does something else.

> > --- a/kernel/hung_task.c
> > +++ b/kernel/hung_task.c
> > @@ -229,9 +232,11 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
> >   	 */
> >   	sysctl_hung_task_detect_count++;
> > +	total_hung_task = sysctl_hung_task_detect_count - prev_detect_count;
> >   	trace_sched_process_hang(t);
> > -	if (sysctl_hung_task_panic) {
> > +	if (sysctl_hung_task_panic &&
> > +			(total_hung_task >= sysctl_hung_task_panic)) {
> >   		console_verbose();
> >   		hung_task_show_lock = true;
> >   		hung_task_call_panic = true;

I would expect that this patch added another counter, similar to
sysctl_hung_task_detect_count. It would be incremented only
once per check when a hung task was detected. And it would
be cleared (reset) when no hung task was found.

Best Regards,
Petr

