Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F882C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 00:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhj01gCo8zRE4ihm7mjL7ntGfsdvBwkWydK82rp0ihs=; b=Fc1g2gBjjysNnFCzAeaXZwt6Xz
	xqkoC+mkb/acuqvLRCm2osthWIKQ3ZrpZck9oltwIWA62fQwWCNWIcoiAAJASfQIEA7FRARNWB2a4
	zTj6zSzh57yyYja1A1XfoYmT9KS5kOx+KHsLrfssok/E+zb6ug8dde2878oTjKUhuEFDmRmJL4Tnt
	8C4RxJWzvvQRT9pN24+t0PbOkUQ7kjhvf5wxv46BfxTMpmnJBwsPFhkYWrQcAyqJuQ9YjGg5nlg8d
	57guzPLIg2Zya5oS0Z1HNFnsRjxPo46MRgyB4spOTbVeZGL2WYZghzvQ7n9FDQcxKO1UYlKyG/Wkw
	w3BsHG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIG0g-00000002YzP-1HRc;
	Fri, 23 May 2025 00:11:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFiV-00000002VsR-3XGj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 23:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rhj01gCo8zRE4ihm7mjL7ntGfsdvBwkWydK82rp0ihs=; b=SJhqCaMMTeVTksDBPEzfJHBZ5l
	x9ZoIRkQc1KNWpYxNSzpY+djDUoLckpH3wTuw6pFvF3Z/0cJpkxJnZHr9+4On31nw/LOqdAEQqyG0
	2XOXuU1zAcc5n6TZ5h/FXVi6wp9lwtEDR9HUSszqUfyRmkTySfI94qcLDLme572oszf3fXDAxec4f
	w6Zdtl32OzTTgAKPkPu1UA6RToB2V7rC7R4Vtm1zmDImChG//wUPiyp0SfldMPe7VoPA71ydPQUZm
	G7T9fKu+7v/rEXxI6l1Wix4wift53umQoHfjKnlI+B5XDtwL+ZAU+R/neHLhOG0WQpEZdgmmOHyfy
	vhWettOQ==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIFiT-000000016aH-0IfR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:50 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-742b6705a52so8678698b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957966; x=1748562766; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rhj01gCo8zRE4ihm7mjL7ntGfsdvBwkWydK82rp0ihs=;
        b=JJkCf1eRjkqISsZaWyspQbaYhYX7rftY59j1sEECkrUEpRGtmdtVzcpKnvLGYDXXfY
         v+bsTQej0ZQaywjrKBPalce/EOPC11f6c49Ta7M+y7AuO3QwPlcCXlVuURdKcjh8YmNQ
         M/Igpa1AwQucYz2+ajZpT/HH9MqImRBJL218OLcUU6z0r27Tv+deg6umeuoP0zTE0Eww
         nIuzEzk5sXcqBURe0vmuQQomK4UKAlXI3QCJk3uOAadRTqS3xK5GjChjCpvPRtaeHqn+
         INzMPeHLtxVmtShfdfmyMh5x/B9btEEFqmkHiq3Yt1lhVsvQKKkz4mJOlIp0wNBCH2em
         ZM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957966; x=1748562766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhj01gCo8zRE4ihm7mjL7ntGfsdvBwkWydK82rp0ihs=;
        b=VwY1xKIS2cagxm2IpqCkGLsM1oHfcYWFZI6poMXnN14N8WFzD5dafrBBS+B0m6iCy6
         +q8L/X/ZGQcIc/7AyyW352pVOG8VVJpcoNo5EHb2Bq4FmmUAvDVLmO3u72yOWVfERujW
         uolJpra/p2ppxLEsGMapxVVospe5tZu/b3iaShx+BS7+IUSYwxUdi2oY4nDE+A+Fysa8
         raG1yx8PQl6ikYeF63qvdATAZ7OeSLLDdB7Gr6EBANvRzSIQbsSoGxfWe8izcRCEqmzs
         mjPJP/5vup/eZi3ma7Bf95mi90aC5CACrpK7EZaCFdXSrc+M/HYFZ6uHYcSQRjPXzWgy
         40pg==
X-Forwarded-Encrypted: i=1; AJvYcCWtnum6H2a20JRCcpNPC+I/z+OjrvoP+1uixNTO7PGgR5BKnbOVlbheYumX00Onh1mtkeaT5STAr28jresfadU0@lists.infradead.org
X-Gm-Message-State: AOJu0YxxEC4CshYVuijte5eYWpqA9fp75t79fQNVDh/zBgl8wX2tk+ft
	tPbn1nH8FC6i7Uv/YV1dssW/hjU7aOKL4ZfCebAjgL/Gk7yuZwci2eL7mdfqVaUYu8JrAg9jFKx
	vPFEwIw==
X-Google-Smtp-Source: AGHT+IFcXQOzVhyYyYRvvhxCpwMSPB5FWKzf2e+esBNAhvIROXYgtUD8Jyc4OswUVSapVQEWgVgXYmNxl9c=
X-Received: from pfbhd3.prod.google.com ([2002:a05:6a00:6583:b0:742:a60b:3336])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8594:b0:740:9a42:a356
 with SMTP id d2e1a72fcca58-742acce36c5mr31613679b3a.11.1747957966116; Thu, 22
 May 2025 16:52:46 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:17 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-8-seanjc@google.com>
Subject: [PATCH v3 07/13] xen: privcmd: Don't mark eventfd waiter as EXCLUSIVE
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_005249_229052_093D2EAB 
X-CRM114-Status: GOOD (  10.69  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Don't set WQ_FLAG_EXCLUSIVE when adding an irqfd to a wait queue, as
irqfd_wakeup() unconditionally returns '0', i.e. doesn't actually operate
in exclusive mode.

Note, the use of WQ_FLAG_PRIORITY is also dubious, but that's a problem
for another day.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/xen/privcmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index c08ec8a7d27c..13a10f3294a8 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -957,7 +957,6 @@ irqfd_poll_func(struct file *file, wait_queue_head_t *wqh, poll_table *pt)
 	struct privcmd_kernel_irqfd *kirqfd =
 		container_of(pt, struct privcmd_kernel_irqfd, pt);
 
-	kirqfd->wait.flags |= WQ_FLAG_EXCLUSIVE;
 	add_wait_queue_priority(wqh, &kirqfd->wait);
 }
 
-- 
2.49.0.1151.ga128411c76-goog


