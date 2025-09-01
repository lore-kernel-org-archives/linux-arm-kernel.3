Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38A5CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIaHO+TwV8qrQZtm48sgkMY1UhviMFuJCLf3J1fvy7k=; b=p95IMVM6MLKD5OxGNM9M7by3IH
	W/Ybu4Qzw4laA2NwLvCBJ1tYddLG7tCZogy2BaR3drnhau7HZoyAvbWr4MxWQmNczp6LwH94o3Q90
	DGGvrtsMcsFA+MnYTmAxPKMMI8UIqLJFc+lrPDZ3atjIUSoqdb5rX8d3SxcUN5eYavUyDcV9agOR3
	6KRStn48AqtW9oPE9J9MKm0CB2mGwDCNdlpgr+sMGUQiswVOe5Ve3wkdR8lgz/VnVzhP24cJEsKo3
	ibG3MjtwV6Q2G4QCzA6yLP/g/Y2Yf+i9N/7JtqLdp6KsG3ApWUKxF5i2k5ecOe862BJ7kEzoMWabh
	J6ry7YJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDi7-0000000EFh5-3KkT;
	Mon, 01 Sep 2025 23:13:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut80o-0000000DPNa-0O4c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 17:08:11 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55f6bdcc195so2447847e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746488; x=1757351288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIaHO+TwV8qrQZtm48sgkMY1UhviMFuJCLf3J1fvy7k=;
        b=bi20LmfjxsRThTtFw+9wHvxP4XjniN0BGjpfnyHHvNKlOaVWufgO54y8NWcq4ucd7/
         7pQgWAh4cL7ulhVfliyjXgAR/j+uxYHMDaboTM6HO0XoLtcp3/g9yhOqEeYH/wJhWKwN
         pmlwzsiTY5sE487dZo78h40XWjkq4iNBwlse+LW05GpzFjz1YtrEwpI5ny45GiKL389m
         WZ2jfG2jbqXxoMJERkkXN3SiIFcEO8JK6ytM6mzYeBbyBybtSP5I+jn9lib10yhwaB7C
         tjTovC1cQnuzspEsfsRRb26NDzcdsSmAlSWeRdiQPWsteI3NNf6dYErOeuNLiYBvepI9
         zpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746488; x=1757351288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIaHO+TwV8qrQZtm48sgkMY1UhviMFuJCLf3J1fvy7k=;
        b=eb3YRncCOQ5yTkLgqGLIbHU9HO6U2LmfzCiJ7lfNDBEypgx9cxg7fAPZYbu1RLKiPF
         3XCTCkibX/7hXrcXglBQvtrwGVX2AulUA6ryAKxaIQJRSde9abCGxL30wNE1+igj0eoI
         l6IW0ZTzNKwkmk6mT1gi62g79IYE6Td/PNr+WftozeqBV2XMp38sFOSasm0LYG6TYJe6
         Fs566aY2HNVdLk+UwclI9dyUhDbJ6s4GffYlyZJ6W+aETw9TpXPL619V/Q4gjOQHpid9
         I2JIqo5ZPERdKNMIsqdcGpXgL54gI4AwLBP0KuT3yLLgXCJWHJyAMlBDdcr2cXYz74ar
         OFqg==
X-Forwarded-Encrypted: i=1; AJvYcCVh4Z0rLssfk5ZeYRJxDzYBZZesWUsWAGBASnZQMFyfJwCIcXTMyAA20I+4mkoRl12VVhvBvl4ezvFrciyvMLyR@lists.infradead.org
X-Gm-Message-State: AOJu0YyumKGS4X2nPsqbAmHPL0KbTpaw4NriEDnCCKW32+O1mARUZNpO
	ACtxcueshwPfWZO7BrBb/10eqkzixEhmfFtCAPGYseqYSSvfPqQJa7Pa
X-Gm-Gg: ASbGncvfLL26vw15AvSgjPvYgnn76zmFrW4DaH3s2YoC9kOIex3HM3kllgOPLOqJFWt
	xxRoJ304DK/xBbxqyeIAY7KfaShzG/J0OWOszdO4P3574o+hpFjMX408GqmS01b3PPHInifbIF3
	wjMX+s40YhdtVT5SwfINnYpv6S/JZv9qg8g5jC1GfIptCbChCwyisEkbGCG7DQAqDceyies/VQH
	IN0ipteg+LqgXv7xlDQH7kT2fL5mBv+bTXqbuN0NQAC+VLHZojlYofL/Kk7geLpZt90rcSL+CBH
	lODYH1pAgnFPRswPwFABK+J/fbt3neYHNXeRcgXrxFTarah1xM0AVa61U/4WSHOExdyqjEI99PE
	vXFQTwIcgZ05SI8YPoOhq+GIYeR27Cf97Wgs=
X-Google-Smtp-Source: AGHT+IHhwvId2J9pf7PVG2bGH41WlSGZXM5dvCtIJzYFDqjIQLhxbskjQn0gIORP7TnwsHy0EeM/aQ==
X-Received: by 2002:a05:6512:660e:b0:55f:49f8:3f98 with SMTP id 2adb3069b0e04-55f7092e871mr2218688e87.16.1756746488208;
        Mon, 01 Sep 2025 10:08:08 -0700 (PDT)
Received: from tablet.my.domain ([2a00:f44:892:8a37:6b0:21e7:549b:225b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f7abf7abesm1137666e87.55.2025.09.01.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 10:08:07 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Sep 2025 19:07:10 +0200
Subject: [PATCH RESEND v6 4/9] clk: bcm: kona: Make kona_peri_clk_ops const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-kona-bus-clock-v6-4-c3ac8215bd4d@gmail.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
In-Reply-To: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=ShWVHtfbSvKSp1Wzkzektxra6NA/4Icui6bqGQequak=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBotdLJj+erti+mA0wQFFErI2hqrVeFvJTnwlybj
 Z6T74PABM2JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaLXSyQAKCRCzu/ihE6BR
 aNNND/94vKJ73PSNDIrUkl9y6WJsjiijRS5IwyExi9xi/7Q9K2ZbazCdzkUGd5uOjZAy6Jc4eVJ
 k7Na9poxZ3ZaGLT0tDJUASoIiog9ZKoNZX731DvRmg1aIa8xIoUaRRztg/8+gmCcih1goKxMmF9
 3QiNChCQlmpGpw/FQ1OvyLGPT1xwVvgUipFJPelxrjaMi7E+jqHcXmriyfbaA6e9NYPvl7h+lVo
 aWA6SDdWOUWKID7jF1fPwn8+woYfoZY/f1qzpMTKgBLznchUTTmk5nLYQ819sLfOim2ak9QwVk6
 Ss03RTwFONIZ2kZCeJ6WmJfV43BCmqfWeozc26VR4tjKu1zxgHxcNargMuc5oR5ycXdIyImP90q
 v6PsbFIVYukBAkrA2f7PI0EmEoHVAtsMWqBH7noFmpw1dnLKglv5WkmfUuUal/m1K2rfuLUplZ5
 5rZzxvxCKQxBXmnzznRI6k5sVF0CTG1FyadpNOp7MtVzjvsxsvtpcuNhnCx5BYVsCqRKSl4h+Eb
 7ilD/wXreHgpkrEqoYN0JbUyDhAcDow041gnOqhaBAJJQ14K6qX/Md5s7CDnNu7x/ALYgwwOu3k
 aECX9VhsOInJRpyMqdPJsrN7ViEJLmoQuCtWxKiwArdzcidoiXbfSIhTlCpxToG1utWnCTAEL9s
 AilSZzVC8Scz80g==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100810_138369_469FA197 
X-CRM114-Status: GOOD (  15.46  )
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

Fix a warning raised by checkpatch about non-const clk_ops by making the
relevant struct const.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Add this commit
---
 drivers/clk/bcm/clk-kona.c | 2 +-
 drivers/clk/bcm/clk-kona.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 0171e6b2bfcad51a91adc15f41405aeeb351c260..2641eaa4ca52c2724aa1dc9b4bdcbee5bcac95e4 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -1154,7 +1154,7 @@ static int kona_peri_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-struct clk_ops kona_peri_clk_ops = {
+const struct clk_ops kona_peri_clk_ops = {
 	.enable = kona_peri_clk_enable,
 	.disable = kona_peri_clk_disable,
 	.is_enabled = kona_peri_clk_is_enabled,
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index d7cae437333c83e05b2960ba8d51e718480e6155..7064ce316981ef8f32cf20cd4cf674e5f0169101 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -487,7 +487,7 @@ struct ccu_data {
 
 /* Exported globals */
 
-extern struct clk_ops kona_peri_clk_ops;
+extern const struct clk_ops kona_peri_clk_ops;
 
 /* Externally visible functions */
 

-- 
2.51.0


