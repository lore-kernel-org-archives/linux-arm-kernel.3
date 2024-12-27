Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE4AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYjnhMa2oZ9Lj699gG71FsVduTz2eJUc4klb/tcF4uo=; b=3194tExTfeIS9wz7DE+2nvKo8q
	+ghX0J7CnAl10Vq/16MBGpvwNg7lNIo1mhTkb0MCF9YQeSWsHGq9TxFEqo41WVE7bZPiOicv+s8fE
	Svq1CWOBpZXgFaOv2RXUGsTqzBlBpsYzPTd08StThos+ZE6WNkljWEfsPkR25qk3aV9UA5fzbgDFI
	YEs6ndckhs80i3KLqP0Hw+N/GBPajw6tfVN7VLDsjtEkO1pXQuZa4N4s2aQrtTR/ulghJ9bspYUqL
	BajRywaVmFBam0WMb9APJo783HJxdAKK/87t9UP1IXDoY5gQunQ4YCKT61zjTBIPSAyiKzixZArtc
	w7Ou6TcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAXS-00000000J7m-1GO0;
	Fri, 27 Dec 2024 13:38:02 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAU8-00000000Ik0-0lZg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:34:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so7522656a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 05:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735306475; x=1735911275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYjnhMa2oZ9Lj699gG71FsVduTz2eJUc4klb/tcF4uo=;
        b=2OtTZ/R5LMHjOlRToXA2e4msmnOY7iRy67l57ufFdSi/1bvXtgLH7I2wOPxCTIxXiN
         9krUyEvN6bLkCjcIS0NS1qIgKjdCIuhUAsmp+XXAmIebSYtOK2PmWq803fY1Wsg/I8nr
         TcpBvH79hB8hFVSGI5KmPJxa5SwoxeqhV9T0Y6FcoaezFiVHdCWb1mbl+JQNGSIDRJLc
         XExrEPrHwSWJu4HdyCviR7rqRC/7AXBq3HUPQGp+h4hBeOgDf1EwKM87kRJYB5xqtHgz
         L5/5i6Tr3UDDPMc4dqkTbV5rReX32T0v6By3BqJeVMZB64T5lok1yGR1j0qhT1iBRY8r
         VFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735306475; x=1735911275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYjnhMa2oZ9Lj699gG71FsVduTz2eJUc4klb/tcF4uo=;
        b=jdeDtMcbmMmcpgROdxQjcdW8UEzxQwO0UmbfyPxPVQtWczjeLb7oAsoxwxX7bbzvWm
         W81LEv8DR3wMOYvc9rOjUttBrQ9qFNHZst9KQNh4zSBwJKx/M3dTdyjQv0/BrmgmSclU
         6gqVX6tM+LceZ60En4qM6zqmgH5IfEuYPx6fsPwIu2H09AhVwdXcTWYUpY5/LVMa0ssT
         JeAU9614rSRa4rp+QYi65cVQ0pSTHzo8ZG1MJKUa2rxuzXx21rP6PnOda9vU6Nz2u+O1
         xn+OebYVcunMIBBmmkvBQ3YL7i1RlBeuIBPjla6LAJJMGrN8IZ93DksM/n/EJYe+HYdi
         TBNw==
X-Forwarded-Encrypted: i=1; AJvYcCWZdf++u3A0NrwumQwoqvD8thaoJcRPon3kq6hx219K6mNel6wZsrKZ+OsjIjvlETpvOGq1Mur8WGy1GH4wFUfE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3HYvdTCy/OHw4COFh7HxNWHwKPpNq6Wor3yZWdVwKGoxH5I5i
	g7WfUIPHICd8ahsCRAklEqauMIiezHWiHBIQCCOVps4Q8waj/LmhveJEDS9mplI=
X-Gm-Gg: ASbGnctjHr6E2oOQ5TmnT/W6n8REd1B82UzpsJ/CwEUKg+mRNzZK8u0s9fnEpnHs9Zs
	2gqZHzc8khUt5M97RiiyiREFw7YgF8lolurX3KZN6qYGwGwl9m0vWKp1El89QKzAaPZZ0jxV1wX
	cIkIqa7GZVSQKhIDbcxphsB1Fhd1hLL4SIAWKHTF+XGg1NipkceY2zV3L4cCcuCfG6yV//3Tqv6
	/xlz27WliDzJO5pGIX1CdeuaMl1QZTZBQXE0s84BRw10IO/nr5nWE9FgJk/x/pNN6dyWrQ=
X-Google-Smtp-Source: AGHT+IFo1AIU+xmd/BjroiPxEBcqjrSTp4da67TjD3QAhh8/9xojEWMz65v0ommdo8FpLZv3I8JTfw==
X-Received: by 2002:a17:90b:2545:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-2f453633e61mr35833720a91.5.1735306475305;
        Fri, 27 Dec 2024 05:34:35 -0800 (PST)
Received: from tops-ThinkPad-E14-Gen-5.. ([103.217.239.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4623dbfbfsm11808238a91.48.2024.12.27.05.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:34:35 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jagan Teki <jagan@edgeble.ai>
Subject: [PATCH 3/4] arm64: dts: rockchip: Add Edgeble 6TOPS Automotive Edge AI Compute Module
Date: Fri, 27 Dec 2024 19:04:19 +0530
Message-Id: <20241227133420.169714-3-jagan@edgeble.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241227133420.169714-1-jagan@edgeble.ai>
References: <20241227133420.169714-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_053436_217445_076BCA1D 
X-CRM114-Status: GOOD (  13.28  )
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

Edgeble Edge AI CM6C is an Automotive Edge AI Accelerator module based
on Rockchip RK3588M, operating with -40 °C to +85 °C temparature.

Add DTSI for it.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6c.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6c.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6c.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6c.dtsi
new file mode 100644
index 000000000000..92049540c20a
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6c.dtsi
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Edgeble AI Technologies Pvt. Ltd.
+ */
+
+#include "rk3588-edgeble-neu6a-common.dtsi"
+
+/ {
+	compatible = "edgeble,neural-compute-module-6c", "rockchip,rk3588";
+};
-- 
2.34.1


