Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB8CC35FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 12:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqwTqw0LkuMJVhI7nUbav86stM0t9airgBDOJOw1FA0=; b=1EG0M3AekscPTyOa53WqdmbFNI
	vDSPk2VRSnX4ZoQgZgS1fG7U6cSQfMcASu/YJeGSfEB7mLjGNwwNzC9ncLwRKpVdY7KRoKiyLTjme
	u+N551nBDcSqvviB3ezGnkr/epLRd48ty+c48ugaNmJnfAcQI1dBfOe5EHSueNY/2ZPm35HfWZuNF
	3vyYY0wtL3irHtNI+bHbS+NLe9XZpMCsR1CGvZI8wkJ0dHE6zHuJw421mAG0gAb/QcFY9XnVMsqCi
	VX8taryaoJPqNCXeUwCvfGH03nr4r+l3xR8Hhh/GktxTdYTYyLheDfBdUG8WgWe+pIpHWhRvEzuxf
	Q7uYRw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tus96-00000008ugV-0o8L;
	Wed, 19 Mar 2025 12:03:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tus6u-00000008uJi-3Tzc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 12:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742385683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YqwTqw0LkuMJVhI7nUbav86stM0t9airgBDOJOw1FA0=;
	b=NXDvWyI0NARvPK45AQ/FkuKuh3DzupTfbcVNO/Gf0hf+YU1Isy3A5KtVv+DMJ7eMdLWsZU
	dyQ/v1+ht5taOjPQpaCiUliwLjdYMzWdnQeSKuVTn8bTnlgZye78O4V9wniMOpaxB3S5cs
	I3glfQyoVd7uHu1ISRt0pYxKsg28vjQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-Ep91YsP_MAa5nA-2OQLbTA-1; Wed,
 19 Mar 2025 08:01:16 -0400
X-MC-Unique: Ep91YsP_MAa5nA-2OQLbTA-1
X-Mimecast-MFC-AGG-ID: Ep91YsP_MAa5nA-2OQLbTA_1742385673
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC50F180AF69;
	Wed, 19 Mar 2025 12:01:11 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.12])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 5D85E1801751;
	Wed, 19 Mar 2025 12:01:02 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 19 Mar 2025 13:00:39 +0100 (CET)
Date: Wed, 19 Mar 2025 13:00:29 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
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
Subject: Re: [PATCH v2 3/3] kernel/events/uprobes: uprobe_write_opcode()
 rewrite
Message-ID: <20250319120028.GA26879@redhat.com>
References: <20250318221457.3055598-1-david@redhat.com>
 <20250318221457.3055598-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318221457.3055598-4-david@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_050124_941326_79E29687 
X-CRM114-Status: GOOD (  11.80  )
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

On 03/18, David Hildenbrand wrote:
>
> +	if (unlikely(!folio_test_anon(folio))) {
> +		VM_WARN_ON_ONCE(is_register);
> +		goto out;
> +	}

Don't we need folio_put() before "goto out" ?

Other than that, for this series:

Acked-by: Oleg Nesterov <oleg@redhat.com>


