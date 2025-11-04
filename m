Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382A6CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XO+PI+vctgydxy3u8Ax9wXF6KiNkHmEcDhtdnRtl9xw=; b=1qTxhHIOPtuSW7dVAvEl4wAuxi
	RhSAS1vQj2980+jDLKa6kC82DzoMbtiPaRVnCYal1ZAYz92PWEnmqs4spjkAxPsUaVlcF+Iv1G6iR
	r1r1r4F3VqpfSX0o4HVOMaBmqtd4xLJpYgyyLwUYj/2WWDbK3LglxiMJyTdw7SaylXfZSGYLX05+m
	upkN+6DmqUQQUIGYprAPEwif/4mA/yaW8YAZS4WIKcCNHLFfy07O5LkfDF4WC7Cdd471nPePXGRPz
	nzlgk7bOQUtI6GUU/LjD4XcMpfcS8ZZ0ludyCXFxeM9X+cI9S9LMgWUrSyAJnSuErCBfUxDPToBxC
	2M8GmixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUW-0000000C16x-13Mq;
	Tue, 04 Nov 2025 14:58:36 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUT-0000000C12N-2igs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:58:34 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b6d3effe106so886721466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268312; x=1762873112; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XO+PI+vctgydxy3u8Ax9wXF6KiNkHmEcDhtdnRtl9xw=;
        b=iLvtigscSJ6AdqLXyU+gUzLM89p1ePyqXNG5wEswPsv1wlWeuREi1Clkmi/v9fAgm/
         nQRLC+13rN+sMRR8hAAe2k7HRmfOetM7AyhdRlU8Bp8jcFaUYQexSaEW6cjaBqAQrRpm
         i7XN6wfaMprkdIJehnTeEzsd/n7totpmjS9yeySFll8pwKFZnXyipq+WxiKrK2UNYFIL
         XzaF4xqITavy5eTl7y1qsUPNBpA+LRQN425+4OOhf2PvKJBQN5eFgjQUCD305Bd+jtGB
         ry4946ufaK4oCQKbYGZJgqWKlogzw5irvJs3/l0fLjzZ2/aiDB6CFJYiKZ5vgwK+/9mx
         cSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268312; x=1762873112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO+PI+vctgydxy3u8Ax9wXF6KiNkHmEcDhtdnRtl9xw=;
        b=AOptawddKUu8CYHb/tt8HGsiL60D5PVwi/8/YFfPbWOnI6/OVL9MSJEBObbdstkxEI
         Dv/M/YklvAHfs2ubt6rvn3cjdnS844xoYZHFjVDOTin0Ey4YcdYKO2ZESQy6VTb6pAPA
         kOJzbY4/kPKPPh6y8wZKmNbR5TFL3cyjGQjiPM1wxwh1QljNWlXPALcms9X+ewApxBBz
         WfOOUmOkr3eIiuyEWDpQezsyrMV89zm4Tb8phWoj9eZL8FWzAvIl/F3EY7dPimPbwyZ7
         Bn0h83xZ9MrbrdBUF0pmNGoNWH1wAc81h6ZneiAAVkHR2vTXDAQt9ElW79BAXXJDidFe
         vYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRiGJ5Z+utqSXCbl0CZngaRK+yslS/ffpKtSR3bL46u58p1l+HRx8UNm8yIn5RCrrJwPSVTsys66aTq4DMWY0j@lists.infradead.org
X-Gm-Message-State: AOJu0YxYAszBMYmUa4bsA04sz9V9rnlfdBy/CJZRMQr5bkzqIf8M7pKM
	p7bfVFR4emVGUCP2FWT9dojBKov9aDT/t/IeORGOKG/xGpTRDdC2Pa8+
X-Gm-Gg: ASbGncuvNHf43BqwIx/udEyvTi8ez/rAiBblpgA8kgqWoB2SrQ1gCIngQrum927s2vy
	mcH6weI/aibdy1uEorYzNXF5h/qJkeXLIYdu/NC42dYvzmy9zmU/9Y/M7CuR1TneL8mzvCQFugL
	1vgbunQZfu9bm2dwf11OREREtzrnfKviJMYsDXrpKOCCHJkEAdP60c1aUGyT70eqvbYKlw4vzYy
	/lQ3fu72B6t71Yfo5coPGcqHDZ2nePKJ8itH/sc3NQ19NTXq+l9ZCBl/9AHppxI1/YQQJdun4xh
	AZxGk1jfuqqyue75lnaB2R61cQwnbFELO6drwq5Od8q+8ZwsDU4Cq7cRzUWPLqTklMLXL+0S26c
	4SRDJkB6taYcrViB12me1KYyCzLzU/C7eDLiq9Ef0i2QU640A6I5g1PSq1JKNaQaPN/bF0BOGUh
	cbBLm0Vsg5WDodsO2X8z/SCJez6hCSOk3B9OyVJFWnWBR3HLI=
X-Google-Smtp-Source: AGHT+IHQM+ae/PtrcBYu/XEl+3c6meEt5NSkTaNxXmye33gFO7J/8CNzTF6Yj9O7hl9jP+R+gadKLQ==
X-Received: by 2002:a17:907:3d52:b0:b3b:4e6:46e6 with SMTP id a640c23a62f3a-b70700baa25mr1718403766b.1.1762268311405;
        Tue, 04 Nov 2025 06:58:31 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:31 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:22 +0100
Subject: [PATCH RESEND v7 4/7] clk: bcm: kona: Make kona_peri_clk_ops const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kona-bus-clock-v7-4-071002062659@gmail.com>
References: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
In-Reply-To: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
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
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=3S3vLJQnHmvWilF8Wd90CB2vFImWZrThbfrv7SlfrKc=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSORxgQzf/ZL/gp2Ma8qyDv3uCNpyjt/zNPv
 EmKyvUGI4mJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjgAKCRCzu/ihE6BR
 aJ5zD/sHarUnmHEx9mOpGgkQj6JThv5bsoxJTyL7m9Lh425mb077Jhlo6Z/tsFSTtFt4iU6rRJd
 oZkGeqMN3R0V105KQrHLJU64qMwduP1y56Sj+Pw6GFRM+KEp6vGieizMW7Xx4iED3eIiRwhk7u6
 Q81J2e+mc3RJdm6uan1Zs7xq/4zZ3Svq+pnRbVRiBMVMKzMgEK7RfrxJctPIleJE2t7aFRrl/US
 zPEo+FghW5tLw/2lj4CQ71XlyMIo9ZcCDxvb4gH6qD542pBLb/omA275yOiyEYe/ORBY4i3WhLd
 G92AWkVJXxZ1E2/FCj7gu0l3NhfHEx4GO2k8dJu43Q/UkjGHfveQ9TcpJbIaOTRlPTBScfEKuFB
 bzslyURLmIOcK9/sjyQlVJgwj5StXbiqnJls/XI67aV43aPeC3VUTUzb9VRSQWvIh7dsu4faY5T
 3zgR+C8jVP8kUl4HY/mbCdRKFR5iEDeYIfe8+Migw3tVHBwQJ5L/hx5mQhv0Vm2sn5sy3KbOzyq
 xv4ghk6kB6IzmsiG8rJBpJpD/ZPWsBBwdq0g2u4sKc0tJsWP2CrhaO23jX8oUMSoPtpaDWhVaP6
 aSm01IaRqIYoscGsb3zk7Aqf4U7nPCO+YULFMQEdaxVa3i0peasQR3HVNbOORb01qog9otfXX3r
 IOsVFFcJT5jIelg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_065833_717882_028E88E8 
X-CRM114-Status: GOOD (  14.79  )
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

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Add this commit
---
 drivers/clk/bcm/clk-kona.c | 2 +-
 drivers/clk/bcm/clk-kona.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 0171e6b2bfca..2641eaa4ca52 100644
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
index d7cae437333c..7064ce316981 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -487,7 +487,7 @@ struct ccu_data {
 
 /* Exported globals */
 
-extern struct clk_ops kona_peri_clk_ops;
+extern const struct clk_ops kona_peri_clk_ops;
 
 /* Externally visible functions */
 

-- 
2.51.1


