Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116B7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=; b=T9AufjNE4stKyfYX63Z5czxq6Y
	SPzqfimw/J+G6PwUqN22XTG7YyquKruG1aTlec8zZBTWsxLKlyxHsWjwuPq5TPfc3X9oigiQlFJew
	Tts/gCL+6vOCwhsx4GsACRWluI1Yy7pg6LMkyEXMiwTUw54IP7OZM8RmpFchy5gUP4ool4ESQlI7S
	UZ/47EC/XrcE9Clos1JnO/fM8MetEKRI+FU3H63kuv22at4vlgpL/OYco6XxpcdezO2PEyx0sV+W4
	oC6vGOuxf9V5Zb/cfS6j4E8kzrOEm3q59rexbt3C0h7V0NUZgA5oP/+HU95/mgCwDNTDq0flQLQde
	zGNVtH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qE3-0000000D1um-2d0m;
	Thu, 24 Apr 2025 06:38:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyQ-0000000CyWo-3VPe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0618746bso3859795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475733; x=1746080533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=d8HMTD5xfnKkvF24n3hM9zpBO8OR7fXICFR7pAbJEzA8emEoGTz90nzCD+UV2pEAn1
         xAKWa3qKlyaLoQ6NsKWXAQ135GYF2aS+88WO7PB2O84JeGGZTs57vmZgSmL8sP4Ry7ZA
         pFTHF7NQGAcSXT84k6cR0GAdggtXD4mRLZQUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475733; x=1746080533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=CJtHCNmhKFbaBDn0cRQ7mJJekknQKa9EfXlrZcDnELBo9MPpzcY2gHibIl62Fe13co
         TCwhsaFr2yLjh7Z8929eqtN1xYSBYoFlmug5z0JU04Xlbbe/F28HoWmnD0xDn067g7qT
         jBw/58I94M6l7kBoJx/mx7HxCX3H2E1EQso0EQMlZmxcDzUBByRlXZg+3OyjF3Wa9CbY
         gg9S/LGxVmmi2lDlkJbLzzDGhsnxi3aKYlukLKgzeFs4hsWDgsMZpuTV7Sg3KpfxaqG5
         1VsPUbnJgm5vV2S6f9LUOtGVKj7hJzA0n7qhkVcYhF6ILQUaWVl+J3nnEH44xAhhSxv5
         2gdw==
X-Forwarded-Encrypted: i=1; AJvYcCXLLVONt4lZJwR+fSyYX1bSBhbdrNI1YXzpcmeE3HuiWIuTTg2eWPP2wm4LD8RnhHjWnoSWq8vQnD1Qhw0YQaaj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Azu1NZ4esZNTyCS4IpeY5L0YKZLxAHZKif42AlZDrtkYEVLL
	i09Z/RRZ6t8RRARofFT/OTycnS7U2U/SNGuoHDThB4bwGHSD7flvHGrksFMj6mU=
X-Gm-Gg: ASbGnctJH7PEVJ6rGnfSN3pZ+n1FLfZT82QjLEOYrwjouJe0moZlHtTdvRjT88iLM9i
	/nnzRYW9Erur9abpm4GftJCNHXECqMEQpTO19BWFZatovoNO81MbbAfKXs6atzA/KE05J7K1JHR
	ouKKIjb1++KmezLxskE8KUe3HK6Mm7iTO3Tmv5FUd+HfzQy1aQSCa+FHv3QzbpWXgkePtWulwHp
	O6oFwXKn8RAy4G6vHuDyhr+I3YfYxUB4f0rlrvQaPAblTGEO74X8yskn+NOGB5Zm7zkbqGtGfwY
	ggWT1XwNp40Xut8blV7j8J9HCdqpru4hlABdyd4OV+GhAj4BlKexGYZAF/xLdsEh3/mEcGirfwx
	pb3lC
X-Google-Smtp-Source: AGHT+IF8qsSIOhwlMtkI7iNCFFbm4c6JnD6bm4eccpoJ3Cg9vwgWn75lQjxCqfd/J1n/mFg6vXi2Gg==
X-Received: by 2002:a05:600c:3508:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-4409bd8c247mr9014035e9.22.1745475733483;
        Wed, 23 Apr 2025 23:22:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 08/19] arm64: dts: imx8mp: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:38 +0200
Message-ID: <20250424062154.2999219-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232214_870715_2C1151EB 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..78d71aacd0a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


