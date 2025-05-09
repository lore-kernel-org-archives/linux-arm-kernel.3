Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214A3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VL9vZro0BdFwyk98zVNm2YYJ6CabP26FrlBnQZyFPJw=; b=z/871WCSyOyqX77H10BMlj6Vcq
	sUUaRJ/c70EdTYunKpjrvjyXDuQgZnBi3E1qOHLV+njnEcRd92ILuTYwIqRzSCftj32vh4K/ZfI89
	77NWCY83F8qLjxHXKt0VKonYU6Ftlg1WQ048RRWD+4daOHp6AGaEugap6AllY/lj9oNkMQqweX08X
	5UzZpttoBocQOU88mVPSiN4gzaKt5wnc2gEJFAa56wCfmOnFPPRAU5qsUzMNJ87jnXAfqVBCpGEab
	xdOqEMaaXXqCfkyaaa/oG2pYz3H4jZWaiHSTDmb0esEkPPqXtp0WvryirhgQTgHKzysOz6XcRBaRk
	GgnsNtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRDb-00000004OqT-2ODU;
	Fri, 09 May 2025 17:09:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOn6-00000003xOp-2LIA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746801209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VL9vZro0BdFwyk98zVNm2YYJ6CabP26FrlBnQZyFPJw=;
	b=dQ/Az3sbshrb2QeFUahnm5D/AAm8p5Xlki/QUT4VIyhE98duGHz0xqLtfnoc78e0C6knBN
	l2cbWhRRVKzodh9ajgjioIFgIXq03vU3JaXlBWjrfQbG70Scgs4ylf859I8WqsGWDgj4hh
	2XOF1yQMTbK0sC0+BjgoE4iBYo0yTGY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-QhawsC_zN1mQFtvGvuFHYA-1; Fri, 09 May 2025 10:33:26 -0400
X-MC-Unique: QhawsC_zN1mQFtvGvuFHYA-1
X-Mimecast-MFC-AGG-ID: QhawsC_zN1mQFtvGvuFHYA_1746801205
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so10541615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 07:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746801205; x=1747406005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VL9vZro0BdFwyk98zVNm2YYJ6CabP26FrlBnQZyFPJw=;
        b=G4sNx+9ejQpMDUuSQzxOKHviJZ24cmaqq9cavH0eqzrTMH+gBJd7D4+UA0O6SLEuP8
         NkuggoapfAH/R/6mCnFUhJ444PpAHaw0uFu4shmG0MqmnKYsWI05hFqJc0+maej46ehH
         0M50QZPdxBFWcc7+8I69HvI4CqkbujnQ1p59iuXLErAL1WfiCSLf6Sx9ugPnr1hujPnl
         O6CR2sUacB0V8GAe4LCvlvSIg+pKLUyHsFqAyKp3MnrhutSpZqa4Q1KRLX+FZzThJEDs
         hSBET4RhrFmmCsAPsiXWYPAXBxAAW67hQWBk+aaxn20B7hu1/JgN/KO4ZKvjfSzlYzmO
         gCxw==
X-Forwarded-Encrypted: i=1; AJvYcCVwNPAjIQ4CcvUVQDSG7nYQcJ1sjzZqznOi1G6X9/HdBI47wPye4Mas3yRSv/qpKY5GzEbOnpPxpF/i36LQn494@lists.infradead.org
X-Gm-Message-State: AOJu0YyEAfPw6eywTfl9E5NFoPylVBKYBRBv+UVzx839iU0eKBecqltF
	fvQH4BFIQXWIuHLcH+Ac+laPHT+KRQjKOzIPTaAyxtl75Lw1noLzrgOqUn0nlObFhdyKgrMJy9z
	Hlbq5wRFI9wRIuPVUvAchcsO6xzL7vNM1pinMX4tDx7CqBaC06GPOu4uSCYmaYWrKuvpxqrPA
X-Gm-Gg: ASbGncv8Dl9Uu4kQ/ClsLpnhKDykoYuyAtdk9jiYqaLP66I/odbWuWxfID27jM4jJ1V
	nmCi1C5mF5rIFIsZQegKDewuBfzFFSlRm9LoRyrapZlCq9AoYxcXzhPoktjwGjE2j6YTUyt2Hq1
	9ZXjPJoCegabwTdRMyK61mkQmSIfnfYmm2v+5bVFfASSorWrxTLo0DVbesCusNBkpUzIhjpbnmf
	TGN05ctqIloM6MBpEZFF04kr001R3n1rPryNQVUwihoCuAy8nl1UxEPrH+sTdJM8qg28Ld5u8ov
	6BSgMZIHoVsOGiL1QYkIXdAT8jkImQYhy0n4GaENpNABSHPEQFWc9E/wNdWaRjH1XP31x/JafOA
	=
X-Received: by 2002:a05:600c:83ca:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-442d6d18302mr36807145e9.3.1746801204806;
        Fri, 09 May 2025 07:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsWDESg6zUq+whRTNp61iivnxaZlKkiv8gH+MG5fYiPl5xSd+s4VyqNCOQwrNmOxuB7m8DQQ==
X-Received: by 2002:a05:600c:83ca:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-442d6d18302mr36806865e9.3.1746801204462;
        Fri, 09 May 2025 07:33:24 -0700 (PDT)
Received: from rh.redhat.com (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm32150775e9.4.2025.05.09.07.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:33:24 -0700 (PDT)
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
Subject: [PATCH 0/3] KVM: arm64: selftests: arch_timer_edge_cases fixes
Date: Fri,  9 May 2025 16:33:09 +0200
Message-ID: <20250509143312.34224-1-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JkKRTcOMMW0RIk8JLYS77uWC7dLu7mWZDHCao7NEphk_1746801205
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_073332_668190_E3896B92 
X-CRM114-Status: UNSURE (   7.16  )
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

Some small fixes for arch_timer_edge_cases that I stumbled upon
while debugging failures for this selftest on ampere-one.

Sebastian Ott (3):
  KVM: arm64: selftests: fix help text for arch_timer_edge_cases
  KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
  KVM: arm64: selftests: arch_timer_edge_cases - workaround for
    AC03_CPU_14

 .../selftests/kvm/arm64/arch_timer_edge_cases.c      | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)


base-commit: 9c69f88849045499e8ad114e5e13dbb3c85f4443
-- 
2.49.0


