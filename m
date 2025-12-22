Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5818E67495
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XQM+4zgvXw282DuJseaia2aL/kiD6COjiN6mT8vpSk=; b=451YftX7b1qw+tohIgcwrWaKMj
	baPYy/3mSvDqeO9GDPuMhS5vV8datVwmJ2gR/BcsYdoEfx88mVm7v5WsEmA4SSfI0DrsnBIlYjsxx
	FTFNbILy1QVie5qynVlqUoOipAHFEQmDJldqdNmZaFJUAMd7otLuQd+qIQZ2ICDQH0slQ4IWn2Cjz
	bPixMmOEIez9BYG0ait58wlUCBbYB3O/p8sKxry7zndXcnhM4JfkhW/AuaiZ56NBRz/l/8TZCvr7c
	XqhLV5740uzPY3McDNcx54ePohaNtELU7S4fk6r0Jtvk3fv4Kb8mGpcKQ7dyeAAovFBKZOCudYIj6
	gOFP1f9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXio2-0000000DyAl-0l0h;
	Mon, 22 Dec 2025 16:30:46 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXinu-0000000Dy7z-2m9p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 16:30:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-47796a837c7so28782345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421037; x=1767025837; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XQM+4zgvXw282DuJseaia2aL/kiD6COjiN6mT8vpSk=;
        b=plo/4RLSSt+ZFpDxonaJTxGMuNExk5p+mP7s/4jEiMAwNBAJr3eiqjYcWDDuj1x7xU
         7Q0VGNfL/QrGQQBTdHOUpTCsDPwziD9xiTIDxseWPm+b49JtTRsXSxNNuJXVlO+SAX46
         2sJ4gqOErYCDTrUeNyYr1QglrnWLZaIGUrItj3y2k3LFV5rEK+aGIJ8A1y7ul7gnz6Br
         yPfNl7x/DFC/S0m8YeFOvqeY9r+cQpRTEllTTm/8OyXHOWkKTNHHpX3yODFy7+xg9iv+
         lftJni5JmxLp/hjOZjTx3UV2ukUOlch1J7GW3Lr4bOzYrp0fgHlo+WymOHGYUcSKY0kE
         Zs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421037; x=1767025837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XQM+4zgvXw282DuJseaia2aL/kiD6COjiN6mT8vpSk=;
        b=B/p+MdqY+cImFzwsJeRTPo/mSf46EDozFwMHXqWWBOGRV9rGbrsNG7iaXja0D0WheG
         Ddf3VZuJHC0/BGhd+EkIzHR4oUBOa5VRlAJPZwC1AdswkWEE+etwuyywLuafspnGnM0e
         +81R1WBGAx7j3GyUr3Xdk/AdJZ4RG5saMJhN/eLhfvgxoNma94VFC1ndQSoYlQ+vsCdC
         AdPfPSObGFBUwSdC7kKzRsaJu+6+uqCe+qN3/qoxktIUgrF+FYtq7ws/rVN6GX883eW4
         EHKG2By/todpGDrjl5e0dU0Quz9CsthPjLb5w8OpfhGTN7fcdhTNwhvYnVhO2Gc29esn
         tncg==
X-Forwarded-Encrypted: i=1; AJvYcCUnEo+IIEGz8UI2OJg/H9ySlXbCgkD8FXSi18X7YozSxTT+b1eTb6vUhPyZua1YLefQrqd4vTgo3fOcnjDUixS3@lists.infradead.org
X-Gm-Message-State: AOJu0YzP3Ae2GfSqksBL8raF8R2VFnPsG8/5WoBQP8gUw1/rS43wsrqE
	T57r7XivsLutx5BLTd7ZxZNBOMzckUGAuRVodHp790iBH9NCmd4sOj/VR23BPLRDDVE=
X-Gm-Gg: AY/fxX5iVRrhC2UE37QlSP2v466x6xRGHpopQ25sBS1TDIKFTWgYhu+aC0nw8gLr+DM
	7BvVbohqIpe/508ttOY/F5y+7PL9N5OeSDAYxNFx52dV0Euw8FQHPRYTMz/kzny5hDGzbLZdY5O
	H6RIgwJwcK22eJ5Amb0rOqTCNjFDP1JDQx9cmXy/S7hstwcLiKF+84r/qGjBKm4hjidjpih0sM6
	k7/adwmznM7PnUfP7Km9Pq9K7ApES96o5FlKQ5Cf1awbJZcs7HvSQ8bN8Zgu3+T7QciggsrPIVg
	Z8nTXmZPkYjbOPVd6djGgwRSRpFr4GsxooD+Xz5G34SEg/kqLJabAWRfi9cVpZQx82g9DVBoLqu
	1SrJQkI8P9OzsjX7UxbPxN59g3uh1ifP6wd79O6BNS9f8pwzWbi8LkBPxVZNNmAa6T1/CH5Zn2o
	nv+Nr1ABfJUz2LqKb/XNdYAkU7Fd3JlYxG3UaG2jJyzASV+0VdkUDB4UVtIvBpvMKdn9R6GoXwX
	ps=
X-Google-Smtp-Source: AGHT+IHvRDRIoHQjA1rZCLMaSDTKsCyWp+0hB7b+F+L1wF0MQiyzngVj5PEvlpySW13JHDQ1ncylpg==
X-Received: by 2002:a05:600c:3b87:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-47d1953b7b0mr130487085e9.8.1766421036654;
        Mon, 22 Dec 2025 08:30:36 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:36 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 22 Dec 2025 16:30:09 +0000
Subject: [PATCH v4 5/5] arm64: dts: exynos: gs101: add OTP node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-gs101-chipid-v4-5-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=992;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gIK455PpaZxVuvfXEfRmg3pjfE8OD78NBBkTr9I0h8k=;
 b=Q9f7t/RCDmUJ75u/2IeLiK62QNaGafJ83CtoJmOgrtY4/ERxZXfJ3qSw/mnSIdVKgntbdJN2k
 VlgZHF4bS6DBaN5xNMz0xRTYlAR8/L3MPQHerwTH77W0JbgdWIwFRme
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_083038_721547_72445809 
X-CRM114-Status: UNSURE (   8.90  )
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

Add the OTP controller node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9b38c2248016aa65293c0abf9ccaf20857d89693..e078344c9e3e558aa5d58845d0fa2849832b857b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -571,6 +571,14 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		efuse@10000000 {
+			compatible = "google,gs101-otp";
+			reg = <0x10000000 0xf084>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
 		cmu_misc: clock-controller@10010000 {
 			compatible = "google,gs101-cmu-misc";
 			reg = <0x10010000 0x10000>;

-- 
2.52.0.322.g1dd061c0dc-goog


