Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D769ECCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBmndkyEtmuH2zqfJVf2MipvEX2Eu2YJsa5R9Svl5+o=; b=tdM6wsUVAXlPq+uvEBH7g2FVfv
	5nU37S9kz/IHCd/23NDuT5Wj5PdtuaiFdE8FUgMYKNm6ubk5YY5DphdpvgIjjduBlRA06f3yVgVIX
	SIR9pvktvtZsw9vdKACdE4TGtanEXHjyncnNzOBIek8Xw86K7GO2th3gOfKunyEm5axi52gaT/Hjp
	EsGE3gZCGcg49dqzW8FOFX10htE458H08KxAyZcfVoXPQYXTIk4nY7aNhffIrAt2L76O5Wq6z8u9Z
	jdFyO8s20duMb+daAs7JPxwpKB/JXAuAUUZe0heuUsdc5TU8ZJEdY8ynYvzl4ZcRjtoeTVIxIkIF5
	eHH+5+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8emE-0000000GPMj-1heO;
	Tue, 14 Oct 2025 13:09:18 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8emA-0000000GPLy-47dQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 13:09:16 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so7790725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760447353; x=1761052153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XBmndkyEtmuH2zqfJVf2MipvEX2Eu2YJsa5R9Svl5+o=;
        b=ITwbyHGlqCDNxrUBzjhbnkHoXPd0AKRriYHLPSteJoYiZ9nf+SunSqrLOGOIaJdM7k
         Eco17D6cIU9+7qC9xMQsFXoXZ8g/4zRxuVWq8KftWjFY9KHofzx+B4zQUl942hAhAfAt
         ljYpJwsSo6l3h+xk7d7qQxHxErV3ABwbIZpAGxcTd8X0hY4YQNazY7/snjvul0m9gjci
         9hjsRco/l7MAQ+t10dENSrOuq9nFfTkAYjecE0ZJs4pYfvyxw/rbBUOWP+5GQWSvMwCO
         tTAcILBOFFt3QLpPhCcUqU/u6rELSeMA9WVfFG+8G2SPO2Hf9o+4eqh2pvHrum6X/4dG
         Ib2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760447353; x=1761052153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBmndkyEtmuH2zqfJVf2MipvEX2Eu2YJsa5R9Svl5+o=;
        b=uDMaAbh7tscVN45orbzmV0FrN709rz9/d430HvZLDOeKRH1DhD7GftXevYIvKK2P70
         0m5q7K+H5GKi1f4cO+PfExAfSqlaikSd2rTkXD0ywT5KRHfWfL2xuGPuaP6SwZZ5Ye8H
         SgLAerSR/0xcWldTsmj8Dj5mceTteVFmUQsyw2ZHBvYOr/nmKDiF3zpgoBsvv9FrCtOt
         u0fxwBlgLGVG2TSXLgtxD0wz+8ENtiVN7yTAL4DaCZbTuT18MxdJPjjGklMuSpUVj6z9
         PUAU20gWbu1Rw9KBZbxx8oS0cUAfRsty1w69hHq6kgdLYExyd9RKIl2DXG/tcFUm+hl4
         uD/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVA8VtMZUF8YHPGnkzNYkrvWMA9v6fyKHKT9lK0n/6gbMFCbAmwHRrTBQzM3aF9M8u6p6tZX468yUXOPWaqHlxL@lists.infradead.org
X-Gm-Message-State: AOJu0YwtWMUWV1sUCikHxXCtrgwPKMok9q/eqFbFFb731e8LitcZbNav
	h7RYg/P1qP/K8b48sJYdgafKX3hyZhsyTXUPkCJTTVwm2HaJ40YJL/7sEDMbY6hplmE=
X-Gm-Gg: ASbGncuMGSovWb/UBfcu1Uq+mqWWBA8RpA99wX74g//wGL+w4cAa+fasJ7iqskyRu0Y
	C5R7FP5Zrrge22o/Y3B80l5r0ZBTTxRFTjsPviIUpSdPy9BdZr2FsZ6rpJULgmbu9JZwI3fAgCZ
	s6u4d2uLS+GWf5IvuPGMrfZZza+5Tqx1n2Z+5i/17AghnGZ5IeP7KX8vDspuFW/ELv9edecC65E
	1qFT47ZbY9jeQ3aKsP1NjZOX/+OHIeVqdrf67bUyvT6nT+WSpyyL8/J8pV6LQ4qhqvrxoPcnqRk
	AptS0gkJHMJ3ZlxXihe8bNUYhKeP8j0cki1mQiDAzDq0REkZCliTFLdQZiiwz3nEUtxBfCwuq9F
	5UZDrM13XcyKDtdOXasynscWFt6bgbDBRJ5zqaevOnmyCtv9qbU1G8cdLcqZQn957NztDng==
X-Google-Smtp-Source: AGHT+IFGpYfRWYGhqIaSZxufyw3cU/D950Wt8EiMNsuJCAolvX6QytVu1nn4m6ZLSmt3VXgOJE+wuQ==
X-Received: by 2002:a05:6000:43d4:20b0:426:ed9d:4072 with SMTP id ffacd0b85a97d-426ed9d43d7mr1534097f8f.21.1760447352714;
        Tue, 14 Oct 2025 06:09:12 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf70fsm22846162f8f.27.2025.10.14.06.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:09:12 -0700 (PDT)
Date: Tue, 14 Oct 2025 15:09:10 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Li,Rongqing" <lirongqing@baidu.com>
Cc: Lance Yang <lance.yang@linux.dev>,
	"wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, Russell King <linux@armlinux.org.uk>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Joel Granados <joel.granados@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Phil Auld <pauld@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Simon Horman <horms@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Florian Westphal <fw@strlen.de>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [????] Re: [PATCH][v3] hung_task: Panic after fixed number of
 hung tasks
Message-ID: <aO5Ldv4U8QSGgfog@pathway.suse.cz>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
 <aO4boXFaIb0_Wiif@pathway.suse.cz>
 <e3f7ddf68c2e42d7abf8643f34d84a18@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3f7ddf68c2e42d7abf8643f34d84a18@baidu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060915_059098_8C4FBC7E 
X-CRM114-Status: GOOD (  27.67  )
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

On Tue 2025-10-14 10:49:53, Li,Rongqing wrote:
> 
> > On Tue 2025-10-14 13:23:58, Lance Yang wrote:
> > > Thanks for the patch!
> > >
> > > I noticed the implementation panics only when N tasks are detected
> > > within a single scan, because total_hung_task is reset for each
> > > check_hung_uninterruptible_tasks() run.
> > 
> > Great catch!
> > 
> > Does it make sense?
> > Is is the intended behavior, please?
> > 
> 
> Yes, this is intended behavior
> 
> > > So some suggestions to align the documentation with the code's
> > > behavior below :)
> > 
> > > On 2025/10/12 19:50, lirongqing wrote:
> > > > From: Li RongQing <lirongqing@baidu.com>
> > > >
> > > > Currently, when 'hung_task_panic' is enabled, the kernel panics
> > > > immediately upon detecting the first hung task. However, some hung
> > > > tasks are transient and the system can recover, while others are
> > > > persistent and may accumulate progressively.
> > 
> > My understanding is that this patch wanted to do:
> > 
> >    + report even temporary stalls
> >    + panic only when the stall was much longer and likely persistent
> > 
> > Which might make some sense. But the code does something else.
> > 
> 
> A single task hanging for an extended period may not be a critical
> issue, as users might still log into the system to investigate.
> However, if multiple tasks hang simultaneously-such as in cases
> of I/O hangs caused by disk failures-it could prevent users from
> logging in and become a serious problem, and a panic is expected.

I see. This another approach and it makes sense as well.
An this is much more clear description than the original text.

I would also update the subject to something like:

    hung_task: Panic when there are more than N hung tasks at the same time



That said, I think that both approaches make sense.

Your approach would trigger the panic when many processes are stuck.
Note that it still might be a transient state. But I agree that
the more stuck processes exist the more serious the problem
likely is for the heath of the system.

My approach would trigger panic when a single process hangs
for a long time. It will trigger more likely only when the problem
is persistent. The seriousness depends on which particular process
get stuck.

I am fine with your approach. Just please, make more clear that
the number means the number of hung tasks at the same time.
And mention the problems to login, ...

Best Regards,
Petr

