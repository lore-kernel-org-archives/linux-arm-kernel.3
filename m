Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77852F41808
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNOZBfqr2lnHP3ETayFOjn/FEBqearsn/ED3lU7TMb8=; b=DrCtBQ/ST1uUmjNxYSo+uA0yxt
	UUMysEmOCM7xYavKnEZlO4YAaPIWotZwngT21W2NNVkoNArBOdQcROFwAPfF+ll1MUZ3NLryjlgc+
	pVUbOXzNfS3UBePaAkkixN+5x5dqaR/PPSa1AhgaP2ZWkqJK7ejXPg51q8TdjQ7ccHby7cHe9wZ8n
	34ZbFFG6aA1iFa9hoCiwqJ5JuvHC1F+dNktPIVenRZHcrT6AVvCX+iLigpzQ04VS1yG3eQ6mIHD5m
	x31xuUrADQNJQQcIhUZCoxdqf5WK7X9z16jRQTneUSSKDCA3Qb8u7HxTEUEuxZl3r/uVv6LPqHOTN
	vsbvtnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztiq-000000098Af-3DES;
	Tue, 10 Mar 2026 09:49:52 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztip-0000000989l-00S1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:49:52 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c738fecf349so1809434a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773136190; x=1773740990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNOZBfqr2lnHP3ETayFOjn/FEBqearsn/ED3lU7TMb8=;
        b=DE4gkW6xfhVHcfDOAnmFamOGwdsRRcZQGBURa5k3wqkdZ2hyY+eS/vo5mR7CjXLXdJ
         4IwINOhYDekUw6i7wP6iC0xQrzpR7UEelBS7sTxVZ0CllH32eRKeWSB5DkC6bWaEHRXy
         DlumV6MyjuGLHqV2AAkZ8TEvOT3S/rnM2Hiyup8pE1oCoCwqDo3L4C64kgTi2+NvgQhS
         FAI56Z+YRV3GindTVEa/S5vy7WZkl4fpjeIAmERcvFLRMKin9TAgZlmxatoWIgk8M3uB
         g06cKpw6o+1LIS3ZfaoPnhesg5eLnjviBou/2rE+iElY3DUdEQN+lY1/hBsnHr0E/bg2
         G1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136190; x=1773740990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MNOZBfqr2lnHP3ETayFOjn/FEBqearsn/ED3lU7TMb8=;
        b=fxcPNZyw3irzMhEJMKR1l6aMzUboDItSqd3+1IxRHb/snG/Xqynfw+mF95GrxJbaTX
         CJjAholAw3x3IZuDULCNHgapXmG69Sh6wVizZSL38CwzF9Lm74+0hl/312cXstHx5x1Y
         M370FFxC3Md0Smkx56upWRuUzVuKrl36o+FbsLsZ4nJeuIeo0d7VsiCq0UqoK3mC3dvN
         KW44aCJ2iiBcZqLslkjE2ZCzUarxaMtb8cYZl9iae2y98Bz2Aru6+miJ8ly+PEkLeLWs
         2GJBY9sl0QauBb+kxHafB5Coc06smX49d8/UDPig2wwOtORDo0Q+rrvCThnCjwgklVfU
         pP7g==
X-Forwarded-Encrypted: i=1; AJvYcCXAZTA4Jy/3Oib5/2Vm3qQgFH6rdwcQ+o1W7HyNdXOu2zKYcDrnp8j6PoM2IaRtKW41RoGzCv/Hr1pIHTtd1S7b@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4TYENK4k6tQ25W40SjTgDR0vLufyyjtgJlNcsr283gIfaDO/i
	X4MO0YcwabrxipE/jejp8k7MPpfCikabwJpGYTkpEKfqbowU/U/1f1p4
X-Gm-Gg: ATEYQzwkpkClfXNgT6nuH5kh0cTjRXAaY7tADGUs4Pg56MwAiz+Ngq9zd5RaM8QMCuR
	aijkXjryrZQDRqKam4782ADYkb7wiYKbdRLRuBYkFONhlqCFGHhxtrwsIifteTgpVAsSi27F3mZ
	1z82VBWIEDSTK4XtJyUmr4u9oQXL9kDWUPbbldP7tuABAakE+2WVsFU3u+ImkhU0Y3jULlFZnB5
	oPd6JQCKmGUjqOFmIUnidWICyIMKCLcDLRl70lNdnTIpuLCB5QclpZMy4NFuxwoilDmAmQCi4VF
	8BUaPxVl4KXeTmQWho8Q4ND4XwLENc3ZvVA25Moo8emITFkQAgcYt8w40Vyq2QIfJ2TATbMi4Nu
	9GvWZ4XNe/u6/wPCoyV6aFJC8oG2+V/WIK7QideEjeWFJBfB1ly8AvKcMteW+LtNxR//LgyMv2b
	STqyt14FYTnz526Y3x9ajbudeVcD088g==
X-Received: by 2002:a17:903:4b4b:b0:2ae:4aa8:cab8 with SMTP id d9443c01a7336-2aea1cc7a8cmr26099295ad.4.1773136190120;
        Tue, 10 Mar 2026 02:49:50 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8a67esm199459775ad.61.2026.03.10.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:49:49 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 10 Mar 2026 17:49:35 +0800
Subject: [PATCH v3 1/3] ARM: dts: aspeed: anacapa: fix SGPIOM0 GPIO line
 naming for RMC leak detect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-anacapa-dts-sgpio-v3-1-12d9b7f1202e@gmail.com>
References: <20260310-anacapa-dts-sgpio-v3-0-12d9b7f1202e@gmail.com>
In-Reply-To: <20260310-anacapa-dts-sgpio-v3-0-12d9b7f1202e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Colin.Huang2@amd.com, Carl.Lee@amd.com, Peter.Shen@amd.com, 
 Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773136185; l=1183;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=rM1a3/U5nmwGlIwi6wEffz8sWYF1jFlqAjBK8RCzM+c=;
 b=/SkyG/rI3p32n0sdU9i9f/wiBX7Kg0j7iOXHEq5CkGxm3tJbqZMGUeyODhM18MHMcvQlMumuj
 xH1TzkeymrGBPmYnlXV/UAu8KCqMPPDrerCRNXkWJk0iogVaIO0fM6f
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_024951_053951_04AA2B76 
X-CRM114-Status: GOOD (  12.73  )
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

The SGPIOM0 GPIO line naming is adjusted to correctly reflect the
RMC leak detection signal position.

Move "LEAK_DETECT_RMC_N" to the correct GPIO index and clear the
previous reserved placeholder entries to maintain proper alignment
with the hardware GPIO mapping.

This change only updates the GPIO line labels and does not affect
the electrical configuration or GPIO functionality.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..3e297abc5ba4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -880,9 +880,9 @@ &sgpiom0 {
 	"Channel7_leakage_EAM2", "",
 
 	/* C0-C7 line 32-47 */
-	"RSVD_RMC_GPIO3", "", "", "",
+	"RSVD_RMC_GPIO3", "", "LEAK_DETECT_RMC_N", "",
+	"", "", "", "",
 	"", "", "", "",
-	"LEAK_DETECT_RMC_N", "", "", "",
 	"", "", "", "",
 
 	/* D0-D7 line 48-63 */

-- 
2.34.1


