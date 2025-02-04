Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAB0C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9iIjxxwva3fm5ewtrniN91za3PWyU6iE2xOK2M8hJs=; b=IsJpBhtd9ZGlVLPLJ+dk/8HWZJ
	aAvzYJofcjyk7DszxH6q/O4hYKu6GyCqZ/xHsRbFNMyO8tEoDs6nWSfh0LYsCDIC4banjdR0rT5iV
	oJxGvHyH9IFPiZG95HR5s3GCrb2KPC6FUtHZ8NdC97Wz4Qx1Qy2SPQTQrPIdpiEaeoa5fwf4H/z7Y
	RjHWIbpmZy2l5uBmg24wBBF9WGIw6F4FMt0w3oIiZDthxQhckRKjGCPvSoIy5XDIM+OZc+0fbL5FZ
	3ATwMVX1y89zx1BJvHRG9va7ZDWvo6b01HV033gNkTqNmmgbdwjfknZJG8Z2uSMqPuBRhzEVGiyPh
	b18AiwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHNU-00000000J5Y-1s4k;
	Tue, 04 Feb 2025 11:46:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHMA-00000000Iz3-0EgP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738669479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s9iIjxxwva3fm5ewtrniN91za3PWyU6iE2xOK2M8hJs=;
	b=aA7eikKr0O3t/r64cqKRVygGg7iiLC8zbmV9Mc0bM9xvmuzCvbyrdAzK39GvM6/37511yH
	WHLfNOHfAa0rEpxTLCMiM41g4wun1dsx+z+hy3Bm6UENaqa5+cgeRuxCCoj4swlPC69zwe
	xGE8WSv7tGgWFSY4gty7YPS7rDsJfeY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-3UOAidoKPESnXtoBOHbrFg-1; Tue, 04 Feb 2025 06:44:38 -0500
X-MC-Unique: 3UOAidoKPESnXtoBOHbrFg-1
X-Mimecast-MFC-AGG-ID: 3UOAidoKPESnXtoBOHbrFg
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f9c1b95ed9so1891522a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 03:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669477; x=1739274277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9iIjxxwva3fm5ewtrniN91za3PWyU6iE2xOK2M8hJs=;
        b=Pc75H/xZc2SwUtoqN2YPm2aViM3OmMa+MdaFUyJIfIOuW072Okdj/xOYjXuj5bw4G5
         7WYz6qUosxpA9Jr4YBI9Qk60xim8UNAqkqjIWSkic2YnX/a4k7JvQfu/MMysG1+C+rMd
         hU7KMhpiblnb6MWBsbXWPVzZHuJgPv6hJP0fjsJk5u27mMb9/xp5NRpP929OZU08p7jk
         vzTcQL+ZTDgvm9cl/l4goeUbuB0eK9/Fetnk0aW5wDK72R4wFcfQ3i0wLUMGOOq4n7DY
         jOEaGUZqju+aOZq4mO9KmE3vyQqDA7IZ7RHKUz4Do3QMSchjxokTXe+kS+O59QWvjnQU
         9mbw==
X-Forwarded-Encrypted: i=1; AJvYcCXvRmNscxSQGkonYJnjz+OwGZqvimSliG9qKZwQx0367W86wYpSlCs0A2g2mO2yeGwvmvYgjmiVb1atcsW+geK4@lists.infradead.org
X-Gm-Message-State: AOJu0YyGq4R71sgsTmuMRG7bBUyKyDs2wbdEwqV4wjawKig+h2dSgFIt
	PMFwPmn08162dlMWuUAar9phlAXeAWMVQyfUArRVcYtIwQ0YlZ/2I+xn2GyBe7wiDEq0X/EDDkC
	VJu1fis2cHV4gYnQfKtsu0J1jB/e1kvcORf9UW6gshqCiIVjMy636F7Bz9B8UZlyGEJQTHjVO5R
	gNs/E2XNjCrvYb4jsVyBfR83f8HAPSnQbAdO9iazjRnlmRels=
X-Gm-Gg: ASbGncseMmCUHyeGPShAP3pPdp4LTBOdYNpR7WPp6MSnoYkTK60Z1V/gYJgSe5h01x0
	gS5VdXl4xCePZ/6Dqzjqjg7F53FzhQyNx4/EvIFZVXWo0Fob3I0XQPRxK/W1efM6VakzBSnnbCs
	w/Kxmrywjz+ntCVvuxoQGP
X-Received: by 2002:a17:90b:264e:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2f83abb3532mr35197887a91.3.1738669477475;
        Tue, 04 Feb 2025 03:44:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT1215YnlE/ZrpMQgdXRPpcUHi+R5LKcJT0ZErl0b04QYANkPy1LfVqSEokWJgpg/IOvaQL+JB/pyKlW4LRIs=
X-Received: by 2002:a17:90b:264e:b0:2ee:f80c:6892 with SMTP id
 98e67ed59e1d1-2f83abb3532mr35197867a91.3.1738669477224; Tue, 04 Feb 2025
 03:44:37 -0800 (PST)
MIME-Version: 1.0
References: <20250117125522.99071-1-lukas.bulwahn@redhat.com> <20250204113614.GD893@willie-the-truck>
In-Reply-To: <20250204113614.GD893@willie-the-truck>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Tue, 4 Feb 2025 12:44:25 +0100
X-Gm-Features: AWEUYZlGlZEjRarXyn4DMZdt0GYLGOVYedjIdYC8RRdsZP_eC31hKcwXeaYXrKs
Message-ID: <CAOc5a3O-8wrQq3oNJC+H9ncFt0yxcm4O+QSgPk4QckF6Ak5pGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: Remove selecting replaced HAVE_FUNCTION_GRAPH_RETVAL
To: Will Deacon <will@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-trace-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HlKLcMC3z1ACLmczlP5gpLDMJBTt4Fu4izHsxGQN1h4_1738669477
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_034442_161938_DD59C0F6 
X-CRM114-Status: GOOD (  19.74  )
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

On Tue, Feb 4, 2025 at 12:36=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Jan 17, 2025 at 07:55:22AM -0500, Lukas Bulwahn wrote:
> > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs"=
)
> > replaces the config HAVE_FUNCTION_GRAPH_RETVAL with the config
> > HAVE_FUNCTION_GRAPH_FREGS, and it replaces all the select commands in t=
he
> > various architecture Kconfig files. In the arm64 architecture, the comm=
it
> > adds the 'select HAVE_FUNCTION_GRAPH_FREGS', but misses to remove the
> > 'select HAVE_FUNCTION_GRAPH_RETVAL', i.e., the select on the replaced
> > config.
> >
> > Remove selecting the replaced config. No functional change, just cleanu=
p.
> >
> > Fixes: a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs"=
)
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > ---
> >  arch/arm64/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
>
> Hmm. There are still a couple of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL guards
> kicking around:
>
> include/linux/ftrace.h:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
> kernel/trace/fgraph.c:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
>
> so it's not clear we can just remove the option from arm64 without
> breaking ftrace_return_to_handler(). What am I missing?
>

Will,

I believe you are looking at a tree, which did not include commit
a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs") yet.

A quick look:

$ git checkout  a3ed4157b7d8~1
HEAD is now at 41705c4262aa fgraph: Pass ftrace_regs to entryfunc
$ grep "CONFIG_HAVE_FUNCTION_GRAPH_RETVAL" . -R
./include/linux/ftrace.h:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
./kernel/trace/fgraph.c:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL

$ git checkout  a3ed4157b7d8
Previous HEAD position was 41705c4262aa fgraph: Pass ftrace_regs to entryfu=
nc
HEAD is now at a3ed4157b7d8 fgraph: Replace fgraph_ret_regs with ftrace_reg=
s
$ grep "CONFIG_HAVE_FUNCTION_GRAPH_RETVAL" . -R
$

Once commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with
ftrace_regs") is applied, grepping for
CONFIG_HAVE_FUNCTION_GRAPH_RETVAL should not have any further use of
that config.

I was looking at linux-next at the time of writing that patch.

Lukas


