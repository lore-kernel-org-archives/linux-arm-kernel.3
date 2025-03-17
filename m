Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77249C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rYoO63O9hT+LgEGrGAhIiJ0zo/hJCz6kwWX13GuFt04=; b=Ilb/+5HneucqEXOhiQpYDdPfBU
	+gLiOg7RkmPh2CppvezjNBoftxlk3fIEpqmD2vhlfmag0+Du9JIVnt44U8h5sctAytpA2RNJTeGuN
	+BAfogCYqoaEFDr7C0E91LCPRmuNirk9s2Jt56SkVZ0zVlgrVw+Fh9Q/kPHNIYbwAlR3KCacWNpln
	PP6TjAyfHULMglCU5iVH07ZQSYossFw1725sV3ooIB+/67mYyVB5XSniqNF3ZyWeH8Kbyv105UZCx
	b5e5xYEEAqC1IxFojnq+ebKgTppSrsmpgX9y5To5cFpMNRgv6pR5pV5Dm3kRYmVHnBqB9LeC/+DBI
	EkI3F0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFCe-00000003h7q-0zBz;
	Mon, 17 Mar 2025 18:28:44 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFA2-00000003gvH-3cFC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 18:26:03 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-3014678689aso2977360a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742235962; x=1742840762; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rYoO63O9hT+LgEGrGAhIiJ0zo/hJCz6kwWX13GuFt04=;
        b=eDDxqTevtIcgv09Y32gViFFz3tM4F5+rB1BFB/oSv1X6afqGnZ8F3KxBvoih8IrM1j
         Ud7SnxXBERpiYlGpmqxp0ovCrnacBcfN4NsVPMAoI2RQ5gFflDgNo5Pv7aAbBbu6SdI8
         wi5esnL13PuMhdh3lHXMvXJqVYTMUnmJTWM9RZI6vu0TngFXmmmd+Rx83sISqsW+qIoo
         ELjaxsdeD2uDz6zi+iau905UEv0yQUgL0dKPHZFxeu3lHTOy+mmmg2uXKhGP7a8c91Kj
         4K3nCG2HUQiZIx+BblWI6BPHVA+62bMbGVcoKpIPuaEuS3WKVavkdf9evSgaMREHqLjU
         A36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235962; x=1742840762;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYoO63O9hT+LgEGrGAhIiJ0zo/hJCz6kwWX13GuFt04=;
        b=uoffoyYZ5n0e0qweX5lHscHEKFBhM2uXWpomWK+c/w2S1kzvD1IsWoX2UowePwmx4W
         FHaO5KMAtlf2+nLaY+YGT4saUbHKPVMfTU0hkl7mwKcN4Z7VCoqUuQnryb/P2TKgwbjy
         lSDlOGEQnB3V5nPmecchJqA21Tz8cl8C3eC8QpSyKdA4Ha7kCTd6ZROigr5fQFynHnOX
         WRWB2qtBaWkZA4N8DhUX8BuZFJCrJ6c5cM8V0A0usAYRjuylsFAUmgINzEvHkLgolnKb
         xhi9Z+rFx9Ua51Gnm5+1ZUh0/iZGyUJ5eX0Odx+nfjI3EOkgcMncv9bjDWorntdgwADo
         jRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGC0yoZ/OPNN9/QnXi1lSkYr6RascFQLOG3vyCbuem0uhA99PyiFqowMYiiYTl8HXz/J6G1MdSaiv2fYr+AVVd@lists.infradead.org
X-Gm-Message-State: AOJu0YyVo6y/HG+S6Ghmz8sCO45crobS/+ApeJ0TbUjUlIRGYpmevsPe
	KwEqvNueetQzsOuZy/ZAqsNiq9kDRgmqExlZysPgw53VigbNb6ElcI02y1MMe7uaJunfCAZlp1m
	HXxrqpw==
X-Gm-Gg: ASbGncuAfLMgHrMo4NN1KruvRkhB1GItMtPaIw/VpCOcw1ZRii8VBBpK+4NaKHKR79g
	egHA+BbV0esiPloWEhEr22mlowUft/1kRnFPJ6arcGUEp8XmR0F3LDkNqcCKFRAIDSMiwNslQLx
	HtMnsYHe81QfL+ZUyCosy6Emx9agsSQ+l5QbEqp14hjRJwoY5AGDMy3NQSUhICf4PB6r4yeBBVw
	rUjtYthEJDxrLR47BZiqyf+4GaxHTGXZ0MMngzchLfxwaXTpK+GHzXghwcWnXw92Jre+R35MWBA
	ce65lWWxk3rsI6rHp66ex93PvyK/slBRzCVZjUqlo30=
X-Google-Smtp-Source: AGHT+IGDo7UUMQx0KC2YYaD2K5Kwkp8RdeTOtJ+4dyeCTYAd0srXw/4KjI/PQ4Ty5nvijUZdv54Y0g==
X-Received: by 2002:a17:90b:2cc8:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-30151cb4ab1mr17747816a91.2.1742235962013;
        Mon, 17 Mar 2025 11:26:02 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301534f47e4sm6410538a91.3.2025.03.17.11.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:26:01 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: OMAP1: defconfig updates for v6.15
Date: Mon, 17 Mar 2025 11:26:01 -0700
Message-ID: <7hcyefqzt2.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_112602_904539_2E85447F 
X-CRM114-Status: UNSURE (   5.99  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.15/soc-signed

for you to fetch changes up to c2a5f8c4f28ffea8c93d10e509c5a6e61172cdca:

  ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP (2025-02-05 16:31:37 -0800)

----------------------------------------------------------------
ARM: OMAP1: defconfig updates for v6.15

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP

 arch/arm/mach-omap1/Kconfig | 1 +
 1 file changed, 1 insertion(+)

