Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADB8C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7X+5DAft/iGazDSb7XtX+r5mhhxFu84ghIc52Wrj0I=; b=bAkfrEecTEA7npWKdN2skNZ2/q
	vLXb1nOAOrRt9z54L2k3PEEc1KLeYyjKV0WyQoXkXrxIP4jgD57aWGntuoEeJ6DaLo+AGb/Z+aoZF
	jc5I0ADos3v6OHqo0bIY8TcW/+Gqecm3xVtpUX4/Zpqvhum/RGuGxYQ/1+de/UKdtdq2fDmayIa87
	WlGFi6q+lzt4SVfXK49UQktPAUVGWSscSYWQyqJ+HhobYQYRiN7NSxxdn3s3yWIPO5WJptegPH8Yl
	0MNJpb+BEhWwynELfZGaAF72lG47qq7e+g/RFFxwnQv5CjftRHLg8F5vO0yQ4r2OiAeXpYTMKENKY
	rOutEyxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zs4-00000009rwR-0xVB;
	Tue, 08 Sep 2026 17:44:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zrw-00000009rom-2dJS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso40453585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889467; x=1789494267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7X+5DAft/iGazDSb7XtX+r5mhhxFu84ghIc52Wrj0I=;
        b=oBQswOJ36pYxPh203EQnX/9KLbN7l2Mzpqg13ABDEJ0tvmgrY2ktbyxXT1xJ64iZDo
         MOPYtkjU8e6YJ4vvXKklX041nyPPvQ14GuFL7X3g1orhHIv1WOVNx6reSfrcMuJ41mu7
         JYMaDHhCi66cBMn48GLvO0J+meIbwxKwD4rLWm0U3eJw0+JLjIrHqVbXR1FKMB4z9kS9
         FSzHFz0MLV8bE8kcxfzYpwbCxnvmNDukEXeBrikoRsiKecs17XynR4yyUms3lkGFwyeu
         M61LoFbu/i2mtXANNGGvX6UTd5rLQq/Ly0kXyo+8umLEpDPgAyP+CSVKbfwA3GDXwckw
         igMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889467; x=1789494267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7X+5DAft/iGazDSb7XtX+r5mhhxFu84ghIc52Wrj0I=;
        b=sDgV7tqdCXyhMpaW0cvd09EOguiDDHTQe70penev8Vv8ZWL6b8DPjcWqPDtJ5GR/qw
         t+bRrc69JwyAamotJ9LiIeIu/zM/ofOvnuSSHk+7NdvgfZpnTE3XLWlan2vyzHujXeH+
         /uBpPZUv//Y0huuq4Kcm/SxETSM8nt6FqCIMm7xL+f5VrJiKM1qDtZzDni5pXTOXH3EX
         ZV1loBVWlGJh+zqIxa98SIRFX7UGtt4yiYGACm1WR0WGI0jplicc9lQJbT2SU1oqaUqX
         kkglg6rxoSTaP7rkn/EbYaftOGAYc6zpC3Jiku1btkbDOYWAj70nsxiNwrhOyKtyRuOl
         5WwQ==
X-Forwarded-Encrypted: i=1; AKwUvBygw9l8G632dk9D3VGDfJfiaQedfgj4JrDdQfG1N9hpCc7HmYfjSd7k8EQ716+c7XRW9g+sxbElKZFwka7xnA2i@lists.infradead.org
X-Gm-Message-State: AFuF++kqz+UE6sBhat/1e+JQBEreJKk7K/VuhGVVZHyitQ6mMHI6ETd7
	VcqkDNBCv5ywec4UTrA3gNf0vCHSXMhWWIj19vQvp951ElsHLwI5DsJi
X-Gm-Gg: AYBFou2J7bnJklT+JZ9Qdz0iM83MR7wv02HlKAkE6P0tZGSGCBmLn8ZmFwAcA08wnPj
	1msC/1JJU13IZQeMkBXq81RK8Q4T7P6X51u4iuBddTsuBel3u2pKK6F6y9q2dmQn703kaiUI3WQ
	ThfrkvxFpQILXs8LNpaICtJMtDHNIGYtDWQRLZhD5rQqi7M2H7PSz18QsJysVpyqY6Jx1kOX5s7
	7pXjs5ZT5qORsM+E57x6VxdlyUiMg78AgFIuQSuK07YHRF54DSmKSw1gmmsp7rH8FabmGauWB2d
	hCyNR9YCx6hg3Cw0DqR6hKFWN72K2gt/3MRN1PI99M1NwhUoqcUOjyCxXZTPS3cNmSvujUB/vgc
	NcqyUti5YaryyqKlVPuqqT5xD+hMK3P3IUaOb4o24N7AlA46xln5BZjNU1aZ2dG8WWbrum/s6PZ
	0FFAhlbYpXidrHqPpBhSWUjtn/pZYddqDgW3QEQQrPJhBCZin4M4tgwVwa
X-Received: by 2002:a05:600c:4e0e:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49cf81e6063mr290969905e9.2.1788889466528;
        Tue, 08 Sep 2026 10:44:26 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:26 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
Date: Tue,  8 Sep 2026 19:38:29 +0200
Message-ID: <20260908174259.9009-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104428_671786_DFF165EC 
X-CRM114-Status: GOOD (  10.99  )
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

Enable the toprgu reset controller feature for the mt6589 SoC. This
allows generating reset signals for the 12 subsystems managed by its
top reset generation unit.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..2645054a4a61 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -147,6 +147,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.43.0


