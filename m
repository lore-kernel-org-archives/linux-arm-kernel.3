Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECED6CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoCiVofkihU7HPUi3IX0CnSOHLAMfManJqPdcZxdW10=; b=LS98v3fUk7NN1DwiIcuoiUceEu
	eENBrIgvThA+mquc3mgPIv0svCeygD+b73ufbb+fBeuRzYhv7kZATiX1m1OXpSEKkJ0VqQOJuqYle
	ovmP6qM3fnghdSsMaaOuQeGjBo2NJuROatkZEg3Na6XTNemLkGrS5d4jUxz89Z6H+gpxvzr+NKnly
	xUtA1LGmMZuoR67WkNquS0USn+CUtV9tflMo1mWc7GePdiXD+P86QGL0Ebhh9+l7FXPusbSJFxyxR
	hgpMfZt9tle2c4n7/cqxvp/XmP3tkKKiTvt7wsxq8HAlOzF2NVPKZPSYiJuYo2zBIh/+Afv09kH6R
	aYH2dC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChJx-0000000BYN8-3qtN;
	Sat, 25 Oct 2025 16:40:49 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChJv-0000000BYML-1Yng
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:40:48 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-89e81dff0d1so164265285a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410446; x=1762015246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoCiVofkihU7HPUi3IX0CnSOHLAMfManJqPdcZxdW10=;
        b=EGJYR0O+H93utjWM9QrJCdpz2rKeSoxRkpUwC0crbCNf8ur6G8HLzbHqqM+qTPr7Jt
         x38lp2geP3tfVaOsyO3rqQdZcocTuSStuNQ67OFfYjrqMHtvypBCjk6OdNELQB9M8oSk
         akvwnKVAWWHPAVgFPg3JLSLU9mD4imoo1J45+X3yKjFF4i3HLCFR0ZRIKVZoYsFDhZT7
         t7XeqxPXubSlhbL9E+efIuZJfV9+on1pW0FaZ6jbHTGfBQREt7FyilxTrlaK9YBgcTvd
         P4dYqysX1pd+31HIfIGSex5iTs/bbxpX55RCcOU2s5E6temw5wzAKQAV+ZHjCin/ji+i
         O92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410446; x=1762015246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoCiVofkihU7HPUi3IX0CnSOHLAMfManJqPdcZxdW10=;
        b=gKyChc/+UiC6ncXMv5V5jH7YNyponme4Pks9Fto0qzxqJrxdotQU9UFx5VkSFT43w6
         l26L8HHyxfciKlHolV9UeoEQQ0TKeUWeAnH1YK0F6IRvll2qgRwgZFzTSNY0li0bpBya
         pJR0Rmw2JiQUXrV/Vez7jBozBrQ2SPFcDiIJ6rebxQRmMZOAcxpNEjV/BJlsAntDz1q1
         tg3eFboSuJzVcRDMWu8m61uGlVDYZjzzk7v8BZW8XS8YIVLhklfS8JJF9cuunOe4V2/L
         k++91yS89322lgg3AeVVb3PERBSHBD9U1mI6/rvQIfmyToPSDLCjCh3KzEiV2Acuz9vW
         kS3g==
X-Forwarded-Encrypted: i=1; AJvYcCWM4xZj62ZWZ6WSFojFAohBIq4g27yXrYJvNVcQ5HFqoF0GYC6ktR862w6wZcUYkJZTG8dzhNxHbRVPavAJs8Ws@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxp93ubWjw9s15CIqZ6XHCoq3BDSpNm+otzVXLTJNMy+e8SwcW
	YqN8hFN15zeB9ze2poinBOGSnbLcpUwPfGaK/10Im1+56WDaMb29oTxc
X-Gm-Gg: ASbGnctO9O/1oS1YDo42O4RJ15D/4arVSIktLPUcqwg37EjZ/RyABjpKzuS9FEO7MbV
	kdTA+C30BgKSU4etmzTBF5RxPZMWMiH5llNodpQsiPMLOXvWvMIphPPypElSGHeYJC5/QmeZDku
	1jjLuIipvsbDmtp0LH8v4GDyDBDvsjPl8QylYjBs3Zdx4o1UbYM4wo/4bYaH6s1uyyBHQy8cpeF
	FqaQH81U0HAaKRdrn+15sV8OtmZ+1h77WIEwH7m3+5gV/W6o6O7TJA6oHmUMz6hrM6dVgHqaqPl
	YO9kg+XmCmKEwQWut+OSnaMpMY30LxJHjo3e5RGaxFJYw9ag8Jg1MdOhglUJi1Hqe306fKE8qHE
	OXXusddw4pBwPtEBjJv8lXX4bZSA7rw/uRV5/5IkDLJ1AiEEQShdK1CXUIo/9IPYtN6ZLJiAO99
	3CHEchiDU=
X-Google-Smtp-Source: AGHT+IEzwEpSPArjLqlG0LYeyDVza7kBw4d+eUFvxpdvGPlHshputst68kEyacFkSxRzJzhEcVF1nw==
X-Received: by 2002:a05:620a:44d0:b0:892:7394:e9f9 with SMTP id af79cd13be357-89c0fecd235mr1189899385a.23.1761410446137;
        Sat, 25 Oct 2025 09:40:46 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f25c8b849sm173105485a.46.2025.10.25.09.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:40:45 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 08/21] mfd: drop local BITS() macro
Date: Sat, 25 Oct 2025 12:40:07 -0400
Message-ID: <20251025164023.308884-9-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025164023.308884-1-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_094047_406492_699A11AD 
X-CRM114-Status: UNSURE (   8.86  )
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

Now that generic BITS() is introduced, drop the local one.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/mfd/db8500-prcmu-regs.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu-regs.h b/drivers/mfd/db8500-prcmu-regs.h
index 25d2d5966211..c2bbf325efb9 100644
--- a/drivers/mfd/db8500-prcmu-regs.h
+++ b/drivers/mfd/db8500-prcmu-regs.h
@@ -12,9 +12,6 @@
 #ifndef __DB8500_PRCMU_REGS_H
 #define __DB8500_PRCMU_REGS_H
 
-#undef BITS
-#define BITS(_start, _end) ((BIT(_end) - BIT(_start)) + BIT(_end))
-
 #define PRCM_ACLK_MGT		(0x004)
 #define PRCM_SVAMMCSPCLK_MGT	(0x008)
 #define PRCM_SIAMMDSPCLK_MGT	(0x00C)
-- 
2.43.0


