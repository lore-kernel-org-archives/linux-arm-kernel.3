Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F9CCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7ZUVg/Nr4pBk2YqBecru/L6TvemL+I2eAgpr8B6DmM=; b=ObF1LdaVV41cyA7Jku9AptPamJ
	cnOE6mkIFJYgPJC/WBVZqMtTTIPNFIi9WpOfjcZk/ocd8Ujb6ybA5RiYTtP0+ED4BQZUD62Pw0ptL
	KMTvb8zl+wEwnU8izuE278wxREwsFy5PgZLKyFKHBMFCvdKnFQ1y1yqTa3RlAD3DAjilAt2UdM9xS
	GgecgIrZtEHcU7lGlLSiPjaHhhY8ax7b2JB3m8j3gJrwUGyg2o1v7a4R+FoDy21Ge8p/8iphGKeH1
	HDjnq8EHxbD/aP30XiPvLnKULLZ2uzgpgTuJ2tVPrPZmo0gWQaTzvM72j4GevKkjwFyf4qI0zyTCn
	oYTXvIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sVN-000000074IT-0ZeG;
	Wed, 01 Oct 2025 08:48:09 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sVK-000000074HY-2OYc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:48:07 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-273a0aeed57so8799675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759308486; x=1759913286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7ZUVg/Nr4pBk2YqBecru/L6TvemL+I2eAgpr8B6DmM=;
        b=UrvmSptCu6xwCjAW9sWAuPyLjNcHU99XdN3zQrRZ6Pr+j7mU/mQwbNatuA40ABXh71
         UPHblSrUEdGE+zJblXPYbLNkiCA/Nz3+MNO59xDugYccZBgfzvHcg9LvTRYdyOCudFXf
         szFYAOHkMZQ0kJ5ZrNHSEPx/S181FSRoap+SAx17Q9ip11jlOYo+rmmbhkswroOmozni
         sGIUKvLoVlzWg5y6xUsWuZfT7R135PjdnD9vDGTYxW8fft36hmeMVT60LAUIt6a4Zn2y
         UTZT4eWa2pK1boJym+ClxMtMT7ZyG3aI8weLqNnVjbNUjgEVGffWX/QtijHTZnWXg1yx
         e/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308486; x=1759913286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7ZUVg/Nr4pBk2YqBecru/L6TvemL+I2eAgpr8B6DmM=;
        b=aGeVhYLTVxeTH5gjqjoUkbp0gs3p9/FDdbD4p3kE4LWru6OaCRC6BCgvRQycRdg1C7
         Bym8cD4ndI8Nsuc1a+X2e6bNdo+BeNAp1CMT6/6MFb1pHYQVdVdxMVsqOQX6ACb8AQpY
         +XH12vO7gMUK2KgQeVEUPAte6CSaSIVu/UOMDK3bcub/cvoBfKv0M03pfhuQd677mUKv
         IW+K3eqxUoqkCRHsgkikZSYR7AKo84wwrpYegUximOFjUH4+0W3ID6Kj7a0xEomQZwFK
         bwjUodmDxeb4KEL93k1YnT/v7Bz4faYxGy8+aIzWzaDnuQhYfPJAf8miBqEDSA0hwU8e
         FFJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS0khIwGnAjKcqEWyDVche621H7igeqUVp4ajJFutboqqEssJlxYPT4dtTsg7ISIZ8jJaDpdwDlcFkfekZPi4t@lists.infradead.org
X-Gm-Message-State: AOJu0YxKYBTVdWv9sIQTVFZ/r36HVH96LyqgPhfw2D8xQaOJm+anWweG
	XvEqoKgZpkhzngT/yJtm1YiDb0IyZ68SDGpCbsgIR3hEx03+O0TS3U+d
X-Gm-Gg: ASbGncsRIAG9x+nY1IFYmzbIrrfz51+8hGuR3C2JZzZWN+3qbZk0g6lCLlj3+lOURBR
	clQoxGuCdOh/xi84PS1j//dUXzooCIMi+BSNvt62eNtM4fis3zu7BzOkLZhqsy4OLOAyCR3xhps
	l0ehJtyDw2KEo4XF1tZQasfD6WmrRx5PVBIAWZR5BdPGoUo8SA7g7yiPotvyrJJM2pX1yflvWXg
	ATppt2Kw4ulHDgutAgs2cfgu6SnJnd3B7iY0EKGiyriE+9Ih4n7Dk8Eka4DRSF6H1PHn2vyQyK4
	ZFHDo0cz9OzDxqoLlJAyKjgn6fDEUhbvXj6koXvR0mkHKdNYgWqcol8wzxAKHz6sw7XGQ1hNxeL
	5e6ATRCBKpUPs7CJFGfGa+xzDTCrophEfjOCv2bUZjaIeY/HoZWO/gP0m9SUDxdnZmh3TWxrVs4
	t1Dtdn5mXBCy0FpfyVp18SNFWFaQveXF4V0dEs4q65/JTNGITncc9J/w7UJp63V20fKnRlPZOCF
	NHGXjmSHTQDBeUR2jBlxBFiti5WJK5dwcJpo8gXEJGkHRg=
X-Google-Smtp-Source: AGHT+IFBY/scw80qunl2/T9Vu6PBaPWzoOPWOZLXzt1OOaGSVwS1oF91+HBdH7KtkzG6z1iTX3repQ==
X-Received: by 2002:a17:902:f689:b0:27e:f03e:c6b7 with SMTP id d9443c01a7336-28d16e89030mr90619895ad.10.1759308485671;
        Wed, 01 Oct 2025 01:48:05 -0700 (PDT)
Received: from 2001-b400-e387-f8be-46e6-cc88-b318-45e6.emome-ip6.hinet.net (2001-b400-e387-f8be-46e6-cc88-b318-45e6.emome-ip6.hinet.net. [2001:b400:e387:f8be:46e6:cc88:b318:45e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6e9d22bsm1789250a91.3.2025.10.01.01.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:48:05 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Wed, 01 Oct 2025 16:47:50 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com>
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
In-Reply-To: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
 Leo Yang <Leo-Yang@quantatw.com>, Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759308478; l=886;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=YB1a54MMJXi5nKTH9gbuafJV6b8bO8PW9GeT78qICUA=;
 b=9gzrykNcBM16KdVMIcgRlrKvmyEZmO4QeUAovkAYB+AyBN+PsDPZv3TANn7fES73RwX8lDO9T
 vVHS1f30eGtApZ+9z9igVVO00ELz8Jd0iYfWzrFWVfjKYXrdqQTH9bu
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_014806_617572_FD0D697E 
X-CRM114-Status: GOOD (  10.60  )
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

Document the new compatibles used on Meta Yosemite5.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b4175e109a78d931dffdfe28 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -89,6 +89,7 @@ properties:
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
+              - facebook,yosemite5-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
               - ibm,fuji-bmc

-- 
2.51.0


