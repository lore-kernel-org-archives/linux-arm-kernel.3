Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CB1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7S8yd6R0h6QkbjSSTjEPq0BtEAD/xvKVvoWKNDxzjI=; b=JLveFmuPiOu2OLDP4tIv72/n9P
	vBWzetQJ26tZP1x9FDJMbwbNE8dRkG7wbCapt0wl224OD0FLtqWCgJWM2M1rs/c6ekGM3V/sJUOY2
	suVcfApVzpifL2QTbRlaCbBxEn2JCmVUqBgky/XiFHAN8v6YjrozAgTwnV16H1jEYbTbfapbCtoEm
	ZnTgKteW7EUmOhObck8fzdEhme+9f+mhlZFqcPh0OLQ+CVZ0ZBwcnNTa3hR1KIkOqW8mj6ia95I6a
	vQx5mOYQqxVy35vgXwwVN7pq658lM8UV/OuErntIyXZ6re5gOVEzgbS/mE5DhgdPlFpcEWy/UylgD
	+qKaNlIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trggR-00000003T5l-4AEw;
	Mon, 10 Mar 2025 17:12:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgY1-00000003RCV-0wD2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 17:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741626251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d7S8yd6R0h6QkbjSSTjEPq0BtEAD/xvKVvoWKNDxzjI=;
	b=UI0l+O5ehc38NNBR0puKp4TKnmZ2om4xOQML+H3FVI7EzZBYLEjoZ+thsTynl3BVP7y+91
	yaKy4KG1zNNWBrG/tGRntFncsYXLz/3PePkPbc/RYvSz73MQrDBYJgzy33gvEsW5a/9Ki/
	qaLwTRKz3LF9issEZKhTsA5nOYhxSt0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-550-qcA6nO9WNJ6cidPgFWXLFQ-1; Mon,
 10 Mar 2025 13:04:08 -0400
X-MC-Unique: qcA6nO9WNJ6cidPgFWXLFQ-1
X-Mimecast-MFC-AGG-ID: qcA6nO9WNJ6cidPgFWXLFQ_1741626245
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3444E1800349;
	Mon, 10 Mar 2025 17:04:03 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.34])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 310AD1956094;
	Mon, 10 Mar 2025 17:03:53 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 10 Mar 2025 18:03:32 +0100 (CET)
Date: Mon, 10 Mar 2025 18:03:21 +0100
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
Message-ID: <20250310170320.GC26382@redhat.com>
References: <20250304154846.1937958-1-david@redhat.com>
 <20250304154846.1937958-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304154846.1937958-4-david@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_100413_341857_266CD7C2 
X-CRM114-Status: GOOD (  18.33  )
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
> uprobe_write_opcode() does some pretty low-level things that really, it
> shouldn't be doing:

Agreed. Thanks again for doing this.

David, as I said, I can't review. I don't understand this mm/folio magic
with or without your changes.

However. With your changes the code looks "better" and more understandable
to me. So I'd vote for your patches even if I can't ack them.

But I'd like to ask some stupid (no, really) questions.
__uprobe_write_opcode() does:

	/* We're done if we don't find an anonymous folio when unregistering. */
	if (!folio_test_anon(folio))
		return is_register ? -EFAULT : 0;

Yes, but we do not expect !folio_test_anon() if register == true, right?
See also below.

	/* Verify that the page content is still as expected. */
	if (verify_opcode(fw->page, opcode_vaddr, &opcode) <= 0) {
		set_pte_at(vma->vm_mm, vaddr, fw->ptep, fw->pte);
		return -EAGAIN;
	}

The caller, uprobe_write_opcode(), has already called verify_opcode(),
why do we need to re-check?

But whatever reason we have. Can we change uprobe_write_opcode() to
"delay" put_page() and instead of

	/* Walk the page tables again, to perform the actual update. */
	folio = folio_walk_start(&fw, vma, vaddr, 0);
	if (folio) {
		ret = __uprobe_write_opcode(vma, &fw, folio, opcode_vaddr,
					    opcode);
		folio_walk_end(&fw, vma);
	} else {
		ret = -EAGAIN;
	}

do something like

	/* Walk the page tables again, to perform the actual update. */
	ret = -EAGAIN;
	folio = folio_walk_start(&fw, vma, vaddr, 0);
	if (folio) {
		if (fw.page == page) {
			WARN_ON(is_register && !folio_test_anon(folio));
			ret = __uprobe_write_opcode(vma, &fw, folio, opcode_vaddr,
					            opcode);
		}
		folio_walk_end(&fw, vma);
	}

?

Once again, I am not trying to review. I am trying to understand the
basics of your code.

Thanks,

Oleg.


