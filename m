Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AD9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 01:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9cOKDvsufxQGk9XeiIZRCmZ8VGYdEpdgIWI857YjLG0=; b=jGjVkfNFHhaOn4
	uqVZC4TozPaUZ/q3Uj0V9qMPXz/tgOCxyD4Pzau9KitupwDuJAu0U8FNfYkm1vghBomNkR7loxD+6
	znTcPJk0LvKXWzXoiZg0B3EyWNvrrmo0tt+Q75ChirqqkIkRfwh9AuXRJIjQX4BO/Nx9uD7zhqD4M
	nPd5ojGlgM4IN7wMlx5tTFZkE5IuR1e9b/cA4l+txAxFXyXw+Q12vytXQl87RlH05huD370Rvwlso
	K1Vos85jYwFHXYBtg+T2nQaDiNbnFXtAMRWfeDgsaCR17SieMi7D9SBqPZ9B/7KpeJL4wZBWoJCEd
	5BxKpDJ2Eu0ixTUiaX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9K-0000000BBzQ-1Fpq;
	Mon, 06 Jul 2026 01:29:30 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9I-0000000BBxc-05Mk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 01:29:29 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c96d2bebca3so1270515a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 18:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783301367; x=1783906167; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cOKDvsufxQGk9XeiIZRCmZ8VGYdEpdgIWI857YjLG0=;
        b=C8C2bfsa/Rlhhn9Fey+MYKCHCYXKyYR1R5HV64uLtd39hyS6A7507ajqPEnho5lCkv
         8ZJsKlC/AfyxQaV8uTy3j+2N0tZVBMxycOHmmN+/DwqlXQBnIsxmsGa36uq6V+MLpcbw
         ibyw+Mc7dXNzdfSVhwxl7m+YyOZ+i8rzVr08T0zkNnZWhj2xC0TTZXy96zMXxc0WK+ca
         IPFWSbRr2ram27q3FB+5VsTgjMpGKyZ38fCrTbzaoghoaQIW4ZkW2zp2wKqu7f26osC0
         ak687sKvK4Mfj4jrE4CrbvxIMiZRzXo6ygqyQ6zZAiYGGkbL2mdzbwtCKVe0T5u/55XJ
         Dn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783301367; x=1783906167;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cOKDvsufxQGk9XeiIZRCmZ8VGYdEpdgIWI857YjLG0=;
        b=JaC0b2G81YA6gG7vM95iln0Moc1X8lrkqBrU8aFdUARblor/pnE5SuwLWnwA8y4MdV
         aVqgWNBdcn1r2tQET50NC6ew0mJzbB50VTCrMdvU6XeejuyGAnG6Xedf6Vs1Qwl+Akrv
         P7oZ/DnjKfqiEkDA0dzw9k7fxadU9zaG3gFTfzGJq3fFYF5SVS9JwHWAyM9oUiDYOzj1
         qvSIebppMkHONWQ2lri4+ho4uHHmpPAWAI/ZODF6Yb/zSfcnJ1XIWxeMWb6FHdDa98R9
         5W/TlGWzD4DzcXqARVZ5q8ngFWSfMdg32mHF40DkANURUWWJJTmu0BEufksNVZA7ia7r
         otDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmYknTcwIs6fMkUhL+SzyGQ6P3RWwgkbHDL/j2X9idla3bGhoHVu3I0R9PoA16OnkFC7MJabWItRNEHWYCWo9A@lists.infradead.org
X-Gm-Message-State: AOJu0YzhSgJMhS8fzdLp39CtYUMfKluClpvdj6IoYlCnweLm914xZ9ZX
	FKVWgvZfuJb/tyYQqhfcw4epMeiDI/c5/+oebnzvgKTdOQWZrqyOjOvnyl+iTw==
X-Gm-Gg: AfdE7cmo5YWqtvuXbk75rhEeaDjSV77ogK3cdyK/Ic2fj0zQbAlf9KaXME7tUzZE2ec
	EPwF4cfu6n57NX3CWnjkDDguwAyZRsNoYCIY45av31M7nEYXjYB7ONC4v1K2Amlcmtad10jrJFJ
	ln/A+zT6VFPlXl9rijrkfSHrcZLRDOkRwQyE8/c7APRi4vHGkDl/PaoffWtTk9XETky5gjxfBeI
	mCskasy1H5eKKkTN8IGplULY+L5Vdanm0Z1Of+DZITdT6c2HTGxQ0dlI2gXKa92vewD+q5WQBdy
	j+hVA7ls4Bm7DMTWHq7Xx9dExbODVEs43kdPDuxIlEDbw0m+H7+e2XoOdnTVpYrwwfBQHmU9+gU
	TvHF4KH1S2twQBXsmDs8H5MZrZSU5DXxCS0xfoqQ3WGIRzJL6zUhKIyLjLkqjd8Rlo6Alt2gFrX
	PacJk6W0HaglnxkygIa0qK94pL2AjxmFcC/RFP2t/g+qWr4TE9Mb9rlKj3R3E/IJpG+eAB4GwfL
	a84v0AXtcJUKQ==
X-Received: by 2002:a05:6a21:6da9:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3c03e290082mr9979127637.17.1783301367094;
        Sun, 05 Jul 2026 18:29:27 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:bf6:81d1:bcfe:9d1c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63084524c88.1.2026.07.05.18.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:29:26 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/7] ARM: orion: convert legacy gpio-keys to software nodes
Date: Sun, 05 Jul 2026 18:29:17 -0700
Message-Id: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO0ES2oC/yXMUQrCMBCE4auUfXYhicUaryI+pO2oK5hIttZA6
 d0b9fGDmX8hRRYonZqFMmZRSbHC7hoa7iHewDJWkzPuYDrTcsp1wc+5O5ZiWD8xjWAP3wZ4uw/
 OUr2+Mq5Sftnz5W999w8M07dF67oBFUFBjXgAAAA=
X-Change-ID: 20260704-orion-mv78xx0-swnode-9e94ae913a21
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_182928_066035_5634CCEF 
X-CRM114-Status: UNSURE (   9.46  )
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

This patch series converts Marvell Orion and MV78xx0 board setup files
from legacy platform data to software nodes with the eventual goal of
dropping support for legacy gpio API and platform data from gpio-keys
driver.

The series registers static software nodes for Orion GPIO controllers
during gpiochip registration in orion_gpio_init(), allowing board setups
to reference GPIO controllers via PROPERTY_ENTRY_GPIO(). It then converts
gpio-keys setups to software nodes across MV78xx0 and Orion5x boards
(Buffalo WXL, DNS-323, MV2120, Net2Big, QNAP TS-209, and TS-409).

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (7):
      ARM: orion: register software nodes for GPIO chips
      ARM: mv78xx0: buffalo-wxl: convert gpio-keys to use software nodes
      ARM: orion5x: dns323: convert gpio-keys to use software nodes
      ARM: orion5x: mv2120: convert gpio-keys to use software nodes
      ARM: orion5x: net2big: convert gpio-keys to use software nodes
      ARM: orion5x: ts209: convert gpio-keys to use software nodes
      ARM: orion5x: ts409: convert gpio-keys to use software nodes

 arch/arm/mach-mv78xx0/buffalo-wxl-setup.c     | 50 ++++++++------
 arch/arm/mach-orion5x/dns323-setup.c          | 98 +++++++++++++++++----------
 arch/arm/mach-orion5x/mv2120-setup.c          | 68 ++++++++++++-------
 arch/arm/mach-orion5x/net2big-setup.c         | 94 ++++++++++++++++---------
 arch/arm/mach-orion5x/ts209-setup.c           | 70 ++++++++++++-------
 arch/arm/mach-orion5x/ts409-setup.c           | 69 ++++++++++++-------
 arch/arm/plat-orion/gpio.c                    | 10 +++
 arch/arm/plat-orion/include/plat/orion-gpio.h |  3 +
 8 files changed, 303 insertions(+), 159 deletions(-)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260704-orion-mv78xx0-swnode-9e94ae913a21

Thanks.

-- 
Dmitry


