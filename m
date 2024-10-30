Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB6FD5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWI6K/rf7yyzgkMjRv3kNpqClOPrOQ72cfml1iwnTbs=; b=mIMHj/uF7LDca3C5oRvcPcFH+B
	yUFVRSkNe68z47D6LwLE7Bg1jiIYjTc5sAw7xUAaeVDu/z5QmCbl8JsjotW2bBAub2b6aksYFwmtY
	NIsCWIwjfOB3Rg7NqAf3XXiKDoLFtHlUchkO3R2X+JlwEFUHkMAUlNGyCN9/7xuvvtqewrw+2vYUm
	QK66mmowo54qrfcjS+0deABsNvlbM40QWWFYca16N0ByN8tZx61YVnimqeQ2t8N9rdP62tCkEvwRe
	U5evslszqwBGHvLYMzsKhiOxvycbFmmFi2CILKAUb6gwgozZPTyy4m/GpcXste0Tg009HeT2+5d2J
	GzRCNVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65IW-0000000HR6z-0H6A;
	Wed, 30 Oct 2024 09:47:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65Df-0000000HQDJ-0Rqp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:42:28 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37d4c482844so4281708f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 02:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730281345; x=1730886145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uWI6K/rf7yyzgkMjRv3kNpqClOPrOQ72cfml1iwnTbs=;
        b=XiGaVtv4mBSWm1RPdvi7/FaWHeXZmt04daf/UcWKWLtpt35jmK2xEvLjUb6/YqIYXj
         b/zeeup1Gy/QNLFPP2ukgSnLNyzwO+xQag63XAp8ajcGD149G+7ABqG+aTJcO5UgQ8Q6
         uXt1izN6mYfcG62SZKsbnPrX8t/xYn0zNYFkRxrd02beEnyBITLD1MwfrQfv7ReXS/Ib
         Rbr/BNc5ggggu3A4G/2o+oiXCf+Kf2gMlNPpLBRsMGy3VUnR1SJ5tCW2hdzbiIGZAiTs
         WJNgN17lRa7qmUYnS4qdZ1f3O6P7m1m0gqpgvkAR0Gn9Fd6PYKpqeHwvPUQYRZkbpbXi
         ZWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730281345; x=1730886145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWI6K/rf7yyzgkMjRv3kNpqClOPrOQ72cfml1iwnTbs=;
        b=uyVca56hQ8FdWT61ku67tTSGlNSBwj8FkOoM7PKVVCyfXpqjgPQQ5jdRQcWwHnJSsa
         urSx4v+Fa1sjc87vpzbPsKwiQf0iU4jtxSNcP/h8n3Raq0s4WF7FJgAeus+EJzTKar2B
         UjpXKq3caHhOAUPSpfj2XNAI64hP0b+zxWLCe5/ooChlS6NZjjgopXzB3ReZvtpvgoqD
         wjm36/xM3YB8LcT0P9jwcYNrjbgPWBDTzG9NI9+ZnCzqZUXKffQd2bj9sbp6ie4LTE+e
         QuS20OyHskVvGsAQJ6t8YZ1iPaQlKIXZz0xaXC9RpXedcAy9JZLiY5QgaHv2yxxShBGU
         WEAw==
X-Forwarded-Encrypted: i=1; AJvYcCUPjsNvY9e2URiiGc0LJad2rZutwKNMJCjCl/8ivUVf8GZTy9VH4H6smTQXl8VdJ2hwDSb/KQmcg6zgp3y3yrep@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Fjyyk/ZaaSgItcP3YNQrhaHDEAGdKJ5cxCjkChTf3UunfYow
	rrJNjk5fEKukt5IWrORVAp9n4jYnRKGHixwMgkahbywuuaFqdTBE
X-Google-Smtp-Source: AGHT+IGgxkYq0IK3fxqLi8TOsD2onQa9lxKRAUf/ZEnDRqoOPLnaHRe93zTXDeoP87QjxNur8CC1qw==
X-Received: by 2002:adf:e28a:0:b0:37d:45f0:dd0a with SMTP id ffacd0b85a97d-380610f2a9emr11076817f8f.1.1730281344449;
        Wed, 30 Oct 2024 02:42:24 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb4461sm14802711f8f.113.2024.10.30.02.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 02:42:24 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 30 Oct 2024 10:42:21 +0100
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Ingo Molnar <mingo@kernel.org>
Cc: Peter Ziljstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
	bpf <bpf@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Liao Chang <liaochang1@huawei.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"linux-perf-use." <linux-perf-users@vger.kernel.org>,
	Kernel Team <kernel-team@meta.com>
Subject: Re: The state of uprobes work and logistics
Message-ID: <ZyH_fWNeL3XYNEH1@krava>
References: <CAEf4BzarhiBHAQXECJzP5e-z0fbSaTpfQNPaSXwdgErz2f0vUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4BzarhiBHAQXECJzP5e-z0fbSaTpfQNPaSXwdgErz2f0vUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_024227_185930_596F77A7 
X-CRM114-Status: GOOD (  13.59  )
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

On Wed, Oct 16, 2024 at 12:35:21PM -0700, Andrii Nakryiko wrote:

SNIP

>   - Jiri Olsa's uprobe "session" support ([5]). This is less
> performance focused, but important functionality by itself. But I'm
> calling this out here because the first two patches are pure uprobe
> internal changes, and I believe they should go into tip/perf/core to
> avoid conflicts with the rest of pending uprobe changes.
> 
> Peter, do you mind applying those two and creating a stable tag for
> bpf-next to pull? We'll apply the rest of Jiri's series to
> bpf-next/master.


Hi Ingo,
there's uprobe session support change that already landed in tip tree,
but we have bpf related changes that need to go in through bpf-next tree

could you please create the stable tag that we could pull to bpf-next/master
and apply the rest of the uprobe session changes in there?

thanks,
jirka

