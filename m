Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857DDC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 00:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kXFkUUSERusmiOZxFKcpCM04OYHSm47q3Lv6FIZm0GU=; b=xyBNnLQ+IUveMqZs577wLM9ApD
	PvYah9VaxLxXfDnSXpX0HbwLihvIj/+IJ23Sp//+RlZxXNs/wEwXxV4H1n1YEZ0j0xtcNtR1kyBbs
	gCjc/mEOwGD+pWbN0p0oEZNYx0UPwJpSyPNDFAgYN/WO1JurtZG+o0f3Ix5cstqbzpC3OEeuoQ37c
	qZSvYcXX+g5fJ96XDaTrsUuxmXBF2z6JIJtGsXcXEEXLkQHQ64LQ6z+CKWsp6/L0dQnmBo6uStY6I
	6hQWIqhDX/Hs6DdggJXYdtrH+hPoGDdU70h//qfIb8flxATkTSA+Bzioo4CAsl9BHnx0UeNFoF+yY
	5hntQGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BFP-00000000Ppp-1YxH;
	Sat, 12 Sep 2026 00:05:35 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BFM-00000000Pp3-40L9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 00:05:33 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-5309d6188e1so5463161cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 17:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789171532; x=1789776332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXFkUUSERusmiOZxFKcpCM04OYHSm47q3Lv6FIZm0GU=;
        b=n0+T61foUFhNaEhFjbEEZzpO0ZVdRp2OLMIgHV8Ho0cSvRAaFfp4O6f0FJqxNlRRKK
         mged4PaQCdt7iQmfs6qajXvA77FO0Z4pjjginSiZ5HUobjHB+z9VS5K2weoMCQSTSxJg
         qWfhgmP2QQQsl67D7/LWGlzAu59OSFvP12+xmzKLusDsMxsJv2eY3LTmYFFqIw2KsdPK
         PsXU0aFxAjZ5Z/uLvO+tgkePLx3YTjs7r6F4BULdyzIyGYOKRQyiIkzW6AjlwuXgmKcp
         LwHx7w9kIEMOfa7f2P7/TfsiP77fNvTBi6mOtWqXz1qnzN8mg9hLasi85vI2rbY4QHtG
         m9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171532; x=1789776332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXFkUUSERusmiOZxFKcpCM04OYHSm47q3Lv6FIZm0GU=;
        b=NCp1ljjGlJMdPgRH+at32jGnUZAudQUMDSU+2RJfyWGVpxTvREddeQPs8+NBow46XO
         /GLtxTo2LZ5HL/n/Sc05b0h+tnnowfGI2E7/8+Ey6D/hpMhO5N3/JzBuAZQr25TdNxmW
         WvnEDFZVNBKwqjh0I8gRCeTqUnvcm3q4a8Z39TXgh0h+zJXCO23PaKu4neDv5u+kPcjY
         U3RMyZr9ijaTtHxovgRvRQIcrZWyv81+ZkqvIGKPM1efv8hLdjfYmMSUJPgwDa8jlvr8
         vrz0ZNwypy929M3BZEQ3hQ5Elb/PWNq3BFPgqYWTaSQI34cn1BW4So1HeN65oCkOt0Ar
         Ly/g==
X-Forwarded-Encrypted: i=1; AKwUvBz5NL+hHBV+CYvfT+pbYHV4D69NtgJXADhIoxnRDk9Yg6u5LYu4hk4wUW9OYypc1l1rl0u8czlDnVZHS13yxw8K@lists.infradead.org
X-Gm-Message-State: AFuF++lsUxjg7wduqhiLYFIEuLgeIpCjPKz1CK0kAMp+0ImYPqSXXu85
	BnPUytNNfC4Id7q53vIvzCkxfFt/aQy5hJSVbbrWWNXcF3fUiQGEZbuV
X-Gm-Gg: AYBFou1WgzfRdis4Ed1UscoafMWmlmShP1J3MAGg3lAJfMbKpdanjn8VTXFXjMKB2kR
	JBkeyv5YvWNIJfbTM+KbEaRHqMFy6Z9PKsMIxtVTdB+D+vVhrr9/rdYR9I9iwe7P9ZDVYgBsDIF
	NtcPga+3MMtKaVWVwilM9U57jhZiZRcxjTVNPJoOotQhGnG6BWw6rKEcGfFqNVAl6mV77wAd5C8
	fI/RetugRKOpJiYO21MkR/g/LfOS9+s5ws3AmN94rEVMj0ml5j+Rl0MLyKdVlThKOhZDrJKRkMU
	8YAN8ngX+3/+TVv8N7QgJ149y839nEp6mVCO//K+9HMPi2veWedIGr8t5Ll+VFuXa4aRVIGdwiB
	0xY5lrrD2MDENgr8YIEIz/WDai+KwFOmI+ZM5r0q/GgaWlN+9v28BTGAP6s7SC3RKil5bgfHiyb
	bpXSFDi+BLxwlDQQ6P+jGhPv8molqIC9BZT4Y/OSb7g8i8Ck1b/zIkIdUMdN5ghtf6kTaijmemc
	AgP7M4GxNQLwmQK3fQE9zTofZalPZfoQJZeTc6TaXpWXQzMHbRmp1JzkZgOugIR+2h+qx8cJBH6
	9hL0/dwc+sMZonHKk+sjwRZIOPC0tJHM5LoOdGj6kE42Il54
X-Received: by 2002:a05:622a:4d8d:b0:530:430e:8126 with SMTP id d75a77b69052e-530c876fcfemr131514161cf.47.1789171530137;
        Fri, 11 Sep 2026 17:05:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a239sm32910836d6.26.2026.09.11.17.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:05:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] clk: actions: owl-pll: cast delay to unsigned long for udelay()
Date: Fri, 11 Sep 2026 17:05:27 -0700
Message-ID: <20260912000527.231245-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_170532_990496_293EC929 
X-CRM114-Status: GOOD (  10.99  )
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

The 'delay' field in struct owl_pll_hw is u8, but udelay() internally
compares its argument against MAX_UDELAY_MS * 1000 (2000). Since a u8
can never exceed 255, the compiler warns of a tautological comparison
that is always false:

  drivers/clk/actions/owl-pll.c:189:2: error: result of comparison of
  constant 2000 with expression of type 'u8' is always false

Cast the delay value to unsigned long to widen the type and silence the
W=1 warning without changing behavior.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix uelay typo. mention W=1.
 drivers/clk/actions/owl-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/actions/owl-pll.c b/drivers/clk/actions/owl-pll.c
index 869690b79cc1..5e30ce35f2f5 100644
--- a/drivers/clk/actions/owl-pll.c
+++ b/drivers/clk/actions/owl-pll.c
@@ -186,7 +186,7 @@ static int owl_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	regmap_write(common->regmap, pll_hw->reg, reg);
 
-	udelay(pll_hw->delay);
+	udelay((unsigned long)pll_hw->delay);
 
 	return 0;
 }
-- 
2.55.0


