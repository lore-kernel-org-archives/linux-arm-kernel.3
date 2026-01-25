Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBC0D7237C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3EJ6TxN7ZDz04YTrVqZvmwk994KH4aI44usL/+rv9E=; b=Aktr9TI7BmqDi2tQ3vHYOuxHyI
	jF06Qy1DWwJVZyTgAk4YYvfhPrsk1p7HvIVon2wXGuF8qiq2zGLOtGvd7PFtZl50+fdUlFpB7yGNu
	WlxGKEYyMMHGWbjv6G4zjRXr/FczImOjAhQtZW6LsQt6/ta2YIqwHoapSyiJqpOQZzBM6i/fAVYMI
	Dton5ZtvRNsajIKVEXjRfIxlg3REGfQEkH/rorcY23pa5jEucubxHf6Z8FECE/IZCgjzhEgb3zww5
	aTmNkeafVWZTgkfLlhjVEwwZcXl+3NrPMWtmYFWVkvGZBMQkWRaCkyHTU820dFVG46KLQWCuHGnVF
	2u7jHUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8HW-0000000BYMf-0gWP;
	Sun, 25 Jan 2026 22:08:30 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8HQ-0000000BYJr-49w8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:08:26 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so3455284a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 14:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769378904; x=1769983704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3EJ6TxN7ZDz04YTrVqZvmwk994KH4aI44usL/+rv9E=;
        b=lhjRSS7rBpc00ggblOXD1mnibrJaxrf6BW4n5G34RUTLTErGqpngSiZszNVR3IISDn
         oXZevpT0IY04685+C09eTSSm4RkRGsVaa4fdNu5Ok17s5nU7cqeuR0ishrdZcj8tPKEj
         /J/K6zGNUERT2h0j8E/lAvZQw1dNxigrPOgBzfyBWQoGsgxQgKWk1wlcslhASBOzOUyh
         iHTt1kPHv0ceMv4/r9M94vkUGgTpur3MQNTmHxOXKtCMkkvogpRrBjtpAkLcJvj4p6hA
         S01CcDoQZaN6goCcqR/+ABxF1vynJZeVmE0DP0R0KxwBJDr6dmgKMtmJr8gZO0QEyBWS
         aZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769378904; x=1769983704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3EJ6TxN7ZDz04YTrVqZvmwk994KH4aI44usL/+rv9E=;
        b=PJAGzE+N4b3kUzVdqQkSTOkE92UaP+nXNxXF5GShDKjN/E6rFY+b+jRGLVfG2MkkFY
         EJ278inVgRHC8UI2BCAIp96YsgCt9Fg7eaPePlem8aFN/0vtfzoCzo1LtnIt6OjsRDPy
         uIVTbi7qVEsecOgh7bq3R/cMC2bSgr4Fi3zuLdLLNVJdcmZIpRKGXFepwq8uPFbNIOhy
         FZiC8GHymQijoPFtAFEOS/MYunjFnCE7DFExcnWlG5T+zHVnTCDEdn9d2fiSpjopUfNt
         sQnjm5t8x+/BY+J5u5SMpqfqvEUALqorU52BfSHJxixo99Jni0xaYzjY+ZjUZxgtFRba
         8dnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+va3yb9qHXfFW2t0lUlXunRhYGqwUfAhY40B+JgM/D3XifTdvQId9y7zPlKbb9IoQwz0khPFyW9bsuVzvaK6@lists.infradead.org
X-Gm-Message-State: AOJu0YyylOzc4+EsXVzHwMTnOKVhyoydxg/59xUFZdX1bOUzLy/OXd2s
	WLthPhYItwiq+1IQ5sR0oXm3F+oxZMVoc/mjjLaF7/utMNRPktL1X3u2
X-Gm-Gg: AZuq6aLYaCeJgOSp69quhOsOdYh2i2XPzDjOR0fvWWuN5nOzRsM3alqQMrPgKIQ9EPH
	vo9mp/HSYkInRX+X3TJs9Vjg7sndCr/WtH9NlPknHEZNowOZh6Va3+LeBqBut/rcrCZP+YajegV
	WELl90OIYC5BMgFrCS90kfQxXGOqKuaFLpYFBDw2ci/MPVpMlI6CtL4H2QXs9AVX3AoOUvx0iRw
	+zbPFj9rMyrZhwGeVntSuU2OUDFK46z8v2wlRM8HSie1UoYW9xKSIr3QauVHJ0Pd5viIAbWRUZS
	9VF1Dd+19TphKR/vQXq+3xmRRhzS7lEGyu0F6fC3qjsbVcxViOaCwO2OiCXPIkyasKlotYrqzzo
	dycT00nzd5qUxyQevwB3Oqjz3v3mBmVDrmjWK15OvblP7grwvN/aA9pyVvHtg62943KSaf7ZMyp
	6DfMZKNU3ogGeyzQ75/IXCvr7D4JLlT34ak2aRtCnLBFBrnpI2Hy/KVDF43Fot
X-Received: by 2002:a17:90b:45:b0:349:3fe8:e7df with SMTP id 98e67ed59e1d1-353c4167b7bmr2107663a91.22.1769378903982;
        Sun, 25 Jan 2026 14:08:23 -0800 (PST)
Received: from d.home.mmyangfl.tk ([45.32.227.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e60fsm7651286b3a.48.2026.01.25.14.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:08:23 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] u64_stats: Allow u64_stats_add() to accept s64
Date: Mon, 26 Jan 2026 06:07:49 +0800
Message-ID: <20260125220753.3984326-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125220753.3984326-1-mmyangfl@gmail.com>
References: <20260125220753.3984326-1-mmyangfl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_140825_034911_332CACCE 
X-CRM114-Status: GOOD (  12.44  )
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

The current u64_stats_add() accepts only unsigned long, which makes no
sense as u64_stats_set() accepts u64 already, and causes unnecessary
narrowing on 32-bit architectures.

Moreover, since there's no u64_stats_sub(), users may be tempted to
reuse it for decrements, which already happened on nft_counter_reset()
in net/netfilter/nft_counter.c .

Change to s64 to allow both positive and negative values.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 include/linux/u64_stats_sync.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/u64_stats_sync.h b/include/linux/u64_stats_sync.h
index 457879938fc1..e77f2b30bac7 100644
--- a/include/linux/u64_stats_sync.h
+++ b/include/linux/u64_stats_sync.h
@@ -84,7 +84,7 @@ static inline void u64_stats_set(u64_stats_t *p, u64 val)
 	local64_set(&p->v, val);
 }
 
-static inline void u64_stats_add(u64_stats_t *p, unsigned long val)
+static inline void u64_stats_add(u64_stats_t *p, s64 val)
 {
 	local64_add(val, &p->v);
 }
@@ -125,7 +125,7 @@ static inline void u64_stats_set(u64_stats_t *p, u64 val)
 	p->v = val;
 }
 
-static inline void u64_stats_add(u64_stats_t *p, unsigned long val)
+static inline void u64_stats_add(u64_stats_t *p, s64 val)
 {
 	p->v += val;
 }
-- 
2.51.0


