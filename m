Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2399FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1kBDy0sA3BYfIdWlr+hjUo0vDal9CsK0/fCdjzti6o=; b=iFeuiM6PTFdjIAPN44WMchSh8u
	kFtSlp3fGxPFAgX9x3z7Y5zkn7/XG6LHktXMejeqIH2ZLX9Gbj9o5SFqbZZiVoqvXKIhzr5wNFoku
	vKJ35R2cceA1k4aN47htIXjjd6zgpzsa0ZOJdclgNUNpEbXf8xSNkYPiOOkMhCm4EqAInT2nHUtgF
	/9UpzcRROFd5gaU5oWgF5EsJeJTMo8dag1VUCw3H4nrB+s1kQzHtfN1G8r8uLHDkzMdFwGrF1zndY
	x2IqTF9LLr/6pNLCwli7n8aSJtDmjOxfkWSjLBBAyZCVE1bou/F4SldDc17aUxHxseDM5paefRmDo
	aVJ3Lt5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHO5-0000000DJNU-3LZD;
	Wed, 10 Sep 2025 09:45:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHO3-0000000DJMK-1Mx9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:45:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so41925325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 02:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757497509; x=1758102309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1kBDy0sA3BYfIdWlr+hjUo0vDal9CsK0/fCdjzti6o=;
        b=Rx3g51uygNiMdh03y5+o74b35Ncg8xrbvdK3eOGmGOeIVhcLJ0zEe14iXc5XZ6Dgrw
         nxH2In9T/lc/Twd2cTfqdSFAfrQaI+apJzhf68h1i1UMho5oo7r/T8Dgzy7kW2GuezBz
         ftmRsHAtopB//RbeTylofWfICJIWzvGMIbIYa9usKSj3Od+7oJmVXqpZivRnmvDAaINc
         W9u0kjQDvsZlawe2PMcPB3exm1v1dBizQy/5gi+riE2/hu2sXabl40LiPKUfybHmMzXj
         Y2KC0MVQK61TirZqFF2jZWkwLODFQ2x5IrMs4iFzRdUEi2w+7yDKN8PQvG9HAF0HWArS
         q8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497509; x=1758102309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1kBDy0sA3BYfIdWlr+hjUo0vDal9CsK0/fCdjzti6o=;
        b=pD9uep8CHWNn4Wwq9mHQnLqMZieHeznnV9mdylteFWCvRPR/VO+RIN/3iKgA7rL4Lc
         2AmnV7lean3EJxVq+ioTIR5BPyQVwZe1bpmmrq2dEUD7BY5vp5+LpZThttAER4asiuV5
         +rALRSwH0EooeXyxVw9Bhp0REccTVZJL0b9n+ysl91wpyA9O8eF7s2t7gVU7aNs/6aSC
         mSBirDJRkHTg+JeXGbJLsU3xVyYei2rpuIQJILEoMQRYNp/rzY4LW7sWWqovAv+Iruxa
         mRQ8sZnSaIaCirXZfwJ/vOOgOnDRXwere8yyLWrDWvI4mLUqpNMGcxPMAQlq6srOldl/
         AKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX1Bojtrt92nlcgVukwgruF88NOTdLLtz+lHWSOgtmSzpmK8baK5AtNxR9fwonO8DWMaM7ZnB9GFjSeZBzKFHc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk/+Z4DGcbEIHB4yL1kkCHNsURpibvhG6kxePYeIKNydqxPrtG
	GBFTt8xvNUnj4UC1OsWJlPcfx78spHvD95r3kWACp+xgE7rcdFI2T+vQATExIj5WrA==
X-Gm-Gg: ASbGncsFutJB167IsABSGqbMaEipBh9SXp8mAs/mLovTP+72Eaf4lZf6JXqnoqDflY9
	45tuTjFMBx7ba7dHjTx7IBs9F8xqDMq3B6hcWC68tjyY7c3PM9L/42g1ewjpA/y+q4rnxz2n6G2
	P7prxQe3ujlMOquTd2rceJtz7Dlj0W8Q7kZbSRUm6Bjrw/HBH7BwcPO0VVQQlbP1Cyk18Tu0K+f
	hWEFNKN5aEJ6CJaZxHdGqGjFaEufRSduE4zOAkf3M7pGogu8Vo4Shjc5kqJNpvo0EaE7iKLVJxS
	oPG2Sw6KP+bLEwF6UIE4kMJBmky5gpDY9ytiUXYL2mRwNY5IcnnoPKYSqdqEfY1ftG1yoaXmcQx
	i6s61zU954zfYUPf5e0vLkdQRysL8dXTjhRevHK3+eqzrsPQoKGwNCoZn1DR7uUFj56Wxiag2TW
	VNBmHs
X-Google-Smtp-Source: AGHT+IENXjSZ9eYxIcTPb1KA8MslU7Gkmmzo6eN91GvxyARG/yRPq8gJbKV+SVFiPMHX+dA+S+OktA==
X-Received: by 2002:a05:600c:3b1d:b0:45d:84ca:8a7 with SMTP id 5b1f17b1804b1-45dddeba3e5mr124414255e9.14.1757497509275;
        Wed, 10 Sep 2025 02:45:09 -0700 (PDT)
Received: from google.com (211.29.195.35.bc.googleusercontent.com. [35.195.29.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7532f90e6sm5750475f8f.6.2025.09.10.02.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:45:08 -0700 (PDT)
Date: Wed, 10 Sep 2025 10:45:05 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/24] tracing: Add reset to trace remotes
Message-ID: <aMFIoY5yfQa2Mzgk@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
 <20250821081412.1008261-5-vdonnefort@google.com>
 <20250908193757.079aae76@gandalf.local.home>
 <aMAZMaZJ1_Eny5Ku@google.com>
 <20250909094028.3265b751@gandalf.local.home>
 <aMBSa29ev0BNgr5R@google.com>
 <20250909143948.420bfb1c@gandalf.local.home>
 <20250909145236.69192cd0@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909145236.69192cd0@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_024511_402348_5A759E84 
X-CRM114-Status: GOOD (  28.76  )
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

On Tue, Sep 09, 2025 at 02:52:36PM -0400, Steven Rostedt wrote:
> On Tue, 9 Sep 2025 14:39:48 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > But anyway, I think it should work for the remote buffers too. Let me go
> > and fix the current iterator.
> 
> I thought it was broken but it isn't ;-) I did it properly, I just didn't
> look deep enough.
> 
> So yeah, look at the rb_iter_head_event() code. The ring buffer iterator
> has a copy of the event. It has:
> 
> 	if ((iter->head + length) > commit || length > iter->event_size)
> 		/* Writer corrupted the read? */
> 		goto reset;
> 
> 	memcpy(iter->event, event, length);
> 	/*
> 	 * If the page stamp is still the same after this rmb() then the
> 	 * event was safely copied without the writer entering the page.
> 	 */
> 	smp_rmb();
> 
> 	/* Make sure the page didn't change since we read this */
> 	if (iter->page_stamp != iter_head_page->page->time_stamp ||
> 	    commit > rb_page_commit(iter_head_page))
> 		goto reset;
> 
> It first checks before copying that the data it's about to copy hasn't been
> touched by the writer.
> 
> It then copies the event into the iter->event temp buffer.
> 
> Then it checks again that the data hasn't been touched. If it has, then
> consider the data corrupt and end the iteration. This is how the "trace"
> file works. I believe you could do the same for the remote code.
> 
> If we are gonna keep the "trace" file, let's make sure it's fully
> implemented.

I was more worry about the ring-buffer page order that can be reshuffled on each
swap_reader_page(), making the page links useless in the kernel. Ideally, the
meta-page would keep the page ID order somewhere.

Alternatively, we could walk all the buffer pages to read the timestamp and
re-create the order but that sounds quite cumbersome.

> 
> -- Steve

