Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4305C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=; b=t9FjnLHTjQp6Nj4K/K53dJSFgY
	lycHcN1c+PZA1nc0W3ceZwJfgFJBOJ7jkGmSGrw2/xFFrFHy7Uc4A+SxI6A/4fSM1GcvECSRA62Sm
	zTD/9bxWqWQWRCJFuAqRVVUB4lQ9u9xb8af2Is6Vc4r0FIk6w5QN5xa0PIlD+tsrDUiB9JweuaJS3
	q9/rlVF2RQmIrZURP9KNsVmk03l16dY3s8c/p4CW3JXgoKA+FeN6zNq2by4eb2hC1j/KlvTrCHhw9
	y1xmIAIL8LDCbYNKU2Ey6UxOa5CS26B+iDS1ixMPECjYZrpGZQk2VML1SdmgpKGEM8ZuWQUdmwDyM
	vFqKFFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JtA-0000000BGzB-3DiB;
	Tue, 01 Sep 2026 08:30:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jt6-0000000BGqF-3PwK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:30:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4956869750eso29964325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251435; x=1788856235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=;
        b=F6ByObjapDhLozEU8h5OPT6URfVEEW3YR++cgFXTiJe2W0xt611k1J97OsAuucNKhk
         j9yGE2HkvYhCzohFy9A9Irvfkph60a1D21ffcoZfnTKcMNCGo4Ud9CqQx58KbgeaJANf
         Zz6PHjworJwB52XWOEzuMX3enPHuZCYv/66MDO+OU3GXGbUE49vX4XK40G8F3goivHZc
         h7iIrVd80Ui8WniyIHj4zUy6u2t4PDzrEERLRI/PohyMGa4y0i+ymEiaZvkGocLwNwrP
         mXD6lghYMf3HOF/zCPIt7vDlQ5nuBlsctpnK5K3TgxbBe97eEjylM/zrhcwzrthS1JjI
         PDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251435; x=1788856235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=;
        b=bqryDv1aDLh6ujpm42n7NNXADKunZU/8rfWZxxIZr5AUizJwDRI8kESAbKGYfWl4qt
         EhUNnpe+P8LyhpiFJr4iASYoMq5DVyTrTGgTXY1DW1BPbyun6X0SSVj4fXVgbfYCkbG/
         IBdkemP+awooUn1ebIZ6jUjhnn0IgL3bWlmYQJTEhTVBD0axOyGEzShKHpgLXc1gJZoY
         8LUGaA1iwRawfxXgLkgqz/itTEGZYKbsUkxyl/JUOHbPbGzzw+eWQFVjbkp66HMLJaqY
         igA+hYI4HF0AgL9QQdgPcl8yCapdeQo7W7mQXJFhyPYXb+SPFIfc3Q0rBoFU8BJ/inAK
         tWAg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0jK0HFadgEHubN2GGOsXEvlQLw+iBdPcGiB3LCgYg+gAlooV3Axq/r2joQXYTpKKV4zodwGN8r4mF+1ooDTyK@lists.infradead.org
X-Gm-Message-State: AFuF++nWBfd7QkwjCAKKc+0vKQJyy2OVyr9CktxbLHHn1QSnDOKlBrRV
	uzaBAZTB1dYFr+DJnh8r8POeATn0f1bWsK+zYFH1fELTmA0J1jqb/dtv
X-Gm-Gg: AR+sD10InAoiwcDYYyFqah+sRFaXOF/kv7kzr3lXOAx3Ivwnl0/qVGQbsu0S4VxPIw2
	EqMYSDJWX95bfM5q0QWNV3/MPdgyIItCmUdTM6hwlTA2ki57cQR8+2ZgdRvJiDCz3sPPufprkRH
	Y4CD5xA9306dm4hXAR2WEKtYHt/dpYXg/2tvZfI0fvvpNuHGUd/arlSs4S2UGh+jtd+c+Is+Zc6
	aUbdf6cKHSczQOl26LRC0fm4LdEQDVnpsKl3PsDOWAcoh35SWu2tE6GXkr6GjlyOjBJ6Xb10Dd/
	Kslhqbxh4LF9XdNqivo8DgYm6N5NY9MM55RaJHY8UgdKfd63pg2fdI8PdnPY+ynwniOKMDMhsqy
	Z33WrYn9+lCL5LOtM0/YOOgL4vHpHSlI/RbosTRQicIy3OSTeG+URY5BrPaKYfWPNvcvGveaqAI
	kcpLPgcfj/o8vfrKQ6gdFcPhYFaiCpv2OVSefSorEQ3xkGF+9ZrdikNsCf4Ameu0vqrio1cTE1x
	bkjNPuISoQDRxxgtTZK5nrG+TYWdua0bVBAwQzysnOmNjIHimQR
X-Received: by 2002:a05:600c:19c8:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49b91c20bfamr493430315e9.5.1788251434958;
        Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v15 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue,  1 Sep 2026 10:29:23 +0200
Message-ID: <20260901083001.8044-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013036_928040_DB6377BA 
X-CRM114-Status: GOOD (  11.58  )
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b42e898f4d8..1b4f79be5e54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9757,6 +9757,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.53.0


