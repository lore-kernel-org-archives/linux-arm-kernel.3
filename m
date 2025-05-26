Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BB4C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hw+b30S7iFdzof7KyhoRmjmL7YOJsI0JrMdooAg75CY=; b=ZIZ4MLEwuvridNBhVPi78FSLaD
	mYxano8tix3XQgJ9h95RV+XMYudhewub7xLzb7VmHNArl4oyJrNAy/pnTuCH+sKzCnOq6OxsHXTP2
	3xMHl34uHTxejHGa3NTHVDDSrvNFoCzz0R2/uPgzSnKAUku6BjgxtNoEpZno66NiLJnM4R37bwbR1
	p96ldOWGf7umJMi7kSHoqg+0xX9dhMzzr0yd7XEk7qTLodozLKd/ZSJ8GxAC6A3ePF1hs6kFxe9BH
	1bYuAZ39kV4LaxfaF7ssKoB6EUshckZA/zrROnY13qyr1nm3s8wmLBkPVEaHDbYEqtMLSzcSnX0ni
	oK4cKXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUee-00000008ZuT-2cQ8;
	Mon, 26 May 2025 10:02:00 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUcV-00000008Zcb-0ueV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 09:59:48 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-73712952e1cso1392732b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 02:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748253586; x=1748858386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw+b30S7iFdzof7KyhoRmjmL7YOJsI0JrMdooAg75CY=;
        b=NZaHWRTld4uN3Nx+9HGzKyu6guqFYKMS3Bd5f6aflhgXkk7QvjD2Ve7ziIDTpUx7S6
         RNNklgd7LJjghKoNagAWuNO4NrSmyIJisdpW88mY8+zdIgiD8Ys64s/zG2DZz5Si3mG/
         PCYa5snqCnpscwo/Z1+mOQsKTvTs/s0+jGqIqYrfqPW55YbRhvO550ELDK0WZc5cXsBN
         psdHPpTyZywbWo//sSlLiLJh1h87l2tzJsalOOXFKly1NN/4HmdEphrFECZa5wQ/Y0bm
         5Z9DdyGVuHRNIQaAuPWHbWE+EKUKAXfA/Iaos+Dt5CXsxsLkkbePJnWGjQI1M1wupI63
         2oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253586; x=1748858386;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hw+b30S7iFdzof7KyhoRmjmL7YOJsI0JrMdooAg75CY=;
        b=UYcvBuhUliBix5IkTWvU3LsYJk/cMSmPT59395PmID/dkrBUJ0qaPZnKm5scJk4RfM
         7fd6fkobmNoCK9rH6diF6a5tvxxxArQ6b80GY1ZuPZafEBOkB7G3pi0taz41HwTKKaXI
         CcALhAC6ZbQ/ZyWU2EX+FLX0p85xlSl+l3dVacpkTeuha6e0bdJiE79uq8Sn7cj9s1qs
         0okCktUUPUIAavhSCmhXOg0Dlww9qgZQOycVOWYBFruVizqq4/P6L/q8+FaTEJ2wFXxG
         Scwlj8n45+/Dbg9/nmu0xLtauFfwyYY1uZh1xGgtsZ3M7MUvpFzVBLs6bKzKHx+6VsZy
         17Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUn9JwsOf1EgTANA/5ytzr7WvzKwWpzYwh9zYV8kp0RpY8V27L0tZjQz8YC7JfvfAyL2J9MxVjs1bME4jxIabcV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2QZklD3b97ZANConxNOTIMQgOwwNvQQ2OBXpsfFhvcn1td9L/
	KeoNSg+BsVKdZt/xCH3OTCf7Mpjsp6xbuZGgqhEmvKTS7/6BO3GlXhRD
X-Gm-Gg: ASbGncso4IPI562a/AEduLw5Zk58RmLVSxMi6DbdEosKhULGbdkN/YQgG0Ma9v4m+Af
	rukFA7tlBJPTxnyQc//ghirgIhiT5f6Hj4RIKZd5pZg/qQGcKjrEfzq0R///PyBByPHaxUDPsdM
	Dzt1x8mVpsz4VE006IYlwVBVQzl3bH/HqnUoJnaNon+Iq1RlDZdz49aJ5AKDv3qP0s0T53Il+tn
	TynqnV14kEmMLhl+sDAY2ittlOvvhRgIsyiWMwAv6nZIgdyxmnmyiPlDzsdZHrametDYfahQRMU
	FGAVG4Lqb/Ev5aqzfXWn3A6vtrw6stKw3MjJjoZPjhN1cYE4lLF7gZwbL8IgX/ZLpsDFIb2rnrG
	n8mfkWXw=
X-Google-Smtp-Source: AGHT+IH9dqXJxz5O35iZ5QNfhu3qUkFE26No9xhBeqSmFEjU/+GGgVc1uQOTE9NbI8GJds6O8V8qsQ==
X-Received: by 2002:a05:6a00:8d6:b0:740:6f86:a0e6 with SMTP id d2e1a72fcca58-745fde9e5dcmr11477511b3a.6.1748253585822;
        Mon, 26 May 2025 02:59:45 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d64fsm17225525b3a.64.2025.05.26.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:59:45 -0700 (PDT)
Message-ID: <68343b91.a70a0220.2298c6.5b57@mx.google.com>
X-Google-Original-Message-ID: <20250526095924.2814310-1-LeoWang>
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
Subject: [PATCH V3 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Mon, 26 May 2025 17:59:24 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6822b830.050a0220.27a24d.d064@mx.google.com>
References: <6822b830.050a0220.27a24d.d064@mx.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_025947_257478_3DC1611D 
X-CRM114-Status: UNSURE (   9.60  )
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


