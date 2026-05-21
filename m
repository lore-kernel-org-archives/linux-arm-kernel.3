Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316ECCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 01:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g5er6mfd0B3WrB1UjZ8gvF3HfMm1LpaHZwTZd0KJDZs=; b=CDDsEOUrVeqmVy1/9NBDjVVr1h
	9Enivh9/VwUGynk/i93GWDdFXICU6D17yhpKzztpITckoBPCE4kDJ/CgJJrvD2SfIUGH0IRk27Yko
	MhS4ANhg3ctEHdF8ucHkcAc2gRXloS5jIEgD71Ge7Lo8aW+Fw96M+hSz7eH/0eitgvMSgIIR/5oRA
	ig6lBwpIuuwWI4rlEyujsEUmLJ7s/UW3NkDvEesURb5U03bvsMk4Od9qLHvsjBN4YqWnqbYP9uTks
	PwOyQq4aAMBB1opJ0hv3VOCsb09HVy3m/81+l5m8z8fZYgMElv2vTZC2wLZ6scEkpGS3ho3HMDmg+
	UGbSnIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsQj-00000006OcF-1Chj;
	Thu, 21 May 2026 01:42:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsQh-00000006Obv-3ZI8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 May 2026 01:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g5er6mfd0B3WrB1UjZ8gvF3HfMm1LpaHZwTZd0KJDZs=; b=LiS6MFW+6lxAPvH2mL8J7FpCgC
	E9fv2sEVaP6YJpX52lRZrhOzwXtuqSMwp02SQuK+EmITlDd2/Ezxpf3yiI0+zW3CdZb2j154l5vVE
	sWCIuDNxLc2IXGpRcvM/C8C6WDs+a2X3s0RtVipUP0NCVpNAD9oAQhLLPqdHaV3EYjNWuJVPVs3x+
	0EJd7UrGscTXzBdWpM9954gLlWGBN3G6qqebHEDRk9jyXOoz9gwVaamcQWonLhdgprojF0f5Ehm5u
	yl22hP3R5KYVnB/v76aNUYwrPb5Um3R9EM79N+2KAbUKq8Dj1LUNsSEWT19Sf/zPUsFUiND39sv0P
	z43VGIUQ==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsQe-00000007qsA-4AXA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 01:42:30 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-83d5bbef760so2388095b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 18:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779327746; x=1779932546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5er6mfd0B3WrB1UjZ8gvF3HfMm1LpaHZwTZd0KJDZs=;
        b=U+CzQWCsTGPC82B9i0WLmgcNXlyCG8IiQMo0KcUi5U/0O5/vZ5paBSYeFDb+vSNj/8
         yej5paL4leB8zRRft2Qt4ppbEMop21vBmZt6Bz3CZpsT5PXavw/9Qr13KOx/tklPzWPf
         OK3Un6zvG8CqGgCWB3T5tqvYmKJtN/FprnyeV4P2VpaibUcMuuAm8Ekb3FnyHVKDfHXx
         2gLNewvsNk/euHPjeXSCZpidyjZyiKggP5OCogzIZpN8xDGGinknEVM7N9hDjzf9TrPV
         dD13480y5ra4BpP1DC5l2OvWSF0k9fPPv5dRp+nzz1B/HfrN2p72tkQLLBSEONd+x0gV
         3mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779327746; x=1779932546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5er6mfd0B3WrB1UjZ8gvF3HfMm1LpaHZwTZd0KJDZs=;
        b=d/gRyanWATlOb0eE8ddW5uuOYKJIeWISvMWXK3cqEDT/8vBL2QTrrs8qkKedc83Ra+
         3IkqfgDefoEVOO7uuJgGbyiPzeLJQiJXAFrSyNjDAViggPHwG+1VxSCh6EQne01oz4qH
         PsQxW7ic0Fult4zd5KHmlxJ1TggN3L1KHeH8UrCe8OrI/VBNZwua56rN+F/XFhDBTPM9
         ccaL+2vAzkW+G8bSVjV9HKLUUAgKxNVKvn8OMuaNHSoRph9wAiapPbM0yEcd4gz7abpZ
         uY8BGJT6rGeQH8PyWrfRhleBh6G5dq9bttrlLN7MSInidW8ryX5ROb2SKh1lEE9g0Kg7
         Oq7g==
X-Forwarded-Encrypted: i=1; AFNElJ/dMl0O82sev6Nu9Sj3MMo47yKl2qZtF1XDwnEg8ddqnxSZHNt1M+mif9qhDSugOCI9N2Re3E3Mu1neqmLUrivw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz50FBSciHHCxtEfX/uWrcfyDqOC9NqcW+kH5iE1sSkHgfKS1Ck
	khP6+Ns645mD3RkKsmFaQiBKeDDDkc/WcuTw2/q7fJzzTsWaYQRFwBS6
X-Gm-Gg: Acq92OHCiObdv4viYu9s8liTx4XgIws+f4VFUe9eUh29TfJwjfw7IXcPzSD9CDyXcs8
	7NzEcs8mUG4wIAz2OMM2FB0NQqcUuWnKJzL+QR1UvrmhXoyaifeUQw0EnVzDIiGpekBIfaBUdpd
	3Xr2j6wjMUkPZbOfZkypq2x9KzgtvV7mekmReLnB45GCAW0uCOnAei8ORHrW2/tbkvN9EzDa++G
	FloFd8QnYwP2iq/iu8co17W8bHWugP5FqEplthLTGZ2YAcbfe26Ip1+Z3jdz1b8/xbQ4wh6EErR
	byOFWO1UQ+MWlP6PVFwJyhJiKXBz6qS/TS9Hr/AVbk5gZBOnBhX6UI1KU2Y4QztjbrjJJc3byfZ
	EDy+h9IOFmhTigGE+9+sBcqMWGHjOo67oApMGx1nBNTu+iXY6B0NDA6bGHa/3doQ3S7zllaDki7
	n5lR7YArw+e7IZFo+uQqFVB2y/hEWn3Z9qtdDX7vpkO20B3siakPM/GBqtzIi3REM8a4UhOfg+F
	OPkk04HNqlyrQUvDFzIjME=
X-Received: by 2002:a05:6a00:bc83:b0:834:e15a:19f7 with SMTP id d2e1a72fcca58-8414ae9a135mr853001b3a.44.1779327746138;
        Wed, 20 May 2026 18:42:26 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm26411475b3a.61.2026.05.20.18.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:42:25 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v3 0/3] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Thu, 21 May 2026 09:42:17 +0800
Message-ID: <20260521014220.77955-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024229_042621_84D24A5B 
X-CRM114-Status: UNSURE (   9.25  )
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

Fix four bugs in the MA35D1 PLL clock driver that cause incorrect
frequency values returned from recalc_rate() and determine_rate().

v1 combined all fixes into a single commit.  At reviewer request,
split into one patch per logical fix:

  1/3 - fix div_u64 return value being discarded (affects both
        ma35d1_calc_smic_pll_freq and ma35d1_calc_pll_freq INT mode)

  2/3 - fix PLL_CTL1_FRAC mask width (8-bit -> 24-bit) and update
        the fractional-mode arithmetic accordingly

  3/3 - fix ma35d1_clk_pll_determine_rate: move find_closest() into
        the configurable-PLL branch; unify read-only PLL handling

Changes in v3 (vs v2):
  - 2/3: replace the manual round-to-nearest expression
    "(u32)(((u64)x * 1000 + 500) >> 24)" with the kernel helper
    DIV_ROUND_CLOSEST_ULL((u64)x * 1000, 1ULL << 24); the result
    is mathematically identical but more readable and idiomatic

Joey Lu (3):
  clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq
    calculation
  clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional
    calc
  clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic

 drivers/clk/nuvoton/clk-ma35d1-pll.c | 38 ++++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0


