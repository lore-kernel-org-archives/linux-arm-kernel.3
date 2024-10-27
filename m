Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0282D116E8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZUox4fpqeo/zDddrp/d5ARvM/uTsS9cEvM95lpoNCeU=; b=gsRA/wdiUeCnMcLsr4f2UVktCB
	CVMc9lTj7Ma8e37WL/GWcRv7cT9G0hHA/MeLsy4FiAqBFOCwNvxVdv+2rn/gx8Zm6PTLvBgQtEs6M
	BygL14NKlBhH4JtB3t0QqF+H3mkw28iUqYZLiPgoinfV6RMSCFiM+ThIjURKR0HHMvAkj7JkdkD2w
	mR03YlNbOZtqstRFET01YPEKNHAsrWDaZCewiWYBhxY6bgGxSIACPcNt0cqo5Ra8Je4HWEaCQffkp
	xnf5gonVWX0NhF0mvCbnFwQvaakWohn+Ei8aUcRiGDInE52uam6zbaqlbDZu8fUcwkALl3w3JKtXd
	na+hE0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t52Nt-00000008DNb-1sWz;
	Sun, 27 Oct 2024 12:28:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t52MI-00000008DHm-0AlR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 12:27:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43159c9f617so34047355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 05:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730032019; x=1730636819; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUox4fpqeo/zDddrp/d5ARvM/uTsS9cEvM95lpoNCeU=;
        b=dxribJ8pa+4IvyeLUbar7WchpFIvccxJR/l7RUyzYT/O0dgPInLs4kJO0wXJUIp3s8
         R9crCni+TQgANNb8lSns8cxkyEpu1yFSO3pryrMdcAk6bnaLoqmRdSi0L1A0/K9dmFh3
         mspOkP3C97RSqaDNhF2i1+G8umINW6HcZMPiAPXyqJDJjfd8wq6JLz/qLByu0dhMkCXl
         0qz0wW8F+6Imj5fISWkgPb+wVLSCCmNR/ZCcJtGZrCERncBp2Rrc4Pe0N/FxsOHV1ylu
         iteP7laNRGCCFETOeHmSc3oze9DJRAYI9F+0vGx/rAAyOyzcVjpY0rWF9RukqpVZGCqT
         XN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730032019; x=1730636819;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUox4fpqeo/zDddrp/d5ARvM/uTsS9cEvM95lpoNCeU=;
        b=jPGEzUqmKUk7KsbBh+ZrCaC6w0Jagt6YmZsAgDt6FW8z+DJ41D9gBokXTTAkhSk4y1
         S/dtYnTUFSwVZIu6X3g/8D1d19fWYgIDdijs37yt8TPbT47BSDVlvs/2U6hQX5ve3hj8
         6gpJl0g8ysWdNkDpi7AkW9s1Z8Da7+RSUMLNcjmBsUAakL+Sjh7UEPFycLvu6DaowrVu
         jdgD2FgLdNCBxZqeHMCwQPuVK8DmByjY+nd+9mH6J0hrmdTIzJYaxCst8Gn1SQLxBbqc
         qT/5bDam7JZ43UEzC1OqO5emBLr6y+w4geOaWAKgRG5J5pey9I53hmQpfHsEN4xzP/93
         WngQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/MDh4l/E9uL1+lR72Gwky+csV2+HMtwIuhwgyFsVys/eg45lVs0O09tf4N3uHvb9j1GjLwSPlEQYlNxLbchyZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp2Dua7DWUfR4FYVyGVmgMyQah8rLJaIoF0nOlHBNrb+LRzY5n
	03cSaZO1aLH500EDjyF7rAr64aFDDm4f9SF5/GDx5iu6UellQGZH
X-Google-Smtp-Source: AGHT+IFXSjarOOyrm9SCHyLOkxePmegV6ax6tAQ2bgxrY3uY5BPagoFhiBo/T1Tejx8BUQyXMnKozw==
X-Received: by 2002:adf:e3c9:0:b0:37d:4a80:c395 with SMTP id ffacd0b85a97d-3806113ce39mr3910403f8f.21.1730032019083;
        Sun, 27 Oct 2024 05:26:59 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-a7df-fd2d-69ec-cea7.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:a7df:fd2d:69ec:cea7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b479ffsm6660329f8f.49.2024.10.27.05.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 05:26:58 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 27 Oct 2024 13:26:49 +0100
Subject: [PATCH] counter: stm32-timer-cnt: fix device_node handling in
 probe_encoder()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-stm32-timer-cnt-of_node_put-v1-1-ebd903cdf7ac@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIgxHmcC/x3MQQ5AMBAAwK/Inm1Ci+IrIo3UYg9aaUsk4u8ax
 7nMA4E8U4A+e8DTxYGdTSjzDMw22ZWQ52QQhajKQigMcZcCI+/k0diIbtHWzaSPM2JrmqarSU1
 SSUjD4Wnh+9+H8X0/eZHNJ20AAAA=
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 William Breathitt Gray <wbg@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: William Breathitt Gray <william.gray@linaro.org>, 
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730032017; l=1276;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=2VfQ2wflpZ8ggu3Rv8nU1yTN7fzoGtQvbu+rKsfAeS4=;
 b=ttxCObxsybWJIgkp3t2xxh4Xm7JGzXtW4FHFxWo2OkmZrk/DpI+wSsrsoHQjA49VdenYI1+Ym
 ccrTBxMRZYCDzDOzYdTjD9iZQqPc25zxaGhNPKBePtPyyGRlsA3UUMT
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_052702_446511_5A67D78D 
X-CRM114-Status: GOOD (  10.80  )
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

Device nodes accessed via of_get_compatible_child() require
of_node_put() to be called when the node is no longer required to avoid
leaving a reference to the node behind, leaking the resource.

In this case, the usage of 'tnode' is straightforward and there are no
error paths, allowing for a single of_node_put() when 'tnode' is no
longer required.

Cc: stable@vger.kernel.org
Fixes: 29646ee33cc3 ("counter: stm32-timer-cnt: add checks on quadrature encoder capability")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 186e73d6ccb4..0d8206adccb3 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -694,6 +694,7 @@ static int stm32_timer_cnt_probe_encoder(struct device *dev,
 	}
 
 	ret = of_property_read_u32(tnode, "reg", &idx);
+	of_node_put(tnode);
 	if (ret) {
 		dev_err(dev, "Can't get index (%d)\n", ret);
 		return ret;

---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20241027-stm32-timer-cnt-of_node_put-8c6695e7a373

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


