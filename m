Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5658DCC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QK4mu7evKVOV2GEU9FhgXywXMUX46qDQRJW8ekwQ4SQ=; b=oTnLYHUZwHMwxO5Bfl4GzfKysv
	42gfly+C9guIHYMb95yFhTLL/UuuXDP9+A8EP8vntwp+CI4Wn+t6UCeIL2u6cvrD106tIhEqGkfCJ
	RR8lObmgQhSe1vwKn47heQ4hRXS9G0Gn4Brdwe2LhSzZwctL7YIBg1/MMkZDw7QxF7WZpvKg7i52e
	2JwwmEc2f7c11s3RTCQPTmPYcSrLeg6bZKbQuqqX1JQYbrjMSgSdXYhpUunxHmv90RcqSx8A/Voss
	hq1IBXAjpff8wODx2oIfbSHuOGecJ1OlMidhNKPINlVzoCfHxPiZeV62qamVyiF+iao/hlox8zGKE
	dstj9Tyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuNn-0000000EtXQ-0lx4;
	Wed, 14 Oct 2026 08:30:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuNi-0000000EtV8-0tNF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 08:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QK4mu7evKVOV2GEU9FhgXywXMUX46qDQRJW8ekwQ4SQ=; b=GWEGfslLybUc2fySHhw1FiyYDL
	HqfBlNPyn9Od7bQMmpE2K8ndIIwxdyRW4Dnqzu1OOdN5lPYVBevXNvWOKAq1S47sGnxKtNl0mROBM
	JECQAJvzP7Cyki/Wt6nHUYh0WC68iS5QkUeUOGBQ7MJgxDA7OklX/ezOtxM8FR8kkJCcmmda3dbYC
	/Di7A/eFF8LbPF8qw0v1yp4RCCiBwlxmRy7TbFXjqt5eFH6SG8AooMtoyScUbqNSpHkJ1qZXtJAM0
	96Sf7wnKq+Wm9/K/UkpT1q1+jYtcTRmCHgLtkwFC/xExhVv8OY/FP5ZZO2BB1FdXwpIeBz0unbTD9
	r9HKQSkA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGuNf-0000000GVK0-1N52
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 08:30:36 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4086535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 01:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966633; x=1792571433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK4mu7evKVOV2GEU9FhgXywXMUX46qDQRJW8ekwQ4SQ=;
        b=VZxHndZVlU9zRBEhrBmeVgTCUpJPBxxGtPm514nKc7Njnynj42+LZSK8Achw1bqGsD
         DkcbqpBX1ojAJ/dveOCUBYbWsqDnzwQtrvcvo2jfV2XDaxfaUIvYOkyhZYBxqwWcKK5W
         GAUI5Z6yQvSYh2c5h2JE1Nvpm0maM+fl/RPh+ef5QWpu9YfnYytegxayYHk03u8wm9xO
         kN6TFdWZPMxConqa2kGEgmj5JiqR8e96usTV4Ky3ib1d+r7u5lScW+k7qccquNlA9AFJ
         9W/dXD0kpS6cap0MKFhR5gAJNo7GTYVlVgE5jLTQ5cysz+N9LF+gN/mL8Sq80KQV/V2T
         ZbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966633; x=1792571433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QK4mu7evKVOV2GEU9FhgXywXMUX46qDQRJW8ekwQ4SQ=;
        b=tuAPAzgdRxFOuDbizazIroXjJCJtWpzGHiWXolMP4WHTj8/TARS8fC1wVGJHeRyad6
         wdz7TP5ep+W7zQSXzJfpy7VkZDAln0ofX6wEe64Ao72HUocu86AQL7YNOc15QlNRfxwm
         CyQmNlTV11BMiqNvQqRcw2VID+rndB8Blxkd4JCS2GzzACpcR2Zi+PD1bF4/dL7ULL0V
         /Me0fLk5CvB8DN8XRr8L1D9KDUsksHRTHr5/rgPjFBMOgDxklcA5Epxf3+kljAsMCrHO
         wps+EpaV0Abdvtrj0Oavh8d70aFqWKtAjevSZpC+kcUPYzyqQVYh0Sb+g9Ex7CsCDNAW
         nSyA==
X-Forwarded-Encrypted: i=1; AKwUvBxuUTJPQsjhaUThQB33XT5JwTRzhKEoEyth9ml43y9+TYn7QLsCaWctWYaFlp3brU70nFltgenVisFcjfnqzD20@lists.infradead.org
X-Gm-Message-State: AFq9FYKuofc5HUYfbDNSbDktV4A39KkoNMml7H+tyzYqoTE5EqBnqWAt
	STRtQzCLfG7KudaYw7yiYuqEDCOpZPmjQZyMoSBdHPjTeikYnXAnkk5G
X-Gm-Gg: AYBFou0YwruU0mLrThp029eHQTg0X3jnEUdrGwljfep95vbgPLnd1rM8WHXovSem+ul
	XrJKJawf7s412em5ZWiCOfdG52Y49DE9uJmRz4KtnVH/NKb0ApP0MHOI7MDpus8uYD0Hl9Dcgxn
	wzNGOhLkbpX3K4KgPjwf1rJ78G+8fJ9vQPD3IKDfJJKdVGMcEM4KybC4jZZB75SbrpeX5h+mTgI
	YJviiOQzAsdbfXlIBuClepsCdBYE3Iz4g4HXIs1RkNpjGMD9uOXQv1aTFL5z+OvVOosr+6bMj87
	0eC9DlN9Dw+1E7uUf9feGmsSejKw2kgMOWxKq5WcPNnnt6no9+1qBpObEqOsPCKV1WAr0973DMp
	+qfeWqKp2u2hnmtOdnCoJIO8HpAWZnYxdffhhKq+EdvICl/XLIRmgFWT2STdolTOcckhiYwqSNG
	JrMFKCJVdR6sHVXtVTM9lNICoC0bAyYeX29V2YkP2VMe3mz9zbBt8aR6bF0WpLMt2k1LKcO6jkc
	/lGnXRX5ksf0JxFu5QVAgo/2CP8xmkPOkLyewqivZ0cDw==
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr334974655e9.17.1791966632877;
        Wed, 14 Oct 2026 01:30:32 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm431809745e9.15.2026.10.14.01.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:30:31 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
Date: Wed, 14 Oct 2026 10:30:14 +0200
Message-ID: <20261014083016.332338-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014083016.332338-1-sander.speetjens@gmail.com>
References: <20261014083016.332338-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_093035_475878_97EA9F3D 
X-CRM114-Status: GOOD (  11.32  )
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

The trickle-voltage-millivolt property had no associated type.
-millivolt is not a default property unit suffix, so the schema does
not automatically infer uint32. Explicitly reference the uint32
definition so the type is correctly declared.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V10 -> V11: No changes

V9 -> V10: No changes

 Documentation/devicetree/bindings/rtc/rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index efb66df82782..e46d50b1063e 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -51,6 +51,7 @@ properties:
       if trickle charger should be enabled.
 
   trickle-voltage-millivolt:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Selected voltage for trickle charger. Should be given
       if trickle charger should be enabled and the trickle voltage is different
-- 
2.56.0


