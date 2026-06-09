Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE135CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=; b=EGyRjuE0TiqK8041i19RKkmIhO
	kNuzfZZWb++DTM9ee1PtDUJtln2plI9rHbIp2jHetxy58UhFV1PtcExFpXTcZ3OEwwf7VeyiGLAHg
	FFf3O10FDZRlY77OMRifevicVAgVdHXPW060tcfmcdhDUdrkcAfeJhkG8OOyzUghvew2VTmHy0Xl0
	EL12OkNRkYbN9MdsJkw+ii0k5SVjMyrM3esFKhdcxTAzdkCsHTXkComol6QwbD4CCjfSGaSI8SosL
	Tl0BftIpGzeDRw+l9/KUK3O+5VzpjuOgHDTke1zpCgTwuuvjzk6tE8d7rJJDCg4RQ22M19Lt27ulm
	lF0hOeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy96-00000005siR-11Es;
	Tue, 09 Jun 2026 15:13:40 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8v-00000005sUC-01Fc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:31 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so10319335a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018007; x=1781622807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=MMuT71MFJgjuYq8WME89dNukzF1e5ZW19SzkvcISaX729UNyQCrSH3/CIwcHLT3+kc
         iKlt6LimEFnzLGyEYXPShoZlxU3bNuEr8CYd2u4yS9JrXrM8jZYha539qJL4IK+3oytJ
         lOT1JtQWim2mEJDLbS5IW4XCl4n4zAMwF4uaWdyX62de9w+Raq8UyOxCNbZV9ZVx/VCz
         F5VJsW5SwAW/CAMijaqpgF207t7rq7gDimBMJHkcvZmT4phlpQJoABPt2vl3c9mzve7o
         G3tGYpbaKO5c0Pnk8QGrBtDouqLlARpAhiWFviLU/ThM0/Wd6M0Z5Pc6EXBZy/8zKDOG
         5DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018007; x=1781622807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=bU0GhKlUa/nbYzJUjWeI/S+w9djnhzZ9HQGptADcUadb9a5BK9qasfbM2evz/y6bR1
         hkbGhTEtO3vQgt6wKw+cRP7U3CKDHownBm9mpU5kayUDzFMeEcKZrWCuKQvCOD/o+S49
         rPIyKCuQN3DVQ4ez8+bbVN+2h+QLKwB8RwQwNUVDEozUH82rh2+frild1IRwnyi8q9m2
         5zsRSxhU19SeoF+mYlZADDXsp0VJBOSffFbF2tcULkY0DHuo4LnUDSSdMvOSzQT1rjxq
         vaIzksAKhCqOgDSu9OV8zUNMR+W0zt4sGgzg41nQiHtc09o7NMATy7VYT7e6ATMeMwYq
         KSoA==
X-Forwarded-Encrypted: i=1; AFNElJ92/Q3y9DUZVJVbxqESQwXCmzFHc2JLNN+QDd9OZxxfYXh7xuql/MyBvNJ6/jAhFJlDGhS1ebtYdsCS1VfJTV4P@lists.infradead.org
X-Gm-Message-State: AOJu0YzHDJ/lz0JPFzI3D4B9+KN6Fx9BQphLLFjg9hMPJYR6T5SNOBdL
	c+hU7FKQ3LW+IzrPmN9IFoA4rsxXzLbm0TkP3Zk88fHjwzJyVdNu/Kn0
X-Gm-Gg: Acq92OHOH4haBHvqKUo/8qwJW8CfyNEQxYQk2AS4nMHVNeINUL/bB5VbQd33mZeQiog
	0yKUbx+S2cJswuM3fsvXzaVF51J1ERimWWVm/xtrIUa1nPT6YJxJw3AomrCNWwdWU3lWbZ9+Z38
	hplS9iip6k1XZrBFP3TiF1BPQe5UsJb2jKtdZEXZcTU+m/oBdmRDWCYZbbnr0Vu9t1jIGnz5qBz
	VqDYOYlx4CJV7Vm8okTxC21qo8eqXVb+GMzffXEyDV1XO2BuabY8wyBDkEL8gvIYgk7sRU6YxOl
	+nCvI37aWpHG1s/9vPdaNONl6X410doHetzTfA72HzxPsr52xQn5df2qF7S/pxX/7Ja0eRX/pEa
	OxfMt3Q4kToCYPhH6gfvB7BqGrLtR6Ffs8sqn2ldOVdsZ4/ALsbDSArZaC7i+UbI/JFHio6TKok
	tYCfSpyctakA+MPtaYui4Ix9lnN5Td5o7v
X-Received: by 2002:a17:906:d552:b0:bd9:2b46:99b0 with SMTP id a640c23a62f3a-bf93a00a5c3mr170280066b.49.1781018006681;
        Tue, 09 Jun 2026 08:13:26 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:26 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Tue,  9 Jun 2026 17:12:04 +0200
Message-ID: <20260609151212.29469-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_081329_151937_DAC115FA 
X-CRM114-Status: GOOD (  12.02  )
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

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746..e6584a2f705d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0


