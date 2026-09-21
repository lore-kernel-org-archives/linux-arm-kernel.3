Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E62C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qAXyGZrnDwRQSNRJqJ6eqSWY0PVWK1O+tcBGYpLbtNY=; b=E3A3OPUWRHqpRL
	9K5HLVSkmwc73ccgrx5K70pg9VfJSEaWQV425lSbqF7PBmjKeaTxrZ8wL3GJGUgzv4NUsMRAZ4hkv
	ZeTXt8nVFXOUyRJy2R/8tRiv/pUGRruIZv8AYWetTLjhoer+tztZXAjsxO6g4W+5q/vIFtLIfMSMz
	qf0ScEsF5RGHAYu5wlRn5tQistkuMcXl0zg0Ne6b1UPpgRCdTizouwmnq4b0QCboAhdRtLx7zvb8Q
	WWoYF2YoCkOjAAFjwyvnQ6N9T6m06c64IClWD2Pj5FTknYFr6b6MTBBPTz1Cc0kMdwBsgl9Q9Js5X
	QkHnw/c5cbOLgRDlEYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hHV-00000002tkE-0ANk;
	Mon, 21 Sep 2026 16:54:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hHO-00000002the-47wa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 16:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=qAXyGZrnDwRQSNRJqJ6eqSWY0PVWK1O+tcBGYpLbtNY=; b=UrYJCGKwt5p9ekwXDZ5GFfqmbn
	BH0SWvsWjOoKojd7bvPVwRBKatLFAC4WT7Uv5qpUIPf8Lhvul7PW+enhihej8nCSXoBRH0IgjzahO
	ripvkFhfb4y0unKffcIJNzc2IN4h5JTdZcLPay6oFs67OImA2iVN4Inu8ml+vJMz5NM5Q4zGVAKgR
	ZWsVa+eXISX3WAXOckb0mO58LT5uMH7ia8DCuTBTRhrHFGRbZ+rcnPghCzdHT+73OQkBRZcvv7Fxd
	Z25aVA7R1Edl31oTc7sDd2469Mxh6UL3vtQoVL1i46X+tFEeV65n370gBCgRrcDJSc8Bx2t/9+Je9
	VbehraIw==;
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8hHL-0000000CaYi-1O6H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:54:09 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 006d021491bc7-6b1ae6b2010so1709174eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009644; x=1790614444; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qAXyGZrnDwRQSNRJqJ6eqSWY0PVWK1O+tcBGYpLbtNY=;
        b=M/NyXTtc4HIemYOwPWaV9c4YikaDJnSTYyWm9Pp3i52I1UqlTqWs9X3hUymsSNtFs5
         4WDDZ1vk2gXvKYPNq0ekliZaa7x1kTzTLI8zr/IObOnuEyODSUk7ji6UHuVIQEhTGUIA
         YMOc03HIljHIlUtmGDiQTkK3ILHHp0rNZXmdN28IrhWgC0q0/jNROzcil+mDh4sLHWrF
         tyyQu4on08nMvbi+EJ5PLnHaLC43F+aUd7TE93IAC0pAEUdfHJW6V3kVqYLknl6sngQJ
         6jYzCwZ6YortgmXnWur9hfO+PA81BEol+YGT5TmsFz0VGL/mRrfceEDNPsbVyaetnZXY
         xaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009644; x=1790614444;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qAXyGZrnDwRQSNRJqJ6eqSWY0PVWK1O+tcBGYpLbtNY=;
        b=aGjLWM/nJmSL2Yed1qC8fT5TFSbR0cWkRl9p7+zkFoG3uupSxDQ5/HqgZULYyDHZb2
         1DlyDoTc5AkxCWP3Sa5yPDrgKKW4dertQW2S9Mvo8CUqvijKP3g8wmFHi6066y4LYQj1
         hiCyp8Vmhy2yjjomZ94wkm7lviA7Frjk27P1AFUkESedIjQkuyssk8jNOOkct+djbBBf
         va/J7de3MrkwcTF2herMejfjaF25Y6nNtIrfTth6B9P5KWXPw8c8SY0o5iYHWcLOjG9I
         IupvktF7jvPk0x3IvQiN6QbHYMi5oVip5E0bhpxTxEXwX+pjUnxHqAXM3Eef3lwi6TpG
         icaw==
X-Forwarded-Encrypted: i=1; AKwUvBw2S0A3eov4O3rRrN0J4QOzkiNbCy5OccmNdIcAYAVtIeAU1CqKZNXEgnBO0n89+/kVchI3+XZpe9/G1YffzSN1@lists.infradead.org
X-Gm-Message-State: AFuF++mMT+fWZCrjNlSU+x4tiyFN8VnlZI0xQrRlwC34lwhrY5W7BNyf
	VAJlJkgd5fIFrlvmvYTesHj8edH3z+b8yfV0iabbdC6DKE1c/CCGW7yT
X-Gm-Gg: AYBFou2tsE3EVi8WavlWVNymTxMMUrTfnfSD2oCIibjT7XwlNc7adHZ9grHGGq7DrEV
	bZ/ZnptcLQrfWChk9Hup3Jp3V8ijIASfjKQUV2rK2nfD4OxYtNgZx7O37iEbu8SKqqBztb0Zk0t
	THTaD2nU+ZRG7Yfv8+Z9sjqu7EDoCTbs2zfOlUxUuxjJH+56CZXxBsvCVGKLDfYY28EgEi4GvYo
	32G4r213f362NMpF2+eR/EZBSy3HDFr2aPpvQlEguR+btwlgTNAdoVoyX2sRTWkV5nhyNMaHsJI
	ylWJQfjksDF5wHyjaKdvHHdgiFPr4qgk5XwOjQcxnqEroRIcgnMO6H0uCXlIGbuZgnP2yZdYwAF
	wBuUpGhg8vznQWMbaqyS5IhwaVLZIwI1BS7+nnDxhVvZ/KkR6hGjDswqze3r9YmNO+wpQrPED0s
	oMFiX/cdTbN49sA27aDjw4pxi0hd+izCUbEzSAgQGQZwH6CSVvSH0+0/oPet8Ozu7CjNG35UrxX
	N51zthBUIA4zN0zz4Jbx0x12thcg7mHO0OpUO9G8CSvYhx4Bz07iL+r/8C5k2ZLEpi1R3PiQIlQ
	+aPqOMpNewtlelWsoz0vJTI+qS6m7fMG6bXXOW8+96ChfiyznNrEj+mzUrLbYd+J5EZHZjx9iQk
	UA57xTj48tCC8g6076wW7Fg==
X-Received: by 2002:a05:6820:2217:b0:6b1:8ebb:7efd with SMTP id 006d021491bc7-6ca9a13032bmr11598584eaf.4.1790009644415;
        Mon, 21 Sep 2026 09:54:04 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d145bc40e6sm510481eaf.5.2026.09.21.09.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:54:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net 0/3] net: stmmac: fix failed MTU reopening and hardware
 resume
Date: Mon, 21 Sep 2026 10:54:01 -0600
Message-Id: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAyF4auUrA10ZmGNVxEX02mqEWaUSVqE0
 rsbdfm/B98Gyk1Y4dxt0HgVlWf1CIcO8j3VG6NM3hD7eOwpBtRlLGKoVkrK2FjZcJY3K64Bh0y
 nkeIUKRE48Wr8+1y4QGWD63905MHZvjDs+wd48Gi6hQAAAA==
X-Change-ID: 20260921-submit-stmmac-reset-fixes-v1-7c98b92d29a9
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_175407_508475_20962F3D 
X-CRM114-Status: GOOD (  12.13  )
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

A failed stmmac MTU-change reopen leaves the netdev administratively up
after its replacement DMA resources have been freed. A later close can
repeat NAPI shutdown and IRQ or DMA-resource teardown. A failed hardware
resume similarly leaves an up interface with NAPI already disabled, so
closing it can hang in a second napi_disable().

Fix these error paths by tracking whether the data path is open and
closing the netdev through the network core after failed reinitialization.
For failed resume, release the suspended data path without disabling NAPI
again. Allow phylink to finish shutdown directly from its suspended state
without restarting a MAC whose hardware setup has failed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
These fixes were previously posted as patches 1-3 of the H616 EMAC1 v4
series. Split them into a separate net series as requested by Maxime
Chevallier. The sun8i MAC-reset change, EMAC1 binding and variant remain
in the net-next series.

Changes since that posting:
- Adapt the failed-resume fix to the net tree's older stmmac_resume()
  implementation, leaving timestamping behavior unchanged.
- Add a Fixes tag for the phylink suspend/stop handling.

Previous posting:
https://patch.msgid.link/20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com

To: Russell King <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Joakim Zhang <qiangqing.zhang@nxp.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Christian Marangi <ansuelsmth@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org

---
James Hilliard (3):
      net: phylink: allow stopping a suspended instance
      net: stmmac: close the interface after a failed MTU reopen
      net: stmmac: close the interface after failed hardware resume

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 39 ++++++++++++++++++-----
 drivers/net/phy/phylink.c                         | 16 ++++++++++
 3 files changed, 49 insertions(+), 8 deletions(-)
---
base-commit: 1e24c4f2ee44be0eee94092b5d13cbdb4bdf0d60
change-id: 20260921-submit-stmmac-reset-fixes-v1-7c98b92d29a9

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


