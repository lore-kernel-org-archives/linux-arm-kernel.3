Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE97E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ztH4Cp+TWuFNo+T9DDOJEU6MuEj49P+cJhTlURsWNmM=; b=XhVo+Hf4WcqO2Ov3znZKHDTIcg
	ofjD5kDAv/Kvptrc5N0fvUU+OFo3WdJDkxq55ba7Wi+a5uiHN/fMxEB/quXi3kV1cF+yW648eXCOv
	Ir9qA5ecMDtZx/u4NmmYMtjGZJgLFTbfZBR+WV55Pj9/QW7SpkTMqSEylGHP8RMP28FRkLQmo6I32
	K/td4v0BqVbSoUmwTZeZn5lKwav1DB4ItM0s1IkAl6XTiwkMAdcXB1VJ53+F/+V9hBvJHqMgoKjHT
	kiaWiusznrjCp8CknDPGQGHWKb2zo6ZEFOAVOMRNdUndO+jLtfixGHXMlHLiZaYtr3eHHlHTL0VUS
	T8tLfmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tScMK-00000007GXo-0d9m;
	Tue, 31 Dec 2024 13:32:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tScL1-00000007GNL-4AjR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 13:31:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436381876e2so14916605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 05:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651870; x=1736256670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztH4Cp+TWuFNo+T9DDOJEU6MuEj49P+cJhTlURsWNmM=;
        b=C90u6YzmigdJ4g6mb/BT8CxLMTQ+gCRR1gjh/Mw3siRy9Pvy8k47Tl6zTFnn+mQgZo
         IKvfqNa2y51KC/Kx3JQVtXqNOZcIWuTAKxH1yUhLsBBP+ziuZRJdUmcIcEn6cY4XRDaq
         FWhhfCfjnBE24CPVVgsKVw5PYttqZZhRUtAlcmljeCBF4bwQNYC5pIkKKd/NUINh9v5X
         qd/RS6P50FR0vKDKYGq/cjJ4DKqevlPxIlGBsKT7JSEcrcDGazy1EWHchPOywTLq04+B
         VyfvzwrQIKKjjSBe+CC3Mo72M0GBO+IG76WAGXP5mKwDeaPnz9OtXqhB60yemg4MKJZB
         k5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651870; x=1736256670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztH4Cp+TWuFNo+T9DDOJEU6MuEj49P+cJhTlURsWNmM=;
        b=GfdLwKSTiRR+CccYVkdHxwmcILzp5zmqbM5WI5cC3KwWfrQZ6dPfryT9ECv+qfooR3
         UOpysabevL6DcEG8KIExplzgR+9LrVTQN8tfENHI8Ks0jAhYIArhCGz1mI4mY2sVGbd/
         C1d6AKpJ+n7uNKXyFhhIboNxAc8qqeWYvYaTWU7ZY6Ia+VV3yA2quuk+1j0HgvAmAb53
         j27hSckCtnBRfaQhVL3V22ooW0Cemlvf9JJK2I/gZSDzQVOKAI3mIv9qmVDEwnWHI7co
         EZzs+UvToZ6VyvwXT1im9EGm6x9w135QPc7TfOPbbAQrd3VIsHw8Tdh72klWWxvL3wrg
         3zEw==
X-Forwarded-Encrypted: i=1; AJvYcCVfM+dQOKuKdxAO9lc9xEVZ+u39oPrANXp4a9vAN5bURje+vidzke+66FdohRPOXyonU2W5EkR3TzxbwVJC+Ps2@lists.infradead.org
X-Gm-Message-State: AOJu0YwMRizhOpbeBppFAnK2ag4pfUMqMwCs5fMjMty+5gQ2N+Bno/VP
	jACV9DfGG0SKGABQdFve/MlAd/cixlxA8dnJ5w28Tu9aU4PrOb5MEXHPuNoorrQ=
X-Gm-Gg: ASbGncuAYjm+x01kUsi6+AGwx1N4Rsvfp2D7vGiA3VF9C19igJRIJsAVHf7mcCaoNex
	66gEu9GHqwcClv0qdNmtfFYkZ+FyxK5DjSEiH3Z18bt68+imsr2FPqGlOf8WzVkWdJEVsPDLItb
	6GDXFtN114kXlDI5iXiLUc/zqev6Za6Fs16B3Dw0WQsi+mKQpSXI/0vxemPhWoK+xCKe/TNjSww
	XVajXtnNuShz3LNNxNV2855DsmPFK4GmZXSvNO//BKyH5A/13/p2ng7hWt/6k5TgeXfbP8=
X-Google-Smtp-Source: AGHT+IHi7+HrBv4JJTi9gtZfiRBlA81Co2JS3S9Apnra+hVXLLciWPy9sGqyudamix3ncbI9k0mZwA==
X-Received: by 2002:a05:600c:1d1f:b0:42c:c0d8:bf49 with SMTP id 5b1f17b1804b1-43667921f0fmr138879685e9.0.1735651870488;
        Tue, 31 Dec 2024 05:31:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c515sm390740305e9.30.2024.12.31.05.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:31:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.14
Date: Tue, 31 Dec 2024 14:31:05 +0100
Message-ID: <20241231133106.136237-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_053112_136641_E756704A 
X-CRM114-Status: UNSURE (   8.02  )
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

Hi,

Fixes for old issues, not critical, so not worth current RC.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.14

for you to fetch changes up to 0ebb1e9e1b12ddcb86105a14b59ccbed76b6ce00:

  pinctrl: samsung: update child reference drop comment (2024-12-02 15:11:54 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.14

Two fixes for very old issues around error handling and also one
cleanup.

----------------------------------------------------------------
Christophe JAILLET (1):
      pinctrl: samsung: Fix irq handling if an error occurs in exynos_irq_demux_eint16_31()

Javier Carrasco (2):
      pinctrl: samsung: fix fwnode refcount cleanup if platform_get_irq_optional() fails
      pinctrl: samsung: update child reference drop comment

 drivers/pinctrl/samsung/pinctrl-exynos.c  | 3 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

