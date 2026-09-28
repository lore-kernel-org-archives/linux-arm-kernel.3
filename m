Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8143FCA5FAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/9CJBbG35x+y3Ddsn+TP4ZxkCLdkVf/5InNQKQpJMA=; b=CZjobK1BdgwjaaTuIjq4IMNQWP
	rzcVMWyEywI87UM3gO0D43r2NxZFr10oxm9INIVjoxzUCTnHvwc/qRZMLAbPxNwvLPxaEUg4bNR+f
	Av4IeBN31R97Bw2mKmxmuN1BJKZ8NXzhgmxy4nbY7ep0bTnGaZoaK6GYyr15JIypwwDZVVBid1df3
	G0eOOPm+uAhFJr5ZA9O3MbEZwd/cwJEZ/AFdKRNWWgynMIc65sJzRlqtnXNPKWfV9YUcwP43kYt9d
	rbZajO717893VT6gKn5KbQKRZvcniEUiNcbK/NvwYo55OELVMJ5OWKzQFHc+gk6vEFvQvNLk6hnfI
	kt2PTsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMb-00000001CiQ-0OU0;
	Mon, 28 Sep 2026 17:42:05 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMV-00000001CaH-1NwR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:42:00 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48aef5cfe43so121894f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617317; x=1791222117; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/9CJBbG35x+y3Ddsn+TP4ZxkCLdkVf/5InNQKQpJMA=;
        b=AuVk5JnBFyGgJ08IrMwIoViVwUpB3Z7SW7vi/T1WmLnXsazqoj9awAuTHz1+gzWgjg
         A2PB4FyT+q3hYeHWt91T98Gs1lgxVcDB0mYB/xNsRaiYesgfXlITY/WOwIV52gI6yVNI
         3T9qPGx+k3MHAxy32jJhVJlVre8AdtR3Zi0l7UGfBTdVDRVDmseLETuLH+fWPfsfGuA7
         oupj6kutOf/u149VFqrlF0ZAmEQ9Q40QZy1rvynoZoJ0pNzTB/UdAw7QgmEc+fLT0fIm
         svhjifpJtgFwyiD8oW9qYH/3zSwXHZ/y1Hi9H2HpxDoGezottl4c0L/7hctxBa3yHpds
         JaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617317; x=1791222117;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/9CJBbG35x+y3Ddsn+TP4ZxkCLdkVf/5InNQKQpJMA=;
        b=sphKQJIG8ozmmtoBetC4WchKQBvnwqsUXux3/ufY+4QbtZ1hbnvcw7MDetE6X66op4
         uFKZODZ3QsX4s0UVEf+7Ho8HIpWK5kBp7uE0eP+SK4zuBHh3ZxpJ3RU55Vpnvtq29ngd
         USuZGCwvCtPodQcs+hroOWlFzeZz2XI9ztMEsQLpDxfo0mNm/um7hUpAdElN85wUxrFY
         qbAuNTcOZEzUEAhO9FQrjzxLK139K4SxCVL+/DcENdVJVphW4Hki1qe3nDflD/srYurj
         8maNiT5MqdfUFNWyFwc7Ijk//r0E0NQgtIbUTnZN5cDF16mqlHckwpnUI+qMfCVfvZNu
         R4Fw==
X-Forwarded-Encrypted: i=1; AKwUvBz/+qjemxfIRGTwshCMVlg7saOBScyR+hVGBSCqOifpK8uqFy5aOBQM4BMDwS2U5KpBsa/qLgq2Tv+8OOEX4tRp@lists.infradead.org
X-Gm-Message-State: AFq9FYIxEJsTrIul3F4NJAIEuMPz06vvXoBI8J5v/qhmntgklI//YJ6g
	eh8TJTcMo9XmqwFrtfzIlcldateJ/eT9RGl1KcgAwS6l5MAyUkmCDqHrRDuh6FKWMzK/CO76m/5
	XXjvlX+fQVoQiBg==
X-Received: from wrck15.prod.google.com ([2002:a5d:524f:0:b0:489:bd7b:5942])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2010:b0:488:7803:c1ef with SMTP id ffacd0b85a97d-4887db496acmr19692502f8f.48.1790617316679;
 Mon, 28 Sep 2026 10:41:56 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:15 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-9-smostafa@google.com>
Subject: [RFC PATCH 08/15] mm: kmemleak: Don't assume the kernel stack size
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
X-CRM114-CacheID: sfid-20260928_104159_373932_5BD604DB 
X-CRM114-Status: GOOD (  12.36  )
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

kmemleak_scan_task_stacks() assumes that the kernel stack size is
THREAD_SIZE.
The allocated kernel stack size may not be THREAD_SIZE anymore, rely
on the newly introduced helpers task_stack_{low, high}()

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 mm/kmemleak.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 8fa409a4f9fb..72e2c628a20b 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1749,7 +1749,7 @@ static void kmemleak_scan_task_stacks(void)
 			void *stack = try_get_task_stack(p);
 
 			if (stack) {
-				stop = scan_block(stack, stack + THREAD_SIZE, NULL);
+				stop = scan_block(task_stack_low(p), task_stack_high(p), NULL);
 				put_task_stack(p);
 			}
 			put_task_struct(p);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


