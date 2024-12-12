Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A287EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 21:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LcqT6RFZpU+AfgSkhVCNBVs2JrpNLGjbQouQLx+w/k=; b=3I0yxGGvbVgjsTMV8X4Y0YP078
	q6X8q7MVbIe4rhT75sf0jg2lQvMlX0MRxZbfAPmGJe/JdV7gx8Fs61P5uQoMDvI2hu2vB4VyxAmNr
	t9BoxnjSeaB1E7w8zOIbh0IW25eSZ1kLgS/1YejmcphA+B5/ucw5pbanwBhuOZdTrDWSBTpA9FeWh
	IBUOKtOkIFVybgCxvAuvPRQGMPtwdZ03JG9LvbS+GN6XiC7t7cWDrby9OnyinGwsdueOpemMElYMA
	l/Thk1O7kAms0v4Y/eOGO6JO4gGtKNm75NAtQBSBj3GyFIM7CH9yQVRhUkOd1NMvi9rf8QKTPnSax
	+sZCUZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqVA-00000001vC6-2Cfe;
	Thu, 12 Dec 2024 21:13:40 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqR1-00000001uPc-3Pn3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 21:09:25 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so1861664a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 13:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734037762; x=1734642562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LcqT6RFZpU+AfgSkhVCNBVs2JrpNLGjbQouQLx+w/k=;
        b=lpCrMohdfWrT6AEp9ZAbGo9qygpczrwLT9fqKjnnSEaGiHQVElC0Ie3So+xlXBTFec
         /LVM3NdECWK/A4I088XIsQa9N2FcvN42d8kq8U4ULDCQ13cIyKSLqdZTAVH9JFSf+h9+
         XPDzIZwFetvLugiYITlr0ldUPgXLmZmhr0sCAlS4JnP11kSNmyVUEOHxFJWjOOVEPimK
         R6tx70B/GZeaDvAtFgDVozLBzWI5tSEzywe9kuIFznm8cL3rvm99Sb67Aa2zamcp8kOP
         fuC2uRuhHLt0KGpfbC3vVcTcF+3Z93nFXSq/UEHnkvKvmbxi+ppC5b92jd/gGqXW8eG9
         FM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037762; x=1734642562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LcqT6RFZpU+AfgSkhVCNBVs2JrpNLGjbQouQLx+w/k=;
        b=pg8KJu08fpujXIti9mtfefrl1mgrP43lKVUmc4nKCL165URcLBIPzXYhHI/1Y6U9Mc
         4g0T7DsW2Zzj/5ltfdJAZTb8paIQW7Ufqx94kyzY4suST8EAsdMf6465F1yY4fV9Lme/
         a8XKMWhkJXNm10aUojb9lX3vZUO7tzd0S23GwL3GFCPkQAxg3duq3c/vTSDsukWC3CXS
         3giQfCN//HR15bi8GklTU+XxgB77DxFPi3RtsfbzA+8Ii4q4Ue407Wak8LpcgIetubQ1
         3nVmzCry8LiF+EEkDB9D3xELJXeA0ThTuFY0XMb/Nrv7+ccDanZuhiXF1R8YkUb53Q39
         iZ0g==
X-Forwarded-Encrypted: i=1; AJvYcCU2TNgfFDz/xOkKaQvfipg+E6V9F8/dl+n0JV2QiN2bMgqcEBSl8ChsaTS+O4XF8KWE5H//LQrLMwz0utorbZN8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz16fQVshMSUrZRTPj7xIDoBZv+mm9vpLCr6OpjzgJi+tArYgU1
	uu5Btrv1X8UczN3bqsigM051NMcEU2e/FAZe44V7W183MPb5ciWe
X-Gm-Gg: ASbGncuOQzsTJyWoZQBKsFTjMZD9o/tjyRDSvFYxmk5qwJ10/DND7NAVauLQ6kdT47m
	pAxDbIFhYCyxozwzb3L9nxzVkpLL9rwUMfDXf8qLkNUTL5xjplf5O1+NzSCJLEGiJLv+Ns9WRX4
	cJCXNYy0J3/hgGc5xHFVnFNgGCFWYenmwnLa0xQhd3uwPJKSHoqJxobDRscwMYiBL3HFS81DavZ
	f2w6Cc5OtgBcqrn2JHh0dUY0PlJhqZaeXh1KfwPEFhzfHyNqWbNo4nn2rz9G8to0gGb
X-Google-Smtp-Source: AGHT+IGNLsnyopvoEGCAoELFMil/bI95Bbi59GnVO24Tgss+SOkt2jDXgVFqyCrkWQppUAutiI/wVA==
X-Received: by 2002:a05:6402:210f:b0:5d1:2652:42ba with SMTP id 4fb4d7f45d1cf-5d63239e3damr1998287a12.16.1734037760215;
        Thu, 12 Dec 2024 13:09:20 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d0f93d54sm9232348a12.68.2024.12.12.13.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:09:19 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 12 Dec 2024 23:09:03 +0200
Subject: [PATCH 3/3] MAINTAINERS: Add entry for the Samsung Exynos SPEEDY
 host controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241212-speedy-v1-3-544ad7bcfb6a@gmail.com>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
In-Reply-To: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734037753; l=963;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=W96WZYcRWJBuUyWOrDs/OpzeK6jPnXsbm8DFk91L+50=;
 b=vQxIcKGQNSUKYi5s6WONKZzJe7/plvG1ezTM9BPeMsyvRV75HipNqBcJuId8xUxGH6I1S6UUp
 OCguhCtHIWZDUKzeIFbJZLqtbTahyjdWEuz4elHnfQz6LuuJOWduonh
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_130923_856341_1FAB3287 
X-CRM114-Status: UNSURE (   9.49  )
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

Add an entry adding myself as a maintainer of the Exynos SPEEDY
host controller driver.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf2dcd4e0261785add520b5eac747ceac523e112..14041c5373df76c7a7093f106dded1080b5d8664 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20754,6 +20754,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rng/samsung,exynos4-rng.yaml
 F:	drivers/crypto/exynos-rng.c
 
+SAMSUNG EXYNOS SPEEDY SERIAL HOST CONTROLLER DRIVER
+M:	Markuss Broks <markuss.broks@gmail.com>
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml
+F:	drivers/soc/samsung/exynos-speedy.c
+
 SAMSUNG EXYNOS TRUE RANDOM NUMBER GENERATOR (TRNG) DRIVER
 M:	Łukasz Stelmach <l.stelmach@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org

-- 
2.47.0


