Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D28CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=; b=g588M+zx6Lcthna6T/asi1saK+
	SUGs/+wMO8g5+/EydL45pS2R55luLTcwraxFgOZgL3b3xI7jxBvqIHE8nPjkQvVgSKOXvsCk9canU
	cm/G5nZQVhx+zFbnZc2rrQ+LNT9gTK6yBdoXzPo77ExdylrXL3s5QtkG8ZtF9XiROj5KuWZ162Tgw
	SLTXF9LOeCXJxiCTC7jypJWWNgh8QQ5WPlZcCbZEueobtdcrE/NbLq5P2Plb+TssSCGcZKcPytxXV
	8K6nVRiiCCZqD/kNAG5aiThN3DSwzu5rlfCvUikSrrAaINhKkZhKEZwHhmnDWKPQ4XNA6uD80wc3b
	2UsAcr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJA-0000000Bwzy-3fAI;
	Fri, 22 May 2026 21:21:28 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJ5-0000000BwuI-34GG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:25 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49040362e4aso18615865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484881; x=1780089681; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=jzlJ/ButTiqa+xTWw5Nm3+bEynRN9wanyLnEpSmH3Il/mJarHYvjQ4Gp2eGn9XdV67
         Yeg33L32V0dqQrFf8kj3NIxk4kx49DDbVaFYo8auri7tx3azXjhuQn+ZdGrdcndLragR
         I+mH+7B5AYNF3mMNneWqE54a5JtDVF1Ad8qoFFpAqNCspUZMIBgX2W9uNzTZr5jQFg1+
         AxPlreNFspbwNq/uZmWfpUpFlGK8gsb4ccWdd6vzr9SO01RQNdQ151U8Q9xCKSpa5rau
         4MfiLYyP/aa8oi5vSY3QwgpfX5MNgYXh4bZNysOWiurONkvOO2Lvf/kTH0cg4DZQ+WK/
         RIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484881; x=1780089681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=FfBJ870YMB3k5YfPGmfwtFGFkaTn7XxQ6aA9odZJvC1kM6Rce9IBwgo4lOPtF5gGIH
         +Q4qXU25IYSN3EJoXxxLyAgEhc3dUyGscl7AC8FuL/kgl5uEg+m1pnN2TN8RA5eYD2NQ
         NNAGPryIXex88lpFzzFZSS2o0n+VjDoESWwNjvBxotaysei2WEfvnWNnpbBSTA2j9VXF
         ofBwLaS14t07EqL414n8o1pNjcY7U6TYWVNQRBHVU6zDmO3GMcwxQlij60/aXux7EkS5
         yYH7GxjXdo+LJMKeCqNOaDANEw/vlj8CFWhHqpsqgXnZ0VfAL85gkoLVJZvKA5tadUVN
         vIHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Nfv90u2l2CTQ+kVG6b6uDrSQUkVjMGJtQnkZEfhtewMgB04fTunLgVaH+Mh1Jft6+80fkfJe6mFKiGcrpEMet@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3S0eWc89OUmnJebPCbtfFGvHFyfOYR21zzJECxTVXqN4krd46
	otCyOhNBwrmq4PCrJNlvmFglXjOFzZuq+rg/ckhmeqerzhnk8RfQ3BQhIbDe7TrW0b4=
X-Gm-Gg: Acq92OGcTbLDkrkAcw0OtCctmCzIx/AAulxcl+5Zh5zarggq2iWVOIqSpHWvbdXaPVT
	w7V1N4Nvuf2nVVVqpQozmhEQjKVhEpGmERRP4PD9qEepmVsikASwfIXo6sYy9qLLcPLHwDdKjpU
	1/U3d3vS5PFW88oBOSB+3IXRlOqet88XyW9EEHHwbjLw3jqU7SUCgorfpQ9hXzbzNuZLWphQ+uy
	QmbJRKLatr83BceUvk7R40ltrNOm8qTCoD7okb9cDm4DkK6iFhRykb1LMKaH1hPTC/BIhWChb+n
	JvIq+kEKmFKaFvqzzWXPhmLpzLJ0gD71HuBE14A1tjvaVClsNPL3KsRd7CLLy6OxtXGhE204tQD
	jSwlhR0JKtkWKbkFTr54lL8KYXvCAAuSjtbHQCBGX2u2WGPkNqGvvLYx/lpvcslmQMBRmM4dhZ0
	HUa6gMNCiOwVe8nEY11P+EYN7TgY3yh6A=
X-Received: by 2002:a05:600c:4ecc:b0:490:3a07:c467 with SMTP id 5b1f17b1804b1-490426cf642mr75196135e9.22.1779484881521;
        Fri, 22 May 2026 14:21:21 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:21 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:33 +0200
Subject: [PATCH v3 05/11] m68k: add DAC modules base addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-5-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142123_809002_7591A5F8 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Add DAC controller 0 and 1 base addresses.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f48cf63bd782..f5acc962bb95 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -191,6 +191,11 @@
 #define MCFEPORT_EPPAR		0xfc090000
 #define MCFEPORT_EPIER		0xfc090003
 #define MCFEPORT_EPFR		0xfc090006
+/*
+ * DAC Modules.
+ */
+#define MCFDAC_BASE0		0xfc098000
+#define MCFDAC_BASE1		0xfc09c000
 /*
  *  RTC Module.
  */

-- 
2.54.0


