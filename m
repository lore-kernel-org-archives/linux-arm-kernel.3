Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F45C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UT7dco9WdetfFkkLKH2JjGqLsTlUyXxMnGEErvoVIh8=; b=P3MJ0cYp07r9Ip8LKrx76SiNUi
	Eyc5P6Ox5fUzMrPoQ9beZF9QGxoneb8m5AhBlxpgDEoaDdS7g+wQyuvYls52765aCCjE38mNnV44h
	zJyNkuSVhT3EjoRX6WcLbwe7cMInLldSMHhQZ6ORq2fBufx6GwVu1lfQ08eO1+XtSJpTSZhJAxVTR
	0rM/n4C0dxCn446/qY9shaFFEBOlwlf/6r7+wZhf1H83zARnx7vTS4CAWtr0oXTdNExvN7KovqcDp
	1/ImE6b4JsBQo+r3Zf6V+LN8V+7uabEo6qWj5TB2Qu0ui7bkPj2oBJ9v82dGKvLdiTwotfVyYv2ma
	tV7nG5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrraj-000000052PA-1zAk;
	Thu, 06 Aug 2026 06:28:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrah-000000052O9-04SU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:28:32 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ceb096e675so24119105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 23:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785997710; x=1786602510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UT7dco9WdetfFkkLKH2JjGqLsTlUyXxMnGEErvoVIh8=;
        b=X5HjrkST2GHADAIcLUN7dIWkStEXEX8u9SirRFYWW7Awg+UeeMQCZgVq0jKGjJGsrA
         5MzklkMdoRYxN0bTdakVpfaElecRD4dr4TFrSyO+ifKKQ0VSRVn0CLFJKHw5rxUzWQHq
         XL3uO3K7OY8dPiwLvtOwMg8ES3hd2l9QjeBalgSmWn3xybNPIAgNDpmZEoA6z+duJaqE
         Ik6p7r2Oarmm89WADMYFvBE3ZErjZ1/Bd4aBoAPfMO8PZ3R3qh51kcRrSkUaPyqdA2MY
         0CvAsDHQ/7iRzZxLOxg0chmdXKf79yiH4JQz8DB7yUEn+EkR6JUIqzMMIkZsLRW8e14r
         vdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785997710; x=1786602510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UT7dco9WdetfFkkLKH2JjGqLsTlUyXxMnGEErvoVIh8=;
        b=i0U/9WbqD4fXWeULdZj1yupe8VH2/3z4VhweFICcE/M9buNsaDuK7g3V0Rq4eUVzUm
         JI7jRMixhrfbJNZEh34sGOekhZOpaQcT81+FdMQXigby5E0t21DUkHL+a/mEDWUEW40n
         oROZszTqBPgfypzoANJVQkOxeqdVo+UMMqRhbwv4PEahrvqjWeGCxXwDl2kDXCHnPFhk
         S938YS4gKH4noc4WMhjA1QFtG3tVeFHjiStDZ66ueXPb+GANCqgHTQrNDapGtFJ8ME7o
         xOhOtpeSNMrhoqskj+A9Xo1Ze4n/i1292lclgmKk0XfZLMtinVgLCCfA/nKZ+3fjlbIo
         LNcw==
X-Forwarded-Encrypted: i=1; AHgh+Rrg95oZD/0oO9Gp647ubuh88cQR6wsiOehocOBpk5FgMukNn4jnhidu8lQO7Ca0jLjbZoezHtbuq0pt/TDa06Fv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1WQNWvIsyGy1cxdBP4SGbSJdoe0jl05a9uilyps9nsXtg7dk7
	siiOfDbjtQc5qmqPiarHTdgXCRH20YO0TOvC4mmjjGiYU7B6jEdGupQq
X-Gm-Gg: AR+sD112AE5H9iGm1nQP6ZCUIZHe8hhe8pC91F6xNdgJBf9d4KerxT4J0ZyNSB5AUkM
	nH8xzrWPEpAeaf6AKek63Hl9TQdF+njyEhqU/F0NoerWFUqf9H9SaM2BGP28Z9wLxG3YZYastFd
	tVPst7FDhhZODSlzZrr9RZJ/qSD05kBKLHntomaUBHdMLcg1Agn573sDmQgzcVtJvxjj7UgwhGp
	NHQJfkxXrnBRvwoB3vOqIZZviAP5+E2/lc1o+gsaI4krWgNsSdpIRsIyrJQ4pe4N570EdmvOCNB
	Y46YImzOoK0Hqnt7jNmrb9LG0r3us9+82awTi4n1Ad8x6EBTPIjVw6FMLf/1NcKXY2dS+cztRRw
	eOSizKB6BaqZZFZ6HhJhCJ6XPutK1gclj7r0RSdx+yBsMzntNn5NZJEiAsOAkIQ+S9AmuOPdzXF
	H2ANisyLdeK5e0kFO+fbIDbgpxY7Ohyu3SltpF2AajmUd8lrBDV0KKPApIMKE81ia4HMCeBykSe
	D47IyyEnQeYJr+xxiZrnucKF5q+4DPAbXP6sk8b66SWRvgtBbNUKYGHfAg/iWsLhW9Opj665e5D
	xsdP
X-Received: by 2002:a17:902:c402:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2d0ca7af9famr138798895ad.7.1785997710122;
        Wed, 05 Aug 2026 23:28:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4bda53sm25370095ad.63.2026.08.05.23.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:28:29 -0700 (PDT)
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
Subject: [PATCH 2/2] watchdog: stm32_iwdg: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 13:28:12 +0700
Message-ID: <20260806062812.26523-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806062812.26523-1-phucduc.bui@gmail.com>
References: <20260806062812.26523-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_232831_059125_9237EFA4 
X-CRM114-Status: GOOD (  13.87  )
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

platform_get_irq_optional() does not returns 0. It returns a positive
IRQ number on success or a negative error code on failure.

Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
re-probed when the interrupt resource becomes available instead of
continuing probe without an IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/watchdog/stm32_iwdg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index b356a272ff9a..102f51084957 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -287,7 +287,9 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 		return 0;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq <= 0)
+	if (irq == -EPROBE_DEFER)
+		return irq;
+	if (irq < 0)
 		return 0;
 
 	if (of_property_read_bool(np, "wakeup-source")) {
-- 
2.43.0


