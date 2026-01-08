Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251DCD1D48A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hr9znpRqAwXoXpH6toRVbeWwS5EY58tJLVv5ADu2gnQ=; b=kuaA8YrsfuieNYH1aJrxdVYjMW
	ZtsBz3ILU3OsR1u5AitZOqxTUmBOuT7jX96bamhfAzLRbNUM7NhfnY/z7ps3ktRzQ//4bSnT4xYV9
	kvzw536uuKUxJeOMVcZKOxJXN5lJzFslXaCKM6LzFsYCII5AMz8goAsjIVl1SYMRTo8x9MOLoK/7O
	isHkHZOUgGaMmtLEBbbT+c4/lEdBfxUyiJ8kVuAedKXLY8cZq8R0YablFSG1qLwSsM5z8DjxhwQB4
	sg4Tn51OSxqoqJeIZIXQK2SZsdQcjxqA9ll8zTwKsVOWTzhg0o1bqz8yJA4eYrn4raos+pYGn6IBe
	jhzRBIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxOf-00000000sur-2tLI;
	Thu, 08 Jan 2026 21:18:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxOW-00000000spT-3N8O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hr9znpRqAwXoXpH6toRVbeWwS5EY58tJLVv5ADu2gnQ=;
	b=fIm4rnL6ig+3C5ew8x0z3DZD2hbiOWmOi6RCTAQPk3BB411FYH6gtsSOw3pR5LEstCoKqZ
	PkGxsfTUNKXjOUVjwBmzEVYQ72rfBGw5Kng8rdEWQl3x855Dh66Yk2VSBBj3eTUqC2PtyG
	UEgiKRqTGlvArpoSz0qmDa2llmni71E=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-qYKNI78IN86AAX04vFeBEQ-1; Thu, 08 Jan 2026 16:18:09 -0500
X-MC-Unique: qYKNI78IN86AAX04vFeBEQ-1
X-Mimecast-MFC-AGG-ID: qYKNI78IN86AAX04vFeBEQ_1767907089
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-55962ec6308so7702348e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907089; x=1768511889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hr9znpRqAwXoXpH6toRVbeWwS5EY58tJLVv5ADu2gnQ=;
        b=ZFGZSfSCEZAsLpapl0I+F+hruvQVpJAnnKzodyztmIYHmcmmo857JdBO8GhrgcfvPY
         fR/btDJSrqnT7tQ+lwyTrEI/cBw7TgJ1FwCI3AcNQtJrLP3sAiodppMPJkhmryTQM1NO
         5BW1UAzEPZe8qkdFEof42EWq8m8/Jjc3Fu26WCUn+30nIOOmQizoxZJi9zDlTTWuogd+
         xzsf5DFKqmEYd++ZFgAnA1RenrfnwEQu3krON64iRBExaO8eBgEsq3NUNHQHsshq9aX1
         5VrN4d6l3FORycIxAFmpE5cwNzUm2wNMxrfCl3GYjojEqJcan7aAutu76ht7vx8+d+EL
         aBRw==
X-Forwarded-Encrypted: i=1; AJvYcCXN/Ul7JJeFGjaOzL6teh/wBU9BPAYEK3Icj3MfrrrLeblVxPP5z+VYK9QcbMDESN7F2bFCAhaxDJwt2wfAHLKU@lists.infradead.org
X-Gm-Message-State: AOJu0YwWPJlqVpMPy2zeY9i9Y2bfxvFTWGOd+Q1Zv6C7Ip9nMHSabjFJ
	UUwlqnIgMV4XmfvHkC6yIwiJKD9Y1+5UEah3gA0093gQco1mt0uD5qm4Z7D1GHoE1ZKlFBuHgwv
	a49IMcnZFokTl/lirIddNIEQt3U1JDWkI4E3+j+IHo+z+w4kCHIerWkgiqQGUsK6MhdUDNd0v8u
	i5
X-Gm-Gg: AY/fxX7PhfFEpDQPawg/GNxmH/jVcA+8Svs2YPiO0d0v/4gut/ucpl9ppKpRqzA1isX
	mqBejnJnXFub8U+E2LFp0kpTKFe/5T9nOayTR0DNBRSmUtyIYJXiAd3FwwBTtFr7wL8Tk5ZraDY
	BRflwQHQQb1hmeqOqnzYCfKtY1I3sZyJ31LLvk4ZYi4ihDmOiKoq+2rdDPkU8KEylWmr7u86liq
	Zz5iIGIyzkc6PzJ1F+TmmT5rNa1BD+OV3pNa2eMRREgpxs07atR9QTPDI2cetD1F2c1dA9EWNAy
	wGM6amkmq7bHK83wNxHdKRK6Fj7RBQ//zeJHEiUUgwBILN8D1eShgjM1+uVSrbfx6Re6jC36mWh
	/4CeXPAhtDT103CE=
X-Received: by 2002:a05:6102:3e1b:b0:5df:c33d:6e3f with SMTP id ada2fe7eead31-5ecb1eae0c9mr3156999137.13.1767907088891;
        Thu, 08 Jan 2026 13:18:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrFEWux3oAL8sPgl8CrCD/X6cmoXF0fYkFPC+I12DUKPNl0o48fSIl672itmPsVsuxbfr0jg==
X-Received: by 2002:a05:6102:3e1b:b0:5df:c33d:6e3f with SMTP id ada2fe7eead31-5ecb1eae0c9mr3156987137.13.1767907088454;
        Thu, 08 Jan 2026 13:18:08 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:07 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:30 -0500
Subject: [PATCH 12/27] clk: nuvoton: ma35d1-divider: convert from
 divider_round_rate() to divider_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-12-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ScZkcyRUl2Y7Rb30HqkG8nPcPdnar+WJX8LbQ/gUKqg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Lbf3OB6+cyD27nlncs8X1045u/rkfl/Sq8S958n6
 9dW2eUd7ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiz6IY/he0Ke4yieY9asQd
 yLzgsuDcEoHf86+7hV3sP271e3Ob7F5Ght6Fa3cL1+ja33fKlyjTm1qfeim7xSU/c2ngzT4h5+O
 3eAE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l8JG0KQHJTuOFQFajNKA8maFMdIRQQdJSw9gnriwyHY_1767907089
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131812_924369_568E5481 
X-CRM114-Status: GOOD (  13.50  )
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

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 215f8aa095a1 ("clk: nuvoton: ma35d1-divider: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Jacky Huang <ychuang3@nuvoton.com>
To: Shan-Chun Hung <schung@nuvoton.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e39f53d5bf4578c628d34b05233c8e8da317c4d4..e992e7c30341977bd4baaad8b24e17039252f90c 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -44,11 +44,8 @@ static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
 {
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       dclk->table, dclk->width,
-				       CLK_DIVIDER_ROUND_CLOSEST);
-
-	return 0;
+	return divider_determine_rate(hw, req, dclk->table, dclk->width,
+				      CLK_DIVIDER_ROUND_CLOSEST);
 }
 
 static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)

-- 
2.52.0


