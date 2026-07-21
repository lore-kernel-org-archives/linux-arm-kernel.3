Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1273EC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VCTZhhsDkQDmv6W2lFgIQm5lul/8HcQoqcagpiQUCv4=; b=ttdE7074b+ekLB2+3hnN6eHoN+
	FbGhh3n3npZPbBnS75S3F08BUOonf4po3h6V/8xCi8m2PTIX8zflUZStxzsgOrsOruwQKnH2OrNQL
	nzejwMDgbdC2yiEvIYAliyBl/SQD0ynPxfyD/0hyCy4n++VN3v2FTMCyIbUeN1EM/Z5rEObZqxnzw
	U9dMtBK9FdSyhdc/S8bdMEWZCJYow0ic2ehdc+5R1jyNWO52a5ebwooMG6KmThD9WuJPzIZ1Q3p2o
	mmfFjigwcHsiHe1d/zRyfu5tLyL21bko4SE6ltECZD9uhJpgbhiRxUQTFzoxKCaJZ4AZ92dUUrL2K
	ccnnESyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5P7-00000008jkE-44z6;
	Tue, 21 Jul 2026 08:00:41 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5P3-00000008jij-30u2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:00:40 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c12614b81c9so1978371466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784620836; x=1785225636; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VCTZhhsDkQDmv6W2lFgIQm5lul/8HcQoqcagpiQUCv4=;
        b=Ko2HXvOPbCthnYMKSfo5woiDc8zXBp9QtjayBCa5GCa46yaSWuX4oATgJCB/+SjG5+
         s5gganbTHAYZx2bArRf5cTcPjmToyP631v+QqDX5wrom/9L70/1vkwJ/IvQ+6xe3BJpn
         maFP0aabmglmsc6aeiGE5PYDGg2d62BhoGDJ1Y9i5blklcad+OJlJJBAUpcG+Thn5El2
         Nsmypyqy4FWKfjJBACRS2JiIi+4nBjBhl0BFraub9hzPsAQhjBxN9Iq4EVQIf+LRo5QD
         NU918DXXrcJ4ieoUvbDdvapa7psHBDxwK7Aq5RTBxx3dcpWWeTny/W2zUdL5MOLIj3Eg
         qAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620836; x=1785225636;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VCTZhhsDkQDmv6W2lFgIQm5lul/8HcQoqcagpiQUCv4=;
        b=FIzrAUt2ZCpc+UOI8mFnzr6hps8s0IW5jL3ekss29/uOhD+pyBhRbK7XdTpeeGalgO
         CI70dHO0bH10DihC4dfMB4nKCyvxIBaJQotEuDDhWedbo7SqFmrGpL5fCOhkMGvaR0gx
         UkTwKqPkVgpGTv5N0YqPbHuoJr8QJJTUe6oxWXpRwuv6Nkw2z0eLFCH42CplJz1iW1xV
         dvIxrNsIuV7fSm+9Oahd9R82DS9JgcxAb4793IazalXSKwBNJlikU90tyjflkGXgTREa
         jEY22OoJoUBbFq+IU2yoy2XmcISAnbj6ayf1eEm7QjDRr5pK4HyMHkYVERosXqitd3UP
         l4XA==
X-Forwarded-Encrypted: i=1; AHgh+RqZ9MvrA1eIkjKzlXgZKd7tKsZFbNPRvs9zxQFyXb94z2qG1Sa78CpzeuF2MVxa1CKs98s88EezeEeXLu3bBXpM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn7/UT4G9W1Gz7fKmucLRhORw0Nt5Wr2SpIP0UPMX6ida37dxP
	aTTkbBaW0XN1CMpQgp8/bFeDPkBENgt7BgYooTChCzGojUG3t0m9eg5fUvOqyVD/lY7Nt5LKFIX
	dzMOlPAEZlsbW
X-Gm-Gg: AfdE7cmmhfFKyrne2rVBU2eop5ilsYvh4MiFZKjMGFHd5nB7xFEoM7gaSYuGXBJoIVz
	ZopfrDcrs1xvRWKEgTit7X4hYPE1s3rkYKXIAK0b2fPt9HPE7wkmVmEjF5BXKkZLUtE8v0bxnsk
	zQgvmNmWcdK4syFkLOSbT8H5W80RbuVCwgMxasonTnGyqUPLiTZ7NnWCiZoywwZR97RURqFR839
	hQzo/si8GZ0ig1aVkzYPKPkzeKrkZbunU/QyqOvzJOZKexa9MHBlNdw+p1VBWJswd93l90FDXL6
	r8SCHfODC8u2qUNk6XGrclhmLnV4W9zOkvDrSDTuDnrUhZdEHUOFa1RgjjCdd7d+uCFAFzpS2Zf
	AKOP1C7JHBWpti8M60DZH+I4gYfBPqtJHIU3i/A+DKGwcb/VKE9uMB5rQnZztOUbXLuz8hu4W2W
	Yg7cLexl1FIbIa5AIJGh+ITPP4uCSVn3paknrIXGCPUi4c08VN/zTPJP5a/Qnfst+jqUBkrQ==
X-Received: by 2002:a17:907:d09:b0:c15:e04e:aed4 with SMTP id a640c23a62f3a-c16b47e6906mr747823566b.42.1784620835539;
        Tue, 21 Jul 2026 01:00:35 -0700 (PDT)
Received: from [127.0.0.1] (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1734b1918asm541895566b.43.2026.07.21.01.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:00:35 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 21 Jul 2026 10:00:28 +0200
Subject: [PATCH] dt-bindings: usb: mtu3: Add MT8512
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywqDMBBFf0Vm3YFMSjT0V0oXSRztFEwlDymI/
 960ri4HLufskDkJZ7h1OyTeJMs7NqBLB+Hp4swoY2PQSvdq0IQhuHZhrGsuid2CS7GGdJt6RS9
 xlDijUdQbb4OlgaCp1sSTfP6Z++PkXP2LQ/m54Ti+6Uvzw4gAAAA=
X-Change-ID: 20260721-ccaione-upstream-mt8512-mtu3-binding-50165b8c8171
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_010037_776758_65ED85D0 
X-CRM114-Status: GOOD (  11.35  )
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

The MT8512 USB controller uses the standard MTU3 device MAC and IPPC
register layout and is handled by the generic mediatek,mtu3 driver. Add
the SoC-specific compatible so the controller can be described without a
legacy split node.

For now the only user of this is on the U-Boot side but we want to keep
bindings in sync.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 21fc6bbe954f..42da2c6dfba1 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -29,6 +29,7 @@ properties:
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
           - mediatek,mt8365-mtu3
+          - mediatek,mt8512-mtu3
       - const: mediatek,mtu3
 
   reg:

---
base-commit: b95f03f04d475aa6719d15a636ddf32222d55657
change-id: 20260721-ccaione-upstream-mt8512-mtu3-binding-50165b8c8171

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


