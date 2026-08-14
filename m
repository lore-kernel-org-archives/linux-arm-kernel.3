Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F15C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7b9OMXuv3ZP+H19/AmnDH9qKEt9RkVpbpVuxQpQ0/a8=; b=EBbucKMpXQ7eTTWOfUFznIcXkN
	OwqzidgD6QTeXHs4TmosINwxAzyE/59+uA68kkUk+YruBW+6WMjvGhoY/4zaQjiVBHrGucOHXTdlp
	Ky3XPDwVceR58EQUHab9G8ifPGdik6HY8GX28bNgRtXrb95fS802vDvYx5h/JiRKeLqNii58A9uI5
	OHQVob8aU1RLUnj9oBqZDH4sWnTjsv2e30mIOI9557U63+V8dU3+zX/p3Z9vdfzgf4dODTKuxph5Y
	LnJvCERY5YpGRvRI+LjVwTxP4tL9FKAnNA+FsBbk1G/l9DxrgAyRrI/ItrC3mEBcZixkPcoYGdW2O
	AZwNvA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuz1d-00000003Bqg-2uXN;
	Fri, 14 Aug 2026 21:01:13 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuz1V-00000003Bn8-0HMs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 21:01:06 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6a3899d74c5so1504001a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 14:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786741262; x=1787346062; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7b9OMXuv3ZP+H19/AmnDH9qKEt9RkVpbpVuxQpQ0/a8=;
        b=UC+mupr5NWeQLOFb5a0Tiq1oHc79VmLkfcmrCieugzU+ihplgEUXxXPQ171oc02dY/
         8JwGMz6rZCSsHoltLKcJLhbMtpkbt8w2WzyxdwSrlST4at4uZMA84zoiPBKVmzPxwoh7
         BxCBPDF3lW7//0T+fSO2xcqcM+CuOv2n5RpfQwANQpNP+uJrujjGmxDKg9UwskX3WzrG
         Pa2McwrpFms3h7L7MEGYjLfFeW5Oo473Ljlfh6ih9NAyr8vMbAw9J+z2YctK56YZWsxF
         vxfmqBsDxVYFzNzdZk8JpsyxRkIsi9c7XGQpN5Ygpf1tNVbS2FRsLxCRFFHLzauaA4PF
         Zorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741262; x=1787346062;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7b9OMXuv3ZP+H19/AmnDH9qKEt9RkVpbpVuxQpQ0/a8=;
        b=EH7Z9nUMcaQu+Ret7Bl+/326nTrAP7jo3yKxyG/NJp2Kx/D+oIYc2Z2/N8P1cYygQ8
         GdC7WS4h0QASRFDEOzn5zQY+hMLnekSZsA7NXBj1BYeapGNYkc8YY4l+OdF5bEGCwSMs
         BYl/CSn15sT4SnyRYXdwCRUwurUTMpsprJWlZYjVAuhH3axZxihI5WxV6iF1+osA8CRM
         gE8zuBCLiyu1HxnqGrIdJCLi9Eg6qDZs8Yuw2IQWvGG57ozpjAAXGVJ3OjasyYHVh01H
         4YnehiHiDy6PZG4VOebJ9wgaAcUgmJFMqcOtRyYxjicuzYlEeNgmgMTxur8i5XXprHax
         uEFw==
X-Gm-Message-State: AOJu0YwDMQhQ9hFdwVeIEzpQER3zVqBzUe14/HKiWRsVEmrhsaZQ1cwc
	mCNA2QbVA86Zk+A95bRBtA4vjLeqPmVqhECYDeanVdIvqoqtvZndhVd+gzoRPiJf9yMOTAYxOBS
	Fd5WX0cm2FRNvSDjHIA==
X-Received: from ejcfz27.prod.google.com ([2002:a17:907:959b:b0:c09:e2fc:4344])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:a606:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c212a208e62mr387287766b.24.1786741261643;
 Fri, 14 Aug 2026 14:01:01 -0700 (PDT)
Date: Fri, 14 Aug 2026 21:00:56 +0000
In-Reply-To: <20260814210057.4102768-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260814210057.4102768-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260814210057.4102768-3-tarunsahu@google.com>
Subject: [PATCH v3 2/3] firmware/edd: use kobject_put() on edd_device_register()
 failure
From: Tarun Sahu <tarunsahu@google.com>
To: helgaas@kernel.org, dmatlack@google.com, 
	Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	sourabhjain@linux.ibm.com, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Russell King <linux@armlinux.org.uk>, radheys@amd.com, 
	skhawaja@google.com, djeffery@redhat.com, Geoff Levand <geoff@infradead.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-arm-kernel@lists.infradead.org, souravsgl@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_140105_109277_87EB66FA 
X-CRM114-Status: GOOD (  12.25  )
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

As per koject_init_and_add() function kernel document, even if this
function returns error kobject_put must be used instead of kfree.

When edd_device_register() fails after initializing the kobject with
kobject_init_and_add(), calling kfree(edev) directly bypasses the
kobject release callback (edd_release) and leaks the allocated kobject
resources.

Fix this by replacing direct kfree(edev) with kobject_put(&edev->kobj) on
registration failure.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 drivers/firmware/edd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
index f980c5b56858..763e7b16d517 100644
--- a/drivers/firmware/edd.c
+++ b/drivers/firmware/edd.c
@@ -748,7 +748,7 @@ edd_init(void)
 
 		rc = edd_device_register(edev, i);
 		if (rc) {
-			kfree(edev);
+			kobject_put(&edev->kobj);
 			goto out;
 		}
 		edd_devices[i] = edev;
-- 
2.55.0.691.gc56d675ccc-goog


