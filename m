Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AF0C982FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=; b=GgEJWsHG3yQMO93/Q86JQ6HiSB
	itfX5UpLA5iDgHr7jvaCltX18wfZvs/2OOOBc1xU0OQw3Ue6J7RJghsRRrTdsh5B801Nm8lZVLBlf
	/JIGKITJdrITPty5iaES+DgZrqEWcfL1SnXVw5qenjY9IS3JfYS6dbhtPIV/7FjBg5oU70fA4AAhp
	smhsUj3Ros5WTJKlNxpJXLXoZAGkSiawsNOAubM5+etPRl3NzePtr/eSLWpILwkx/0XIMOdfRKoSc
	MQ+TWNMtd50JY0W6p/qZsFvL9NTcDNNiJlHqf8rsvfqIlfUjFpb+JUexg5IznkFAGr//uFeH7wRpH
	mXiI+YgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qKA-00000003zm8-01vW;
	Tue, 22 Sep 2026 02:33:38 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qK6-00000003zl3-10Mm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:33:36 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-52fb76ec504so21701061cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790044413; x=1790649213; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=kFb/FeniBkJam7ArIA3yLs75Yw3ef0XiJU2N2gY7hL9XT6kSAKzd7S/HOmPElXw5EU
         RqJFyRNwP/QOhHVAG3H1x+OSPrO3s4CAAeslMuyO1JEmtr1Q63U8f2ovNwhQ5ERL0UIp
         3UPl42iSHblV2dmmaxm8RUueuY44A1yEgHMBHQSvQ0d6m0PluSQwrffdNwU2dCBF09AG
         moZEGhebGJHjfsaR8LeKza+nwtj1HkD8dNXBSGtv2wK8yC8l8yS+6U572QuaBVcfTgl1
         Ax7UzU9oACmMvIRZM+K4T1LxZ+o+OUBrqkXErvaKnK8k7d/J5TlbQNzEZBv5DoXqwM0p
         BhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044413; x=1790649213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=opxqgSVd/FFH4GwUW5eMRG0+xXkM3r2x3jKuOKHjbjWMKE1/YgR7JR1G7cwHqXgLlS
         5qwkEptPw1gqQqmzT+D05zfrV2JMDylliUrO2hgQFAKhMtH6ra+y5Mi6HV9WtB+juMDN
         QUkiFqdeyEZODe8eAyldYJF+4axE109mzIah7GTpCqTKzg+tK2hFMSJ/VCICY3zFAW8v
         KhyF8cWSk24udsvaVs1F97W/czJWfd5Si/rJhmdK8ByCb1nqVHmHEQCy1CpDexlK8jpk
         g3TpUTrnbxs49jblxGkSdblA6tVD1ozMK+yKoGgkhi1S7lRnu9ahXl3AQQaizkwoeSMb
         5aug==
X-Forwarded-Encrypted: i=1; AKwUvBz9vEyqAHlCFKiovb6XnCCOMvINeuNbEaJaBvzg+K3rT/sJnNXpjGZJI8Fs9H1hBKxuxdUlqJAGWEf28P4Jyef0@lists.infradead.org
X-Gm-Message-State: AFuF++l1/rWRpA6nU7WjCd2f93GL0k/xMzT59CC9beF709ZnA4d3zB5m
	CRPEAuBbXs+upJYWw5v3P17+4qsJZCAegMZNa+6t4GwhbQUQtkw0fsOGsTQaQ59mp1Q=
X-Gm-Gg: AYBFou0Ajnvg36BHon20esY4aPEcFLEu9A6uWAWUQYp+Wcqs/IVCwMxVjA6uIcFTTm8
	P+/Xdxl8/B8Aiqk8pHg9Qd34hJC+jScdjeECYezJlx5kGL5LMQNtYwPwLFX+47sV7fIVybfpLEo
	i62w9+Q/l8v87BRLukCuHvc1VhlwewCStn7BGAj5NTPAoRQkwL3VAlN9/B3U1b6d/8scbmH/d5M
	OCkbPLfRakYAdyivK3MYIYD2ut6LIfC0KilnD2v12lEgpp2TOlSKP7J9nqM7yGtc5Phd91WELev
	GBS9WN0Q4E5TiL9vrbJHSC8vjFq9lsWHoReSdjEQDlCbzsBX3MW3KCPQhZIGPBr+qzwDYOYIsz7
	IB9RdWF6gdkze6Id99iLOkdEHv5YPoz3xdPet0cM5rySxlhp455bgupUDic2kkzjaeRMO6kUju4
	oteVJEr9rp8UAQKDmmx7NRVXsdYHHYP8st5whej1U02RM/KLgMO958vPpaUO3Y/ifLe1u+k6ut0
	nuAhXYzZXdENH1V
X-Received: by 2002:ac8:5a12:0:b0:52d:cda5:abfd with SMTP id d75a77b69052e-532d8e10f9amr37728211cf.38.1790044412692;
        Mon, 21 Sep 2026 19:33:32 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024ee211sm4656006d6.34.2026.09.21.19.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:33:32 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:30 +0000
Subject: [PATCH v5 11/13] rcutorture: Make Tasks RCU readers Tasks Trace
 readers where required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-11-410f57770bad@toxicpanda.com>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 rcu@vger.kernel.org, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043820; l=1716;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=O8YdW4YSHUYyF3GwEQN16WzJM7UkZZFfh8RzVwv7xJM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QN+SSmbqaUDY715i7pHjObQRKDl/n4FuMBV449sPKr77qotFd+q5BWjod9YbtBMN8iSeWuFGbqu
 3faoKTTHOvw4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_193335_618916_26A3B05E 
X-CRM114-Status: GOOD (  14.16  )
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

rcutorture's "tasks" flavor has empty readlock/readunlock hooks because
a classic Tasks RCU reader is simply code that does not block.  Under
CONFIG_TASKS_RCU_TRAMPOLINE_READERS a preemption outside trampoline text
is also a quiescent state, and the thing real readers (trampolines) do
to stay protected across their call-outs is take rcu_read_lock_trace(),
so have the torture readers do the same there.  Otherwise a preempted
torture reader would rightly be treated as quiescent and the test would
report false-positive too-short grace periods.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/rcutorture.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 794937e13e7c..ab870ef09af0 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1142,13 +1142,23 @@ static struct rcu_torture_ops trivial_preempt_ops = {
  * Definitions for RCU-tasks torture testing.
  */
 
+/*
+ * A classic Tasks RCU reader is any stretch of kernel code that does not
+ * voluntarily block.  With CONFIG_TASKS_RCU_TRAMPOLINE_READERS a preemption
+ * outside trampoline text also ends it, and what a trampoline does to stay
+ * protected across its call-out is take a Tasks Trace reader, so model that.
+ */
 static int tasks_torture_read_lock(void)
 {
+	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
+		rcu_read_lock_trace();
 	return 0;
 }
 
 static void tasks_torture_read_unlock(int idx)
 {
+	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
+		rcu_read_unlock_trace();
 }
 
 static void rcu_tasks_torture_deferred_free(struct rcu_torture *p)

-- 
2.55.0


