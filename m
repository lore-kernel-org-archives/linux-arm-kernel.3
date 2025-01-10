Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493D7E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 18:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zf//n/LaJv+Bc7QR1tIn9d7aeT/G2u5n60hqMFCkMyg=; b=GcS1MY2KvuOhcYp8ObNQmOqloE
	dD+m7mWEf/WzoUMHKia7B57X6qzYPTs5kvLAVg8jqhOsaorWa84hVzHlgERswRXkWCGDvZvwVl2yO
	M+k5mqtoY2vMtQNZE0CNINanVdK7Br6yopPg03KvhoqB5GUhlAkCyKd/m865mVQD8Go7a9kbmHPra
	1faQfpv4a3yjiYfpH78uhfKYALXQz4KTYPHy9AXPS7VRWEq4ci6xxO+BRS1WdtUft6y7Y86Qy7mj8
	Ja/OXrPgUStJ9zTTSAbM3hJB2D2Efvr10ClmMz7oiAF88MVlMgsMHlYQNfQXzGi92NumszOLc0/JI
	BI5rfAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKAY-0000000GfEH-2Zkf;
	Fri, 10 Jan 2025 18:55:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWK93-0000000Geje-3Hlf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 18:54:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43623f0c574so17989055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535248; x=1737140048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zf//n/LaJv+Bc7QR1tIn9d7aeT/G2u5n60hqMFCkMyg=;
        b=KiunxIHz0Bmn7WMGHQeH+WzySr8Qr9LI/Rhqdw2PCS/uAR8aBTvSSgWwrEs4lhrilJ
         moK2x7Kh/WKWqI5+USgArybs3rCRXRAdzoBhh5z7+1Ts8rdNt9wX0lymHA5Kc1Mq2KPK
         x9Fl5f6yXp1ZpyF5ivwJrAPRshC0aJjcHIzQXxSUMpqvnmYAQld51E6jCVlibFNmlTOG
         R5Cv3bSBodvbN7d9lmydbl7I0QRok/INLwzw/7uimVYLcwFxFjKSI1fA1kc497ASv5DK
         DaFEX/Nm5d1IrBq2NlpIXeESJNB+5rRMHWhQqhoiQLuCS3Jim42I/G5l/5rlgOI+B170
         brhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535248; x=1737140048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf//n/LaJv+Bc7QR1tIn9d7aeT/G2u5n60hqMFCkMyg=;
        b=ZGSEVuoVRebGTXONJUn/f/IW1WV8b//M8LEMJ3CghjiDIUp6bf26Z0je8SJBSXQHoJ
         YnwQsPJKg1sZTzzSfifqQLg3Vsde9KmXtkzFz3qtO6Woztjcb0ET8UkxfCMDPwOoSqtY
         1JL/o6uu2xvXI5VJhZUbIoFzAG91YJvYAT7koMByNAJSa82HvHckvvbeV63st8u0dUP2
         R84ZsFgpgsH4hPF9nT+rrmJaAqCo8Ua6P4s6Qyo3yUFoVupIeODAWuMfYUat3GVYHz/d
         IYq464+9m97pZDQjd7iD0+HgLqtU2Gxh+Bs0GBHV9x/60CTQEuuUAQAkGuj4pmNBDejr
         wNfw==
X-Forwarded-Encrypted: i=1; AJvYcCWUJ4g7DyB1DowkvHEWXgasgntSx9jnDUw2S3UYiW1AU9FE2evWsUQ39CdL8wkSr1S9jH/7QTbsStAcpBLakSsu@lists.infradead.org
X-Gm-Message-State: AOJu0YzI7FLMPVEf14FchwEJSu5c8/9LAnbI/c84nrHaRQrcSGlDDlTk
	5h815Kx08Bp1xBSfQOGIJhUXuLmmvziH/U2yizPgUSD6FxfUfPdL
X-Gm-Gg: ASbGncsPH6Zhl7W4HKo9s1HmNgLv/4c4zLLQaamk6sEXdBBmVrABY3SRInSup5dAb5n
	336S+uer+h9YcI7bKRhFSAW+DMzJrK40zxuvKd2wQn89fyV6SSUx+D3X+taKkHopd1MKsvhvNt5
	yKb2DEcZ/33YFQWx+7zZSUZ+aPrmZzOFo53ksJF65pes22ap/HkNA0F0q9S/O7oTlUt2qOB8Huw
	J99X1l8xRp3cQTNNVRaBQyhGIdRVGf82Goc4OC+l4XIk832vlW5RNhEf9Un9OqW+wscCyQSoCSN
	BCOc3pH9nlGTbelmTcMLMzTkZCCrZZ4YRd2lZDe/HtF0sptA
X-Google-Smtp-Source: AGHT+IGZ6hlN+WoHP63J5jrBDfHHz+4clyA9GOi0tEzZYmYd03alnmZ6mmb51FMSnEhVGza4yao5Dw==
X-Received: by 2002:a05:6000:1446:b0:385:d7f9:f169 with SMTP id ffacd0b85a97d-38a872f6d09mr10013608f8f.12.1736535247484;
        Fri, 10 Jan 2025 10:54:07 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dd1957sm59993665e9.16.2025.01.10.10.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:54:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] soc/tegra: Cleanups for v6.14-rc1
Date: Fri, 10 Jan 2025 19:53:51 +0100
Message-ID: <20250110185355.4143505-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_105409_816877_4451A072 
X-CRM114-Status: UNSURE (   8.84  )
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

Hi ARM SoC maintainers,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.14-soc

for you to fetch changes up to 836b341cc8dab680acc06a7883bfeea89680b689:

  soc/tegra: fuse: Update Tegra234 nvmem keepout list (2025-01-10 18:51:46 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Cleanups for v6.14-rc1

This contains debugfs error handling cleanup, a typofix and an update to
the FUSE block's keepout list to properly allow reading these registers.

----------------------------------------------------------------
Kartik Rajput (1):
      soc/tegra: fuse: Update Tegra234 nvmem keepout list

Krzysztof Kozlowski (1):
      soc/tegra: cbb: Drop unnecessary debugfs error handling

liujing (1):
      soc/tegra: Fix spelling error in tegra234_lookup_slave_timeout()

 drivers/soc/tegra/cbb/tegra-cbb.c     | 20 ++++----------------
 drivers/soc/tegra/cbb/tegra234-cbb.c  |  2 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c | 17 +++++++++++------
 3 files changed, 16 insertions(+), 23 deletions(-)

