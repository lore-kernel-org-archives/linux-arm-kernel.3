Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B665BC53209
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLV7Kh0UK364ekQydmUokZhdiy99pnn6pB+Tv4eP+3c=; b=V7jFAj/OAfUw1jzNe9Po5lyRiZ
	pSxJPtkzpuJuPxB0zZKzbmrcmfIy0I0bJ2ziN1/8S4qocAbvfejhqQJz19pPOeHYHCD0RIoxn7Ldp
	UX8iX8tnAEmoNnShM2a8iLOfeqH7T38NIwX0H9uWbd+0Hw5eOZVHyNFQFHo2rmovpUQUSZhZKjOY+
	kUlp3zC03j0gK2jM/PDkgpv2SBDauTNo6BLfV8Y5AHKxQrp7MrkR85agTWs7rFGjdvx6VLinaY9OS
	/K9nD/4/sTlZlGSOt+wvvmSu2zb2DakCydZo33T4DwABSjJeyE8nWjF3fDGbD2HfYfDCCWFreptRG
	KhKlKxFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpQ-0000000FuEx-3WFx;
	Fri, 24 Jul 2026 09:04:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpK-0000000Fu9Z-3aLO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:04:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f703a9d05so151492f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883857; x=1785488657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLV7Kh0UK364ekQydmUokZhdiy99pnn6pB+Tv4eP+3c=;
        b=iN4XSTvx4fief8x69hfzAvXiLSL1Qc/s+38g9XyiEmHqd4WOhnDNCk94BEtas9zmJs
         SeqmpLGKllqSECaM314K670uBAoCprQuSjP6eqCkHLxxIDUniTu3RktgoR64DGyXaGFN
         Elan+PIlEBgTUWcQ58LSqDemIS2MGWcxlMIi7JfoVO45FFMvHJcTGOxSaeudFt8/OSrG
         m9KASnIvNyG0rFFEKCzPXf9Kobyi9uytSMxnNNov+aJbFT2y0i1aNQwnPi2Zz0PYyMRl
         7Ll6VGABHDd6EqIsjqhy9x8chI6xYL1dcH3Hz9trQ0UjfGiM4mJZgZhg6XpiGbu41vSy
         yTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883857; x=1785488657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLV7Kh0UK364ekQydmUokZhdiy99pnn6pB+Tv4eP+3c=;
        b=BUWeDen1/h7kkUOmp3DlxvrkG9XbvCiar+ARPFiYTAvZB0KbRbTbFMKux6Nd9BHkvu
         bGMrRkxcw2D5StLGW35pKXYCahMI42hGtlInp+gC5KDbi0dIM7a/QD0mdtJLX9oup33e
         5Mk/fMtCJVxhxx6buRFbRhzE45QgmkkVto32j6aU/nSIv7UTRuvl7+nxQUoWNIfovQnk
         tLj1gEcOWSvc7Dy66nUjksvk+KASDDEXKP+0JbB/mm9tbEn0pRwHN/UtBIT3mswvz9nE
         u16Jl93OatwQXWSU6ouyfHm3tnS7MDGUZbqcAU2NweNYrgc2uMok8fmtsYeGMPEuR6Aq
         zKcg==
X-Gm-Message-State: AOJu0YyTVKw8QhGx+IDErxol6dsWfSxQEgV7kMSd4wkFKj3sL4K/S/Iz
	B3a14kRkDphSHOYV3PrEJWQn9sUmWLLV473SJ3IrO3UxUOS1sE4+Kh8wxXcinNhkXM4=
X-Gm-Gg: AR+sD10iDtxnqRg9ejw3kR+kQyLByL7/mhtGTIEXSu09OEWyi9VDOZvTIjFAGA08EJv
	RNSlZRNXchDVRHLM+YGdRllikKfGV5OnJyFWHHI3lCl9d11R0bsFe6iooIoXtmXQc9RLbHkIMXh
	/dl6x9301gCIWqkIBKs7w22BoUqrBe/Az3SEdxIEJ71FYN4OSfcGfndcW0b4xGlNlqE1T9Ceqsv
	n/wgyv2aP6zRo/mEnUTtu+8KDn66Ek/f5t22noPHb8wyBNjzBNbU1GTvnDnA2OGl7i8whEW91Aj
	/BkCkbB4ZiyqhGDT1Q8ClHWfe1nX1/V1Uovy8AtdQw1sS3fq2j52s9djiZ/W0SwOmnuaXJp3LSK
	88dxBZk6atcBEdzGsVUMBUH9SeJEpulSBIfl/DJdmFvNJay/fd8xGNX47nKz15epXimHWVXSlm8
	nc
X-Received: by 2002:a05:600c:3508:b0:495:5f00:9497 with SMTP id 5b1f17b1804b1-49573cd9427mr73102445e9.18.1784883856862;
        Fri, 24 Jul 2026 02:04:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957af6b10esm57168825e9.5.2026.07.24.02.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:54 +0200
Subject: [PATCH v2 3/7] clk: renesas: clean-up simple provider misuse of
 the consumer API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=i4qllS4+L+pREPH0T4wiXzxc5q4nTV6C2Q3lI6XF9y4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqAHjrBMlLbsRDUuljqrEYPOyeyYAPzg/SXk
 jNGwdlpTaaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqgAAKCRDm/A8cN/La
 hSkyD/4pUoLziZUxxkpmbPY/qvTAcrEdq7SBbVU6GpskFU5ov07moRfgR+6L+QnROKwYTiacIiV
 j1Id4mbcJS4lTGYyfhQHnpCpE6g4Ty5AOA5LGOh4j4/JBxdHL+gSrPGt14RoF6Yj4XQkhA1UHUu
 PUEYCZKL0dJtmaJtG+j9xQ1n8J5fLTJ4yYwDhVGPC0gFBub2VC55exg1nLw9H/BA9QuYfH/R6jB
 1gRBMy3ki4RKKZlrSF/HE+vSq17ymWXfrS3FSS34wfEJBVX61mFRwB0GHvC4MH3rUyoibQ+VXyT
 fxhDd8LpNOnsg4bjNSbln23x9I7vCg5gIqqxj3bytRpFG6vWz/hwCe241843XOXyP8UZXor57aU
 yCUv+ewWTn7vvtq/y0V8EFxe3K77GZ5obxj3nS1lws92lwHu5LoB7SmbeRYj3c8n2Cw4DJ4BP04
 aDLst1r0KfbFdesTIeiNVRM7Pj3uVdpGPq95OarAzPWMQ84Rw9b01YxXpPr4Qt0BO8crTXNH5bT
 9maeRb1sc1HL6+ksttwt1yZ9bpD0WzEbL1UOkKEbpdhQGM+2M9RzZzmlK0wbO4TnJ12TqHh5iWx
 gOM1ryGczqr/oYKu/yudM5d+TlB4vMwCZUy579E3zBPTZJJ6qG11DkD5DCSjYDdD8Ew2ujwzSo0
 pwxjz05NaJ3Z5Uw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_020418_989634_908C906D 
X-CRM114-Status: GOOD (  12.66  )
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

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 076f587dfd39..1da25e4fb4d7 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1014,7 +1014,7 @@ r9a06g032_div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	if (clk->index == R9A06G032_DIV_UART ||
 	    clk->index == R9A06G032_DIV_P2_PG) {
 		pr_devel("%s div uart hack!\n", __func__);
-		req->rate = clk_get_rate(hw->clk);
+		req->rate = clk_hw_get_rate(hw);
 		return 0;
 	}
 	req->rate = DIV_ROUND_UP(req->best_parent_rate, div);

-- 
2.47.3


