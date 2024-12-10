Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C8FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ryxhFq/D6uK4o3TwTQ7Wdb4StN8ThF9XTxHXMGYXkM=; b=ygV0OShlC+lEOOZRBvuuKQVuDF
	wYRjL0RRyPxDa+gpiSQ2R5noF2YVNTXCzKQXdLhC1tUbpRDdXdIp7Df0KJd1o8pGc82IOarsfZjYh
	xINWF5vWj3Ku6G6FpbPBxUyAKA3RwlKIxSzBduwUmMAJWON/8AFImRtTLrwMcHvf49j1jqvukAgYq
	soPdAXu4ukqBGRhfD1eeHuE+bMdRa9jmrOxKqGyBiMWPeHG99isKSSDZcYTjPZiO2/SNfqFq9/f5H
	Splzmr2eBJFU1lXnnB9gYsoGYJ1BRjNgmEEoiMRzkG1INOw8kq5aDYXtf++w+dGAnENiLKAFgRnRP
	n7eZhgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKp97-00000009qeE-1bB7;
	Tue, 10 Dec 2024 01:34:41 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKp56-00000009puH-18Ut;
	Tue, 10 Dec 2024 01:30:33 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6d89a727a19so53826346d6.0;
        Mon, 09 Dec 2024 17:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733794231; x=1734399031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ryxhFq/D6uK4o3TwTQ7Wdb4StN8ThF9XTxHXMGYXkM=;
        b=LyQ4uTbLQJzdR4GCSGiOAUcZcy8YFsvRmCiclxv4A7ebnCgn1mC4mgxejKl8Sio6Ju
         cuk4cos3RAoUiMSXOxcVGOyIiPRjgybnPtk+ZCgSl2OY2N22KbZMJAo+4PbcAKqNL4d5
         spZ+pDQkelsc98IEma2n56goi2JTCkyalaaNH4VxO2j22g/sd6NQr9QkTtibyghW8Hpx
         iUsUBd5pXe3iWw7yEsk1kVnZ2XrrwldmGDqgQ6pB6NWiknMTy8xz1fsYCXuwxnmg82/5
         94ZP8OM5IcCYsYbRZU9A1yllhyU9Cg7sF9yM7zIvB8A4InOEwfCdriwbI1fu4x/pwUrO
         bJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733794231; x=1734399031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ryxhFq/D6uK4o3TwTQ7Wdb4StN8ThF9XTxHXMGYXkM=;
        b=CXwAYD2Vqxur8241rxO1zScOzL5IPfNm3JCNwHl+YRM6OSDSGN484oAxnd8+3t/zvK
         pg0s0gEJY1mnvxjVm/ZxeXyPZ7Wz5ALaTJIKZq8jVXSP0zyx+UJg8cAgWAw8LUEkUp2M
         9HreyFvagjUj4X7HvXjL3F5UuSsqxo0jsjEf0iHnRWSNq9DtTTNKq9meRDtFD1I3uID0
         r5GAmPlO590OG4n7J/8RW9xKp3pFwds9tSYpW+AEMwMkZ0/5jIXqI4DQO0fe+k88ezoa
         3zJhTkxm/65xpnQwOVA8Ia0VRxfFj6HUb4QltrIW9qMaQ+PA+6EtkNudr1iwqD/CHcnN
         iEmA==
X-Forwarded-Encrypted: i=1; AJvYcCUlT6WwNpzWRcmPTIgHJK55c+cHUyGS7v8dqOfGNUJYjW1gIfUGMu6xj4DjeawfTD+MemqcDPlcRoqJdXkoRgs=@lists.infradead.org, AJvYcCVY6QyqiKDoLMHLbRPQbToG46TGMAzJpWffm0M1M1WVoa5DahN2UaNGgB+Q7qeVUYf11NxC6j2ip9uAfTl4yQhu@lists.infradead.org
X-Gm-Message-State: AOJu0YxJjq9YNSB8fQneeWjWc8WDfRTF1OBZdhg71DFRhAWJHZuJb6wh
	9GUDepfNcyJ9+RLesHpgc9gUcYTC3hLaPOeiba89UndaRWdGKTAhrpbOgrgB
X-Gm-Gg: ASbGncsVteRPlJFrOQEqlJrT9+GRqLohWZoZNUL7reo71DMC0vM9HH1dGgKLO7gyLxS
	+qz45lImODam7A/OTcUs5e2xeKWJCSaGbLLFXeG2N1JDi5ybD3Xtk4vY8wgPDEw0atbuDYVWyxV
	1Y4NUXVcySdYct584o5OnmhKcUcoiFFw8r6ehUWNEi7006KUjNIyOTFhPEvh8XhLc6olbDQfqR9
	BaW4ueEHJi79PISQKzzUhIsKF2IDehtB3AtsuqPtl423nyufT4YyI3wUPAqq2Ym5Q==
X-Google-Smtp-Source: AGHT+IGnHu4GKol3hVAzHldnP2oJaYa4cSwD67AUlgoZTcrdM6Y6t8bZ454xDQJ+meiSiuoKJRyJhw==
X-Received: by 2002:a0c:edcd:0:b0:6d4:287d:b8d9 with SMTP id 6a1803df08f44-6d92128fb74mr27104106d6.2.1733794230935;
        Mon, 09 Dec 2024 17:30:30 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.53.234])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8f429a79csm36834346d6.72.2024.12.09.17.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 17:30:29 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Peter Geis <pgwipeout@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 3/6] arm64: dts: rockchip: remove ethernet alias from rk3328-roc
Date: Tue, 10 Dec 2024 01:30:07 +0000
Message-Id: <20241210013010.81257-4-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210013010.81257-1-pgwipeout@gmail.com>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_173032_305821_EE5079F2 
X-CRM114-Status: UNSURE (   9.99  )
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

Remove the ethernet alias added back in during the rk3328-roc dtsi
conversion.

Fixes: f3c6526d6fb2 ("arm64: dts: rockchip: Convert dts files used as parents to dtsi files")
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---

 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
index b5bd5e7d5748..f782c8220dd3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
@@ -9,7 +9,6 @@
 
 / {
 	aliases {
-		ethernet0 = &gmac2io;
 		mmc0 = &sdmmc;
 		mmc1 = &emmc;
 	};
-- 
2.39.5


