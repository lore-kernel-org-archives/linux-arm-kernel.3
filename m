Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABF6C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 21:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UcQAFNMp0s8CtBgoNyZRn65WXgc7JFZ2TpQaiFv/yM=; b=3D8S0KfTHNbjXdgIfqNmurK6nk
	iExT+3fRJjFixTwF1vqiSjhPqZLWbMFx7o0XkqlBOAf8P83uPcKtddeDnAEmgtJ5uixs5Fd+k/BAl
	fHeyfh44/uM5m4899qmRpPFoLiOlcrWyksRy0I8qb9rl9GFtAekGiRzcaJWIJGzANb6QhtbnsZcZy
	0PZbF6UYJ30NKZwb2URy629gfHMdT0iSTy2h1HsX1eLBBBExNlYAKyiG3lxTexk1VngHAcf45ETUi
	XvVSVgm818a1g1B0l4mHmfYy5SrtC2b6qdNFPQ2pqV9QZ8sQESAiEJY9/s30hUMSN9N+tiG8lHNor
	w/phdniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvips-000000058X3-0yjr;
	Sun, 16 Aug 2026 21:56:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvipp-000000058WN-46b8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 21:56:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d03fcd26a6so4511275ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 14:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786917365; x=1787522165; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UcQAFNMp0s8CtBgoNyZRn65WXgc7JFZ2TpQaiFv/yM=;
        b=oj06VW5t/o5NYY3Ws3rwF+sQd1UHCXVxUXViPyLc4UjXKkq3rIABu5QRKJ+51mh+Ye
         Vbi5mGTpVAdoUxRzVpS23tJkTYvUvLy+z/a4HQP8WMXyhGCRTfDALLFEFBTftVhol4kp
         LHzxQLNO3sM3WMWsM7/LHiCN0tkRjDJ4gYQ0TZaOTozWx0u5Rcii+zmHk2gygs1g8ZKE
         dMxKd90BGjYiW8RJCspfsmTzrtvgtXNi2tZ7Dvuv9j7riaDY/XXAkx0V7CP3waBqTcUY
         BMAnkuANgr/a3wdv25V3XzHHVt+lTPhHq9hiXH9pkZuJduKc2HgHm3QCuD9J7gvsJoOZ
         MuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786917365; x=1787522165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UcQAFNMp0s8CtBgoNyZRn65WXgc7JFZ2TpQaiFv/yM=;
        b=k984jTuSLoI33YFbRKPG3zq+5n5OOjIKDaQruqkbM5fUM0rZgIMBC3E2BZM5IjPUjJ
         N9d1dxvVhoD3sM0GEk7hmKnoS9VLB5vWv7gbvaYe0e0dufueidBbTJCQDRP9meu1IMbp
         m6pzrW+AaYYVWLzfPDy1d85Yq/3ZGUoX5XhW1qKdrBnEfT4JVN2abAaIgEbKGbyhgNuI
         6yhoqSU0640MhIrl5UQ3l5M/po2Yo0VYxzogIw0MuQQRqTQQKmky3r8Nnbcd9iLQcqQ6
         sl4yPaXnCT/plmNqGt1A2qmPH8DWpiLoFylzFqneXxDkCs3QCiCYiPG4/H4bPOdAIzv+
         Eu7w==
X-Forwarded-Encrypted: i=1; AHgh+RqFyAae6nHTE9G14HP8lch5wJ19YyGqLqkJnpRcnD18235D1Oajrc/7srhvXfuzHvyFzxjQE6kUqextB0EjR0ng@lists.infradead.org
X-Gm-Message-State: AOJu0YwP0U0bh4cdV/y/TLdcInLLZ851ifm5UFTC4BdlVlPbubyexh+x
	6WlNcKFvdcT+8tS2X3be0AB2T1Mo2TBjSmbv8+CjIbP1FYEQjJgzfxmH
X-Gm-Gg: AR+sD10Cx+BtuEf8hQTpYknAtVg0KqZgMPuGTpqewCO7BDGrJLudNb+Qlcuvt6isz3S
	EF6O/gjqPwA+FCJN6eg9Y8zN/LRq5Y7VFE9BaZ17FwL6TLZYbwmGh/mM8ZUZVzGZBC3EYSMEPNG
	x0tXJk/RpSXWbV6O38L7yu56kA1SUrZHughM8CYbwBQqFg+pL9LSChKULGcegHVhNWdGAi911wi
	A8b7jZYXsUDo/B1zpsOyRhu1lb8K7+DrzFUrtBsUXAm7fPBn/qWWt+gHhRMAyEIm/aAs8QbybU3
	etRlriZc8sz2gpiOOxofWAS1L6wHiiwrc9nbrhMg/qOJkd2tiHF/pR6lYHifO8PV/7AwLy9bfZp
	mgIg+5Yo5naCcJJSyrHd0u17OhPcW3mGFSUVyB+/FLTtjGlVTRuc7dE1u2FhCLa1pKD19jDOP/h
	m+ViqmIfbdv/WYY+yiTj0h3JJSsJR76UCQqTqOd4sYNCPwi2Fgqwr3ZRO9iyme6RZwzMhE78az+
	g==
X-Received: by 2002:a17:902:e54c:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2d3b0503575mr147844835ad.0.1786917365007;
        Sun, 16 Aug 2026 14:56:05 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:504e:1c5e:cbdf:b953:2369:869e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d60eb8eesm30168318eec.10.2026.08.16.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 14:56:04 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 17 Aug 2026 03:25:25 +0530
Subject: [PATCH v3 1/2] ARM: dts: ti: keystone-k2l: Rename
 ti,davinci-spi-num-cs to num-cs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-ti-davinci-spi-v3-1-23844cfb5e6a@gmail.com>
References: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
In-Reply-To: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786917340; l=1081;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=YnPAhvKumj4atfxnTtYZIxnxE4cgoSSko47sbyyrNKo=;
 b=Dgl2753Re5cUEaNKLNQeCEOIJ4woQyHiL5DlRhR78W0nm1I83BcVXEpjbecipodC4myjHLxZQ
 1eYV5BuJPKrD6y9slJXTnlyaKg0etdOl/bHLONKGwVlTAfZ1Cq8u5Rn
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_145606_020140_742E7ED7 
X-CRM114-Status: GOOD (  12.52  )
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

Property ti,davinci-spi-num-cs is present in the SPI
nodes of keystone-k2l.dtsi, but it has never been documented in the
bindings or matched by driver. Driver relies on standard num-cs
property instead. Use standard property num-cs instad of
davinci-spi-num-cs.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..39a846d7f8a4 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -401,15 +401,15 @@ mdio: mdio@26200f00 {
 };
 
 &spi0 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
 };
 
 &spi1 {
-       ti,davinci-spi-num-cs = <3>;
+	num-cs = <3>;
 };
 
 &spi2 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
        /* Pin muxed. Enabled and configured by Bootloader */
        status = "disabled";
 };

-- 
2.55.0


