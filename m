Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791BBCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xPj6yjALXRppnwgH/9Fv6hsVla0KxfcdinEDCye/m1I=; b=wRG6wjvj5MtoJa+VL99Q+81iwA
	SqsY3PfOQiTZRxlrBCBIuGUJTeTXv1YPilmnBfvOjAWcGh7/0vP6Un5Gaao+GDocc9maB3haGGkMg
	N2RAAAzJyJHYJTMzY8Tn23pLblHcmleNiLsWBrI9V5I5mOL7g6+B1+15hnfyWBtvap6q3tli9w8Xh
	AeK0/q9ioinXZsFe2nFSgFxRuxEMp4Lu7tSKHisCDuaeWJgGwinoByEaxDO7J8Rjmuz7HZKYeKrJT
	/wcQIIFJ7YAIKGKgpQ3TPD+mXM6EqUtO/JqSWCv316k8KTLgIrBy/GFcxLP9UMv9vkCikYdSTZQjW
	Y1VKD0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEKiX-00000001kB5-1p4p;
	Wed, 07 Oct 2026 06:01:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEKiU-00000001kA9-2fA0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:01:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so11428315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 23:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791352885; x=1791957685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPj6yjALXRppnwgH/9Fv6hsVla0KxfcdinEDCye/m1I=;
        b=GvvuAil2BlN0tkiMGVBqNNSzXR8fgB2+LPlSv38LKjcbOatHOQXSX8E0CIOBHJjNy/
         eAvgX3fVqbHetYQ+RfGdMkpQwYLq98bFUYuZwoB21u1zBQoGFPi54g8W2bBsE0F/VZzz
         q2xCeFhke4cBeTHhBGtPEj9M0SZhLdE2eOIJZkdtHLzqM46qVkaX3/uYo5nxrgJlRLj4
         yHE+vK8Ts6M328v2ICw3MbeRaNTOd0KQBfSRlV8T9dCYQF2cIdIuly6HqmxbR9viGjRo
         W7b6Y9DDferh+MajXxIvKyUf13chaovZ5yWhPUqQB6HL5GCQMCyFYRWRczc68N7gbbpD
         Dp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352885; x=1791957685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPj6yjALXRppnwgH/9Fv6hsVla0KxfcdinEDCye/m1I=;
        b=dxF7pYxtEfP/Q68ItqD/v4hMCZN2JWWLi6UMv/vUQXY5MSbGOOWB1BjIvr+e5eUPMN
         Ar08J9HhvFVpWx+bTUDL3ucvpXEPKkYd5m70InQdXgO7z0LFSc44M7e1cb13AljgmTeq
         TXX6kqxTS9ryUkWdlXmkM3+lrz+lIEQ+cnO5P7f7yNCnWP7Pn6kP4F6/kCAYI4jnLQsV
         d4xOdD9Yg02szYI7THWMhURLiIUieIUvbKzcbm8iKGkLWmoAg7cmVjjGbxGp03E7yZRZ
         QoltSLayVZYGYErj93QdFjklsRdZseWZ/uK6UzmAOtid63qUDbd5md+q/kczK3ByCwrY
         ZKgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz84G4gwsCMV0tCSOIDrU/kijPjnsi/9rzyAruTI60HwvXyOoxJGlpA1yUO+GB3MjkMNEfgrrJWaJJHa0/KU320@lists.infradead.org
X-Gm-Message-State: AFuF++l+ehpMrC5Qor8nTUU6VsTqikZbeMIofGx5/ZNKsA9cv7w9u7hZ
	ro9Vh5mpmmfcFf/9rXWaH8FZXMs0aLafojH162A2tcYom4Yv7fykPR37
X-Gm-Gg: AYBFou2aAvOaLBq+DFMBjVcwCkN80kqwZ9zbdkRYULZcmXcGbkI7KCQm+ibfOF5cbfN
	SSHIErirkV8xK/Ajve/cqUwJXQa3XavQJs7ZhBFevey1TT8nTAnEhaaLYqfZT/7SvV84LQ5Wzor
	0dUQB6Jlypzl7A9tZtl3FAeAjgzHGgZ4GZn4hqTxmsQyyHdT9v1tcr5lasgWiUHYjxRjTZLKNQW
	36X9NjZFCkAfxr72ZMdI5OvwPqXlaOoI5wCSdpzm4mIcwknPTMuLik6MwXREzDSdKzAea0npwHu
	G5J2QZCWfTRJDr/H/Y5RXbGdislBe96ZqGM8rp1Yt2ohoRyASI4SpgMJtfJgbbi29jm8YJhQLlr
	mQRVZBxp72g3bHVroQkCKuhgjbUhiP/KCZHANHZbYNFBZJ7zh5KCtUUYzUQ0goF7kOWGZHEy6wY
	t6C+8viaAoxZISEyCuaTjOTldJPSsKhAepgAp5lzsCu9rFTurxujVMmemfMSE=
X-Received: by 2002:a05:600c:314f:b0:4a0:1c69:f607 with SMTP id 5b1f17b1804b1-4a1806509b5mr13094935e9.29.1791352884569;
        Tue, 06 Oct 2026 23:01:24 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:711b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4eac2csm49696235e9.0.2026.10.06.23.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:01:22 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: [PATCH v2] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
Date: Wed,  7 Oct 2026 07:01:07 +0100
Message-ID: <20261007060107.62221-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_230126_978042_CF72033F 
X-CRM114-Status: GOOD (  12.35  )
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

init_pins_table() adds to npins in the driver's static descriptor, so
after a probe deferral the count doubles and the next probe fails with
"pin 0 already registered". Reset it first.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
v2: reset npins instead of counting into a local (Andre)

 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..8bcd566593ae 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -84,6 +84,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 	 * Find the total number of pins.
 	 * Also work out how much memory we need to store all the pin names.
 	 */
+	desc->npins = 0;
 	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
 		desc->npins += pins_per_bank[i];
 		if (pins_per_bank[i] < 10) {
-- 
2.52.0


