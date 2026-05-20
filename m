Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B79CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wDToPvSvnd0hOAWoBXV44G9Ve2Dn+V6xBsAOZi0rbvw=; b=zrI7wZAADcuunJrazxbzBj6uel
	Gn0LpPnGH5ryam7880ntk3QjrXTwpepKNeQfWzax4zA9t22/s2rJfaccu9/KnBg7JM0LyYWhEDR0v
	HtMn5uYiT084hrNH3PL6D6f+SAc39V6yxF8u2Y9J1k+mZ2r2cjwdijWRog9HlIgLbXl4C/TyIWMaF
	IBD3daaf2ZTKI7WywI6M1twWMaB1h4E1Vj67F0em/JoXUZ0ek0O2yMKhf4mjkxo3uHJY21VEMkkhU
	+wIfiK3+N96njJTsSRpMPr8wClkoAcH8yf5xJONVHP//zRLX93rEjzQpnMa6WgdoQdeV7Z9Sk1EHQ
	fe/rlreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaxH-00000003jpG-3gZL;
	Wed, 20 May 2026 07:02:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaxE-00000003jnN-0ThB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:02:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48896199cbaso35552265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779260574; x=1779865374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wDToPvSvnd0hOAWoBXV44G9Ve2Dn+V6xBsAOZi0rbvw=;
        b=jmBXCudswVwfXVdBkv2lnoBJcqYhuerbBGu126oBif/BTZgeXyS5xnKnzfBzK7J6Jw
         yWdc+wl97QlvEQZdv+DozWbTxYKW8VksTTIfGXdlHEgiuoAPIPo+CWKzqDFHGLNV/oxl
         KioPCD112yy5bgAbtCCq+j7hzcBFfDu1nWDMjqjsC4upgp4wtz7wqU1w72oK+NxYszsJ
         iaR7/5Yvrn1S1Szgadhk00KSE1sgTyDA03kKFi0X87XqZTJBJmG5R6NIEbrLa5ED0S32
         J+F5cXQm74JvqKWlOWGny/dyNOCxqi1is+FX2P1DYylasfbDwY/cYyKwg8sz7W5c0Hep
         eyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779260574; x=1779865374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDToPvSvnd0hOAWoBXV44G9Ve2Dn+V6xBsAOZi0rbvw=;
        b=bX7DTSoq9l4I+br/pXYhj6QwZDh39Fc8laeI9Kjsz3YuPn9K9z9ien8M3yC2f8fhk5
         yTRnUD34tPOP6ocbBhkiWP2SIeCD8vaFX6wrN+RqKd7Cqw5jXf9BIi9Ulq1t/W4129C8
         a/wnqHRr3cx4uNaucFFHeeoYCszBwQg4U0Vvc8339jPLXXUfyYNWgysczQPon2bpjByK
         XFX1CyQb7mV2STNDEqigzSiCfVXZOrC4kNa+F/qgpBjme9H5xPxrukcmrzQGd8yTMjxv
         r0Ur9namNEG9i2/5twwGzbOCuAUXWM3nT40Kch0SmM9d2ESnRxdGgIfBsiM3tItfYrN8
         y1Vg==
X-Forwarded-Encrypted: i=1; AFNElJ/cKE33rkfcJmoyqXsfk/GVQqRwHYRPYZxByTaS4/CLBbiZ/M3XWOZuq4p3QiFDLUQ1PZ/on6Z4gWHn9seSk1xm@lists.infradead.org
X-Gm-Message-State: AOJu0YxCpbVvfbSI5SVC5JRaF6EZffiOzPRNr7yGJ1UQbARCMbMcPttX
	5Axm3OIEx0MO7F9w6oMyywFR+9wHewIU/vXKA3ztujtMYVb0x5+tGte3EUoL8PUUGsk=
X-Gm-Gg: Acq92OG0Q2Pc9V3exPJ/zqloQ2q3vBDoSWTZXzZ9Lt9PpMHf7VaPB9KD8+rN5SZyf4O
	fW33Yl5RdhN8Mjm+OubMGlDCqfj7mIcMlXLjqWCXpP3iJsI5oyYNgN3IM94jYqHpeqfI2uJC4Xg
	8P44BnLUQ0uXUu+bop5GFrDb//XlGQopaKaJyPZxtJHxYKG6fVNfC94k4RlIKk0ivyGgoUhwNg8
	E05nTutRSzBuJMCCvzOBBoMGug/0CAhp7/o/y8hHaSo/NoYwEtwfKNbycLsNWSZ3+f+qJDs6a+M
	Q+IPpa4uXgFnVur3VdHiTUlpyOaWcqe8lhKoZjrCaPnA0huzdbFw275YnMiLD9Sm4s1Z4i0JWzW
	nqDMsNiNq6o0ejRAtzcgeG+qcZ0zr25YfKmyvqUeZUormKuJSQD+AvCjajRVlY44biuT6Vhcp/l
	faZxvC3YmcpNPz5yB5UM+fTmRdbqwUYHQPQa9UdFNjKuGLTdPVkHB5mrAksWBZ4oAYUX2xtRmrW
	zWlcQRUQcIKoYhC/GVsAulcjg==
X-Received: by 2002:a05:600c:848c:b0:488:b749:8482 with SMTP id 5b1f17b1804b1-48fe60e52c1mr365839715e9.4.1779260573689;
        Wed, 20 May 2026 00:02:53 -0700 (PDT)
Received: from localhost (p200300f65f47db04a02ef40d8e5825ac.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a02e:f40d:8e58:25ac])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48febe78aadsm121262465e9.29.2026.05.20.00.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:02:53 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] crypto - Rework i2c_device_id initialisation
Date: Wed, 20 May 2026 09:01:27 +0200
Message-ID: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=36HTJ+Yl/kWMfQ13i2EP4iI2ISH36vpOiRQioi971/Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDVxINn+09H7tvGa2IENrimiiZK6z9nUp0LF2a ui3HrhiNfiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCag1cSAAKCRCPgPtYfRL+ TngLB/oCdm/hMY9CPFgh2iunOdii1+4bzUaQGyuy7tT/STWiwaCsvhatl9X12zVBrjWo0nmglwb xjbC3UCo4YbXB6cdWMUnPMRFoIEEAjsQrO+YwLb5b8HOfkfLAHFx62tho1mOlPpnsBBUOeMW6rI S1EahTFgIA1h84OqhQqAEwID7LgEqQq5vaH70QRKKQfj0qDzaq9o8zJF9VyujlJhU0GRE6Y2R+9 3PNvvcgj3cWEecWMUAwK/BTaxhiA5TSEW0AffcAvIr4SN7jV22js8m5m0inGz3imGkNq3n86Rj5 aq5gOwGlC/vO3TRpXnhppxwuZ9hJOp1v/Dtk7KgF0wAbjxSd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_000256_502312_1DD906CB 
X-CRM114-Status: GOOD (  11.87  )
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

Hello,

this is v2 of the patch available at
https://lore.kernel.org/linux-crypto/20260519141033.1586036-2-u.kleine-koenig@baylibre.com.

Changes since v1 are:

 - Rebase to next-20260519 to account for changes since v7.1-rc1 (= the
   previous base)
 - Patch #1 is new
 - The adaption to atmel-sha204a is a bit less trivial, so split into a
   separate patch (#2)

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  crypto: atmel-sha204a - Drop of_device_id data
  crypto: atmel-sha204a - Use named initializers for struct
    i2c_device_id
  crypto: atmel-ecc - Use named initializers for struct i2c_device_id

 drivers/crypto/atmel-ecc.c     | 4 ++--
 drivers/crypto/atmel-sha204a.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)


base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
-- 
2.47.3


