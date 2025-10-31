Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8733ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 01:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3s1Pf2chIyJ4GtiDiT2mhsesiDGOlvUaZYqYIQFp28=; b=ylrqAqQ8NDMX3DN92hXQELJmsi
	JnVPagefY70AMs3tWYMvsAZSm/JC4LZNHmgL27egnyZ/d8IHvC19vCOShXfQKoCfBHLng+mR7ScqY
	fHQcQHO5LxhQtCag/e46j0LOQuz+wbr41wKIyQB3JBaTRvG9DfqOvKoqEu9e2F3pGQ+VaJyNGGD+v
	rWuvpZ9NPlVULOwOar8F6WjVFUDoh3Y3lHP7HLDE+UaNoM8WGpLZrkNJmZdJPqHrbH9ffXDsQWsIq
	IgOZDs0hnj7cUIgcG3pvdKrUBCJn+wkwKqBvF0B6LfA3tw2YMeazQpUip761ByMQsKxDPBvZZoNnj
	Cd7/idEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdt1-00000005Dyq-1Ebm;
	Fri, 31 Oct 2025 01:25:03 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdsu-00000005DwS-32aa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 01:24:57 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7a4176547bfso1685575b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 18:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761873896; x=1762478696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3s1Pf2chIyJ4GtiDiT2mhsesiDGOlvUaZYqYIQFp28=;
        b=mEFlECXRNSBSWXFdYPFZ81SYChYYMO1P4c7JjhXT3WYWy2ATC4Nhjads+IG6T20SWe
         Kx08JqWyOcMPsgsCtgHNLCRUwFYlFIJG2ZUdWWEr1jMN+76crKz/x6fh0FEpeqIToQQd
         izoz1VtShE8VAXb2LiK5dFuav9GIhVv58wPC6tg7iwQx5W83tkq3VnQ7zdoblCm/XU7K
         hzavyHoOj77br8ej9njp0iynBZvRETXvqIGuS6zAMatvkXeG9qaK+3+EDMGffMv/eii8
         Q2mFt8r8EV9dKOuthMl0a/Ku8PCM6uOgipDS+ZxFqcqR7OZyuxViqXMICIBEPvMWKYVj
         BbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873896; x=1762478696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3s1Pf2chIyJ4GtiDiT2mhsesiDGOlvUaZYqYIQFp28=;
        b=eILnI8wglYSfE0sgaZjKUNyMve5IsQoAtF48wnSadq/XlsH3PDpsXp5MFqli4xLaf6
         HQD7CmIlnloM69dzycalNTAnUXmSi9bXYjPGeqwGDA/mH5/6QBtSpdkGww/vHnWr+FB7
         OrnXvzYaytzhjzULhoqDIA6yGDOLbSfuObFlNBeDXjIKIBiizB4pdaxeDWgcnbCaH//V
         gsugpCMT2iBFgJS5nBTRdAyySu0zRPA//vLofcMpgQQavZb8hk6FsarHdZStEikjFo8d
         OhcjdjmLUtUCuEXkVqliCNcyX0R0SQuGNUnrPtIyfoG8z+N0tOhuQ1+Pg86N0xsEhARk
         FdNg==
X-Forwarded-Encrypted: i=1; AJvYcCXlCGdBfBYC2WryoFN4cCF2EprcGUPLgu+nfc5PJIYRGAJMHz3wSORWy0tvXLYNwDnFgotPNarnuMz5yKXqgf1K@lists.infradead.org
X-Gm-Message-State: AOJu0YwoX21szmQRJZilm4D24yoHT6t2DTy2pQXKTvh+78Bjs/8J7hA/
	U9YXWVn6W69kvxS08Gcro+1DZppO4FnzdryjVuxyO2jqVi0/PXs5sF8b
X-Gm-Gg: ASbGncuDM/Az5/MuLvd0Vskf2a3XFF2hc3RDl4aP3hNDtqbNZsylYShHHUJFCzafRSa
	u5oMTalPzGi7Hmq97bd+++tLUWqVeIlgCQGtIEq8UAXgJewTXASbTReeEiP7vpRy4q34eXB4uAL
	KBJsp+6KVAqb0hrgBjBsYJLZBgdvWaCNfMRZ/1SKhBzqRXz5NYL6FdI0jb8D28d38oKtN84Wudr
	Rx/bVUNE0ASFE+LrcFHrvvSKBbm4HB1KcrQdAD5OwFYh1OHrY0PSD6iNo34U6JsSsETljeFe7qq
	LCR9mtBTvO6nJsRMIQWNG6xOJSw0lYEDHNU3uiFfEhtaB+/QUAF4YIWI+eWsfcxVbElwyO+dhbg
	ipQd/XHihP5txn+niDJryMcbxJlCdoSCsfmQV2Wcm8Z6Tdr66EsWo4TNTJqTgiczSClIKCp0t9I
	xU9P2R/gF/BQ==
X-Google-Smtp-Source: AGHT+IEQpxdK7nDSwTz1wkNW6JuGLevqLFpUO9kj409rzEmnNWQoF0aH834gvH8ZTJyvDlZYvh+hhA==
X-Received: by 2002:a05:6a20:7290:b0:344:a607:5548 with SMTP id adf61e73a8af0-348cde0a4e6mr2555602637.58.1761873895775;
        Thu, 30 Oct 2025 18:24:55 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407f09fb16sm534423a91.5.2025.10.30.18.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:24:55 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Fri, 31 Oct 2025 09:24:26 +0800
Message-ID: <20251031012428.488184-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251031012428.488184-1-inochiama@gmail.com>
References: <20251031012428.488184-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_182456_769831_8B969571 
X-CRM114-Status: GOOD (  10.06  )
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

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..916ef8f4838a 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -70,6 +70,26 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii-txid
+            - rgmii-id
+    else:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii
+            - rgmii-rxid
+            - rgmii-txid
+            - rgmii-id
+
 
 unevaluatedProperties: false
 
-- 
2.51.2


