Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43631C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uwe9TWcp7UhmX4oZw7S8iXQCB83ssWQWzCZsAER4ojM=; b=rmnsZyQ1sIahTH03/D7VlLtvvp
	NmqlMqJJDSiz4rpOgQiWnBVdTxgFLPVDQ2vvlHeChPvCwPahffXww1wlpuOdE3o5DW7V9J1w/Seh2
	N+euDNW+qZZ+uhryD5oK0yVDmwZUJoaScRAyVhQFd5juL0E0Uu3AN6gduEiH97eb6KkbTG4qp3NA1
	vag+VYTvtvdlvze8kdvLc5DhCAr4Q9ZUoHasg5iH9klLmeCvK1cglWtQf3Hw0Z3TS7uM4OMJ91g8y
	DCE8b2tpuCiuw+hg4I8WZcmVnoNuYdsmdcrPuVtAQQeKjXI7n0xKNuMUUGnHebSwvIKMFjmoUb6Xl
	gJthuKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQho-0000000DYPC-3Rxw;
	Tue, 06 May 2025 22:24:04 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTe-0000000Cjxu-22Kb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:49:07 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d01024089so38283915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550145; x=1747154945; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uwe9TWcp7UhmX4oZw7S8iXQCB83ssWQWzCZsAER4ojM=;
        b=xg5EALbd8VdkUyx1GMI3BvPmBSd4ERNdEKzo9qsCLpOwl4nx8sBgXV5Yz3MJo19Qkc
         blWLeNrQBkOugxwe0yTEAlxNASXEQPy4n7Kyk7T1rFhW5BUmoP5MWi/fuVXkc9WGgqNG
         EkUWAcJ9ImlM+uWroMXiPLTPx0pp6FhTzEwRvPllJzyn1WZVB2xxMn8Z7xpGzhp+HbeI
         +c2Ql+UuiRdubqzVuYrkQuUzBVFH9fVKvzeeNOVdZF7YOv7GI3Jd5X/+Alah+z9QSMnx
         m+r13m+qVscLEQDxFE+T6bLAeK988Qe5KkNcXSDmX+DBdix9ESwLyPKxugL82C65H0T7
         P3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550145; x=1747154945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uwe9TWcp7UhmX4oZw7S8iXQCB83ssWQWzCZsAER4ojM=;
        b=tSuBUCLDeGWset/2Xu4fGgP3mehYqXwU04pXnfjFd2QL0PG6xv6+h0mGUYx4+VQ1pe
         oQ/gt+UGrjXwAPQd2gHJUotHQgvjwkLqArIMBAZgA4KzmuUza5jetEHNWy8Nls1+hx3I
         ZCbgQCV6bq/g0elp8wGZM4t55N9VuoRyCA8uZli8Bhi1y4B3uGf5bqtFbhPQtwyHrq8N
         UFVzMzSLHm+VATKXJikj6W8KyhmIt406oA1ZnZr7lSdYftJWkpZrCIP5MKCHWmh3sfQP
         BXzXbuQAQJnzTTEXpB0K7Mhs99h2lB6kt0Eu8uWD5Lkk0Pd6OxGsxVocce2BgJuzvLFN
         nyng==
X-Forwarded-Encrypted: i=1; AJvYcCXdsPaPJ3+LERu5MRNM3eixgAgRbMjlI5J9kjrXj+fCg+5SN7Qf7zNcZdISnwcqFkV/ni9CRBbGS9F/Qobm4/QA@lists.infradead.org
X-Gm-Message-State: AOJu0YzwmNLV1jvi8zAC7b0l2TgYKafda8LpDd9X5bzOAVPJagZEkEnd
	8vvTgMQmv/CEGjWdEkiKpmwD76xu6NC3npt0S2v2gSjfBp0pj8pDmZpfkUEK5pa2Iyd5zmrRt9K
	0FitHDfI/gKrBxsF90w==
X-Google-Smtp-Source: AGHT+IFD0lWDGk03I/L52reS0E96znl56Cu/MfnVewrpbgBLyMFf/ajBPFdbrDJBI3q4GHyXoNdIe4tdhRJb9WFi
X-Received: from wmbz22.prod.google.com ([2002:a05:600c:c096:b0:43c:f6b3:fa10])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a03:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-441d054c884mr38006405e9.30.1746550144942;
 Tue, 06 May 2025 09:49:04 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:10 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-15-vdonnefort@google.com>
Subject: [PATCH v4 14/24] KVM: arm64: Support unaligned fixmap in the nVHE hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094906_522985_AD8C57AD 
X-CRM114-Status: UNSURE (   7.90  )
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

Return the fixmap VA with the page offset, instead of the page base
address. This allows to use hyp_fixmap_map() seamlessly regardless of
the address alignment.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index f41c7440b34b..720cc3b36596 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -240,7 +240,7 @@ void *hyp_fixmap_map(phys_addr_t phys)
 	WRITE_ONCE(*ptep, pte);
 	dsb(ishst);
 
-	return (void *)slot->addr;
+	return (void *)slot->addr + offset_in_page(phys);
 }
 
 static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
-- 
2.49.0.967.g6a0df3ecc3-goog


