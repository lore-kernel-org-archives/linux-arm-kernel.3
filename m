Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E66C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UoJE0ONwiW9+839EaZ7hWiQ9yyPS5ERFdBgspRFFZDw=; b=3nyseOb/EblgRvJfTpcp2A4Z6s
	QgVeRbViS49pYwggiHWVYoZZzGYWOpr+webv0Mf4UZaxR3IlDMy3Mk+olGNKh+a4CkQktXdCyKVxa
	6drx21Av6Xzz/OXCvKqtCnCUhP4d3D+VQDyh4N6W1dO4yZwKYfj3ISfjBf2Xun/r65abu3KrY9MT6
	NliwUrjxhlaw0NBnIfvOWWiNRX7eN1u61MiSPrek8fMJU3gWMYMv2RA/GuRE3r2uKTW1G9Yd5I+P6
	55yskjhZ1LFqq8L6FALPB5HAOA9qt1tFH+oFNcDsUWY7ivDDlTTdgmmUOM0aG1mkzsvs5V7lhTTsx
	6uHAyndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS8s-00000000Nbw-0ekB;
	Thu, 13 Aug 2026 09:54:30 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS8p-00000000Na1-1RFy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:54:28 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6a19d668ba3so2398336a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786614864; x=1787219664; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoJE0ONwiW9+839EaZ7hWiQ9yyPS5ERFdBgspRFFZDw=;
        b=dTizoCBwxgHs48HEDGOP9lXfgCDJXd/AbHhEzJLVZszH0EO+Fg1J47IpS7uOo7dquF
         32L7psyMFdmVtFAxcY5sDcoKqSW86MmP3aTNjLl5MCURXn+QJqz3eXQqMEGooXjEPIXA
         J3JzgfVdFNR4i8OnQWmqzR+6UB95oO0twyoVgJwrBiKKwPGN9rHAVakwwS2jHxDN52p9
         eqhukTQ9ZVkTdVxChT9vDx2WYM0EOJ08BrUwqZ7Wjk6ocoJ0TN9L9BlhPTSxrlgg+Mir
         1mYHaGzkbq8KHHu01DIGpYRMUte69Q2TSUSb4YkD1T9+ddZ2MRMCmNBKM7MoxhA0IUNw
         fn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614864; x=1787219664;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoJE0ONwiW9+839EaZ7hWiQ9yyPS5ERFdBgspRFFZDw=;
        b=pgHlRUDz2HzdbTOYM/ZpgO36GtemvS346m0PUn3EBkR9GJttmmYyzprFpUTHwDbKPu
         xEvTvI2TtwesE2wyjPgSdi/LNPo807h2WkXew6KIbiLnwQM5LZTxvyodGd0uMhS09h9S
         45d+fb5/UrcTDlV0Ul+g4jMUWpCuc5yhtYKcTLTSdSAYxBDZvB5xVboXjJVLfDPmINT6
         8bYAzN/9/GgJsmPLRhHufUQ1BIwfWqWvgLpgZzvV9juM+pH+5ZBLxlzC+DIq1rwzvyMr
         7UmBOJhFnEzdfd55KMG7EKdWbYWt2vlxB7hwGREfuKRiuELgmR3ABz1l2A3uX8o3UotP
         mYEw==
X-Gm-Message-State: AOJu0Yzfv/U9uvT7GHmpQDSmXztZ8vHC25JZKeWgPZa+7uBJurV+GTUZ
	nozGYf//QOgUDdxP04+Wrg9X2C5ex0ZW2pqOWekO9O8JbHuEnREZ/0e0/xAAvXYR8/BsOZhpQtJ
	OvJ4nPaOH1Lau0XXSKg==
X-Received: from edtl22.prod.google.com ([2002:aa7:cad6:0:b0:69f:aa9b:a336])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6b06:b0:c16:8adf:f183 with SMTP id a640c23a62f3a-c2108f06416mr245963566b.14.1786614864119;
 Thu, 13 Aug 2026 02:54:24 -0700 (PDT)
Date: Thu, 13 Aug 2026 09:54:18 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.699.gb54405d56f-goog
Message-ID: <20260813095421.1700945-1-tarunsahu@google.com>
Subject: [PATCH v2 0/3] Convert manual kfree(dev) to put_device()
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
X-CRM114-CacheID: sfid-20260813_025427_416538_A43A2151 
X-CRM114-Status: UNSURE (   9.34  )
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

Hello,

As per the guidelines, Devices that are tried to register with
device_register or to add using device_add, must use put_device
on their failure path (not kfree). This series contains 3 patches
for updating such instances.

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


base-commit: dbaafe9cc56a996931eedfe043eb34418cc9cd9b
-- 
2.55.0.699.gb54405d56f-goog


