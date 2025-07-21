Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AB6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ta1/ZRWHT/l8avUYx5LtTpB/ZV0kiQEs9bubnUIR0Y8=; b=uFbxQ7NrE8RLWyR+FDeZ+GEZM7
	8sBnj9dmpYbKCTx0NZs6FtddJvCJ1i0K2oizQXfVzlm79cQS54sbMaNv0aIBLiYha61jWqCktU0i/
	N6ScXYwWO3CniPsOSsNsHHiv5OO5Tr5pBxfMf5QTM8kInPWhYE2RCMO2dD2190Av4SThatWoETmcJ
	dXoPsozrDsUkJx/pq5oEj/RTE3FIsfmLaj4NmwYgHBRZv0FD9gdZGRlCeCQnbvrU/atkcnVomZKLu
	mDBAamGJsum8OB2/4i3zIZ3pVr5PcRA1rarlQEqHf5aBOb0/bePZiB4SLzlFuA7TJ/IN7qJYU0oBn
	x8+8q5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqYM-0000000HOE2-3r2U;
	Mon, 21 Jul 2025 13:27:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpOc-0000000HE67-2fsd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753100008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ta1/ZRWHT/l8avUYx5LtTpB/ZV0kiQEs9bubnUIR0Y8=;
	b=Zs0eHjqsunGMly63qyJ+wSIS6pk1CCuEAe7Qdqe4jxRwrlXLNJ+yhPkRZfc/ydBztZZpft
	bfx7Ok/8aO05qqYzDY6lp3HevExud97iq7uY7Q/Tf9MwK4R8Ixm0bMx45uwmrIPT2P40sn
	48hIxnt+rOpT2kqpV9OnGh8DryrIWLM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-qrWwy5AtOp2t3mK0UwxGnQ-1; Mon,
 21 Jul 2025 08:13:21 -0400
X-MC-Unique: qrWwy5AtOp2t3mK0UwxGnQ-1
X-Mimecast-MFC-AGG-ID: qrWwy5AtOp2t3mK0UwxGnQ_1753099999
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 68FB318002A0;
	Mon, 21 Jul 2025 12:13:18 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.34.109])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3C45A19560AD;
	Mon, 21 Jul 2025 12:13:03 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 21 Jul 2025 14:12:23 +0200 (CEST)
Date: Mon, 21 Jul 2025 14:12:09 +0200
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
Subject: Re: [PATCH v4 8/8] uprobes: uprobe_warn should use passed task
Message-ID: <20250721121208.GA16561@redhat.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-9-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719043740.4548-9-jeremy.linton@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_051330_747473_FED4B07A 
X-CRM114-Status: GOOD (  10.02  )
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

On 07/18, Jeremy Linton wrote:
>
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -121,7 +121,7 @@ struct xol_area {
>
>  static void uprobe_warn(struct task_struct *t, const char *msg)
>  {
> -	pr_warn("uprobe: %s:%d failed to %s\n", current->comm, current->pid, msg);
> +	pr_warn("uprobe: %s:%d failed to %s\n", t->comm, t->pid, msg);
>  }

Acked-by: Oleg Nesterov <oleg@redhat.com>


