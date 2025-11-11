Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF719CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 21:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FySy0LCStPtORY6VK+463tcchOxR2p6Krr0cw/eyN50=; b=POS/y/9WOu4KXYBSKv2IwNL5BF
	zKFvHUpWcWVLDODT/d7ReRgQzLMs2b1IvNWfYoVQ7wzREGyn76i9R/ma4N8/JP2suc8CSukIFC+Vs
	VrKw4G9rg+0NqPB5C+sdY3iNO2MNe6drdjHbgRRLjf9f/4coXrjEKL1Mo3fBGYPz48uSgEI0YGLq5
	2p7+eU0jAKgXJzhYaX7cdmqlGC/i0lMLQKBHzZkqmuMSwJL1/xDlcGDTEQ5R70/LUvo8TP8SYQlgZ
	KxTm5z5BTeRv4VUZ5bQEM7YlAdpfxjP+7hj+U2L2NElH1Idkb1xnFCFEHoBk4b3/UcGo5PFiovr0y
	C8amVcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIwMN-00000007ozf-3HPd;
	Tue, 11 Nov 2025 21:57:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIwMJ-00000007oxa-09mS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 21:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762898222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FySy0LCStPtORY6VK+463tcchOxR2p6Krr0cw/eyN50=;
	b=DS40U8+gpd7rMpoipfauE9ao+xwLxikx56up98NVmVOXf+l68A4vz3W8xl50PPNkM/FSTQ
	e/RDTDKuPKDIg7KhbONN7AXMs8Qs4O28QjtLBdQUBnr7jQu5zNtACJLJrTnBeQqW8oSI4T
	rg6sEWgTf4c5Kis+IMXQiKwEoemUF4U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-hUaYYfXcMjOsweQgizW2hw-1; Tue, 11 Nov 2025 16:55:11 -0500
X-MC-Unique: hUaYYfXcMjOsweQgizW2hw-1
X-Mimecast-MFC-AGG-ID: hUaYYfXcMjOsweQgizW2hw_1762898111
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2657cfcdaso27588285a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 13:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762898111; x=1763502911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FySy0LCStPtORY6VK+463tcchOxR2p6Krr0cw/eyN50=;
        b=jc+4mM+IigTGqInIMocgip9JkAcljtaF4B48a4XH9uTc8M5J9gNbEAFsQEgK+NGmjw
         pgzEyrAH8+qY5WxwUCXzGz8PnkI3/jS59BMQGUjjx5Bu5Gx7k36iukN+bA/AIp5krK2v
         AuG60Fk+4zG/GfHi5QM1kZ2urcPSgjQUL7IkOHAL+N9B+8et+bS+FMBpm9jkL2HWwPYO
         29MhvvJH3ojlmOXTgeJZF9JEhsvxTT5e7yE4LWdzdPlUiKT6O0MGqZgpWcFXYbFi/pku
         Q+unZpMpQr1uIRkahfx0eFhCCDf8zXPWIDb2VUvcyx8tpI9uz3eHv41lVnyNAuiK1bjR
         DN4A==
X-Forwarded-Encrypted: i=1; AJvYcCXcUu3qoeAhgFm+idHt/YfvLcPL5LqyXl5m/YUYe2hjNNe5ulT8fnA1H01+iOcvL8Yk8ltJIB5NrUkBk9YQPwai@lists.infradead.org
X-Gm-Message-State: AOJu0YxqYWJEtEG9UlJX9scwL3HmxmVs75HxPydUmREppoOFtW/On1Ng
	BMsbT92XyVYuOvbNBxL0v19FocdFY+IbpnevzY4Q7+e9dUZTK+HMKAYQ87AOZynHjYNGBHbn6+K
	REmwTqIBsKQ2fkl0MdRdKdhwueGwS6xKdXaoUyCtNzBHPBo9riM8Mf+Pqzk+4bSCUCoawX88oJ9
	5Z
X-Gm-Gg: ASbGncs/yFuWdNe8acPDkwI9YrvQqBfT0suAC6UBOZFVjPk6YJhSeNqDnLmxI5PkgUD
	Psy326HM1oWF2lufz/FWST4rgeh2k4VMfzppJGjeh9J4wKLdZWwQicE7jvoX6jSCzQi0ZrGTHO7
	3iFWLwDfpn5NOeGwwdUhcx6qkgYJAShrKYIIZ/D8HTjEznksxoqT+3I4r4ldZdP7sL5GBKZBynT
	q+kbgU8M/pumEPuNl6fJMvmShDxWY3kG1Tuz+RnuxSoiZ6KzpSgPUxcEnvxeFhJFXEFQN9hmcDI
	WvKQu7sAQfnpmD8qMVi+UAPIpJOG19tumMj3aJWdvgcLDNwkLzLVsjST+EYZ4ydQQQRfyAfwF9o
	rdX0D8PRc1H09cTyKK9sPyY7Yw/zo4u4=
X-Received: by 2002:a05:620a:170c:b0:8b2:271e:a560 with SMTP id af79cd13be357-8b29b815efbmr102326385a.72.1762898110773;
        Tue, 11 Nov 2025 13:55:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVx5pK69Ag3154vIr3OiRkF4L8ppHUN7DwLvrxWK4PbbHtrMDcLkZR/pYDsWLScGfqh5YaAg==
X-Received: by 2002:a05:620a:170c:b0:8b2:271e:a560 with SMTP id af79cd13be357-8b29b815efbmr102324085a.72.1762898110299;
        Tue, 11 Nov 2025 13:55:10 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4403:8750:d964:d6a9:f204:ed2b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29aa032fcsm61335085a.49.2025.11.11.13.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 13:55:10 -0800 (PST)
From: Jared Kangas <jkangas@redhat.com>
Date: Tue, 11 Nov 2025 13:54:11 -0800
Subject: [PATCH 1/2] pinctrl: s32cc: fix uninitialized memory in
 s32_pinctrl_desc
MIME-Version: 1.0
Message-Id: <20251111-pinctrl-s32cc-alloc-init-v1-1-071b3485b776@redhat.com>
References: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
In-Reply-To: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762898106; l=3179;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=r3R6gOHgJpsH0Ckzs+8Ovo1IxuCFFu4tCtcoUxTJujA=;
 b=/a2DmQFQikGB8tMbS1LUwfOT0vMnQIkNOhWStWMNd+63yndO7bdcP3v8AKVc3H81zPQRXNv07
 e1klwEJpmB3DVdhiEREEVNIyvIhIsr774lihmh7uHYh8ICoCmIKxvsw
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1yXlF6RScKf6zghabXTpvw-xkwPD2hGJGJueJXcDKQY_1762898111
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_135703_153241_841DB255 
X-CRM114-Status: GOOD (  12.52  )
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

s32_pinctrl_desc is allocated with devm_kmalloc(), but not all of its
fields are initialized. Notably, num_custom_params is used in
pinconf_generic_parse_dt_config(), resulting in intermittent allocation
errors, such as the following splat when probing i2c-imx:

        WARNING: CPU: 0 PID: 176 at mm/page_alloc.c:4795 __alloc_pages_noprof+0x290/0x300
        [...]
        Hardware name: NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3) (DT)
        [...]
        Call trace:
         __alloc_pages_noprof+0x290/0x300 (P)
         ___kmalloc_large_node+0x84/0x168
         __kmalloc_large_node_noprof+0x34/0x120
         __kmalloc_noprof+0x2ac/0x378
         pinconf_generic_parse_dt_config+0x68/0x1a0
         s32_dt_node_to_map+0x104/0x248
         dt_to_map_one_config+0x154/0x1d8
         pinctrl_dt_to_map+0x12c/0x280
         create_pinctrl+0x6c/0x270
         pinctrl_get+0xc0/0x170
         devm_pinctrl_get+0x50/0xa0
         pinctrl_bind_pins+0x60/0x2a0
         really_probe+0x60/0x3a0
        [...]
         __platform_driver_register+0x2c/0x40
         i2c_adap_imx_init+0x28/0xff8 [i2c_imx]
        [...]

This results in later parse failures that can cause issues in dependent
drivers:

        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c0-pins/i2c0-grp0: could not parse node property
        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c0-pins/i2c0-grp0: could not parse node property
        [...]
        pca953x 0-0022: failed writing register: -6
        i2c i2c-0: IMX I2C adapter registered
        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c2-pins/i2c2-grp0: could not parse node property
        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c2-pins/i2c2-grp0: could not parse node property
        i2c i2c-1: IMX I2C adapter registered
        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c4-pins/i2c4-grp0: could not parse node property
        s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c4-pins/i2c4-grp0: could not parse node property
        i2c i2c-2: IMX I2C adapter registered

Fix this by initializing s32_pinctrl_desc with devm_kzalloc() instead of
devm_kmalloc() in s32_pinctrl_probe(), which sets the previously
uninitialized fields to zero.

Fixes: fd84aaa8173d ("pinctrl: add NXP S32 SoC family support")
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 501eb296c76050aa05386c51ef6ae0f97d4c76c3..51ecb8d0fb7e8a203e10cbe965dfec308eaa5f30 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -951,7 +951,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	spin_lock_init(&ipctl->gpio_configs_lock);
 
 	s32_pinctrl_desc =
-		devm_kmalloc(&pdev->dev, sizeof(*s32_pinctrl_desc), GFP_KERNEL);
+		devm_kzalloc(&pdev->dev, sizeof(*s32_pinctrl_desc), GFP_KERNEL);
 	if (!s32_pinctrl_desc)
 		return -ENOMEM;
 

-- 
2.51.1


