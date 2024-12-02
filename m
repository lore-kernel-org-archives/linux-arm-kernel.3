Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96D7D4978E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 00:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LsLrPVxdPPM88Lsuw9W4JxVinjdPLNWv/2GSWcv7fHg=; b=WGtL9A7e5W7+ADVRbFdpNSSfeM
	iNJFWRJTC5P/q1y4+W9I2rixqwM0e+IMJthYWMfxMx3RqoCXAGOgcRuxQkaE+Gzt0+47R6AP4NTa8
	5L7KBpiCo/jQnGmTb7Hn5/Fg8Y5uW/zAPq8WZLcTTz1kVGh+nb/fk7j8hbyRxerk6DAfNNV8gJiF8
	SmJOp/xR68fiXXLWdBj3VobEACKBw0Y5qQaKvvJCJYuSvYwYtWJ0prwj3suQUgN+cUXiqvdxNWo9z
	jtbh/u1rMoLV8YRRuGqQNT7wOi7vaGWowbdNr0NWEONylDjaVh3+QqADPW4kqZLMYdbxrEakcbOVJ
	t1e1fmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHuAG-00000004aiN-078k;
	Mon, 02 Dec 2024 00:19:48 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHu7M-00000004aMG-1krv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 00:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733098598; x=1733703398; i=wahrenst@gmx.net;
	bh=LsLrPVxdPPM88Lsuw9W4JxVinjdPLNWv/2GSWcv7fHg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rsIAOXCD6SDPCPzhyuNo3WnPYNEMxC4P0mbPErZ8sIpuz2GbjfwIb8OVKD2SAXA0
	 fA6WQoidaMIhSQRGVWnVyrZFt16NSYEf1kR27THkT48ADSxqriUiqOSLLjTwqfYfX
	 WzJzgebEy2z6bq24cqifpasfPyDB8y3ZbX6sQluWeooCMM6w5J0RjoT1931N+buYy
	 +QfVEBRPpzY9K9nKqh/o7GTt4T2D47i0mFnTDzKQaubAKpeNNvFOtEEJvvGGpyNf8
	 hnhIGNSGnwLmJBY/a8dbKoXS6wqHJpCaCY6d94RSfBCxRZPXebLVGwCEz26izLitP
	 jtGqHdFK5W5dE14wzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOzOw-1t1J2g1slg-00X5KM; Mon, 02
 Dec 2024 01:16:38 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
	Douglas Anderson <dianders@chromium.org>,
	Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/3] usb: dwc2: Fix HCD issues on Raspberry Pi
Date: Mon,  2 Dec 2024 01:16:28 +0100
Message-Id: <20241202001631.75473-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GZb6XypkJ2trclZRcE3wdoCOXnsMwh7WXxoEQxLIUWyrxO0MvCq
 bbgRMP8ZPXPAYJNI8f8LvtlECdnkhnfOSVC+lu3u+TDL2EcJcPOSHh4fwhbHiEy1AV93+yN
 vLlTKX4O1IT6MT5csY6GtTqyHz3ISXeOLsG8uJ6x7l4zm+gNXydx3GKtZnD1MYTky4OyqOa
 yVhNUZeGSdiTAMnIRqNkQ==
UI-OutboundReport: notjunk:1;M01:P0:W0K37wS3vf0=;g5CYaqlhzi9kxXOEWJ1H9fA9+lV
 vaRSCnM0UKe9y0osLlWumG1BlrTmv8DwQr1Bzi798Pmu/ogV9OucrjLDLC7LQ1T2uclWO4Q5s
 wckyS1si1QIDbuivsckUL6nErbstyAr2s53gOXrliCLSXHg9B1pdpfcYj6JrSpT5qzayty2hX
 9PFfxCXt9tM+lt7VT2zs1YTlMCQHF2k94yYH+JblGMcvg1g1JeiEe0sMaAiUYfrw6THs4fLtm
 kXApuhaunKbpQGsLdlBMPvVBlsw4At49ZvhF1wRTxvugkQp4JMaDTd1SoMeun9Btw5l7zlRn3
 LgkEeMpSTn8YMAljhLKrBMieCDNs1hrBYwGV+Pci3I/QwOvr4X+Zjm9JiIRG9PzSfmVgbvtUr
 RtYtsKXYFvdk0n8KqtxPCympxH9l87dHUt99S6iJ+fwf4YNkLgA5nkLzw4PJ/zEontK8kTZIy
 z2BzEqYKPlJjL5pYXayZjt2SRypzHRkXxxU5gOGn0EcEOlSOSBExJ9Y9cFQImJIlyj6RA5Jlq
 niIgHasz1aDO/elf/FAS5RBYJN60BAEBCVdALTWQaiP5TljgGN3VSYU8pc9XQW6r2XhZHBd4a
 18zvRCBe88KrTh4S5f34Li2LON1qyPrI89mnUEvcI8ZdwkqjdTQc6yKVJ0413gwryop2gFNF8
 sbKih5HY92Fr4lGxhicOoGRsrSzM8xbTkMAbtJqS4GEMhj102s2MR0LH+sr6dd2M5ZML7Z+vt
 5UwjRxoyTYRF0Kt5rbhx//ZCqoYyFjFkGMeYbqeOy+iaZSD+orGsIKLsXrj9ijIHM6I3RYt4O
 7NtaVZGEtiDnjm0iVl+Wi0ei/U21wPJvvg3j15/6eUNIg+Ua/kGR4GTvqSsvj6K4sRhYHFp25
 DYPPQ4KKhIziZEfAlt4vZfkSIqT9AGW2NvVEDG8CRzsjVyVCXCRjl65xG928UDk/zADZVR5A3
 agE2Ij/p6QRl25tQYY4kOKxlQWuxxxTfra+2EXP0LUarZJXXzU/AME32STLZAWkQsgsSLSWeR
 g8yNQzdKe3t4Uky2WnwHu6rpnxApRqKCi0VVd1W3qFbk7wkNOa2Wp+ist4Fso9UXv8kVL1Qo7
 ypmOZr6Xwo8G3rBMdfwuDi8i+ybc98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_161648_740722_C9B0C870 
X-CRM114-Status: UNSURE (   5.95  )
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

This series address some serious HCD issues on the Raspberry Pi.

Stefan Wahren (3):
  usb: dwc2: Fix HCD resume
  usb: dwc2: hcd: Fix GetPortStatus & SetPortFeature
  usb: dwc2: Fix HCD port connection race

 drivers/usb/dwc2/hcd.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

=2D-
2.34.1


