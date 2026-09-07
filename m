Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DEDC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzXqym/+h9eePTEnyy8uEsFGr3+cylfN0o74nGuJQqc=; b=EfSzH7Gzsjhi7xay/BEDQNvwdM
	GIlQyc5vq/MlF0eoHV85nKzRvtuawVGGs/TlMyULPbp+n7kYMfaTzHWvKo2G9JGkZHZ91+LwxcJNO
	FHVD36d86+fdYydzvGgF6gGmbYCL/7On4PM0Mh7WRSNVGzMGJjgAcTFWiD5eB2XerNmG0g21ZDJoT
	SerDW+b9lzV41C9hH2Mdtffo2nVwptyxsiwZ2VOmeW3kfafhzTWlnlGmdsf2hTuG1ad5nzLbDp1gF
	TkqSdxLn6EAn7dWz88b9pUTSbkan794kMD/VTvLVnhHqyaBlqTKZf0pw3UCLC+Bp50l1kq18mnZwA
	W3fRvNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMp-00000006vdu-0TaN;
	Mon, 07 Sep 2026 13:26:35 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMm-00000006vdD-2u4Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:26:34 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c255c58156bso687287966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787591; x=1789392391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzXqym/+h9eePTEnyy8uEsFGr3+cylfN0o74nGuJQqc=;
        b=MWpbdUaJq4AbZsuZOvRt0bGmAJP4t773b9/CLefmQnGOeETBr2skGNvlV9Om4cSW4Q
         Clh8Z2U0Ma+EA+Kb9wXwTVn4wqmkBDc2UyVFFU6dHvk854KHtFOMYWg/bVQw0V/qHk8E
         VNbUc7UElQd8Lu830XX5msoTv6k9dHQ05zCPp29G1FNjkHiTlklgSK99NA8k66BiMdDO
         BbWrAgFOW9qrVMoXjEQgpFfntDjm2nZE2RXT83lXGVSg1knIBoQ2iLGTw8IpJ4ggVNrH
         1g/0kTe5si7LXVQXwGTUS97f4lscbOFlTDmBMJBhdmMyv4UxF5fRKjyQ+L/BAQ5P+gqQ
         Lwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787591; x=1789392391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzXqym/+h9eePTEnyy8uEsFGr3+cylfN0o74nGuJQqc=;
        b=d09y4cPVHeV3yQnWfvgQ4Gd5fY+t0p5xWZOb6Ptk0iw4l0r47Q9MUwJGi6glNk8C4a
         wj7755fQRD8s43unnS0NgIavHLi0GRj86HILmQkqXb2zoMD+4jB1i7rwOuOO1CmoTQgt
         1CyH7+XqdCyLC0RAwv+9zsK1V1riWXsX7prgboVo9R0d+JS7z+ZcI/dRYsEY3hoB7hTj
         rduNT5j16L3PaLzh+kpwZIBoUt2Ks3hqAoUfwg640+39LqCFNsgPRpxM/85ePFvjXNnS
         dxEnbdJ/rItn3ejYUyl88ABssqNr+xudjLYhai/6WcSjUkCbRNxD6TrmWELAExvHAEiL
         QIjA==
X-Forwarded-Encrypted: i=1; AKwUvBwmMP6MTfXrc6FLlxWwiIKA1y9+n5qpCPNkjMqCOoW3FCd86krdGC8+kNqYBE1pZpzSA9CvDqYW9mRfotOj8hZk@lists.infradead.org
X-Gm-Message-State: AFuF++mVbSy4Nv0Fxkv6mBxxCdQ8S+Ci0ft7tblNFf8Nae5NHqwRsSic
	GS0s7ooWJoZjPFnOkDCE5duuBQDqvd0SSBKiKvb3UxgWEGtOhLfbgpeALnFXe0EYu+U=
X-Gm-Gg: AYBFou32FDCxABKT946h9oeeaiHRXKnwavE28DC393HYSBMYOWVT0mAZ7XQWKUr3Wds
	7wu2xG9Xv3BmMIJvFe0CEOwr849XaxAH7GBpdNUYgqMSz/BK6wRvVlhuY6srDTmlRPIpFCpm05T
	fDVjkEterjEe4LdbIYW/OELf1NEa0M8v5SqrLdp1T7uMiOYv6ozOdMI2gy+fLlLW5foWJs33tHy
	U5s3mLRlVDiJoR2efRnMhpTSO8KDXu3DFOyetpnx2gUcPIXRSERna3X51SfwgVvJ4BbLpkO9SyG
	aiFIzMVlJy+8sFbty+0CLIikNooSncJVru/o/kpiZno8ye0/ycj8Qet++IS8N+kIuDtYOuSpAQz
	rFqFniCR1OjlhViIULpMPAHgTFQ6DNYrxkqboAaZZqq0s7AoGz9WjCEdyF5/M/CoFmEw9s0KUiQ
	hBfsHV7PgueWPq1yyd1Wurc8S5pDVo/5ah+RKdNK1Mim7KUhDlA4iPhbpM/O9NnLB0LMkao3Ed3
	mjqeq/KDEHO7PQTWHFuOzxHkC2rPHQ2gB645kA8DWPeX1inDwufmsI+aofgP9DYu64CfRM7nkTw
	D42wjzEwiYoLQAvtfkA8IHwYE2n3RZS5IQ0q/Q==
X-Received: by 2002:a17:907:3f2a:b0:c28:fb3f:fe20 with SMTP id a640c23a62f3a-c28fb400053mr139347066b.30.1788787590853;
        Mon, 07 Sep 2026 06:26:30 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:30 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/6] dt-bindings: mmc: atmel,sama5d2-sdhci: add LAN969x compatible
Date: Mon,  7 Sep 2026 15:25:29 +0200
Message-ID: <20260907132617.1198548-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_062632_819213_642ADC05 
X-CRM114-Status: UNSURE (   8.98  )
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

The SDHCI controller in the LAN969x family uses the same register layout
as the SAM9X60 implementation. Add the microchip,lan9691-sdhci compatible
with microchip,sam9x60-sdhci as its fallback.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
* Clarify the relationship between the LAN969x and SAM9X60 controllers.
* Add Conor Dooley's Acked-by.

 Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
index ba75623b7778..af1c66a1f882 100644
--- a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
@@ -21,6 +21,7 @@ properties:
           - microchip,sam9x60-sdhci
       - items:
           - enum:
+              - microchip,lan9691-sdhci
               - microchip,sam9x7-sdhci
               - microchip,sama7d65-sdhci
               - microchip,sama7g5-sdhci
-- 
2.55.0

