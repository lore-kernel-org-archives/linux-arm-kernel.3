Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3529FD8FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g8QKOBVmvfZrBhcXhbKXa1XP4Mqh3aZ9oHJhophil2g=; b=nMQdHhkmSXRuPLL5yeSPkZEWry
	Aak7aKgwFcpBm1lFTRJ+xuaeJKQK//UmqnX18HMpXzivpDdqxDBRn9dzkU7/i9uiJZU6Oi2V3Jgep
	+tC8m+fUhyX+F6NOHCnXJTchkS+TT57LjQBTBr0s/Zi0PO02Y7B1DjvK43b0aPT7nYbtJOM3aooxn
	XazhYnO+x1ZzLxxaleIQEMT+PnCBupAPSwLGQKMxFLGGQemkEVaNaXIPU3/YVcd+t/tlG9vAA7KdE
	MCl/RA55ge6cd6nQ5A5KWCdN8GdbLlTerBW1tJTMLhrYzBR28rgE2hwvGHI8X2sutxFn66Gs6Oecm
	qDHA5KTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfvi-00000006wNQ-47jO;
	Thu, 26 Feb 2026 18:17:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfvg-00000006wN5-1MqO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g8QKOBVmvfZrBhcXhbKXa1XP4Mqh3aZ9oHJhophil2g=;
	b=d7v76ZCOhp7hDrPo8oMoeytqKHC9s6sTI0+1WE0jQJjp6DJNLhtGJzB3qHeuQCk2wHNkve
	AsqlKinrT7VrpOj3/i9+K1EaFdGjREThZeGT2Ml78w+SzhY/UBFWgIoeHOiRv+Bh3zoHX+
	53RJ3VNzgK8Omf2ooiwsYjCPSrWBKyw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-wXH-L8f5OSmu3qgK2qdwFw-1; Thu, 26 Feb 2026 13:17:37 -0500
X-MC-Unique: wXH-L8f5OSmu3qgK2qdwFw-1
X-Mimecast-MFC-AGG-ID: wXH-L8f5OSmu3qgK2qdwFw_1772129857
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ca3ef536ddso915629685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 10:17:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129857; x=1772734657;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8QKOBVmvfZrBhcXhbKXa1XP4Mqh3aZ9oHJhophil2g=;
        b=IX5Xala9VcNdxgadyV5OPsdj7jYuQKtUlmXx1EDUlFgFu1vbcr+JfrjP3VC9h80DcT
         +7aWcGYWJnFAw1X2KwIhDbl4BJOeVLLMh7RnfuLSBNvnX6nSJQkIsdqI1BCHzftbIqXj
         uWV5XxWXvqW2X8z0G1b3O6n9rLhW9IdoSUT7KGmm4iqjKIZ2sJqvrh6UhC0GIJZpc9cC
         ovxoFmk0Z0w9ohuIGUn/2y1pfClvgvu382AV70xoFbdwr1lg9pNDzIlKckqZIGmyEJJy
         UGxxjOZdh4m9mBKi+cWZz+SESPxLEcM0hY0BC7vb1yeV8EVsGII09+rqRtcmoYYuqa+D
         QmEA==
X-Forwarded-Encrypted: i=1; AJvYcCW+VX1AtVjSwS+4ko/VU+5jQPyWd6manvN6RRr/VYnaCHb7w3mCq/JrJLVkQ8at5iha8AH/5UJlDwCn/DVbNo4o@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8r31IoTzvmF+PuG5CDCX7YA/rfIx4aonL78lTS2zodwgclqE4
	YTLSkQogRFbMnHIONlV5AWUNtER8+Loqq7GcXzN5xrT0Tqpj09ra991kBiE3zuFsJ86W0s0zlHq
	+eHLW5LH7UzS25+lj3sORIr4zjAekfMi/aLtOng2m7v0quaR2hDy5BtAxQwb4ZcNyLv3VlR1p9s
	Uo
X-Gm-Gg: ATEYQzxOUfmYbO+EBEgrJUAFu0i/3ybHDS7PexvMH2dnMUI9Is73ntH0j3XEBL6+ZJa
	lrQu7Rq8cVb3sqEAM1bhdiYLtG44SLahLCZZ5auhF9lZD3zNdRVqD/vb4fENruEUJ0pDf3zST5h
	OwC9oaTztSbVSM7/9Mdd/VAHyNQJiWapwUcqfqF7DOD7iHDvAutO3O6lEKFTIy1MuCQ6cQ1b1T6
	DXIzKFvhgWsLjyc0bcC9R5voQcTWypU20KTI+03tQO3ZFYsE9sxMuzw2K94qpH35L/G99ZnN5mr
	xD1tVCGWi30UJY51jolZ9uTNtVp0PejRcU5jbRXLTIZkY8dlvFr/ZmxEilsGpkEd3YiOVYvlQ0t
	JosUP4o835MCNobB25SZKwVXixEpJI4/cKPiyXHbN1uP/I0EWibd67XhTK9Kq
X-Received: by 2002:a05:620a:44cf:b0:8cb:4c:3ad9 with SMTP id af79cd13be357-8cb8ca93060mr2498307185a.80.1772129856824;
        Thu, 26 Feb 2026 10:17:36 -0800 (PST)
X-Received: by 2002:a05:620a:44cf:b0:8cb:4c:3ad9 with SMTP id af79cd13be357-8cb8ca93060mr2498299885a.80.1772129856254;
        Thu, 26 Feb 2026 10:17:36 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:32 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Date: Thu, 26 Feb 2026 13:16:44 -0500
Message-Id: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNy2oDMQwAf2XxuQbLL8n5lZKDbMnJ0iZNd7cPC
 Pn3ugkUehxJM7qaVZdZV7ObrmbRz3md384D4Gky7cjng9pZBhvvfHbeZ9teX6zoZhfe1PYve+I
 zH1RsrCQuQw9Q1Qz7smifv+/l5/2DF33/GA+2x9BceGvHkd9NqUAhlVYSNybPvgSPEJDFcyevD
 YIvqeZ798+icaWALseCAIJMriVEii4EDtiZRRKU+t8q0LACJWhJEDW52GJpmmuHWEOnSlHJZ/6
 1Kq9q29vpNG+7CSXnDISh55piw5FOSI6jG4vKEiSSF+pmf7v9AG4wZ05XAQAA
X-Change-ID: 20260226-clk-det-rate-fw-managed-4b8d061f31be
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Abel Vesa <abelvesa@kernel.org>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3457; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=QA/oDtTW/MklJzlzkqeDnO3jkZ3ncrUHMklBQka/GKQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9KnuOuJ6XcNWyYYj7ExcnUvVrhUq6ncvsXXmVDFFv
 53j/0Kho5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkI2TP8FemuVDc3P32hy/BM
 ysTr7yXqj3mZLhXRVJfPLf4vLnrNnpFhzSUGL9VghpOdinWLVOsKth37reYzn+/qAqe3hxxn+/7
 hBAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U8JBtv1KlyxVb9z3C_HOoXUgZoM9sE84SF_aupwyRTA_1772129857
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_101740_443664_A69FF140 
X-CRM114-Status: GOOD (  15.25  )
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

There are some clocks where the rounding is managed by the hardware, and
the determine_rate() clk ops is just a noop that simply returns 0. Based
on discussions with Stephen at Linux Plumbers Conference, he suggested
adding a flag for this particular case. So let's add a new flag, and
update the clk core so that the determine_rate() clk op is not required
when this flag is set.
    
This series adds the flag, some kunit tests, and updates all of the
relevant drivers under drivers/clk to use the new flag.
    
Once this is merged, and in Linus's tree, I can update the few remaining
clk drivers that are outside of drivers/clk via those subsystems at a
later time.

Merge Strategy
--------------
All of this needs to be directly merged by Stephen as one series into
his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by.
To reduce the noise, I am only CCing people on their respective drivers.

Note this series depends on 3 previously-posted patches in this git pull
to Stephen for v7.1.
https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
Hopefully I set the depeendencies up correctly in b4.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (13):
      clk: add new flag CLK_ROUNDING_FW_MANAGED
      clk: test: add test suite for CLK_ROUNDING_FW_MANAGED flag
      clk: rp1: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: scpi: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: hisilicon: hi3660-stub: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: imx: scu: drop redundant init.ops variable assignment
      clk: imx: scu: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: qcom: rpm: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: qcom: rpmh: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: qcom: smd-rpm: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: renesas: rzg2l-cpg: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: samsung: acpm: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: sprd: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag

 drivers/clk/clk-rp1.c                   | 11 +----
 drivers/clk/clk-scpi.c                  | 14 +-----
 drivers/clk/clk.c                       | 24 ++++++++--
 drivers/clk/clk_test.c                  | 85 +++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk-hi3660-stub.c | 14 +-----
 drivers/clk/imx/clk-scu.c               | 23 +--------
 drivers/clk/qcom/clk-rpm.c              | 16 ++-----
 drivers/clk/qcom/clk-rpmh.c             |  8 +---
 drivers/clk/qcom/clk-smd-rpm.c          | 15 +-----
 drivers/clk/renesas/rzg2l-cpg.c         |  9 +---
 drivers/clk/samsung/clk-acpm.c          | 14 +-----
 drivers/clk/sprd/pll.c                  |  7 ---
 drivers/clk/sprd/pll.h                  |  2 +-
 include/linux/clk-provider.h            |  2 +
 14 files changed, 123 insertions(+), 121 deletions(-)
---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260226-clk-det-rate-fw-managed-4b8d061f31be
prerequisite-patch-id: 59198edc95aca82a29327137ad2af82ec13295b6
prerequisite-patch-id: 8932e170649711d7a80c57784033a37faadd519b
prerequisite-patch-id: 91c7b1851c5d77e504c49ce6bf14b3f8b84e826a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


