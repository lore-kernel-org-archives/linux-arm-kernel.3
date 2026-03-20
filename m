Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C741099B3A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 19:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPJ27qWkI5c96vhdp37WS6c9O6xFfPoS9NHL0cnjclQ=; b=4uf4mwt47eZod+2eccd8RksWYN
	SX78n7k3i6q86giWdNXa1ZfbyvmW6UDV1AyHY30PcCHYfAG8mBQpoV5Hnc44e3+EeEp85x+qwYoGy
	KfUq2rgWw7ETaRCB0ro3rqYs2lRvO/MDyZhThShvDctGUKJBwerK3YjvnPcCT2/M50+T9/GzLHifT
	ldRQg5x7zNLP3fYG6/fzZycPZ6FCBWU3UtWv2+IEJivyED28XgV/sBfnqG1bsMt5gWTBiLxWc8tf0
	ZCPsS4pfzKrS7wvw0TkyYo0u7l6wXfQ5LFNCbTPuSLhLWmByWYLq/pNPw8vG6MfBJHlewT4Ja148h
	3xgwl7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fc7-0000000DSck-0uGe;
	Fri, 20 Mar 2026 19:34:31 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fc5-0000000DSc3-0GDY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 19:34:30 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-506362ac5f7so8892001cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 12:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1774035267; x=1774640067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPJ27qWkI5c96vhdp37WS6c9O6xFfPoS9NHL0cnjclQ=;
        b=NZRDXPSdKE1JErnmCqTBGS91noxHo8TbmRuD8PSwbvS/4Ua2u/CtsK3N2aGAGh/V4G
         /e7JzcZT1vb779Ju1tPkpzzs9CGXLM93C70S89KmRat7l6Ji1W3M1gHZEngRvDscwwTg
         7rHt6E3WiJL1deAAqm1IqDRNIo0+UjQ6eahakq6fEkqrR8otBOGHw2hjuAJ6QVdSXYuw
         tJ3sYwghkLQnmmBiAULPqO0TzFyPdqmx8iLlxpVQV24s5hU7FXj+OBltRuXhQWduzzxj
         3uYvLPOfujw6Oa/FXLVMqNvLl9YcfGinqSn6DCpTwmRib0NuNf7vS2GiC9a8qPEOwlWy
         IZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774035267; x=1774640067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPJ27qWkI5c96vhdp37WS6c9O6xFfPoS9NHL0cnjclQ=;
        b=ZU0avuo9bHk2TQSaICtYxnotuGgzer7sJu7D61sjwx4mlZmfAdAjCunV13v0TaamBq
         ldcDoswJiSQoh4GRd96EVI55unNt2tm5lxQTVY48BfIWUhxb/y/9v2kO6DD2+TkO42te
         vzqX4vSgINiK7cIwVAcT9jyiF8T3EsDFMxeAEUUHc8KVWV4IoVXrQlVuTexYFpvgmgYZ
         x+5Ec52f8wS3Ngk0ncSrTcBHUcPm5OY7j+Kn2W5H4Mojm5DJxXkJHTfl23/x/epT41Jp
         iBIdP5CUfrApyjpQnTD9A8atyR3IKtIOY9DMwYbt3wHbclfjBpGdXXRi4Qus3RT2NtWK
         jqbg==
X-Forwarded-Encrypted: i=1; AJvYcCV3O8ugpdkuhTd2kLvPH7yR2ojLVTbkA8AUKNRdPO/48O9k260w/Hc/rlYqv6HY3nHRHOLWFTpg02GykqACueSL@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ/slfmtpgBLLnP6xxMSZIFS/bi78Ct6uhS54VytPcPWqIKGcx
	JpjJPV/65swAC/FPIS1gHXvLltdOKGw+E9N8IVoEXneInggAr4RWNQqB2xsJ4gqC3lM=
X-Gm-Gg: ATEYQzzEwJNP+1uuv83E/023i1S1L3W8dCJ66iRbLv7hQ6efXt1SfQwC5wmVGMM/n6E
	kdH9NIjHgWDwkroXatzAGGKlPl4SH/oWAXM5o6NjP5ex0s6X5J+9fhBlBvKvKdsFRr82lO1VEbP
	g2ieBFOW0ag+DgsMnk8/b+OLxxPYcqXpl10oAtA0eUw8/Mn6jvzAtJTv8LS+1DwTdmYg6e09CJQ
	QPYeSg4zRCqLUM35DgToXXcsYtmsug4JqSP/cBuL8SB3hrY4fbMNPcqmwIdlmcDhGUtqmpcLv3F
	2fhuBYSLvMy/0nLKK0oZbRZ3R9VcJbcQ3Sz9/cxWgkRtwhgMFfbffx22J/OYnNtKDfj6NqBxMqq
	rgpOh2HdGF4A/32SPAvuHb0HQiu65SrBXbuqtSvnkug5XyfXuVJsTn25BDEVwqgJaRXJrfVrJls
	Jvvp3E3iwAfYIiK0aEQgyf9xUSyyvqmXctpdXszYoJvJStFJ9G6ckvI4hKjHUeiaaDaRMJAS+3w
	K4yaF3H7A28B81v0PuE
X-Received: by 2002:a05:622a:4512:b0:50b:36e4:a614 with SMTP id d75a77b69052e-50b373ea96dmr54489661cf.6.1774035267172;
        Fri, 20 Mar 2026 12:34:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d23237sm33063701cf.13.2026.03.20.12.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:34:26 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:34:24 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Message-ID: <ab2hQHsCs2MwZqj2@gourry-fedora-PF4VCD3F>
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
 <20260319-config_migration-v1-1-42270124966f@kernel.org>
 <abwVK8nLpSLVcT5G@gourry-fedora-PF4VCD3F>
 <8ebdbdba-d0b5-4887-98e5-bc45f4565d51@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ebdbdba-d0b5-4887-98e5-bc45f4565d51@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_123429_205220_CA5A2EE0 
X-CRM114-Status: GOOD (  16.03  )
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

On Thu, Mar 19, 2026 at 04:34:04PM +0000, Lorenzo Stoakes (Oracle) wrote:
> On Thu, Mar 19, 2026 at 11:24:27AM -0400, Gregory Price wrote:
> > On Thu, Mar 19, 2026 at 09:19:40AM +0100, David Hildenbrand (Arm) wrote:
> > > All architectures that select CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE also
> > > select CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG. So we can just remove
> > > CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE.
> > >
> > > For CONFIG_MIGRATION, make it depend on CONFIG_MEMORY_HOTREMOVE instead,
> > > and make CONFIG_MEMORY_HOTREMOVE select CONFIG_MIGRATION (just like
> > > CONFIG_CMA and CONFIG_COMPACTION already do).
> > >
> > > We'll clean up CONFIG_MIGRATION next.
> > >
> > > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >
> > HOTREMOVE has long been a thorn in my side, I appreciate you cleaning
> > this up.
> 
> That is quite the HOTTAKE young Gregory!
> 
> (It seems my pun crimes are continuing)
> 

:P - it's just more config cruft that always catches me cross-platform
when i poke around in dax and hotplug.  It'll be nice to get less
automated reports from CI lol

~Gregory

