Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B859D46C04
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 21:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZMLVQkjt0m3jqSNYOC481vG6R4cAFLtNHdlE/5eHfzg=; b=csdfJUh94b+ylGoDSfP44dISDV
	gyAzHxwCgkoWKFQeb+tXfYnZw6zq2eOqfkL664gxyGOZaLaUsieJ1ImiZPjxnnWONz81yN1uUMXr7
	0SHAqGAYiOWPiKG+uxpgDvUwOLogbB+8w/5iCB2n57uWEvhS/LTsv/dG87M7a5N7zXYvk6azNmIYF
	zk33S5+ANt6NtZOkH3DLO8AIFurT2FuOh/vRbGkVQwMVfyeQrh1aPZDxfgfe2slHlArCu5ieHT69q
	LsJxaISPhEjfYTjjmLvcQANu8pwz7hneouBz07BFFsVTbhAEmfd3B2+Ta6mpRwPUEBkS842vX7Ixk
	2rRDMECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlD0F-0000000GqGP-2jk9;
	Wed, 28 Jan 2026 21:23:09 +0000
Received: from mail-dy1-f202.google.com ([74.125.82.202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlD0A-0000000GqFB-1VAs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 21:23:03 +0000
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2b6b9c1249fso525885eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 13:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769635381; x=1770240181; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMLVQkjt0m3jqSNYOC481vG6R4cAFLtNHdlE/5eHfzg=;
        b=Zv7/DJiQHOyMqxIS18N+0KOJdT288+lsziLXX6U8ogPNDfyiU9xHchZgG1hLTuxYD9
         yFMs7qV8pafGSnsawf3qPSqVJa2XVMhY6bSs5FHqtICCOf1COHqMq2lzoaW6r1X/TkYN
         U2M5ftIuvmzHvpD7ut/6fLdrn9Z8bBmC7JO1B727JJ44gwwMFX6AmVCqhJgcX/Z39cq8
         hpbuHi3PebToP756YWCrWkLFxVyYIgr0gr+XB9WEf7Y5SehTIoKeoIuTsDz3tHkqAQqw
         TVw60Iqa1NKWC4FjUGwzmX3wCM4ygj9iinRalp0/LSrRYC+rSYPRWZe6TZSQ7OryD1dp
         caqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769635381; x=1770240181;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMLVQkjt0m3jqSNYOC481vG6R4cAFLtNHdlE/5eHfzg=;
        b=PdAmjWVb381FbqBqyNHQmjC7Al4HkfYO951q6L/xbsG/zC3kYFZpr+Sjvq29jvwAQR
         ofVVIaQxXX4wkXkQJTPtXuK8N1FwOdECOtzhdqbfhwpWoBWE3WqM20pIPP86krTg/CwL
         OnAwqZCF5FlBiLep9cKhgqj2pvy/pTWWh2cfmKogt5gTnzb/KHBAGRFojSTScytl68pk
         aAGoLzaN1HPHaah550Ya9muSvbaPxiOysEGvzd1lEC/uHxSH4ztMmZ79H29wl4T3zlND
         rjNH2jZdj7+8qWq6dPcyy6ovjCQuwSZXH7RCsGnbN7Mvo/ReKtLkXgZ65Wj9OS0mLH+U
         jLgw==
X-Forwarded-Encrypted: i=1; AJvYcCWwYVkNHFIHS04w0wgSzMgXWg98gIsKtuiOZICFQv5hrxRpPQOmbJeec7ziHL0QYVfKnjUj3awHGdRCwCVokLTL@lists.infradead.org
X-Gm-Message-State: AOJu0YwVeQjsj3ee1+OdZMJynpD+XRRrZcMhwMQyiAtV7iHu8jcvRxAP
	VGrebt+nyXDSJeFJjhFhIl16+JS22IHoOqSqA+cB3ddanyiEo4lpzBcpL+dKQu+u9D0BHPRoy9k
	yaEDDWg==
X-Received: from dlbqk7.prod.google.com ([2002:a05:7022:ec87:b0:121:ac3c:21fe])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:aa6:b0:11c:b3ae:c9f1
 with SMTP id a92af1059eb24-124a005f29amr4013133c88.1.1769635380815; Wed, 28
 Jan 2026 13:23:00 -0800 (PST)
Date: Wed, 28 Jan 2026 21:22:53 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACx+emkC/1WMQQrDIBBFrxJmXYsjIWhXvUfJItqJGWhj0SAJw
 bvXuuvy/f94JySKTAlu3QmRMicOawV16cAt0+pJ8LMyKKkGiQrFSvsmrOkNauMmN/dQ1U+kmfe WecDPgLGuC6ctxKO1M7bvP5NRoHCo5aCtNGjN3YfgX3R14Q1jKeULh6SdiZ8AAAA=
X-Change-Id: 20260121-next-b949189cacf4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769635379; l=1872;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=8xH4IQmMfR9c9jcVFAJY2hsd6wxCeTQFe70KrSkvl+w=; b=LZ5VqZJrkv+XgN3hBBFqILY3EJnoB9fW4PusyWmGQVIp0/q5vbTOUH82B9ql04LuwDe4v9Sfr
 hqIIifUwbBTCo0pHZN66s5GMKXPbUPuJGfJQ1GE5BfQ1kbV3gD3zeya
X-Mailer: b4 0.14.2
Message-ID: <20260128-next-v2-1-624bdae8e6d0@google.com>
Subject: [PATCH next v2] phy: google: fix build dependency for Google Tensor
 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_132302_400228_888CB429 
X-CRM114-Status: GOOD (  11.59  )
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

The Google Tensor USB PHY driver uses the Type-C switch framework to
handle orientation changes. However, the Kconfig did not specify a
dependency on the TYPEC framework, leading to undefined reference
errors when building for architectures or configurations where
CONFIG_TYPEC is configured as a module while CONFIG_PHY_GOOGLE_USB
is configured as built-in.

Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
required symbols are available during linking, and 'COMPILE_TEST'
to expand test coverage.

Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp@int=
el.com/
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v2:
- Add '(TYPEC=3Dn && COMPILE_TEST)' to build dependency to expand test
  coverage as suggested by Andr=C3=A9 Draszik <andre.draszik@linaro.org>
- Keep Peter's Reviewed-by tag because the change suggested by Andr=C3=A9
  is a trivial improvement.
- Link to v1: https://lore.kernel.org/r/20260121-next-v1-1-c18068b091b9@goo=
gle.com
---
 drivers/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 142e7b0ef2efb9209781800ee47b820a91b115ae..29953c911deda5fd3c43aef6da2=
8d96954a22f8d 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
=20
 config PHY_GOOGLE_USB
 	tristate "Google Tensor SoC USB PHY driver"
+	depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)
 	select GENERIC_PHY
 	help
 	  Enable support for the USB PHY on Google Tensor SoCs, starting with

---
base-commit: 8bb92fd7a04077925c8330f46a6ab44c80ca59f4
change-id: 20260121-next-b949189cacf4

Best regards,
--=20
Roy Luo <royluo@google.com>


