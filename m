Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2134D5B840
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 01:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mTMUiHHYVMRUoicKPTQrikup5KdhwmqMJsFGyJ97y1M=; b=EicMmVtGdJqTmVYlrFiaJjOHVH
	FbI3y4huXXszvs3/Wd/lOgR+QWdV9q5Bou7qGzOl47zXqp+nNq+5H9jtOqMMm5ojgeKJP4uScmhSm
	EdkEoF2p5uEpjV/Qfio+7/S4jM/WensllTrkuW5MxkR+gckPwQPMM501SjURVo59DUIsHJHjeiOjc
	tnRiYIrnrS7s/YZ4o3ndCODj2p/9Dn5mtqEFRihxYd5Bp3Xd21V4Y1eInlAbf6G6XTJpeI/sAI0z9
	1tZjbihDTWZrXqRt/G/jzhK+x1fRIpetLk5NeGTAbAsleK2lLVH+1iEUWGmDvcRwUYOU4AD548PmF
	XtrfmPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5b6T-0000000Crs2-2TCW;
	Tue, 29 Oct 2024 01:33:01 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5b4p-0000000CrXH-2JQn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 01:31:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20cf3e36a76so48591835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 18:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165479; x=1730770279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mTMUiHHYVMRUoicKPTQrikup5KdhwmqMJsFGyJ97y1M=;
        b=U5z0dtQG/OyF8zS5JH+y3jwNnKQT4jrvT3i2t4E+8KR2cQLnCL7V3yM8kGrHWDLakh
         yr8iY8DXpxC+hl/NunFFYcU6KnqsNmYzNI8gm1kSdsKe1brR1BpMS3kN8Q4sTSQEyFak
         BZUXQdm1tO+xo26zD26OyjZR8O+zCT6BeYRVI+9b+g7y8WStnMsu5U6PAExkPl02g8iH
         IcZG/Aqyo5gGt6cmI4xZ2FFzwhLH+2LhqeXhZG/pue/EnrJIndBIREwwULgrwbWUItis
         Ikr666xjx4CMcGD4T6s27dwANxqmmNgDRT6+GsjrK59kSV6K+kVU1pl2mAnaFEbzHLjV
         +Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165479; x=1730770279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTMUiHHYVMRUoicKPTQrikup5KdhwmqMJsFGyJ97y1M=;
        b=nM9mif5ZIOS+RuHcWO/7j12+QZxFtfzNCbMne2M+JI0X8lMnJn0wvEsrymVWcpwKoS
         l0mz0rTFSqH5Kou5NmDq/8VZMgfOJDsqeuePguQimkgKKkJMlWB2F2rQbTXK/4PJjg2E
         ygS5EMEOS63q1XizKjFzUGHfUyy4CjJmB247oZIipqIk1RHap40AtX7Iwy2/2a5JkwJM
         ZSSpuUQNgrcQ0Gur1ZThCJWLr/iIRNVYNoMeCZdyZ/M0Z2VdcWH+CbJEHvZ/5oeik8wp
         0Ng0QJNJhZSI5+vWhRq/Sf0GGBcIAhnFZs2dBslaHahPpAwxVTab/I72C38rd+xQ2L0P
         r9yA==
X-Forwarded-Encrypted: i=1; AJvYcCXhuu9eBIcacZU//27ftmAKoWD0CErtTpHyEA0OdpNVkeHpImsiFUmqFRfgUl/qKkZUXwxKTU1yWlodsM6BdCaO@lists.infradead.org
X-Gm-Message-State: AOJu0YwhhHn11AgU0qtBUQj+6TOD6hB5HvHuimDwXsod76wHw188C/2M
	I4pPmfiA2sGnEgebR5o+jnJa9GhNTncIk5vvKXpp6Jn4ARcihN4a
X-Google-Smtp-Source: AGHT+IHpTVvjwrQ3EcoGKK0bmJ6jA8y24xXtEro+uTiZy8kx8QQbwEUeJniOAu9P1ssNSK/aTxA2WA==
X-Received: by 2002:a05:6a20:e30b:b0:1d9:d5e:82a6 with SMTP id adf61e73a8af0-1d9a85169f1mr14366765637.45.1730165478664;
        Mon, 28 Oct 2024 18:31:18 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7205791e564sm6686529b3a.17.2024.10.28.18.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:31:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 RESEND 0/2] watchdog: apple: Increase reset delay to 150ms
Date: Tue, 29 Oct 2024 09:29:16 +0800
Message-ID: <20241029013055.45538-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_183119_609584_698BEF2B 
X-CRM114-Status: UNSURE (   9.51  )
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

Increase the reset delay to 150ms as the Apple A8X SoC can take up to
125ms to actually reset.

Since the code is being modified anyways, also fix a bug where watchdog
writes were not actually getting flushed after requesting reset, depsite
what the code comments said.

Changes since v1:
- Fix an existing bug where watchdog writes are not flushed

v1: https://lore.kernel.org/asahi/20240930060653.4024-1-towinchenmi@gmail.com

Nick Chan
---

Nick Chan (2):
  watchdog: apple: Actually flush writes after requesting watchdog
    restart
  watchdog: apple: Increase reset delay to 150ms

 drivers/watchdog/apple_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
-- 
2.47.0


