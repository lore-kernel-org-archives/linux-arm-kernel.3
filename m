Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9441BCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=; b=qHjJkgVov2BHLHQDR6exI8Jcb2
	Od283wAoBTUxLSLT1VSqGWXTV/V9eGxVAkfwlKaaVV58vMhBx6oILqKJ2A/lb5rTeTjI02x+7ouDc
	km2i5dtfTk6cIDOw+++y7wU5AlvWlO8fyu6sB9ScYpkmildvC7ecMlbIqZxCittfdWO9V2VPqoZTK
	qHTxsNj2adi50yPLzskvwbkoaDpXh3CrcSbPNd6b/d3Gwanz6O1QuxYC3q+9nXipnvrE3KS0xaIEy
	hrcGJwapVLSENuz3vPD9+bZN1a4jPuCwckWzvZkn0P2TeXzhikJW/Y+5zHWVTTJoeA2aSjJ3vGYnF
	SKtbTCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEzo-000000017gG-2FSd;
	Mon, 28 Sep 2026 17:18:32 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEzl-000000017eP-44ca
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:18:31 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f91so1947518f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615908; x=1791220708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=;
        b=7j9Oz+gNSiNz3sPWG8G/U3WtAPIp2F18F40sZYbiGWyWPq2MEbU5C8JNxH+pLUVcy4
         9d5zdhhNS6emAkBKCzCIZUHk4V5+lNQ4aOhYi4uH9SqfawoeaheiZmSIcRz3W+oMRhKA
         GNgFzVGaZW6G5Y9gudklvXkS/ZlGufNBssuWrvi3iNd2urMzSOarrCFhaUhmYQJUVL5n
         KD/mUxibop1Sl1nTS43aYxi3beAFKs7F1hywll5KAR6uCUG1WVbK2UmBCMyWhi2pCIy+
         AM3x8r/Z0RrQAOzy4MtzVvMFx2zNVvVihoV8KIpFNeiLLophBdCOW9wAeBM2kvXOrb1j
         rTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615908; x=1791220708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=;
        b=1gPLqJNBl1JCRKIgWYtfHzzPjdp/DIdCvN3nA3x+hE485qUnS0zT7sn41Zplvx4M+S
         ubnKI1Zx3s+yvYFM9W5/6SIq9ZQsK78wAXzwNf0Y+aHgGwnAbu9EvvzEvek4EBjQOinZ
         5i69iWnd+6XN3VK5bCnobQNGjvOoYIUsI+2wC3IhT5OWZTvDICjX6EfQJi8KRN5y+y35
         /0A3bES7+Y97LocxHMjU4CO+JbeaOZNNp9RBVCdu8q7vkvG9gzua2eZC94TXUAijTlaA
         /7EXijuCRU5N74+iL/7jL4Hz5LmIpp7WxOXKso6uCHnq5Lr7ONnGmGLUI6oXwsqXdREb
         qtYw==
X-Forwarded-Encrypted: i=1; AKwUvBw8UXFTvScna6zj3uhgqSDm7NOxS6O3Vik3V7dHTFx6UbOt/n7z142ZiOUvFeJIw4SpyocoRAbk05h6m0j8c//7@lists.infradead.org
X-Gm-Message-State: AFq9FYKG2fq1MyymwIQ+nJwI01OPKyYzXr/q33iFP810btiftQPJ6SoQ
	hAZYrAY/hhX7D39TpEEkExo6MN4doo7B9blZeMETIaXV/FFgmSHqXiaRwntcvFP8oFw=
X-Gm-Gg: AYBFou2Loin1eu9ozaOg/LI6S3ibsjHIPz8JmdK4+EnFpOvp+X4xJzmdK4rDqauxTkS
	B9vFf+db9WxoL5J8M+gSAF/fpXHI4Vl210VTNDMfybXJ4hR/OYQw4HEKnAMB7hGIOBcUwImQRq2
	HJ7Q2HUmUIayLyCyiCgwJRO1dMmGU0Wiq/awENuq5jvmauO5mUnSs8SdlythIh136+AlXclmDpX
	RTGTpE4BAVD9GQekEdDYCg/b6RmgY10bZd7WN7rkf72i7w0UlVe7K2wHVClYgrEm84p6pO0dcil
	0Q4vMq3f4FzFxDbc7jk53tJMBXIA6ppHCXHIJYe8moGzeM40xc0bW3qPDXA5XU59PXn+h8oH4DE
	Was2en11Q3GNLRPOd7Wzu9WdNblowcN36iOAP7fH8hQa+7hSjVx6vYCaDyPSfrHwKTF02YpDpuH
	8oiSSZb9TiNW3L2FJ8GQui+Jvf1xwSG8WGRK1TDWJE9ksWEWV5b+qVr776h1VM5td75Ng7PTLag
	gsdiXttZq1ZgPjr
X-Received: by 2002:a05:6000:26d1:b0:487:8ec:1fc with SMTP id ffacd0b85a97d-4887d9fa635mr17537803f8f.12.1790615907966;
        Mon, 28 Sep 2026 10:18:27 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:27 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 28 Sep 2026 21:18:16 +0400
Subject: [PATCH 1/5] dt-bindings: soc: rockchip: add boot ROM download boot
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-1-65486b03bd41@flipper.net>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Ft5tajPF6rdyfGUW0BWFsN32iOQqo1FkzC57Z7wFY/o=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtWhinbsfiONvyQIzZot5TwS3higezco2yr3Y+ue/Im
 qdTHiTRMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQvPszIMPeP8YnEGdl7fWbffyh22kmaO+DChdIL7v/lLwuETZ7gJcjIsEP5a52
 61MqViz6WrbnX73rg+jPHWLOd3r+SdU5Y/X5wmR8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_101830_032550_7F142DA8 
X-CRM114-Status: GOOD (  11.45  )
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

Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
when they find 0xef08a53c in the register they take the boot mode from.
Add the magic under the name U-Boot already uses for it, so that boards
able to request it can do so symbolically.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 include/dt-bindings/soc/rockchip,boot-mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/soc/rockchip,boot-mode.h b/include/dt-bindings/soc/rockchip,boot-mode.h
index 4b0914c0989d..88684f4184df 100644
--- a/include/dt-bindings/soc/rockchip,boot-mode.h
+++ b/include/dt-bindings/soc/rockchip,boot-mode.h
@@ -12,5 +12,7 @@
 #define BOOT_RECOVERY		(REBOOT_FLAG + 3)
  /* enter fastboot mode */
 #define BOOT_FASTBOOT		(REBOOT_FLAG + 9)
+/* enter boot ROM usb download (maskrom) mode */
+#define BOOT_BROM_DOWNLOAD	0xEF08A53C
 
 #endif

-- 
2.55.0


