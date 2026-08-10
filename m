Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B56CC5B56D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2W9GjrX12XMdTPANAxHOJwxcvmu8lBZVUg7itISKfu8=; b=1EJtZoAVvx9C6cZUK+siYnLz2u
	g6gXSDJIewHPQHIUenDTVjgtAv/p86P+6ToqsVMSxhF8p+qHC2iZR4V8cYjTPotiz4zTAkI2u3M9H
	j/EFi3haOZGftLGKnNWL+K2rY+kVs3P4HLhorg0+ivmSD051VcABGmIuZqL+Khagf2FSVWm3QsH78
	Oy2pxR8Ee/uz6QXwmnCMlFb05afShOdfTPb+ebSI/oLvQxaGMmmZhyl0DK2A4Np87CheW+l9jrRUz
	7uQgE80pHfx+oYx6Ev7l3S3FAYW8z5sR4Smsp6mnnd2b+sC69cVWvPnWaFogqXUx9HPYPkGOw+Lva
	SGdKm0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSxn-0000000CPEP-49jd;
	Mon, 10 Aug 2026 16:34:59 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSxj-0000000CPAe-07N5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:34:56 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6a0a4f0e0cbso2455447a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 09:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379693; x=1786984493; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2W9GjrX12XMdTPANAxHOJwxcvmu8lBZVUg7itISKfu8=;
        b=jj5yYTld0kS10pWFZWRzw0voTUrvAaFHcWcmyf5W6lvRLva1MC+S8qqP6qJKibsxdX
         vrPawICYCb9CjTZiqYttAR6e8GvItfmRHw730YD3+NdKEW7m5HHbomSeOqkw3gJiCHHg
         8peALlpb60cCG8Yl1cp2TiH14rAmBwWU+5+INx3P3vW1skKwMEs3JAFRQhC3jTVV5TcI
         TQ+im8Q5zCSHReYDVEFhOCeEoBZyo8j75x+uNXO2ndyaJuuWKz0R5nutSbA734IybvSH
         mBCEpigGcZSBLWymWakifBVZ70IZHWMhgMSiuBKfmRbKMLbp7wShp5ptVxuOnGZzQAhr
         oZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379693; x=1786984493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2W9GjrX12XMdTPANAxHOJwxcvmu8lBZVUg7itISKfu8=;
        b=afVTuNQcTG34v6rE0EZDbljrxAw64wt+I1Ek32CwfLTlQhma8bZdDjgYHSJrhKbnvy
         HCaWUMqTqfPkB4ztHvqE3DHihvH31BSFWigXS08ubGbleiJ4LkctQBagp9Cw64hUa6ln
         JqJrBTaYBb97IiwCQSnPDPkZ+uUyNR0Wet9lDCshIKp8K8KSJurOja3/blhnVNoVaDcV
         3qs/RbwQw9ELFaRdIHaae8plSrTHqPLry02ckY7QwZoxZlEuekiJ3qPYsCTXZ3kpInmB
         8jcRek8tZA1NiXuxuwjeZ9KKrdqNEG18tHONg+Ox0jDqTVBHaot4vlVdz4MiR5kaBY/g
         yAQg==
X-Forwarded-Encrypted: i=1; AHgh+RruHyOowUaFwj2HsWHc1G2Wa/VG70mI5WtBsfhEq52MB5JqHC2pzpVD21GfnxRUMbfxURaW5wMHYxg/fnh9qgKZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw72l/Exf8wQL0TF05I8Ro1P5lWD6cl9Ns9Q0fpSm0BZj84NJr2
	Q0UrRDhW6lClkW9h4fFEMwTIMI7OrgQMbsiaJWP5F/JJJzntzwPrEwA96CKjLcTkdElM1M/RW2N
	Vv/wvZyYOO6UKs/MQrQ==
X-Received: from edbay18.prod.google.com ([2002:a05:6402:2032:b0:6a0:a508:c896])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:454b:b0:6a1:c908:1701 with SMTP id 4fb4d7f45d1cf-6a355e2d32amr1548538a12.13.1786379692937;
 Mon, 10 Aug 2026 09:34:52 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:12 +0000
In-Reply-To: <20260810162814.1398016-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-3-tarunsahu@google.com>
Subject: [PATCH 2/4] firmware/edd: use kobject_put() on edd_device_register() failure
From: Tarun Sahu <tarunsahu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geoff Levand <geoff@infradead.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmatlack@google.com, Borislav Petkov <bp@alien8.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, djeffery@redhat.com, 
	Tony Luck <tony.luck@intel.com>, skhawaja@google.com, 
	Russell King <linux@armlinux.org.uk>, stuart.w.hayes@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-edac@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_093455_074881_4E26EF22 
X-CRM114-Status: GOOD (  12.48  )
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
2.55.0.679.g6767b8d81c-goog


