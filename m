Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB61C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWigdSJtvf2WxMxfGPfKwCzDKILPSKtbmZRomoBqut8=; b=aqXEKBtsOthxDmxm/wxALAGrAG
	hzDWGYzQP9z4GvXwe49tjEtkSzgD9KoYxhi/FdZanv17phPlWsSjkVtuugJC3YvwC0SKVJkn8JGVY
	WggboJ1G1uDd0BbdavEdNoqO1CeFhVVhczgNj1sOvpkIUUH6pUGLABhS4gs//H7VhSoDgeW28nWgK
	1S+HscfyLvvH5uLhxeyjqKaC+fjWJQV98EKz5ENALld1qbpGEZwMUMfMR4+yqtbQ1VdXY7+9zPDCq
	8TcUcrpeLdFp6xZbbHQUwR8CXdqvgJBEtPkxl3cTEj0jR10L6hKPADVVZCaZwVlp3CfyGq2Bzg7Z/
	doi623hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqbb-00000008Vlw-3UgC;
	Wed, 05 Mar 2025 15:24:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqZw-00000008VbI-1Ktg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 15:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741188152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VWigdSJtvf2WxMxfGPfKwCzDKILPSKtbmZRomoBqut8=;
	b=IRAdMvfFOEl1AMPWcGerhtfTYZIiabyvKyXfD9hYPru7LjKBO34bqTMgaAthhh41M99nmr
	ppSATFjJV92uZcwwp0dUNTNwfnz4sQc6kzmkXYdRA9vVpIsxSYqjGVAOc1ALaoHTkcEZ4S
	1VjYak75LeqoEgmp88xZhkrsDpMMOkc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-23qFcZJ4NrSH5Me2lVeGFg-1; Wed,
 05 Mar 2025 10:21:55 -0500
X-MC-Unique: 23qFcZJ4NrSH5Me2lVeGFg-1
X-Mimecast-MFC-AGG-ID: 23qFcZJ4NrSH5Me2lVeGFg_1741188097
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C55451801A07;
	Wed,  5 Mar 2025 15:21:35 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.34.66])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id B2E781800266;
	Wed,  5 Mar 2025 15:21:27 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  5 Mar 2025 16:21:05 +0100 (CET)
Date: Wed, 5 Mar 2025 16:20:55 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: David Hildenbrand <david@redhat.com>,
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v1 0/3] kernel/events/uprobes:
 uprobe_write_opcode() rewrite
Message-ID: <20250305152055.GB28112@redhat.com>
References: <20250304154846.1937958-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304154846.1937958-1-david@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_072240_893326_F4C27BB5 
X-CRM114-Status: GOOD (  12.50  )
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

On 03/04, David Hildenbrand wrote:
>
> Currently, uprobe_write_opcode() implements COW-breaking manually, which is
> really far from ideal.

To say at least ;)

David, thanks for doing this. I'll try to read 3/3 tomorrow, but I don't
think I can really help. Let me repeat, this code was written many years
ago, I forgot everything, and today my understanding of mm/ is very poor.
But I'll try anyway.

> Are there any uprobe tests / benchmarks that are worth running?

All I know about uprobe tests is that bpf people run a lot of tests which
use uprobes.

Andrii, Jiri, what you advise?

Oleg.


