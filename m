Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC78CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HQIkf5SvJGerJpzJyK7LEUA5xTlZO86ZcJ/z+85FafM=; b=nurE8KsB6PJctwOVwk1SA3Xaa/
	QiCiqXJ+nvbYVco0FG6fBXeO4LJyqaMab4ev6XwJrQGt1npF3Ph4NrHMXvqu55PAPWJDNHO0caEIn
	xhSzvTUIH1S3fbpkfjhlBqrz/DuDUMwOKncxrPXZkXtSy6bLK7b6Vxxj8Iw4bYcuQAx5rjxdMs+/b
	MACQbFNqImhsKVsSA52y+WUNx1KFOsJutbpI7LgyH5f0pOHew54jELfZm31txx2UqS0vnFb0p7060
	nKfpykNnjEcFMXARaGl7yZm/9YU+85O+BO8tSbQqVhG6JhgYFZWtDQ8RYUoHrtZ7NJ3p8qpG3/sjs
	GIKeBm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZutv-00000000AAu-0jBQ;
	Wed, 17 Jun 2026 18:22:11 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZutt-00000000AAU-0y3s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 18:22:10 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-13810b63a1aso198350c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 11:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781720528; x=1782325328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQIkf5SvJGerJpzJyK7LEUA5xTlZO86ZcJ/z+85FafM=;
        b=kkgyFb2OUaeIu4u5s8VpORjEG0HdvKGE2GjS0pK6U9HuktqcTeGHQ7PkMeeqZ+/geD
         5teTjyPtdzYma2I8v2KSYYPtYI8JZVE/ZTd1E6TIZep2s18sO+/qQF1YUsbCW/+KqXoR
         l+K7A8w3e+St6tNqlXYPjNNScZn4GWbyoKn0Cnw1a0K3dR4rDcZy/LmUricEAeNFoD2l
         HPvqD8xXzg28afvqZbnu2AtCECNaZzw1yAJ/vTH7gVwfs1swfGHHz4lxFXvFmnBpd3vY
         6yNGpA0U/jbu5nPDgb/rwvAjFwrwdDnTG31mjFyNpzpaZY69QZoP62Rk/a0koOq8XXro
         bzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781720528; x=1782325328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQIkf5SvJGerJpzJyK7LEUA5xTlZO86ZcJ/z+85FafM=;
        b=N2RcK4QGti17ZWFO5f++9lT5+Eqd5d6FJkFRU2hyK3TP+cRCpDgiusZ7kkD0aZPY4F
         TavUOKLDKy4y9BHbVAaf7SpeFIP7H2xa//6v6F0lY578//S4X/euOkRxFMmczazGsezM
         dP7QZE0Tk0M9VFYBVdThRQBMa7fw+O7+0tZ9jsALWf8g48WWxEDLn9sSsFOh1WgA+ogh
         s/aSJ5Vsqbu1T4l8To0/JS4uMR4EBK1o2WhDzP/zZL06pefTfOqxhRYnyi4n4PPsflGA
         Vs4igKw9udXHgQkKlqoUL+UgFRbU0gNg+MQK0CocW9Rcqf88wWzuYxvDYFjfjsU2wH/g
         trfA==
X-Forwarded-Encrypted: i=1; AFNElJ+LqfKsVegJWVy4fW7/22JJmqtHHv8a+w3DTcT5tR7D/QfXNmAyhKSK/jq/F89dv5/1fMyvUCFXaiiLHWF6HGNc@lists.infradead.org
X-Gm-Message-State: AOJu0YwrL9yx9cZGY8PuEyq2/PRYqfbx+vHppD+MqYToalO9y4NoH2b1
	/IY2QkhRZn+k4fZeXW0ZvMI337BON3oatwClKk1Y9C6/QkHIGkLgcgFLmKucnwSA5pI=
X-Gm-Gg: Acq92OHCO7VtZ7aoxSiB8CV9YVHer7K5Azq2QIvKN5aKowkla9xs/GqCOYPgZkgrgm8
	u8BDTv6aGB3diZUjRvHEhGFHa4Ki3C1T8vJtykmn3/7IlsZlPsBan3mH7sFFn39JBpKF0Q3aJA4
	G5jglNKS5Tpfk/dci6+Em6S5N7GsO8Hx/X6Ew3DDrP6HpfqTW6LaNh4aWkzuwI7HBztB3py1oxM
	uaO7M1D4A97/ZAFBA477ynruLIeCscvgN/e4qUySXvOnDFDjWvLMRkxRvSyC/CDTlinBOPvL9UT
	gRlnxUqUhoSpHtpot7Ne1Tw8mdcgoGOtFZx5cC4EHFfGbgzlJ0V/RO2i+aR/6ZOhf9kMwVmYHGt
	1frh8WKMxgzVF/uA0SlUM/yXS5fmfkxM5RvZ0qNBPcgyW6Q+elgp2CYKuwb+NubIJeX5gamNOad
	toqWNttS31CCV0GhNL2fchZ7IsvovPMoIH
X-Received: by 2002:a05:7022:4390:b0:139:86cf:c305 with SMTP id a92af1059eb24-1398f66b777mr2273424c88.3.1781720527835;
        Wed, 17 Jun 2026 11:22:07 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1886:6b7a:3e78:272c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b964862sm17359988c88.10.2026.06.17.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 11:22:07 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] memory: stm32_omm: initialize ret in stm32_omm_set_amcr
Date: Thu, 18 Jun 2026 02:22:02 +0800
Message-ID: <20260617182202.961843-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_112209_272105_22970A2C 
X-CRM114-Status: GOOD (  12.41  )
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

stm32_omm_set_amcr() returns ret after checking whether the AMCR value
matches the device tree description. On the normal matching path ret is
not otherwise assigned, so initialize it to 0 before the checks.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/memory/stm32_omm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 5d06623f3f689..2a1af229d2444 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -47,7 +47,7 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
 	struct device_node *node;
 	struct resource res, res1;
 	unsigned int syscon_args[2];
-	int ret, idx;
+	int ret = 0, idx;
 	unsigned int i, amcr, read_amcr;
 
 	for (i = 0; i < omm->nb_child; i++) {
-- 
2.51.0


