Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDB9EA3F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMfztC2Kl9bZJ/11xcUAkYHo13BsJ5PSJi+vhPNPnC0=; b=FByBBBXSnFnC12Fm5Z+Qz7ggyf
	uthkN2p3R6tY/2UjALDu/lWjtGke5NRcE7sJ7Tz6qeMWPXokrntSs5dKYI00NSVlZtczewSyBCVZ5
	NPs5gi6Z5jzX/MxS89IhT09ECrkpBGofJDnfPPHyNMiPHI1MXhCMwdANzWWpSz8HiS0RvLwmhr2RL
	HtEOFVFkFuK4eNk59pxdyKE3/lKILSEPBVkaVdOrRreLJhl4HTE77de+bkD7f79cWbogGKnbh2abD
	GpyXK8d1vrQR/MY9din/0DnQP5BSUKGBDgupS8MJOEtia1BI2x6Xw66AgfAG/ZqVQwmR16pEJIDvB
	tO/sQpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUg-0000000GU52-3oDw;
	Tue, 10 Feb 2026 05:41:02 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUb-0000000GU1C-3P1B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:41:01 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8c7146b0854so549251185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 21:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702056; x=1771306856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMfztC2Kl9bZJ/11xcUAkYHo13BsJ5PSJi+vhPNPnC0=;
        b=Op9KR3AafXnkFMFcK/uWTspcjXQr9f54i5owLIBN9Wb9WdGx1cGDZVEUbasR7ACWN9
         oaMGiiFbfKgCHo6+UPA9QbZu0bnyJjYOTEG2ttOgMeIVfMKbUTUIbrOJVcGJl4HoeulE
         VVj6OkomZv9fn1Ch25+7JrmoFQoMDV/aezS/KgvjwVm6b5W0z6yAUyc+k/Xqa1H2sQlP
         3Or8IX/VUcTCGgda1FUPlWNeWN53DiNKyCiyIdUERkEvh5tcC5TQav15EuAJHVxmJNYL
         MUqFkj47hUtWP1aBAq4XYowM7uEoIh4leAHZnDU9zzqlou1nYLCqPNdQFdDka8TvpWQm
         veyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702056; x=1771306856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yMfztC2Kl9bZJ/11xcUAkYHo13BsJ5PSJi+vhPNPnC0=;
        b=kB/7sDt6KdVC2xbpwa7tyZy+S/d7RO2/JS/Qyv0CGLPQAfZP3FhA2nqWclKcQb8S54
         zUE8ss/mitKFVUlWRBkrc7DlHniwXArC4GukkyJBooux9WI/qPIIWHSsKReDKN7FeXZx
         W1iO6wL/MQgzbPSGgmW7Cp4Gd7CbWa178zSUIRKiRR4+5wO31gM2PUshRg1BG0GZ1H4G
         qo+G6oKb7zcd/0wuKAxcV9iuqyPdcFZCwvX7h+pUNKM8mdyCPrF+QiLOJ8F3bEULqQdS
         76reIdI+m3nClyNHDPc5qeeKwDnPKkzf1/H1YLh7oppzc/SmMOkX9JEAPHC0jKw9somP
         Et5A==
X-Forwarded-Encrypted: i=1; AJvYcCVDiFZrxv4TWLdfVYUiOsQp1mq6t4WbB9pVk9V05a1eZKvhXKUK7ZRrqIpkHMVeJlm7Jj8MjFSUuL0CPXiUjbhS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwy4v5U3KATszMGlg9rXrkrhPdp52/BBxE70X4W7/S63gzhit1
	hqNU1b+eQrM9VMozK65LLKRYehnG0rTvc8YgMxSod7quw+rYoOkJg/bD
X-Gm-Gg: AZuq6aKprIo8PPtgi7A0G94SUAeEvptiIaZEAxFKDwm1RZU96zt+PFkBwBAfdHI3CKn
	5iJt9306WVvxQa+qn7h/gGHa+S7bRX7hNhIsMd0bKJuKOZg/1mHXwOuMh38gSryL7INOiU4QWx9
	TBM8zGO1UP+J2nPlg0juMj7DCAs07noTqLk52qJKFYD1KYR53t4zVjqefJgZxgCEdQNPcVFv9ZT
	gK61t77pQePFszpOMzXEgeXyC+LEjs0YGgFe1VuocXcuaab+VS91y6kzadJ8kxFdAUF6wKHbLkd
	FzgPHx8mrbOAaROxAEJlpLv/8I8gDTCr74lrYlenH0kU9mpp8KSJAJrflSqIII+5j9GrGWnij6n
	TYMhbsbuybzWwqdnMv0Y9EIp86wYy/Azazd1j0YECvLuKEtsl1hlaBgwLfKGbdrZK+Hwkek2vj1
	/2DegLKibQAmOK5NOCGIEGE2v8e/5OAbeD03kTzvtcARdMi6vjCbkdH28NIZ0zeUVu/h7FBk+Yy
	w==
X-Received: by 2002:a05:620a:1a1f:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cb1f74d3bemr112907085a.43.1770702056479;
        Mon, 09 Feb 2026 21:40:56 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:55 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 3/5] clk: mediatek: Fix MT8196 topckgen orphan clock
Date: Mon,  9 Feb 2026 23:37:03 -0600
Message-ID: <20260210053708.17239-3-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_214100_284276_72EBEEC7 
X-CRM114-Status: GOOD (  13.25  )
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

There is a clock with its name spelled incorrecly, so when a child tries
to associate itself to a parent, there isn't a parent.  Fixing the name
restores the proper parent-child relations of this clocks and eliminates
the orphaned clock.

Fixes: 895ab0134d64 ("clk: mediatek: Add MT8196 topckgen clock support")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-topckgen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen.c b/drivers/clk/mediatek/clk-mt8196-topckgen.c
index 6ace11ef6b69..2482597b9b7a 100644
--- a/drivers/clk/mediatek/clk-mt8196-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8196-topckgen.c
@@ -324,7 +324,7 @@ static const char * const emi_parents[] = {
 	"mainpll_d5_d8",
 	"mainpll_d5_d4",
 	"mainpll_d4_d4",
-	"emipll1_ck"
+	"emipll"
 };
 
 static const char * const ap2conn_host_parents[] = {
-- 
2.51.0


