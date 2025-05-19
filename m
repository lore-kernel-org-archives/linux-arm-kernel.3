Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E25C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h52ZvInZ2ZKG98XTL5i3CaIBIWLDrbmN3XBHdiyAOzs=; b=kODNxwmygXXZ8NLjVrz/XjdsH9
	B77PdCx/QL9oeF46J6L7LdB4zDE+MqNHMVSzWtuk7bqWkxbjdJq3LDhtr+5p0AyiYtz+DGtoTF5eY
	qfavGIg6DPZn8CiaZDjb0Mw8XUiEWjcz560almDC7n1A1r3Sr0XGntjM3IHTxeKWslkEjHZF4QDJB
	471/xUGxGSxexUDNIhFlM9nYnsR197Y6VbhdRuGlY1XhND4xJUM9BWHf3LbZga9LElBrsTfmzNBqY
	yBag2BWvKK2Us118xwxvR2HQ/qO0XfNukQc/JTyMx2wFNnSX1TN35OaD7SsS8sIeAHFohvt69Fl3A
	pHkUlZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4kJ-0000000A381-13F6;
	Mon, 19 May 2025 17:57:51 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH461-00000009w2W-2SD9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:16:15 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-5242f137a1eso1382452e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747674972; x=1748279772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h52ZvInZ2ZKG98XTL5i3CaIBIWLDrbmN3XBHdiyAOzs=;
        b=DVYiBuFuA9xEdtlEX6opG1gffJWBPxUbK6VuUY1HUwY3yc+ezyWZQKMtPBkj8z7Vam
         /D5n9C9jCXWSa8/JKQN8BTmcEPmhGpxSTpiUvv0p/o3NLn4ZTQTOBoVpFZhYb74qDy/O
         yd2kt0+6kIVA3Us5s4YuXwm+/cJwsnfxlHyBg0XsTpjoZEXY+2chfoogzoilKRN5n/s6
         GRNIEkd06sq8aMhw0u6Ft4+y5dLUTE5Dv9BB1N7+mQ5xgePMlVFAfizPIP64rw33yP0I
         y+e1mQ0IKShijp9Z50k3ZqP9TrmkzGpH4IaG+qJlMfIoI9/qIRdLjoCiESlYau/ZfT65
         7LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674972; x=1748279772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h52ZvInZ2ZKG98XTL5i3CaIBIWLDrbmN3XBHdiyAOzs=;
        b=GQ/rgsqu22V/VnFg7pw4bCsS3FJxia6eGJnp0khhq+3eSfZzsvTqgF8uPSNG5EKPgb
         OQLVG29k5RkYXVPngCMTd4dP7aSkncks83/8QrvK/H6Yv9wMcFQy8NafCWC58SCejz2L
         KmzQNSReAeXtosEbtZ8YFJdyzArli002h+oUFnOvTp5XiyXgMuQ3uwcJ06ssMwl/Do2V
         coOuXt+k+LET8yOBbTYMV75DlW7pIApJuQ7U3N7uhSn2wOWqAs0OQz29zLKSTTkCchFK
         5rp6AGWwFDoglWDJqblaUkqP6DC4+zLyb3nF9uSWkNRSjttkUJSt+6TvjvEOvpc7C8f2
         vNoA==
X-Forwarded-Encrypted: i=1; AJvYcCV9XIPPEIq9MuWoG49bOIqrAoIOkLy/iyJTAO4JkGlgOGrOvrnmNSlHzas/7S/cLajp3h3H0I8+wtNpK4e62+QZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyNnyv+4/YF0B50bFrR/vLYs0s0mgAPy0iOU8REesymhQJQGsqd
	XNjDjZp0xtum2aSMQXkbjkfVXBG3fiEoKkm5RqHJcJ7lU5OAcVkOdN5Q
X-Gm-Gg: ASbGnctudlkJiqCbFRr1SvcD7zaw7ZdgI9t0FPCpIdkCMEr1Z9TqIQpDimBMLRDOG+o
	KM3H9u9g48Ohv5cKWB9mmzMOHUO5WYh7+L+w8hD0rH0qd89721xTm3Zln5frx8sPc/CdOiSuEPH
	QQt46F2etIvGTjPTRJcoBOEREy+3rp95XnlVWjhoSWTnsjRMVpSBImvDnb5Do8640+E6zsV4t2Q
	k71zfke1BfqprKirJjR+36KMwiTt1GVAw4kYYuuNIq6xDXtj2FF8ZUd75xwKVRV1BoygCJG46PQ
	8WwZTDXnDjAATEwHUaFYZ2SPX0IA5xyu41SXrjI0Jld5kw3iT7hArYidwlYkaQ/+kQbpP72ejQ=
	=
X-Google-Smtp-Source: AGHT+IHxO6Q7pyZ10Rjc58jJYNwEv+Q71o6gZRhjB80LZXE2hgkkj3DboWPcXP74AuftkJZQLczGHQ==
X-Received: by 2002:a05:6122:ec9:b0:52a:c0db:29e3 with SMTP id 71dfb90a1353d-52dbce1e5a3mr9485202e0c.10.1747674971615;
        Mon, 19 May 2025 10:16:11 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm7003647e0c.31.2025.05.19.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:16:11 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Mon, 19 May 2025 14:15:11 -0300
Message-Id: <20250519171514.61974-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_101613_653053_D0295EC3 
X-CRM114-Status: GOOD (  15.05  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
started by the bootloader and the M core and A core are in the same
partition, the driver is not capable to detect the remote core and
report the correct state of it.

This series of patches implement an API call to the SCU which will
return the power mode of a given resource (M core in this case) and if
it is already powered on, the driver will attach to it. This SCU API is
being added to the new file drivers/firmware/imx/power.c, where all PM
related APIs should go.

Finally, the imx_rproc_clk_enable() function was also changed to make it
return before dev_clk_get() is called, as it currently generates an SCU
fault reset if the remote core is already running and the kernel tries
to enable the clock again. These changes are a follow up from a v1 sent
to imx_rproc [1] and from a reported regression [2].

[1] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
[2] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

v3:
- New file introduced, drivers/firmware/imx/power.c, to handle the PM
  (Power Management) API functions, as suggested in v2.
- First patch, "firmware: imx: move get power mode function from
  scu-pd.c to misc.c" was dropped to make the reviewing process easier
  and in favor of firmware/imx/power.c file. Moving the power mode
  function from scu-pd.c as proposed will be sent later in a different
  future patch, as suggested.

v2:
- https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/

v1:
- https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/

Hiago De Franco (3):
  firmware: imx: introduce imx_sc_pm_get_resource_power_mode()
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  remoteproc: imx_rproc: add power mode check for remote core attachment

 drivers/firmware/imx/Makefile       |  2 +-
 drivers/firmware/imx/power.c        | 52 +++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.c      | 17 ++++++++--
 include/linux/firmware/imx/svc/pm.h |  9 +++++
 4 files changed, 77 insertions(+), 3 deletions(-)
 create mode 100644 drivers/firmware/imx/power.c

-- 
2.39.5


