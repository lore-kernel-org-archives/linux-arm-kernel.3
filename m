Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9D3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFYj8M8sWUilipZ79moNvoJmNP0x1CtymAnRzXm2Cm0=; b=Lnv48tOKcGDatKhCfRAKDkoKwT
	/+YFjvqoDNaZC60aAM1fmJ45A9Aj0Cjed6hPRkY0twaGLZf+TKSpQzCLpmndsai7DWABGo/B29bcC
	VVb9Fp72aaywwgo+ky0E52cXL8WdnPnTuQz9699u/X2uTrjC23xv+Wwj8fgF1xN+uegRCAjo3bZ9V
	IA7/BK4GSEnKyzBHIPPxTz9t5DBMyBx5NkZcZlMsozfTWptmSAzt8C+oa6CezwxHQxINEcm7/A7IC
	zM7sCCi12TS4NQnmcJjNY8W28pWu/dMjgw2SjDXO95k5qZu89JVk0188gVmlAxWSBgwsQcFYRULe4
	17/0pmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBMN-00000007GQX-1PjF;
	Wed, 12 Feb 2025 11:56:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq5-000000079ji-13s3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GFYj8M8sWUilipZ79moNvoJmNP0x1CtymAnRzXm2Cm0=; b=HVOSwTqb5GpvXYRPQyEAnTmbCV
	o1YAVkaz1uWRMvc2O/2+8gd4L94YdnHWY4U9KUqf8yyNG00fpWU/lg5heICwYgxy9w1TqQT5jVApc
	oOcMW8mze4MOSoYVQ3tWYqXQbRvrjSyQ4REPzDFXCERnxght5CKmHfmU7ynIqU83UuLONRdv1nxtv
	wjn1BxeZf3ikdHU/R8/qwdqOo5jnIfx/F70nyBuNF+MRmkQV0d92SLibbd44rRvEZH9CtjybqEwgz
	0D2VBzpEW3vQaA5R04Z20rkj3pWAd3/cqYTxb8eu4CXRlbEZiKfGY1VEl61uAXLE8dd0wbqsoiO44
	jnC3rXyw==;
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAq2-00000000nq5-1T7r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:32 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30761be8fa8so65769751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359408; x=1739964208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFYj8M8sWUilipZ79moNvoJmNP0x1CtymAnRzXm2Cm0=;
        b=ktTN9v5LAdAXN72fB0g/AALcv88DyCjIaBQ8dGwlh/oWnfY4vP2uhI6epz6ZcnT9nL
         25MgkfkXOO8oPnD+paVR+sXEfLfbJgDizkGXEzmuqvA5OdV643/z8Z/TRolFRydFIYtV
         lyMAE1DkXZnRCCsEeBWYDBDbAzVAW2v1YjjwylYMBebgrWUH38Xbkmt1BLFJJmsnSdw0
         tEox7X1usmwsW42XAsXyEzhQoDPonEI+wgDcHYNFN+AzDVX9Xh+fCdPjUMNPmlfQqZFA
         /Kay4yRk/q1Nq5m+dooMNP9mS24kgdR1sU2Qqck1AyhHDKkf/bSAiR2lhn6U1bK2GRZ4
         hhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359408; x=1739964208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFYj8M8sWUilipZ79moNvoJmNP0x1CtymAnRzXm2Cm0=;
        b=wMYPZhezD+5Kt6eJsEX8ZKG8QXIKicNW0QHxVww3nMYZWA0NsOCKyb7HUzKFSrkpsd
         Q5i3L5s8Jf2sDLf+wPArFH5wVHgUEUA1HFmZDwW47PN5R4w+Aq8NJCWO6icZ40Tx7GVP
         kM3A3uVDU8hvCdlBIA0GZDEDzqDT00hjF3ocgguKXp+EHQ/DVX1JrCzgUWo841gZ6RcY
         diG8uB7zrQdMxFRoujFIU/lJUzOV7BJiSOfacj8X7+H0Lswrn61aMA8Fpcdfqj8y3wsW
         ifiilQ5UVEpuuQCjrWhq5AHz1yX4Wb3uek/FxjKuHIZKUjO7Xs+smbhnf7D98ueEGTnd
         t4yg==
X-Gm-Message-State: AOJu0YzTdQTPj6Oi9a2Go6vWTO0T2Gzvkuu+S/aSJs+/hwwfdRWUOx5w
	WUnse3p6umIwt8iKgwx7GA2oErgN3lG/8habe2krLSJyfNH9mDiSMWXBy1OBlFg=
X-Gm-Gg: ASbGnctHxtKA4Dez+KWBSx7ucy2Tu05WbDDSThkjg9T6ZV9AAiSkBYKZOjqkJ57AmmJ
	tE8OINNMwh7hXIX9Uegu/tG8alYZBBrDu6JsdOSP3TrcQuzwShU7OjBtGIyvSwvyGRC427hbv2x
	ryNUX+YUPXc7+GbhRL5TymIgfEW5xV7nK1qbWMzSv3rF1iJtLVDp50ERPlipXsnz2tObbKpJEf0
	NCtSybQJmgOgKGtggILjiIlQhWZg/oBt2I4erLn8TnSTyrWOrTdzJGdITvZfquxHoSp2obhhNlt
	rcpT5AwMYViRhP5/K2MijZpxOg==
X-Google-Smtp-Source: AGHT+IFtx+JLgvxuRlhMSLR6Ap6cqBlv8BsXuPeR5u4M9sE4qMRSRRT4UspKmtEyZVl6ngpQPtOzZA==
X-Received: by 2002:a2e:be9b:0:b0:307:46f3:4e92 with SMTP id 38308e7fff4ca-309036ea8f1mr13238611fa.32.1739359407816;
        Wed, 12 Feb 2025 03:23:27 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:27 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:15 +0100
Subject: [PATCH v4 21/31] ARM: entry: Do not double-call exit functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-21-a457ff0a61d6@linaro.org>
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
In-Reply-To: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_112330_632766_42C117C8 
X-CRM114-Status: GOOD (  17.46  )
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

This is a semantic change to ret_fast_syscall: if there is no
work pending the function used to jump to ret_to_user, instead
we proceed to return from the syscall.

If we jump to ret_to_user, IRQs are enabled and we call
syscall_exit_to_user_mode a second time; at this point a
this just means a second call to rseq_syscall(), but it
seems wrong and we want syscall_exit_to_user_mode to be called
exactly once.

Apparently the ARM kernel has under some circumstances called
rseq_syscall() twice on the exit to userspace without side effects.

ret_to_user also checks for pending work a second time under
ret_to_user_from_irq, but this isn't even needed any more on
the fast return path: this was needed because the syscall
invocation enabled interrupts when doing syscall tracing, and
all tracing invocation has been moved over to C in earlier
patches.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index ece9215717143427de7572a18a6dbe620a9193e9..33bc9e7c5b32f62474724f1d47f97af24dba53bf 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -49,7 +49,7 @@ ret_fast_syscall:
 	tst	r1, #_TIF_SYSCALL_WORK
 	beq	1f
 
-	b	ret_to_user
+	b	2f
 
 1:	mov	r0, sp				@ 'regs'
 	bl	do_work_pending

-- 
2.48.1


