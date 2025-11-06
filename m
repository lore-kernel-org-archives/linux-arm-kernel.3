Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E98DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGmeAD+s54GN07CXVStO6BNg5fZaJA+7jizpGW7KNys=; b=wmQ+THXuivmea0sKiyf0iV3mja
	aJwoSc7bZWz+4+oczwoi0FZr5xKhk02RZ0RP8lPjOfq8d0X9UEKuR6/iYfdeJcNEdUyR38Uj6qoLz
	wo6tTA2aQqDuZilUc2FAIbe9m6ohSqQs131r5uH1ljvhEywicjvFAZ7TJ7nXPY2pR1UuTxp+xkCCV
	YZ65URai7QPM+pdgRE+VPL8F2lriwUAdsr9Uam7x46o0SeEMXv/N1i08E/DZZWJkKUqhhVY3UGpkQ
	zuA3nNQszwWTbWVKG8nP9vg7E0mC2iyFn3j2xF16lvnbwqXOuL73r2f1ktVoWGsqrWoADOlJcCuFm
	19RzKD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2uH-0000000Fvz7-1chZ;
	Thu, 06 Nov 2025 16:32:17 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2uB-0000000Fvsc-40Rt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:32:13 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64106cfa518so207317a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762446730; x=1763051530; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGmeAD+s54GN07CXVStO6BNg5fZaJA+7jizpGW7KNys=;
        b=ONK8O1q7VkHvOveFiUSydow59KLi0Y1X94ypubo2ccQNRd10eQdRqwaXY8+pBzv1rW
         g8kUtL/8gpfq/rmF3Lyk7iQQRwUnE+G+EzfewTx0FjGm+8Dz1iDqA1XoTWmnGV8GoZ/4
         xqdxbhtEZJm5SXv6py3odKQ+bG0UGaKeo1w3LTLmqzfaD6LEoYchdsOhnuPleFTNrULI
         /OIrTDLW2HdNNAarPsDLBZayIsz+j4EZzdSHF9fcH1S0jbK4h7lhRA9PKFXLllA26j3y
         J7JywTJa1dSW5tla+arP+g3TJ4cQwL+jZlA0c0nA94XcxZcqcCVLvNNtT+frfb+jU2ZT
         Gg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446730; x=1763051530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGmeAD+s54GN07CXVStO6BNg5fZaJA+7jizpGW7KNys=;
        b=th1xMDtW0AfMHh6MWK1knPCqauVH2IZDM/LcfPI2PtY7/TdO/LpDxrGFrR4p6/0KI3
         pIPlf8QlC31WZxtiTuE6/fdCpd18ZroNJ02M3xjrmHm5kCFY+uhLtqkSU5XavNe9n6r0
         e+ZSisD3RqALToXzSRpjpHLZkWx5bIkXWa5Cgs4YU5T3HBDUIEzu9wkeuK2ZPK9AyBsI
         FvUxXxH99wQc0tjCJVUwDpW9BSKi3zJEEHiwq0bNLi++z5hfcWhJhtypbzn1TGFVDAxg
         xrzuZms2lcMnvz5fv7f2jGUuzu4ac8IaZ7nP7qC/6/MUxbTKNkKMYuMZzp1OnGNHwnZW
         jzjg==
X-Forwarded-Encrypted: i=1; AJvYcCV+nzvn2Bu/VuK/eqqOiBzFNg+gFkjdVBY2gy+lEk/f1fbmf3LXsLEFDEJuW03rMB8AaEovfVloSvjM6nsZsJUS@lists.infradead.org
X-Gm-Message-State: AOJu0YzlEpza4U/c7mm4EO+ih1r/9SGoBPMI794HxuA14Z9yB5CvMNnS
	m66+il8jPA5PlK8fL7sxVrkBwjyBpynYemxR2RKHWvTSKSYNqK7wWhKv+h9iGOrUFms=
X-Gm-Gg: ASbGncv8pysZ1zs3tohwpAr5QxepFeaQFYOi2hjDU90Icz9b6M2+jIf59bwXOtkcKzg
	OxYmFVEA1vtRVl0KEtLxFe7ru9vJ/F+eXhG6zTONWGtbZaSP0JcDwHMyufEgOoCS+F/ZgBg3Op0
	tcQQjJk7RdzPzoCvgXSkBsKFIBd8bkmSuq1T2Mch1T6OpzNL/ui6u1GIHh2qPpTqNOVqGmTlsJ2
	L/OWiSKkPQQNIunXsG8G5McOSDDpINwUSE1ybjGngp5i/hUPNwCLGKYXue0ZnJC4JnWXAltEX1Y
	kxNxMetT1YouUBifzBE7gzaGh5hCdiLK1yIxT+3FELQTBDb0/9l79j3Q9iMNQlZA2h7dazLh7uY
	N8GH+H3WS7BD4TYZhCPs9e5lElO17kq56QsKsCO4wMxyX+MhR+yLoW9ymzEwaQR97lksstCLq84
	ss7Qufy/9idAgVyQo/
X-Google-Smtp-Source: AGHT+IGZs2swuOBj8gaR/OaDywMJNFP+fOLD+tbBh6Eq0osdyg8SSOyQ8RqjagdO3Qncnx1PxLOCmA==
X-Received: by 2002:a17:907:3f8e:b0:b45:a84e:8b69 with SMTP id a640c23a62f3a-b72654e3240mr428405766b.5.1762446729945;
        Thu, 06 Nov 2025 08:32:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289682544sm249625566b.53.2025.11.06.08.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:32:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:31:56 +0100
Subject: [PATCH 4/6] crypto: ccp - Constify 'dev_vdata' member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-crypto-of-match-v1-4-36b26cd35cff@linaro.org>
References: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
In-Reply-To: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
 Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@axis.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kMWfmj/ptzyaxsCFocF8hhBseEl2zvCJsZs+GsRu/Qk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDM1+eyCUkPULdaZ1GEkFUKEjOTPXhaUshCW+v
 bDMaEMH9XOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzNfgAKCRDBN2bmhouD
 18ATD/wOYnNM20X+EDtAZHZw28Ys+I/iX3FL+93RIP8Z1O36NFU0Pdnc1IaBpbIwpxB8DBEAFwL
 FVz7cxaRtVlvQm00WJYDzgtPUMnwtIy+oXsEg3Pn1PM5FLnR/RH75aJZQ5BzSrfujqt5KeFviO8
 7/po64dd8V9hsONfkT94WJxIKpc+B0wiAEQD41bFCVEGX74OBm0KgS46EGrPrkwCnvbe+zzKART
 6NMwNJXdR3C12R3Qyo0NvGU04v8hnz4r7pi9ukcrEfMIKG1WFxjwQysV3oxb4RIempXL2ij42NR
 T9wXQx1xWttCcvG0TTkaAJJUQsBB1qg0fWDWcL0kyZLWnAiqgo7kMhqdrViytj7ycapPBWlTpsl
 M+ihpiqyJV+W8RetM3K094JyPOELAnv0+Vf7yGKL9rvU3NkPmBC0OHy18SBKKSqSYNWSWdHQPEy
 by9w/XTEH+JhBPeWFtAcr7xptyC+QlSi0n2K3Bm/VTlVayo+dz6ul45SAyu6qkXPvqk61qwidy4
 5q9esGuJZhUn7k+BTNdRXUOk/PKs01CNGk933A21cxOvD/Y+LZ48WpLihyQyKDZRzvzHe6qGeCE
 uc3ctHLkBUz68GDOAitauO0S5aGCbz81dMOuATOamOeEgghsKNBCvPoaIFiB5hsuUtHEh7VueGC
 ekT0FmK9VnPvTrg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083212_077918_FA859010 
X-CRM114-Status: GOOD (  14.88  )
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

sp_device->dev_vdata points to only const data (see 'static const struct
sp_dev_vdata dev_vdata'), so can be made pointer to const for code
safety.

Update also sp_get_acpi_version() function which returns this pointer to
'pointer to const' for code readability, even though it is not needed.

On the other hand, do not touch similar function sp_get_of_version()
because it will be immediately removed in next patches.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/crypto/ccp/sp-dev.h      | 2 +-
 drivers/crypto/ccp/sp-platform.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/ccp/sp-dev.h b/drivers/crypto/ccp/sp-dev.h
index 6f9d7063257d..1335a83fe052 100644
--- a/drivers/crypto/ccp/sp-dev.h
+++ b/drivers/crypto/ccp/sp-dev.h
@@ -95,7 +95,7 @@ struct sp_device {
 
 	struct device *dev;
 
-	struct sp_dev_vdata *dev_vdata;
+	const struct sp_dev_vdata *dev_vdata;
 	unsigned int ord;
 	char name[SP_MAX_NAME_LEN];
 
diff --git a/drivers/crypto/ccp/sp-platform.c b/drivers/crypto/ccp/sp-platform.c
index 3933cac1694d..de8a8183efdb 100644
--- a/drivers/crypto/ccp/sp-platform.c
+++ b/drivers/crypto/ccp/sp-platform.c
@@ -63,13 +63,13 @@ static struct sp_dev_vdata *sp_get_of_version(struct platform_device *pdev)
 	return NULL;
 }
 
-static struct sp_dev_vdata *sp_get_acpi_version(struct platform_device *pdev)
+static const struct sp_dev_vdata *sp_get_acpi_version(struct platform_device *pdev)
 {
 	const struct acpi_device_id *match;
 
 	match = acpi_match_device(sp_acpi_match, &pdev->dev);
 	if (match && match->driver_data)
-		return (struct sp_dev_vdata *)match->driver_data;
+		return (const struct sp_dev_vdata *)match->driver_data;
 
 	return NULL;
 }

-- 
2.48.1


