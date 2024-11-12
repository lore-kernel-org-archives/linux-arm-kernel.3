Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE7ED597B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 00:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gMt6xiNUzbP586OUi3bpRznhicbRyyZqkrZh8cOiBiw=; b=nvl2Id3/Vpe6ap
	Qy8FgDOvPL0kW72RFfRGEpgpWS6IR4wwdK12iE0fuPToobE/rhfFHCevkxIhnRsn4mnkMjOvoYDR9
	ibP9qJ8NVcwj/pvaaB6EAoSRoYsce5R9ulENwrfmRaT7wG/Zxlsc05sTIZ228Vt/Rj7dcIs7fuIw0
	fGDKJ2PGQRYLphdl4F8Ztzl1IqS9jEA0UYDKIlrjBM0fUTTjcKd4RjIL+buPqcR44iMcvxSlhWj+r
	u2I/7TLJfOoQlf/VHzDh8zhoxvyL0dYc1twnqSOuiS7myXhjEDaBx2b1/Fl2/JkN8Z9MkHrzxUnMn
	BcZCYSPR99dD2W8vtXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB13P-00000005Ng7-0Uc9;
	Wed, 13 Nov 2024 00:16:15 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzss-00000005DGP-1kV9;
	Tue, 12 Nov 2024 23:01:20 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1ED1D12000C;
	Wed, 13 Nov 2024 02:01:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1ED1D12000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731452463;
	bh=gMt6xiNUzbP586OUi3bpRznhicbRyyZqkrZh8cOiBiw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=iodAhEWjWIjWyDbzoAX42ObmnYWHz8n0F7KcKy6V5cPR3Wq8kRNxf3SsgPkelm4v5
	 23ijXgTZZ0vOFqbuQiiFcbkLpOO77GuMgDnTNyLsonikc4tW4AuSueW1lGbIgKZw8E
	 E6TiK7A/p5V5gYp41C+Grbq0tK5TqjPqspNrMq0Xc9oVLgNob3yiXaZEox0K7HbReC
	 XAwVf5chP0q1w7CP5j/FF7l+6lGbH2v/JQl9wJsH7UnHc2UOiRzmXn9Cmot6fNtOCp
	 KYqvMnz/a/xWywNDNqpskUQtAHjVEDoPFnNTNOMEM8s2gj+Ni6su6Nr9Nuj6ms7v8y
	 gaiW8ePE9O2KQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 13 Nov 2024 02:01:02 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH 0/2] Add support for A1 SoC in auxiliary reset driver
Date: Wed, 13 Nov 2024 02:00:54 +0300
Message-ID: <20241112230056.1406222-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.128.42]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189131 [Nov 12 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, lore.kernel.org:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/11/12 21:28:00
X-KSMG-LinksScanning: Clean, bases: 2024/11/12 22:50:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/12 21:10:00 #26864167
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_150118_641716_34146B86 
X-CRM114-Status: UNSURE (   9.78  )
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

This was a part of series [1]. Comparing to original series, reset functionality
on top of 'audio-vad' clock controller also is added.

Links:
  [1] https://lore.kernel.org/all/20240913121152.817575-1-jan.dakinevich@salutedevices.com/

Jan Dakinevich (2):
  dt-bindings: reset: add bindings for A1 SoC audio reset controller
  reset: amlogic: add support for A1 SoC in auxiliary reset driver

 drivers/reset/amlogic/reset-meson-aux.c       | 18 ++++++++++
 .../reset/amlogic,meson-a1-audio-reset.h      | 36 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h

-- 
2.34.1


