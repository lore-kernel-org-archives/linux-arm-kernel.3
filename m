Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213CBCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 21:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewK5P1QfPFXuq8AEptM/4r+//JlhduxVqODFxsi+6HQ=; b=tgiQluGLgeD2yfqjzK38mkbrO4
	Td+bFhVCSXajX7Q5dvbB+ODKt+XzByHlwN5YW9IeYHFmNEAxfRKAb+sDg8CYMU+JosmrRsjfOTQpS
	HrRxra3DIm5PBVr0Ke8fUxVLyOkVasMFQH6rF2lhMQ//89DCAwTNVz1PqTnf05zU3DZ+1cyebg4fP
	saE4GUskMTNjdeNZ7s94wUCd74ddcpkeL0QawGFYZw2BEUJryLgYPL9rOdwICGacwtB23Fp6yUmoW
	op0zost8e/MtOuqn8LSPPtnIlQhBW0RpYIpM29Q+wHKwE73+h9ma2lK2s8LF0m6xtbnN4qVxnPLyp
	Jlq+eD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIwML-00000007oyj-1zNr;
	Tue, 11 Nov 2025 21:57:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIwMI-00000007oxX-2fOj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 21:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762898221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ewK5P1QfPFXuq8AEptM/4r+//JlhduxVqODFxsi+6HQ=;
	b=TJTWhuv9ip/y7P4mvqGycPb/Bascs1CipPBlBhqhPbuI6nOUPCjvB9b79+sox5feuLjtIX
	q37HssERFdhp+09FrD3D/AyHohkQkeM/g+M1MCFPSdWm7apAHqONYT9OFrPy0Ou3Gnys4z
	9QfinCIlf84SuPsFml/ln81eVDT0egQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-Wfdf0cNLOmKU8sHZ9OSdhw-1; Tue, 11 Nov 2025 16:55:13 -0500
X-MC-Unique: Wfdf0cNLOmKU8sHZ9OSdhw-1
X-Mimecast-MFC-AGG-ID: Wfdf0cNLOmKU8sHZ9OSdhw_1762898113
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2657cfcdaso27590285a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 13:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762898113; x=1763502913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ewK5P1QfPFXuq8AEptM/4r+//JlhduxVqODFxsi+6HQ=;
        b=akQdKKn58+vr+YxKj0PK3hCpzmM7H+fwUNrDLYnu5i85cz8yEB7X3hDa2svqxTOGgz
         Yu78Lsr6txYsHgpC5Ts6e6cbqGy5N9HHaRxxow3nJodrVZDTU9pKbNJnyME9sUQE59qS
         2RGwujca3Hd8JjFUwDgL4cSaV6qRrzoJCtSn/zXqdCP6Gj29bKiJZ/31QJAb2CzWUVQ/
         PnzFnnMOqOol9F1QXiyKhPq+4AhsJOJS8lIUswmC9EowBzYzvO+7g8Mj8Tf3T8XIvQIi
         1MTgrD4jTmRJgAAuQPEOJP898G9zwNmt+zGcfR+UfDRgsHqZNi6/jwCjqEw08IrriuFs
         sfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWo3cF/XCGPK4U69XlsKaEv+MAGmuIc6kTBHvYrdvdK+0HY9OyUq7dwvJn9mgC3b9VvUwXZchHAFVMso7G2Ebv@lists.infradead.org
X-Gm-Message-State: AOJu0Yycv6Xd1xOrT7SFwMEhK1Ql5p9lXw8zjEsb1lI04LH1M0W3gycW
	Zo77EqAWijMm4v7j1gBI3m2E9cXi60czVVcUrdfxayfUFrUTXzApkLw2tTa/4+C3U84KvUc/TYp
	TQkAu5r0Md6G0n/qOAzuK3agn4CUrwY4K+h5VMFl9xQu3zQWGvYVmnC58Gn0jHmakfMAmaqdoJu
	NJ
X-Gm-Gg: ASbGncsEjBrG7WSI0bWs9b+x9RMi9NUhd+gAkaTUWjT6DFOpDuzr3EvKUsfmBpBLA8C
	Io+oBfdiMVNyHq4GMcHTU41+YOQK8pTA/w3pTy/tFPOJopPGbcw0eZKFCF+RGzLRS6ixHCjgVQq
	FEMWKbGleO1H+V3Kuq0BQS8NoTIHnwsHRlCcHn9WLYlndei0vQwgjy4brdPMDLwSmpCuBTJVJiY
	uBLcUMCK/ggAkgrS5sm+mScb4Dr9635akOC2dk19liu9wXsMfipaCEqkYzShmVXctFJrsltlVy6
	OdD8148WXqGoOEOSAxC9vO5e624BcO70tT8+rCH5giNFNDKU3lMXjZnVNzMFTlTIcZmQ+Fwkvtr
	fM7RfnPGoCvdUU6RrYETXSXPmtbpk7ds=
X-Received: by 2002:a05:620a:444d:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b29b7676c2mr114414085a.6.1762898112732;
        Tue, 11 Nov 2025 13:55:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpYrk8J3pc0or2M4yWds8EC3twQQrc0f0pmbdA1sma8+sKJvQpmqvKN6KSF3KtIt1M0Qh7JA==
X-Received: by 2002:a05:620a:444d:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b29b7676c2mr114411185a.6.1762898112359;
        Tue, 11 Nov 2025 13:55:12 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4403:8750:d964:d6a9:f204:ed2b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29aa032fcsm61335085a.49.2025.11.11.13.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 13:55:12 -0800 (PST)
From: Jared Kangas <jkangas@redhat.com>
Date: Tue, 11 Nov 2025 13:54:12 -0800
Subject: [PATCH 2/2] pinctrl: s32cc: initialize gpio_pin_config::list after
 kmalloc()
MIME-Version: 1.0
Message-Id: <20251111-pinctrl-s32cc-alloc-init-v1-2-071b3485b776@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762898106; l=1042;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=BqPFFvqH7BoSFpBWYudwxW6uWlGnhLlJiqWls6goZJE=;
 b=Y4qJgOTUpZTA4incmVAXt2PUgh+wZtq/enkv3qwzmo0HKnIZRrIfXvDthp5qizHo6vEg6W89O
 JNcPu+NpNIrBP4dO8SBmGnIkId+Z03EgqR12YXVw1lviBIZBg5Oe3c8
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FIJpIjyXI_I2ZCLtXN8SWiDKX4ivR_bppL32zXFyfVE_1762898113
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_135702_746362_FE0EBD8D 
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

s32_pmx_gpio_request_enable() does not initialize the newly-allocated
gpio_pin_config::list before adding it to s32_pinctrl::gpio_configs.
This could result in a linked list corruption.

Initialize the new list_head with INIT_LIST_HEAD() to fix this.

Fixes: fd84aaa8173d ("pinctrl: add NXP S32 SoC family support")
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 51ecb8d0fb7e8a203e10cbe965dfec308eaa5f30..35511f83d05603f5374e2d09be4b0843c7d7dc53 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -392,6 +392,7 @@ static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	gpio_pin->pin_id = offset;
 	gpio_pin->config = config;
+	INIT_LIST_HEAD(&gpio_pin->list);
 
 	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
 	list_add(&gpio_pin->list, &ipctl->gpio_configs);

-- 
2.51.1


