Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1F9C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 03:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=; b=rh04fF9JPm8HTWezVLKLak+ZI8
	7PIhYQK3Ifxe0wX+l38Y55jhPXF/9G6wxFuG3XmmEofO82dXqfUDBqouNgQj9eYSGeEPe2mcD0EcU
	ktoI1h0uFEsOgwNK8zyMdxmfbNbLqEWvXa38bNo1PYEHMEKfFxwicVmzAKu6Q+9F7mSCFUtu6oV1z
	BNdCqpMOBPSkaIGgpLqAlaxb2qlIN/7mAdT36gbsv4R80cUbaqb2LVvTXbQkAOzp2D2BFx9w4sbBp
	b66WQ2Nlu2Zl8PEkfdZsxRJDDTuFUvpOmJnNirrOZyA7J+CnOodjrhJdknYyGmxhiO1RKwo2hUY8d
	RHrGNqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF2mt-0000000Dwre-0Eeq;
	Wed, 14 May 2025 03:28:07 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF2kr-0000000Dwgc-34Ho
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 03:26:02 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so6247839a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 20:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747193160; x=1747797960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=hL1NG/nzhqF4lN0rfnXK+eoVbUJv0tUyDhKvaeUIHXN+BYXqUPjcv9zqQcVc4dq+KC
         dCEO0DZ4H2OpadlXJRqqgfLr/bxpS7KqphUO3fORCauV3OOy4bc2fYYvJjby+ArOha7y
         mOWX8O+3JiGnaPoGjBbtd+GJWPIul0U/wvF3e886zmyItl/IKhpK1k05VMHB3JDSThuJ
         Kud3oPJvDlinpX6DdrThavk26oM+sAbB2oWI7feA4ZA1+sSDLUbpWnL4s68brt2ji/+J
         AxUhXapWajlX7QlBFeKX47m9DrsXJ3RXyf61X11Pbhz1c7ujGRVb8NwGZ31v1rB3osTw
         mOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747193160; x=1747797960;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=WeAdc+8MXnRFjb03fPqsrzOLaUbdsCv81yff8WeGltaO41uq+xYL8W/J9CWmPhg7i2
         gMylJBtcClrYTIfTBFb6puqvU9oiTQEHwN5gwzSpvCC7Fbq98sHaTJ1stVvqK3liXIkT
         n/390aogihbBbs4IewP7hZqgFOg9DgGDnH3UXlv/jLaOqx1oIyC2mJPdo4GjT077OI5P
         iebDgA9wjv6/GWO+Lg6DE+bnu5C2akFlCNX1OlhdPZN6dkBA+m0jG5gdDS25+zdsE7je
         MtNBqxVIbMK1rQ54ypYgo3w9dPubeFjbWErTshPulwvK7p2jAGt4uQd/cgqSGwuhLU1I
         ToMw==
X-Forwarded-Encrypted: i=1; AJvYcCUm3aWyG0kOK7zaWaulPani7Y4XwgPaZnxtSNmj60Qvn2ThY3ldIYpKJP8rmjKfmDrVRHwiMOllR+RT5oTh4X7V@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/NLweg0YMGcxj1Vfec86KbMbPS1M9usuM6NsPsgamYNezRfCY
	6Ls+l97PpDoFegZPRSB+lxpc9luku+f3OifQWOR9j7MVzgM0hsxn
X-Gm-Gg: ASbGncuCE+FuhR2XECJhE+3Gvr8RivaEJ7gtAsajFPhKgFRJ0uxa6P/LlSZWMJHFe5z
	ob5Q6wEwwSY0SzsoNbVObklLd+F6msmJRiLuZTFrXsZBfO8ykiZXhiKlsu2jUhoQNsmiIT2OCAR
	CyHYTYRzf9ONa4pX4fVCT0k5sxkzbSlPV0FLIZbdP+WI++VuGxlGxOT/0GlyEEyFMkezL3/PHJx
	MzoTr9qa8L+ve6JQXqxdte7bpEe+jF3liz85ZGCjkg6vAK8izTp2eSqeTCpIS0pA950Ksu0lc5v
	mi8hLFNjLyt7Oz/DnUJM20UBwQUSpspN0Z8bLE2wnDDieBvU0u0QaBdmaKtM3yIi626Y5kug
X-Google-Smtp-Source: AGHT+IFgFmbcbTy2fzroMryy0JD+lhC7K5WXE5pPjhmZCsckNBHxwrPKsqyWRirO1mBQ4wl5Y94zsA==
X-Received: by 2002:a17:90b:3b4e:b0:30a:4906:c20c with SMTP id 98e67ed59e1d1-30e2e644d17mr3039146a91.35.1747193160314;
        Tue, 13 May 2025 20:26:00 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33451e6bsm414599a91.22.2025.05.13.20.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 20:25:59 -0700 (PDT)
Message-ID: <68240d47.170a0220.ba589.0feb@mx.google.com>
X-Google-Original-Message-ID: <20250514032452.275855-1-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Wed, 14 May 2025 11:24:52 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6822b830.050a0220.27a24d.d064@mx.google.com>
References: <6822b830.050a0220.27a24d.d064@mx.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_202601_789108_CC739245 
X-CRM114-Status: GOOD (  10.08  )
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

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index a3736f134130..4416a40dcd86 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
-- 
2.43.0


