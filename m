Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E35BCC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 04:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbxk8jsiAzvQZpmw8X3BW7J7DhacWFvl1KbYwBAc0jg=; b=EBJJtSoUBgMuNPEDh5ReD1061N
	m6npCN2cWODbifzGXZN+BbSlUgrXiyM0Z2UhJKIN5Xv9VxERF6+br/v29JE1Efi8J01E7piUTx8iY
	wBHW1nkhqc54js3xxmSi/UwzI7vTESDulc82Z157olvyqYSPNhLbwBbOW8z+fkPf9+XpoUzTyMzBK
	kJdCAR8xqeJKUj7PgaMoNdYsUWuzCefEMtXI92ryiHoB+zU+0sfQegQrLQEkr/bUFaRUGAd4bqvR7
	LNywuusH0mRoCcM16JxTs3bQHq9Q205cePW3TY7vNJ1h0m4PLsb6fstIEUs42NkPricqVhyiOi3+T
	Ez874vjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYt9-00000001sWA-42jC;
	Fri, 16 Oct 2026 03:45:48 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYsz-00000001sH0-357d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:38 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-823e4047037so4571188a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122337; x=1792727137; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbxk8jsiAzvQZpmw8X3BW7J7DhacWFvl1KbYwBAc0jg=;
        b=jVF7I8cLcBZOtTRevnx0qPzn18R7prytcvdchK9Uy0CGvJkyT3lkwi6QVvxDnvCb66
         y9PzpBo1wffoNhKIe5115eLBTzTVEYBNBYy1JSWM2F94efboZ+za7ODxg/i2opSvhqBd
         8Q974+7ObNXt0oENzc103aNYasakywTl5j0QIWkBB1MpLq+TK3lsQDluuuHAb54MwFwR
         T03cwL2LxvLMhrt4cv0vsBniK3DlM++akchfaT68nK0PnO9hRnHPhTxvCfxKyWpzhfOK
         ZEFCRH8e08rwhpZaJrJxwsmcd5ktPbuUEia2wxqLTf+oEG7duXcDTkw91xqtuwfitW/h
         0eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122337; x=1792727137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbxk8jsiAzvQZpmw8X3BW7J7DhacWFvl1KbYwBAc0jg=;
        b=FnG457sr4/8aLaML9Ix4LKyQsjHQbEzv7/wcXHKichH8IF9LzPNeaaJqgJQXWw3RmO
         4oS/TvNh39RAd0UUFnbn83/W2PwQwhQ+ijVd1MiQam9UqLaaM/XBmXCtS9v5g/zTfYuv
         5vDg0mbJffbZejFaYz8DsnbJrIhusj1Grd3kylBIOT9iMNAOsk2gyqN67qHGCpDuCCll
         oiVufSEHaNwwTw9S5jV1WtS8qpn+q576AZR2HKfxMiLlZ4ssXL1pOIBC6baebAsNJVzG
         YpH2xwdZ6dIfU9ywPalRS6E/aw9PInto/gGgpz53a0LoWqiLovHcZ/rlx/Wicddaj2Aw
         4g0w==
X-Forwarded-Encrypted: i=1; AKwUvBzIwtAWvGqtsWRDv6aGXuu1imicz4qbwVazhEBE2HV9iOj0T4hkb4mW8C4UvaiLU2MvXn1JAHcXNsvfk2MCdWCF@lists.infradead.org
X-Gm-Message-State: AFq9FYKj0zncmjt9vz7I79Z7IUFVsGn3vY+8ujP8wNUDptS/0OvRGMoT
	WGTrO9myegq49WOCjzY8hYlnJyAu6+UGNb7I3kuRh5NuZuOfvm8GkDZn
X-Gm-Gg: AYBFou0KOc/wgPpwRmYTmrhjfEnKe+im6auKAiBbLVdAZK8o/9nOiDBITZIet/jTyx1
	z9osFpFSSTU+UMB7jvijWc8cY9ZplXXQQX8M8ZpY5rgSpkN2PQWd6pqRdNfLSjNRNvcOYMKUcPm
	vwjMcOg6ltHHEKesCp9lIDrt+iMJcshN2sHpaRU8kcR1tuiLOMUEwm5EdoBlEB7Ey7qkYYBvsR9
	ciIygE/4tMhnPHGYptkWvTwcLAcxknUFiXuVDB17PnpypLnkNteJhaj9nA+0FVL3pz9l2S09YvT
	6+kQAyd9Q7rDsYrQDWey2d+mlr03W4WHhX0TRAR6z3OuWL9y0lDbcSm08Zwz35TqV/BRNwg01cU
	zaoTf0ZUkUYduAjqsmtaXyV+hleG/wSLbjZ/f0uPNLzLD5gk4Fy188ZDaDoE4EQ/3bnAyfTw0do
	u0ySeV0fOnwbubcebUysOmTeqth9mv5tzhPyPXA/fp4JvvJznT1BNa3X11iMmRezEC8k2CecX6Z
	dOjqgNTO6cT/kmX/R2mVHnXAl2ezr1tVen9P5pB5mDQgpWvtYdrwFF20VOab5drSmYHhADidevi
	JlLmdIW1BtZMcrDNRzLM1Z/ph28fdroUTy9FR7NxaC3SNo7AxFWsZIthmIDLuZIUL1kWWV7in++
	ZQ02mmgKJufT5YeZ+u7/Ftg==
X-Received: by 2002:a05:6830:6a14:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-8309814bd65mr21830521a34.29.1792122336679;
        Thu, 15 Oct 2026 20:45:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:21 -0600
Subject: [PATCH v8 06/17] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-6-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_204537_802186_E56523B3 
X-CRM114-Status: GOOD (  15.39  )
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

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d71b980ababb..661ced4e07de 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1108,7 +1108,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


