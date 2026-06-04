Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CDCCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 03:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4sGy0akI76XbwNYB58aYQ6sLn7Il/NliKwIUEuxnuMI=; b=1NJcpnatDYmcPJUGgDn1TQtR/P
	9Qn9IdF9UURhsskvOuAwOlBYlc4j4C35khBOnz4CwipWaaZE7qeCMQ3gjiXnmDHU/B+Q9OTe6Im4R
	dLd+ljizwUh9cOvoDZ1F7HVa8tF8GcJ+mCBvvIbLJI7eK0Yk+mGPWYfDZy/3KhH/g80429MJfP3D8
	xlIW1q2W8QGDBJa+q6iAXf7DBpDqo9IOtnZ4pjbkq639I8VHE7dQ0P7wTCYRcCmbksoVABbfRR9mA
	9NaGeGYQml7MFnZMCtjc3aY0NBUIqI0kgvYq3UXpY7RKK0HV8Rraa1ax5gMQCcZmIM49zW9i7Ezbx
	ydkK2KXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUysN-0000000G6wz-2F7m;
	Thu, 04 Jun 2026 03:36:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUysL-0000000G6w1-0EDN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 03:36:10 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-842273a2c4dso156671b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 20:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780544168; x=1781148968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4sGy0akI76XbwNYB58aYQ6sLn7Il/NliKwIUEuxnuMI=;
        b=gq1mV6vXY+xUm2/eiZZKZQ8b6TNDImmXtpKilCfktgPecURC1JDW+Za8zGjQENiux9
         R6RBWGHedHf77FoLyFMRqQ9H/5CKDiI+dqZYzbeOwSpfyQNKh0Ri5TFMq49dQkZ4vFnq
         i6hVByd/UY4W1Nqq+fzy3uFhPHp1lTnCBq3bm7WDUCrSLyvUYCYXKFIn1N6wsSZDgkc6
         4twuqipeHnfubxbYkB42JMXYSEkOr138uEviXi2xDv0s4YI0pY5eUdqgJgCdiKGjqhLw
         kod269gu6zs+rgIaNR9PxIaHvKLNLQxiazMvrJugfJKxSLD+Le4i8d3igODxRiKzoCOE
         P8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780544168; x=1781148968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sGy0akI76XbwNYB58aYQ6sLn7Il/NliKwIUEuxnuMI=;
        b=XokyQF9RgOq4yl6IjvBJb6W9+tEIPHJgr9PItp8bCDksljuOj/QbDMxWb7/eej9dsZ
         koj3q1W37vTbBeK9HCuR11YD0QuG5wNwyB1bE/Lv4UtkFJtx9PrXoIwx2Ho8LCrJuyst
         2gTZzApat/de26Qk0s1ykwdQ6bzSNSKs/YSpwihDYgbZXI/5IbXCgcPlrK1kMdcvli8o
         MltP8JjkW5WnOvJVvFDoqMBvZ/0OX5pkcc+qley/cYiOOGxrWX3RvQ4yxNF1ioGR1G/d
         H2HJZS1FdHxfaeMo8H22oesPnY19jiqvbigUUOSQ4QWtwapfLWn3yhF/EhAfpjM05eml
         jr/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8OkMSHrLL3MqnbmlAfwrFtNglCXSzSE6fSxBYU4/kaGJ2ws2kWAoTr2JZn8kaHcz6jnMS2CCnq5BfFmj4Yav/r@lists.infradead.org
X-Gm-Message-State: AOJu0YxlEM5cRSDtB0Adt/OFXLYOeToJtXViT5+bMj7jixPpDHDmpLhu
	XrdffAkrtOoUPwwhcalQDMjrbRNI0cPjs4IraPreUVmQNNdzD1ATIrBv
X-Gm-Gg: Acq92OHqtRaXwDOfcbG0bStzimGFaPjgnMb7Ndak3Ln24328p7A30Bzdn+cHAiL1pq5
	7QEBRcGfgq510MuwoQ6j0xPrKylhagjBykIVjV7jBzCtt6p/FDui6LEmt6BhM3szFPLgidfkPvV
	LG0PWXtMJC3qeZxGNnjwQxXRCI12gyNPH6yZCqnb8FDtw7XDx/RBcwo2p3N4xzThjWCAkXhDCft
	wNgv9S8vEQblS5MNGg95AF2goHPhAJrsbyaeoTUKauPTH/lf1qKoQP2Dv1KBB60bPx90JUmI9Hk
	jcMpRlaZjGyTJ/DUfWKr/JLr0CX/pi1f6ti1EnWrAtNwTTm1otk13FprXx4i+l7elmfbf8Jo+SV
	WAIvn0S/JMC1k414TRonl+WSqshJzC9W82NOqqSIQFn+x9vtPonc7Qo/Vqe9OqN9RxFXnb9P9+k
	6+hwti7CZwoVk6VdqktxTDrOOaiJDU6tMnIO9iOogJ59iz9vTCgnaxTE+Cyv2fj7irvq16
X-Received: by 2002:a05:6a00:b603:b0:842:6419:3ed2 with SMTP id d2e1a72fcca58-84284f2c206mr6902399b3a.33.1780544167919;
        Wed, 03 Jun 2026 20:36:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm5539745b3a.11.2026.06.03.20.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:36:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
Date: Thu,  4 Jun 2026 10:35:50 +0700
Message-ID: <20260604033554.96996-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_203609_094813_AACA7496 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts spinlock handling in the Rockchip sound drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Changes in v2:
 - Remove the unnecessary err_pm_put label in rockchip_sai_hw_params().

Compile tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
  ASoC: rockchip: i2s-tdm: Use guard() for spin locks
  ASoC: rockchip: rockchip_sai: Use guard() for spin locks

 sound/soc/rockchip/rockchip_i2s.c     | 160 ++++++++--------
 sound/soc/rockchip/rockchip_i2s_tdm.c |   8 +-
 sound/soc/rockchip/rockchip_sai.c     | 262 +++++++++++++-------------
 3 files changed, 211 insertions(+), 219 deletions(-)

-- 
2.43.0


