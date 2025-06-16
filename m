Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B76CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vFu6VBmeq/w4W0+U2cqQ9ftqsZ6qKfNlKR84sMlRxPs=; b=rcC5pP8+xFvosM
	yXMSfCnt7XgBHcPZQdSl3F0unH5VTrxo4ipPYYR3XVDh2L/jwV9zdxAUX1LOPIC92xI0NRcbnmLOE
	L2xwkQWEGpafQcClgyZApALJbarsiyd+xy1PViI92dIzlt5ND4FwsIDcbMtsHXgkDzw4VSG7YZ1f/
	K1mSJrk9y4+6K1BmLtLJXEO0RsRtzAQkxf+Xrfo1K+pxaak50ED9k+ezoQ/Kao+HhzuTdDHULm10L
	KCU955raeD9QLub3Ij6fL0jeJu1PwtR2JnmO1zHkgyIvWo0kndSReOFGabeQvrVnAeInktYxBq6BX
	e/Dgi4Xr727Wcbp+d9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4LN-00000003ejY-1wo2;
	Mon, 16 Jun 2025 07:33:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4CT-00000003dCX-0h6f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:24:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso825141f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058651; x=1750663451; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFu6VBmeq/w4W0+U2cqQ9ftqsZ6qKfNlKR84sMlRxPs=;
        b=QoOSUsVGHpPsKHBhBIwRbcso2rZwLz2rmidU5dkc9XHqsUZO2rCXWr9d3mWmdbOOp2
         AMhR17ZE6XB7dz9NkXfaysDOH40DPh7OfC7OD3T6fnR8NprvwBHNf0IKbq6pbvRCJQya
         F5ugJa9gCxx3Uqlvf8WflLt0prY/gCkSmtotejym4vr5cyZErvhGSJtyFIojeOufDYCV
         h89j2A0Qm03Ur/n3L9AljQThUlzEUIsaTmA2LjTBPu5de+Gk6JIM8BPoK3JKbwO+GZRt
         Z3RXkM9IgThbLhXGDXFC5wIqo6sgQl3f+Vwya/Ve5DcF/qZ1ZE+2Jp9QmaXgzwUcyF6d
         wadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058651; x=1750663451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFu6VBmeq/w4W0+U2cqQ9ftqsZ6qKfNlKR84sMlRxPs=;
        b=ERE4eOMcCaI0tZ4mxwRz3E1ZsBNVLReT82urahzO/D6J5/dJ9k2qLFXvO+ojQUYlNc
         eJ9Gl8HQZW+m7o2KNXDV4AC0u6aYeHmo6tTvsU0cW4K2aAG7T9qydXMgKl/Y1a1MJpeE
         paabcOdgY5gZLTacpB31GW+Qz+eB0CawI9zqcXk6ogj6mvaPbbRyXnOmRVPVDlepR3oz
         XyQbdHLEeUb29PfaB92wIRHLhYmlDz5OIX/SZPdvgi8/sYUMYEZloRvcDylWRh82D7cD
         yFIBsqZaBxg6WmgJ/IX7iZNTbOXnssoSDGWJx/OYICTCVT8+bM98CgGyzJYGwkIe8fMz
         aawA==
X-Forwarded-Encrypted: i=1; AJvYcCX/XVgo2eWDLThSmzBIBt+ASyxPgms7+bnPN34Fqalf624/+7kAqoOcRYScbtzp0dUmlJ12lBKdUERjtdWSUKlu@lists.infradead.org
X-Gm-Message-State: AOJu0YybuKCXL4SDVxfxtaGkh3bnwOoKagWnLL48nqhCwzeYq37ptYrx
	OXjLatyIX9oucR5koLgM4s7C+H8b6YsgvfkPOmOpizNMqmrNjXUHOi2HJuSVHM+bkC4=
X-Gm-Gg: ASbGncsfwgL/uRBonptqwzBbioIMAFHhc6Ee0xFQdQ9rpB80PnLbpKg6lyCmr4hY6l/
	+dYhDw3EfC7xNLwiSn73Iu7LVcwPnhBCENl7wi1H2fVEMiO2698rDb5tRwrLuHI1h7pMDsVcARh
	Xsj9vwFIhzVqcyQh9AEa/ot61x5aXhW4CPrScneU9s9irwplGm4jrlXlPCjxSqFjP4XjaACKwl3
	xv+Sa552etHtLNQNe4PjYDfydpKCtSbCPGwF6rg8W918ns5yhol068s42kNZRLZnYBQVo1YH/BU
	4DKA8+eQ+2hvOiaHSTOc2nBvxGuPw2oedvBOHW8bPC7XSc/a9KPKl5sy7oeVz4RUOeA=
X-Google-Smtp-Source: AGHT+IGOQ/05R6rCvIZwn3dIA2Nugc/IsmfEl2HAgh9BK3DzCi3R0HMyStiSUVCIGzVyM4FshOI6yQ==
X-Received: by 2002:a05:6000:2507:b0:3a4:efc0:c90b with SMTP id ffacd0b85a97d-3a5723974e2mr7184735f8f.15.1750058651143;
        Mon, 16 Jun 2025 00:24:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/5] net: use new GPIO line value setter callbacks
Date: Mon, 16 Jun 2025 09:24:03 +0200
Message-Id: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJPGT2gC/22NwQrCMBBEf6Xs2ZUk2sR68j+kh5pu2wVJyqYEp
 fTfjfXqaXgD82aFRMKU4FqtIJQ5cQwFzKECP3VhJOS+MBhlalUbh+PM0U88Y6IFJWMo0ZB7NLo
 7m8F5KMtZaODXbr23hSdOS5T3fpL1t/35rFZ/fVmjwlNt7aXvtXd2uD05dBKPUUZot237AKUyb
 PG3AAAA
X-Change-ID: 20250527-gpiochip-set-rv-net-9e7b91a42f7c
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uR2GGIFJoNUWja26+eqtvHQqGtdircsCPqOzrEceufw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aYW4MUwvKOocqHKQFcXvihCO599Xx46HuuP
 BdHcdXSED+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmAAKCRARpy6gFHHX
 cvZBD/0aIizVMfAcrRGn+eGFgxroefc64UEncpO5XRYZr4fpLreEOW/l/6kJdsUC3ln+H5m7qyd
 afXzJbi7dzgzaaakQc0F1Yl+Xk3ybyaO9jL9EijyiRnrThzoYCuJEn2/uLHV+NK8n+mMWa6/vmU
 4iKlPXYrPpKMMp4vF5r6UBKlFKQd68CXKBqaUvLQlq5NK4K8hFyMVxGngeVomNZJEOs8Xb/RNae
 CY2grMseA4NDMv0+JNPAEoFFPvYDyhLjm9jSZdwXItdJJJ9Hxs4SoAo+hrS9mI1nFETaXK95JII
 K5lzvRb8Gaciin93TS4nnmpboRPiyKHjjNjG3f6G9bMD9N4O1ZhsJdidluXfoYINmbuECVCmhBo
 oI8F4ba9fca7wCeBSvTpopmVe055GxvDiUoX1Pf4BrEEqXdIU1O3d2yadpQcrNqc8M2NJmnuVwe
 HcEjM/EZiESaur6u6pva7RjUNFK0AyVWHaRy1BQO66SK7Z867KEhTyFW4Ktc05qPpzXJY+nUvV/
 8RMUio65JmAVSUOsG1GzV48Zh1dlS46nqyItSAiEje8/saGqMuCqVyyMK1jZT/wYP576NtkqcXf
 +iiCZPwC1n6roZHDTuirFnU5fInYX3zemFdlV9BGW4VaG3RuwHRHuDuP0FlLi4HraM9oJSfXHh8
 Ez87K2sH4EmaVOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_002413_223600_112B9933 
X-CRM114-Status: GOOD (  10.64  )
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

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/net/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- propagate the return value of mcp251x_spi_write() in the mcp251x
  driver up to the new GPIO callbacks (and the old request() too)
- check the return value of phy_read_mmd() as well in qca807x
- Link to v1: https://lore.kernel.org/r/20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org

---
Bartosz Golaszewski (5):
      net: dsa: vsc73xx: use new GPIO line value setter callbacks
      net: dsa: mt7530: use new GPIO line value setter callbacks
      net: can: mcp251x: propagate the return value of mcp251x_spi_write()
      net: can: mcp251x: use new GPIO line value setter callbacks
      net: phy: qca807x: use new GPIO line value setter callbacks

 drivers/net/can/spi/mcp251x.c          | 37 +++++++++++++++++++++++-----------
 drivers/net/dsa/mt7530.c               |  6 ++++--
 drivers/net/dsa/vitesse-vsc73xx-core.c | 10 ++++-----
 drivers/net/phy/qcom/qca807x.c         | 13 ++++++------
 4 files changed, 41 insertions(+), 25 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-net-9e7b91a42f7c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


