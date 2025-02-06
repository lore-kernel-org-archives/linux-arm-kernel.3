Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E34C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/27xKgFdSZVO2eLH/O6emznfiz3pieZcJIn5kKU89M=; b=m7kghJbtdWSHtWqWybnZY3Ied4
	IP+KhTtwca+rnJWTKOj1/h5lZimbkCh+XC1lSpvnn2B754kW4qUP6MFK2g3cQfmhaAt8syN1XG0D5
	2//J02OGEX0A4rDmdAc9qsI8JBoGGOnXqSjPmfaDsZsLkgi8Ly/URxgnE7RpKPS0ssLtowxhI3B89
	CiC6Vv9Nq3KGKR+wTGZzKT1hA9t2bDqEDXr4iaboZzDt/4jDDOnrlriX/Eh82hF0BsZe6ztjW002w
	o0ZLqnTHmxy7rRRUkNXFxmb9b6TVNmV6wG54rvM1Z4jIldaltRlG10ykodx3SjQFbbOf5kuC/bBzw
	fNjprSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzth-000000066bo-1nq6;
	Thu, 06 Feb 2025 11:18:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXD-000000061eX-1Otc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v/27xKgFdSZVO2eLH/O6emznfiz3pieZcJIn5kKU89M=; b=Cd8pCtJR6U/ErwhjOfME6WzHHm
	lanAsMKTl3z6vpIMzmFFOTp6JzgDari7TY4NGv1sxk11ripZtltzmzJ6330Yq5gCvJHKvd5MFJNmm
	ZUde7poITb+W8hY/jNMDiUBX/9hzSZTCYAOHYpV5hvJxwg9rYRE1SdXImI8QRSmkWOJe9PRpMi95A
	v6jAgrQiOm6EUJRvs6/UoZV31SCQ2T1Q8PGSJlmnXhg7GV1OD7du6cG/xXAZP9m/iyFcjNmpaWAZT
	v+1fczdKB7J/s8H+1jfWnVPaTQGhF+nG9Iabb3/1lSa01zBWx01nIKe9+CDR+8pNtPnibC/NBctHi
	6S8h9w9g==;
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXA-0000000Guvd-2Hov
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:02 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-38db909acc9so526718f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839299; x=1739444099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/27xKgFdSZVO2eLH/O6emznfiz3pieZcJIn5kKU89M=;
        b=AinvnRupGrKx4oB0wU4PO7xRzKfKw4owO6INxizPHU1lp8OrlkP1G4GYfWIbRpjed5
         U4e29hMHKIjtUQUGfDRWgog/lAeXTvDJ4j21PPP+XKfRQ4YX8HHdQQoBJzC1OMxFGsB9
         20JuyUhyiwXrxpRGyqxzE0LHvXLgt1zsYXo8M1of4OfDpkwMgMI5gQ4PxCCQUYJGaMzS
         LL+C4FDcEMlqTQ02aMgTWWxy4MVd2GE1bZmSh+WpFY95aHgVa+cMmo8FcYemWqQEpy6K
         YPEAfmc05lCQZsuDCKQ7IJJmcCuDHIr7GwODVPZ86CXtg/zcOrhLrCEkSjifcfQAPKe3
         JLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839299; x=1739444099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/27xKgFdSZVO2eLH/O6emznfiz3pieZcJIn5kKU89M=;
        b=a8U4kaGBWQognzjx7Obo+USgkPe3t+NY/XbykQRY7K5HVAhtw57jFKp9qiFcP0H5HO
         +PGp3KbdywsxASdIiGD0fLp/maAb8UHs/ewXazaEuACeQ3FCVvaFILq+EjBQ13I0MtQL
         6tO9sobVC/19dfgVOT7GReHmDcPwyvGydux9kgPBX1rnvq9kuOB2ir6C3+ekBD67yQE6
         +m0F1VyuRl352zUl4hWUNiQpOZj7sTISJU6/2GEJZvLxc6gb4Zj1GTzpknrH6Q9asxXq
         /QVynHFfQ5IYyOcaBAFjC0Dzv6Cvy8v1ZrZmLAXRxWWvtLhSFbyThx5E70hp+Ix26QGK
         rRiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV+nTpP4Uojf7r92Cdew0HK3//mva4lYf9rl6sTRd7vzgMs5KpW3W6HKpFnDQSj7W7HZpL1dMYvlyaURTnpOep@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6xbT1PWmKsqhVV31AP5dWMvm7zKsNW+ejcK8ONSyg4/uZ0akJ
	MKSam8NNO4V0lb7mgSdB+iL2bBHHUvkU082IhRS/mdjXTeE7uo++
X-Gm-Gg: ASbGnctkl7ep0fHzoPAxrElkgJ5lDO5IDYE4vSCYUg/Qb3dOo0+xvSTx9Eji/ApWvTf
	4n7w7P63j/FDvqxyZydDfTC95++JzKCqa3zUDuCNLM5zg+3fJnPbfoxcYhHrg+ym7fX9bxz9IER
	mi4gMVl4eD7i5//+2a+kXcIKgwwma+QX7i1Bzm6deLoUAFvlgcLxnfBlLI5q6gPzs8tJbZool9Y
	kXhUxNgc6OIIQyfQFyKYCuH1UojnU02+2VQqBFdzojG7WRMKRbwdBzfaHAuvDwgrMdPi7e1+9up
	ZGgB
X-Google-Smtp-Source: AGHT+IEaxBrKjdya80s5GTFvJ53ssNGQMjtcN2JFoVjdVKyNSB8TPhmiwUVzhaT6kIG4/mzrT4zfQg==
X-Received: by 2002:adf:f9ce:0:b0:386:3835:9fec with SMTP id ffacd0b85a97d-38db492a155mr4449175f8f.44.1738839299377;
        Thu, 06 Feb 2025 02:54:59 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:4::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdc30fbbsm1419486f8f.0.2025.02.06.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:58 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 16/26] rqspinlock: Add locktorture support
Date: Thu,  6 Feb 2025 02:54:24 -0800
Message-ID: <20250206105435.2159977-17-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978; h=from:subject; bh=lkeMxyDGnEWVT4+0Paf/jS31tLo0YsbXyTnTYAfMTz8=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRmHQ2YyiZ2nANvO6JQtZoHC62f1PKXDNjawAxK mKA8GLiJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZgAKCRBM4MiGSL8RyjR0D/ 9UxpQJ303fRMoYR6fqKrESf9af9KoWduUW16ytQ8cl8LUmJvwPsQA2RBgUKdWqIjIitbNFRK0ahuL2 G3ZxiZ7lVlv6kVhyOprX9Rp9/1KXJb9AssTbXNvRGsblLw0VJWdbOxKA4CzRsqXHpyhAZw+crjWaAi e76bz8XD/UpVFVgPBoDM6XHvEU2CQz9W0Mujyrr8fIKId/Ly9v+BzlYwvJ5Dwiq0pKOjO1wJSs2GSe xJNqUgPJbtFFLsbyNGsWDMGgSm+PQL9V4lY/frjPS48Pxdu+urR1lOEEV933OLvUjCojgSyeFrQFi4 C7ca0HI9k7+q8frWCz+Je2IqiCXf7yXlCIM2WkxiNzINim/wLLzaPdOeueZFq4MdMjMZBhCcUB1Rbe mRdSVBLs7X7Zpm/3jue63s7r1/T5Zdd+FnKnX9Mx1pbvmw8d+u28kL4LxsLFp3fBS3zeo5fKA1b74I aPnMh8oLweieJCNzHBtJmoA+8bROXjIbWCktLpZ6wtoxPmkgKNC65kw8ylP9OD9mtdz/bYC6djzAq0 WjHL34MT7pIHjgbJe86Kbe4rqIKg2p+NIDSL06kM7XS11ju9ee0SrcJYHqw/rvOlMJqzWxf4Nv/Lcw tVGq7vh2z1O7XmMCOh+d4cORBxDlJ4pqO/LdJnm3CeCaaMqsWEXlmgSV6ZRA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105500_753593_D091AF2C 
X-CRM114-Status: GOOD (  14.23  )
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

Introduce locktorture support for rqspinlock using the newly added
macros as the first in-kernel user and consumer.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/locktorture.c | 51 ++++++++++++++++++++++++++++++++++++
 kernel/locking/rqspinlock.c  |  1 +
 2 files changed, 52 insertions(+)

diff --git a/kernel/locking/locktorture.c b/kernel/locking/locktorture.c
index cc33470f4de9..a055ff38d1f5 100644
--- a/kernel/locking/locktorture.c
+++ b/kernel/locking/locktorture.c
@@ -362,6 +362,56 @@ static struct lock_torture_ops raw_spin_lock_irq_ops = {
 	.name		= "raw_spin_lock_irq"
 };
 
+#include <asm/rqspinlock.h>
+static rqspinlock_t rqspinlock;
+
+static int torture_raw_res_spin_write_lock(int tid __maybe_unused)
+{
+	raw_res_spin_lock(&rqspinlock);
+	return 0;
+}
+
+static void torture_raw_res_spin_write_unlock(int tid __maybe_unused)
+{
+	raw_res_spin_unlock(&rqspinlock);
+}
+
+static struct lock_torture_ops raw_res_spin_lock_ops = {
+	.writelock	= torture_raw_res_spin_write_lock,
+	.write_delay	= torture_spin_lock_write_delay,
+	.task_boost     = torture_rt_boost,
+	.writeunlock	= torture_raw_res_spin_write_unlock,
+	.readlock       = NULL,
+	.read_delay     = NULL,
+	.readunlock     = NULL,
+	.name		= "raw_res_spin_lock"
+};
+
+static int torture_raw_res_spin_write_lock_irq(int tid __maybe_unused)
+{
+	unsigned long flags;
+
+	raw_res_spin_lock_irqsave(&rqspinlock, flags);
+	cxt.cur_ops->flags = flags;
+	return 0;
+}
+
+static void torture_raw_res_spin_write_unlock_irq(int tid __maybe_unused)
+{
+	raw_res_spin_unlock_irqrestore(&rqspinlock, cxt.cur_ops->flags);
+}
+
+static struct lock_torture_ops raw_res_spin_lock_irq_ops = {
+	.writelock	= torture_raw_res_spin_write_lock_irq,
+	.write_delay	= torture_spin_lock_write_delay,
+	.task_boost     = torture_rt_boost,
+	.writeunlock	= torture_raw_res_spin_write_unlock_irq,
+	.readlock       = NULL,
+	.read_delay     = NULL,
+	.readunlock     = NULL,
+	.name		= "raw_res_spin_lock_irq"
+};
+
 static DEFINE_RWLOCK(torture_rwlock);
 
 static int torture_rwlock_write_lock(int tid __maybe_unused)
@@ -1168,6 +1218,7 @@ static int __init lock_torture_init(void)
 		&lock_busted_ops,
 		&spin_lock_ops, &spin_lock_irq_ops,
 		&raw_spin_lock_ops, &raw_spin_lock_irq_ops,
+		&raw_res_spin_lock_ops, &raw_res_spin_lock_irq_ops,
 		&rw_lock_ops, &rw_lock_irq_ops,
 		&mutex_lock_ops,
 		&ww_mutex_lock_ops,
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 93f928bc4e9c..49b4f3c75a3e 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -86,6 +86,7 @@ struct rqspinlock_timeout {
 #define RES_TIMEOUT_VAL	2
 
 DEFINE_PER_CPU_ALIGNED(struct rqspinlock_held, rqspinlock_held_locks);
+EXPORT_SYMBOL_GPL(rqspinlock_held_locks);
 
 static bool is_lock_released(rqspinlock_t *lock, u32 mask, struct rqspinlock_timeout *ts)
 {
-- 
2.43.5


