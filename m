Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB86E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2QDdyedWsqG+v2AZi3H9QCS2GE53jTZNmzxpEDi/sDw=; b=JHkQjXD1t2SXnBZk11WLSzjljB
	tbZ9W60lpGLFiI6gg3hKoiXyXruJHzPK2gXFp3cR4zP4TsdYt8NybCMlgtcv1ho8DQYFqlXxCL+i/
	vC/dfX6eXDWxlIyW0m9FklWE6JaDZxYm/U8xVwHrlOs6YB4ScJnaQtxBq3bBxMRL8x8rSG1/xMVn7
	LWlVJ7DYWH0ZjjCcjhvGbAq/UEnNrWv3FbmA0U999GIVL7ZwEsctidbsW0SpyH8fW5xchVD5y8kFF
	jLMLwfwzf04xqLxQH3Yd433xz498bnIAbj2GxZOm+LwuoiUdGi6Ba+2GwNCYi7Vkknf8PieVZ1Hi9
	lGwYCAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIzT-00000006YMo-0ARR;
	Tue, 07 Jan 2025 23:28:03 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIyE-00000006YCQ-2yIV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:26:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so23670718a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 15:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736292406; x=1736897206; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2QDdyedWsqG+v2AZi3H9QCS2GE53jTZNmzxpEDi/sDw=;
        b=fXO5NF75BS4Lr+awnvqtJQ3qYwP8MTd6mJeWvBaOB/PcoSlGUbsH8q20ZA/mrn6lHg
         0D0B/eOc/lq/Vv3pTy22NLQThT1fAkVMU3h2JcrqrKb9WHLRa02zaJ2DP9fv7aTVVHaa
         I+pd/Dg4uWMWFPCV1qUVkmGkAiV9qy7o0zIZ3ZoFfynEsHvb8gRnXp4HEGKOJZG3wHpu
         qYb8yerseM98U1oIOfIxGVGXnfzJVW2hy2Yni67dFX4sIN1qaBXYyF6OnvWoVABgIwkI
         5OL3nBY0Hy6gO895AsN5remHm2+UmaAdK+S5ztYK9F1+wds6V6p+A+NlqwVIjsVJgFju
         VDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736292406; x=1736897206;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QDdyedWsqG+v2AZi3H9QCS2GE53jTZNmzxpEDi/sDw=;
        b=tFtiedX5lPJSF/fKjiHfQ9U48HQt+rGOtJP3O/jRu5mT46lpxp0XaGDpftwgGJZtAS
         kgFCh7mM6FzJ96Tw0aVNHYLUbhpgaG89LItWIRl0GY0KikdLjd9kL/WvU+qR2gT8ALMg
         IIu9Nw64BboiNn7rkEBd/4QEGtc5HsQ6J1nTaLKIww4TbZn5gGSgeNsczJz65LrgtQY3
         vis/DU98NIUR19uOP2nE6AOv7ZtI8846tzvkKH2TOLFck3Viibn53t3E/g1XYsiM73JS
         5RM05JobzJhCUHKNOoixYkRTxTgDYmhOF/7emEklobaK03ZXT1okfFnU2+N0jbQ9eIRc
         3vdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuingn8vRHVV4zN6/Pj3JY+mSsbzR4YCrLyifK10vVdI9vdmzAj/rLLQ8gqC3LROMKrR/zBMJTcrK/VlpXE5vb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzg7MOkC6UUv+MypAFlqIKbFvcKZ0ixE49lGqV4loD3kl/63+A
	L5HRanQ38sERUXKDVuXFwbjmpO6eP6vYJa5GzWbtXJv2q+reph3yMI8ZEMD0C+c=
X-Gm-Gg: ASbGnctvBHqBkcSIc/4hMP4ImbQRXm1aeey4ymxwCT97rno03+KqgfvJmnFYiMV28Ox
	8wVOqm6+Z6lQLqmwrycKHG4uObI4zYa7e6xoK6gSP+UKKetWz6syskGsb886iflbyKUDGGtXV3R
	csezYSA+/rfhAMVW5bhMX8YlkMEPUZYds1g4dh1/dUu7l8rzwwJNp2vmnAXPfbL8jnHqnHgj//K
	5PanghyfMhLTazWGUOTuyUaonnxnTGKwTizqQTWUpxV+F7vWN4wKnA=
X-Google-Smtp-Source: AGHT+IEkqXBuXNblGZ518IQhUFeptLk1bmMCSYZHXrxvLRxYePl8DdoRBjuLuVKBAlEE9rwoMDaFyg==
X-Received: by 2002:a17:90b:2d44:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-2f548eceda2mr957257a91.21.1736292405710;
        Tue, 07 Jan 2025 15:26:45 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a26acc3sm87438a91.4.2025.01.07.15.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:26:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm/omap: drivers: updates for v6.14
Date: Tue, 07 Jan 2025 15:26:45 -0800
Message-ID: <7hcygyb3yi.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_152646_746235_A60CEA0B 
X-CRM114-Status: UNSURE (   6.91  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/drivers-signed

for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:

  Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)

----------------------------------------------------------------
arm/omap: drivers: updates for v6.14

----------------------------------------------------------------
Andreas Kemnade (1):
      Input: tsc2007 - accept standard properties

 drivers/input/touchscreen/tsc2007.h      | 2 ++
 drivers/input/touchscreen/tsc2007_core.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

