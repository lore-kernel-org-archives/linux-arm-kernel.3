Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACD9EDF152
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8qjLa07Snj3KltW2TJr3+SAb5Y1SXhPe7Ar7X2Wa5FI=; b=Q/fkZHt838dDAX
	y4IDjoiPBYI6FFRO8OHeornIUeTqjPCtPjSh8j9+ZBUHMKtVtzN2aXYSopkpvb2MzE+8U484VB/L+
	PGMyVOkUm4mWHRpt/b/FaABPHwrOek7DO3IM1LwjctKbD8a+RyzsZD/HwPa94USEn5ZjU5xvAwojt
	9mxOoPzs29pOExGkDnUjDrwAE1Obwwu7BXtrXp1/4Rt3FP8XTPHOZH18kg+rLx+gSNOD9/Ll0SaU6
	4bRXjdyvW7koWOroO9tYKF/DQMzl/wx7DcdWjnyX8sP8yE4UesVyEKsYpcLAuFVyVH8LgBWTgDL1u
	Wue4hm2pLB0IRePTWDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1m-00000003Mqu-0qgB;
	Fri, 13 Feb 2026 11:08:03 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1g-00000003Mob-2AyZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:07:58 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-388126f79bcso1912921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 03:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770980874; x=1771585674; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qjLa07Snj3KltW2TJr3+SAb5Y1SXhPe7Ar7X2Wa5FI=;
        b=ff1sNc/NnAmvC1tfNsRYQtDMB6RKVWWyZY6iwblWsVrJjcbK1ZFhslT9HW5eqF0jFF
         K6LbpfSy1lcFsbd5+ViqA1C18sPhGICo54a0AXYA9txVJBeG7PMOu1mkkXBYdtDbL3Td
         8HqPg+ncCIGBeMpbxY3XnpxAyk/uSBbr1TcpXOb3CuhGiJDnWsym+B6lQ6dk5Kx9O6RR
         6l3mNctALnWPBvV4I6VlSfIZRPY2noOidOGk0lKd3luEzXDeSv7HL6kImAE0gtYF8i9d
         67m2IvGAzEK8liaPDvH3u46IEhKaBNntveh1DVmug4fBZeLfJdKQyPnyXb8OLQOMapHe
         KQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980874; x=1771585674;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qjLa07Snj3KltW2TJr3+SAb5Y1SXhPe7Ar7X2Wa5FI=;
        b=KZMmHX5MMUOLy2QSpdu7t2UFBncETF8FUnHDL52qEj6YXZ/LRVZ9IuAIaMpoyGKrqm
         MzOvHtZOxd1iK91P8o4ZOCkmCu+6noYzwcASxtc0A/j8KYPxyMfUtBkScnkN1S2QMtbj
         gOK0ccQ3s6OhHaOTN7YuwnrA58RcHo05zNGfPRfegquGno1W+N4g1RfRR+kTSfN6WCbk
         GxGeqvu0sVyGVePfQpLpbp+xiZTPkIb4RK5qwSYkQIzSAGGsFrYDeRvwOnDJ8vvHQJet
         xuAVuPL6+fHRxq4BQr3Te+67dBfQdXh10dNmI2nEzZlnHuJ2w2tDfuCA7vui10PJPGaJ
         X5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXq+l/5NwSJXjn5aEmTjI2hpVi5ZDPmqpYSqb36YbU1Dt4h7aMIxa13CswFZPuCuLYchdIcoIyMba75liuccPUH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn77AxXQ8FY1jaup6Qay30+F0poJep+COB2g8ouEKFUBY15hVx
	kNzsReSz5ScMCabjppE8W4l6FmPa9rokwGjcQxK45rcHJxz/odX8l6OA
X-Gm-Gg: AZuq6aJP7UlWO3tbjoB3qWZa7jB+ygzB2vg/rWclwK5f9nEo6yINmuAch3hXNAW01dp
	3g7xWXub//JHuvPpbvHiCFQbXqPt6UHZVWQxU8NOzU12Ysd5gs6qOlVwkMSREkaGsQJGjrX0Jh3
	HbBDlLI0zPDWYYVbxNtP/lSKCg3TR5fmBz5/Uicb/IuSyVRkTI74/ATOqJ3NhGqYWSl80b0qtjP
	ZzYwQO6v10yk/sHj3Rri6UbReN2uB/CMoApCj0biQ3m2hU8LWMpVcIGfVUFUXhF7cwVGfgf3dMm
	aUuzL0u0PIPHDfelZE49YxOruP6NdAdkLYW0U1DpLSg9RU/4ephBUHOec6NuV94hAgqo0/qb+4B
	tZsy+WkZ3R82rAZRbtGoPyoeeHehTya9CeUyY991sD6Oc/hESLYAcD0WcXTB5j1WYSXS0S0xVM1
	cGES/st1297yCKKkKT5lszmh9Q6gajGWstaNn5eitlek+H2xem4nDrWj0vhPIlm9wCKvUR
X-Received: by 2002:a05:651c:507:b0:382:56ff:5207 with SMTP id 38308e7fff4ca-388106bd9d1mr4862141fa.36.1770980874089;
        Fri, 13 Feb 2026 03:07:54 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068924c3sm13635831fa.1.2026.02.13.03.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:07:52 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v5 0/5] I2C Mux per channel bus speed
Date: Fri, 13 Feb 2026 12:06:49 +0100
Message-Id: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13OywrCMBCF4VeRrI1MJhcbV76HuIiTqQaslVZLp
 fTdjeK1yxPy/cwgWm4St2I1G0TDXWpTfcrDzmeCDuG0Z5li3gIBLXilZUKS1bWXOwCnI2NgE0X
 +fW64TP2ztNnmfUjtpW5uz3CnHq+vBuKn0SkJEgvyJjgFXsN6X4V0XFBdiUejw49TAD8Os9s5X
 1hnKHrrpk7/OISv09l5KAJZKvMheurM2zlQWHydyS4yG0+MS0d/d47jeAccwntKRgEAAA==
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3260;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=6Zg5zzVF8oCDJTjErI+gpu9LtMPTNvBI/8T4SJ08IMw=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpjwX5HtrqcmkQPSZpwqBn6R0i9TqyIcMWVcVMk
 PpEcN1G6tWJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaY8F+QAKCRCIgE5vWV1S
 MnK7D/9iXOEt0lu1Aeo2dDh7ZbVIPwdDLEUFRVq9sonqV1yUmY3Q0eqZOZq8AARVHZVHxWQvqln
 +OS7RBmfRa7btWLF+te5ZrIQNkyVoa11KZ4KPlijkiz0LVGfQOidacqfXzrHJyMX1XdpohtbRD9
 r8ptcxhCUHSrk5VSzE31fcZxaEgeflr1T290hfRlf8JMArQz7R184gk6tSgqSvX1gTHYGoq/aze
 iSh44xgC47QDogKy6bvkaGI7zjbocQS8hqSprU/xxXom2/32Cq9+6Th3pOl8K6tbUdSwLU8RLGj
 h7BT5v3u/zoEp5R/p95pPe/rJsBVZQKvX9xn6Uj1ffQC/0B8lfZb45cup+QFpYzrFOpMcpUYWYi
 PR3bjpxIp33OO4HK6GSlFrEEK/DD66csG6dIkiV050VMJ4zPtehCx5IG+OK84sRrJDfAYUV4bgh
 2psciGnK3gwrBN9J2cIBNr8mtRs97NNnt/bWHqzaNjN99Mt73G/TuqQTS2HLHzvPcfSMqANlr1A
 O+QqOXFSJRCOi5p+fsGWpw9fSgfLMkBCgNTC/OixPMp2ow2X6pMSdb6nWiCfR8YmjmTx43/dh0D
 uS1sEB2lvZySAAbhp+9LCpWbdYR+LHq3Xh83ITrIHPyBVABAprH3lOCrrIrjJqv8r43feZd5HT7
 pMrPfNS+tLl6jFw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_030756_863495_7669CA0D 
X-CRM114-Status: GOOD (  18.42  )
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

This was a RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.
As no major complaints on the design came up during the review, I
decided to submit the series without the RFC tag.

The benefit with this feature is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #5.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

This patchset has been used and tested heavily the last months
on a custom board based on a da850 (DaVinci) platform.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #4 Implement set_clk_freq for the i2c-davinci driver
Parch #5 Update documentation with this feature

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v5:
- Take the lock of the top-most mutex locked mux to make sure that the
  root is locked
- Link to v4: https://lore.kernel.org/r/20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com

Changes in v4:
- Rebase on master
- Swap order for printing warning about "channel %u is slower than
  parent on a non parent-locked mux\n"
- Fix typo in comment, adaper->adapter
- Link to v3: https://lore.kernel.org/r/20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com

Changes in v3:
- Return -EINVAL if channel is faster than parent (kernel test robot)
- Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd956@gmail.com

Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golaszewski)
- Removed idle_state from mux core (Peter Rosin)
- Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a610930@gmail.com

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  41 ++++++---
 drivers/i2c/i2c-mux.c              | 145 +++++++++++++++++++++++++++---
 include/linux/i2c.h                |  13 +++
 4 files changed, 353 insertions(+), 22 deletions(-)
---
base-commit: 1f97d9dcf53649c41c33227b345a36902cbb08ad
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


