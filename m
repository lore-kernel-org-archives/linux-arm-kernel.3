Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8953CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FL4ZfQetDLny0SAdvUxGm2UtwwSFvWNNL5D/nGtc7bY=; b=hObQ/wzrzeaZfh
	bjBPYjNvqziPlqoHQvLuWS7clAwGebJKQJ9PAlkbOSOqH3fccoh67T3zmboyJ4HkWbCJOji0CkV7j
	9Os5zZZus6a7WMReLfsGjGqyFr9WWinIvzzVCk+ZEsetcJHCkyx/bNg63lNTSKoAZSoM5Or1n4QYu
	1YQj/Ldl1sLhHYDyCckxwff4CxdQmbnu+1N4l6RbDuBcJLJW/OLzziJ6Q2CBF/tDAGgXb7zh6FqD5
	I4UX1BtIqOyN5iwWd0susdqPD5jINjDML2/oAeRAyPVUSaRzrmOwmXMNb9WPpA2sjZHrf2tEgkY0N
	cWFMhF/Wlm3RK37/xy+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXbd-0000000GI1D-498z;
	Sat, 13 Sep 2025 21:16:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXba-0000000GHzv-3Ssd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:16:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45decc9e83dso18255725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798181; x=1758402981; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FL4ZfQetDLny0SAdvUxGm2UtwwSFvWNNL5D/nGtc7bY=;
        b=K0I8BpjVGpppFSB1ECZHc5ViL7yMAwuOv+GLhAYQiVi0wr0vHj04zSrtL+cCNPH63d
         55EvVMEoXrBdVAbCT67GlzkLJf0lK/+diXvC4flK6C/jTDgjIPXRJldXv9/EglrjG1Qc
         SvRercRMYpF5xot/IV3H9cQyzcHY2yj9D6JKHgwvDJkvfKi+2PZIXBWlG5iMy5ZD55/v
         agaWIu3ubGYmBKhud8y+bBTvqc8YFh8sc3bY7b7HNHSXWU5+eEy8l/CWH28VtfxOzWza
         lrwDI5hTJrzDH0BfSu+U0G03VI1K0xz7OC0WzpWul0hkJTCs9mGwJDglgQNogVpTCSG6
         ODbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798181; x=1758402981;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FL4ZfQetDLny0SAdvUxGm2UtwwSFvWNNL5D/nGtc7bY=;
        b=S3yeIbFUE0lVXlqL9y0h48e8lG5P29gUHNJMPQk6B6XHU52BZzLsSRdk6t0Q+KhQ1w
         lgDEC1AJloKuigCqbMZ8CE4BHpDGGxhvdcUagiKqAU4+SLhl7LH3g3gqOWF95RdQ8dGy
         0AVtgv5Zu540Nu/ysuBdYhPB9+EGnIrHdIG/kRU2Kjgbsh4b6edoGP3wv/BWAnIuh/Ra
         +bEVD5oKJ/zOvUVo8rydnUBhb3KBZNQaDFdkxYXxtWsXexmvgpoYS9tEw8OHAv90iVu/
         yB+83BLZfeueclI1IxZcK3QJH1cDqSONF+Ii782bNf1AlbKCiBX494HxTIDay+vPL4F6
         VZgA==
X-Forwarded-Encrypted: i=1; AJvYcCVpno8t8VNjvzmHAFmQThE9J6Cq/Do56ncic/FcbvWkLXiOX802oDyLfZwCqqHgq0KHfaRk+lae/ba7zeDT1JH2@lists.infradead.org
X-Gm-Message-State: AOJu0YyympBlSgmrEA5dfdspvcwXbJR5EIp4e4CCh2Ghma+1HsMc6ceT
	E/9IsF9XYk4T7H2ysX2w2Tf+Vu6frO1zHT9YBbTIudpYYoBcMyCP1HPJ
X-Gm-Gg: ASbGncvLcA5BRcfFTEUsKGgJxETyFZ1ww1zuiinxTmtgmrNqM/7/FoiVRKFkxkqQq5j
	wIURSwWitF4VQco5zy6iS0OCf186lZk62mLrD9rlSUiiq5UOq3ioVc63X0kfyF5Y35yxAWLUQqx
	r1ikV6gkQZBT8RJ/fis/IhEmllQj61YT4lVuDWfqp9ae+9aTl862bP2zC5mUTTYXQCZ+dl7nsGF
	9muUlmYq4svt9/D8wUNz7sHz8TGmfIEm9RFFUA/dBIW+tzBflAAmN9/SoYOCC+YSWk3KUvnULFZ
	ys8EOCP5QQ6HJCv3t7NDrxp/vYbQE2tUmGjKryPcKPQGL3oK2ss+YbW7tcQdxPeQIrn5IXT6hi2
	GsyxUx2CMg4ZtsYeKlvLtFjj8PbeBypWN1jXOTGi8Hg==
X-Google-Smtp-Source: AGHT+IFSzRmP9ZjHIjUVjf8clDm3UnyBhZdE1uuyQ69zI3ytWPwOS582vzr0QJUt7Jd9hnVlvfQiDA==
X-Received: by 2002:a05:600c:6dc8:b0:45d:f88f:9304 with SMTP id 5b1f17b1804b1-45f211fbf54mr52945275e9.30.1757798180367;
        Sat, 13 Sep 2025 14:16:20 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e014ac468sm65403145e9.0.2025.09.13.14.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:16:19 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH v4 0/4] Marvell PXA1908 power domains
Date: Sat, 13 Sep 2025 23:12:47 +0200
Message-Id: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE/exWgC/3XOTQqDMBAF4KtI1k3JTPxLV71H6SImY02hKtoGr
 Xj3RqEg0i5m8Qbex5tYT52jnp2iiXXkXe+aOoT4EDFT6fpG3NmQGQpMRC4kbwcNSuT8RnVrOSQ
 KclskmArDQqftqHTD6l2uIVeufzbduPIelu9XSneSBy44pLFQUqjSZHi2rzs9XBjReGeOw/hmi
 +hxoyDsFQwKFToGSdaGWf8UuVXUXpFBQa2NXg4z+KXM8/wB3gylqT4BAAA=
X-Change-ID: 20250803-pxa1908-genpd-15918db5260c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=NFuqNBQauhkiyeY7IkiHmVa5Tu4iy3YfrYEFWAqHXWU=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlH7yuF9s7vMfgZzqzvorz3b0xhim5akoa5/JqgLr07z
 okfFjh2lLIwiHExyIopsuT+d7zG+1lk6/bsZQYwc1iZQIYwcHEKwEQ2XGP477fhfNizJWKTv/lu
 9Wqbq64YNXnbHw3jVfyutnPvGS6ek8fw35+VS5k14Mck5YCvPktemd+7cvbT2UVZmf3TrVNevvH
 dwAMA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_141622_883234_0133432D 
X-CRM114-Status: GOOD (  10.73  )
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

This series implements support for the power domains found in Marvell's
PXA1908 SoC. The domains control power for the graphics, video and image
processors along with the DSI PHY.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v4:
- Address maintainer comments
- Rebase on v6.17-rc5
- Link to v3: https://lore.kernel.org/r/20250829-pxa1908-genpd-v3-0-2aacaaaca271@dujemihanovic.xyz

Changes in v3:
- Move driver back to pmdomain subsystem
- Instantiate using auxiliary bus
- Small fixes and refactors
- Rebase on v6.17-rc3
- Link to v2: https://lore.kernel.org/r/20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz

Changes in v2:
- Move driver to clk subsystem (domains are instantiated by clock
  driver)
- Drop power controller schema
- Drop RFC prefix
- Rebase on v6.17-rc2
- Link to v1: https://lore.kernel.org/r/20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz

---
Duje Mihanović (4):
      dt-bindings: clock: marvell,pxa1908: Add syscon compatible to apmu
      pmdomain: marvell: Add PXA1908 power domains
      clk: mmp: pxa1908: Instantiate power driver through auxiliary bus
      arm64: dts: marvell: pxa1908: Add power domains

 .../devicetree/bindings/clock/marvell,pxa1908.yaml |  30 ++-
 MAINTAINERS                                        |   4 +
 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts |   1 +
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |   5 +-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/mmp/Kconfig                            |  10 +
 drivers/clk/mmp/Makefile                           |   5 +-
 drivers/clk/mmp/clk-pxa1908-apmu.c                 |   7 +
 drivers/pmdomain/Kconfig                           |   1 +
 drivers/pmdomain/Makefile                          |   1 +
 drivers/pmdomain/marvell/Kconfig                   |  18 ++
 drivers/pmdomain/marvell/Makefile                  |   3 +
 .../pmdomain/marvell/pxa1908-power-controller.c    | 274 +++++++++++++++++++++
 include/dt-bindings/power/marvell,pxa1908-power.h  |  17 ++
 14 files changed, 369 insertions(+), 8 deletions(-)
---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250803-pxa1908-genpd-15918db5260c

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


