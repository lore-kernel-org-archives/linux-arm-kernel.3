Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6149C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGKMtQ+STHWX745bXtM33YEEtXLhlCq2s0TbaL9pJps=; b=2KzxYIiYsE5ZjmeaRtfVkHtena
	X/ApwQXiLmSYAKOMzBVwrbN95bAQHV3tr3GSoXkAWZrDNQ82ylgHBXc/jG3ZDwGX3ea4cnJt4bY92
	nd4ExoFXN1aYxhy4rMww3XzxmmmH+c66qFMWLkznFjR1mpzX2uXKbf3YZbqVRRwghQer2oz2JwvUX
	+J0C26Ca2SyNCA6iBLztIjAkhUsQA42snTt4ITzr44Ns2gtFG4q17JZWqH65eqxscFsDxc4ct6ZWq
	PeCzS9+nkEInjMVjdGnX5WNqKoGXJN7mizwrMcQ3EE3yNJfTvFbcEH6l4ZNeFm4+2+POP0oQzlhcp
	kz4AVH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTVA-000000081jo-36JM;
	Mon, 11 Aug 2025 14:27:52 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSya-00000007tdz-3kYy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:54:14 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b4209a0d426so4386854a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920452; x=1755525252; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGKMtQ+STHWX745bXtM33YEEtXLhlCq2s0TbaL9pJps=;
        b=dFQdInGYX0CjYML6FOu/8bIodlbtRMMpouLGlR/UjtAfz6Ql/EMuLPwDRxMnMqAmlr
         JLuaa1T5bjgvfQCzyuwPrkMwt11gcILqF1IX2rp7Z9AZeW32jhqc7XRVjuMhpiXS2XMq
         +KbKaJL80gAMZWbH2yvEWp7IvatpzBfSKS6rESY51moqmkzbC4K/Mgw7rC/wuasOebj5
         OROj0Wyi8Q8EwNdey1Nk/WFx0ih7JZJ/7qNv6R6V9UweOP98wZWU6M4ziIwvdrsD6Zeg
         Csosw5ALbBSO+2vArTL3NzUIMAA2BzOO1RmxZGkuSyaqb28DxWpMgrq2qeaFlvPds+zZ
         O5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920452; x=1755525252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGKMtQ+STHWX745bXtM33YEEtXLhlCq2s0TbaL9pJps=;
        b=qV6pe7fxcEkr2qziejXwEdI5rr6Hqv5vov9uLjFtZkIdl3iFBmYQu7paxP33NVEbRy
         j4f84WNh/damuuZe0/ieQ6SBOlDyIBr4mo+Htf+p7dcvWhd+VSrEvLgZEFC1jrPOjlKK
         IioRlNpg67HQgAmdwzT8+WZW8SxQawi8miaE+yMv369JL/3pOl7vCf5agTO3ELfTHy+T
         SwGboHRpuMzoPzXzH+LCJcdyMKlfPo6dlH3tWTaYJcoNhGb9on/MI7dtiRwm5T3J7700
         oYJWLOnUt6o3lLmvAxZSzlLJJis3kuM8uByv0twfsVY419D0RF/4E6Fbuzt3xdUgDFrt
         mGDw==
X-Forwarded-Encrypted: i=1; AJvYcCVYMGBTL4yaLIotM4ivazcY5tGb2zNC5enkTWZJqs4ESUz9hCnHWTNChkEONi4wzp24FuB2MiMi0bPpOd1fvlyF@lists.infradead.org
X-Gm-Message-State: AOJu0YxEOd+B6qNZAL8Lre7RCMbEo6cSe9fK7ioqx1WDf74te9QCdJDx
	3J614zfTbpdxXaLNpFSC9TdeJLGtNd39ETbveb3s9+QoVReYI1iu9BpD
X-Gm-Gg: ASbGncue6vvZhYN7XxEAzBdz33WRU+4asAkEX7sj8KhVTen4ZoO1YCft9POYrmzGkIc
	q0TGFNq8CUQ98yZLw8Jbd0V+8bzEPtqg/UoMNtkOVGvhJT6xQx6iaS5xgdqV4gOqTvp728IsC94
	TAQ94lUzjEfNBdExn9BxGB0xu9d9XqIXy9bywEVYLdriGjbgZWDQnJhOrLj1P/JzKw0iBEbkUmD
	ccw96Nk07qyJcdiw2zb+DJFyNbRKMqpDLX7BCx11tMXOJYgCXnZkAhtFZvPgq+qeD5TDjVu1FP6
	GI2ymN32wI87UCtOsltXFjExetXqK8/JcxtgsCMvPa45Tyua87JPQKhLgKHcxemP7HJKlT6tpwm
	H4Ws+bAc/AuOZgEj8dyVTNbmwCoBVYGzstRmK4SfMCxmTJAo=
X-Google-Smtp-Source: AGHT+IEIZ1XBxPcTymwBYPPzyBCGW0yUeeVKd+RPAU+9jNiS+qis3B21Ff4YXGCY5xSPEvrFPxt0qQ==
X-Received: by 2002:a17:903:1987:b0:242:abc2:7f32 with SMTP id d9443c01a7336-242c1fdc798mr171527345ad.3.1754920452155;
        Mon, 11 Aug 2025 06:54:12 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-241e899d272sm272976285ad.135.2025.08.11.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:11 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:53:55 +0800
Subject: [PATCH v2 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-t8015-spmi-v2-1-a291acf0d469@gmail.com>
References: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
In-Reply-To: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9HAo2qif7NcILZ/7noC4GfpbcMRkxTO9P77K8AEkp7A=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfX7zpLvmxW6s7UUY89esgb/8NQNOYxgktyEQ
 CIi3YkAfR6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn1+wAKCRABygi3psUI
 JHyLEACfcKHMzV7MaDy5yhlGO0zb7Qmbh/EE9jV7lEBsA6WUdpVKEYudEZKG7frX7YqluWR2rrl
 JKJAOu9bbzMV0r+8x4fDc/pOSP4i9rL+ZPXcA0r/0MHCPIxSBbiAYWdu8N67QxNyGQb8ksvzgxy
 3VCVf25yoMTJ4NYKyPm/mLsna3A0XrYdPkPD5nwlof6Hk670AivzxmagJUFeZVXls7NK+nDg5g6
 9Y1Pem/ZRkF4//k+SfxXf8iG3WgboJt6B9UcitWYXqDi1D4of2RzBtfUAUlPDLSoIY2vcjHjWAG
 utKhXlWsHYGFoXsmoevSOtpEEGPuuKlFbEYCsoVDSwCLoFSoo5VThZIU814WiuBrLCOcEHEI1cI
 JDEXRGKaDMDDHxJrLZzHz2TX1RLpHz2xpppGBV9ytOt6Og04Pci+WnYR8K7d2CHv9OIMBq1Cftf
 C/KOa8z7oa+jVMfaGpv0f9NihDGP+LW/cg798sLv13g/d5Fdmb445S7XPcFKWQ1wAPfbyHUo6lE
 L3SpaiILTtDs76SU9RQY3V0pxiU1x9aZZ4VVPk4dDFgK9GwB62ttCk8D4/BGSBYg43El06fla5P
 ijtMF6YpEycsEBGi42THgas0zGp9ahkZKtDHkAg8bhQAFEqufiTEkITpjJm40DQF2Rl3UG2vLE7
 B1HP2s+pMXkRhaw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065412_939638_E2FDFD9D 
X-CRM114-Status: GOOD (  11.13  )
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

The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
existing driver so add their compatibles.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 16bd7eb2b7af2c0b176f0e5b1970f4670af691da..e3aa248c0326c36bb0307e8aad4025b1bc05540a 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -18,6 +18,8 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,t8012-spmi
+          - apple,t8015-spmi
           - apple,t8103-spmi
           - apple,t6000-spmi
           - apple,t8112-spmi

-- 
2.50.1


