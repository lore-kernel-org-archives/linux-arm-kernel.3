Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F88FE6749C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M4RWmuJcn3cMaPSRt8a6tvMl0EjY2tosjXfqzSrALwU=; b=n0FCdTw1GlNEPu
	v8hHeBZuDyASOYQrliyZhk4yrIcf/8ZPPXNDC2rO06vHCG4jA0dB1WatS4xGyDWmS/wM93hNoxuB/
	1e4z2AvTcQxIFz8SfTzG+CmeAiQPIrIxKAmeUViLAItyHXQlwWXDHQ0zMkAAT+UVmMjVz2q9/IihS
	PCvk6elkvk5dWLONIoUFH2OVu9qsBX7f934T2TtmtdoAVuoNAsQC8Z+bf6dD+RUISVfzPNJ5rl4wI
	hAOu+JbPKdBhfwjUHl1C1rl1YDmJSLEcXV64H+Wx1YXKGj8L6rUGOBjJexBtWZqY6sVVxsQAPIQ5S
	9Sg7SHGU7mrCzRkReqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeeb-0000000Diru-0nfQ;
	Mon, 22 Dec 2025 12:04:45 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeeY-0000000DirE-0vZX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 12:04:43 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 22 Dec
 2025 20:04:29 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 22 Dec 2025 20:04:29 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
Date: Mon, 22 Dec 2025 20:04:25 +0800
Message-ID: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkzSWkC/x3MQQqDMBBG4avIrBtoBgrGq0gRq390wMYwo1IQ7
 97g8lu8d5JBBUZNdZLiEJM1FfhHRcPcpwlOxmLiJ788M7s926bov12WNGy6dCZpWuBCQD1GH8G
 fQKXOiii/+9y+r+sPwiYqu2kAAAA=
X-Change-ID: 20251222-upstream_pinctrl_single-99e8df1fe2b9
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766405069; l=1471;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=MxAUc30lY0ZVTV1TxW0DLWInUg2EQAPZTWnhohxQjyk=;
 b=ihkcVXvoKMMsN5sgT9VKTh+61Jy1UWM8XbsOLhVUip3f5ih3MdjCw2Qc6mlRaJdapSGOkunAX
 4HGYFNmwjWYDbGb/si/04AZt0GRDg44y0zEuf6i7odgjr7us7gRNOeK
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_040442_298679_4121CE18 
X-CRM114-Status: UNSURE (   6.56  )
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

This series updates pinctrl-single to behave more predictably on
bit-per-mux platforms by making its DT interface more flexible, its probe
path more tolerant of pre-reserved resources, and its pin configuration
register addressing consistent with pinmux.
It extends the driver to accept a per-pin <pin_index func_sel> style
description for bit-per-mux users while keeping the existing
pinctrl-single,bits binding as the preferred input when available. It also
relaxes probe failure when the I/O memory region cannot be reserved
exclusively, allowing initialization to proceed with a warning on systems
where that region is already reserved. Finally, it aligns pinconf register
offset computation with the pinmux logic so that both muxing and pin
configuration access the same register offsets, avoiding incorrect pinconf
operations on bit-per-mux configurations.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Billy Tsai (3):
      pinctrl: single: add per-pin binding support for bit-per-mux
      pinctrl: single: Allow probe to continue if mem region busy
      pinctrl: single: unify pinconf offset mapping with pinmux

 drivers/pinctrl/pinctrl-single.c | 150 ++++++++++++++++++++++++++++-----------
 1 file changed, 110 insertions(+), 40 deletions(-)
---
base-commit: dd9b004b7ff3289fb7bae35130c0a5c0537266af
change-id: 20251222-upstream_pinctrl_single-99e8df1fe2b9

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


