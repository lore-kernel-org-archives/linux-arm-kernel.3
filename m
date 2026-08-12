Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE1CC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nV9YBKtsEulfVjfXfwXT5cEXH+7jiV0CfcyyBTJ0j6E=; b=v15/GpCGP2IuK6TSMQa6A7ief7
	Ss/lwkaX4Xct5cBcqW60rIhahPCvgdAKETy4Jicx9R+1/Mt70ymY0viAXiDNoJa+bnI9W3DiP1qq2
	vqkKUzF0dkGUo75EH58AJ0fdSEhA+ZF1asAuaLL34ceytnvhVKEiKI/LWoRcwNGTM9Ew0yUV137Zs
	Kusc0oUwSGsFTzErG1oeHV2ckvG4G0O3DnD6HNcXBdJu2RyJtUmWiqJ0+86RcpUFHl3H16leAjh7U
	TWX3vlGy/NWSm1ZxhcfMH3sYYen9hNz+/WxtuLRMhB/DyBhezr2g31QOHsNOXtUJxYtkJ7eNP9Fph
	pUf2Jshw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu90A-0000000GHD4-0Rha;
	Wed, 12 Aug 2026 13:28:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu906-0000000GHCJ-39QU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:28:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49558ce01afso7552385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786541289; x=1787146089; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nV9YBKtsEulfVjfXfwXT5cEXH+7jiV0CfcyyBTJ0j6E=;
        b=lpSNnTKVK2PIvHhRmoy54NgPn54ndLG58Pe86pcFOb/9+r9GQz7hb7n5vzMjIavlpc
         PFP4bibgx5pPGTp4sZBwYq0I4/Q+1CIhI9wqpxRoCuec4NVuSZaL0qBz3A1zh0cibgcq
         tpwHlt4oB9sVSncEJ8GGBzjQdn/HN9J6RzS9ANwOVs63YVo1Zw3V4+9ATqqVePZCgLaJ
         3/ZLqnKmgesIl5HxUzyrJNHwt7LW15/6XoxntvOYexHp4sKBfQiz1sJXHjr3DWSCS4M2
         /dQA5RBMOaqMdOu8P7P8HzrEy14gKUxomtrrC0ubaAOwXSR9sfnsPTEUafDwb2EIm27+
         qQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541289; x=1787146089;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nV9YBKtsEulfVjfXfwXT5cEXH+7jiV0CfcyyBTJ0j6E=;
        b=iulfELS8+UUJ/I9mt2QfrnrtxaqWX0hiS96bK55BpRDobDHP0v99/OiVT+ER+qRehV
         d8aVc2EGAXXhdgwRDNpVBH7yviHwvgithxaolK3oj0q/r5U2P5vXUrnnTvYYusSl80n2
         +WjZ5A/uK6uaAIBoSEVLjSqeN9XwfJPbJVTW6f13NqJ4q5j7xoyt+hodq9vW3KYToftY
         Cz9S0RYBcOlIOXrZ77PASFLqr6oK4jpzQ7FDCzLOAryHuC6Yeb9lUgIXX3zbLlN53P/9
         ed3L7tmY7eIkFREY6msHefr1e/np/SiK+z4p6mWo/vCwCyl5YDDieezqMVMRDSUD8FGR
         hR1g==
X-Forwarded-Encrypted: i=1; AHgh+Rp85tCBwtRds2w0MLW3DJI4vfr74suiXbrKCbw3WaNNh/P5CrIXkCKSWl2L8OBCUEfx8tCyUprfSELhVgDq6LEU@lists.infradead.org
X-Gm-Message-State: AOJu0YznxQA09YNZxrAgPJdh+q8XatUlr+a6dG3V+nOk2cXyKCuBE0ot
	JnoHtFQhAgVGdPBotrnBnl4+laBFNpPNrjC/0qOdeq+gA2g+MWprOLDi
X-Gm-Gg: AR+sD10WiLwTCv9ZAcEfTpXusFzl8S1L2HD/eh0BabxEdPFw7Q6uerEzUmeH20uEcD5
	J+VWox9r7tS+dpitci4eAPYieZKqCF75WWM3tIzmrskSkyFEUZr+gI7x5bUzIzTkF/mvKIDr29y
	sVrtQMegVFys8bym9VaUl0/KAQvdNe4KfSjx//GJqjDuYdJCxbp3gaGGLD+jiijqJbWtYmZKJs4
	Eh+HWL+L/EavzxKhFFWktDlUI6CeXe1aE/1gReWqXN6SYCxeCbdM4zLjUzxRFXEHTteBIxGhzF2
	wZ2Nma0f6usHZr0cY6ytLgKp4PbwkjZILlJWQMmRuW7LtWN6Ho5gDfm+X339bkwbUwMLKsmn/4h
	o/znn/+IhUKUWLt/L5ymMVXWZfv+w0sBs49wxD30pxjKP1ezqps7lMP+ItsRocr/WUvoXWyeVXW
	j+Sg+QwH4prkxANNlSHwH+nMsw5Y6ns2eWOc+CBQyiBaMqLyX5I/1wCutM3v39GMFB2ZyLNZGiv
	k+hgzPjJ+78l8udEy4hQlZcsYrKQ9vrldyEKkxU
X-Received: by 2002:a05:600d:8494:10b0:499:5282:f8d1 with SMTP id 5b1f17b1804b1-4997c13bf0cmr53031495e9.12.1786541288777;
        Wed, 12 Aug 2026 06:28:08 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf917csm87818995e9.13.2026.08.12.06.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:28:07 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Semih Baskan <strst.gs@gmail.com>
Subject: [PATCH V3 1/4 net] net: dsa: b53: deal with Northstar devices using CPU port 5 or 7
Date: Wed, 12 Aug 2026 15:27:52 +0200
Message-ID: <20260812132755.32585-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_062810_810348_251815CF 
X-CRM114-Status: GOOD (  15.01  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Northstar devices have 3 CPU ports. Ports 5 and 7 may be used but have
their limitations. Warn user when CPU port 8 isn't used and add EAP
setup workaround to avoid non-functional standalone ports.

Fixes: 4227ea91e265 ("net: dsa: b53: prevent standalone from trying to forward to other ports")
Cc: Semih Baskan <strst.gs@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Tested-by: Semih Baskan <strst.gs@gmail.com>
---
This fixes a regression so it's a net.git material

V2: Print warning on switch setup instead of on actual EAP mode change
V3: Proper subject prefix & shorter comments (long one comes with 2/2)

 drivers/net/dsa/b53/b53_common.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 3f5b9592794d..5fd8362d0430 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -332,6 +332,14 @@ static void b53_set_eap_mode(struct b53_device *dev, int port, int mode)
 {
 	u64 eap_conf;
 
+	/*
+	 * On Northstar setting EAP_MODE_SIMPLIFIED with CPU port 5/7 breaks
+	 * standalone ports, see:
+	 * https://lore.kernel.org/netdev/ce4d9b7b-aaf6-4796-94fb-8c3d6a1dcd4d@gmail.com/
+	 */
+	if (is5301x(dev) && !dsa_is_cpu_port(dev->ds, B53_CPU_PORT))
+		return;
+
 	if (is5325(dev) || is5365(dev) || dev->chip_id == BCM5389_DEVICE_ID)
 		return;
 
@@ -1281,6 +1289,10 @@ static int b53_setup(struct dsa_switch *ds)
 	u16 pvid;
 	int ret;
 
+	/* Discourage users from using port 5 or 7 due to limited features */
+	if (is5301x(dev) && !dsa_is_cpu_port(dev->ds, B53_CPU_PORT))
+		dev_warn(dev->dev, "switch to CPU port 8 to use all switch features\n");
+
 	/* Request bridge PVID untagged when DSA_TAG_PROTO_NONE is set
 	 * which forces the CPU port to be tagged in all VLANs.
 	 */
-- 
2.51.0


