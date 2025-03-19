Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE88CC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwWKRC3nWivzyNEP1S1vISXANNiFB9MsZAJYGEURD2o=; b=BnM2TZGLNztgCf47AXM6Bxefuz
	MEdryTf58zXPTE/L0xwGlA90z1iy8v/6AGlze6OYGo9IbimoEFceKgIv16Yuwh3rUuUfTcMU0ff0o
	Zpofz2mvMnfoBCtQ0v5ZWuEz/srGOBa/ceJ+pm0Eyg6VOWBFchlIhYZYL+7D7wkkJtj0wpSNOKx0p
	rQpRtg122u0COgINAVh7m8jSpFWO/cBpTMALWqyVrk5KWit0zQE14nN9uNAjdk8oF2RWCJK5hxFd0
	uFqY3fDJO3ogZ9sDRZQxEqjH5zkznmjFjbZgVf32K3qUg58FAT3CwRwMIQDGo29aUadnmTOk8jtfF
	v8Jfhkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuutF-00000009Hnt-3M2r;
	Wed, 19 Mar 2025 14:59:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuum4-00000009GIW-2enb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742395923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rwWKRC3nWivzyNEP1S1vISXANNiFB9MsZAJYGEURD2o=;
	b=CrxfOUB9PhzUtQrIKaidBdnJffLx9yXMVoDMIxQDVJhlVa/4ok/4wpQlsAU8JQkNpKlZvh
	bT5a4XGbD81xUP010UMp9sFl0fUiJWShslLDL8HXS2jmp90QleLtnkuPuxmuidps47D9Gw
	d7sUfKCa56Rn3fDzx3w8OgUIKwPlDrM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-y1tPtKyJNL6OPCxZd64RTw-1; Wed,
 19 Mar 2025 10:51:59 -0400
X-MC-Unique: y1tPtKyJNL6OPCxZd64RTw-1
X-Mimecast-MFC-AGG-ID: y1tPtKyJNL6OPCxZd64RTw_1742395916
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A6B71800349;
	Wed, 19 Mar 2025 14:51:56 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.12])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id C5A693001D12;
	Wed, 19 Mar 2025 14:51:46 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 19 Mar 2025 15:51:23 +0100 (CET)
Date: Wed, 19 Mar 2025 15:51:13 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, peterz@infradead.org, acme@kernel.org,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] uprobes: Allow the use of uprobe_warn() in arch code
Message-ID: <20250319145057.GA10753@redhat.com>
References: <20250318204841.373116-1-jeremy.linton@arm.com>
 <20250318204841.373116-7-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318204841.373116-7-jeremy.linton@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_075204_764220_B38D6349 
X-CRM114-Status: GOOD (  12.59  )
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

On 03/18, Jeremy Linton wrote:
>
> --- a/include/linux/uprobes.h
> +++ b/include/linux/uprobes.h
> @@ -185,6 +185,7 @@ struct uprobes_state {
>  };
>  
>  extern void __init uprobes_init(void);
> +extern void uprobe_warn(struct task_struct *t, const char *msg);
>  extern int set_swbp(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long vaddr);
>  extern int set_orig_insn(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long vaddr);
>  extern bool is_swbp_insn(uprobe_opcode_t *insn);
> diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
> index b4ca8898fe17..613c1c76f227 100644
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -118,7 +118,7 @@ struct xol_area {
>  	unsigned long 			vaddr;		/* Page(s) of instruction slots */
>  };
>  
> -static void uprobe_warn(struct task_struct *t, const char *msg)
> +void uprobe_warn(struct task_struct *t, const char *msg)
>  {
>  	pr_warn("uprobe: %s:%d failed to %s\n", current->comm, current->pid, msg);
>  }

Oh, no, please don't.

uprobe_warn() is ugly and needs changes. If nothing else it doesn't even use
its "t" argument.

Oleg.


