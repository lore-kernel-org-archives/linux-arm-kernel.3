Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F00C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9wwW7mRQHxWYHcAeYLej02klFAo7h8n1OW6fMkc7LU=; b=uFdv4kVeBdmGxjYSSLzt6H9Hz2
	xCY3f+bqn6o866/fEZvnhtWtJ1Eq454mrIeGRJFwv1Jk/XyuS60CG5JzxJjwxLs/5t5OorvgCyomH
	OLsKy61aD1yeAE8pfy7UblB7JiY3TBmx6ttOXuQEDbCLt1Xv6ECI+JxpyUr759YKvKz2mne7Txug0
	BX1+KTKVnaTjw295HoFis+a2e6JYnFtg3JFD8DdBJX0I/tk0XeIvpVYzTQiO1jdwxniCDrR2lEViJ
	AyzHxG5YDvvzt+j4Thj3GmVgZpnMvMRBetVeH0akZM5rrStfW3/QtNQ8Y1hNT1Y1Ft6TCONYoAOhW
	IckxbE0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS8w-00000000Ndh-12cP;
	Thu, 13 Aug 2026 09:54:34 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS8p-00000000NaH-42FW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:54:29 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49564d4b849so8483945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 02:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786614866; x=1787219666; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9wwW7mRQHxWYHcAeYLej02klFAo7h8n1OW6fMkc7LU=;
        b=bTr9EysCRmanYuqi3CMwl9/nwUAVKJ+vD+bjusrOHyRZxPy1P/WZUmO6gWvJrGODch
         J5ouvXPGt8Z2D0Xbt0kmeTSrDdKwH3AXjHbC1DC0iJs8hUFWGJInNHj5xEcGkcuY5LoU
         VjNZByPKuPEl1kelwAKLrjlMEnbPmlzMribJ9Gl5fh8DMnEEvmJ2qrNSFstjWCrfdmzR
         xWt224rWR+Aix5BeJ8qrYz8B0KCFXmRNJqC9vqVpSLeL4q59Q4yu+rlkHvCSBj9UzEJn
         M+Bt6CQfMijqmXN0UJGr96fWGLS9K2nVyToYE6lBms5Af0GzKPN9Ott5fQBqnCjEzL/g
         6ZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614866; x=1787219666;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9wwW7mRQHxWYHcAeYLej02klFAo7h8n1OW6fMkc7LU=;
        b=P1p1J8gvxoEYOwZTHspN5+hOlIjuTqXJq84ybIOE0lM6oAK0XhXH9vFM7k8r/9UCMc
         wEqKkuxcE4IqCLjm0ih8fJsOKZHBDsq9fX6NecDRcmjwOVfH8SEor9vbBUy+umC+oG4t
         ew8JScuK5GvCl3gkw56GwLmmXf6HgYrSDJZHQh6anFgnmJikBIgqd71d8XSSpdEytOwJ
         TATDJts9C7xGZgn0kSjuQzYcNroHL+tc0zaeppSP6REhdAHlsRiy3jUeV9uUexFgjDQ/
         +9FINvKpdxM1wlFZcBWXOlTmkjOFdZEHFKcqNxji0utM6aFUXoYsTr60hkXuo1EUc8g+
         vfLg==
X-Gm-Message-State: AOJu0Yy6ay+M/F3lU8YEpSVG3JnSmBhUdAgZX4hesGlD4t4ed5FETx24
	m71Wks91itenZO9hGIA5puGw09oz6953KY+BFtDNVzKi+POAKsqtQLLF/KXueGxgeHcPc9IbWlp
	KDSrXeoufC/b6SZx2XA==
X-Received: from wmbf23.prod.google.com ([2002:a05:600c:5957:b0:495:5899:6e45])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b99:b0:499:7a5e:4c3f with SMTP id 5b1f17b1804b1-4998215a94fmr44349825e9.1.1786614865465;
 Thu, 13 Aug 2026 02:54:25 -0700 (PDT)
Date: Thu, 13 Aug 2026 09:54:19 +0000
In-Reply-To: <20260813095421.1700945-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260813095421.1700945-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.699.gb54405d56f-goog
Message-ID: <20260813095421.1700945-2-tarunsahu@google.com>
Subject: [PATCH v2 1/3] ARM: locomo: use put_device() on device_register() failure
From: Tarun Sahu <tarunsahu@google.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Russell King <linux@armlinux.org.uk>, Geoff Levand <geoff@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, djeffery@redhat.com, 
	Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, dmatlack@google.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, souravsgl@google.com, skhawaja@google.com, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_025428_005602_5406E2E3 
X-CRM114-Status: GOOD (  12.58  )
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

When device_register() fails, calling kfree(dev) directly bypasses the
device_release() callback (locomo_dev_release) and leaks internal driver
core structures allocated during device initialization.

Fix this by replacing direct kfree(dev) with put_device(&dev->dev) when
device_register() returns an error, ensuring proper refcount decrement
and cleanup via locomo_dev_release().

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 arch/arm/common/locomo.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index 55e360452828..0f6689d343b0 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -223,10 +223,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 	int ret;
 
 	dev = kzalloc_obj(struct locomo_dev);
-	if (!dev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dev)
+		return -ENOMEM;
 
 	/*
 	 * If the parent device has a DMA mask associated with it,
@@ -255,10 +253,11 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 
 	ret = device_register(&dev->dev);
 	if (ret) {
- out:
-		kfree(dev);
+		put_device(&dev->dev);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 #ifdef CONFIG_PM
-- 
2.55.0.699.gb54405d56f-goog


