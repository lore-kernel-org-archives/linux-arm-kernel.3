Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28E5CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 03:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=; b=YVe1JlyOz2vmp6ANqW+cLwZhln
	i6vwdQIp+akm4/dlWVIt+c+UeSglkkUQbGc0GtkRl0N8ST7CylANL0j09MHq5Hu5/CGJCRUt9a8nC
	3wx329IJTszNP8Dqy0fjWWEN7nJHO0g6b2RrYAEwEd5VqlFKPEXdtdxHqLoxNoC/9JR6Gry6vCYaK
	SkTlZ9mGsn2+uMBUF6LTUoNIhnAEWqbGQK7AOThC2gl8Sfjb2k3wtFwgDpkNykAj7p0yrnfRU2kL+
	reWYO1RGQXBhSav/4ix3aeAS0DKaDdQY4YPNgKuAqU3p4VQjSpmGVuHE9RJF+yYVQjc9tnVQ7rwsF
	Ffx9IVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOokt-0000000E4Ri-0tCV;
	Mon, 18 May 2026 03:34:59 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOokq-0000000E4Q5-1unR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 03:34:57 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-366be8040a9so598654a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 20:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779075295; x=1779680095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=qIqz5XhBbJR6o7YNLEjL6kFslDzWjxBWpvGNv6kj31xLTBvu7rmOMsZiC+bufmYzOn
         i1fvsnCpjjo1XRR4MXp+3TcMosEn5nr6qbOTGJkOyaiptc7Uqrbmz03WQb090QHWQak4
         wtYgEgUdzGcdMLaXBcwxCGjN10A7zglxnHh4J0JwXJvDB6CR33F94kx6mC9dSIV/Wrju
         /AwtTDZe1LfBp0TenV4T36VjPgdvfM06fiXhskgn3wOFdlhbafHigc77cyL9RChtymbo
         o2rzm4R6cXDkaGucMfAyDaECTzwKq0m6dwoEpjgAa+92f2ZqXacqJynNQxdHsnAWNueX
         ZwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779075295; x=1779680095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=rdVA2TjFHihXEZwKN8Mt3QSiCXg+60h1rHYJVNS/7YGN4dgUlnYZHLY89X3BWkm6Ug
         TRPMTfRYt/juByL3oXppqGGq6+8/5dK+hVtHd2utK+ceMl8c8d5O3462XANCw2ULql/1
         NMoRS+seVHjMlJC2Gkv76CQWP1fXzlD8cOe0pad1dJs1h9Y+yWYXTrEi06e/IVNdytVC
         PXaPAT/yE26IVZebf2OSfMlFfB9sKxPU9zzcpOhmdjGNOq1l7o7vvXEY8qUUHtE/QSPD
         HxoT012mSVEPF+UW2xWpQ1mSiOU3tI+5/EnAgREDrnmarTklIO+vNLjHaAMNstTPmHDq
         gotQ==
X-Forwarded-Encrypted: i=1; AFNElJ8myDBaZbsHWJDu2HZEnGkRUnQdAl7FHKWQiDslUuN16MPfiB5/lwKQqBnu+F+9o/6FbTDKnnxxBG4xctKuLkJb@lists.infradead.org
X-Gm-Message-State: AOJu0YyxCFyLpXAvFbdtlT0USi3krhweDe6Iz32jq4DF+RePAd0fnlrE
	/pq6MzMDBlvhdXPw5YIy4fELB4TKrtxcq3muvOf6cpZIh9wg9raxLDnD
X-Gm-Gg: Acq92OEmhhQnWEp6mqro7CuO7pi7q2pPk5soPyVUjnG6vNfRaovJyZZRyic++V3cwqZ
	p6xtqh40V84vZDGPimxDjogqzFaw8VZcCSwPBvL9it/rB1ZJCWWR0LytvaoROZ3Rq/MtZfXtOq3
	hzvYt3AbY/mgVKnQP7kQYyuZTtj6gz/lk3l6HUWJn3RGd/vnUlWzaK2X0jyrGXdGDLNPgdWVuJj
	Lk+lzEwq636PxeI/zKY0OB1di3OPjck8TsTS8gOJ3dYmJs1MqTd803Zib3f4Rxaz1QVxqwDawG4
	ej6B/BuPkuMVayyQJGKktRie5H1eBqX5+acB4KzOyNu3zhvzV95AhzZLnoSkwzVVAvrj02a7cHG
	CuxUzKd4OCsA07tCNbWBxYBeuqmHb9ooPCCo7A2JxXvXrcvfm2ZF2dygFhtijTa3zCm5Vd7/t2J
	rfxW1Z0PPVTV6t0KvttP6NLg0ITp6a6IoYK2c+9FPfXrh1Zy8Nidw=
X-Received: by 2002:a17:90b:5284:b0:367:bc89:546e with SMTP id 98e67ed59e1d1-369519e5346mr12755196a91.12.1779075295262;
        Sun, 17 May 2026 20:34:55 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82c4031662sm11183717a12.16.2026.05.17.20.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:34:54 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Mon, 18 May 2026 09:04:39 +0530
Message-ID: <20260518033440.17569-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
References: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_203456_499476_F9D7F5A4 
X-CRM114-Status: UNSURE (   8.90  )
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

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab0..656397850 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -77,6 +77,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
-- 
2.47.3


