Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F466E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5HsjqkC0TW1j6tEXS+2YAetbzExkGU2uGb1bwmU0WzM=; b=oXlBHKC6P7ALjIGZZqSY0XlCTI
	3fJYqm3rGNRgUY/WZvwUo04LTzWa3jnWQyMJgsA/4KtfpjKo7nRLf1myHbYCboK6JbFDkv03PgJ0Q
	8W5JoqhKQoUBjlh62peuTicbFqBRpJwekMN17FKfMPAutysJKq2rlik3GekNEiENoL6PO/7ckjtq8
	ZNGZjlb9oN5LpThLnRQVAFQdotYi8N3Jpcw3lj03HJTEatoVPF0Wd1QUSIsZBGOA2gKkkJ8a4uzKE
	/HDgCBrQU78J/jYl56I/3ku7nukfz5cLJSD9jixKSlwlANnzpPGRhZICuddYZNjpPBa7SnBa/rrJP
	agmueRow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIyB-00000006YB6-36VT;
	Tue, 07 Jan 2025 23:26:43 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIwd-00000006Xwi-12IW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:25:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2164b662090so209828785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 15:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736292306; x=1736897106; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5HsjqkC0TW1j6tEXS+2YAetbzExkGU2uGb1bwmU0WzM=;
        b=QMWOOx5nSGft6zYIWge28kUfRx6oIarMONO4Am9hvMqR57QkQswYHFHZYKkUnacEK6
         fPdma2QTe0oUoc2O4BCIgEaz486irFVeA5tUkWnELf6jGXnQsacPeqp9TDNHZmKPle61
         1MhIxU/pBXlrMsqwIPCAlQmw61KLnb1hlnpBnY2Oe5npxQ+NiaazTHCCtwQI4nLpzWNH
         lu2vlfjRwBRAg+MhGsrPSwOhiNefFgYon5WDhDmSACWhXvRgprxAss8uehXY6pDt0uQY
         xaCHuACenbqfJUrV5QGbNSPC+mwhbvVnw04OKvCn2+fptznMvfQGEuLhfyBt7p0nptdN
         ep8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736292306; x=1736897106;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5HsjqkC0TW1j6tEXS+2YAetbzExkGU2uGb1bwmU0WzM=;
        b=eit780duOGiK+cl29YpaB3Jsh7W8ygtwbObPV7b8HPdRtTmYSnaD7sfFSUr5G9Qr6F
         06z6L6OCPn64aKNPCo7nx6xhxABp4yULVEI1lpkzwuNh+VrDvZDGbs4+WJhHCWiTtghN
         oSvsXLiGs3Ytugk5PI1ltm7XiYzdyeztGUOptIFSRu7cb9CnVNPwUTLJ2AjVA4aVyGDO
         V4zXsBc6KUGTX4vSgYnqe7oGgPSKNu3n0ZowvYpoRkgeAtQ7jroZ1ZysWpQMneD9jwUK
         xID6eygCBUW+/zmh4K/YjKJFvHGNpDc/mwB6kj3n/opyNq6GNI50qvb7rAzrIgFQoIUj
         zPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7Qf7Suktw7dkMwqVJcSeeiIBPWHTkGWXjb+8u5iVBSy6Z9VsReAALTxc/Es8iPbQXgisqQhFviWz2mcL40WNe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyze/mpVeSul2vWBY9wC3zJQjt67KgiPKjYr+R2DdoAUQWCvboK
	Gv0rFBrB0MANIYMIPdt/VxRqlpKFk4q33CJ862Mc+kWXsarXVW+4eZsu+j+dXqkKstEXw9Rwe12
	P
X-Gm-Gg: ASbGncsIw7iUvOu6YfS2KHgDEDM92/bgbO9thA+OdYFmd8+jQ0sf6zbLDdAQWYp9QkE
	YNXdxVUDkz45C0mh1wMZGy+gwPfDW9q+M6ev110RzVmItKnAHDa1MJqUBc93jUG7m14ghVFPCdv
	L+jVr/+S8PdAlNlxLlP1VUdxsbFp7rwDUiCliqw9C2AR5BRx8+UdpWlXTSh+BtA12bjlk1Ve+zc
	nA8A4Vb649Rr8tP1biZLVZSo0LXJd9N4vhFMn7kZ0LZ+TZYe90wQEw=
X-Google-Smtp-Source: AGHT+IHVFOR6GkERpP6WR0/FI8WmwY9S92Nz5kINYPVjjjtNFK0rP3anDsgdAdMUKFY2u5SJ/13PZQ==
X-Received: by 2002:a05:6a20:8403:b0:1e0:c954:ea85 with SMTP id adf61e73a8af0-1e88cfa6a5dmr1874365637.13.1736292306314;
        Tue, 07 Jan 2025 15:25:06 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b8e87deasm31264743a12.45.2025.01.07.15.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:25:05 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: omap: minor updates for v6.14
Date: Tue, 07 Jan 2025 15:25:05 -0800
Message-ID: <7hikqqb41a.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_152507_284699_C42EF412 
X-CRM114-Status: UNSURE (   8.46  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/soc-signed

for you to fetch changes up to ad455e48bba7f21bb5108406da0854cf8dede8ea:

  ARM: omap1: Fix up the Retu IRQ on Nokia 770 (2025-01-06 15:12:05 -0800)

----------------------------------------------------------------
soc: omap: minor updates for v6.14

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: omap1: Fix up the Retu IRQ on Nokia 770

Andreas Kemnade (1):
      ARM: omap2plus_defconfig: enable charger of TWL603X

Christophe JAILLET (1):
      ARM: OMAP2+: Fix a typo

 arch/arm/configs/omap2plus_defconfig | 1 +
 arch/arm/mach-omap1/board-nokia770.c | 2 +-
 arch/arm/mach-omap2/powerdomain.c    | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

