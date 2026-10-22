Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C6760A3808
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l6YNes5N;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EFC69Yt6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=; b=l6YNes5NCKLRCP
	87Xx6VcTTTqHe8TA5+IliBBpGrUhk2ldy8s/FOYm04XUT6qH74+FQgBYfpZoEnpa6xJLknveJeqQS
	PWbAxHpeBiCS40xASHgOVmZTgGogW2GlipAnC66Z3D0WzdPTqSZqyqkLs7Y+tRQl4oTMwzga1hjOa
	885Nh7djV1cEG4LTlhIDZwIK21MY5VUCM6ZsOGOrlqnA3d9ubsVVZnR9ew2gLCX7OCAyPCyV1XyV0
	+QEIaqzZVb1Bqns2HAbYNYtIRqhptqzkDgEmr9CzEW9JnFkXFlX8IrJHkF7bCduIIUyRdQEVWfIHc
	C/LNCp3iaLkneBz6VGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZa-0000000Ei26-2Bap;
	Thu, 22 Oct 2026 18:31:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZT-0000000Ehsn-14qv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so1058815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693881; x=1793298681; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=;
        b=EFC69Yt6k99n/0Da7rTmdRmSPxzraQZBkW4qJx1ws8uangvWgrKCC2yv1SLa1DgO08
         p4T6emOVi1iPrm0+FJS50UcbxwDRrznEi2i8Em3bY3R/wZOqzMA90qYRwqgFHFpP4uxU
         Cr+xJCW6nF+fZTCxoASem8QCy72SKEw4PGbnCUTipJyq9zrtzU6X8yqgsWG026Sz4NNw
         7DidSbg36Dkrwhgt200fzZ/EJ2polpsmR1isBEFSrN62bM7qro0vmTE6A3alcpl9rOXP
         FXym/LdaGaFqmHpc/I0yva8tjK2KUnPXyAH3az5QXLUi0RTyQ25c4tbkfT/hcrecbEqI
         OM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693881; x=1793298681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=;
        b=XuEkN9MbhESXe7XOZCSTAttO893o7TA7h0AW+7duek5wzD54FlvOvjAWREQDBZSAqq
         jWDcPGF8MQK0NTT6gJbhsQisKxO3fGI/gsp/eKZyDxpSa+DMLuzQKs04wf3zVPSD4N1c
         vQhTobvNTZox6LYTuiw89iVb8cEdqRgeh9uGDxvoBoE2Np/HohoJqecDrL9kdRwM+NqY
         jWzzXwiZr2L90sLU0nECHYX9vTU2sQwHgFPWBbfoA5AMpvcBB82wXQrXhBTAZfPDSOIZ
         Yh2wG2nXwkwPk3cNTS44sN0lF7xxZ1UQ7169bPNhtK3jvOgvH5fL+ojzAaZYw0ePiTKI
         zEUg==
X-Gm-Message-State: AFq9FYLm/lQF9nZzcnXJvEU4oSoZr5Lng2dhZRwq5ES2dbPlXqTSx5+B
	M19B5gpKUOq+zy1X1MBm0uJBep5vcHpxwJPlCIku438mBnbWVdcQSSuqfsNE2XmFULo=
X-Gm-Gg: AYBFou15JJteYry75/EMAgdTMJVI2tfheOzSycS6iFpULMHhjFTS07FjKGIXdlr9eOP
	rQf60Tiz8Aud1bYEPopiCFhAvqFq8Pd7mOBbwGQUpBc3GiXESWbiOwpJyH3mWwepAjEEzSNt65k
	ZzJ2IWvzUvCqZ8w1lvKaGYMgAyKN0lnZM/Zb7cEr9qWyLFhfM/+96z1E+7lcb6RflptjtcEhZ/+
	83c5CvE37GHSbEg/WrPC++GXRNiS3HMH88L09VuOgG4md/NwyeraTongNEci8pH4yAQc5/j23BC
	fNSuuLgEZNzk3kHG3UZ4PxLqtOi+slRQlPWI2h9xt1MTmfvvwzxbwyghrtp5v+H5EPz3G5/TOh4
	/GY1MLjPqd488aQE3WTjSgbKubQ/fLCcFiGZCpnj5uf24baFiBZHZjw8RlMmvV8V8ITdaL3XBVO
	BoDwYCsD7/nl6rV2l4kNQtb2kGuDLOs2zXJYn3eQ37gFvIvgprl0Uv/zR8kGFB4oB+HflnEWxzQ
	pUXJ8fGWCdeynrkDdOiC9wAV4ddn4iaJ+9XYeVLTQ7L2ewOB9HuV+z/WC/AdWxzqgibd0mo6whF
	SyFeDtX19y9uTx8gw+Ntk7yznlnR1CIeAEiv4k3m6w==
X-Received: by 2002:a05:600c:540f:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4a1fd8cde00mr114350305e9.4.1792693881668;
        Thu, 22 Oct 2026 11:31:21 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:21 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:30 +0200
Subject: [PATCH 4/4] arm64: dts: amlogic: s7d: describe the GIC
 virtualization regions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-4-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_113123_323744_CD95394E 
X-CRM114-Status: GOOD (  12.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7D device tree describes the distributor and the CPU interface of
the GIC-400, but not its virtual interface control (GICH) and virtual
CPU interface (GICV) regions. Without them the GIC driver does not hand
the GIC over to KVM, which then runs without the in-kernel vGIC.

Describe both regions at their GIC-400 offsets, as S4 does for its
GIC-400 at the same address.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 059a1bf37584..b77ac8898d16 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -85,7 +85,9 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x2000>;
+			      <0x0 0xfff02000 0 0x2000>,
+			      <0x0 0xfff04000 0 0x2000>,
+			      <0x0 0xfff06000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0


