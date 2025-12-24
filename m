Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD916E7491C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 06:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhSoLSk0toWUxTDlJMgUw8U4nRCTEhSOzea+DI4TDjA=; b=FtBei/dyUkvJtNAXyfyk0gjQU+
	trnZgoTgde5lYMWxZDE++M6GTan5Z0PoT2tN1S7GUpsa2EHRYXBcUbwFZk1wsh5z96R7dO2yGq70q
	cZ200LdVr5q93fBpe0F7k5DJhEczpK8CANbhOcqgVZVs/iCypptlJbUDgVbJGiy4FN0lMKA1Uy1Hs
	FFVW4Qwuvtp8bfGO5d/al90Sae8xaGDWXpNJ9Gu/AJl3Jg615NYkIE4deP6Qy1GUDGnvuvpHIDQ2H
	OcSSX0Wo6XtXB8Ml/rbMXvG1TW90+0N5leHjx07MvklvKn9UynJclXEAmwXOvfbct/l/dsHjsY3ne
	mcbcC5Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYIcA-0000000GVME-3VaY;
	Wed, 24 Dec 2025 06:44:54 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYIc6-0000000GVKr-2inM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 06:44:51 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34c363eb612so5612134a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 22:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766558690; x=1767163490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhSoLSk0toWUxTDlJMgUw8U4nRCTEhSOzea+DI4TDjA=;
        b=kvgntSYO7ClEg3cWyIv6OBL3KdOLUI9x28SQ6gY9r1eEsc6WhLPCh/8ZQVlWZ33LOO
         ki3zrGST0sxxLxKa+CF5ocLbeK7OdEUUe5XrJyDbe3kEAGORiOSnhBSuI+k4nTSUx9p4
         f8DYFmfULlQqSL8/aqu580YpE6vFPqMFSjjP/qh34Ro8/IxUZEdXlKat/fqjuw1BCvdq
         XXX3XHZ4H8ZTQn33S1ZuSs8EN97apK+WfN9J2iUyYDpbswZNY9pXdELtMJ/zdR6ATsLF
         /LvYXbeTlHEr83BFy7zupMhs11fokZFDkwvNDdk+1dtnRZ2vcFsgNgW0LPLi/nJp2QQb
         2omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766558690; x=1767163490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FhSoLSk0toWUxTDlJMgUw8U4nRCTEhSOzea+DI4TDjA=;
        b=Oe07pIn4ZAFruTiSQKThKIVaHUled8zstbaj/ESg7izOsC0jhEVosLelCUDk9wWJ8y
         xCLpHyjL9tncU+8U2me2u1mXvUTAHVtkkHBRUBkNODytrIcA8Z4xldo0YS9ziixwemvG
         xcpf3q+TSkPSO3IJbpg55Tm3lH7rXgKKjB8MmByB9A0DaClwAoYPriXo2e2VbJGtwCuF
         QO54jkWjDBPbbwu6BkPyYjjK1Dv3odwiLoMyPsdyg7pc2RiGilXPQv5Fxfc9505DMIuE
         5vfRnnevBZqsC8dzvKKGiW1v+HJpiCnj3z4IC7FtWRLmHyRhr17bp9Dx53ebyFX5Gn9m
         5kqg==
X-Forwarded-Encrypted: i=1; AJvYcCWu/2LhWSEBjnat7DXEcM1/TslwP2vT4FgBd2QgFXo6UBuPjupRroCh7HEkX7+cKw9ZDAcoe5Kx6eEwWI1mK1tz@lists.infradead.org
X-Gm-Message-State: AOJu0YyOkDPxorgzIWjuc56eth8igZKgIQa3DX61nxsIW22fWbRhLSjP
	Co0FJmPnxjQVH6U5dn2/Cijx5nvUSnDX6XqYBA59n+VFY65nSqS9F6+s
X-Gm-Gg: AY/fxX7yVSvM7DZWC2uQiqxO5zcAM7anvhWDLNnrYRGs3QdxhkEDGCZ6rGDDpqPllBh
	QGXMCYEODIhPR3f0FreSWPqy+/6R/VOV4mz+l2g+6sWvMCW0ZqZk/kyqyUakVZ/6DqK6LLWYIC8
	OVovoCUdgaNV/DurvrJyr2mPpwlHAPHGyAygE1UguRd3lW7lVLiFZ7F6h0TNj5K9/uWelOm6PJ1
	FH9m016R6wRGz72RXkq4a2aUTInpjb/yPVdcbDAkLT4ARUmI2RjrOV1cRf0VctHJ8FDWHyMogMu
	Eu2hm7bpfZuSNtDp0VScKI26NF2y9LVADV16FtDc7QYfyes+NBNJAjHVKlyBqIoZA6ko8zm26Zp
	rces0QpQdPtRGEQV2JYn0uw4EQ2WhKD20RQ/FXwFc1WBwvO1iRAq0tujiuWZ3OqhWSSK0S6+PlT
	VEUaixj5el0pvOOXHm6iYqhJqki5p4koAva1oCEprTBtdl54VgJuU=
X-Google-Smtp-Source: AGHT+IF47XqAx1S18wR7ab75crtb+KkCnxuWXlTWI159pIOjgr1HJTRZgwnJc/m69Ss1gbrpaihQtA==
X-Received: by 2002:a17:90b:2fc5:b0:33b:a906:e40 with SMTP id 98e67ed59e1d1-34e92137cd4mr12343985a91.2.1766558689722;
        Tue, 23 Dec 2025 22:44:49 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7729b04dsm8320864a91.6.2025.12.23.22.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:44:49 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 24 Dec 2025 14:44:38 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-ventura2_initial_dts-v2-1-f193ba5d4073@gmail.com>
References: <20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com>
In-Reply-To: <20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=6cfmAXzuvyWCriW+9K5ER4DTlYWIvpG7m38YclJ5GzI=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBpS4vcMKwnvorNLkNzhT34TH7R/3+C9and4tOSr
 pj+5wx2J0eJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaUuL3AAKCRClg0K3CVbE
 gfzfB/4h4pxLYNKd8HUji515qRmUDHvgspkX5YvfK2QGMvk/FY4mVIk0df+U5dVHMX7TeFi9eVb
 +taH+c6kjs81NmHrITRFgebZBPpc8ACOxhjV5m1PieAQqZS60VYuaB4QNf30CINQKzBsrnz8eaX
 lFBaFhnjbg8cClydb+IJFcwsVirj5p3M85t/WTTBTb0hloEMRvntQ0t91h2AcvAtgftKQJFTrte
 Tt8+u5hC/s+9T43rrHikYSKNKEYUzUzHTjChVUFhdvX94yrwaICkLl2zl/hVhnEXlKOxnHS1Syx
 LJ9oqcaRhUcZ+RKtrDaetZeTY1WwiB0aYBiWMQ3B/rCpoyv+
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_224450_682998_AFCE96B3 
X-CRM114-Status: UNSURE (   8.88  )
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

Document the new compatibles used on Facebook ventura2.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..24e19b8d108a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1


