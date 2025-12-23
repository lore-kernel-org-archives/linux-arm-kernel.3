Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE3FE6B272
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MueTHjJz1MUqVwC1Z42zQoG8AmO3MZUaIIU3E1xfDt4=; b=QvbcMe/X3TjInlEoSYKBiJl+HB
	U3uKvmaUXoRPI3OXa4pweOWk4reiTJJD1UleAYAXP0tfgsFqzt6035mnBPz2wOnwts8Fq1mi+ci8n
	BuFcPrLrG4EF6rjF2leoIwhKUbO/TerTvXYuPjRJzNAZamdUnAp0+b8O4hGrRAH6HiPftfAT1fyHb
	1tZAw2sleBu4hjTsWonK2Ycl0OuPms1Y5lvIqYoFjMe5ThXAeQygGQySNyITE3K2R9d2Sq/BDrqWZ
	SrJKlZhkA4Hrp1bsKURwQt6G+lDxinwpKHsWF+Ps6HctkL2QCBlaXNCHKghddNMuketHL6DyZ5aGn
	K0YQ5yGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0FB-0000000EvkB-11h9;
	Tue, 23 Dec 2025 11:07:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0F9-0000000EvjU-2uDT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Dec 2025 11:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MueTHjJz1MUqVwC1Z42zQoG8AmO3MZUaIIU3E1xfDt4=; b=D6jZRZA5N6X1LX1SMnZBjJkKS6
	5JjBNorA9D0VPrjuvF6vF/wNuXa6dQgHI0br3BHvYbYJIRIACvd3DyDSw8e/MExeMhnhpnbffGmCy
	CGuebxbdzkvRozQ1yYsZAdmn3E3DpXvgMGtnIWmDTuhkFxD7vPKvs18fqx2nAk4WbeiPhz2IPHncR
	nhV4zSJbLAAXPll/l0NZOZjlM0kXHJkGE7Bf66pKeu0KTCF8a4qhoaeE0sQyx6Hobmz8g8J4Y8AZd
	VEQVA8IpW8ZgfqMuYaRFOk2C1u7/5mwFvgUB1NE1soG8ad7gO3xlpeFlROaxR5TLvdkgv+FuWiFWs
	3nPMy64w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzNf-0000000GZ1h-3HRz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766488061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MueTHjJz1MUqVwC1Z42zQoG8AmO3MZUaIIU3E1xfDt4=;
	b=XVYuRCqIkVlLPS5Ao2UJTcQTW98OgHWmElZXmAUzZR46U8H/VXxDWYSMtpVLOhWm7H3f9i
	i8+A3wP1XEebRW82aMlbqKaB0JpUIBVdFScTUgCc1tnIpjrRly2xk5SfFTY+zAfKF2sc0p
	1o7KS1elyRdruULAx/+vnaa9EnhWz3w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766488068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MueTHjJz1MUqVwC1Z42zQoG8AmO3MZUaIIU3E1xfDt4=;
	b=YAmoJVhEV+D+TYv3ZiDsS6agIWwXsLcy9yw2ROBUVGESRBNIz6qSrwcFfWDAN7SQtNjSCx
	4QxuRuEpdwCY2R6selS8m20x5F/K0vLksWAXSGXGtYDRR+TozsnzfTzHSUPw1mCtaZun4h
	s6kgnHVAvYh1JAJZleSXFxIwdDOCCp4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-PX9G8qBbNq-sjwK38gFNFw-1; Tue, 23 Dec 2025 06:07:37 -0500
X-MC-Unique: PX9G8qBbNq-sjwK38gFNFw-1
X-Mimecast-MFC-AGG-ID: PX9G8qBbNq-sjwK38gFNFw_1766488056
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so32490665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 03:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766488056; x=1767092856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MueTHjJz1MUqVwC1Z42zQoG8AmO3MZUaIIU3E1xfDt4=;
        b=Gmig9p1e1dzlSnsOm7XL1cgMtZntHqgWgU811GNbGNyplzrMg6DM+7cbM+lXmmf5wH
         Su7ehGXdhR5FGWs8eAYlrLhAI7GkNN6uAVD/WxfaK7Rn3yYGupq1rEpLohFQUlHFBnqN
         fEBh2lNx1VPR5pbeYy5pkBTjmM7BqjIq9QgdjQldA744c21geubJU/sHa0kL3/n0d7A3
         9Sk2iGa9LmmJ9TpCd6UhoSQ4CngxshmTupONV8I0FdQJuboSyhAoz4UFr+kqO2fnNke8
         nqHHk+Q8OarEneojVrzPhXoHvWWrKHPMOm36ffQhSk/blMaqxQTuq5uNeFi0kPTBwPqM
         kwZA==
X-Forwarded-Encrypted: i=1; AJvYcCVxyrK6xogmVdlH44oEBR94YW+MUNk37faDyMKK5NMcWvLozHVwqFzkZwWSoB0L9fWkGkltDFbcFnulGkXKWzPF@lists.infradead.org
X-Gm-Message-State: AOJu0YzgeZzPV2DvMigdj2gNwOw+mwtqBPsVBA//OEfV0Ur9tphKk3PR
	QPZxi/t+Z0U3Lg0arjsjtiGuVgcxGp/zMKIgWhM3jKC4FLFhGrneBEG/1jO8WxXGMcYbMATU2u1
	Dd8zbAkDNf6euJ8BshWrlIa3daZN2JlRo6DSi5486li8YMWraNJybRJGL25fBbFAJtBABTSyU1v
	dz
X-Gm-Gg: AY/fxX7Qi/993+rBOaybGFyKbnqtTj36NeVZINt9qbZ0Ed7SRl870+q5kbOO7xLqGyR
	+gQ4phU4DtteBwOozbwMxmh8tpPBy1WrPPbBZSbfM0HxUsQiTgknPcSuWq/0/y+8iopRAF88GAO
	e6sxpu2eYgtdHAzIoMLTUkc4TEnxR/h99O9xvYYKDOS9EUixW+e/32HIGSieD0rWDiTHwMsCh+L
	Zxuon1qfC+PqwOy6OItadmwU7cJDaTQw0MwWvSUF/YXgikqI2l/vm3gVMwq7ZJ014pPnPQYb32l
	B9PeLL5BN3TDlfS2LMVe+hiMzunigUO/7RU/n81FTf/b9B1E9SUOH7rrrMKFn3rE+61MGHO31Xa
	UCLk8I8Sds9FXSvb5E1vNc5uhSNYbqOMqHh0au1ZVBPhnZowtc0DJv7Yeo88=
X-Received: by 2002:a05:600c:6388:b0:477:7b16:5f88 with SMTP id 5b1f17b1804b1-47d1953345cmr125349785e9.6.1766488056269;
        Tue, 23 Dec 2025 03:07:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdGGtBa3hQA5jZUcQ3Uf3/GwrAQNNoAzyxpHojdJYdt3xnSt88zf6PWkdODE0mU8D/O2ZGoQ==
X-Received: by 2002:a05:600c:6388:b0:477:7b16:5f88 with SMTP id 5b1f17b1804b1-47d1953345cmr125349485e9.6.1766488055878;
        Tue, 23 Dec 2025 03:07:35 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a33c1csm125461535e9.1.2025.12.23.03.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 03:07:35 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Kees Cook <kees@kernel.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] arm64: Kconfig: deprecate redundant ARM64_USE_LSE_ATOMICS
Date: Tue, 23 Dec 2025 12:07:30 +0100
Message-ID: <20251223110730.121239-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wsCCVA7JHcarwRB8nCXrNcu7IdallBHHYAabLnrtYcY_1766488056
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_101240_006718_0D790965 
X-CRM114-Status: GOOD (  23.51  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Currently, the config options ARM64_USE_LSE_ATOMICS and ARM64_LSE_ATOMICS
are equivalent, i.e., ARM64_LSE_ATOMICS is true if and only if
ARM64_USE_LSE_ATOMICS is true.

Prior to commit 395af861377d ("arm64: Move the LSE gas support detection to
Kconfig")---included in v5.6-rc1---only the config option ARM64_LSE_ATOMICS
was defined, and the check for gas support was done in the Makefile. This
mentioned commit then introduces the config option ARM64_USE_LSE_ATOMICS to
be the promptable option, and changes the semantics of ARM64_LSE_ATOMICS to
check for the gas support.

Note that there is then some minor refactoring in commit 2decad92f473
("arm64: mte: Ensure TIF_MTE_ASYNC_FAULT is set atomically"), putting this
gas support check into its own config option AS_HAS_LSE_ATOMICS, but the
logic remains the same. Since every binutils version defined suitable for
kernel compilation then eventually included the required support, the
config option AS_HAS_LSE_ATOMICS and the dependency was dropped with
commit 2555d4c68720 ("arm64: drop binutils version checks"). This then
makes ARM64_USE_LSE_ATOMICS and ARM64_LSE_ATOMICS equivalent. Hence, one
of the two config options can be dropped now.

Considerations for the decision which config option to drop:

  - ARM64_USE_LSE_ATOMICS is promptable by the user since its introduction
    in 2020. So there might be some Kconfig fragments that define this
    config option and expect that this then implies ARM64_LSE_ATOMICS to be
    set. However, within the kernel tree, there is no existing config file
    referring to that option. So, it is unlikely to be widely used.
  - ARM64_LSE_ATOMICS is used in nine places within the arm64 directory in
    the current kernel tree.
  - ARM64_USE_LSE_ATOMICS is the only config option that contains the infix
    string _USE_ to enable support and use of an arm64 architectural
    feature. However, there is not a very stringent and consistent naming
    convention for Kconfig options throughout the kernel tree anyway.
  - The use of the transitional attribute allows to simplify transitioning
    to a different Kconfig symbol name, but also adds some intermediate
    definition to be removed later eventually.

After thoughtful consideration, keep ARM_LSE_ATOMICS and remove
ARM64_USE_LSE_ATOMICS in a two-step approach, first deprecate
ARM64_USE_LSE_ATOMICS with the transitional attribute here and then plan
to completely remove it in two or three years with a further dedicated
commit then.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
CC-ing Vegard and Kees to check that the use of the transitional attribute
is done as it is intended.
 
Note I have set myself a reminder in my personal calendar for three years
in the future from now to remove the transitional Kconfig definition,
assuming by then all users that maintain their Kconfig fragments with
ARM64_USE_LSE_ATOMICS included have transitioned (if such users exist at
all).

 arch/arm64/Kconfig | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3fb4603c0e16..e113555ef6cd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1875,11 +1875,8 @@ config ARM64_PAN
 	  instruction if the cpu does not implement the feature.
 
 config ARM64_LSE_ATOMICS
-	bool
-	default ARM64_USE_LSE_ATOMICS
-
-config ARM64_USE_LSE_ATOMICS
 	bool "Atomic instructions"
+	default ARM64_USE_LSE_ATOMICS
 	default y
 	help
 	  As part of the Large System Extensions, ARMv8.1 introduces new
@@ -1890,6 +1887,13 @@ config ARM64_USE_LSE_ATOMICS
 	  atomic routines. This incurs a small overhead on CPUs that do
 	  not support these instructions.
 
+config ARM64_USE_LSE_ATOMICS
+	bool
+	transitional
+	help
+	  Transitional config for ARM64_USE_LSE_ATOMICS to ARM64_LSE_ATOMICS
+	  migration.
+
 endmenu # "ARMv8.1 architectural features"
 
 menu "ARMv8.2 architectural features"
-- 
2.52.0


