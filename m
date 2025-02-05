Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F814C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFbHN5oAc7SgW4VT2zuwkkX5wnrVvIlDHxKFH7OFwgo=; b=PQu/yt+qOIixL13/o+ohByKTuf
	SOOKjkTBXz9B5U3IzZxOonmfKVbFFy/UeuzQV5NqaTDioJkDSRHqN9nYcSvJ+Bfc5gXnQd8NzdBVl
	ZSi4H0211zogZjoTwawvnLQr15h2JyYoXnBLVMhEnQ1RR7QAJnF0RBUN96B1MFXwuiRBAHB8RzF5E
	oScNtYJlH925UUQS4zoZF/kvjc7D6MCVPZ/JK3MT9kyu9Tcr2wkqH4FaUkJiP6gjf3jNXxxVVcJhF
	F3GlxQHMt7CxS+rB1SYxD9b8cb+wYivDJZSJFOfJZEXXTyfrkuZA/Lh+wNZL3EO6/RSQ8WnQV7JK5
	TNTEvqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjja-00000004Bh3-45sz;
	Wed, 05 Feb 2025 18:02:46 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjbX-00000004Ats-00MM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 17:54:28 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5dcc38c7c6bso148598a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 09:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738778065; x=1739382865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFbHN5oAc7SgW4VT2zuwkkX5wnrVvIlDHxKFH7OFwgo=;
        b=gb0mwi+uR4tQ6hPW9JFqVZQH4fpUzfmg6kG7ZTxg+zSrHNeiFPcOEfXPjL0mfHVm8T
         b6UkLJALKhl32IFlOxrF1mNf75W4j7R18MknDrjtasrN1EsMwJuqALvoYIURR1RvdzHr
         42NxhW21l+MQUxXnnmx7e7Afyf3522dcysIII0GipyypVDOzBKLZUJ/AZ7eiLjdCL16E
         V3hrV46zgXq01fqB7+rF/G8h9od4dbxwJ2nnoJMF82ACAmTvUgQYI4sEiAad5qJjOAlX
         TBsl+xQziJ4X52TOVJH8O5q3EAUOsRkb/rIQ5EoRe+oTziQgskW33H/X9hsOvWZcyR7f
         c9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778065; x=1739382865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFbHN5oAc7SgW4VT2zuwkkX5wnrVvIlDHxKFH7OFwgo=;
        b=r3LHVVafsZWGv+PCyQnHCrsqvbGsw5RBoiv9Y6w6QAlHCXQqBiWSd+rfa9n7jTkGGA
         5i1fQn/rBjWulXeoH06qSGbNNUpSNcDfQmRUgDKzdMoPZPK/DIwiPB85IspupANsf+X4
         X7l3cV2V01o8nlrTPkCOX/r6rzq+u2YjmG0aqT2qSJOodJRpTRC7ed3oHFpKIyhfqA2e
         +/WgVZF0goNtOUjYB/uDr5pF7/TvMCmDae59XE2WtEQhxdJ0VjrW5TMrj2c5AxNwIB9L
         Gl4lPjK8XP0dUDh6yu1oGMfwLPsdNGpooVKOTjoTKedYpT+rtp7EwiPi/DM/S/44FwS/
         sG+w==
X-Forwarded-Encrypted: i=1; AJvYcCUyxqrlzQ2K7TlTKiz/1eDwzqr7oYxnB78DJfKe/7bWkSrcl2thfH3m8P49Wn3XlntrELaTLlM/q3zIsQqBxb14@lists.infradead.org
X-Gm-Message-State: AOJu0YzEAnXI3aXvdxvQA4LzyZbCFXOQnOkwLGor+MP73ZmI6vNkxeTe
	JtHl4LWrewzoAN9HL9IAnGNbHvbOIvStDrXzOV9THKLlAjtBoiRXzOWHkq3c0QruORrzlocbxLx
	NdAM=
X-Gm-Gg: ASbGnctWiXnOcI51NhLU5s5ub723F9XGAA9zdO9pcTwUmxExRl6s8KG7KOi37CKq1/+
	U+l1j0uaM88xyGBO6/RJh9ZRf99cnannhE6XUgu8/+fy/eT3h8KoYz4pn+KxKkuxFt+Rf/j8ynf
	BPT32jz9J/8Y+bLqltw1LyTMcwyBivpIqlBI+rRLefnEOHcEl1VPUleccodRMKy9jY8DCXKPbMn
	GrDnVp/72yG6LnrQIqHukNVn/O7KFLbkyVI7VhOzQ65sYCN4zxadUxtmWL7rNdy9SyTiU1zJO2E
	xvq/lX3We3QRbqAujxJxt1RXoBe6D6nmBzxlOmRXkBiafnaXNyOjGg+I9A==
X-Google-Smtp-Source: AGHT+IFghfD4xU69d9XitN+9G/D9V5XoV5J6reB++FH/B/My9SQ8BVRJedHW6F+AYAfpPxe7ux9Rcw==
X-Received: by 2002:a17:906:3985:b0:ab7:6606:a8ba with SMTP id a640c23a62f3a-ab76606b5a8mr232774466b.11.1738778065181;
        Wed, 05 Feb 2025 09:54:25 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab71166a8e0sm773920366b.158.2025.02.05.09.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:54:24 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: pwm: marvell,pxa-pwm: Update to use #pwm-cells = <3>
Date: Wed,  5 Feb 2025 18:54:01 +0100
Message-ID: <266765abb8251bd60796a3c4270e3809bfff952e.1738777221.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
References: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=TpqSOnoMvrWXemfbgCJPH3YeRF/bonSoXcUzvWn+vu4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBno6W8dWtaj4cUMGIwF5w5gV/ZCp2eGvCr2v81c xn87SbAtPiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6OlvAAKCRCPgPtYfRL+ TvDUB/907bHQIbHV5ok48M2kKVOeEpYDp08cDbKuaYia/Fx2N0v/7FH8AAWICZRZLE/vEcZnGNM qg+R3mYZYFjgLW28Lh7bp5FOej7vUkYnVp09JCxUxSWUjPXTxn2H5My3eg87CRLyq5yOAePQ1uh emNu6O+cTTCjRZSSrgokGalcnxjLoWtUnsesv+Yj1O6vWAXmdSStfvqMdieyXy98weBV8dlDX3Q 9vgdy3nPQXzfL7iUWnSEgOrq6A1Vo9Bc28UtwB+lrPjrfIMcHQR9cH5+/3jOJKmdNS/BI60IIBF sjioh4W2VjZEKROmBBBuuWUG5RS/ISyXtAxWI60A+FLWV/en
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_095427_038917_8D1E4BE1 
X-CRM114-Status: GOOD (  13.00  )
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

The PXA PWM binding is the only one that doesn't pass the PWM line index
as first parameter of the parameter cells. However this can be upgraded
to the mandatory binding for all new PWM drivers without breaking
compatibility for old device trees using #pwm-cells = <1>.

So bump #pwm-cells to 3 with the (undocumented) promise to keep the old
behaviour for #pwm-cells = <1>.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9ee1946dc2e1..ba7fba67e19e 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -25,8 +25,7 @@ properties:
     maxItems: 1
 
   "#pwm-cells":
-    # Used for specifying the period length in nanoseconds
-    const: 1
+    const: 3
 
   clocks:
     maxItems: 1
-- 
2.47.1


