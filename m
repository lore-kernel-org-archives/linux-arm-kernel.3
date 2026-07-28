Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B640C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 02:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6eNcf+AhwmRS6BoOkHO52GkK3UKWVS1XZpDCOhvYRA=; b=ww7GBUfrSobxrwTyEyyZzuFC8c
	bHFKkp+ZtOg8d5KAFaUXZWNWx9gCrBQKtxdgrardc2Ki6oxRR59aIYqNbk61wTwVVv/kfOsuV573w
	lSpUCbouWwWv8KODNb4+gwUTvZ6wfPES7moeqWITJCXA9xGePMDCydA9tfiSr4xCfW4ohbdLDOuc1
	ytl24gi6wSLE/W2noCp9IP6NMmxC/9UAtaW9EkGRNq43WkJOMa9ZUqQSxrqvkldT9MWeQzuOMaKDo
	/uSfcXNRwm9dyqgoKDbKRNLHzHM62OYfzn8sCujuH/0kGmX95Hkg/sLALco20wMSJlnVxwqssVwMe
	NxyevGpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXtY-00000004HbA-06z3;
	Tue, 28 Jul 2026 02:50:16 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXsj-00000004HWc-3HgZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 02:50:14 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-80bb41f7f3cso32915347b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 19:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206965; x=1785811765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6eNcf+AhwmRS6BoOkHO52GkK3UKWVS1XZpDCOhvYRA=;
        b=kzMERpNCHdJi/znpf3IbLG6IYtpN0yBD70e+/rmGKIcS/X3Q8qXr0fb6GI/wrLvnDV
         OFUmPdx8H/LVBhb0ZW5MtUMC+c4IIzwNF1kZ5H1zzUrEorNwqBkI33MX9ct76edR4Ad8
         +1O1rj5ulYbRwPE5iKhtewEH2l07a5jhVFs7+g1Dhvczt5fgiuCKDzWyjOUxHJsTAvy3
         XcJsYKyeTAoG0hULXtYIBUKBWb969sAmsxP2ZAd0rXJXAdrMaMSj6qMtqAFl/5LoZ80J
         isZ5mYoLhbRM/VKADX14tPp7RYv6BExWE60Wdf7IhDAjApXBtcVvrtzxQIgvnhVeXN2Z
         N+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206965; x=1785811765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6eNcf+AhwmRS6BoOkHO52GkK3UKWVS1XZpDCOhvYRA=;
        b=n5VKTAgtALZ7zkF7U00XXSuValNYn1jlIzXzVtHVrYZ4KUsAqcC5EWFZf8UL+nPaxN
         T0mapPT1e1f7qrUu8Kj3YyR6jGAr7PYi4thwVm1AW8n2tu9X3nWrIMDlEKRAbE5YFUMu
         eOc8PlOb3oNJ/ONjRk2rmfDSGGM9xBzOxYR1JD2pxzraehNyVFkNzuOqyeVQ1UxSWnOD
         SQx5lXPh7W2ifmdeXhnC+SgWdktwzh5piXKbBeWDlM0xXgqrfvXbfyZIZIdHUuLkvJl+
         9VrOVNS7FpCWtmvXr33V1Ea8Anp03L8mtiPu8T5LSt/3XeJADUzKewKw74e4VupS2oWw
         XVDA==
X-Forwarded-Encrypted: i=1; AHgh+RrEQsV7/VIGrt8e2NDpNp2LsCoUvGm8go+KIUPSHlSytJ+0kNAMNTOx4FhnLg5XQRXGkFrp2DU2rGwwpEBscHlo@lists.infradead.org
X-Gm-Message-State: AOJu0YwOIhNTnOgpm6NIAO5SA42SA52s/JnhpBA/5dLdSCH2ri60U94f
	VVxxK4Dk6/rOlWa/6C1bg1fF7UTwyDGnBJbiBxbxY1v6812C2F8Vy9jk
X-Gm-Gg: AR+sD12JyhM3vFpZKLHWZy2gzgrG03JZ75tyLqnsMFRKyfp7kFgV0XHhO1g4lMcNS/w
	eo5l8yOf1YWqkFjclKCvQNGGMLp81/xmHBPmSObq9zinq09qGoziiojlnKFAyzZQ1QiQeD63bIU
	y7b5xA9CTb5RtVwEeRBZFBu3Dj1VHu+F3A4C0N7t2UTRA8MgVHx+KPhq174naOCgxjVfybELF68
	mkSEGZozAVzNrh2BCCWBaZDLcynQY94P3v74V6oI/RBy0JgirpiIZP9ZWKgcFMgaJmGRqkhRiR1
	hrO7djePlgI8NoapfE4A6jDkqzUL21ImxQ5RFr2kwSTUIOKX9bjfNyXOaPEsCc4fBbAtGlqNXSD
	0c4kVjpenKJKmd6I/o51T1DslwTh5CM/KC6+V6RF4+I6R7C0MluPApZAj24BR3mFmnq63oaWSqn
	pbHaQLrW37RcmOW3iMOYjTriWjjKLcit2350/N
X-Received: by 2002:a05:690c:4d84:b0:81e:d23b:f8d1 with SMTP id 00721157ae682-81f99368d13mr1674717b3.35.1785206964798;
        Mon, 27 Jul 2026 19:49:24 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:24 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v4 3/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Mon, 27 Jul 2026 22:49:15 -0400
Message-ID: <20260728024916.993224-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_194925_826631_9105D660 
X-CRM114-Status: GOOD (  11.45  )
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

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver in the RTC power domain and mux its RX
signal to PL11.

Tested on an X96Q Pro+ with ir-keytable and nec keybindings with
the remote that it came with in the box.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..1eaee20acaab 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_ir_rx_pin>;
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0


