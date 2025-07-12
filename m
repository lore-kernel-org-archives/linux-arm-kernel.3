Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C78C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 21:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfbqWqhAF1GPPRiAu1364uXMrz946WcMqg/i/HnGuaI=; b=t475uMwxhQxjA6YjxvtnTAsVpq
	jf3aDy0B2+uewegYdArHOvruqtLR4GvQBu7D7uN/e9Yj5V5AeFGrfJBMUEfKvgcjTRAaQLqcBk/dB
	df6Ot+2uKxeydP187EuIEt2gdlTTOJ8Yl/pDtfdwojRy7QMcJWHsGbtbo2T04TXKdUZh4gC20wzG6
	ZDPpqyhOb27lzwe4N3B3ZWZz2EPD9R0M/8bqO5dQWwPU6CDqzkMN/B0NYixyKrzkP/gRUA3mBiu0y
	yPl8KXQggT8qz6ohjG6NTS/HRIU7bGi/LdoMseIi+JMZptNyS9EC3pzhSdUE7WsTX9YRujjgO2cWy
	bFigvfNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahTi-0000000H1ls-2vTi;
	Sat, 12 Jul 2025 21:09:50 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahOu-0000000H1Cb-1tmR;
	Sat, 12 Jul 2025 21:04:53 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-74b27c1481bso1973749b3a.2;
        Sat, 12 Jul 2025 14:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752354292; x=1752959092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfbqWqhAF1GPPRiAu1364uXMrz946WcMqg/i/HnGuaI=;
        b=ZZSntWhdgkzYuVHcjCPbByYnX1Co7hdE4O+he5pvqjwu0ew5AZgJIpzyfX5twdiiBt
         bSLxDUPj3trSNPkxKhp7wax3CGKiNNVROZKUTf1Vn53sDlt9pzh6wQldk7b73YYy22iw
         XZmsZyQkn3Hh0dPgs5p3loK6924WLJx0psqsvUYdF6Ed2TmZLFHmY79Nfxibva5fr95m
         Rv/14JZ8yljlu/Sy08YXj++6yBESw32UXY+aRVfq5YUgfJIRV1y55QkJJbGCz6LYC0U9
         Eaveq8pzLkOu453yhlxJJC5vR7tW/8qySsvaJKZ9wutE61BmENhc5oNra0vfH9c+Zdf0
         QXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752354292; x=1752959092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfbqWqhAF1GPPRiAu1364uXMrz946WcMqg/i/HnGuaI=;
        b=Ka0V62Kywah6QstPKMKHtRc8kiW8u2kr+qUZwdcPx3uV9R5/c7ETRm9QWhwcRGnhG/
         fzYmm9QyNBR5c04Sc/UWUIA/OlPRIcgMc6WmZv/klytD8eI70q3i3jpEqO7SUye/rSkG
         TRNIJQbF9/8CMeEsaFmh/qXt8wJmo2Lf81gzLhMgsx93b6vsuu7AKFSwoFwOSLzVIJD3
         h5nLqTLrT60XR58fzflbHSBTd9s9cAGhGSIzVuQiQ9cfbAkxB+WXRJ+Wn3p4SnUvhTis
         ThDN/++xUjmW8i9LFcxbrdx+bkszXCeAi5SI4M+9arITc6t8FqctCWIZCcmcqq50RZyl
         DZOw==
X-Forwarded-Encrypted: i=1; AJvYcCUjXcYsrETQ+RGRy3EeLZ2cLbNlOc5xmg6Xqpq7c2z+Ex5SVE8SpWE+uUUnLGw7p/ub/oBrI4Fp5TUfjQpl5fc=@lists.infradead.org, AJvYcCVI62XNqGFhi11ObFaV2nFNTfaeOfnprd2RPGnNq4ir/vOCIEacsVVBR0v1J4cV0ah4VFpeKhdoDE785mSzcdsP@lists.infradead.org
X-Gm-Message-State: AOJu0YyGZAAzvKl5/oZCQbGzEaDsCyIA8BugL2ZozqJlFK8tEp69R+N8
	otV+lZAg4mGOeDHE3aTNtM/TpCHBydZIbDczDcwRpmlQP47+/rxCbrQ5bwFoyPx7
X-Gm-Gg: ASbGncvP1fDyXqLexlkAzKTp/xwXRLQHH4KWW5yAfjs50tCraYXhX05QDF0sdmeyVJx
	NI5RQ3lruNN2o905prFTM/KVJvQ6+92in7j3DMTt/wXuzJg/4xYvZTHoFTYmSJaYE3CbrReZ0rB
	I8vqjfTaPeFl0Pwzs4J1rz0ygPbWPqmpr9XZ77IjQF8p296F8837aJu+3gJGL0nx74vteReYXCA
	nErwhTjTPv6/4D+uppQHERD4bZ84Nwuv4J6Zf/NNspCb2jCuwfmH6gVEIqBA4u7Ja/elL7NNF6q
	38C8shn09DC3vyh3HZ6dYLrgT1Q2Tyg0/lpXpJdSWMIhDhYHXZDXotVCmZJQ48/iXIWw0t5x7a9
	Q9PU=
X-Google-Smtp-Source: AGHT+IHNhPABi5WGgAsr77y9g6llbfq85pqYA/U1Ld31ANa2lqUSnt9jUyA7+28dGs1pA54AczxQfQ==
X-Received: by 2002:a05:6a00:10cf:b0:748:f3b0:4db6 with SMTP id d2e1a72fcca58-74f1e7dffdfmr10394456b3a.11.1752354291601;
        Sat, 12 Jul 2025 14:04:51 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5d30sm7988645b3a.5.2025.07.12.14.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 14:04:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv4 wireless-next 1/7] wifi: rt2x00: add COMPILE_TEST
Date: Sat, 12 Jul 2025 14:04:42 -0700
Message-ID: <20250712210448.429318-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250712210448.429318-1-rosenp@gmail.com>
References: <20250712210448.429318-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_140452_488156_D5732088 
X-CRM114-Status: GOOD (  12.09  )
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

While this driver is for a specific arch, there is nothing preventing it
from being compiled on other platforms.

Allows the various bots to test compilation and complain if a patch is
bad.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index d1fd66d44a7e..3a32ceead54f 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -202,7 +202,7 @@ endif
 
 config RT2800SOC
 	tristate "Ralink WiSoC support"
-	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620
+	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
 	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
-- 
2.50.0


