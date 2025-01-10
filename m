Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFC3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UzIA+H5wuzkNSSs8ypYnf254qfQr3qGIN47AimFa5yo=; b=n/QkbuMASZFHBqB5Ou3zIyuJPK
	fpKjh430QAda2oL7i+/qWN1NIJuS4fBhxHcF+LZPlpEkbram0nwpRNRS+Zr4URsQEQ9iiLpNs+6so
	QkVJQXaZnK0yBuUkc4yMH/KipS0FABRbw688VvorPgsBl7TcWC8mhCbO3+r0JMjX43AyNRrAEKkbN
	sGYUjwz5EN1ZmHJG8x6oa1sMGFwpBscj7il5dkiT7LWPaE+FGlF50PHwVRcS4Ly3Ylk6VR9Gsd0I9
	zQFwwulWMwqZalapo6SNLQ80ijYWZzGq4WEqNbDtc+VVvYg+9s+vyxPtbLwJIcWK6euTkRggkYtaB
	8AxjP/5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWE0Y-0000000FF2U-1Ndd;
	Fri, 10 Jan 2025 12:20:58 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDzJ-0000000FEgq-1ygB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 12:19:42 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-aa6a7bea04cso133717266b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 04:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736511579; x=1737116379; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UzIA+H5wuzkNSSs8ypYnf254qfQr3qGIN47AimFa5yo=;
        b=txldByU1rXgM7C0XanrXYl+Cb1RWUxodrjUVS9QwktrG7hPqL/uQgSxJ/xbypqi2X3
         9xKWY5mnEzX9FOC8s68MH4CqctPYBfkuXNiYTqYWM0g9tmiSkwgADEwsOM8vif8YRiLd
         wluYrSb/8VvwVRG4cYE9E9D0AI6C5sskx/TREINkUFm3tRcb7BK+xkK/piuhITCeuW0M
         lBHSx6hiIDH4xSzpBEeUGm2wR6cLP+n08QTcW8/yQC5Oyp6FkhlIZkoUmODHR9fI4TFM
         UOwHWVXIek4pRtg4l3468KoEp+WkAiyYMYmbdiLbM6yQ/PTyBLRqzM3Rm99RE8qKtiS1
         uW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736511579; x=1737116379;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzIA+H5wuzkNSSs8ypYnf254qfQr3qGIN47AimFa5yo=;
        b=mYGy5joCiSTfvJJH5qmJAHAx+iN3p+x2f8zzh3YUvneOr8Iq4QuTKFhOnGRZipKL67
         rqHkPnfjEIJUDncSMgMxOtfLhFSJrrGUu0x0UHhusF2fyio+1NM2XIUcVXYT/0uK884e
         eOn3/7qebGtez35EuPC/BoWikVyu0zmCQHoqZeHKvxsa5jWyv2sKgsRgxOzwjJi2Q6Ft
         WuZtw1i15m5sMXVxnwE6d+CN8sh0ATv5AWxwfWwwpZhYKueiKCIjVh+oIuz4fOMiF7+3
         xL9ixGFqBeHuQPBxS1IchoJhcQ0vAFz/g6XCIq5COLA2+ctzGmqbFWFbPsdj9nWsapUO
         inyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXsNBK1IAJ0wrAwJXYpol8xXsev0tdmK6EUcho5DoGpS2QPeLakbEnVprEVXRguym8JDTbJuXhuMZxBSiSE0DQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxKVCOG7Xpt5JVrq5YkuxKOqQYSgszjYNFONXQAJU3fjGB7pOHB
	xF1tvay0Fqngi07mF+QYOpcfY55wgisJzroWBEUaJQ4yLRGR6f2qHIiQVz1iTedJByQeY9inS9F
	il7WTCQ==
X-Google-Smtp-Source: AGHT+IGkGANyUq4Shs3jRgORa03NUzS4pqhfTUeC/iJcTMOHEUTfabfbJYGdVRZfbZG4wkvfE8dsnSXrOaYh
X-Received: from edx29.prod.google.com ([2002:a50:8e5d:0:b0:5d8:5ec7:f252])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:358d:b0:5d1:1024:978c
 with SMTP id 4fb4d7f45d1cf-5d972dfbc2cmr8663097a12.2.1736511578923; Fri, 10
 Jan 2025 04:19:38 -0800 (PST)
Date: Fri, 10 Jan 2025 12:19:33 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250110121936.1559655-1-qperret@google.com>
Subject: [PATCH 0/3] KVM: arm64: Simplify pKVM memory transitions
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_041941_508347_D413BDA3 
X-CRM114-Status: GOOD (  14.02  )
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

Since its early days, pKVM has formalized memory 'transitions' (shares
and donations) using 'struct pkvm_mem_transition' and bunch of helpers
to manipulate it. The intention was for all transitions to use this
machinery to ensure we're checking things consistently. However, as
development progressed, it became clear that the rigidity of this model
made it really difficult to use in some use-cases which ended-up
side-stepping it entirely. That is the case for the
hyp_{un}pin_shared_mem() and host_{un}share_guest() paths upstream which
use lower level helpers directly, as well as for several other pKVM
features that should land upstream in the future (ex: when a guest
relinquishes a page during ballooning, when annotating a page that is
being DMA'd to, ...). On top of this, the pkvm_mem_transition machinery
requires a lot of boilerplate which makes the code hard to read, but
also adds layers of indirection that no compilers seems to see through,
hence leading to suboptimal generated code.

Given all the above, this series removes the pkvm_mem_transition
machinery from mem_protect.c, and converts all its users to use
__*_{check,set}_page_state_range() low-level helpers directly.

A few things to note:

 - the existing helpers to request, ack, initiate and complete
   transitions were mostly wrappers around
   __*_{check,set}_page_state_range() anyways, so we're not losing that
   much in terms of consistency

 - the pkvm_mem_transition machinery did not suffice to avoid bugs such
   as [1]. The pkvm selftest [2] should do a much better job at that

 - see diffstat ;-)

This series depends on support for NP guest stage-2 for pKVM [3] as well
as the fix in [1]. I've pushed a branch with all the goodies applied [4]
if that can be useful.

Thanks,
Quentin

[1] https://lore.kernel.org/kvmarm/20241128154406.602875-1-qperret@google.com/
[2] https://lore.kernel.org/kvmarm/20241129125800.992468-1-qperret@google.com/
[3] https://lore.kernel.org/kvmarm/20241218194059.3670226-1-qperret@google.com/
[4] https://android-kvm.googlesource.com/linux/+/refs/heads/qperret/no-mem-tx

Quentin Perret (3):
  KVM: arm64: Drop pkvm_mem_transition for FF-A
  KVM: arm64: Drop pkvm_mem_transition for host/hyp sharing
  KVM: arm64: Drop pkvm_mem_transition for host/hyp donations

 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 640 +++-----------------------
 1 file changed, 76 insertions(+), 564 deletions(-)

-- 
2.47.1.688.g23fc6f90ad-goog


