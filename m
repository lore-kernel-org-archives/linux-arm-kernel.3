Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B3EFCB600
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fixqNHIgRdsXrQKd6GcjLA4m1QZ0grB448V81HUxHL8=; b=ynDPZ4xk46tfEOFg8fbM6mCz/l
	Qf4UZF95jo6/UmXVrDrECmReU6ZXHNN0eWFSjQPYzzAJvbStEFj4Yb0/AcYgSTTC5HlWIy/gEmMwp
	mZEg+6ETuj8WF3DGzJuFLoYyvibRt0xsnZFGun88j2vhCGIyIcTPRuo3J7ghT3wBLRSPKdAZMzUrD
	zhNwZ3aYSKuUolIyr7w+HGmMsF87noMan2kcs+GCg7BToUYUb+fZdmspoy6T8U5pqEYMMYh1wcD4z
	cdg61tEpQHFsbceTP9N3j2fI+qV2JRWs0PXWMsHoS8V6MSYVWzQfUj7jugWxKB6OaYGbRg9aqmzMc
	Dlvk3QdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWIm-00000003wUl-1Wyu;
	Fri, 06 Mar 2026 14:37:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWI0-00000003vSw-1DtH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:30 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4832c4621c2so100660385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807786; x=1773412586; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fixqNHIgRdsXrQKd6GcjLA4m1QZ0grB448V81HUxHL8=;
        b=xjCzTen0KMD+Dt+E/6B/HWodOO08eSBnEgG4E9Ly5TI49nqo+h6omkOe1P4+2yLiVE
         TyZS6CGqbtPvk5GExGwUZaXHn34APNYnYRBLZxnIbVTMP0D+fVdZP6BwcNSpNVhh4wS5
         F2uaQVF96xF/lxBzSnManApx6wihbvF6f84pmw/8zD+kGIZ5pboaG0ia5MYTpH/C3XSo
         KCcTH0C0sBtj0vekSayNfM+SX14D15pWKMW+CK9ReCmDHOcVnwNViEOqDzpympwXKNKz
         h8p8iZU2juzzcGn5ByO8UGtvOAiZ2wmqOmFG2mCdOCfiWDueoWRj7970UECvkE/by8TV
         0b/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807786; x=1773412586;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fixqNHIgRdsXrQKd6GcjLA4m1QZ0grB448V81HUxHL8=;
        b=WgBaVp/iALggZpKC8VbpOvwm2AN6APFxE2ixL7splRi6+RHV/8z7j1aUutxpGRM6/u
         G3ti1EFWnmpGaQyfTson4BKAaNzU2RNEbo18twRsVJpr0uC2Q67mRVTGZrbIwkhQ810/
         SQw1qNyFU+wUfK+eNr3gSFonfQ41bdrYSMLP8gj4bfOuoJiq+zIo+wx9UiuWOrZwjIxL
         CUj+MtlY5692gszK7pwcK7RqvyV+JmUUQJl4Gev9MExgXXj+mz12GT+40FAXA3HScCQ5
         IobeFi/DmK1luXFS3kugIOasYaOWwhtxm6hpChs70Yw9nuPGyqTpQAXqQuV0aJiMmeHx
         /GIg==
X-Forwarded-Encrypted: i=1; AJvYcCXs2c8H1D5EjPnOTfat8vcV/0AmhwxkbknYJOBeMKUz4GtArO5tJKu2v5vfvExPngXHpnqWIdCd4JAlWI/Duu3B@lists.infradead.org
X-Gm-Message-State: AOJu0YwhIEt+uYU4gWVj5zH2wyxtzgaoocXXGeosBxfAZVNi6lJNJB+U
	EjUx4EnceoyWBofV+zCW38ByDltYMi6r5888YacMlrlSAYf32+dsEIiBY3APK9jyarLZPiiZFTO
	J0NzqKf51PLoYBSnqjAxXbg==
X-Received: from wmet19.prod.google.com ([2002:a05:600c:2ad3:b0:47f:c96e:8381])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1551:b0:483:43d8:8d68 with SMTP id 5b1f17b1804b1-48526967b79mr40105665e9.28.1772807785798;
 Fri, 06 Mar 2026 06:36:25 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:36 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-33-vdonnefort@google.com>
Subject: [PATCH v13 32/32] fixup! tracing: Add a trace remote module for testing
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_063628_621184_E5B8644B 
X-CRM114-Status: UNSURE (   7.44  )
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


diff --git a/kernel/trace/remote_test.c b/kernel/trace/remote_test.c
index 791128d7fd00..6c1b7701ddae 100644
--- a/kernel/trace/remote_test.c
+++ b/kernel/trace/remote_test.c
@@ -28,11 +28,11 @@ static int remote_test_load_simple_rb(int cpu, struct ring_buffer_desc *rb_desc)
 	struct simple_buffer_page *bpages;
 	int ret = -ENOMEM;
 
-	cpu_buffer = kzalloc_obj(*cpu_buffer);
+	cpu_buffer = kmalloc_obj(*cpu_buffer);
 	if (!cpu_buffer)
 		return ret;
 
-	bpages = kmalloc_array(rb_desc->nr_page_va, sizeof(*bpages), GFP_KERNEL);
+	bpages = kmalloc_objs(*bpages, rb_desc->nr_page_va);
 	if (!bpages)
 		goto err_free_cpu_buffer;
 
-- 
2.53.0.473.g4a7958ca14-goog


