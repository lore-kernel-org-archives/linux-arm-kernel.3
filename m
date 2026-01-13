Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF1CD2D0E2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SGd3tXmtLkKwF012MQCllNNXd7BPnjgwOvsuNzDErw=; b=uGQJ8Va54Ehw5cYKQXnXDI4nlA
	MWLxpkN5O2+L+Ti2+eiXi1BA7cq+eAcQntWGfEtBax5YinjZGrOaUFnDtVCoUlzODBvDM/+MMvjRm
	81k0Wl5AO4feNifDhuzF8uJQ1yXzLkq3fD9uS+7jFDogZ0nmCijfH7ksnu45mKho7oKI11pFRCRlN
	mVn85+kbPP9vJR5gQZf0Pmh7XokThhmdSeJ+lv5gDA4ikLHs4KdlXlJ+sK2xmYJtnL5FPPcktUrm3
	F6ltp/sfjnuAKgu/UP7Gvl/dGyO/2SLrsN8ldaUUMOSrgSgE2bd5UaRQka4faOimNixooiyIc9FHv
	JAB9WGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfd2h-0000000733j-0KqR;
	Tue, 13 Jan 2026 11:58:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfd2e-0000000733E-0JXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:58:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43284ed32a0so3798825f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 03:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768305510; x=1768910310; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2SGd3tXmtLkKwF012MQCllNNXd7BPnjgwOvsuNzDErw=;
        b=gzp7ToDrGfv4Jc1hwxIcGCbLM+FxarmIZcqVNYcOqxbJsUu64HGL0O2IKPYJzmEIZM
         HDlUndfr1m2Ac8ItFlpRwmMMTmYSvG9vHg9kKx+dNuXoBGiX2S/QL289BImdS/Lenxm5
         q1DeMwmRfuGaLsISUD2zyBidd6nvUHakslH9Z+3MBtJVJ6PbPWGD0Kkl/Ps6zsKbpzMx
         M356FxTA2gXjMLhZNyg83Wmx+nHA/oCkJpOCRQfnwtppiPcCO0TenrpdMxzbhjyTEQIp
         NV972d4dm7isFDOYF2zi3lMBY8GKxp8cInCfPducvRBLHdiVZMHUel/nNzLlEhW1n8Vd
         zcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768305510; x=1768910310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SGd3tXmtLkKwF012MQCllNNXd7BPnjgwOvsuNzDErw=;
        b=qtWjImWuVTkEzDfZrQh/V2h3C9AgitUDz+n73FOmxkD7hSw59ukW1ZGCJ2f7HMBAN5
         oVz4SG7OZfZOOZQcQl+Q3WFJ9RQrKN9cYyvHSPOb7sFUiEDPnluArMUpOM/5O8ysy7UO
         zNloiRLb0KK0EMGPfSuBQ1F1vMxlVYDtVqEHiWumvALVSOZtzw2qOjIh7cPnnDYkfS07
         opqHztCP8Qqu/P9S1jGsvNw+WnSkbR+4bZOwRPgMd9UJH7lJrWi3vuAUuz60x3ZEXXl/
         sOx+YZsirRBAPeVBMmQrAJTAr+4+vfO0AnfxVdZe9PtLovv4xgrrjyiIWXouSiw/YXLY
         z+XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTBfD1q6UXhE4FhmE2HMW39PIXjOebQShZjYW6Szfuax3CQFbTMXU3Ysms4NHGpNyfetcZ+JaQKKTNpJXM/xGY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzleg8UTlbVXNQMsKACCO2mcP4jbti6CWKOw3k3p+DWaiyYJXi5
	RlmA2Vpr59uknDgChqaTkevszqWlGdokU5suun7aGtN1JcjxoRzLovx0
X-Gm-Gg: AY/fxX78z1ptoU+c8AOd/CW9ycTvY9DMuHKVZhBSH6+JyiOmx2SsOomHCzC5NCM6flN
	zR0XKURTXs83VJD2i9vj3JAGL41NgUhEAG3VF46XZ15jo1MFNxVPN+INNFxcnwf3dHNrYPffPdA
	mAqdXxwSWnrSMszQgVc+2oaUZsL1+uZAHDm9Mc8/X8f0nkSMXsLSA2e8HLrOJkpEVPppOHttdVX
	rkvPzMIaTW1USwTU1ay/XEAeb2lODCPEQyd2k2Mj60Pninw65kjH5OOYM7eLWUE+KyRKP6BAvvU
	fXwN1HO5jabNwl7ppq1Pi9UU6BFZWsoj9MFj1dHwpSC6oVwiAQ48k/Vi+zNHJCfKZJpXR81oXqI
	PjFBJhm5YxkX4vABCjpX/FOdTpuSGRK7nOPvjVJxrDHnfoo2W8uYDwAx5ee9O
X-Google-Smtp-Source: AGHT+IGkvUuVDJVo/hzAbWsKzxOrW1kEblMrgxzCuB8BjwrLokZwyC+CIexQPCRUge4jrjh3WK73TA==
X-Received: by 2002:a5d:64e6:0:b0:432:851d:3676 with SMTP id ffacd0b85a97d-432c3774267mr27499901f8f.57.1768305509864;
        Tue, 13 Jan 2026 03:58:29 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm46383138f8f.24.2026.01.13.03.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:58:29 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 13 Jan 2026 12:58:28 +0100
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Jiri Olsa <olsajiri@gmail.com>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: Re: [PATCHv6 bpf-next 7/9] bpf: Add trampoline ip hash table
Message-ID: <aWYzZBBkIJCyuwbH@krava>
References: <20251230145010.103439-1-jolsa@kernel.org>
 <20251230145010.103439-8-jolsa@kernel.org>
 <CAEf4BzYgqWXoKTffa5Y6Xm-nPbL9aFgrStR0GfUs4-88f10EgQ@mail.gmail.com>
 <aWVnVzeqWJBXwBze@krava>
 <98436a72-236a-43c4-b6ac-9d74b53b0223@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98436a72-236a-43c4-b6ac-9d74b53b0223@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_035832_164791_96F4E5D6 
X-CRM114-Status: GOOD (  26.81  )
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

On Tue, Jan 13, 2026 at 11:02:33AM +0000, Alan Maguire wrote:
> On 12/01/2026 21:27, Jiri Olsa wrote:
> > On Fri, Jan 09, 2026 at 04:36:41PM -0800, Andrii Nakryiko wrote:
> >> On Tue, Dec 30, 2025 at 6:51 AM Jiri Olsa <jolsa@kernel.org> wrote:
> >>>
> >>> Following changes need to lookup trampoline based on its ip address,
> >>> adding hash table for that.
> >>>
> >>> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> >>> ---
> >>>  include/linux/bpf.h     |  7 +++++--
> >>>  kernel/bpf/trampoline.c | 30 +++++++++++++++++++-----------
> >>>  2 files changed, 24 insertions(+), 13 deletions(-)
> >>>
> >>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> >>> index 4e7d72dfbcd4..c85677aae865 100644
> >>> --- a/include/linux/bpf.h
> >>> +++ b/include/linux/bpf.h
> >>> @@ -1325,14 +1325,17 @@ struct bpf_tramp_image {
> >>>  };
> >>>
> >>>  struct bpf_trampoline {
> >>> -       /* hlist for trampoline_table */
> >>> -       struct hlist_node hlist;
> >>> +       /* hlist for trampoline_key_table */
> >>> +       struct hlist_node hlist_key;
> >>> +       /* hlist for trampoline_ip_table */
> >>> +       struct hlist_node hlist_ip;
> >>>         struct ftrace_ops *fops;
> >>>         /* serializes access to fields of this trampoline */
> >>>         struct mutex mutex;
> >>>         refcount_t refcnt;
> >>>         u32 flags;
> >>>         u64 key;
> >>> +       unsigned long ip;
> >>>         struct {
> >>>                 struct btf_func_model model;
> >>>                 void *addr;
> >>> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> >>> index 789ff4e1f40b..bdac9d673776 100644
> >>> --- a/kernel/bpf/trampoline.c
> >>> +++ b/kernel/bpf/trampoline.c
> >>> @@ -24,9 +24,10 @@ const struct bpf_prog_ops bpf_extension_prog_ops = {
> >>>  #define TRAMPOLINE_HASH_BITS 10
> >>>  #define TRAMPOLINE_TABLE_SIZE (1 << TRAMPOLINE_HASH_BITS)
> >>>
> >>> -static struct hlist_head trampoline_table[TRAMPOLINE_TABLE_SIZE];
> >>> +static struct hlist_head trampoline_key_table[TRAMPOLINE_TABLE_SIZE];
> >>> +static struct hlist_head trampoline_ip_table[TRAMPOLINE_TABLE_SIZE];
> >>>
> >>> -/* serializes access to trampoline_table */
> >>> +/* serializes access to trampoline tables */
> >>>  static DEFINE_MUTEX(trampoline_mutex);
> >>>
> >>>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> >>> @@ -135,15 +136,15 @@ void bpf_image_ksym_del(struct bpf_ksym *ksym)
> >>>                            PAGE_SIZE, true, ksym->name);
> >>>  }
> >>>
> >>> -static struct bpf_trampoline *bpf_trampoline_lookup(u64 key)
> >>> +static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
> >>>  {
> >>>         struct bpf_trampoline *tr;
> >>>         struct hlist_head *head;
> >>>         int i;
> >>>
> >>>         mutex_lock(&trampoline_mutex);
> >>> -       head = &trampoline_table[hash_64(key, TRAMPOLINE_HASH_BITS)];
> >>> -       hlist_for_each_entry(tr, head, hlist) {
> >>> +       head = &trampoline_key_table[hash_64(key, TRAMPOLINE_HASH_BITS)];
> >>> +       hlist_for_each_entry(tr, head, hlist_key) {
> >>>                 if (tr->key == key) {
> >>>                         refcount_inc(&tr->refcnt);
> >>>                         goto out;
> >>> @@ -164,8 +165,12 @@ static struct bpf_trampoline *bpf_trampoline_lookup(u64 key)
> >>>  #endif
> >>>
> >>>         tr->key = key;
> >>> -       INIT_HLIST_NODE(&tr->hlist);
> >>> -       hlist_add_head(&tr->hlist, head);
> >>> +       tr->ip = ftrace_location(ip);
> >>> +       INIT_HLIST_NODE(&tr->hlist_key);
> >>> +       INIT_HLIST_NODE(&tr->hlist_ip);
> >>> +       hlist_add_head(&tr->hlist_key, head);
> >>> +       head = &trampoline_ip_table[hash_64(tr->ip, TRAMPOLINE_HASH_BITS)];
> >>
> >> For key lookups we check that there is no existing trampoline for the
> >> given key. Can it happen that we have two trampolines at the same IP
> >> but using two different keys?
> > 
> > so multiple keys (different static functions with same name) resolving to
> > the same ip happened in past and we should now be able to catch those in
> > pahole, right? CC-ing Alan ;-)
> >
> 
> We could catch this I think, but today we don't. We have support to avoid 
> encoding BTF where a function name has multiple instances (ambiguous address).
> Here you're concerned with mapping from ip to function name, where multiple 
> names share the same ip, right?

so trampolines work only on top of BTF func record, so the 'key' represents
BTF_KIND_FUNC record.. and as such it can resolve to just single ip, because
pahole filters out functions with ambiguous instances IIUC

> 
> A quick scan of System.map suggests there's a ~150 of these,
> excluding __pfx_ entries:
> 
> $ awk 'NR > 1 && ($2 == "T" || $2 == "t") && $1 == prev_field { print;} { prev_field = $1}' System.map|egrep -v __pfx|wc -l
> 155

right, but these are just regular kernel symbols with aliases and other
shared stuff

jirka

