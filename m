Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6FACFC281
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9ZHAU96zRwC8rydbydanUtXN3FsFzz3+3+B+AWK6x0=; b=vsfBPt97JWP8fByuQuKkNiwdv4
	opZIWTgAIoGlt8TcUOsWROXnbKgaAhEWhfz/85llNS99qGa2YYhSf4DdYsLVK7QjZW3k5aMj9JuYj
	Tj52uGy5xh+QxqW5k+AKUB+hkhg2+SKsbPVjvw+bBDcvGTLzOJcnGrHKfDgKMYc3TlkAjbvbwZ88P
	rnlveRFn2f3u9uePH9pB5h1kn3ahaxMSek6exohmqxHK9YtWk6ATELet20WApfo+htunNJVKkynom
	Ll+EHSu3Ifgtk3hrg7xeCo0XcRG+pM4Aai4QdBhzm/yCvJuZoMJ9W91T6dxGSZB4SHE2VlSoxTbXc
	m/Q1zOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRZW-00000008SeZ-2PJ5;
	Fri, 21 Nov 2025 13:53:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRZT-00000008Sdv-3vDj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:53:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so14424255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 05:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763733186; x=1764337986; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9ZHAU96zRwC8rydbydanUtXN3FsFzz3+3+B+AWK6x0=;
        b=TUNxvFcCG8RwxKUI5UPD7xvCGL2pHoxJqmoj/fFdKbdpYWy+jEKn4oCOpbWOqJVPnH
         vVObTATV1Xkguqq+9tsCfloVL6Msc9yAy7QfDBLqoP1xNCGT/V3F0wT9so0Zc7Hq0iMe
         qWP748s8PM6Ye92UzbV5akMZBvPSX+IRo2Ti6oUS769fG1SjSei2STDzy1iYpy8WAL53
         84PvJPyehDOmXlVz/lp1gWUwch6MTQjBY6glff6WXQSV7b9Vk4jgJmJMQBLf5gRtCpZo
         C2gTaRRt//E1C6wtQgFm3q4pq+BCK8LDSboRjsNX+clElglIg+41uV+Sq9ecei3iTGwK
         t0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763733186; x=1764337986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9ZHAU96zRwC8rydbydanUtXN3FsFzz3+3+B+AWK6x0=;
        b=YyqzGWH+24UYdvJvpiJB5VL4jwcYpAHiheMHuoOArgmSQ05buy/ckTHPyKi/l9Y7Gl
         3uC22GSlEfE/OojMqGGl/+YLFCmBw9+lb6sJzy+w6OgAnHM8lW4hiiSpw+wD6n5KM2fa
         oEaQrSdn8T+stBxjk9MvFFE7XB9mOFMRW5tlRiFHYxqm1hir95xrVJZDUGs/a+B8ysQO
         dboPph1jzt9/I1venVPCuTg2jekrozVNnhFU7NW3vB4uF3R1URv2y23kujprdRSymIqa
         uW3HAkYqTW91i8HPrnzFwHksTMiLKOoQJ0M5+gUe4C2YXON5U1WFN2Q7uVJobD8Kcfpa
         PP0A==
X-Forwarded-Encrypted: i=1; AJvYcCUYqs4QpZWS+PYLreqhMHWl3eoDkRlzFzlbFTA6LLsGf2OKWBfJUdFb5AN6gLwcuoSie9kXGMC9HoG1rk4onBGC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz01TG/7YuKVONL6u8wfG+fMXlEypntOhPDqE3/ZBbmEdle2uQk
	PA6RIjh407TFOZm0UbPNt2DlTvZZO6gqhshbzaU6zM5bktGc/xmpRgNl
X-Gm-Gg: ASbGncsy+FVMGoabDYW60/lJk4ujYWkiR6RG5Q5Zv2PEtC2iU/oE+jIHVj6soqnFKgv
	NmRC49TObGXQ62jVB9OGqfToaWz3nH5S01Zh6btgScwaKsJwz+wF9Yw1DdJ1DJDC+Ajh+mi32b0
	ITi0kfO2QfEhCh7OdYMRjOS5Ha5MTok6eYMmi+4f5+Hdc3qz/Bs6L/mpYTsc9/XtFfs1THsjanz
	vJCHkOG9XEmw8W4XnlS8439xYalPFop7nuRrMmkiRsXnyrtdVwmH8wlYVptW+L01nWwEjGhI0MM
	mNIQz4jqWS1DYkmoZfmPEaTvyik6tT407OtxoObKqUCf5Umfyp/Wzvsz+DMnkLynRI5R+5iI7TQ
	p1KKrFWeRm1v2ulkCXqaZZGYHyffA2B0afv1vMt1+Ru5SFzDXL2L4TmXBqstu
X-Google-Smtp-Source: AGHT+IFuTvsjtGwTRPEN026FC2pczcZ8IxCeMFrd96paI0v/3ChPKOPZkThC91+ughQf8nM8pWwgpg==
X-Received: by 2002:a05:600c:1caa:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-477c10d4935mr23861215e9.8.1763733185974;
        Fri, 21 Nov 2025 05:53:05 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm87267315e9.8.2025.11.21.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:53:05 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 21 Nov 2025 14:53:03 +0100
To: bot+bpf-ci@kernel.org
Cc: rostedt@kernel.org, revest@google.com, mark.rutland@arm.com,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, menglong8.dong@gmail.com,
	song@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCHv3 bpf-next 5/8] ftrace: Add update_ftrace_direct_mod
 function
Message-ID: <aSBuv8Ab0y8SeAHS@krava>
References: <20251120212402.466524-6-jolsa@kernel.org>
 <a302c70bc1914835ea69c8b30105741b1d1d06d549ef95b9650d0827e0ca276a@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a302c70bc1914835ea69c8b30105741b1d1d06d549ef95b9650d0827e0ca276a@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_055307_990558_D78E4B29 
X-CRM114-Status: GOOD (  18.76  )
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

On Thu, Nov 20, 2025 at 10:23:47PM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index c571deeff..4e2c0ed76 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> 
> [ ... ]
> 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index cc730a8fd..5243aefb6 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> 
> [ ... ]
> 
> > @@ -6486,6 +6486,74 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
> >  	return err;
> >  }
> >
> > +int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
> > +{
> > +	struct ftrace_hash *orig_hash = ops->func_hash->filter_hash;
>                                              ^^^^^^^^^^^^^^^^
> 
> Can this crash if ops->func_hash is NULL?  In update_ftrace_direct_add()
> and update_ftrace_direct_del(), there's a defensive check:
> 
>     old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
> 
> But update_ftrace_direct_mod() dereferences ops->func_hash before any
> validation checks occur. The check_direct_multi(ops) validation happens
> later, but the dereference occurs first at function entry.

update_ftrace_direct_add is called before update_ftrace_direct_mod which
ensures the existence of the filter_hash, but same as for the update_ftrace_direct_del
case in the other reply, it's probably better to add the check for future

thanks,
jirka


> 
> > +	struct ftrace_func_entry *entry, *tmp;
> > +	static struct ftrace_ops tmp_ops = {
> > +		.func		= ftrace_stub,
> > +		.flags		= FTRACE_OPS_FL_STUB,
> > +	};
> > +	unsigned long size, i;
> > +	int err;
> > +
> > +	if (!hash_count(hash))
> > +		return -EINVAL;
> > +	if (check_direct_multi(ops))
> > +		return -EINVAL;
> 
> [ ... ]
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19552032346


