Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F45BC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6GhpCA04E6QTSI5LAm+dZeokUjWkWd+Hrusbi/KL2E=; b=waGBmKw4rbN1am8iSwNOFHYDPp
	0ntm0PgGNxcpD9XPpaq/DMpOhQ9MAWZE9aD4MDABDsuXsBob5YRE/SAbL1mpf+2LXoPBlvJ6MHMVM
	3LopvZyM8ecb0JN0zUxCAeb7v2PM5VVLU3J0AHNO88aJaW2ttwOpJilF1YZNqHLVaLwkC6IOvl7ph
	mtJ4P5+CfVpXXq7hVikO97l76L1z2Cvmr8Fun/dgHUT+mFZBUB7O1S2PFb2xyzvpFX0JM65RzcjFM
	3iTQHc2b2O0k6Ooqmv3ROtQs+kVN+ULaBNlEDW7XJvf5siWB/a7506bA3gIQ/5ESD7CGuO8HScR61
	4tFJ7qrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yA0-0000000GX2E-0mH8;
	Sat, 19 Sep 2026 16:43:32 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7y9x-0000000GX1v-28LQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 16:43:30 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485ac898fa4so1473421f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789836208; x=1790441008; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6GhpCA04E6QTSI5LAm+dZeokUjWkWd+Hrusbi/KL2E=;
        b=X5pT0RDyfGaMSS0UiDg2+BGb6Y+bE9ARQzBuyKDVyJpH9Q7cC+kpmpm8mQUdXp1ql8
         mQHaRDQj/GsHMDyinmqh83tiPygpGvB1q96JOgOmfZCUK3iu+Iwr+3CLWeM8gclnJDL7
         3E36K2I7xadeBtS9NIYRQmw0s76APi0QMPxXdbAFNGqgUsNgiwOQ6LQhiW24J/c8bRbW
         gttsEvcGiWb7gwiZdlySLarFKf4oQIeCWcZkP2iV9b+vZPEgQO7ZrUMKS7sEATCdIJX4
         JSOoc3z6qxp01vRxNYVLi64Xdu0+FfNrDawPT4A6+e54xEYn4rXzOq/SMTWmlRmeucZT
         BFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789836208; x=1790441008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6GhpCA04E6QTSI5LAm+dZeokUjWkWd+Hrusbi/KL2E=;
        b=HPF9Tb8Vru6kXjggo6cnLCVjZyQwXiqWRqpOLAZ0EgnJUw6s5thmBO4r5SUdMlMMSO
         5WaDWY6Z2cCD0NZaBkwqSp4cqpMjI8URVdB+EwhwkpBvRizdOJ4cNaq1vqLXWFKDmvFS
         6ZfaKNU26k14BK2ahAmRHiVfXlW2Q/f3GOccjztgdjgiTK78lf2xvcpu8pvcTIpeDUmm
         /jMGs7tUUElQCAb8l1TjQxJNt7a6nT8aQqVKMIfhI3XnEIkNkZAosp5cSciQYatBx7af
         bWcPRSFfJSO0anNkc5Ib2RlzrNfsL7tkqVHL4QJjBjVYcN+9GYggETzhvaY4fWWDuwt3
         WJ5w==
X-Forwarded-Encrypted: i=1; AKwUvBzr3pUf6/kjPtFxomWLb3skh6xjCFF4ChFvFf++Qdbl0w74mT5Ft+8jPgfwsk4KDqgF0amMzr3OjcpE77J+YH2i@lists.infradead.org
X-Gm-Message-State: AFuF++l+6BlP/yIXEJFJjSD9bHfUBLu3I4W7na+slx2lSLzvum98C3dr
	JSyKujaw0TO5/6bmnl3nDEHOJRXlsUvmYbtS7OGcY655b4fniarIrymR436qBFZe
X-Gm-Gg: AYBFou2SqpShdUW+4s4AxCejrTzdXa5SvyOhyQQZo2mZHi5KnGosw8xnviRkBUF5AjV
	QtLVlv+v/a51QTaa/PQ8o5Msx1UpldDQDCzDWhlGo297piZbgxW0wH7vxOZuFyJdJBlpDRYS699
	iHftBdlZO3BxXiG6zabvM6NF67VWyhxU0z9xvDH/f24oi4+uOUuJnWAq4Imo4K7vVRFG5VzAPvn
	yPcqaGx6fS3eeRr7RzwiGeTDRHxKed/UsvP2Cis704I7u7B4WwvLiODeDxwzKgB1lb3oxLZ1reT
	dWv33IoxlnPlG9J/Crem8qI59sHjNJTw+ypQ6MuIQiSEISkw1p2yNnsmN7dhvDOEpcmHTC/G1z+
	sBHwPytLUh6Oka5S923r0y2ohHXsoCdfUWzQlEtyzR8ZWWv78L70/0zq0W4iP/J2yuxeqTkPUpZ
	7QJZQ8i1x/Mz3MAhuK97f8ztkNJ0wEpIEyF/G80RVZESOrO9mWMh1RlqCscG8QPCE30cRz9sQAR
	F6jK1j2dsO5BTwbCmDG7/xLzUPfeXZNpfJUdQpZ8u92/uSJlOgXVEIGRSCBUUaZANixFhZVGC4N
	SZQTK1HoaMLfNsuzJTT/O9WLsUIckvaNU2k7abtmxycLydGjqTHP8uK7N0hZyRpAyhcKtKlyJBJ
	QNyd0QKpMoW3aF600lU6qdA415g==
X-Received: by 2002:a5d:5f4c:0:b0:485:8c16:a32d with SMTP id ffacd0b85a97d-4871e2665f5mr8262903f8f.34.1789836207559;
        Sat, 19 Sep 2026 09:43:27 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460978sm7990040f8f.11.2026.09.19.09.43.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 09:43:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 02/14] arm64: ptrace: Rework audit_syscall_entry()
Date: Sat, 19 Sep 2026 18:43:19 +0200
Message-Id: <20260919164319.90193-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260902095537.602517-3-ruanjinjie@huawei.com>
References: <20260902095537.602517-1-ruanjinjie@huawei.com> <20260902095537.602517-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_094329_563171_B6D26402 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

> +	if (unlikely(audit_context()))
> +		syscall_enter_audit(regs);

With arm64 defconfig and CONFIG_AUDIT=n on v7.3-rc1, building
arch/arm64/kernel/ptrace.o after this patch fails with GCC 15.2.0:

arch/arm64/kernel/ptrace.c: In function ‘syscall_trace_enter’:
arch/arm64/kernel/ptrace.c:2491:17: error: implicit declaration of function ‘syscall_enter_audit’ [-Wimplicit-function-declaration]
 2491 |                 syscall_enter_audit(regs);
      |                 ^~~~~~~~~~~~~~~~~~~

The helper is defined only under CONFIG_AUDITSYSCALL, but this call
remains when auditing is disabled. The audit_context() check does not
avoid the missing declaration.

Could the helper get an audit-disabled stub, or could this call be
guarded as well?

The same object builds after patches 1 and 13. Patch 12 still fails
with the missing declaration. Patch 13 removes the affected code, but
the intermediate commits should remain buildable.

Thanks,
Karl

