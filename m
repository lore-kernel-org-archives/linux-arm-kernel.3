Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74086C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRtunFUAHa1sE6x3tYfwm8b9CkZHcpqXiGycwufdeh0=; b=NzjtVlMjjJjfKXxCRIHSwbXi4V
	EwXNGY+MmMtyFXwAot0TuDVB4l+uCZ3l0XSAflS7FTHQj8EX1+AnuUMlXHTiGDnwY7dShevhJMARo
	GvF10oXqKHenqcqTo7QC0AlXS6IXy2XPVk0m7RODLE2vTDfkxP/rugGb58LZ84jJu0QrJqLFSNZQm
	WFouG9p7SUXNdLqfLWlzqBwKEtj/kE1SNy0QtGX56JO+xLEAad6orZRnqQqepKbZg3lnc8AeNRKrt
	NWfzzZXWm2qCxrYWJ+sfAWUTOzVUMkRgwecI3f42JY69RTxtowliCiP5KemTwm8DzKrOJNBXpPaPs
	JIrlrHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFla-00000007OdE-3lJ3;
	Fri, 07 Aug 2026 08:17:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFla-00000007OcN-2aoS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PRtunFUAHa1sE6x3tYfwm8b9CkZHcpqXiGycwufdeh0=; b=VxCtPlfXyz2xY3Ye3q1x006How
	xWR+oNn4MslnYv5gHiMiAR25Z4+uPLbBkmlmhzPPQhLJMbRUFU9X2SP5h8iPtPZZ5ryNW/4GcANy0
	Gc34cLzx2Wo0oGSD458FVgMpIHtnI27JwyNcPdvvyF/y3iogHc/qEAyn/iSWv0yMBiOLr2HhljlIK
	Q5oUsIFEbztAnA0Sa1UJISkl3guTW+BewPRJ/OFTDuCuVoTO7uP6lyBzaVxhvJg9xDa9cFmL36q4n
	XHLfL5XB8Rp65CcALdOa04LkqGcygAHD991TSsdRwG3PQEvDhO/QTx8VnyQB4qnymPaceYsU10jT/
	eQF7t2Vg==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFlX-0000000CBcS-3cNF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:17:21 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so3733738a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786090637; x=1786695437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRtunFUAHa1sE6x3tYfwm8b9CkZHcpqXiGycwufdeh0=;
        b=LdZSTS183joQnvECNMFQhof6tnUQ1UJoUXyec8HKDz2LqhfXUcmmYeiyEzbXw5QxTw
         1t86ORAAezfQe3wwqqVMde3wDR13VQBqe/q22u3ZkZ2uN5PjtPdQJsSGvTp7F95Hq9LP
         Ie2gPiQEJIuTXl/cK4pFHqZhRQRgljqWQiAm/HJ6XDyslBgLU8q3qH8sCwChR4KhjpxK
         nRu7xar1Q8H7Lz9JGOJhlH0JnYNGTrbFhXLxaEA9cDQtkS3zWWlZ6Qa8lhXgp6lwcaWw
         7ORNH6ZkRx1ld3Bg8jM1daYROITc9ayy8Rzc+g9P9xZEcZ/OESJ9vDamwm23EHlAQJVI
         HsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090637; x=1786695437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRtunFUAHa1sE6x3tYfwm8b9CkZHcpqXiGycwufdeh0=;
        b=OZL5eJ19clmM9GkW8szrPjcRYxRTS4Tk2eJUEGqKwr4QNGORqCD31y5thI//AQcU9D
         FH9JET9wxGjvpRav/omuq32Xm+Yp3tknI32FvkpyEE7XxIHxrevFiDHdg2A08PxsrGtv
         aziyrQxycbDZNxwBsVsWvRLySzHbARnnShueVjhwrd5/GvkmWXuYrT66Ud7ttq0lKUXD
         k7l8xbOa6jmGiF73ldMokokuRV791SKJLhfg4D8ZQ4U49bwxGRLyPOIDY4F3q1O5phLQ
         uuC2Xy3Mi9N4l8IWlvPuMh6F5sHH3e8HTSzhxIg39y1NrYCCtRfryb5uC+oOC6xMELQV
         m9Ng==
X-Forwarded-Encrypted: i=1; AHgh+Ro9H35phga3BRew+mnzPlDA7sOmM7jXTnncWRo/nNXv978pimR11bm1Rmnwro17OkPbq6UPyd4QWAHOhfEePR7T@lists.infradead.org
X-Gm-Message-State: AOJu0YwvmR//r+0wokawNBrt4atws4hCIAFcKPXnLy8Ixj2a0Ht2IxzS
	i+55o0bVNIzA5C3P/pvK//tHlw9jDYaYVVSzvwPcfhFv8Qs6WS+5WQsp
X-Gm-Gg: AR+sD11QHAoGJZRS86bOiSYTpTPzr12u9GueZ9At1ODRiKI2uwSeToRWwCZ2V1G61oD
	Mg6IpeUCcdLZta/FiJGrv8yu605dsIkZdtviVIJEHb5XPxsmD0RBeKLVsUutvyHUWXo6wvRixbB
	xt9kx8zTiC/QKX5LYo3Exz1lDIud+pEE044vfZmYIpWiM/5j445zuKksOUFjF0TIuStpOuiwKcA
	I+zsQi45SO3hruZuZAdb6lmUbI1OAMlYi9L+d0935oXHFfDRKEY1wwReHuEgAmgs04o5Ix723Gx
	F1vqonWWzGD/6JRMMhGkUzac7i/6ewMYpRY7SuDHOcmIfdbfUuX/M8ln3135j9kaBEou5BeOfi/
	sBB18QbDUXxQFL89fhIc4IosFp08Y8UJx/wHpJnAHjJRc6YYrJdINWtqhOTTYeJcMWMk3aoMMcz
	pi6ZewaQGLQLZqcmGCAio4uTp8dS5Ea5llW6vS3b7hbnAMN0qMS3b1oL6YUi3QJo6jn7OrvnM9w
	RUvUygRt9n/qun7X6ak+Nx6aeVzBuUoxpyOXhNES8zWuyJSIgx3DJQfG3+KR8PnMqWyqriDuZeL
	oAcH
X-Received: by 2002:a17:90b:3a8d:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3903c5b9f70mr18650486a91.13.1786090637616;
        Fri, 07 Aug 2026 01:17:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm3913377a91.6.2026.08.07.01.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:17:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] watchdog: dw_wdt: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 15:16:51 +0700
Message-ID: <20260807081652.38692-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807081652.38692-1-phucduc.bui@gmail.com>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091720_007149_0B504D58 
X-CRM114-Status: GOOD (  13.41  )
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

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/watchdog/dw_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index c3fbb6068c52..39031445d754 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -611,7 +611,7 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 
 		dw_wdt->wdd.info = &dw_wdt_pt_ident;
 	} else {
-		if (ret == -EPROBE_DEFER)
+		if (ret != -ENXIO)
 			return ret;
 
 		dw_wdt->wdd.info = &dw_wdt_ident;
-- 
2.43.0


