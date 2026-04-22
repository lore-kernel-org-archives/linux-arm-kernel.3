Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03E9FA1FE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 18:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FOfqXcIW8PzAAJseN6kMVkrxS6YbtRJvZudF491F3qk=; b=GvLwQXtF4OsEM5TOD3psBpucxQ
	APhC1aSRQhJYVaqO8AQLUF57D9eXFbYlNcKCMgxuPuckilv/rWhSDDxCmzlOt4g3DVUSv472hsJvl
	+pMbH9aRQoEjK9780PByjb06lwUvhUEMVu7eudFtPjDiCXc0yq8F4ptiIs+wAj8boOcSxYjnSbFzA
	U8tRp+a3hFpxUjop1yr9nbJjIgBkO1e3cS8AR4M0a8asKQ0+XGBW+GUFu7YDtE+1cwpb0XaJySbIe
	hVTnMc4oFfPmJ4D1bPYzUXtTQgvTKvMQovv1sZi2CCrtB8YEeIsQR5hgvYJd/i9NBbLwEtz2L6h3k
	w5rHvokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcBz-0000000Acr2-2w1Z;
	Wed, 22 Apr 2026 18:20:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcBx-0000000Acqf-2Zfd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 18:20:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so5297027f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 11:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776882052; x=1777486852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOfqXcIW8PzAAJseN6kMVkrxS6YbtRJvZudF491F3qk=;
        b=intC8e9G6ijebivxvSxmcNats9eR0wSTA7ogURy2hWdYNiqo/F4CYGdkciJw137ZTV
         8w7nuCmlTcCdWmHkqoWaJt70sHZ6oLt+f9H7Dk1klUqR0mKT+4MevKUCUOH+dDqyNgE8
         AW2L+UpDDx5bPf8Ir2NKuPhSvZr59Y+nY3nyQsqBoLoFA3wXCS+Ky4iFckT4UMUXW1E7
         wRldlw8DELSA7WVs6e04A5wTRXJNOQ6ue2eoZM91KBsmVxsH0Yc2qv1X/mIrZtejWmYp
         86npsWCCgFmeO5mBcPO2bf2Hp5BcRsiXBrs1mHSm4rhGXG+tIWSKs25j3tpaFx+lMbIc
         Ecbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882052; x=1777486852;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOfqXcIW8PzAAJseN6kMVkrxS6YbtRJvZudF491F3qk=;
        b=C823CjRVETl+MCPuk0khfZV2gQQSW7uQYDRK4H9INEwmD+mahenHCDiXP8Enlknu4q
         VY1f/FGp1UhDlmIBJ8v9jH+p5JDm7woeg65vRPakG5el014WrP3D4szTq9GncrasSvbW
         cnDuYwDuaCuVcNxcye0UHSCdG0PqDP9LlIBSGKdy2U1hrWRryFHxyceIyaWJ8QdZRxNk
         EwJqwefnl1G6Bx3pGmy3WDocownBh8wqIAvlg9wEIoypQ4Asai90o9G4VmWrCDAEQ6uN
         5fw0RbuCBQdG84SDQAhEpq4dzDjqAmOGfTVsQRQr8Sdbr0TTFLKZTAfUmjPv6dcEHMN9
         EwPA==
X-Forwarded-Encrypted: i=1; AFNElJ+fxpyX43JrGe3tpx0IeTLSS6FvGBqT3nQ12zdVsPYgGGq+oyjwOkwZeMzxWHLm4kgB5mXlAYIMCx///84lyOIX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3vLPA7KIjEzZxBC/s+7Be/94yPNYPZJuJX7yS7tKBPeG7Vitu
	FPq0dkGgO4KaV6rvvHwIhzEmGrDkynBUl3+D+FIRLUEzRTCnZcL25/Pq
X-Gm-Gg: AeBDievPfvQbh7haFWXKOEyEN5wUTysOF8hw/OovwcDbDz7j9G6Z7a2AU5mYh/GYnz1
	wAWZUIYh1lBowLJPdyv7dKgc7TkcmgoMRrmY2Gt6NjmYjKqK12KoliTgUjNbWOaAtvOfjt6TKXY
	Rx6IMsnEHbfb8qpPUvMO/v0uKB1Qa1J9/QrjDY3qA5nurYXxanWwXrwqHQfmsZWAi4VTFP9IkTg
	StW2zAFx4CR4QbAq02KXWNZqb9+dSQqP33I5eYw2lhdrAiQaBXHh2yA1e8CQrV9vxAlcdQsDvfd
	JEK7rsbxZgcwg6SMNQ4y8nk33XmhU79g/P+fLBYBPzlgDNzgPVm/B+2aF/ryZVEO5B1HJZoob1m
	iMnNxH2wbqu2CMsCN5EBmLxolGovxHNT3NxzVdBNzyP/xPU8PbD4rQ0wIIwWJDUE4LTt7RDDgz+
	1xc1a3o4+zb5SFe2JJD3R1pZK0/QDHLAQgLkaN
X-Received: by 2002:a05:6000:1447:b0:43d:7b90:fa2a with SMTP id ffacd0b85a97d-43fe3db9c3bmr37137540f8f.3.1776882051593;
        Wed, 22 Apr 2026 11:20:51 -0700 (PDT)
Received: from ehlo.thunderbird.net ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d112sm51676217f8f.29.2026.04.22.11.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 11:20:51 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:20:51 +0100
From: Josh Law <joshlaw48@gmail.com>
To: ardb+git@google.com
CC: ardb@kernel.org, arnd@arndb.de, ebiggers@kernel.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-raid@vger.kernel.org, linux@armlinux.org.uk
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_7/8=5D_lib/raid6=3A_Include_asm/?=
 =?US-ASCII?Q?neon-intrinsics=2Eh_rather_than_arm=5Fneon=2Eh?=
In-Reply-To: <20260422171655.3437334-17-ardb+git@google.com>
Message-ID: <A11B0E21-5ABB-4609-829B-D4F0896331B6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_112053_657580_685D3F0C 
X-CRM114-Status: UNSURE (   5.29  )
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

Hi ard.

Makes sense here

-#include <arm_neon.h>
+#include <asm/neon-intrinsics.h>

Reviewed-by: Josh Law <joshlaw48@gmail.com>

This series is a good (and deserved series)


That's me done! I've reviewed your lib patches for you, have a great day!

