Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85253CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QT7by1gfa9pKhUAtv+8oGByeE/LYqWFquUc9CO+EUmo=; b=O+qmSkasHT+Cpvf+DOZi3+yf7+
	K/UzrxF3UwTY7x/4VRIpLp0EScgqdRRFansx3EJO9BXXOObwh4pAvP6Vnfs8LQrtseOYBuUbCVzHQ
	AAw9GTtgx4to0XomAenesH4eT+RAg2Iz3HaqNPgyGbzvVfxWQ3Ejg7wokOQI+WS9k19kOUPLX7YtC
	30J//4F8TogWvvCt2p7AzsvPY6awCg9oWgVG9qiJcEbaNuwlxr2IiXPYqPUz+PDEehLFeXkq5dhUI
	itS5MW11D7t4uQVCq1+FyEU01FgVYRS08fo1vYsqKladIWDkTqelM4uqIxbhmX0bpk82ftHHqLdJC
	VL30xj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0HT-00000008Z3f-1PeU;
	Thu, 04 Sep 2025 03:04:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Ej-00000008YLl-3kB8;
	Thu, 04 Sep 2025 03:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QT7by1gfa9pKhUAtv+8oGByeE/LYqWFquUc9CO+EUmo=; b=SzNchODQ1dpKsEuysE3M5cUA5n
	RfxxT4TPOwAUUOLqAXwFJBt9xKtCjAqjh/8M+JhlSct34VuhlkQnLe8jsqs9OAduorzYpPmQoD8qK
	2Dvu3TOmoNeXmIDBm2VdSQSttEe3maM0nzgqu3eO+BytOqBunUVjR4j9baH1z5VBlt+X/MOMP07u4
	rUWQK2FmIwQpelWvZ5nVNPwaNe+E6sLGK6b+5/zl+DxWyrraSW+f3/xUzsRPaHAnudgEtL67QSsq7
	DamRN/eALMv6n8q7ro6zkgaQ6f3NqKMp0iVQqWogqmSar/90qxHVng5y5Vi1SFSer6HF/FosTo3L4
	MA37bftA==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Ef-00000004Gu6-3dJq;
	Thu, 04 Sep 2025 03:02:08 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-74526ca79beso559074a34.0;
        Wed, 03 Sep 2025 20:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756954922; x=1757559722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QT7by1gfa9pKhUAtv+8oGByeE/LYqWFquUc9CO+EUmo=;
        b=FYnze3Inpg1IS5vv5R5kMR/A2MsAApANnjxmt9UxifcWKE1Yncw9MdWXMVOM5fL2bj
         CoNW/Dhbi0FFRhKJyys78pat1vIcBKDP2WMQE/4CX6sfLI8MiLSkfkeiLLBwPGFAulk/
         92d3M385rJPzgceIAfa3CGu3yv4tlL0detlFgjBZXnCL3algYrcktJz51q0r3ZqTcROD
         p0lkqdugEe1xhU1TpKlxnx++UDDeqCN8DORtq4XlGHgU1R2xz4RfYvbi2UYldI/kG9HT
         X8jkGE9N6uAlTIVsCimLJ5iN179haf++K8oIiDuf760UlgwKKiQvU8kw6BEewsU6d1OB
         OA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954922; x=1757559722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QT7by1gfa9pKhUAtv+8oGByeE/LYqWFquUc9CO+EUmo=;
        b=k1P44gLcMeWOy9JjfJKgvd6POAKzJR5lPFtMVFzyK2zgFBhnqeR2VrPpwGCOOKZ1Bk
         EhnfeqyjcNFKa6QkqxLNgHuaI1KyWEK5JSFvL/dIHvygRsw5ByIGKU31C2/rJqkv9zUq
         E8SP7u/eWTz8yUKKnQenlq4rsDpIfFJaJxeqGQoeOcv+a1xnN8Hbph8JDEbRyKTQZOm/
         bILfeqYw8Gcm+VzM0RuTckYJ5uW7Y4WWmTiyWrO9DFNOggvpkE/9HPC/L7/cgqIPsjKZ
         rfqq71pzNdi5/PQaI+sEuf/UKzLm1e6irFp1/M1sYsHJCpfgsZCrw/UTrlz57Vy48pDi
         rjMg==
X-Forwarded-Encrypted: i=1; AJvYcCUtwLmoSGD20wzBJ22VB4OTtnC2bTbpk8LymLnkos1SfEKoTzLnrca3kJSP5zt4XZzEvJBxdiog8zw1buS8peYD@lists.infradead.org, AJvYcCVUGsGRshatFNDwde4BoHMa9yrhMhJYo7ALSTSYPjKgD0kqDCPEarNZwRdIrA3fNkK3TfhrCDEDDh/a1MysdVo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBKvgRgmr0FKoH2FmuKDzL97zlPL1/77TG+zKXennr6H6QfbdK
	w72msweQNRtLXg+aQfLp/WLAGktrv0XVmpTalGEtVcrTpUnp/EGKqurP
X-Gm-Gg: ASbGnctmHQm0M29wgF+Arr/OiWkPvieXQD/7bTUBcn2jNDdYUeJPhIvmSsrfh4fx5Np
	QuUWLO6+F19FGlpjI6Oq/i2EAxwKWLE0DetqfzGJPuAieikyH54suwB4uM/jDPyqj8hJTd2MiBi
	18ab0Oq/vCH5YUmz0RD1mYxuIhMNYUzyquOzdO+JZ/yKWu1wZMtGtOIykLIxbUV0PGIeiXp5K7H
	GWVSi5eY7b1BR8PzQ2Mex3Hj4jUZTTStN1Ss0GqAEq6rZlC8oDztHfmhToOqyKzlrROOFOaYfx6
	63BvmwMvN27xhdyeeJxi3DGFOzV8rLO5/VecPkV12ry9lFAMV1XMzvXmBPXUK6Hg3rWEzDnWoND
	on8ZlOlSwHDRxUA1LxBOxIYjURlKEM4qixxT2XijClfdvglJPJOc=
X-Google-Smtp-Source: AGHT+IFikeTWfA0Ri8vuJ5/yqUfpE5MwjQOIwn7/c1zwNw8O5lCPtcAHELSxXUuR8uEwh3MYjWv1DA==
X-Received: by 2002:a05:6830:398a:b0:745:a1d8:9deb with SMTP id 46e09a7af769-745a1d8a3bemr829168a34.1.1756954921729;
        Wed, 03 Sep 2025 20:02:01 -0700 (PDT)
Received: from localhost.localdomain ([2603:8081:ad00:4a:c274:2bff:fefd:7058])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7457428b1b8sm2555110a34.6.2025.09.03.20.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 20:02:01 -0700 (PDT)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Fix the headphone detection on the orangepi 5
Date: Thu,  4 Sep 2025 03:01:50 +0000
Message-ID: <20250904030150.986042-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040206_432041_50D74E6D 
X-CRM114-Status: GOOD (  11.65  )
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

The logic of the headphone detect pin seems to be inverted, with this
change headphones actually output sound when plugged in.

Does not need workaround of using pin-switches to enable output.

Verified by checking /sys/kernel/debug/gpio.

Fixes: ae46756faff8 ("arm64: dts: rockchip: analog audio on Orange Pi 5")
Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
similar to the fix for the Orange Pi 5 Plus [1]

[1] https://lore.kernel.org/linux-rockchip/20250823-orangepi5-v1-1-ae77dd0e06d7@hotmail.com/
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index 34d195872a99..9bc7662ce9c8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -42,9 +42,8 @@ analog-sound {
 		simple-audio-card,bitclock-master = <&masterdai>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&masterdai>;
-		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,pin-switches = "Headphones";
 		simple-audio-card,routing =
 			"Headphones", "LOUT1",
 			"Headphones", "ROUT1",
-- 
2.51.0


