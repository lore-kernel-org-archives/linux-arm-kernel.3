Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878CAD6E2B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 04:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zvTYpT8q1jc8sS0GImfUQ096d0hfXDGsD5wyPCtbq1k=; b=YN58GArryCLG5A6oYmk+o0rEZF
	5K8aZZRl9FBryjxnVyU9USJlkHKutxnTHyzZSfgFqNYi7w45kExQEcmW42uyi6K+rffgRvlzqQBk9
	pUJ5HDSw+XrpVRK9AhhWy4U6IPHyD0GT2KmP6YAWdH19PqMCjd4sJg04l9oo76iY2GI7Gi329tPS3
	OxWrwa02nfVZ4oKFzGSQr5JqID/pota89Hw7aZhqftyLSMcVXBk0xjNwk8muodBX/559jD34qUvxP
	GUtqF4MqxzwkkSlE8YPuzzIVqI5yVWeW91Rw/FghdS1tXXAw2CL+OI1w2L63m5DDjlSOWhfTy+6X/
	dcgpYQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDcf0-0000000EO6e-2mTW;
	Wed, 20 Nov 2024 04:49:50 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDce5-0000000EO1G-0Yxn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 04:48:54 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ea7e2ff5ceso4747650a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 20:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732078132; x=1732682932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zvTYpT8q1jc8sS0GImfUQ096d0hfXDGsD5wyPCtbq1k=;
        b=kWVfkKLiBXLvd+IgzvHPhwuHav6DGXrM33uVFn5aepymrtZsrVC0HmpIrMZObwmZdn
         9kr2mgSFJkhzJcWpMsN2CbW5M9jrRnfkmxXt13naEVM6SIITe2u9X9GG11Yn0r+mh9Ga
         bM9ta0M1jNF35oFuD7fGV3r/lGZ8MCSmbfLsMSHWkz+waR+KYm1FCknkwtdvk/250Fbj
         GlY9U82uMYRMMVFaAdjzpZZYkcOJ1fWFMrwM5ezBD9Iz7yCyqjWJyIYIKMgF0A1zJe1Y
         XaBNUjm38lI6h19AL9BA5OTmuledNcSUstHvsyMgM1ZPH7b8iBCAkjWCZ+czOCTr3AhT
         41kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732078132; x=1732682932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvTYpT8q1jc8sS0GImfUQ096d0hfXDGsD5wyPCtbq1k=;
        b=xNKWObGH8WW+ypR050vcw7B/IHlt5so8y4LykuQslG/Y0c5I5aQyGqA9R+y3FDoTYU
         hQ86D3WZAowN/rC1fs5QJ2dJgBU4CgDsX3HSPQityBcJCSeHvCeCwF8vR9T7Mb80QOTV
         WLFT7XMewXws78nBl9rG+9dJUpgz5pYmCKE1Woy4TRUNOVPpAZfQ1fbPpezt+oZK7bhC
         +S+khvC3w8Byq26FRlypmsEAREqIKCmJjd2yAGtgwonwbiMt6slewt5CA5BNsUy60T0L
         SBRxnTZif/PD+MqY/85sYap+uHEI1VhaMWB0PiW6FMNlLwIoPP1BQJTNOEVY8PDf51aK
         OIIg==
X-Forwarded-Encrypted: i=1; AJvYcCX9y/SFFY567c5dv9Ua8q8zSwYlVtg0rZW/Kchke7VcZbfa6SopNbBId5OShqIQsI4SqNIycxl6dvFeUF2yldD5@lists.infradead.org
X-Gm-Message-State: AOJu0YytZGK9U1hwXBPj54pbodNUyJT3+rCP+7k4Beqm4fxqsEis9RUb
	wC+r20EazutmWwMQesCmTNxnYePEjPQjmyg6p6ZOO+5k115RkVAH
X-Google-Smtp-Source: AGHT+IGESoz5zqVHuhK+DhIBeFZeRtPWUPmGOFgTAJvyOlJPhz5Ckl7f+Q0aMYsQuL4Ny9Hy+WpTqQ==
X-Received: by 2002:a05:6a20:9152:b0:1dc:151e:d800 with SMTP id adf61e73a8af0-1ddae5e01e7mr2471464637.16.1732078132254;
        Tue, 19 Nov 2024 20:48:52 -0800 (PST)
Received: from localhost.localdomain ([175.112.156.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befe9a91sm614924b3a.183.2024.11.19.20.48.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 Nov 2024 20:48:52 -0800 (PST)
From: Ruffalo Lavoisier <ruffalolavoisier@gmail.com>
X-Google-Original-From: Ruffalo Lavoisier <RuffaloLavoisier@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Ruffalo Lavoisier <RuffaloLavoisier@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] unwind: remove duplicate word
Date: Wed, 20 Nov 2024 13:48:43 +0900
Message-ID: <20241120044843.10492-1-RuffaloLavoisier@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_204853_167479_495E4574 
X-CRM114-Status: GOOD (  12.04  )
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

- Remove duplicate word, 'the'.
---
 arch/arm/include/asm/unwind.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/unwind.h b/arch/arm/include/asm/unwind.h
index d60b09a5acfc..a75da9a01f91 100644
--- a/arch/arm/include/asm/unwind.h
+++ b/arch/arm/include/asm/unwind.h
@@ -10,7 +10,7 @@
 
 #ifndef __ASSEMBLY__
 
-/* Unwind reason code according the the ARM EABI documents */
+/* Unwind reason code according the ARM EABI documents */
 enum unwind_reason_code {
 	URC_OK = 0,			/* operation completed successfully */
 	URC_CONTINUE_UNWIND = 8,
-- 
2.46.1


