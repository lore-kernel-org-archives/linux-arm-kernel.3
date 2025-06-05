Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7309C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 10:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rVhjvVcIXx5T86Gzf/rZsso5uT7BOLjFW6qVNZ4D4g=; b=PF2+qGkUcOZMv0Xs3/dtr39jgz
	4NSdIa0TZ8OzZ87KwoZoDnrHEsao+R2H13s3U6dru+ENOlfd80i6to4y597VJ6/2tqCX570JxQzUA
	ZUZ3xs8EySfkBXlTGItrp164r1p74w0czGDYJe8V4A4e8IYOs0mA0qN9f6Vfgb1mlp5y8LZYTTy9Y
	FMKTAR21S+5CisyWpNJGSOXl3B67uAQq9wZCB6KszqQWA/KKrTq1IS+MJMe1m5F1MppGkZJP4kn0f
	UUZnOBrVd16xjSG12AENLiQJjQk55PMq+7a36aFWRrwTSj4MAXltem+yaIP29iwvvJ9WWwWHZVkye
	fyhKGU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8B5-0000000FIQF-3nzI;
	Thu, 05 Jun 2025 10:50:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7zi-0000000FGtR-1kau
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Jun 2025 10:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0rVhjvVcIXx5T86Gzf/rZsso5uT7BOLjFW6qVNZ4D4g=; b=TiPel1qRpY0KPdyNko/jExhAAo
	ocQmCsJAoSCbjXNgv4UPxACYVHTQCB8g4XXXHSk1HVpL6uwirDp46ZPi9pnhCO0/WtN7poetSYuD7
	iuUqhwaI7f19ZsPhZ9y6giilHMgwWeBHCBSYZAUifbzINdVUTwc6nGiX0VeMYzjjHZ1m2NL+zAGE/
	dC+z9fNA3t1ENxfuCzSNkDFG4uaCbt7saTQiG7EfqzttySRJ1Z9u4Xwp4S/7OJKQnBPyNqvYtDb30
	4rB3ULDM+QvmGSc9tIBQoFg7xRmZT0wURqhnY2gX9EolJWobez1VEbsMGLVNzBaQ6J1pTap7iFsD8
	wSJ+S+FQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7ze-000000019FO-3lWP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0rVhjvVcIXx5T86Gzf/rZsso5uT7BOLjFW6qVNZ4D4g=;
	b=SecBbFlfVPzYZ49L2SsxZBZl3DDDuEt5JEu+OJfL1K/9LMeUzjxMoRFj+60ceLMMbDW7nw
	U6KlJrKdjYgKPp6u4Gs9JTm8t6bjR/Vx6SYqHqCagJtuoDIGFU4d+vBwKkuXvZxiQB1bxV
	3UieGgHgWECZk3jyddLpDoqv4r+yGWk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0rVhjvVcIXx5T86Gzf/rZsso5uT7BOLjFW6qVNZ4D4g=;
	b=gY2tN1sAmGHiB8+1W/AMMGhgdkX5zm3p6FTFDULGi6sD4c+goNZWo9IMbE7BfpkI784X0J
	PZgpt8RaFLkMtks/NIOyX4F06sGZOyZFj6OfpFaWp3zVPzqRKHruZHLll+pYdrmqXWv82X
	XYIiLax2PAhh5q44r8onkzlfgQOjn0Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-BOkiKPLfPn6Pnm_BjKMVkQ-1; Thu, 05 Jun 2025 06:37:03 -0400
X-MC-Unique: BOkiKPLfPn6Pnm_BjKMVkQ-1
X-Mimecast-MFC-AGG-ID: BOkiKPLfPn6Pnm_BjKMVkQ_1749119822
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4517abcba41so4658385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119822; x=1749724622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rVhjvVcIXx5T86Gzf/rZsso5uT7BOLjFW6qVNZ4D4g=;
        b=HpRNI+3SmDlC8kTNi4ijU2ZjyzpWuB3W0ZfzxX1TdzTn/ALJlt8R20ELFFmU/VHnPS
         vKep9diNTzIaPri9zAonvAToAIW4snz2u0fSzsCwgbSbK/aG8TU2s6HZrn9q8hsqnCwv
         hLQm+JjRV4WgOSX5AnO4dC+lWuWuyqAi+1cAAph08Zaz8OU2hvRoUXN4je2vh9mWPycx
         jE1HwtjHkcE0UooJiorXCa9gwE1qKmrw5wGO52mIiZZIhkpHvrwX7tDj+ZeHo2JymGfe
         OwTBv3+nhY2Mj50LJgrwKNqBlsvFvyOaIjtMdVrgrptIiLmxA/VlWaHAsWEIExMSeom/
         nxPg==
X-Forwarded-Encrypted: i=1; AJvYcCWjBwKIEFOtSLj8eNJTBKr9LnEAyMJE/budrft3BHk2s6wiXsEFa3F15yFpgfUQwNZqzblktdgEhAs8LIpqyns+@lists.infradead.org
X-Gm-Message-State: AOJu0YyB03+GjSZAQMge23Lx5nJOkSYUMjWJBoo/NZZOXuYCUPJ4AyWE
	c7F2zHW7lERthiH/4ZuVf0LpTO1j7y8t3CY0CeCbYwjnLeRfjPYIUumXt0/CFP+jw+krCkKpA26
	x/Oc6EVkDHDSSj8Ls8kJT1ie0ks+7P0+UEn2CAdW/l4pV7NPVqaF4M4PS7/4XMhgAphuiQnxFAe
	M8
X-Gm-Gg: ASbGncvU/KOJcDtPNdREZY5oXfMi/BiOawESjXZVLV++udIPVOtSv49ftjr/1JjdsDq
	D+Q+awGNjjey0oxIOjsMNaHbcAKkvKTbgfiGJFbmuSh2SL+ZH+0t7S9yCmUiLk8sDT87dtR1xps
	f9SJnjqYWzYVg+h/Oz2d0wm0lg3SrgqHAtjt2IXyEAPm3qVv+rBZl6q7wlblOTZKVeyDF5n/rXM
	ZWcODzejOyE1K27Uzg1rMwctNfy4+Z9+lFo3f6w23HgpLGinVyOFyi47wNhNTmxPzULhff1lM3z
	kl0x91B99djWgHYlihqbsiv0WPbMKvP39tP2IoUvT2O7i2jzWMWXoHNM6pwewtLxoXOwjUaBgQ=
	=
X-Received: by 2002:a05:600c:46d1:b0:450:d5f6:55f5 with SMTP id 5b1f17b1804b1-451f0a6a475mr59189885e9.6.1749119821941;
        Thu, 05 Jun 2025 03:37:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl6x7gVIPWibQhMLU8nel9VytzISKQ2PPkA0o/8Tg4UeXbk96NsVZsi/1KR13ZEgWYC/qLMQ==
X-Received: by 2002:a05:600c:46d1:b0:450:d5f6:55f5 with SMTP id 5b1f17b1804b1-451f0a6a475mr59189665e9.6.1749119821528;
        Thu, 05 Jun 2025 03:37:01 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8311ae6sm14105175e9.2.2025.06.05.03.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:37:00 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v3 3/4] KVM: arm64: selftests: arch_timer_edge_cases - fix xval init
Date: Thu,  5 Jun 2025 12:36:12 +0200
Message-ID: <20250605103613.14544-4-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605103613.14544-1-sebott@redhat.com>
References: <20250605103613.14544-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N2wmBOfgJtwsr3WY7vEsfrwI0t9bjacupUiEsI81bhs_1749119822
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_113843_109492_42B20027 
X-CRM114-Status: GOOD (  11.23  )
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

arch_timer_edge_cases hits the following assertion in < 10% of the test runs:

==== Test Assertion Failure ====
  arm64/arch_timer_edge_cases.c:490: timer_get_cntct(timer) >= DEF_CNT + (timer_get_cntfrq() * (uint64_t)(delta_2_ms) / 1000)
  pid=17110 tid=17110 errno=4 - Interrupted system call
     1  0x0000000000404ec7: test_run at arch_timer_edge_cases.c:945
     2  0x0000000000401fa3: main at arch_timer_edge_cases.c:1074
     3  0x0000ffffa774b587: ?? ??:0
     4  0x0000ffffa774b65f: ?? ??:0
     5  0x000000000040206f: _start at ??:?
  timer_get_cntct(timer) >= DEF_CNT + msec_to_cycles(delta_2_ms)

Enabling the timer without proper xval initialization in set_tval_irq()
resulted in an early interrupt during timer reprogramming. Make sure
to set the xval before setting the enable bit.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index a813b4c6c817..be8bbedc933b 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -191,8 +191,8 @@ static void set_tval_irq(enum arch_timer timer, uint64_t tval_cycles,
 {
 	atomic_set(&shared_data.handled, 0);
 	atomic_set(&shared_data.spurious, 0);
-	timer_set_ctl(timer, ctl);
 	timer_set_tval(timer, tval_cycles);
+	timer_set_ctl(timer, ctl);
 }
 
 static void set_xval_irq(enum arch_timer timer, uint64_t xval, uint32_t ctl,
-- 
2.49.0


