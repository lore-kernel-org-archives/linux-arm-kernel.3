Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D955FCFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7O/40bLxFz/ubc4QGbFz1RJXJpAvzSB31xunK5lGsY=; b=ffEh5D9YyDsnY/6vgujpnVOvmu
	vkVkxMU0U8mmC9ZLyUNxWRfhJ/pSDALSgiBAbxe0hIdN5n1ca46h3KxuA8OPkFLB+vmCVrYlDedf/
	WSkgoHuO55TE1EYxH0GK4/IVTiHI5E7g3OrsJCOVePHrLsFUTPSfUL9pt7w1IagFlXTiZYOwBuYPt
	A8yiq1eFIb9wW1LQojFpKBqpEMEOqZRPJTSrTypSCcPF5iCBpC9zKuoSSSCmynt1+YnJK3Y27KVEs
	1uCY9Fir8Uv3c0p+vfoj+5KKgPUPPAd2m10/lCXn3fCVJjNzVxVocpdlROkV2qnFif6ODR4Zg7HbI
	8GSDniyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCMr-00000007ToC-3OEP;
	Thu, 20 Nov 2025 21:39:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCMo-00000007Tm5-1Hp9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:39:04 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3434700be69so1870021a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 13:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763674741; x=1764279541; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x7O/40bLxFz/ubc4QGbFz1RJXJpAvzSB31xunK5lGsY=;
        b=NnAZ4s3Ezk4p0XTQg7NWCjGyDUiVbm6IfifCsLJNyzjukiaaBbhGb5tI8jlBryO261
         cjD4D8xJZ17ABZGr8hpM6+ICcXZQ3NXC+mtIA2Pqqzg5sNHwbmTTbtONtSR+/GCHR9Aw
         2yQC5U2a636e9ZJV1QAksVvawN8asVcgSL8QqRWnjBqfvtwdsXzKjznZ2adDlJkoml3C
         l3hL0wDhpaw4JqApS+0in/kKq1oOgjH9nYeY+K1+1PPitKDRX2fjhbcgrI/OfGDeEg8j
         e0PoPOBpcisfK2QzMVPvC6LFn/8ypLHGqPeeNaFio0uO0km0ZmzvGCZhkqjA16yR/fN7
         gmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763674741; x=1764279541;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7O/40bLxFz/ubc4QGbFz1RJXJpAvzSB31xunK5lGsY=;
        b=eGxyXgZDMaq8q5qcGh249Qe8YW/FpKtL/T5rxW9Vpp2GBJdFFqwP/ix0PafZo6sU29
         wwWCZehlyvhZx2/KNQMyxCENE8O/33WwlpFdekqP9ck/M048v9IhFP8c+owJeouE9owf
         JYS1GPIxzCrN5np5LXNmXq97jBb/Vt7djhXnfdEFVGIZCUP1XTOAsbqfxiRYtxHmepV6
         LYjcYXef2gUlnbfBsiJS6Z7EnqD5swXECbQLbq9CPluvf05Sn/rNYsjuPFTkZDNTSCag
         l4jfFdI7HmPBgbVF6l69oQhV+vNj6rvJdxq3iCdpr07d/8kZxxP22MT3/rp06P6fbGwg
         81BA==
X-Forwarded-Encrypted: i=1; AJvYcCUvHGqMajVqYJNsxhVmkrmW0Zzkcl2v8ZZqcgeRmF/6ZAfs0vT1U3JfJJaI6pAUJX7i4fkSnsvER1O0BcJ70Ov4@lists.infradead.org
X-Gm-Message-State: AOJu0YyMbS2EPEm4ENq+ykCWRUou1QupFuOr1xQTiuNMghePcNMRzfwY
	f91zeNJTtp5LxFvVCFiU3qadCKlCfmlgf1UyJvYNczIlGrzGihrF9IZh
X-Gm-Gg: ASbGncvKOer1IliqSJGVGzN0MtH7H73Eyrqivr5/iQ5jOnYm27WkZdfA70rM+cBC12g
	xbwHKkoaovLAMQNn2FX5G7xb6np27HZnFpH/0LbXshnNqUIFRy5bkKuzFqdeV0xZGBhOqiCdWbf
	5FaZ9Y8UhCHX6WdX7fvulTjsh6e64ZxiLSMsCrHyYepukDbPW99SLQwVH5o/hBUWs9AVmq1hDiu
	Ph+ulYoyBYhLALFKETIIHTGMs9QmQvoN1XQkwaJujIX33f0conuHxhSRkExeayx88y4LSceTtXo
	2R8KpnJ0CDPxwzVQoLB0zwymQhgvFOYx03f9xcpT+drLtpIGl2Bc+JIYuT0ahIiFkfmBFod0Cm6
	j5MoKCzy/kuGkyeIL8935GZdPzqeb0rakXOJJrNAjzX8TZe3EGcAt0PZ8O1KH71AJ6mEDl6REgS
	llEqAJgw==
X-Google-Smtp-Source: AGHT+IFk2zNyEwkfMF+EqHHJ2lA9JWu8koRD6/b0KgaWv3WfMDkuD91zEkWIPZNe5l/6fSMM5LpsOQ==
X-Received: by 2002:a17:90b:4c89:b0:340:cb18:922 with SMTP id 98e67ed59e1d1-34727bedd4emr4929684a91.14.1763674741359;
        Thu, 20 Nov 2025 13:39:01 -0800 (PST)
Received: from SC-GAME.lan ([104.28.206.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d6f48bsm3325479a91.17.2025.11.20.13.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:39:00 -0800 (PST)
From: Chen Minqiang <ptpt52@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH v2 2/2] net: dsa: mt7530: fix active-low reset sequence
Date: Fri, 21 Nov 2025 05:38:05 +0800
Message-Id: <20251120213805.4135-2-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120213805.4135-1-ptpt52@gmail.com>
References: <20251120213805.4135-1-ptpt52@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_133902_361583_10AF66F1 
X-CRM114-Status: GOOD (  15.69  )
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

With GPIO_ACTIVE_LOW configured in DTS, gpiod_set_value(1) asserts reset
(drives the line low), and gpiod_set_value(0) deasserts reset (drives high).

Update the reset sequence so that the driver:
 - asserts reset by driving the GPIO low first
 - waits for the required reset interval
 - deasserts reset by driving it high

This ensures MT7531 receives a correct low-to-high reset pulse.

Compatibility notes:

The previous implementation contained a polarity mismatch: the DTS
described the reset line as active-high, while the driver asserted reset
by driving the GPIO low. The two mistakes matched each other, so the
reset sequence accidentally worked.

This patch fixes both sides: the DTS is corrected to use
GPIO_ACTIVE_LOW, and the driver now asserts reset by driving the line
low (value = 1 for active-low) and then deasserts it by driving it high
(value = 0).

Because the old behaviour relied on a matched pair of bugs, this change
is not compatible with mixed combinations of old DTS and new kernel, or
new DTS and old kernel. Both sides must be updated together.

Upstream DTS and upstream kernels will remain fully compatible after
this patch. Out-of-tree DT blobs must update their reset-gpios flags to
match the correct hardware polarity, or the switch may remain stuck in
reset or fail to reset properly.

There is no practical way to maintain compatibility with the previous
incorrect behaviour without adding non-detectable heuristics, so fixing
the binding and the driver together is the correct approach.

Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
---
 drivers/net/dsa/mt7530.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 548b85befbf4..24c9adff191d 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2405,9 +2405,9 @@ mt7530_setup(struct dsa_switch *ds)
 		usleep_range(5000, 5100);
 		reset_control_deassert(priv->rstc);
 	} else {
-		gpiod_set_value_cansleep(priv->reset, 0);
-		usleep_range(5000, 5100);
 		gpiod_set_value_cansleep(priv->reset, 1);
+		usleep_range(5000, 5100);
+		gpiod_set_value_cansleep(priv->reset, 0);
 	}
 
 	/* Waiting for MT7530 got to stable */
@@ -2643,9 +2643,9 @@ mt7531_setup(struct dsa_switch *ds)
 		usleep_range(5000, 5100);
 		reset_control_deassert(priv->rstc);
 	} else {
-		gpiod_set_value_cansleep(priv->reset, 0);
-		usleep_range(5000, 5100);
 		gpiod_set_value_cansleep(priv->reset, 1);
+		usleep_range(5000, 5100);
+		gpiod_set_value_cansleep(priv->reset, 0);
 	}
 
 	/* Waiting for MT7530 got to stable */
-- 
2.17.1


