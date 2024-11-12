Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0757D597B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 23:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GzpLeQmauji/V5ygVX6H57e5rXHsmuG1+VVjGr5bYFk=; b=TN8UcRpqi6FjgR
	0AEv92uYvgTMjOOlB5QlTQp6mimmiIKSCDOgp05xfnmJ+wiXJMTKZidKmpRq7nRl3upoBpnVRBPBz
	PXhZRiYbZiUJQvmDoSTDlrTZ8XChB09WHOo4y/06HeDx2ykYrEwgubJLlU3fCr6gf8209TTpEDcJ8
	OuIz19VjdMC8qlMRNHMPZjDSfGBkpx7XL8vcjOzRtWYpjdQw5biwThSBjLlaEf2WmhePdmPh1KIGx
	49DIwip2XimU0AQ3LrY5PiqQCdyYO4rhxE1y6C61cpZFLHgcBy1nYA0SKAANqF3jNdOobbMccElYh
	E9gk9nAEQehMxjztQOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB001-00000005EYb-1gXp;
	Tue, 12 Nov 2024 23:08:41 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzwJ-00000005Dvc-0cwo;
	Tue, 12 Nov 2024 23:04:52 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 61A3B100003;
	Wed, 13 Nov 2024 02:04:49 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 61A3B100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731452689;
	bh=GzpLeQmauji/V5ygVX6H57e5rXHsmuG1+VVjGr5bYFk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=YNYl4oPTELNlAq5DjPqmHHpKXGnnpzWVgTWF0UwXU233aYiC1djwvfJG1oIDSOtAi
	 fFphLpYPW2NW+etIwNtrx5sA7j8jqZr41TfCYV7u/kI6z/iw4U5FhzcE3KFoYpUlx+
	 EJufX9pSTO5snqQSf6z8kXIYsNqFPqDB8lJ+9sv9a/hxu2vaVWoooscLJHQJKySaZ6
	 EAGGpeN2NKlokZS/na0akBegTRubqqiIJ3rt8luKbAtW5znYS0vQofM2AWhnTsSfre
	 Yqd5v1CsRumzzpyCL2yJ4L63UKzP/pv6mXdPXErqU91jxMW7AbmNgj1Lt701jflieY
	 n6ZaPXhBGq5Zg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 13 Nov 2024 02:04:49 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 0/3] Add A1 Soc audio clock controller driver
Date: Wed, 13 Nov 2024 02:04:40 +0300
Message-ID: <20241112230443.1406460-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.128.42]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
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
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;lore.kernel.org:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/11/12 21:28:00
X-KSMG-LinksScanning: Clean, bases: 2024/11/12 22:50:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/12 21:10:00 #26864167
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_150451_554501_F55D3897 
X-CRM114-Status: GOOD (  14.29  )
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

This series adds support for audio clock and reset controllers on A1 SoC family.

Changes v4 [4] -> v5
 - moved changes of aux reset driver to series [5]
 - added reset controller on top of audio-vad
 - merged into single file
 - reworked variables/defines naming
 - added clk81 clock hierarchy
 - added TDMIN_VAD-related clocks
 - excluded DT patch (it will submitted separately)

Changes v3 [3] -> v4
 - Use auxiliary reset device implemented in [4]
 - Split the driver into files
 - Use common with axg-audio yaml schema
 - Unify clock-names with axg-audio

Changes v2 [2] -> v3
 - reset:
   * added auxiliary device
 - yaml:
   * added declaration of optional clocks
   * fixed names in example and another cosmetics
 - clocks:
   * reworked naming
   * stop using of "core" clock name
   * fixed wrong parenting

Changes v1 [1] -> v2:
 - Detached from v1's series (patch 2, 3, 4, 25)
 - Reuse some of defines from axg-audio
 - Split the controller into two memory regions

Links:
 [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
 [2] https://lore.kernel.org/lkml/20240328010831.884487-1-jan.dakinevich@salutedevices.com/
 [3] https://lore.kernel.org/lkml/20240419125812.983409-1-jan.dakinevich@salutedevices.com/
 [4] https://lore.kernel.org/all/20240913121152.817575-1-jan.dakinevich@salutedevices.com/
 [5] https://lore.kernel.org/all/20241112230056.1406222-1-jan.dakinevich@salutedevices.com/

Jan Dakinevich (3):
  clk: meson: axg: share the set of audio helper macros
  dt-bindings: clock: axg-audio: document A1 SoC audio clock controller
    driver
  clk: meson: a1: add the audio clock controller driver

 .../clock/amlogic,axg-audio-clkc.yaml         |   4 +
 drivers/clk/meson/Kconfig                     |  14 +
 drivers/clk/meson/Makefile                    |   1 +
 drivers/clk/meson/a1-audio.c                  | 841 ++++++++++++++++++
 drivers/clk/meson/axg-audio.c                 | 215 +----
 drivers/clk/meson/meson-audio.h               | 156 ++++
 .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 139 +++
 7 files changed, 1190 insertions(+), 180 deletions(-)
 create mode 100644 drivers/clk/meson/a1-audio.c
 create mode 100644 drivers/clk/meson/meson-audio.h
 create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h

-- 
2.34.1


