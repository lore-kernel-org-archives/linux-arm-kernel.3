Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3685EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 12:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=palKyBcsgnYyLT7TccByqHvOUnQeIY6hqkQdRDklSI4=; b=U49nDOltW11Z+qzoRuuzeIjxrG
	kTiql2uEwvN9PWrX+qcVxe7TlU7Rj/k2kqpfGbVIZwN+f4V6N7y+V1jccUaemLWLkQIikbcK0eHHd
	6pWdhCO99ej5tKgSQqFFYNgsmEppcznuf3aZZBnbUH55RIWXe1D0nOXZ0xOYzJVtzkdSKBMs3ejmQ
	9JE/IdMTMURxXsdfOCrHXh2c0XZz0Y+pSdOEZbehbYbeD9rUPlcigcbeGx61RBJ0+bzIiOlnDyzQT
	I5L01eIRD9RPzIAdsAdJhck25t8oWgSGozLgZCLsISRflb+Gs74uhIkNefhtwgYR4OAcBjtDI0kGr
	LHj2kY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trz3c-00000005jmJ-44rH;
	Tue, 11 Mar 2025 12:50:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryna-00000005fAY-2ouB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 12:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741696409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=palKyBcsgnYyLT7TccByqHvOUnQeIY6hqkQdRDklSI4=;
	b=P2W6bMNv/LRqxn4GYSJk0Lt+DWLBKxRHr+YrokdpSqN6lrslp9V4aiZdMLb/PTDcP5Cqyi
	ClioTEM3TBmMaGLwjEMoVC6NkTCTu5d030h2Kps3O8aJTln9UzmJLVKl62fq8te8yHzoDf
	AtBq7XYjt12tl7ue+0nY8ihmgGc36LM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-hD9d9DKnN-OKC5JK0gX1hQ-1; Tue,
 11 Mar 2025 08:33:26 -0400
X-MC-Unique: hD9d9DKnN-OKC5JK0gX1hQ-1
X-Mimecast-MFC-AGG-ID: hD9d9DKnN-OKC5JK0gX1hQ_1741696404
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D7D2C180AF5E;
	Tue, 11 Mar 2025 12:33:22 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.22.90.58])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 5616F180094A;
	Tue, 11 Mar 2025 12:33:14 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 11 Mar 2025 13:32:51 +0100 (CET)
Date: Tue, 11 Mar 2025 13:32:42 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: David Hildenbrand <david@redhat.com>
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
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v1 3/3] kernel/events/uprobes:
 uprobe_write_opcode() rewrite
Message-ID: <20250311123241.GB3493@redhat.com>
References: <20250304154846.1937958-1-david@redhat.com>
 <20250304154846.1937958-4-david@redhat.com>
 <20250310170320.GC26382@redhat.com>
 <79ec5aa9-1937-436e-8cf4-436746142f7b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79ec5aa9-1937-436e-8cf4-436746142f7b@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_053330_787415_9EB86453 
X-CRM114-Status: GOOD (  16.42  )
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

On 03/11, David Hildenbrand wrote:
>
> Regarding both questions, the code is fairly racy. Nothing would stop user
> space from (a) modifying that memory

Yes, but we don't really care. uprobes.c assumes that user-space won't play
with the probed memory.

Note that if is_register is false, then vma can be even writable. Hmm, why?
Perhaps valid_vma() should ignore is_register and nack VM_MAYWRITE ? But
this doesn't really matter, say, gdb can change this memory anyway. Again,
we don't really care.

> >do something like
> >
> >	/* Walk the page tables again, to perform the actual update. */
> >	ret = -EAGAIN;
> >	folio = folio_walk_start(&fw, vma, vaddr, 0);
> >	if (folio) {
> >		if (fw.page == page) {
> >			WARN_ON(is_register && !folio_test_anon(folio));
>
> Yes, that would work (we could leave the WARN_ON in __uprobe_write_opcode),
> but I am not sure if the end result is better better. No strong opinion on
> the details though.

Will, this way __uprobe_write_opcode() will look a little bit simpler...

But I won't insist, please do what you think is better.

Oleg.


