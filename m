Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C581BCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HShbJ4pb0uvOuUwE85U36B7c1llkadxegnV9SHJtyg=; b=Jo4pcfi8r1tL3YF4ozA7UC/g97
	0HeZqG1nrcBKaQzPdW3///HBkjCW4BRpFkCKJ1n5KfVMLO0GRccK1Po0zIx02i2sw3rU+XQ7J1GzD
	CyILkZmsEGkd9tfuJNEW4WWKIEA13/PnLzYnJt2ZGokPwvInTFAvI45N4DBw7F6THlzz7eWfznvtB
	3BMLqvOuwOauLlzj307pLTQY2f9w0ateMDG8VNfqceLeFBFYgvuZQnTrJwZiV5kDBLhKUWqB2WL6K
	Uoq7eO0/31qyVELZlxdyAS4L2CSdlusKJOhpX4G6PYOZ7p1CnRN9yK7EEubS8p+bLnFdfSuV7sIEg
	Plq4WVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1QcH-00000000ja8-3ubi;
	Wed, 24 Sep 2025 14:37:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1QcF-00000000jWT-2YmK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:37:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3f1153f4254so2416466f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758724626; x=1759329426; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5HShbJ4pb0uvOuUwE85U36B7c1llkadxegnV9SHJtyg=;
        b=dUNm0iR89WwY+Kx8gWjndE5oaMt/6OxZr6mmGE1iTBlLteVKv8qAhZNf33emWq86sT
         pPBUGlWCws43GZY4Gm7vQ71GKLkkDYsEAQMdbpIRmgbDI+2MSlh3aoRGSn/ojkifG123
         z2AhhqTeBjBBVOBw427y51FoR+yMdqI8I7bJFVJAqEawc6g+rE81G4HRaocSxilAUKr6
         djE+NvrAgRFXKbL+MJyKGf4ZdrT+FYI6jzPNJTkzJxrNLYh/h7Gp9j3swxxk4ZD2Mb5e
         e2QEMVrZAHOj6tMjQXhmgrXUy3zJqZ9Bnpddu2001YhD8bKWT8JVBK8B5dFJ2ZkQbnT0
         KsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758724626; x=1759329426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HShbJ4pb0uvOuUwE85U36B7c1llkadxegnV9SHJtyg=;
        b=ZcD13pxiB/1RBWBqgUT5/gYRzKR01kPeCjVGuMSqH8WH8geqU8XDSXg6L8zKmQ3T6V
         oLX8AysrpdgeBqmDWnV6pNw5zONIx72LLQFGE6sEgMk/NODLCtt3KtTv2UzVuXfvHu7l
         q0iPxf4CYnBqP+LAAnN/HMMEg2X7XUFiTzEmKkzdsGazCASTpdKbVfhgDkUF4cMcYLSP
         Usk22VOH78ghOTIvinFehucmUrHfNUb44g4qwlF6eIOcTf9loMv4AEgVbAMlgRXTpadf
         MjRlASfXiMXWUiFIJEs12vip7kB7s6Ete/VVu8h+yUsE4gqT4DN6ZYdovsoN2h0hdITK
         iBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYL3Y3XwVJ5YhiPmyPmBGePl3pAM+tTOMQUhsyEk8e77AYcXWRaJsGTWeoEpePyn8nwUaqRmverS54/xoEPWLP@lists.infradead.org
X-Gm-Message-State: AOJu0YzBUq39z+8R0hVeKMzZNvucmnCJvj0H3De5cEY49OlV0gXUPunF
	xHvF59zx80LXK3evBRV+jPZwjIlvsx53pXI8rVzsffcEQbA5U4xdga7P
X-Gm-Gg: ASbGncuyTYqnZFJ9JEkkOfzJziv/sdPRK69EBRh3SPWVOjAM6BJs6vepmym/cIWLAum
	h9PIryMKiF83Bpm6STTT9rSzbGXiwkdyT8UG3r2LEJik8tTszT3gV2YnJm1zYPAelMHDMb8ZdKQ
	jP1jqtmmvXzpEMK0lTffckHBpHXWD559w6Sydx0Ix/m1LQxQlG6FFTLVjH/2VJBNr2Oy5WLp/SG
	vQSj/hFHFtWuxIpswnTaXPcYfh45ranbyZ3rpe7llUJIFPemVxPpWagCh153DFfbqNytuiDF/Ju
	XIAWn9sv19qfosB7ABlHbvx6u3pLhCdFSA4ZXB4M3O+yYscA97lni07QILNLd+yTwcoimvwZ
X-Google-Smtp-Source: AGHT+IGEO49EkOTURq2dd80B/jZaZg6Lr95kVlEuO3QoAtObbHlJjeJCYscX19kjXmpcKNM1wSiX9Q==
X-Received: by 2002:a05:6000:3105:b0:3fb:9950:b9fe with SMTP id ffacd0b85a97d-40e48a56cb5mr155880f8f.47.1758724625481;
        Wed, 24 Sep 2025 07:37:05 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::31e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3fb8ebb0d91sm15724812f8f.54.2025.09.24.07.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:37:05 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 24 Sep 2025 16:37:03 +0200
To: Steven Rostedt <rostedt@kernel.org>
Cc: Florent Revest <revest@google.com>, Mark Rutland <mark.rutland@arm.com>,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>
Subject: Re: [PATCH 2/9] ftrace: Add register_ftrace_direct_hash function
Message-ID: <aNQCDwYcG0Qo00Vg@krava>
References: <20250923215147.1571952-1-jolsa@kernel.org>
 <20250923215147.1571952-3-jolsa@kernel.org>
 <20250924050415.4aefcb91@batman.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924050415.4aefcb91@batman.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_073707_668090_D96E6A3D 
X-CRM114-Status: GOOD (  28.40  )
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

On Wed, Sep 24, 2025 at 05:04:15AM -0400, Steven Rostedt wrote:
> On Tue, 23 Sep 2025 23:51:40 +0200
> Jiri Olsa <jolsa@kernel.org> wrote:
> 
> > Adding register_ftrace_direct_hash function that registers
> > all entries (ip -> direct) provided in hash argument.
> > 
> > The difference to current register_ftrace_direct is
> >  - hash argument that allows to register multiple ip -> direct
> >    entries at once
> 
> I'm a bit confused. How is this different? Doesn't
> register_ftrace_direct() register multiple ip -> direct entries at once
> too? But instead of using a passed in hash, it uses the hash from
> within the ftrace_ops.

right, but that assumes that we can touch the hash in ftrace_ops directly,
but register_ftrace_direct_hash semantics is bit different, because it allows
to register new (ip,addr) entries on already 'running' ftrace_ops, in which
case you can't change the ftrace_ops hash directly

> 
> >  - we can call register_ftrace_direct_hash multiple times on the
> >    same ftrace_ops object, becase after first registration with
> >    register_ftrace_function_nolock, it uses ftrace_update_ops to
> >    update the ftrace_ops object
> 
> OK, I don't like the name "register" here. "register" should be for the
> first instance and then it is registered. If you call it multiple times
> on the same ops without "unregister" it should give an error.
> 
> Perhaps call this "update_ftrace_direct()" where it can update a direct
> ftrace_ops from?

I agree the 'register' naming is confusing in here.. but we still need to
use 3 functions for register/unregister/modify operations, so perhaps:

   update_ftrace_direct_add(ops, hash)
   update_ftrace_direct_del(ops, hash)
   update_ftrace_direct_mod(ops, hash)

?

> 
> > 
> > This change will allow us to have simple ftrace_ops for all bpf
> > direct interface users in following changes.
> 
> After applying all the patches, I have this:
> 
> $ git grep register_ftrace_direct_hash
> include/linux/ftrace.h:int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash);
> include/linux/ftrace.h:int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash);
> include/linux/ftrace.h:int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
> include/linux/ftrace.h:int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
> kernel/trace/ftrace.c:  err = register_ftrace_direct_hash(ops, hash);
> kernel/trace/ftrace.c:  err = unregister_ftrace_direct_hash(ops, hash);
> kernel/trace/ftrace.c:int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
> kernel/trace/ftrace.c:EXPORT_SYMBOL_GPL(register_ftrace_direct_hash);
> kernel/trace/ftrace.c:int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
> kernel/trace/ftrace.c:EXPORT_SYMBOL_GPL(unregister_ftrace_direct_hash);
> 
> Where I do not see it is used outside of ftrace.c. Why is it exported?

I have bpf changes using this that I did not post yet, but even with that
there's probably no reason to export this.. will remove

thanks,
jirka

