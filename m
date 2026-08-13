Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB13C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BOTlHuZ+ZwQpxacg2zaGuuKn6PBZaDI340LCQ90ZSUc=; b=JU7Wc+YQnDcuSAuwurksPzdQ3z
	s4nk2nu3UgHtit5fBTvBJTDSrYR1Ok1b7jCxd/mlzQxWqLqwjqydvFNTQ7BiWPQXMiPNA8Cgj+bTE
	eqX1lJsQOOPIegp7I9q06y1UqmhnfuCovToi00sEEjCwlU0Ddlm0+hncbskrA36O3IQRuLbnombcB
	vimZnrITkH6V8LBu7+q+F0q0AYpfKHGzrZrdbSVgQoUGYB2yf7mqyQaolX92lvrmRjym0lFprCCvJ
	K/xbbBnOZMBGFfDTHsufCt3AIKtDbjHw9V6RPkQRli9D9Iz1kvcsg8mVlGIo9BNcxut0L9zpjmI1V
	t69v7LGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVZs-00000000khq-0Lhf;
	Thu, 13 Aug 2026 13:34:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVZo-00000000khS-3y6b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:34:34 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ce98cb8165so11687255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628071; x=1787232871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOTlHuZ+ZwQpxacg2zaGuuKn6PBZaDI340LCQ90ZSUc=;
        b=KaO5L1EQaGQY//4HkxYb5v9UOf4YHhNgDchhK0a3uYFuC6X53NXif5psvQqrH1QSdM
         U+8+r882js8YF4qg5Cnhuw+UAJRnccC0ylwAlkDQzbyZn1Je70bPZZFjSzzllnH6XOCo
         DlO2Q4v0lScRQoA9TKYUDjRkeGW92IW7oZ6lEei5kYGDO0/LXJ5XWfZmyBlCYUwezT+c
         qCjzWZBRITepTIy9EsjnY3VSA4yZSfvXwtOYDZFeyLoNSqdFYGrnwRNfvja6uXFCSXfT
         GzYLxV6aQWx1AhVvhtecQYYYMmvkbt1vM1j8ERwaod6PqSA1zrugHtNMobvfZBWZcbpo
         Xi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628071; x=1787232871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOTlHuZ+ZwQpxacg2zaGuuKn6PBZaDI340LCQ90ZSUc=;
        b=YDYnXicNaaKPKottPGZqNCyqTpnZp7GKM2NaHBv3jnhomx3shRdmIU9omIE+dpiLSR
         pBTdnxsNzOaX4OAdUdJ7uEOJw5FTvlTiec8AQn2h8spKC+mFq7wRQjFR6NcVbvKdO83u
         +JonVOJo8QsZBZ70195Nk7q6e3lSeQtZqFJsszn9InPmJBMl7TpFQ9QqPqAYHP0GWSBA
         SlXn0veaZykAx5m8iweh9JNmhvR3XUxiCsj2WOo9J7JEXGPCxIksZ4+BJwHbOAnKypnh
         p10ycRX77coFJcvQ3jJBlw8qF37bTAGacXF1OXKFpN36hsDcRH3HFeih/e8QiGA9HRP6
         zXpg==
X-Forwarded-Encrypted: i=1; AHgh+RrdtvR/BcaHEsLqBNfEr6vvybf8KmL8yb3HAxJk5l80islnXTa9BYkaOJgp9nw+es+AJ1nxZPvn00r37xwOJAjb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt9JkIDP30hOUtsRaoXlFQjMEtuYBvlhFMBfXGh2OvzLvcikp6
	lcDHF0b+cBD4ECWo0AY1Ihvb1ZX99jAAbGfxH1md1wPqszivTYe0krkRwYL/VIuU0KE=
X-Gm-Gg: AR+sD13D08yanNzrc5U6vASSqha+v6hHLLde1bjDrkJsIQcUSonuHj6fSqUTa2C52S1
	FfHkM0nfzPmc5It0wfkZLSYB3XC5O1G0NMJK+9uzLVeLUPtaDEyRd695GbmJvaKlNzGVPc1xhJn
	HZOH4SzdDKYf5KRXdagIcE20NVoFeJaSz+By1aiYELBTCxFTq6xG0eHVwy/evJch8SfF9AhhcT2
	MXJPd6YmPudYJxpTmQxoQcEcsKQ8qIN5hDjCJUB9cdzj9HRWzbOv2jvb4l4xXCHQ0rpfYW6D+f6
	JsZMjlvEJfDYSIIilJ2LzaFOuGOnrmJ4ZY2AoNNgFJWEdLEHGbhgNvIrB/qYkHDIKEF3elroy3R
	5bgxMJqRev6rIU8DpaAmxpcev1hdFqBlnA8U+lV3Pa5aaXxBrRP+3crWFR/oEsCy+BflJIHWsVo
	IgyjiOhtuyE5KAfxsK3jJ6WWQvWU86cTcVheVI57cfSNj35eBQr5G2IIq/W5gs2v4QolA=
X-Received: by 2002:a17:902:f64e:b0:2cf:70d2:da7c with SMTP id d9443c01a7336-2d37f77fdfemr72669655ad.12.1786628071272;
        Thu, 13 Aug 2026 06:34:31 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:30 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 0/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V1 and V2
Date: Thu, 13 Aug 2026 10:33:29 -0300
Message-ID: <20260813133335.1941580-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_063432_987895_654B21EE 
X-CRM114-Status: GOOD (  10.96  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

This series adds device tree overlays for the Toradex Capacitive Touch
Display 10.1" LVDS V1 and V2 with the Verdin iMX8M Plus SoM.

The display addition covers two interface types:

- Native LCDIF (LVDS)
- DSI-to-LVDS adapter based on the SN65DSI84

This change depends on other patch series, and should be applied after
it:

- https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#t

  Adds the Toradex Capacitive Touch Display 10.1" LVDS V2 overlays for
  the Verdin AM62. This series is required because it adds the panel
  bindings for the display. It is currently in linux-next.

Leonardo Costa (6):
  arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch
    Display 10.1" LVDS
  arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter
    with 10.1" display
  arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex
    Display 10.1" LVDS
  arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch
    Display 10.1" LVDS V2
  arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter
    with the 10.1" V2 display
  arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex
    Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile        |  31 +++++
 ...zanine-panel-cap-touch-10inch-lvds-v2.dtso | 107 +++++++++++++++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso |  71 ++++++++++
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso |  94 +++++++++++++
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 129 ++++++++++++++++++
 ...verdin-panel-cap-touch-10inch-lvds-v2.dtso | 118 ++++++++++++++++
 ...mp-verdin-panel-cap-touch-10inch-lvds.dtso |  95 +++++++++++++
 7 files changed, 645 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso


