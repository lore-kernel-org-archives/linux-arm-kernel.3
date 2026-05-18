Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB8ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HR4Kjt+Vrl/yVgY170pfdcB9p9LiTbCCTUEcbYkBEOU=; b=p3OwYJNXYZMctBpidnMFHn/FVZ
	X52qK04tzUdagZPHbLR6zANBH82iSPdcgpOB2MGKI8iE17dB7/GxZJH3133m2ww6xjDeAHvUVYXTA
	8rDZzkYNSONbodXzBmozJ3N9lVCFttPrQoIvU4QBCp3Ax9ka9lcfV15FW4dcJiDP3tVZ94X1bOTTV
	5O2nq+8zoJkXQEGLAXq4cprqWXLlGGJ0E15nJMjF7yzRvAoa5CShS0Wf7k8Rda7mnKgkxOczmNUWe
	5UGPis3AT+dDPzqu1b/rnjFUJMkVBuBIUV6ARcNglqLjTXXj11Plc0oQ1EO5dX640hr+xzO5aXJoc
	IuhT0itg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOt6n-0000000EjM0-10DQ;
	Mon, 18 May 2026 08:13:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOt6m-0000000EjLV-1bZZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 08:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HR4Kjt+Vrl/yVgY170pfdcB9p9LiTbCCTUEcbYkBEOU=; b=IyLvoqx0Z4cqk/IGMTlsr9oLa4
	0txhIFfUI5SNwRvZP9XMQKluRUhu/yBQ8hpCLfSeboaB88s6YSJkVwN7yOvnjSLHE8lwm0ZanZI8w
	NKTWU6PW40CZdZVrErXiiFvR2Rhtt97xEiJ78SqRwKPOmp2EQNOGNMwo1HPNpAoWH3NijwfZGE1Na
	GCoyEysc+H8xcBNHYpb96moyvtlyWdyBQTPyJUQVHZZjS5QSuWbQZaD2nX2lEV7qB4uRcfESo7OQX
	kg73YBC0oHMcId3RvhagZ4wNqOBK37o8htfbpj/NORu7P+kNN1WPlxszpvi2rQ4CS8J7WOfKLfmSg
	u3R7WQ+w==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOt6i-0000000AJWk-0GJQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:13:51 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c736261ee8dso803843a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 01:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779092026; x=1779696826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HR4Kjt+Vrl/yVgY170pfdcB9p9LiTbCCTUEcbYkBEOU=;
        b=c9TJuLPJ/V8OA8xLZ4jZKAEGUuAzNZArYMErKlaE1uIeM/c4rmXYXFXalODJ/OIbnh
         5H8zTySlSCC1wbKYxgXere3mT1c3NtPGXOjBkJGMx018x0Yj+bEm2uPaZe9XPJV47j2p
         cH0t6I9/98zQuTkqflFNbxBHT318IcP8244U6SyZGqT5kWc0FkvPT+wTAJpXliL26KqY
         Zldrk52UvHPDRjmLThJiMifMu3cty29Ibi64MGTuNP2Gd8f32KwGfdIn52E0Pj0uAl19
         KxmFzX8//fwNSEjsLPUYM9wUPZggbn7bEwEFghWt7StDcEjXlnAuBe+6SYWS9VS8lAzH
         hbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092026; x=1779696826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HR4Kjt+Vrl/yVgY170pfdcB9p9LiTbCCTUEcbYkBEOU=;
        b=gJ0PMSJfgQTCkqP/cHfDGcYTHyz7/HAX228qHhHYq88dARZgISV4KOToJgmOvgtrKt
         KAIZ9Mt+ui41f5vuKY0Eg4tZQR5gZMR2ke/7PcrKVnCbUO3xWr+AQYDctjTN61HFTG5J
         /+wlu0g5Lfxfxgxr4hZOuTpSvsQdIZQsfPpc5szU2jtht4XurutwuFJAtaPouBVk7bIH
         K2gco6S09HtVsR99eAjBKtgTJUpz5aK8oOFORQefjUeJXBjYN16OrWrESHzohjLtUhCc
         qNBEJllisCzuAiHxYsNWGFasr3G8RKrSaE+9pbajFTbqOCM7LtIYVzQdldFDEz8tMzdL
         iZsA==
X-Forwarded-Encrypted: i=1; AFNElJ9FDmphEPOjbFbM2mgI+Jk9EEaE2t+idcQ1u9tGsaadvhd4a/rU6vaFWxosCUiUkEbtlsL7EkL1gsYqL3aKUYvg@lists.infradead.org
X-Gm-Message-State: AOJu0YzMjj0RDx4BbM1GscWtK0mRs4cdNfk7VZIha8G7MIgs64AhfMvF
	YXXk0A/B1rBYxzwb4qhcJOTwAU/ZPp/3FrpBcAxQHqhqf2FIMz6pg8+M
X-Gm-Gg: Acq92OGV8rdX2p/5RWnWWtMVqRGv+Vo0IFNN4NkbU3a5rLZTN8o/Zctl9JCvnx7DObI
	W7g3KRZVxmtdleBYFcJ56aplcjjBrTfd/0C0q7Gpl2UPTJ0asbmACk/jhqVnDgTeJl9TX49MoCG
	wK2qgYEQwnAkiVnu69Iu5xVA8H6DNNcim76qTV6/1D+ni/b5CKKevmn6kxwC+ILkrdD4s7iR3T2
	SwIScKA4Cz5FJMvwGbzGVOmUkmFkIfKWAay5JX0UjOhtcoCQKyqCIRswFbKEW5cgUyV1rrDwcJE
	kRC1hVPTaI87FqI0NYAjU7SpBEvYSCnn09EmSEOtuqUhar5eIMHmv1BDTZDHoxBUkekdjgbT9K4
	pEwkQZAQWq9UwFpAnb+vjLSSITooMpZcPJrUhWezNSx6ma3XjSnuqSLUHmZ9IsdtbrOBz5Lofte
	/GSu9sUYYgKRCqknKj86avJUTIF9zwj5wBqX1oJCMj0g1aEfAT05tefMnS4oCFGEDTVjQ2WJiKC
	vdA7JgnYSgkHA==
X-Received: by 2002:a05:6a20:7d9d:b0:3a3:2b7e:a4ab with SMTP id adf61e73a8af0-3b22ec60b53mr15472490637.44.1779092026391;
        Mon, 18 May 2026 01:13:46 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb100706sm12749462a12.17.2026.05.18.01.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:13:45 -0700 (PDT)
From: Neil Cheng <neilcheng0417@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Neil Cheng <neilcheng0417@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add Meta Rainiera6 board
Date: Mon, 18 May 2026 16:13:24 +0800
Message-Id: <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779088499.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_091348_477219_ABC5C46F 
X-CRM114-Status: UNSURE (   9.65  )
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

Document the new compatibles used on Meta Rainiera6.

Signed-off-by: Neil Cheng <neilcheng0417@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..1a2252eb08f1 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -95,6 +95,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,rainiera6-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
-- 
2.25.1


