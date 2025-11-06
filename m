Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4759CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=APyjP89ZEGyOgpw6IYgPQw/KB5WQid/ruGqpO1r3Z0o=; b=px2ROvCQQnX0oFEy9MBbX7AW2u
	XCrBmuPqhrGknUsxI6uBvC1AQzvRG76/8XePH/JSQGuZW0r35hZ6a31jRd2ICNyxT31EBL5zld4IY
	WgOFvXje2NA2QiSNZ71pgXQIEl/3i/Sp6T23iTwMw1Kqf6+uXTAKBqo3q/FPuNqKkDNSkUx02N9WC
	dZXt/mYbHIbuIBj5J8sq3xOyD4k0LkQko5XjXy/XF3gGORC4NhwEzXUxaEF8+3jfZm6FxWocPd42O
	c2Y5l67kkl7Eo9siGXcnZBgLcawrZ8oW2s1JVRaphaqrDuqWCauY6nugwqbRKc5VT2/aUv4YybZew
	trkgjb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpc4-0000000Ekrm-31Im;
	Thu, 06 Nov 2025 02:20:36 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpc2-0000000Ekqu-2B22
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:20:35 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b9ef786babcso301001a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 18:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762395633; x=1763000433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=APyjP89ZEGyOgpw6IYgPQw/KB5WQid/ruGqpO1r3Z0o=;
        b=cExmRWHnTEFk9XDqHhcm9UKwkkgZHNeLZOcHxtRN80UQGG3XjqgJsP/0NyRkq36+vs
         kAqQJspo918FJm7w/ZzPJZ1XKU71hJ7ZLbiZuXHJm5dPvOJfS1A87NQ6mOZ8bagvy53x
         vnNVIpntDRa2tnuSSO6T/i4HV7ABpXojtRwzioasesrUyxKh+sHVQQgiM+CaC4i9PEzl
         Clu8UDLZZR1zj9lfgCaRHbu/wMkzX0FWpjc/0hYawGfBWNJWy11E4+0pJ8Oj1rFkESYs
         MxG76rFfq9kZ1bII2bKB2sEYp198hoDc8l7saEWmmP9S7WwatFQYK1kmRT7n+2npqmsl
         oWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762395633; x=1763000433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APyjP89ZEGyOgpw6IYgPQw/KB5WQid/ruGqpO1r3Z0o=;
        b=eQ11L5VeCQeu/ojEzddbU+Vn/ew4MPcWHLXBR7xEql3028sweAX3oIvvYUho3Un+Zr
         CwycKRyl4VAZ34KWc86W4II1je61z27m08gFxOWtQmhtPyXGZJDlr+QJjmuBqX2G8yZu
         tR3VSPJBpl9V2jjlJoYVYqXiOA24r2KoNDtE9EvO6YOdnMdW+OnOIPJj6Dj0O0BAgWG6
         RsLPaEw0oamtztTGXYo/QDPNDTSqQl3mVDuWBq/XrDDBEj9llYr4Yu1DNbInoj/r5VFj
         lb4Nxsudgp5BLTh/BVVgwljmHBW9ZbbWsl+FiVkoGQPhCYAf0VWJ+E5lXXJ6YB/3H15s
         CTKw==
X-Forwarded-Encrypted: i=1; AJvYcCXsWc67EZAcR02u46Mwf4qnpJ1vcYjJcyZxuwlUR5fZPYf774ceYSxYCKRpAjOOamxZKWYNMhADR+9rT7HfcExs@lists.infradead.org
X-Gm-Message-State: AOJu0YwwRxiaBmNUC05P3WTgnaBJ1wYkgwj3m438HHdQv2WGxdkEfw9N
	Z8iPhCHv3dU2rOZAmUdbdo6KGRebfN3q5lwqH6hnFQk6c6zArAJ7cIC4v23NrA==
X-Gm-Gg: ASbGnctuWdN/sjx3zPsbmCbRLCs+3DcvByZLnuYwxctkT2jw1xMTMIXkHCGH76Edi9m
	QOiXRZKlAvxM3T6x/5NBafOxLs7pnMJrr51NYBu5coj+lmT4bkMAmTwqkkH6DdV9o397U38U45B
	1Hr5odn1j2KYSp2anGbBVSHrl2loUv98fDI2jhqKeE0/TlcAekEPaxcY+KUfRmq5RCl6/7McELD
	Z9hYlKjDyjliLzLd1OT9g7I1pVD44zbwn+f373Fn1JqqAv/RLPw1+6E5wyCBldjFR9yBl7/Up3B
	/YLFuxra3iDai2CiX7h2kONlnhPg3WGv4tMHyJ7plfLXLdnUqnfM3RsizoHsulEoTBrrg6LVamy
	6cHgtHuT9NuaswDhdK/hzXbQVPicGu8kz2EIMJpBhy30+ZFk=
X-Google-Smtp-Source: AGHT+IGwLwltM7hjFkqW1lSpRRGBPVQlKwEPQ277/7xJAbJDdTTr8KfzmlicE2p3iE7bm1PNBZeJ1Q==
X-Received: by 2002:a05:6a20:7484:b0:33e:eb7a:4473 with SMTP id adf61e73a8af0-34f846fdc8bmr6787728637.23.1762395633255;
        Wed, 05 Nov 2025 18:20:33 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7fd57f91sm830516b3a.23.2025.11.05.18.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 18:20:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE)
Subject: [PATCH dmaengine 0/2] dmaengine: st_fdma: support COMPILE_TEST
Date: Wed,  5 Nov 2025 18:20:13 -0800
Message-ID: <20251106022015.84970-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_182034_582243_ABC52BD0 
X-CRM114-Status: UNSURE (   7.86  )
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

First commit fixes compilation under 64-bit and second actually enables
it.

Rosen Penev (2):
  dmaengine: st_fdma: change dreg_line to long
  dmaengine: st_fdma: add COMPILE_TEST support

 drivers/dma/Kconfig   | 2 +-
 drivers/dma/st_fdma.c | 2 +-
 drivers/dma/st_fdma.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

--
2.51.2


