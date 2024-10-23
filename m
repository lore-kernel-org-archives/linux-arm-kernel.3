Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA2CCFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sjJwOqBa6AK8/TR77kHwHcznf7IiYMoRphf6RMACy5Q=; b=kI8Gsdvc1BiCtpfV3dpGaNV+XN
	QJzGhcJlVx3F1WDejSwBLV73/w9Ga1gk45GfwGoSY/MDDVppFvQqsNjxs1quFu1Vm26nMuM1lxlIj
	aAdLDXlwbDByVOzIIU0HmymGQp/Jsf1MawoQyxFxzC3Ql4d1UbiWpwElYGjSPXAoqGmYxXFFgLUeV
	5KK0uJfZomWR3ZCOyIl/Y1CsKteI+O+3h4PB9wWv/IpA1vi1WsiETNVPhuMp+krsf/L8u7XdCsD0r
	LHYvnLokUGToRc8qypPFvCc6/cwT0tWd22Mr2UC+0msf097Xsi2xfhJeqz3f/VBnncOa9UOGFCqmc
	GQaHaXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fyQ-0000000FVWj-44c3;
	Wed, 23 Oct 2024 18:20:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3evB-0000000FKaj-1qv4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 17:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=sjJwOqBa6AK8/TR77kHwHcznf7IiYMoRphf6RMACy5Q=; b=Tfk7KD36cL7aQjDSpw/0mXpxsZ
	X3NkyZc63DLMiQUFyzhDXgbqhVSFjSxPtkOT7NJIsUjYzreESyVD3BIL5+3d9bu6Yd6+MsDB/j6zk
	xszcDgJUCnbZAh5oyeWnx3A5wrNRMl9KJs+PQi3dBetSkuq9fOnqiFzLjF9vjxKejkcemBRZA//nV
	BXOJVWNkMAbhs66hp407/fxydxfctWsT2DpgPf998uIPjAYyVouTAJoJF4UB3oHwDySAYT+HV9LPj
	pgDljESoR9f0oNII9VJRA+2qJs5uBmtJZn3mEnA4FLmoYGxlTw+eOvd4Fmiu1srdpl5vSQXqP4Z0b
	gegrcDfw==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ev5-00000008UBe-0Tcd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 17:13:16 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e28ef71f0d8so68032276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729703592; x=1730308392; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sjJwOqBa6AK8/TR77kHwHcznf7IiYMoRphf6RMACy5Q=;
        b=lEF0ryORaXaDmwfTIjAEOqQKauUg6I2lWZApQ12OJqXbF+ffOztUYz6xZ5r7jGc01e
         MAk6l0MXRePLuMj+78vxyWCdLNzdLRPpq13zzQO116aeLF/wcpLL9nB/zqq6BGJyPkdN
         HIbSCxVx6FULY4IFBbZydbddsflOxLe8MH/Y6RMh3xT+UfxawaecVnB8L1qxi8JcGIoh
         wbPylmLQ+yfKsxyiezc9rLtXT71HKOfVGENDUszuQ5JvDvyHxkkEZT7WNWxvaT5OZl+e
         ybTLJCssjBmcjAKrb9VjdoOnvJgxws4KgB/YjDjtQeNQ1BCQM5lyiXBmyidZS6cBJeN1
         JFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729703592; x=1730308392;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjJwOqBa6AK8/TR77kHwHcznf7IiYMoRphf6RMACy5Q=;
        b=N1HPYmYWGHBqH7bsFfc7bVZa7FNPKqgIlQ6A03RHdT4dn7wXlSZmlpu/RC2WUb0QjG
         oXLLGdbDqJ5hHOdLjyMmJHnzkO//z8lgN9WfJTvD/98Hh8Lz44dnR6l7mAY0B4smmI9x
         bUbOl/qogZ5GZe00u6Wt4uGUyIvJjuSt3Ugi0L0+eaRTNL4/iXYMyC42gWZjQs/Vvryd
         /EJ9djSi9ZgjrylqeIjz6ZT/8kKcLmKudnKZpIHsKn0W+JzmidLtlTSBPlWaji59LVIY
         e3jHhpfxeCZ+Ldwu9+Nt4ckt/mYF7wvShmlskL3LYPiX5YvGoNMhTfh8I+cYs9rZmOXN
         Es4w==
X-Forwarded-Encrypted: i=1; AJvYcCWrZ+lo1ytjdt6g/FAmgq9ePaJy+x8s6EdDGz/3zCKuhIqb1/EmFLdPG1DnmKkbw6P39Tev+GsKDN2Tkd86PII1@lists.infradead.org
X-Gm-Message-State: AOJu0YyzOceKbaZZzvRbb60wbMnRuNklIeS0Zxt4x/3+PoNSdLMnTt44
	6CLs6s7lrs1TK+NC6vozvLavTb1qwxhYDWA6U01VIKeOk5n6NPG08xSTbj7VzlQnUJbPAfZS2w3
	WVCpBg9Nadw==
X-Google-Smtp-Source: AGHT+IFzj+UPbqIngfYZg8jfoSUOtJUbhZmymzy/LpsBgzX9feIS82Pp9ab/ElSPVxx+P987jYpoPGCk3MktKg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5b:b90:0:b0:e27:3e6a:345 with SMTP id
 3f1490d57ef6-e2e3a6dd19amr1836276.10.1729703592399; Wed, 23 Oct 2024 10:13:12
 -0700 (PDT)
Date: Wed, 23 Oct 2024 17:12:43 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023171244.4031151-1-smostafa@google.com>
Subject: [PATCH] Documentation: Update the behaviour of "kvm-arm.mode"
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: corbet@lwn.net, Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_181315_319734_30772148 
X-CRM114-Status: GOOD (  12.26  )
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

Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
VHE support") modified the behaviour of "kvm-arm.mode=protected" without
the updating the kernel parameters doc.

Update it to match the current implementation.

Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bb48ae24ae69..59a0dd7e2de6 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2723,8 +2723,12 @@
 			nvhe: Standard nVHE-based mode, without support for
 			      protected guests.
 
-			protected: nVHE-based mode with support for guests whose
+			protected: hVHE-based mode with support for guests whose
 				   state is kept private from the host.
+				   In case hVHE is not supported in hardware, it will
+				   boot with protected nVHE.
+				   nVHE protected mode can still be forced on VHE systems
+				   using "kvm_arm.mode=protected arm64_sw.hvhe=0 id_aa64mmfr1.vh=0"
 
 			nested: VHE-based mode with support for nested
 				virtualization. Requires at least ARMv8.3
-- 
2.47.0.105.g07ac214952-goog


