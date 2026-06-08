Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20395CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sIsYTLOZChveT9EMnGezeFDSrrYGoEXKFgVmBYHPNH8=; b=w4ORz/zlDYO9euzHJ3BNkZWSrS
	aOyMHzDNeC7Ddg23sRLKafzG4QwcJHzyA9YyYUPA3BXi0hVu454MIl9bonYL6TyNSAJqKCsyn5xXI
	ZGeeBB/0vEv2aBrEnwVFkShv/31xahU3bU8j+hnfdqWkW5ktUhxMwoJ2goadNiTIlXA3gmjcjC9vF
	rLBJBZRgVUCDXcrfAYTd0NO0FZIYEjstttwWuwgTtNRaDoi2yDGp/JD7WgCnZBfSeQfuy/ngkCoL/
	er2UVhuHSyrjsLtCQjH0bvo4OfmZu8piWh8wIAXiS4zfR+P/1Dg3JsX0NTESjCuMHUIMKv7DzX32G
	GN/pKeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbms-00000003wug-3gEv;
	Mon, 08 Jun 2026 15:21:14 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbml-00000003wtp-1sci
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 15:21:13 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso377598a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 08:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780932066; x=1781536866; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sIsYTLOZChveT9EMnGezeFDSrrYGoEXKFgVmBYHPNH8=;
        b=jYKAFGXXjgguLMxp0eOmrP/Kxpn8FySszhBCDShglHzyNLzqGcSsidL3eGi5YudAWs
         VeTwS6lIaCt82b7fez6TJvurnlQB30Zak1Ns6IYRoamLn7/XsXcUkPEj552K/Z4Z7311
         lHM1SJeASUcojOyI0UcCKfeo3K/TEU5etcfLmkRNm5nGQIzFKxkgGPkQIiSUtyC2kQaY
         kmV99iVIL4XpgFgG4xggkO+oFDWF/bT9qe61+/up8FVG9kJxxJEsLZsrtHgtQaAD7v+H
         R69/uxjfojtNnJlNojofM9WclP7+AezvKUZ7Gt9+UWPgRAzDMQKEByFFpk9Uc8+qjN+T
         oFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780932066; x=1781536866;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIsYTLOZChveT9EMnGezeFDSrrYGoEXKFgVmBYHPNH8=;
        b=B/97wZjKvpJj2XsAL0SL/FgjwS7Bb0c17TPP38HBa1I/d6gWjEe+i4abQ5aDJFWECf
         hTFVINu2OVoKRvCmY/NoFs1MY19HtIwiQ/refR3pAkzbCd/+bUfGpFHG1rPt1H9RuYjR
         54Zm9/pvrK4KYpQvNqoNs8juDUt42WyopWCnh6seVQv6H4Wa+4iJWoBt1QlWnwJGIJOw
         f4Nyteu3SklpIPyI5ev86BZMazSq5KEk7VogZFm4+RKhMoPdpxaM6tpGErRCTBeT6bR7
         SXxJuRRXw3Sn5TV11e7dvj9ZVaFSrXC0MrMgGGzNMByMmlk3MrHOwf/PbcAyPbhku1W3
         Y2tw==
X-Forwarded-Encrypted: i=1; AFNElJ+rOpedFwVG6XqsE0cwI4kpF1vlbzqwHkvSFiSqlfvKxWtNDR8hlBjIq/9hWK5oBZ3Zp+TDdI/Ax+VbULtCSZ/2@lists.infradead.org
X-Gm-Message-State: AOJu0YyeRiw8oAwANkER2PsQEGXYVskRPgu4gueJUAmppfBy6bbV+kuv
	NgmNJ/+ypOod1H875JvZGeEKlN7KQMbmmmCnrqxPjfrYsgXZIcmFWaIRB2wiKl81OhaNzmgB/aO
	KYimD9W8=
X-Gm-Gg: Acq92OHXStGOaoe6/hdYYXfdeUorLUFwiJ5UHGC4HIsYCVdaGSAy527MOgm6XbW/D80
	AFpWPjdAzf9Dj4MouxrY1SdS4lS1m2cjn4FJYdMYgHwy0HCRrJW0NPFmc1VFvZcQo3mdYV1kIRr
	UVFTaVGLZPtGoxNodhiWDxzZyOt4mRtj7Rtap1EGXN91opI2wQVmx8CRiyfRV2v9AkCQc12F8Am
	wK2DElgGHdEHcPkCIgGwuyaddaXu9XR/AdAo+VPYBbuTsOMQ8YsJMgB45Ev+G1qUDbqcJFr0xlW
	Q3abG/5darp74ISkGmh05yhx3uK6S9fPClRJfJhw8hEaYSYppKRolv9z/EHdekDnEjf+ZhiXLjh
	tGWBewm5v11NQPskJkBo8472XOzriXkcRo8xZHUGohbKPg/UW+bviGM9KC4lizjktMAqMv2jC4F
	5M4jzGxT1VDdH4x+qmizKsjS7VpuQVPkw=
X-Received: by 2002:a05:6a21:70cb:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3b4ccf6ea30mr17584603637.22.1780932066451;
        Mon, 08 Jun 2026 08:21:06 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c85df0b2ddbsm15543247a12.24.2026.06.08.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:21:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: soc: updates for v7.2
Date: Mon, 08 Jun 2026 08:21:05 -0700
Message-ID: <7hldcpm526.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_082111_961920_20D844F1 
X-CRM114-Status: UNSURE (   6.50  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.2/soc-signed

for you to fetch changes up to 2a7a9e20b9e8b5dc4fdef777e67d390dcb3a8ea4:

  ARM: omap2: simplify allocation for omap_device (2026-05-11 09:51:01 -0700)

----------------------------------------------------------------
ARM: soc: updates for v7.2

Minor update for omap_device core code.

----------------------------------------------------------------
Rosen Penev (1):
      ARM: omap2: simplify allocation for omap_device

 arch/arm/mach-omap2/omap_device.c | 29 ++++++++++-------------------
 arch/arm/mach-omap2/omap_device.h |  4 ++--
 2 files changed, 12 insertions(+), 21 deletions(-)

