Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE358D25031
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 20:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdyxAu691jD1kvoqPQKsR7a/fu/KpW6Tk0Vc+m/gVjo=; b=lJSekRDb81qN27XmBtIL2nDJ7S
	MrHyXuNIGpkyRXe2mhVruBWIEMB3j60Smx9oTKup9yptq4pyQHQZIcHwPvYkMUyv/ZA6eSWqle8it
	mzGjHRifyRiKHr1HmhMA3fJky4m3HOkuNsCuKwoPVs5RJxIbvrGaEPBOJr981Gk9Ad/lw5+o1jLo0
	VHE6ODFlJQCADPV+hTV8iZZRL+EmzJc7dWth/MFjbF4FBN1ulNm6RSmtxneP8RS6B4FemEbUxgBP4
	j60KKTDsyyHnpA/btChVEIKa+ZXAYE3/X0kq7DE6u9fnXKgjMYFaeBWEUqvkWGL8a5bvzxNS748wD
	Epq2QW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1mO-00000004TP3-0W5T;
	Sun, 11 Jan 2026 20:11:16 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1mL-00000004TO9-2yCB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 20:11:14 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-646fe7f70e2so3860404d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 12:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768162272; x=1768767072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdyxAu691jD1kvoqPQKsR7a/fu/KpW6Tk0Vc+m/gVjo=;
        b=AsCO/0Jsui35JL6fqwqu+H7ntfBC7tt6OaxK303EmLGYne5THDzhX1sn4a4GzJ+Yeo
         QuN/9exDbYON7uabInNLCg5MZIS81V7ytOGZqcNpT9hs9vVPKoPInQmKjsJdYNawzwdN
         vD4gilUVZw+YCJhzvN84WsHT8J9aQIsFpOXUxOmUQSDlP2z2vmkSAjdkIgq2i7yhIQWC
         dtdsGgm3mYxzsbC8gRx3Upn9hvPliLWhiy95WrG7Elxb2FfbA4BFa12fuaDXXMecx4/1
         GD+Xwgs7hfQjCD+mKOJhKjhZ4O3WQsmy4BER/6TSxlmX5Y1UrAtkKPp51dQy+9tNNjWJ
         V4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768162272; x=1768767072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sdyxAu691jD1kvoqPQKsR7a/fu/KpW6Tk0Vc+m/gVjo=;
        b=ksvTRUl83RgPz6zE7+dmhqMGru0BXMWMaqLVmFcy1j+B2OmlwPXO6p45D6dXEeL0M8
         Yp/fNb3G3EtrkNf1DiJ/Ftn0qsteRt/Lh2McpplMgyNWgdYW4IH5s9AwQlZEEroeAy+A
         QjSYZCmsMm7ykxy08SZY7Vvf0cjG0Q5kOrMYuW7phWLFdEv8rPSxKBB1Q2/rrxwIuiYq
         NsStlZSNxZ8UlxwJmEkJ0b+UAZKc9AUuHm2PYE8y5om27UG7tR9JtlOUrUpeqU1zto+M
         sPAsaQ3NNrkb9SApg3RK64CLcW57hwF6EU+GLcIUuFMU4T2gyeQcPFmUur/SeW+eDSQw
         MfqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnld5zEjZ2Bq+POQI5htnwzZU/2RktTE12gaNXQTW5rIEIK63seJsOVuWs3okpRWiGvJgoN8MWjiVrJFN/V/NT@lists.infradead.org
X-Gm-Message-State: AOJu0YzzM2FTJbXVmUl6zLKpY2R5ER8C2nUQCdQ6JaGhUWdGwrKl5Jf2
	IqdIz7ADBtPru9nD2KvlbQPz5ktN/jRzfgW3B/a8IZ0lyGpzYxaenpiV
X-Gm-Gg: AY/fxX4kb85SH9N7BLhhxFh350mC6Kz+ITPw78sOciA5F6nuT1G6GxeD9Oh/Kz+vcBd
	q4pDx0hVAZmwh77mL0KWP3kS9BwXb8G1bpSDS6IC9zCIPJIjFm3vB7sAPcD7804ENWL3N0DnV9j
	1q2m/dCRp4kMfbKuFjOEMMsAJydXkxnr6BwyHl07eKeVhbMeA1W7k40KQYHNcwMLYU5bW3Vy0jr
	hUAjCJUboV4f8SxiWI9+4aT1mNzHetIKZd5kVvoj18WA7tl9vYZgLIVYYippqatwpxhLSUmNeoi
	F7/VDplgVmM0dDMnRYTJhUe0sGXI7auHDefUe5jP5dke3e2tZFtH2NDDXyvhq0CLNqoaM0xGE7g
	cOLS7pmUEGqN3qz2KVgIbcOIGWoyVjM5Q5tOA+CiKUiacDpW+jX52jFqU/N2sXpzWGwfqZqV7BO
	uUAjo=
X-Google-Smtp-Source: AGHT+IGVAB5q8HU2wtzxDRFZ3iMEB5WzUGkbRPUYd3TtEmDhVLbDaRWN+ylZy9BkeQF2W7TNcR8BSw==
X-Received: by 2002:a05:690e:bcd:b0:63f:aef7:d01b with SMTP id 956f58d0204a3-64716b33bbcmr13406535d50.8.1768162272397;
        Sun, 11 Jan 2026 12:11:12 -0800 (PST)
Received: from toolbx ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-790aa5762f6sm62175717b3.15.2026.01.11.12.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 12:11:12 -0800 (PST)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: anirudhsriniv@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asus IPMI card
Date: Sun, 11 Jan 2026 14:10:31 -0600
Message-ID: <20260111201040.162880-2-anirudhsriniv@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111201040.162880-1-anirudhsriniv@gmail.com>
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_121113_750109_93480B5D 
X-CRM114-Status: GOOD (  10.02  )
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

Document the new comptaibles for Asus IPMI card

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..b2d20341f8eb 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asus,ipmi-card-bmc
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
-- 
2.52.0


