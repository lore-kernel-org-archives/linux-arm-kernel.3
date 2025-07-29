Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0A8C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 02:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EEeZXXxE8pXnqG0YImoNpmvGHhhvN/xzySIEmSbgUno=; b=yy5hVu4Q3eW7vZW0QYDEKW2Hxo
	w/NGU3rOgVgGGgZam+F2507Q79GaUmYL0EG3w/Jc6iX0TnwbJAVMRr16fXg2nfFPakgHSt+zEvZMf
	V91kjhbZycTP69p3oUVksEcBiRFnxLezevRY8preGNBduUk+4CbemwlJ9U/6d14/0uRx2C0iPg+mK
	2vTws1MdfTceHCybynq3naYiixDdeavuFThlAUvMXX81ojsj3acp9blk7bYO5KkMFrEh6acTSepq5
	neyDoWzf8OIlTb3+OcXJ7qSEY1Lg1iWgB2+esnuWZwL3jC/WWTa8ipGwRP6EmgfO8/mHgElTNeAm0
	e/bVFCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZwG-0000000FkhF-0vwu;
	Tue, 29 Jul 2025 02:19:36 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZfO-0000000Fjqe-3Ri3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 02:02:12 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2ffa8e58654so2746162fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 19:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753754529; x=1754359329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEeZXXxE8pXnqG0YImoNpmvGHhhvN/xzySIEmSbgUno=;
        b=BKXBYHcnDboOOBnjYB5HGi/xAXEytAt2rI/dxUL2Uu88E/xL6nXw91sKa5BXKuvMJh
         eTWKq4RTvCW9hZkM8hZX/TtOB3JJzEmdwd/MzIawGYZqP8cdgpmOVojrYjGNqK4a4mhP
         nTjJQFEVlReScPDIQdjlPh/xlYnzDmVfDz0vGyeZinTzsypzNdKBdSkjSiFMeQ3Y8uta
         85/+UjwA4Yf8AJ3tkqSTfuRfSVMMqwzT/1FAmXRTWDd/vSSNioRdHhDI3UMjnpND7siR
         FetAxFnVZAIzbaMLMsaWHajT6BBcK4AfB6CSZYcsN309BkdKBFUUTn6w9nByOb65RW34
         Rccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753754529; x=1754359329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEeZXXxE8pXnqG0YImoNpmvGHhhvN/xzySIEmSbgUno=;
        b=RWX1VDSJv82GhZ5JLNol9vPRiKv+NpHnOlMrRE+LRq5Uijh65NpsFJb0VvG7ocxAq4
         6uNw72XdN7SjEbNd9D1uWSn0KmNU3mG+wb5WrEargrknomQkkWsO0VC4CNQgb5rlEbWr
         DiiiQKPofvEYsj3qiag81rfWU8ZvzDHYjtn55vfjWcNdLDVt31/y584aW99PaPVSlegz
         wzbv+hUzelUriKhQTHOKOop+YPGvItpDlmrLxOg+yx13xqI9qpvxsOGc21y4Y92FFENu
         TVwN/+vh3MIP0Kbpl6yxN4tZGwDuMKwffM+yAKJUE49yAAUe9XIFbr2F+Pyw64D47PVR
         dUuA==
X-Forwarded-Encrypted: i=1; AJvYcCV6T2T1T5Vu4mNQ++5hUIqPy1ApO32LLPzM/HQKC26b7Au7+iYiw9fkcvvM5agkvrHpTHzs5Y4rNUIvDf7axFq5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt/jodoVASV9dOjOet1EXadWGfpzafarelE7gGWckLLQRrIYlq
	MF3hWZO03ctf0T0s52bRVTfDC975vWwiO4EMMGFzzFzY/lK7VBsFg8L5
X-Gm-Gg: ASbGnctPwy/Oa4scvIGRT6cZdzhRu/maA6o4r+LiWz64InhRCDJ9nlabK9f8MtCnBqR
	2gPQSqsIZnpTFiunaRRL0xiJDeYZpRj3gwlMBdC0XGweKRrmwS8fsnn0NXRTy3JgbqlV4sS6ap5
	Ouimh9gBlRrobksfHfMTU1vQKMTp90Sif/D1352IOFa7CR5K5mt14X03OOgmF1gXnu0etxXX0rk
	/ZdwrlO2hJ+niH1/NmsZwPsNGD++rl8sLcrrnnbUEu1RsxD9ChkMZhFUjGhIV1Bok/kYCq24fmO
	71xLujAc74CeYVWvvoCcx55e5y2UyDq8bERPu9H1GSN6RzVJOR5cAjgLTq1Oc7zNcmu+z+Eov8y
	OHofCDsQWRfiGVYqO03v5R8Ts
X-Google-Smtp-Source: AGHT+IHOw30O5Z7jeXCpP/Gpsx4e0WuD5rBxHCXsw90edV57RFa6IsOd12KYHPXG7J73ZnyfU7myhA==
X-Received: by 2002:a05:6870:1b83:b0:306:9f8e:6699 with SMTP id 586e51a60fabf-30701faa8b5mr9069467fac.30.1753754529402;
        Mon, 28 Jul 2025 19:02:09 -0700 (PDT)
Received: from s-machine2.. ([2806:2f0:5501:d07c:e094:d952:816c:c6a5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30713663c67sm2001746fac.31.2025.07.28.19.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 19:02:09 -0700 (PDT)
From: Sergio Perez Gonzalez <sperezglz@gmail.com>
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: Sergio Perez Gonzalez <sperezglz@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: stm: stm32_i2s: Fix calc_clk_div() error handling in determine_rate()
Date: Mon, 28 Jul 2025 20:00:49 -0600
Message-ID: <20250729020052.404617-1-sperezglz@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_190210_863200_C24B6733 
X-CRM114-Status: GOOD (  12.17  )
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

calc_clk_div() will only return a non-zero value (-EINVAL)
in case of error. On the other hand, req->rate is an unsigned long.
It seems quite odd that req->rate would be assigned a negative value,
which is clearly not a rate, and success would be returned.

Reinstate previous logic, which would just return error.

Fixes: afd529d74002 ("ASoC: stm: stm32_i2s: convert from round_rate() to determine_rate()")
Link: https://scan7.scan.coverity.com/#/project-view/53936/11354?selectedIssue=1647702

Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
---
 sound/soc/stm/stm32_i2s.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 0e489097d9c1..6ca21780f21d 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -469,11 +469,8 @@ static int stm32_i2smclk_determine_rate(struct clk_hw *hw,
 	int ret;
 
 	ret = stm32_i2s_calc_clk_div(i2s, req->best_parent_rate, req->rate);
-	if (ret) {
-		req->rate = ret;
-
-		return 0;
-	}
+	if (ret)
+		return ret;
 
 	mclk->freq = req->best_parent_rate / i2s->divider;
 
-- 
2.43.0


