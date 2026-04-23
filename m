Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD2AFDEE42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMwWOP325Y+FxEfz24yq10d2Rgb+6ewllZMkA6avH7k=; b=zdjT5kqVhjV+QUNb/ez1XFKJms
	x8AoPSDzQXGVTSfLpsI8ct99LHq25o6B8QuFGWfxldep7AlwENZa3jjbpXaEm/QgBGfJ28KFKqp5N
	Jrkl7hsO055e7rWV2Fg3Hs/x2vJ8VzEiyrQfyYCzrp81fba7J4h/yb3lCOALQOgprktMXTemlgksz
	ycf6ZJaF99HtrY3ZbyAPMGZz4gT25ocz+iiGQ322VPQ0U/Xgmf5I09Et+BkonT9gMTay4BuTCC0t4
	gpZKFT7SJ1jcK+eFsJh0MZIZlgZxSj8ixnhRXJDvtiHd8DQUvJe6P5GmeAqUspO2/jA5aALW6h5QI
	wvFq2uAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyuP-0000000C85A-0Re5;
	Thu, 23 Apr 2026 18:36:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyuM-0000000C84O-3h8K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 18:36:16 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ba699316b42so831485966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 11:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776969373; cv=none;
        d=google.com; s=arc-20240605;
        b=Qn0NHZNEcOH2pEMuMDUTPg+OeHJFmZCt728ID16/fao4+DanaXzXzAdMd0WjP13y9M
         UebiFTjUuU4AO6x762d7eFQ+ClIFJw0xSxhTFV2Z88nbvuncwnPGEFbEuDsXrsY7PCO1
         qF2zQ9H/YC+EwW5asnx+XdSoyaClz3tQKBUr5yW4L55MjkZdyOV7MWCL4lAm2rhPOmpn
         4Dt9jCR18G69TgUoiwWoE46gN/4WBDXvnVHeuTVyoWKZ1O2jB1S482c/c4yc8aBFwkTu
         eVPvIqAM91MHd1b4rs2HjDJqlosxO4Uq2ZsOkg4VXWdj0/869qiw9Hnc+OlyrikZ3Ud1
         Vkvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lMwWOP325Y+FxEfz24yq10d2Rgb+6ewllZMkA6avH7k=;
        fh=Gd1gzzch3XlASkOSzv5ri0GDRUgz+3iSW7SLJL7K3ss=;
        b=bERltjnW0JFqV8c3qN19dByP6g/4+vzoKpuIpvDm5PT3TU9HQwpGPwJmXrA5mpmj8g
         1hMrT6BEhBB4t/YX8spwEn9kJuJUS+V2K87a4IMKWQRoYmlSDqWVPt5m9M4r41f0Cl14
         m84oxwEEzrY0EdiAZH+F+b7k2Jej22vg+BXAxsC4fwNZW1/LzLTcmEWsB1v1jgWR2it3
         sBYOrW8rqpJ5ADapDoXOB896cKNvPzBS2itqHP5rCmdSUJfCBYBsHMwdCIH7CWszXrXG
         7RSCrtCwVOSa0efRf72mY5Di1EWyy80U8TxINbiULnjBpSuw/LMEFWHS9Qm85lHR9dOA
         Fbww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1776969373; x=1777574173; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMwWOP325Y+FxEfz24yq10d2Rgb+6ewllZMkA6avH7k=;
        b=MvNTHq16LePGTaJEfXH0h8Ot5HKXxnwkA82SbFrHad28YOxYh9iqZBbq+NUPMXFzDr
         0Q3xNpweSH5bvcNMwk5RQmxCNILs9OREnOI0Wsw+QBiUb8g8m15vZNRNWFGJ+tIxRwd9
         tHLyRqxXTx3jRk4nGx9h3rCMf0A+3gBZiYkSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969373; x=1777574173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lMwWOP325Y+FxEfz24yq10d2Rgb+6ewllZMkA6avH7k=;
        b=gVXERdj2XfGZx0WqofW+geVTVQCMhOphpYhD3ckXJtaAaNYhiBfa9nftdDjeTVeDYe
         M8r/mJlt9tHlXxvNqtTKewbcRg+zPoye3AoDxG51DtnyOACAqCn2ff452EE9525lECh5
         Q9OLDKKi4SMa6plOEpaJc9Tqag+vCmz44cS9ngjMpXjYkHD0ZJyikvwlx55Qzr7mxuVI
         YuoF3Zf1Xeg016cxNFY06pBrIaHKJ5t05dOzIrmd4Mfl/24Mh7N6fd8QlWemDhZXly7m
         j6vSy8T8zEd9bn0i99+gg4P3Cd3GTY4zOcTwZ/88EB8OxxfpMM4W39QWoMCCXYyXpolO
         RtVw==
X-Forwarded-Encrypted: i=1; AFNElJ8c7aGeIChjhkpVdjbsPVKNUJrGE47QN9IIDpaDDdPE0dOqOcmJZ/y3qEfcJ9EIILDeH1xtgiCvNM3aACX5ARdz@lists.infradead.org
X-Gm-Message-State: AOJu0YymyeWpdhDfCnCNFXBoROp14UyHd501XBpbTboLe41KF3eJdIcY
	twurfxSYXMmMBlX6nEp2rhvtkW/DaVrdqI1D4zIumgURONt8WbFm4KxlnOJveb56OwarG1lkKOx
	lUlFauyU34WzZ4b3TGkDZNGdptmYe0AgPWLNvgFDRFg==
X-Gm-Gg: AeBDievu6opOmsabgpoWFgYeIoh6WO4a1FipXO3Q/N99h612dH/3yreQYoItGbuvdOD
	qTBNwnznnmiT2VN2TwtFmSqAv68BYhd/FGKBi0UJIYf34yAH4O4+WlH8mEgTBzDw5gfxiqLG3+z
	1jnI0OMPqSmDGb43BooUDl1loQ9KnQdBV992WZP/J0PN1gW5ze46a+C9zxRGRlpbKt3yRR3B5IM
	vzz0fCxZRoUcvJwF7E397fmE2GtO9qfd8VDreTeOfdiDlqsiFCCSMilmxyxphIeXxPUawbdFfxZ
	7eiHxEawNQCSlCstuJCTvc68xp/pz26JQyWQ
X-Received: by 2002:a17:907:6d15:b0:b98:411a:116f with SMTP id
 a640c23a62f3a-ba419076c8emr1456311466b.2.1776969372808; Thu, 23 Apr 2026
 11:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx> <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx> <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
From: Mathias Stearn <mathias@mongodb.com>
Date: Thu, 23 Apr 2026 20:35:45 +0200
X-Gm-Features: AQROBzCU44qvM2n7u3bSSfOCODS7CRqJgwCnCmHvHQ6YyNUA9ZKN2DS8mq-0h7g
Message-ID: <CAHnCjA3aR1hLYK3DsXZV5AaLWe56+zLOS8ffpAMv9TBEkT-3nA@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_113615_065513_8BA26C1E 
X-CRM114-Status: GOOD (  13.01  )
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

On Thu, Apr 23, 2026 at 7:48=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> I see some patches flying around, but am not clear on whether there
> was an actual patch that make this work again?

Thomas's patch from upthread appears in initial testing to address the
arm64 preemption breakage. Thanks! I'm currently building with the
following patch on top of that and will test it once it is ready.

---

diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index a36b472627de..e26bf249bbd8 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -300,12 +300,15 @@ rseq_update_user_cs(struct task_struct *t,
struct pt_regs *regs, unsigned long c

         /* Invalidate the critical section */
         unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
+        /* TCMalloc kludge - it relies on cpu_id_start being overwritten *=
/
+        unsafe_put_user((u32)task_cpu(t),
&t->rseq.usrptr->cpu_id_start, efault);
         /* Update the instruction pointer */
         instruction_pointer_set(regs, (unsigned long)abort_ip);
         rseq_stat_inc(rseq_stats.fixup);
         break;
     clear:
         unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
+        unsafe_put_user((u32)task_cpu(t),
&t->rseq.usrptr->cpu_id_start, efault);
         rseq_stat_inc(rseq_stats.clear);
         abort_ip =3D 0ULL;
     }

