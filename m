Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B5FD111B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 21:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/4tmB1crXrQeW2xb2p4HQOS59dYvDstelXee2aLIlks=; b=UsU0vQpCKR9kV9+F53yl5F6fWX
	Thk53fQD9novxkg0wVlJnPKLiY67fmSSxrpfP5zhBbTZMBRU67T3VasDtI5H92Ku3BJ5ywQFkmCOC
	f7g74bz/PcDuvTV9Wk49GjPFnXiwIoldrmFxhmRNKOtIjolsA9vgPp7YECIJM8kzadtUowivGwP8T
	AZrbYXw/lj9tshq91gnqH9GFWdF/GAoQbHn+X+HhfgOqfqh188iPLDbao7SgLnDBfqNynnBS+DN+C
	uGv1+trGIPw3L+B0EClemcmO4vgo4LwQDKL5fPqKZCATPtSbsoLZl6ClsHqfsN6KYSDIlA3nJmvzi
	JUEIIUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t84tm-0000000FDKS-2JKV;
	Mon, 04 Nov 2024 21:46:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84r3-0000000FCtA-3FJS;
	Mon, 04 Nov 2024 21:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/4tmB1crXrQeW2xb2p4HQOS59dYvDstelXee2aLIlks=; b=NcVkjO+XlpVfFsHODDo1D0stFq
	CxKDkYvnX/YwTeDRHzXFD1w9nRNVRlo8KjrhckKYhlLx/JsIkGhJEK2Rk1WXmG2WIL/ugTBd7H1nj
	8MhZVV5sRYuClMut4U3ui0Ge+3YL1lcU6XbQaUlx6bQf/Hm70SPret0lLoyHqtWhbBrlMsOStAyMq
	QKI95bRjotpZ5dFplLfG+eXN41K03G7bLgKj6JEzKf8Kwarb2Vj/WbT7OeJdPRDK7H9A5F8TqKdJ2
	LXQmF5dBGYUbGrndlqXOiGgSdgB4YreXDi3+4slRmYIxnVl1x76h7yMnc0qtgHjtduSObTzMt09VL
	HMnrczVg==;
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84r0-0000000BaJh-2E4f;
	Mon, 04 Nov 2024 21:43:20 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6cbe9914487so33311236d6.1;
        Mon, 04 Nov 2024 13:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730756594; x=1731361394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/4tmB1crXrQeW2xb2p4HQOS59dYvDstelXee2aLIlks=;
        b=RQYD7tJ1+VCrbQhuHxETdHT11bEXswcWrfkodlCufWg2sh3feebEamtKiABCVLmbFP
         reUTbr4bvMWgEXNrwnQ8Pqtj7lwIwQhsYlCQW8QVis2gq/4NNhWQ7HRVTov+gjRremlL
         N6qmPpY5U1LN7D5DcUG+K/fyylGBovZsRJiXQsTroM0SH3/YaswwutH9woydbT6Uce0m
         QrSdQ8sS0ie7Xi49qtN0pISG2ka/2Kn/LVv5xUl0kUnA/cW/Cwhtzd8/omEU2Ne2LM+W
         gfzUZ1sI3+241lW1EMyQ7S0yTox1+O22DmwWogmjJFtGOZVAjk95OeHZRgBqJkgzpRlP
         gbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730756594; x=1731361394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4tmB1crXrQeW2xb2p4HQOS59dYvDstelXee2aLIlks=;
        b=Zd0bQYEZTq2NmRoQDYtHmWLF+/3BFRE9YuBSgEuauoC3Z86CwXrgj0JwlG+cx+OUpE
         q6dIP8mmvGLuCUJGE5d+VSydUpJ1bcO+fPZIMHjzbGZ195m2b82KyhpwipSFIyOeXqM/
         b1QmbhObtGKXnDhfBtDy1uwfU0QJo6yJRXPxtbmRLlB2ZPjEdjoC2LlaLiipx+SNwnvg
         8Y+BOcn5Jm5FbsxMYhKXR4guq5qfDxxRQmna9nIQ5225XNagSvQS1YdgGldNpGlwhJJ4
         sjwaclXIHQdBEl+Q2pRH3QVqAzdy6FBODHGhABKn5f1bwlEF39DcB2JizLoHRnxV1LP+
         +zUw==
X-Forwarded-Encrypted: i=1; AJvYcCWIBG4youB9vZAA22Edmbu4dQNa8DoCJlm8fVCPq/kdnem8ud9tVnSxyHkOcww1tbAhl1ggwOc/ULVextD6Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoFw5/hGlb73rvB4ppD7XB6cSdtSmU7I/DwfVGLWv81PajdQR/
	JTpplYBKp7YuhzHJL77Mf2/zjXM3jf43p+l6FW2+6tp8+2YUdYDx
X-Google-Smtp-Source: AGHT+IHiD08rBdxTtb8aWm9tjEu6W9aqyM2twM5OiMs1ouAVCkDkPquU7pdY0W4uFRX0AKoynB85Ww==
X-Received: by 2002:a05:6214:3386:b0:6cb:fa1c:87da with SMTP id 6a1803df08f44-6d351b2083emr248567506d6.38.1730756593883;
        Mon, 04 Nov 2024 13:43:13 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35415b1edsm52553916d6.75.2024.11.04.13.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:43:13 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	andi.shyti@kernel.org,
	wsa@kernel.org,
	manabian@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 1/3] i2c: lpc2k: Add check for clk_enable()
Date: Mon,  4 Nov 2024 21:43:08 +0000
Message-Id: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_214318_867948_4BCCB23D 
X-CRM114-Status: GOOD (  11.13  )
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

Add check for the return value of clk_enable() in order to catch the
potential exception.

Fixes: 3f9c37a0c9a5 ("i2c: lpc2k: add driver")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/i2c/busses/i2c-lpc2k.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 9fb33cbf7419..ea9831f34cd6 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -442,8 +442,14 @@ static int i2c_lpc2k_suspend(struct device *dev)
 static int i2c_lpc2k_resume(struct device *dev)
 {
 	struct lpc2k_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
 
-	clk_enable(i2c->clk);
 	i2c_lpc2k_reset(i2c);
 
 	return 0;
-- 
2.25.1


