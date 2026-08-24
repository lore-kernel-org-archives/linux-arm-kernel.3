Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F336AC5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CgyNog9WpL8OyqKZAIeKVr+B+H34q6AdaVPTiDSA/FQ=; b=KnULVZqT7Ura5t1O001cF3ifmW
	XJRKeKoXiswEPM+/s/3u3HC8TbGIHVhoiqQa7uZUCtQLYkdu3I3GZHJ0unqWdm2UbI5TQ4o+cp/9x
	E4XenQ7WZcIek/puBAogAiQ8hfV1j1jZlybWgPI+ALAvcDv5ZeLISd8lLPneOOo/yx1xPNJ6dDiE/
	btwApHC/X+4yHIe22VD3ptcEzknDRF3JMfXR43prbgLzigsmdq0Sgr3zhP2FIx9wuwQBTGoouh708
	4BIKGg8LU2jh1AooOdiirtRe2EF1jEQ5fTGuMDPxtJbGtcUMCMxi4dUXOdWCdDvn2MtiVZrQ2C2WL
	XwcX71bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQ18-0000000GCUs-31MG;
	Mon, 24 Aug 2026 08:26:54 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQ14-0000000GCU7-2H1L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 08:26:52 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso2820259a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 01:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560009; x=1788164809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CgyNog9WpL8OyqKZAIeKVr+B+H34q6AdaVPTiDSA/FQ=;
        b=VJ7YMaTjnfB0vtB642n3ctztRSHJ6v7BWFuITr8XC4QxV6MpTlwSZZp88erArS2v8j
         bcTsrp90ZraSEeAN8ckXGwnxN2xeS60NzDWTMBCK2bzOhAHM15JUzOfgo4AvDaLnkegN
         1oxUED6ieXwwcfwHOT+LZTiQpKnamQAnyIV/mtEU0EQ7/K33xc7af6gOQXb/Oxvg8SMS
         GjhijsGTD+56cMEKJ69sd7hs1gI/hbHBIw271XHu6NZT3pOHag++qJtVTOf5R3MnbkI6
         4tN93slwqI9hmfO+v2eCOTKmYvnaF2UbCnN7C+5Mn554h9JC4WsmSXlIb6AIpsok3pfG
         LhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560009; x=1788164809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgyNog9WpL8OyqKZAIeKVr+B+H34q6AdaVPTiDSA/FQ=;
        b=p6pWADW8hQtVMee8ipi272B317f6QWdBGamF3uQcVoOTbtNEj7NuVFbDVs+4tZUBW4
         mQSrZYT37DDwrq8UO9YKEH4+ymXgOrf4RNM6owUHSdHnHJC/UMZT8K4H3o+fRTR8G1EM
         NABnavEFXXsWi9/7mkpbB6U4nxswtZmlWJr0dPj9I0b88SNHr3ssz+K6r+ZpPfNjHmVk
         Wf/85bJy2BYsV5yoZuLyPZzQvLNt8n+PjluAVohrhl4tQ7FMc3lca1qtO5vDGPOJVcVE
         l2lL+QRtlRd04FsQfjuLVHDqri8fONKYExwQKsuestYX/uQKLkQkZPSeJ9hhHzNetvN1
         jm+A==
X-Forwarded-Encrypted: i=1; AHgh+RosWKJSyByoN1h9MAwq9pqF5H5xPjDBM+pFgdnsGMDcI9l28HFRSPFGGunGNemjt6FngJFPsryDzQxii5mZk9zQ@lists.infradead.org
X-Gm-Message-State: AFuF++nwJjOh4wVGeU96o/yOlO6ePrFOZSybO+ulFzc51YfYp1NNCisQ
	AjoUVgmK7LsTZkFbXLasLRoNVU9O4719C796ja46Xbm82JeMA91upk+652g30aIb
X-Gm-Gg: AR+sD11WIflnyVQrHchY5BEpetz3YtsK5e0yvTddBODnsxVKC9d5BSQ6PfdZQj1GBDg
	1TuL55lqkIi9BPFf3c/h9UozTGuIbXQG5dXnYuJbSwV7miUvxO3UCqz8nLUYZS5FoKmLGWCpxkJ
	Mii6dsYpBk0OS+l4IQ/uIWagKiW2k4RF8mvxs0sGHjHQ8b+zeZ7dvEmvradvQsMyZhcUncgteJm
	NZQsSO2Zhs2F+ZOiKb55TQedOyr/L6eHBGhp8EYw+zIn50h70hjgPG96EhPAdKodNydaP10qE0l
	BwUGEPOTYNiaFrK1mxQjAEueH+eWwgtLFXMqZvUHBS8/xzAjay3adpXzjEdjBy/CdQhAsSPZPQ1
	AJCMXZ3cBjxXuwjeu4fz6iYn5HYXLCko3DsL9sqHOvL+jUUSMF6E08bCv+a2hWGEzdqtNOyLCir
	riD6O32ImATODEh/I3ms0HQUzvGLCz2AzcsatlJpkdFBWodERW5XFrm8Wch2fp/x/Q7rEpr0VMU
	rzVNy63nDjBbn51uw9O1Yh3NW5gMPjnOZaeRGwzC1tkVYv1Z7IbKyLsuoWBlT+dqdZ0kYLoAT4D
	VlAUJ5faDr8Go6XH4JuAJ3f4WBmezcfrp5OxsqbLq2evNoHJoytp2IHjxjbnNE6qQNXOMdA2xBz
	w/k7eWKtkAfq3Lxg6/Q8iIg0OMQG8oG6LEO0fdfg3fAFjnno=
X-Received: by 2002:a17:90b:4ac8:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-395a0510f96mr35860154a91.9.1787560009190;
        Mon, 24 Aug 2026 01:26:49 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm25994595eec.7.2026.08.24.01.26.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 01:26:48 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/4] soc: apple: rtkit: harden syslog shared-buffer handling
Date: Mon, 24 Aug 2026 14:11:36 +0545
Message-ID: <cover.1787559303.git.acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_012650_582226_312A6894 
X-CRM114-Status: GOOD (  10.97  )
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

Split the syslog hardening into focused changes as requested. The first
patch fixes the SYSLOG_INIT reinitialization leak. The second prevents
zero-sized messages and out-of-bounds shared-memory copies. The third
corrects the entry-count boundary, and the fourth rate limits validation
warnings controlled by the coprocessor.

The index-boundary change has not been tested on Apple hardware running
Linux. Asahi m1n1 describes the initialization field as COUNT, consistent
with the kernel's syslog_n_entries name, but patch 3 is kept independent so
it can be reverted without removing the shared-memory bounds protection.

Testing:
  - arm64 GCC build of drivers/soc/apple/rtkit.o with W=1 in Docker
  - scripts/checkpatch.pl --strict on each patch

Changes since v1:
  - inline the one-use shared-memory bounds check
  - use == 0 for the crashlog copy and < 0 for syslog copies
  - split the SYSLOG_INIT leak fix into patch 1
  - split the idx == n_entries change into patch 3
  - make the zero-size guard independent of the leak fix
  - rate limit existing malformed-syslog warnings in patch 4
  - rebase onto upstream commit 0a0d1d55dad5

Laxman Acharya Padhya (4):
  soc: apple: rtkit: free syslog buffer before reinitializing
  soc: apple: rtkit: bound syslog copies to the shared buffer
  soc: apple: rtkit: reject syslog indices outside the entry count
  soc: apple: rtkit: rate limit malformed syslog warnings

 drivers/soc/apple/rtkit.c | 75 +++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 26 deletions(-)


base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
-- 
2.51.2

