Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02207E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=; b=egsj8di8lDUkTNAFwfRtD9t3OR
	2uDS1GtO1Br0QU10jWh0q99H6q2tQJq5kyQ84OEtpgop6FyeJpuScYtbdYj+CeecxxlfRec6ykt8t
	5Gc4BkECfm8ZgQEglCuH9TCvAZv89zQ0cDtxKHkD22EB1wFOKxfwaR4A+quwFjha7YeHjSPJlIzdo
	Qu3QqhD/E1xUhEplCHkyxB2TeU4KgNXVvReW4nzaqeDVd5xi2VNepy08QbPDEsw27v3Cdvx4asOJ3
	wD0hHhSN0H0Ou8AQE+x8sQeqHqoFq5eTmPcevumBk8NCagRilRpt4Z1Kt8v9Ynep1iCSD5F33UGHV
	UYw9sZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPXq-00000008ZJk-1Tbm;
	Sun, 22 Dec 2024 17:15:10 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPOq-00000008XqG-2UN3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:05:53 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so5658469a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887151; x=1735491951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=ardpfX/+VCF5ORhL/rhCi/JiHOMUlCgZiP+iJd6n6KR1SfdvZTMfIl2qmeaa6hXvnj
         QQe27MRD9AoLJrJdYmKg+SWrfPj9TmlXQfhtfYJeGhzcVcPQc6M1X3FpJwDbwvq/vS8u
         TgO9KzDX3R3epWwHgifpkXySiDAZKJ+JHe+Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887151; x=1735491951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=Ihy+c4cf1Jo91slyXUp6NmEM8wQyR7OgOFf5rDrk/LkXGGBL5/cw/G0Qai/CIqB+m3
         +e0wSjxHoWQ2yan6AWwrp8ibNAk0pRNw19F3ctU7Wd9+gj0z3F8pdxa3GHjVw2F2dXww
         qdKNAeFV516xA5DUKWnS1Dt9MLBQwXHNZCkz0ate9BaD5y3A8PUHcqkDm98syiycv3Pw
         JdP9DZPqlM9BdyxUlBnAhbvGcJaC8rX+0YI+/rvcH7ACt78YirhBgCpyJ1LU+PbkDUuB
         y5rM4bSWsOGmw8wXh2hiNmy0YzYaa+QgOVerjw5WiaAjPlfKtaZHkT7VIyhdX2vSRuQc
         nqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4uAncN9KW73NjwHnFcIKS+fYVJSKv0k+a3wYqNQx+z9EeVhWf/C+NZu55exZpYfvYQCcZ51uXNdkiP0mDN2mX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4NlLmydG0JEr7cZ65KA1fgWGQr1NC3eY65r/+ie7C3KAqEpZ5
	pPJ3BvQ2Z3e4zvA2+R30/KJ4A7bawmjvQQrPJJooUF5HgLCeM0tYNBs7i9xFuT8=
X-Gm-Gg: ASbGncujiR4P4Ptgg1N0lCXhOZ4NtdOtxCJ/wVd0YYw0THeGxbGQW0T2zd45J+u2aRf
	MayZKMSvVBW6/esPluXzHlwa3aLAyoC/2XGmkflzdBZBH6PtERodx0blmfRwKWY3cgsqREV1P0I
	kLpO0EBHHuJrEfdmfy7jUPjNvIKVTXuhmUDFBXUi4YKBfhX3fuNXMCQXsRtOOBQ6d7AXHl3VoFy
	bUvw9K+ItMXOpgX86/65AQ5ly+1jgY2VWLjdU8M3Tp3cODwtPzIE0b5dkeMspjCXBR01jvGKimR
	lx8XZdXKov9sQj5Vy+msmVftvTljxsqbbBpzfaJ0VQJNZA==
X-Google-Smtp-Source: AGHT+IE7qlrIBo/sacNeaS4a8N/VEhyD3V5TtGsjcDWXgBSetS3Ohl7c0tUQC6AZfXDecI4twS+cow==
X-Received: by 2002:a17:907:97d2:b0:aa6:ac19:b579 with SMTP id a640c23a62f3a-aac334b5806mr974631766b.26.1734887150752;
        Sun, 22 Dec 2024 09:05:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:50 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 07/18] arm64: dts: imx8mn: add anatop clocks
Date: Sun, 22 Dec 2024 18:04:22 +0100
Message-ID: <20241222170534.3621453-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090552_749168_F6CA1194 
X-CRM114-Status: UNSURE (   8.85  )
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

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


