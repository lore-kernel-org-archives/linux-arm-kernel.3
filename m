Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D04FCA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUO525MYjN5YsfP/KDhp3xMzNW05smVZVp3S7wkbxmU=; b=zCFB0D+bTcb/X8sM1svXSlmlXM
	/h/BgixXeWtl6wHSGyZngGVZl+ZbbSMySxmvaxFgjeLMSeeSDx1f31gq8esAfZuVwgaL3jukonEGM
	PHQWeuJUoz7lMQAAggJPLX3Ln1Xkh6oreGZgO6R2B8y1kSUjz2fWChQivkl9gu1FZpOkV2JBxtPQw
	yIEsHC14kWjE1Y6hnsgs+M0pNPQdYJHs7Xf9iCR3j3qQmHqEME7EY3zRRN0HGQXlf+MJrYMuecF2/
	UYLLoirqDiI7fpfn2Jb/C+iers60k9xmZ0Y24LvJEjVkbsfFlRRXQWJNmdkW6hPLzcCjrDEtQxwdz
	3n5h+YPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMa-00000001ChI-2p61;
	Mon, 28 Sep 2026 17:42:04 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMS-00000001CYo-30x8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:41:57 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48704504d61so859569f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617314; x=1791222114; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUO525MYjN5YsfP/KDhp3xMzNW05smVZVp3S7wkbxmU=;
        b=QY1YDTrETfI6W523CQWFZa2BZGb99nzKZNichcks/6UGLOKdJkIP+ib8FAonv3UD66
         AIIQQeQ15x1Lmo2VT1FBCgmrzYFB4fobmLFjH1DXynRvVLZWXL22eqkC6Wol4eSlQTfP
         Axg236uTM+ngHoBrZvIDP2+9JhACgjsQ6gm2RWg4F3EIyf0SkrpDrn6Af9uLxlCN0fVF
         2tA5GO14WMBZfxi7NHjP1RT2VaXT+wk76GzSuC5I7AyqyyHj0rXtuawAVKVI3Zc+8w5u
         s6dUqCOaPS6WI7iL4lSCadpn7po9MJRd7Fwz1bcWOxuAYgOh3hK1K08LGWkBtc59kNqd
         dsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617314; x=1791222114;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUO525MYjN5YsfP/KDhp3xMzNW05smVZVp3S7wkbxmU=;
        b=LJ3OiDoEmEbKXis1cbG8p7vRHE3m2QIeHVi87HOQXPRGTLza0cdc83hmZ0A8MyRP9L
         5hqukOkVylMnpK8HN/jiySxM2nik0DxW8ZSg+nxkG/hS3gPadrEeoNcu3Iy1GW4YJa5N
         O4x2RgijIx/YLMz/ECq097IuYdrJm494Oaw4XrsqUkv0m/d1C6AWUx2ynf/vIiQC4cQF
         FE464DBC79D9HVK6VaXGYm937LsTfPe+HJE9aij7liRzUz5a5LPnmenez6tLJAnkQzbe
         0hjHi69dntptXY41Ii0d+EZZRX43fqYfTY4RrDNaXyuIa/mBNK4R1MZ4kk6G+rbYK4am
         Qv0A==
X-Forwarded-Encrypted: i=1; AKwUvByyFkcWz5gKPnae7VWsmxMoK9qKBPgvWbkpIGK06svowyV0wPY723UofQq4lrjW5+YajZJZMPaNwNOpM4iuJZMx@lists.infradead.org
X-Gm-Message-State: AFuF++n38IpVywRyGXX3/gzPgytnAtDIdII5jf6xA/EA1I2USzbuf7ve
	peMwdIn+aVvug8qqia5XRAQLzwb8UDR1hMSba6CWlno7+VZo9s7UQEnfsv97CvY7W+JeNK436vB
	jDF26ROEXgS5YkQ==
X-Received: from wmgb3.prod.google.com ([2002:a05:600c:1503:b0:49f:fec8:8e56])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5487:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-49fe66ee809mr241216335e9.22.1790617314094;
 Mon, 28 Sep 2026 10:41:54 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:13 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-7-smostafa@google.com>
Subject: [RFC PATCH 06/15] exit: Don't assume the kernel stack size
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104156_788406_89DD37E0 
X-CRM114-Status: GOOD (  12.20  )
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

check_stack_usage() assumes that the kernel stack size is THREAD_SIZE.
The allocated kernel stack size may not be THREAD_SIZE anymore, rely
on the newly introduced helpers task_stack_size()

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 kernel/exit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 424c44a42a4d..899d3bf048d4 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -883,7 +883,7 @@ static void check_stack_usage(void)
 	unsigned long free;
 
 	free = stack_not_used(current);
-	kstack_histogram(THREAD_SIZE - free);
+	kstack_histogram(task_stack_size(current) - free);
 
 	if (free >= lowest_to_date)
 		return;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


