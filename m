Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC76C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=; b=N5UsGaDqypSN2bWNFOpsPipcCk
	eM+eLmxY2qYgtSDHHboLbPVWGF+G1zytxek/dgdqAxAWHmTQhOPoFyLH4dkKV0YfBTujCh2/K6aj/
	nTo1DJmoXS73y1cYTFriUqUp7/RnUxk4A7VwWsyAQtLm6fnTsTWlDp+PXfp7w0bMTv1Q+pBip1qnI
	J7T9B9Mena/Px59XstM4PFGTEzOnRcUgkca2RrXa1AWw5tzg7oI3z9NsZCIAalDVuNRSJSIXK6FPK
	eeWdA4DvN1jiO80UpLC+tGVe1Hm4ak9fM4zeDnsvFyJ5ElKl+2F2Ydftw+p6XAXQP+9Rp+Am2m+6r
	M4ByWv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iix-0000000373O-1Vu8;
	Mon, 21 Sep 2026 18:26:43 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iiu-0000000371P-0elO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:26:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso47293165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015198; x=1790619998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=x7+PthbTr0RYiMr2ymWeqRzIaE2/0p0Jh5B346XXT07qBBPJdtJo+Qv4uM7F0BV1SY
         iugef9M6W30FGNVVEtjl4LJgfMBrGpGGBJ5iQKk4B6J/wTyCwpck3rv3zWV1+i9M1wU0
         EuM4VDnNvd/A1VNpiAtTA08dkcyYlivqpfDICQx10svlfsKslOsYyswSi7oCCoS54nRk
         JU06f0JTh95d2sSHVWjPGCWqDYR1KLC673E9ITzHlOnDuEdCK76MllwHh2zJ8I1Ac/CM
         8EICCTtDMqleWbfukcfuxrIAdq8gzpGRFWAFxKoEaHiGf3kdGHpdit8JnSHFRdwfVPSl
         DQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015198; x=1790619998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=Fr4ffrAkniU3GQ4qASBP07hq/Z+dbJKBCLoENiY4wmzU9Lrzn1UPHTXPBdeHMXGRKN
         z0FH3gYT1moi7c8PMYI1seXEaQduOJ+ScvjooO7Ga8ADp69I6zscQYIDaguAuea/bfkX
         G1Q3pFZG4rTrAgnYgvteeO9tUyF9m0FITkUafzfaElTfZp/acIBNAmlS5xyWgSGQ2udO
         StliU01E9lmZ5UZSwE4ooRe6H8ayvcsZgWJDoPmXBYRTIiflL4hLoMiv2ExM7aefHTuK
         Bq2ELiwi0e5KAsUUpJOXrwatC1FBh9KgKSGJ1LW4PTBE3dvS+aOatP+BJiYGQqvHAeAR
         aAFA==
X-Gm-Message-State: AFuF++l3AePSQElE017im2MFpUApnqUwSCJ/sCVpr5RxI0DbCPaV95Qc
	u0K7DwYN3dIVoUU9c3XbIiKmzPx295v3X1Nm+eFsU+s+K9Az0sy4lPh7uWcooXhMXpUny5tEJ21
	zVpA7xwQ=
X-Gm-Gg: AYBFou2/2V96jmIN8v3flxt1jFXIPr606l665fDOVVCDxnKDYcl+i9r9hRQbOzwOEwT
	zTB2fRb68thMk5aWCyDuj14D6M81yZL8ZM0RWkN1edRJCEq+FBmCKJ7h8B9Gtu3XdUq65JLGlTo
	cgklytIqglULdP6jyknCEZ15jCA0kvFUvgqyQNuOarD6zvBqUzGKkAv7RJIJs6YM7dGcC+f7GYV
	H+7WsnC49qIHfRPln6sjqEv5G/njqUQYQtuivWKFPyh2zaGeL3BikEPbwYFz22vG4g5/xbJSlxi
	y6rNE4myBo89vLQIxXTFn4Ho1T473Nynx9Uy/uDOkLaZtGTGbtJvzbZJ1kAKJGUc2pr6vSzIfzJ
	V+SFr+X9ppvoNMj4eREznRmjCpVgntGrmXBGh5vYTpsTKte1eI5jfBZDqYGr6WKuu/XiybIjv9e
	SFfbrgRICmhBsrceP8oHcVtSQs3Bw8vRTPMjeOnQ8goFuiqxW0qB5JJ57Xev7F5Hlgf44kpCrUC
	frZWzt6kykRp2K9YsZ9SMowP6iYRPo2AY0l
X-Received: by 2002:a05:600c:4ecf:b0:49f:bd3c:bc27 with SMTP id 5b1f17b1804b1-49fc574f074mr156497555e9.34.1790015197620;
        Mon, 21 Sep 2026 11:26:37 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:36 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 1/6] dt-bindings: vendor-prefixes: Add Tibbo
Date: Mon, 21 Sep 2026 20:26:15 +0200
Message-ID: <20260921182620.17597-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112640_450230_767A56E5 
X-CRM114-Status: UNSURE (   9.39  )
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

Add the vendor prefix for Tibbo Technology, the LTPP3G2 board manufacturer.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..8a984fea11c3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1728,6 +1728,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^tibbo,.*":
+    description: Tibbo Technology Inc.
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
-- 
2.53.0


