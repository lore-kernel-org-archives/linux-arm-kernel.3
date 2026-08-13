Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA51BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+Ghwm16zCb3XluSdXC+OMNEFWBin0x6u6wWkTNkW+w=; b=upzpPdo6/POAZBHOqL9NyqBsBx
	WOpaERaf0whdWZMdt2vptqYxnKkcICXm0FpAoq20mKb5dL5k3FHwVb8QU9PxJMGG57aOPmW7yNh3Y
	dK8g86b2DraptZFK00k2lnB5RoerD9tNrzfIJc1M+CfTkh7DGZH+zmEgATSIWtrMGs5iPPWqXfgm5
	D2zUwBJEYksyOeJe1ICXqfi069jIZ67wfoRuBH79r8IyjQnrR5KLz4nml/8jKjjNyDAhkQRFMDAzU
	D1NVM5X0eeCl02L6FC5RjuIqoUc/qf8PGymi9pFG+fngvJUvBPBAWH6B6EmGcc/1LWukFek1u32zS
	zZEqj6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS8w-00000000Ndz-1iqR;
	Thu, 13 Aug 2026 09:54:34 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS8r-00000000Nah-0Nxe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:54:30 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6a17bf3d42eso1729232a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 02:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786614866; x=1787219666; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+Ghwm16zCb3XluSdXC+OMNEFWBin0x6u6wWkTNkW+w=;
        b=evYoUDvZ0AwetTBX5Jv1uXwvZyXiCLoDcws3n3Mm89IBlJSWcidw9DFAPI2iuNbiwa
         Hh492pTVdJy3zKCgUdEMf8DIHNbSVK9B9HpWeyTvte8Cn0mL9PWW0QtFmj+NeMBUuInA
         4XUYPc+CWq/EfBNrZxaOSYzwi/DEYhPDmc+oA4sa47a+4q3qAYoaugRfEPF3zpuyM3XC
         VI5SIay3TpJoJ+1CLCkR2uDKsqikS+K0Mza0uP6M1zKT4zgxYHCFX94C1uIhjhWNKMMv
         VZmX9RNw7Qb79Z4Owp76qRLzCC4kLoEwdGkdFfQeQUELXvmYTzxmQr/Io623b/fCyOQs
         9PBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614866; x=1787219666;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+Ghwm16zCb3XluSdXC+OMNEFWBin0x6u6wWkTNkW+w=;
        b=gX4uernwL9xGvF87ATu46OAvsQSRGp0mzXQdNaWBdrNLQTpWjndoB/fb5f3l4Bf28R
         Nh81vcfCUv1kqv/lzU7gxNAvgWdegSisXEdKIqlFftAzD0bI+uEP4IGd7cfG3AsBYCFJ
         UwwMtgqa573pCoW+js3DvGds+t7x7LIkEii2SaEWPv9cHEV5J5XVRgSakQWzeJmA54jv
         ikj6ZZITWYiahErqP8roAUraW/oJ5txKcRUnSob8qX8xqetlJy3cmGUo3Rla1VvsahFx
         pybHbsxuwoqytnz5sxEFcD0swY3Eh2Xa0E5grtCpCMNUrb02z5cE4SRevCXSF+1lyAK5
         BNpA==
X-Gm-Message-State: AOJu0YySpy0PBiN6BZXL9ts81jWxj96zuJHZtM0ho7B2mOZX5ZpdmGe0
	q80ROBGce0bb/5KzsMqh7xHyqzAAP+5VMlbEbwi22YfYJMpW4kZNRCBzDtlOa+zMJhhQ4ZAhiPk
	ZQf5FqD5YE1V4rZpLnQ==
X-Received: from edqz25.prod.google.com ([2002:aa7:d419:0:b0:6a0:51ba:9873])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1948:b0:6a0:a4be:6ed0 with SMTP id 4fb4d7f45d1cf-6a380618f4emr2015007a12.17.1786614866346;
 Thu, 13 Aug 2026 02:54:26 -0700 (PDT)
Date: Thu, 13 Aug 2026 09:54:20 +0000
In-Reply-To: <20260813095421.1700945-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260813095421.1700945-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.699.gb54405d56f-goog
Message-ID: <20260813095421.1700945-3-tarunsahu@google.com>
Subject: [PATCH v2 2/3] firmware/edd: use kobject_put() on edd_device_register()
 failure
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
X-CRM114-CacheID: sfid-20260813_025429_135861_D1C713B3 
X-CRM114-Status: GOOD (  11.80  )
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

When edd_device_register() fails after initializing the kobject with
kobject_init_and_add(), calling kfree(edev) directly bypasses the
kobject release callback (edd_release) and leaks the allocated kobject
resources.

Fix this by replacing direct kfree(edev) with kobject_put(&edev->kobj) on
registration failure.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
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
2.55.0.699.gb54405d56f-goog


