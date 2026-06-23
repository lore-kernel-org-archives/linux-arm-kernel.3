Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC9BCDB480
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+McTmOMLIPUuLLM47k3fHqRzuLTPsVSB+P6EOYjRpc=; b=ehNNdQ+mZ+BCJUYUnVqiPSPgXb
	vBLX66mO5FmaYRlE/I86ylRue0/O/MbDdmXwubcjk54USkE0GHzJJbYKAn5tP3MbpiAwJPu5qfNxk
	wLA48JVtAUzkiGvFdyB6XU1Qzdda5w+C4LGzOcX6mgs4Ke9bFHZHcpwpMFVXJLpf2pF0RRckZNUph
	0buDktP4JM0dsev/SK7L0uR3+poZV1OBglV1yn+/MpYvjN5eqJz7W1yP0e8u4FSst88Va5AVosOod
	FpIXsWX7u0fGIZEdGlIeYEf1IIRJyBRphgIG/W/OBm5Nc2ZLf8ggv6AuDQEzC7KIDkbeSZpljD0YQ
	YxVYRQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc82z-00000006sGV-2KxD;
	Tue, 23 Jun 2026 20:48:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc82x-00000006sFZ-0fw8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:48:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4624c1409c9so260790f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247717; x=1782852517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+McTmOMLIPUuLLM47k3fHqRzuLTPsVSB+P6EOYjRpc=;
        b=UF21FWqU04GQhH2rlyVseWJpciuLKujSp+Zb6l+cOYd8zV70Hz3Ti3zSJobaahrKBP
         q/zZLyt6cISo3yJXpqzYJbCq4MuK6UuNNSE4MQiMIIsf5J1Jx+gYFRIFXzqi69lHIday
         ynBJ/sKN/FNMS8imTd8djA5kZ0BMAcipFdgrFKcD39eZaJkrPTpUiirGeJMh7yeGCJMt
         XYHmPAx/iclYH/mxxa3+AO+ti3rWQ94OzSNbySBzlaXrr4hKy6KffwwBGS4gKiBTz5dD
         +VtAavGDw8g1fqJSAk9xcg0sbmjitYzFSiy7KUtHW9cRmnAjTr7VCwVq8PTpQEesP64J
         bxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247717; x=1782852517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+McTmOMLIPUuLLM47k3fHqRzuLTPsVSB+P6EOYjRpc=;
        b=es+Hq9yizEpBYZCD1NW+XvQmKb9RWkf4Rk3RZip94AUPTtUFmCyQCAphkf6mGLvlZ9
         IoGhba90vH7zblnCBqtwy7F/8BPw8NFgPBf2k26DJ/VpblGofOc+Nhu2I2/MfcjjOBN8
         VCHJe7wmGmSQuRxLgzZyY9uLf7H7ntQTay972PtH+0yAQRT6FyGBEemAe6NC87oTOots
         M5bxmY5zEXXuD9nRBGYo+KQbdM8RyGY7dkwUYwiIkrvA3hVFslVz0l+Bj87CstTPG1/+
         RmDxSKK+WcRWx9WTt6kyCfPNhI5HUWcf7e/MHQrY4DWIIrN9QQTfUa+rabeYBSFz6XX8
         1P+w==
X-Gm-Message-State: AOJu0Yxtn1zpFKDeR4HMGXSpIPVTH2vxHdiq72eoTzV2FauTC8KmNLs+
	vCa+L3Ed+zmBy29f2XYbywBf4MGkcdCrc7WICez6P7YfymZK9OdoORmQ1qaEN2ctj0Q=
X-Gm-Gg: AfdE7cmPfAsxd30yywArftVudtI/SgvlX4QyA57C39weEGeZ6zIFbFsJwZDm72IW/zp
	+NlxfIBzKpMJqJH4FQiDLMEY0I2iGsypLwtfuTbwWq3L5MumQ/WffZ8nHLQltWkYIkGnw2tgwF9
	qGSdKljM7MGmxSKXu6CRDdQCapzBUFh839yXIs7lVNVI8yJGaIgF3W5OPpWRS9nuq0L/35a/jmg
	fzG/3YRgZrv8JukMQClClbYbbn7PAL9itLijpAeCeA/dKRf2fVtudW7ZEQflv0z5TdhKEfhXsUY
	QTk8nLVf4FNu2xo3/AzWoo0/eK8WZBtZIGXsnOGF0vmFfSY7xAT81h0MogciZgtdXlKYYcd0Wiv
	P+DW8BOMASSEJX5Pkp0cfzhHQtEGIIiUTTxMWjWGcbaN8y7B6Qu3ZjGxwyMFmQoKpmKsvQ/q2cC
	po+MA5Qbe8sXXHA+p5b2q8zeOo9tJgwFlgd5simwUnhA==
X-Received: by 2002:a05:6000:40e1:b0:460:3233:beee with SMTP id ffacd0b85a97d-4666358161amr26055694f8f.42.1782247717200;
        Tue, 23 Jun 2026 13:48:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:36 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 1/6] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Tue, 23 Jun 2026 22:48:13 +0200
Message-ID: <20260623204824.691832-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_134839_203024_DCF32B2A 
X-CRM114-Status: GOOD (  10.84  )
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

Enable Allwinner LRADC input driver as module to support buttons on Baijie
HelperBoard A133.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4-v5:
- no changes
v3:
- new patch

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..c267f0906460 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -527,6 +527,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
-- 
2.54.0


