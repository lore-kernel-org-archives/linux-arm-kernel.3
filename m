Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202DCC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 19:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+qnxHjfq6t9kvIEcBFY4jjWRY7rxCRA39LvB5vINPkY=; b=JrZacw2a+FDpx9
	Hy1UX4mG/a4u3W+9JyNjYCZRWza4pKJ0XY1r4A6tXsCHttzAp7JQu13q/7K71yQnVqqEDHUk/VKvD
	pTYeHlxiT6QOPiG5eqqUlaSUxaDzyk/o4mOxSAnv2n/pLSEXSTXoTRPTYAkLddx1YCYBe0ss2ImVm
	yz3No46OnysuiPRtDM62rThPPYk0ZxUBPmSkPMZGXs8bB3dvJqzD8p+CwM6eoAH3WXfenUcXU7uC7
	wg3tHngClXwqhqy1qhKOaSr5rzpYIELfg50UkP5z89mGUZrehDKqy+Mh0M6jNHVnXnCn4UsnqxSHI
	k0nKGmRkt9XtwdB273GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonjb-00000006BJw-0N2g;
	Tue, 28 Jul 2026 19:45:03 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonjY-00000006BHv-0VJi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 19:45:02 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so170083a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785267898; x=1785872698; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+qnxHjfq6t9kvIEcBFY4jjWRY7rxCRA39LvB5vINPkY=;
        b=Vo1IVA8fjg+C84GnEWslsrZx7kCANqdhTJJ9BQ2AqDjpch8WXtZzJReuwIQ+lZ96NV
         bQNhL3UwLomiEKLfBAm8NA/13XF7gzoo/mZ//XMxZ4YAtoNnq5iL2Sj0k4Z30YcVcIoK
         GNyC0exU40FJn38mZMbtUKacBVs3sjrkhmjkYkln+0e2hANF2Cvj4s9kqStEq1R0e4OH
         os2FqdO2/WtOpnlh3FbDmdxEujo2WFziUlXC2thQHOZ8Dc5Fo/xDZcf0B9l0fl9uv9Gl
         M2QTixAWyWMIxPvaqQDmK/Qk1ryqN1kSAViJRpWvJaRFxvpZrHRZnh6D0Dl4QgGw0orL
         kjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267898; x=1785872698;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+qnxHjfq6t9kvIEcBFY4jjWRY7rxCRA39LvB5vINPkY=;
        b=Ph5zqRyJPO3fcTMFYXFr6D1jcSPMO1yciFfhK0TbAYYozDAgmoQ2mlrkt1w7mey8qr
         qIAhItNwFWZwnt4H2AVRbAu4bvJ+zw/7PYnRFy7iWCLjTYZDpYxGIVwxWzhxZXh0fkqG
         P9d//RWtOQYCl5sejeQ24XEwTxgYYD9ldz18s1ArpFAhLdbRBJrat4sNQkfK3AXa1JFN
         ZyuWdzhrvKnEutaLEuQUpyNjxPW/tW+5/B2o6jBehdl4DvWwI1ZcJv47H7jOhXXKcexo
         Aeg8NRtPrFTo7jNl+TNKv9hKGFacZBMjAnCJEed/kSMezUSE+tLTiM/pkDeUk5blq/8a
         l7yg==
X-Forwarded-Encrypted: i=1; AHgh+RpGCm197zdUj6rkJkuSUDZb4kqIe2OSOiaHtipH8HBfJ7oqKNmrdwqw+nlsO8J3cFtK3mqA7iH3ZWekFwP13+2a@lists.infradead.org
X-Gm-Message-State: AOJu0YwhaRgl82VylYJcgXUotK1K0ZMivf0rrSUPt8ypXKMXmr4yaBky
	YURzf6Pr3ImFnucC6rNThC2LreoXePlcs7eDop6k1NVUsaRenwZwd4GSz/Vj/34XgEw=
X-Gm-Gg: AR+sD10kJtdIJpjeT+DyFdA36gdP3+r3uluK0YvA+HQIHYeyVNJxs8vysTVcmzLCh3e
	k0lG4OkaG7tVh0ZlpRwVl0EJnflB50ZkAOhuESqUHSqrVNgNG7cevQhTquEToBX6chSmJx1XAC/
	4hbAiDIkbiDJV9dDDnn8vjAtrpUgwvyP0f5eLoTtmjiVhC87oWsTxNL+BHCJg7hOArOLf49LAEM
	orl95Y/6A1dcP5regoUf1NpjxzEuN66arXg/Dwyl0tcatvPJPsJQBPPXXxwhSGP6Hszd0Fw4i+Z
	88hMLa3xDiqVxWgWkfziX99jjyzu4MRExkR1xW/DH3abKn/LhZZv1Y33WZFyWPJy5LLRPsbdMFp
	A/VAK4dvaP33CuLmW74A56tpyoIS35sG/r1LmYlWP2P1Hj5r7rLU5KNWrmn2TwYVN2K/fCMkO0r
	V2MkQXkJ8=
X-Received: by 2002:a05:6820:2087:b0:6a1:7790:258e with SMTP id 006d021491bc7-6ac96a456fbmr1548148eaf.18.1785267898559;
        Tue, 28 Jul 2026 12:44:58 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:3026:75d1:db9d:8984])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca5254057sm290017eaf.4.2026.07.28.12.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:44:58 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: ti: k3-am67a-beagley-ai: GPIO improvements
Date: Tue, 28 Jul 2026 14:44:35 -0500
Message-Id: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBAF0KuQWTsJVhH0KsRFSz91jLakg0ZDu
 LtVl2/zFlJkgdKpWijjKSopFmw3FQ0XGwNYfDGZ2hzq1nRs8539rOxgww1vKxwmSSxxTNwed/C
 d2/umAZVhyhjl9dv789/6cFcM87ekdf0AHxGSq38AAAA=
X-Change-ID: 20260728-arm-dts-beagleyai-gpio-info-793ed8b4d55e
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=2LtYHeta5/Q9EvymN62gVMZCQz+7wtkWlLVE2E7UFUY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqaQal18LUWMhjrqnpK0pfzz0Z1H2msfl19+NAD
 vym5EAFqM2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCamkGpQAKCRDCzCAB/wGP
 wEQuB/982hhpMKtY3Wt5Gmb0F7J3rsfasP1hDdkuvTgLrFCrACZulXjq5uGUDotjNr/8dYyY5fd
 zZ+fK1UDXDvwyX1IOWDvMab54WQ/+QXnf9iLQ/gI6Vwr7BbmN68kXhhowqP9k3Nfbx27WUvUW/d
 Y8pyIC9XZN1zDSroCMc08hyuG98ITIql2ano4UxLZ7MwvC44K6FUHkdief2Okre2RjCoMuI4CRx
 lnb4fqCLomo8vRfQZMU2lDAda9xsoaP86YSe7OYVbTJXxK+HqC8HDgfqSUoQCywpNaujc/T/cXA
 HPwQZFbPYHcnmJINlkN4mZDtBlfW50cnXH8xYU0q4TmVPQ2x
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_124500_170092_86DF0E27 
X-CRM114-Status: UNSURE (   7.50  )
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

This is picking up a few downstream changes from [1] to make GPIOs
easier to use that I missed when using the BeagleY-AI with a mainline
kernel.

[1]: https://openbeagle.org/beagleboard/linux/-/blob/v6.6.58-ti-arm64-r35/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-pinmux.dtsi?ref_type=heads

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
David Lechner (TI) (2):
      arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges
      arm64: dts: ti: k3-am67a-beagley-ai: Add gpio line names

 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260728-arm-dts-beagleyai-gpio-info-793ed8b4d55e

Best regards,
--  
David Lechner (TI) <dlechner@baylibre.com>


