Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE70C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=djOgvsv3VuaYv8IJ6t6EG50/ulOg85QJhyL5jpcElpQ=; b=hIrU6dWqAtSAVW
	MaWiEc+Vk304/gnlkAizOMjTbyX1f/xLlbFOMf6JFg1POw1ukrRBVOvBLWxZymkLyyqRERmAbvtwe
	Qb4mxa3PMrMVpTGd4InlV6FjRUZJYE2aWGUOJnqbtq9WLIOiZuJtUn/ouisYBU1m5YNKRQmJjz8K4
	S2hMcAAfdVNvL0VH2ewMssRQHU8O0ghnGMmQ+fhZrUviy3iTIJJExlFul1RCgdSEU3RLyqV8PRf4X
	P9TSZo7/tIyQ+OdWfQ9pqXGmYkiOCfdPI552UQw40fghVPXO0QzbFIe0ixbiddf5+WUe+t27soAvC
	tVWpccaoeKrx1F/2i6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BUQ-0000000AfEO-1wYf;
	Mon, 31 Aug 2026 23:32:34 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BUO-0000000AfDu-2Mis
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:32:33 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc1c7962bdcso494637a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 16:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219152; x=1788823952; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=djOgvsv3VuaYv8IJ6t6EG50/ulOg85QJhyL5jpcElpQ=;
        b=etWRvPt/JRBaBpqi+QWcMWTlorgzBurKckBDcwTimT59ulY9bP9833caCb9fmLh8/b
         ftgRaCWdJ6EraUBWWY3kfdiQank8QwRAouMKHHi+ptUpjDUhbgJklsot3zHCOCZPAYOS
         b+av4QfgdJkbx4hsmnC1lYObjk2xW2HxbYC2UKcgjDWmU49/5wzQeIWy3BFkj3xRp1l2
         SYuQKi3Z0NahHUdH0pSaU3hx5cW/x4vN8zhcTrY+VZfy74c/pVX5eZlwYGHAKgNSYoyk
         58fIogSeG3F4HiM393efsvrzgIntSvpmDtxnOAI4AyOJ0XyPiX6+1rCKqMC6kVaCWP/A
         mOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219152; x=1788823952;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=djOgvsv3VuaYv8IJ6t6EG50/ulOg85QJhyL5jpcElpQ=;
        b=iHaSgvOqlLtLpvW8VW0YqyAQuuBMG3QIkL1cFmz3cC8I6MFWm92ZD+8FevzWHSfP1Q
         1MCycIJfU1ZZQ92NYH8cVOdYl3zhTTKdVMwvv+QFH2NqyXgCpXE9RYwGRyFqyvXlEv08
         bFfReho2QSCmQpSnVzWIGULMgEyZ82ygutMNnS8sZvsGOTrleyleipWjo/I8zH+sV8Wp
         aSDjvOPu0u3xrGGfHprnTGXz/bSdyqbVtRTkSb6/8wziNnoQPhLuNh4rxIDGJocSUFY2
         D3mikTveI1ipvWxt4OQlEmGyt1uej5nFTnPrJAWSYGkniOxCqrz64hu/CLqczlWNFn49
         mKLA==
X-Forwarded-Encrypted: i=1; AHgh+RofE+NoK5yAlIaLgYGXnzg1IeE0qhtEPdK0u5EomnhLGRpoMR0frVFfH2HVJBjNjCT6xATRDIQO8IYO+6o1jT70@lists.infradead.org
X-Gm-Message-State: AFuF++mZ10rJiIp1EKbLONXxoY+0PKFrHR6coUBwq9Ue6pbCeyzXfxIJ
	vxWkJw/Gxpive3UJfk5iZO6qalfEt+gEO8WiOcjf1zWJRv1Rz/e1fYoQ
X-Gm-Gg: AR+sD11OM4oPMtownRQaQTgyFXePWwGrplZBoFvDqxSgiU30C4NAvpDJBXwy02w4hm8
	nwQtanjxDZ8aVdZuj9PAMvPM503uO+piTNsaqd0AfoDvUA76Lf9goeTSnxvfHHIDvIYXp8SjMza
	dNrhk2BhAF/xSB/MHgq3lXhjEAPGfZxzjJM86fr3FUb0kCoC16t3NXP2NFtGPOg19j3zE1WHg1H
	WpIzFWX95MSjePHRIiWxHWLFFuxOATArpaLhJ4mdYpWBcXYlZjKeaxDFp2QNzGGALpWPb3cbeEz
	Lj5hGg0uC1tTodDYYYMfCsVLn/idAfs6afVpjoeaR+ZIBB3ubndlHtgowVZlaYnoh8uhGaYYfd0
	00O6KioCSlej4gsBQWMbASWrgBB0N+eM2+5SPMNZoXDeclYuqrLSgyS4kxiXjoFJ9BtVY1lKbVg
	R2K9b6Snsf2QSmvaVRp8GO8wLfN0dTTpsHtzFFTiUEL7TnAJW/F/FTirNaVRPMSYcKH5bfvss=
X-Received: by 2002:a05:6a00:13a8:b0:857:e68a:85b0 with SMTP id d2e1a72fcca58-857e68a9896mr15906207b3a.0.1788219151691;
        Mon, 31 Aug 2026 16:32:31 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be5ca747csm154393b3a.5.2026.08.31.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:32:31 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/2] spi: davinci: Convert bindings to DT schema and
 clean up DTS
Date: Tue, 01 Sep 2026 05:02:09 +0530
Message-Id: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33MTQqDMBCG4atI1k0xYzKRrnqP0kWMiQ7UH4yEF
 vHuja6kpWVW38DzLiy4iVxgl2xhk4sUaOjTkKeM2db0jeNUp80gB8xLgXwmXptIvSUeRuIOpUt
 XVlghS2icnKfnHrzd024pzMP02vtRbN+fqSh4zo32Ste+VoBwbTpDj7MdOralIvznkDha9EpoI
 QGqT14cuf7iReJQlFJaXymH5sjXdX0Dwx49aCoBAAA=
X-Change-ID: 20260816-ti-davinci-spi-e64e4e48b6b6
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219139; l=2055;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Z5Phb0NYnzJ9UJstyCcMsnXLSLAEeBoTZwfa5AdVlKI=;
 b=u4rRQ5rJsS4NBxCoSKV+pujQp/KNxj4jWfDkbV0TPh/Pu9fmvcCSKTBA+2Hgb9ZgqxG/Tn6ax
 1IY74iK2niqAVUCsDqPOgdZg8kIWvTgAgkXcezC+I++Eh61n020pXKg
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163232_615203_B0C9881E 
X-CRM114-Status: GOOD (  13.01  )
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

This series converts the TI DaVinci/Keystone SPI controller device tree
bindings from the legacy text format to DT schema. 

- Patch 1 renames property ti,davinci-spi-num-cs from keystone-k2l.dtsi,
  as the driver uses the standard num-cs property.
- Patch 2 Converts ti,davinci-spi from text to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- Fixed spacing in example.
- Fixed commit title.
- Rebasesd to latest mainline rc.
- Link to v3: https://lore.kernel.org/r/20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com

Changes in v3:
- patch 2: since old text binding required num-cs, #address-cells, and
  #size-cells mark them as required
- patch 2: davinci-spi don't work as spi-slave i.e address-cells 0 is
  not applicable and spi-controller permits both 0 and 1 so explicitely
  define #address-cells as 1
- Link to v2: https://lore.kernel.org/r/20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com

Changes in v2:

- patch 1: Instead of deleting ti,davinci-spi-num-cs, renamed it to
  num-cs to properly preserve the hardware's intended chip select
  limits 
- patch 2: Removed  maximum: 6 constraint from num-cs.
- patch 2: Add standalone support for ti,dm6441-spi in compatibles.
- Link to v1: https://lore.kernel.org/r/20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone-k2l: Rename ti,davinci-spi-num-cs to num-cs
      spi: dt-bindings: ti,davinci-spi: Convert to DT schema

 .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
 .../bindings/spi/spi-peripheral-props.yaml         |   1 +
 .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
 .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 124 +++++++++++++++++++++
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |   6 +-
 5 files changed, 153 insertions(+), 103 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260816-ti-davinci-spi-e64e4e48b6b6

Best regards,
-- 
Bhargav


