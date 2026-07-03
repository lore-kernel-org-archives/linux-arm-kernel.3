Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893E1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+UNia9moTKDJ9co1FJK0IMviLV0v2Ow9qfVtGCiwwk=; b=H/+cpo13L/exIwVz2bvjao/ayr
	In4+h0uPCRFA9mpngi+LMUE4tp4XQTShCpe5CtgfIrHu4V/CwZwqOkvW1ZBBVUxZK0ekkWThjTnaG
	JdIc12iO6u6+PsWtdu1bTXJboChNAA6CtE2w3cTBq88f1b0TcAkZi8obWbdukxCb9/7lrttTbR9w9
	VDqcezELCSmEfFWyqgaMVSul9MkuyH0k47lGLXEHRxlAGWsu4I9eriiI4XHuKTQr3sabfnh/EtFzj
	A1KyNBV2i5FhG7KsEf4IQ35uNmrtURNmvpasmY+k2ZYKNVshAcrt5taW+sVkb1b8rtW7BJt5ua3F9
	DaJQ06oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXb-00000006OXW-26gr;
	Fri, 03 Jul 2026 08:46:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXW-00000006OLG-0VIu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so1593785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068384; x=1783673184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+UNia9moTKDJ9co1FJK0IMviLV0v2Ow9qfVtGCiwwk=;
        b=ZMjGC//6WAiPyzyNguImeLyiWAAyn9Fumf4nCphUjVJCOi74Zm8GhUMiBp3gFe4TUv
         p+OncKI+5AS8Vv5IKfF8tImiquLePuYM33OfoxMOrrlHQH5TcI8Tkc38yZQ3K7h11py8
         eg6jJ/KUIiHZeV4yAkghC1gCl1+UKmr3uE+Z882wHvEt5juEYaQjG2oUN/3z63sMyWRS
         q9GU2LGNmMHU9CSbvtxPRV3oCjuHrUk6SXYWFAlDJeExKS/KXtqv2vf53+SaduzkL8YT
         O15+fxJ/vNOjSfj00K1ZGWEAZXfk1wAEz/lrJYRbP9Tpc00Ya9v4KtGx+4+aRedFEIu+
         vQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068384; x=1783673184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+UNia9moTKDJ9co1FJK0IMviLV0v2Ow9qfVtGCiwwk=;
        b=cAzDxZg91R7I7mWIHmw+zrjM3bpejOxgyeW5G/EtEXNMOxbYWgty/MpgBPnU2pTxup
         tWVvcuY94AEh4Qiw2RXuQQc/6yNX7Fvh1QZHIaXgqHWjRrbcCAluWA0tOQ6FDnIN0xDO
         SBhb/6pqWRL9sn7w1g/f40w9wJxwfq4Nya2IMQq5PUmtzdV68MGodanh0aLg0miQG5hz
         /LljUudTBAFneCUvCg/jmQzrxDqdXC50E+MPyqQ9FZEgXDi0u1Ifh9TSDruWnizZ1Mh5
         6SJ0QAAy1VkSJ3ntNnZ2SY+JV8+Fh7fMWTw6SE9tTzZCRZjnAnk7rWK/7rdAQAfSIB2E
         NKpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qEj6jMXZb/OgWAKrMyC3Pxx9VBz82OC4KvQ619hVXsCIr3RRyzEwfFCuctU0/oCaq7+Bqf1891LR7nPjcywR7@lists.infradead.org
X-Gm-Message-State: AOJu0YxNYpwyW72QXJfEE6QabPYPRnPomZ1SSM7pnp0s+RwdFlN2u/sd
	FIyQLrzNGKjs3ixEnzHzsJWMWsqO7g7l8uaFXpaWg/DRV/Qa3iOocYFZ
X-Gm-Gg: AfdE7cmdi2us/8Kj/vMQKsSbuwVlJl/yc1WRoGplToiTJx9N9nGgL1oyHlnLSkKjBK1
	u5pKEVBhfBqZwW21pgkgaKAd7oHXYYR0PsIZGge6EfhoFqy6pJxLcWcaUKQ+YtFt4XExJUGqOJV
	nOBthMCK4YYpwu1+BtAyL4W6FH1kzMXNr1qBLN4bumu7i/TyFkJvW0lqQZF8UWgMSA76X8DcRhY
	WHI4sgSgdK/ApvyHtw6t/YyVW65EZiD2o4iI8DirLH3lo0h95XHz89UfWhfXla9gc1xNXhZS9Tz
	GbQfLXT6cEn9oRcLqQnCl5t5ARm2UFGvvIyNWHREMnIIfA8zSp6wSX/s05psKsoomEXMiJdu6cO
	HVF0idsYqqQFHA6TC+xDEF56dogHeO4thRDD5yQ3kBUAXFwY66eVwp+8Jeux7XNvh7B2Bmp+l83
	SMoL7Pso2LeyyIRJftvc2wd3mOetaCdV49cP3STAqLgTGGkHMYwj0tmHFGN37imS8jCPoabOtGU
	Xe0GrqoYT2dKuBwo36Zwvanww==
X-Received: by 2002:a05:600c:34d4:b0:493:b8cf:cc8a with SMTP id 5b1f17b1804b1-493c2b3ccd2mr119335125e9.4.1783068384366;
        Fri, 03 Jul 2026 01:46:24 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:24 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 15/15] arm64: dts: imx8mn-var-som-symphony: Disable internal RTC
Date: Fri,  3 Jul 2026 10:46:02 +0200
Message-ID: <1581109f79e902429e291b0e7760a81ecc4bd0e0.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014626_183661_F7FDBFB6 
X-CRM114-Status: GOOD (  10.42  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Disable the internal SNVS RTC on the Symphony carrier board and use the
external DS1337 RTC instead.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 2afb5b438b68..364127257309 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -223,6 +223,10 @@ &pwm1 {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3


