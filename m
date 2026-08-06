Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75F7C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o41DLRxqGljyej3mlCmChy2gz82D/J8TfyAhLd7goqM=; b=bXposwAIAPOUFtDo6+s7IMt3PS
	vx0zSinmMOjJCDDPPl7vhvW1Adoeccile016iTC+1jwNlDPqVWdytsnBUToOKXMghwa7xKoTPEM2G
	6fMxeJShrzH3shUhG6JwLHdwnB3WYzDKxC0sjcmhluvDyti/sqjmEw0fNHqlguTV2o4oPp9DW37B/
	FWTZyZksfvoPQpBwSn4UHCCcZkKFCDseQAZ3WBt94Elh42i+7l2JaPH4PMMGViMjmC8YmAzVUd+aA
	zi4D3Y52mE150UMCHs/11arPjcdDnZJEf6WMvfQ0ZM79nfp2gAuzczDnByMOvBemX4xuA2FNFTap6
	lxy7IbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrae-000000052NT-1OxY;
	Thu, 06 Aug 2026 06:28:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrac-000000052Mh-0dkv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:28:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2caced6038eso7290835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 23:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785997705; x=1786602505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o41DLRxqGljyej3mlCmChy2gz82D/J8TfyAhLd7goqM=;
        b=W2WjK15FEZoe0/74TlSsFWoMJSiBv/+b2/jJ2DGdwsPrs48oiVveKtPBMrB+1Ya0Pv
         sRODXsoI0DGZun/mZ8zTkSlu5rdn1rERIokOd9O5iw4eN30n/smQC/N7+pk1AnZqKsVl
         +hULQBMcw3hT4mdZECPqvqsqrKe+RsTnx1xCKh5eo0oJf46dPD8YBUQVrC1NIUA0bEeH
         Hsm5I4LfcU9MkXL3wW5UighZNIuuCVj25MA6soDf0JOfoVDr5tmFPgnPb/8w0fobqixJ
         qtpDNwsxfwNfOIMCOVhQZ+gLX6xnOpMTx+B7Bu4b1JlOk15T1RLG9av8Yusv5WPVSrIV
         7+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785997705; x=1786602505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o41DLRxqGljyej3mlCmChy2gz82D/J8TfyAhLd7goqM=;
        b=EZUreKwQKs6p1KIdnrZjYUMFwFQKGUHKEY8UJo5/6jJWmhX7f/hT/xNDb2SAS/UW4i
         RyBivksAT6IzHuXt2KD+7wee1LOLTdP40MIkGuq1o/TSiDNVLQplsvxs2FybWUu2F/3O
         +Yl3vWRjfMXrBM4/HQuOmxmb/HjgHgqQtA9wlRl86jp1EyUVRsmVLtQAnmC1rtF5O5vC
         RD20JFRDRB19v6XDhcCi6cRY+3yE4nkdwZWOaDk615Hx+3i0J/K18JWROSErYV/n2iIs
         i4GMQNDC3QdA+ZBuEJgAtOPfa71QTDgxEZAoioc3/3skieheWFljB0yIf8Wi58976AXO
         R13w==
X-Forwarded-Encrypted: i=1; AHgh+RquQE4QUZDXMe/2quHbEFhJjmQ8HWBYNVNRz6iPsdfXzXhqe0pqTCQlGWYWUwQn7CwsSQe3r9A8U5JjiOrCDMV6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx01W+p2YFIEbDCdqVPPnhpPI3xTEEmbRb3z9V7fWNU+etYpXNi
	O5YOWy8K1i9wddfzF/YMsL6XPMiRlyW2epKiEQr9+MXxg5YPq8BCgWR7
X-Gm-Gg: AR+sD10RS6fTIIwPsyObSqTbfAL0b6/g8BV4Ri3okD1DYr5sZcO/hvluCmy5/Ur80zk
	W7RGYW96S6+LLWB7b/HkKFOOw0vMotG8q5w4qzTuBwTgZmlxnqaQ+hSBZIIhQFQVB1C/vApjr7u
	GIG9O01zpBa0oHFe2EFPRhgcP7Y7hZ35NTW+tbo5FiJYtOlpK+FJ1X7iei9H9nPXHTsCu6FnTLa
	TGCCFWHVcSa/W2BWKwczOTmQ1xUJ/8UFv3KFeIDZ0Bn/wo1+A2/v7RgCyETqWHi0KqqRzV8urBn
	hRD82tjPB5UKLEIL3SQ8BZ3AW/080oYEHuGuFHekPR7IDOjaP6f5Uugd8MWR2rwl8VULOZyHZNJ
	PXVZY/K4/NBDwzdZtrDavXTsuXTqhfwXc30MpumnLwYEyFiwp2VlcHZ2aGVStHriM2jns+PMnDA
	/RgZkl94f8CAFXcPuPufRfIzTlp8ufIVBABSu5vd9DTp7ICQjvAyFAw5Yg+s3IhZ4WXlIM2VOZx
	SMNnP3E17I+8e5+TqigW+mGdg6jyELMndzQDQkK1x2ykg4uyAq/qp4y9NaXM16xK4wKp8EgmZTx
	79tG
X-Received: by 2002:a17:903:32ce:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2d0f1ab9328mr40995015ad.8.1785997705293;
        Wed, 05 Aug 2026 23:28:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4bda53sm25370095ad.63.2026.08.05.23.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:28:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] watchdog: orion_wdt: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 13:28:11 +0700
Message-ID: <20260806062812.26523-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_232826_189118_D113D010 
X-CRM114-Status: GOOD (  12.44  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
re-probed when the interrupt resource becomes available instead of
continuing probe without an IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/watchdog/orion_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 0e145f762f6f..8595073a8179 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -606,6 +606,8 @@ static int orion_wdt_probe(struct platform_device *pdev)
 
 	/* Request the IRQ only after the watchdog is disabled */
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -EPROBE_DEFER)
+		return irq;
 	if (irq > 0) {
 		/*
 		 * Not all supported platforms specify an interrupt for the
-- 
2.43.0


