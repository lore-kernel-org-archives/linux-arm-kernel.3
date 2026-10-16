Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB44CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFASAGD5AF0Bh7C2vAG6aEKGzuzewP8dQkUrCHzrXXE=; b=c8D+K4vfxauupVdoUhFR1GkpYV
	8BC2DykeOSkdnTn7cadACFXBOi85kTTA0PqioqbUDKG36hDB2QcyNhjG95ACDxkPSQ87TZm+HykqS
	oOmO8Et7Ilpd9TFG9K5R761U6cmWsdHw4xTbMSSVFL5CHjVQF5SRF0MEQHYLa0qFTs9nVVqpOgPyn
	EScpemndYxRS7VfKsq2UBY/kkicdKZLSvjPXM2wuAxYd+8QrxesS4kndsZ5ix8b0DxyAOudFfnvYT
	a6633SWG/LIADBdCATFSutnbpaGOanVkdyNxKGKzK18fCC9K6gp7VlZ7wWAEO9lywEoqasyjfSYSg
	ZmtWsC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbgl-000000029EF-3qt9;
	Fri, 16 Oct 2026 06:45:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbgi-000000029DP-22pe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 06:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792133105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mFASAGD5AF0Bh7C2vAG6aEKGzuzewP8dQkUrCHzrXXE=;
	b=SyL5v1J4pJndAJrRRFhavqdbZrCfqP1uGTxUlvaSUlV0IM5JhldrLrVAZeYUpdCXGvmxQG
	4X8zNt9NGWg1HLjKt7oy8G0E64DiiLg9rcGR4e+Nu0tI4/606Iq8eC3fXpKFUfAynYlM/B
	MiCume41j3M6DWddHJffO0uN9QstDKk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-_lIkf8fMMaS2vzUgwV6EbQ-1; Fri,
 16 Oct 2026 06:45:01 +0000
X-MC-Unique: _lIkf8fMMaS2vzUgwV6EbQ-1
X-Mimecast-MFC-AGG-ID: _lIkf8fMMaS2vzUgwV6EbQ_1792133100
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D6A81956050;
	Fri, 16 Oct 2026 06:44:59 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 946771956043;
	Fri, 16 Oct 2026 06:44:56 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 16 Oct 2026 08:44:58 +0200 (CEST)
Date: Fri, 16 Oct 2026 08:44:55 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <atHHttWKtnKHJnVQ@redhat.com>
References: <20261016024536.18938-1-zhaogongyi@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20261016024536.18938-1-zhaogongyi@bytedance.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: CFcXceInD1Nwd1oWcYqI2-4h__1zwNvAJf9ywSMrSaA_1792133100
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_234508_602221_289AF31C 
X-CRM114-Status: GOOD (  13.78  )
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

On 10/16, Zhao Gongyi wrote:
>
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -573,9 +573,11 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>  	if (regs->syscallno == NO_SYSCALL)
>  		return;
>  
> -	/* We should only be called when target is in a ptrace stop */
> -	if (WARN_ON_ONCE(!info))
> +	/* Only non-seized group-stops lack siginfo (see do_jobctl_trap()). */
> +	if (!info) {
> +		WARN_ON_ONCE(target->ptrace & PT_SEIZED);
>  		return;
> +	}

Perhaps we can simply remove this WARN_ON_ONCE? 

Oleg.

--- x/arch/arm64/kernel/ptrace.c
+++ x/arch/arm64/kernel/ptrace.c
@@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after
 	if (regs->syscallno == NO_SYSCALL)
 		return;
 
-	/* We should only be called when target is in a ptrace stop */
-	if (WARN_ON_ONCE(!info))
-		return;
-
 	/*
 	 * For compat tasks, orig_r0 is provided directly through GPR index
 	 * 17.
@@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after
 	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
 	 * return value of the system call.
 	 */
-	if ((info->si_code & ~0x80) == SIGTRAP &&
+	if (info && info->si_code == (SIGTRAP | 0x80) &&
 	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
 		return;
 	}


