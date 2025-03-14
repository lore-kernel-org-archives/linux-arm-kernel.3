Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470C4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQ99iJ98td/B0zL57VABB7szu0CnieeOt84tDi+jGkE=; b=XPu+qeFEWQUKM/sbRWqJzSmgdg
	uXOKsLfPyjTOWwIo7c7praKpp2oIPNuCqPhzc/wIBOOFJjVhUHzrMFAxlO3WpeOK04Cr0DZm2UBIU
	YBfITB3NBPNopevH98tT0W1p5p0QhJFTO3r3MnndXxW55FbCKsZhV0Yb/A0K+tb73NKxHxqWnL2Nb
	LBycJhqxbqw22pAVaDAK23v9k+CsHJhMFcYfbpdIoIsDucaPswtKQPnJD+g0wbYhwpd6jFXB2dTWQ
	EmSwSaPRTURNhkKDxKruvpt4YQ//Ch63qnKqUSstR8KgN3BdmPFtYW5fazHxQqW28IdDu5E7SnfZR
	N+Xy6mTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7BJ-0000000EbfP-1kMo;
	Fri, 14 Mar 2025 15:42:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt773-0000000Eavc-3aIU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:38:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4394a823036so21608605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741966696; x=1742571496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ99iJ98td/B0zL57VABB7szu0CnieeOt84tDi+jGkE=;
        b=P2AbwYkVVgOPWcZMYZhlncCt0HKS7GMyTA9DZyeTnabaYeEHznw3VwioNYca44i/X1
         deuube43WHPgaYv2YN/zmTseyuhehr+M9IYpwlZpDQXa1m4Hh4EAp7pgPxkBGCPvo+Pr
         UJVPhO5bDO9dwCOpX3VmP4DbcXpQGS9/3slbHE5OaMIe1QwUIHHSRC8YlOMOc6DhvMGg
         rjVCoTh3QH+y5ublypOdlgthaYCCz/apb0sJkvj2CB+tz0j7I1XVYsUuNYu0pbempDdO
         9twfjz4u5YwgnkfmkYEgJ4dxYBWfiEK/dNtsHTOOWeBJnhJKh9rVAcXNwS9apyZG/wQA
         1F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966696; x=1742571496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQ99iJ98td/B0zL57VABB7szu0CnieeOt84tDi+jGkE=;
        b=eRUtWy2j9PpZfOyY4wWvHISZGSjPwtaLzvHauPEvr7SpDsmIjJ9fWoqDtLbJ6zrtVH
         ErpXYFzayR4aIbAQ51UsCueGGLDWCuN6XhWWW/4kOZUqnrdLqxD0HiAL3O6uGg3v5G6a
         b36/emtt3EzHhHOwfn144TPsGPLEsHBgZqeKmZe7149KmlGH7gX6ZqA5kn+MwzIR6cnw
         jtxvjiidu9F6Z3OyeqbJgdKAvbWHZLBQ59bKJuCpJXbOEG2l0GqNQDugI4VIFda6HG39
         9+6dK2lnQC1niOJLfJQix8SXCDj+ftTlv+ZvtiQ5TboDD0figY0OBrqoTRy3jKb2mz5s
         7kNw==
X-Forwarded-Encrypted: i=1; AJvYcCUYn4Nb6n9T6v0D5/UjIgL6wYo2FhEgi6KCyIrJzbBDxWUblzeHY0ZyGB8jV5EMHr8Dwp9D2hLiE4Qu5zbQtxwL@lists.infradead.org
X-Gm-Message-State: AOJu0YyhkUBIu0tb2MzBHT9hiPvTL2uGiQZIirM3gFTVHi/b0cCCSgB/
	7zWqXlrscHevRfYQAw9sBVkrNP873DpuEVpsODJ+C2J2xDck8MEMSdVwJugAYJE=
X-Gm-Gg: ASbGncvli+a65sDKOWho8WGtSvSMuAIYZLePH9fH133tJTBwYGph9ibSoAdnNCDPdW+
	UQY0pQ7XmZJEA9Lz5PrW0FyqAAP6DfoBssLiMkfZ7yRlJHWb37z5O7W1Vcyg3Cib5dghf+iwaUy
	5C9fC1gSeYag0YK1HWru+2i6sHDElh/hP1CERnYQKqkcQ2/ENetvJajzpSzWtWWGyp5kiF9pr1s
	KD8WCdnsgM8OhXt8OrufBIcBeiW7G4BATaoBgUzGLt07US/vn/WRMHOY83IhJcdxnOA2p4yvZOZ
	9bBqbRiaiRShxIX/iVE4IGp09oaBzV7E473Xhu7sZYEqGALoTxxK3mffbzUyCImA5+1SHc6tKP9
	smXBzt4FdDtI=
X-Google-Smtp-Source: AGHT+IH7++KO6U3/Ls5QrCBpzBE8hSy6ZKSBdIjCMesbwEWDqmyH8LmW+4NNaM1O/LoeImomGS20uw==
X-Received: by 2002:a5d:47a1:0:b0:391:2a9a:478c with SMTP id ffacd0b85a97d-3971d70c23bmr4277553f8f.23.1741966696382;
        Fri, 14 Mar 2025 08:38:16 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm5944388f8f.62.2025.03.14.08.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:38:16 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Mar 2025 15:38:02 +0000
Subject: [PATCH 1/2] arm64: dts: exynos: gs101: ufs: add dma-coherent
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
In-Reply-To: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, kernel-team@android.com, 
 willmcvicker@google.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=HSyPEmJtBsHxDhCUULm5Dya2418jRqfFk0guvCilkbQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn1E1kYCQBmCyj5ZPX4kgCPL0qUhJeVs8SYMUGs
 jG0pHfrOVeJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9RNZAAKCRDO6LjWAjRy
 ukfOD/9qIbmRkrjri21mRCY4ydKJb92uYxQTmLzBqS9EoQqKw3ypCrcUPmvcJfpaXhH+DpWLSSy
 a2IioXKB+tQuqZRLgTsSzAmFr8d1n3q67OAnvPh1Lbf81/vs1hKRH8pfjjl6cuRfZLpo7J98uwD
 rXzds9tzH/JHEJMWfqNXb5PL0x8yDubYQPlrg7FM74C9YYnE9gVYi8CPuXyYuPIeq7wzPaZfcYk
 NC4fLOfTgMXIscvqeUd+ybPUSz4iJQTqn9r1yKZikyXqyr7zdY3vHR5jhgV1TkvyKA56I6wA7Cg
 9mvSJgXSeglXhnLEnf7QqASjQxHkzcXPgQcsCmkfUsPWYuzil2U55RH2SI1Q33PhdjKsK4Vi9P+
 leUhppTQRotRB3f38/g8gyh45DP3VdfDFAL4y0Hm0hZWnRFmSBzPBgjhLoayKeln75j7B1vgRgH
 /8znc1PSTMKIe9EcT7LNnGe8+kSwHMOSuKyawIBFRQI/gGgiFOYvnWMZej9B2ZTa3uQp0WSbV+3
 /mxOVssXI9mS1r2sfTuMeV4BXfo8wPxsE7Bf10tVpbljxq17THjVCyjaD4qYpjWYBAYJ+NI6IZV
 vRqX3vpHKVMoL6e1KTNUEVHCDqmvnUCLNqOjia0oLpF/tAfqujQFEoig5Ck2h2ULDvvIB3trQ9k
 W+zbPT/ONn7vy5g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_083817_895749_C66A2CA4 
X-CRM114-Status: GOOD (  10.75  )
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

ufs-exynos driver configures the sysreg shareability as
cacheable for gs101 so we need to set the dma-coherent
property so the descriptors are also allocated cacheable.

This fixes the UFS stability issues we have seen with
the upstream UFS driver on gs101.

Fixes: 4c65d7054b4c ("arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes")
Cc: stable@vger.kernel.org
Suggested-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c5335dd59dfe9fcf8c64d66a466799600f8447b0..cf30128ef004568f01b1c7150c5585ba267d64bc 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1360,6 +1360,7 @@ ufs_0: ufs@14700000 {
 				 <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
 			clock-names = "core_clk", "sclk_unipro_main", "fmp",
 				      "aclk", "pclk", "sysreg";
+			dma-coherent;
 			freq-table-hz = <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>;
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
 			pinctrl-names = "default";

-- 
2.49.0.rc1.451.g8f38331e32-goog


