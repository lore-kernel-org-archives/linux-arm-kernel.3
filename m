Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28DAC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iDGvS9HpsrPtLNw2H79kc5fyPEaWVAB8Beu1OXPCfRo=; b=VGyjjPlNe1TdtCXuxgQetzKWAO
	bVrst6OGqwg9lxg+LBqI64CmsOnMNfK9s3mx98FNt5QE8KZDxyjo3n5Mw6SJI57tdMidBWpTa6th6
	eTw4Y0Bdpay7zfi7+XwG+FXgSNKV0Ri3ZD6OlHSq6M2lcWgnZ9DgR0u8dgbnH+EBppb5U5lEwY6C7
	XmI63e0x22yDS7zHSwCmTIiOfbav/qed8kN4e69puHHgluE3SMq+ED8rAz+UV3IzHipTXCQaXwuQZ
	zoqgSAgjHqhv/QVogfI8ZrQ7IkBQMUDOU1dzX9YvmeiHbg9BwRWfUgHkbI61C9sCFiOXXbLz4THsC
	IbWMeqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSxj-0000000CPBc-3LLc;
	Mon, 10 Aug 2026 16:34:55 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSxh-0000000CPAV-37Kk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:34:54 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c15fed5653eso132735666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379691; x=1786984491; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDGvS9HpsrPtLNw2H79kc5fyPEaWVAB8Beu1OXPCfRo=;
        b=nZwdTz+v+OjOq2i6WDT/ob54yjINe9C6rCHuoi90hfBHmPz2CyUWc6V2HGBCCO/HYQ
         K3jbmyfBeC7sHVIM4SV1ixIuj1u19GajpfBkLOkRCaglQvD3L3xArIrHaqILizb2Yzv9
         lQ6EdZDtyWx7P4vh+1KGVeBiL+RwB8tqkBRM2cVK5bXNUuFWzTK3U0Zov1z+h6S9a7wT
         ebxn/WxtMf9bZezNovUlYQbb1BLLj/Dct5uXTmgGWAsHv5td7D3lTZQGD3ptFnQqSSPK
         fqVCZ0r0Am0MtP5zW1Ss/8nkfX+jDwYLBPjOHhnWsi8zqz0iknnE15soX1pLNnY2OBQk
         wwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379691; x=1786984491;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDGvS9HpsrPtLNw2H79kc5fyPEaWVAB8Beu1OXPCfRo=;
        b=aGrkRt5eGcw0zBtWQpVGzt38lKvzMQsV9IkFzfq/AxaeJoEoDB6BK2ugvoZY31OBB2
         nuU27dUXBqP1HAec9AXm5FZZYwfq4e/nnOnIqLh8Hu4s8gNnHre4fo9Lk2s7mYJNwU3J
         AYxtxzRtjWmMMNgVrtF5+01TH4OlEPfSbaM6NE4EJ1muthWEBL6jAXNuBbdIGb5+dAsn
         Jo6snsae7TinRJ2492+P6UuYY3mDLCnOcpn4Br29TSKQ8aWtigLNayJVZvGjCfAMS5on
         hzs9nPjPkv4dRmfpeMCo0RR5RM90MCkQ4Ag3Wgo5OZLIZC1y8xJ8fB61UMkruS9Ivp4S
         J9sA==
X-Forwarded-Encrypted: i=1; AHgh+Rrea1fsjhS9N1kLp428i10jHNDkpRpb5q91iO4cR87OcNBS9ML0S2pH4mIj2Pf+vawOQLUBiiuEQK46m4iaZUrl@lists.infradead.org
X-Gm-Message-State: AOJu0YzkFPKdHEyUp5vu0XYw1o0eI8IV2QR3yeKWiUFeZeHZRG17HLMK
	LuYl40mMtErCvb1TKv+NyPVrjq9PjraKqCz8T4IZ9zW6Q8g5yaPuHgnF15SS996tUV1iGajbWk5
	QRo7wJsknISxp8XHfvw==
X-Received: from ejzq2.prod.google.com ([2002:a17:906:b282:b0:c1c:22c5:732])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7ba5:b0:c15:f26a:342f with SMTP id a640c23a62f3a-c2073392a89mr1505099466b.23.1786379690769;
 Mon, 10 Aug 2026 09:34:50 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:10 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-1-tarunsahu@google.com>
Subject: [PATCH 0/4] Convert manual kfree(dev) to put_device()
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
X-CRM114-CacheID: sfid-20260810_093453_789535_D5BF0032 
X-CRM114-Status: UNSURE (   9.55  )
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

As per the guidelines, no devices that are tried to register with
device_register or to add using device_add, must use put_device on their
failure path. These series contains 4 patches that update these
instances.

Tarun Sahu (4):
  ARM: locomo: use put_device() on device_register() failure
  firmware/edd: use kobject_put() on edd_device_register() failure
  EDAC/versalnet: use put_device() on device_register() failure
  powerpc/ps3: use put_device() on device_register() failure in
    ps3_system_bus_device_register

 arch/arm/common/locomo.c                 | 13 ++--
 arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
 arch/powerpc/platforms/ps3/system-bus.c  |  2 +
 drivers/edac/versalnet_edac.c            |  6 +-
 drivers/firmware/edd.c                   |  2 +-
 5 files changed, 63 insertions(+), 43 deletions(-)


base-commit: dbaafe9cc56a996931eedfe043eb34418cc9cd9b
-- 
2.55.0.679.g6767b8d81c-goog


