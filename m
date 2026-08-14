Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88F4C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 21:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CpRLa2s9CCSXq/nY6RLLua2/DfHcY8vtQRcWiuG8yfo=; b=vDeN9FRBmA1TG8oPCZxstSu996
	NnUJ26mN1dfyK8CPXx4CB7KjLrTueh4X07j1eZU5UO+45HbslEx1A84pCrerKGKWO9ln558igNlPx
	LkymBBU86uyAmwfaB1S1LHuOyz1x5oFfGkYqpj2YNA4z64W8co7rW4M4+9GCrb5+X9kMTuLu1llQS
	tjGcU4Kz2yVD0+GbXsb5qlvURJZE0n22H/YboQRxuS04qHz4E8YyfBuhtxAb+H1s/5uxnJgXkw0Yr
	zcd4x2XsgKKjuOeT6zmzp9YJH9d89SDCcHiE0s3M9yfaqxpoCgss4HJNrfOjbtRX3r/GaRNJNVXav
	QgYz7ITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuz1V-00000003Bo9-1urr;
	Fri, 14 Aug 2026 21:01:05 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuz1S-00000003BmN-2Ekf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 21:01:03 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c15ce19923fso108463466b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 14:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786741260; x=1787346060; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CpRLa2s9CCSXq/nY6RLLua2/DfHcY8vtQRcWiuG8yfo=;
        b=MUQlym31Oy5kDPbV5kNeSICR7wMax6uPlwawxlgVflNJehIUykauAhaaYQn+D5qKu2
         kodDG6SHdWt7raTiH6TzbouiGXfqDpu4J2zeuwqZQxzSpahSc8EI9c8+hkbOt1vpcjPN
         xEO2oP3nRaJohdrsl09U1mq2tskUq5ogxokQ7Uss+LPSqdPh9nE2LeqnuoKMVY3NjjJ9
         16tMzhmNAMmY9BzGjW+U1J4P4DZD6elgSIs0NOpmZp06btS89izNVK7VywNlkh/HhhOf
         jOi0Xxw8eh4B9HKPoBauSHHtdMGCnjj9OCxKv+HvxsxQ2WtBay7ZNPF5S+tkaPK+2ey7
         D5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741260; x=1787346060;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpRLa2s9CCSXq/nY6RLLua2/DfHcY8vtQRcWiuG8yfo=;
        b=gVtC7ULohQgOti86zqsKAOzRPLd4IzjXI0N5C8Zxt5i9R9OA502BY5/ykSs6tKJGW2
         bywM8J7uVIP+hT7ALedRCMm/t6A6sYEx/5TY4gMzbVSDBFbROzwZaAD9Lw83AyLUhGQ7
         0sCI9S3Do1qFF5uTqjTZdPZXf7fdONeYaB2ot5WoQ73OATk/PTfkIUW7yOqHZeuIwKHj
         /d7fA4Ij2VWULfAr9tCtXp4H8RnKYb//jSEtjiIFvVtvZ1oyof68JtT8qNzjfDOE4ESS
         junxruwEcoagLNKrKdDQGM+jAhOLxLPOf1p2rmnGcu3TR47cKLX+da6x9hNBcWuku9nQ
         gvyA==
X-Gm-Message-State: AOJu0YwExvIHK9pO5PKAoSUUks7XcrQn76+ivMDz6/Uv756Zdh6PTrzN
	wGpnIMx8GxhKY8SrPct6od2IzdT67C6j0DHnRCm1vl3xA9OqvyN/FymGjgTkOnQjI7DD+DsN2aK
	c7mOBOGSuQFccOp/kIA==
X-Received: from ejzu7.prod.google.com ([2002:a17:906:c407:b0:c1f:4de4:c4c7])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:960b:b0:c1c:28e5:652e with SMTP id a640c23a62f3a-c212a228bbfmr401758866b.25.1786741259490;
 Fri, 14 Aug 2026 14:00:59 -0700 (PDT)
Date: Fri, 14 Aug 2026 21:00:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260814210057.4102768-1-tarunsahu@google.com>
Subject: [PATCH v3 0/3] Convert manual kfree(dev) to put_device()
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
X-CRM114-CacheID: sfid-20260814_140102_581055_B30CFBE8 
X-CRM114-Status: GOOD (  10.86  )
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

Hello,

As per the kernel-doc guidelines, Devices that are tried to register
with device_register or to add using device_add, must use put_device
on their failure path (not kfree). This series contains 3 patches
for updating such instances. Same for kobject_init_and_add or
kobject_add, call kobject_put instead of kfree in case of error.

V3<-V1
1. Updated the commit msg of each patch to mention about the kernel-doc
   guidelines.

V2 <- V1
1. Removed patch [1] as it is part of another series [2] already.

[1]: https://lore.kernel.org/all/20260810162814.1398016-4-tarunsahu@google.com/
[2]: https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd.com/

Tarun Sahu (3):
  ARM: locomo: use put_device() on device_register() failure
  firmware/edd: use kobject_put() on edd_device_register() failure
  powerpc/ps3: use put_device() on device_register() failure in
    ps3_system_bus_device_register

 arch/arm/common/locomo.c                 | 13 ++--
 arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
 arch/powerpc/platforms/ps3/system-bus.c  |  2 +
 drivers/firmware/edd.c                   |  2 +-
 4 files changed, 59 insertions(+), 41 deletions(-)


base-commit: ddca0cd800962b4121e5f2633005167bb6216175
-- 
2.55.0.691.gc56d675ccc-goog


