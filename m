Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9701D60A6F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MIlDDjAV;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cN8TuUZK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=; b=MIlDDjAVGdXf6M
	QRc1iiXf3BUA+s+99NsHJschisfCN+NRxYwcnTNXbt09F9aBbEaHxInBRjLmaPYkMbAhB3wfMKf2X
	8mD7vm8D02vW88rOoDW6GKLOxlSrQIdGcrbVxoRZYLQXt+L7Zfj17d0qvJONmH0MFlNA/LLBhBlXs
	ksfhpf963b5yi9wDXBXX124o9ckGXnQ74xhUhbCQ55F207WEPRbrjXHarS7YLhrxV0CQgInFyPWUM
	8m4Va9gwB0enTGE6gMEtasgZKTyjJY4klQFpoGVpLg+okma+3/NSC/Pt41OC7SV+lVIEnwmUoTyrA
	F1vgGXlrWURxjCiecbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Ak-00000007UXw-0OYX;
	Wed, 28 Oct 2026 16:06:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Ad-00000007UR9-2ELp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:06:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so7678035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203594; x=1793808394; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
        b=cN8TuUZKhA1zAta4tdJcvH3zpelAB81SYJC513ZIj3zs0kkOEujgjiIFk/gouK2U0w
         MR+xHJcQ9buu9rt1L96gtPMZYP0LtV+dHYFodLZayvGgXV2okUw0LqGl0VSlifZy4UiB
         /sKb0b/0hmG5zNbAUFPERY+M3xHe6BTaqfHVcVun3o1NIQm92z2Sph9t99OYwdTzBqh4
         vKXdXJ94kvJc//ZniWOjPeDaxtxFR3YiB8MdFKhmVV8EaYOaK6FnKmN6Sjld4SAE7amn
         iBFIXmvK9HKi4uq3AoDVZKZGqnrO1CabOvngtQo2CC4Nvscd2V42cFHuIEL3FLUJe5U6
         qEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203594; x=1793808394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
        b=QSwQpN1rHthAw0qqMao4KhevP65vWsAsNM61+4579QRIOH0ZT/VwW2HDyft6fnlA+C
         4jJa2+x5g6CDhR6g9yOayuGB4SC6ovLM9+ynqfLaIvRipE5ng4ZAC08YJ5V4FOythE8W
         7YeTiaJCOz6AHmM1X99p534/Leauyg2BFgqE9AQXcj8Y7C2qucfk6qudi/E2w+ra7sUD
         sK0IF/pwPr+4tWrOjkB6ZkMPQ9sLmLIqc765Et+S73Yvoma0935FUSoR6T+VIhXIbRNc
         7R0tlPM+tmDjLeisvHrQmkEmf4OL2+B61/kQNyiqdWBIdY8kTDAyuLxA+q8DLT9G8iuU
         ffGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcCzvXjw+YGY9ib5AEq2MYL1kL08ROp2k85asn7Jj27DryWQjlne9hENg/ONpr/3d/QuZxkg5KAYsNTFtyQYki@lists.infradead.org
X-Gm-Message-State: AFq9FYIeNa358RYjWNX6Mq3DHyKa07ybeQSuzhbb9xgPRscVdEAJaQLP
	gjvWQnZNfcpfpEu09fJQb5Rvg4wbUJPt6vGNjP/RNxmoQtTiWLsGYiZhkR9PoIbBSJk=
X-Gm-Gg: AYBFou0lE41n16/MCtTvCorEzTi0qcDFuj2li/LefSMgCPncUu2HT8p5TramAaU7AS+
	+aPZU/hP9c8NKF659OvNZJ4HmnblzEyMXFIMig1bys1G/13Tzhsy1QoJp0bBR8zUIk70ZHyzlq8
	YXzpc9jxIj3e7MPM6nTDG5qsYQ86ljwSDRWrf65dtrKxVUD4Sev4V21MpEcguWRfRUaK8WV7zYx
	BwGWvYHc7ixhIu8Uqs2kB01HfeepzYHhFhqMv6YG8rmGJK7ywfOpFt0D2au9Cix32l75P0LW6vG
	9LC5Vk6Ju59bvFcoZxcshsqYSptgpNMfQLHR+bjJ2kHhgpMJUNs3jQQaEOctYzFG3PHQdMc76NQ
	0h78ZZbXF/zU148oNy0cyrxO+Ib/8iypN8Bw8kD+WzNkgbAeujYXAMVmqxGLDmzbe+hOPVEut0K
	QXabN37KmXxnyuX/jsz7qeppZZ6oOIqcyOie0rS2hDUXQdHHSAJSt2s8z5emo6UHkAbrk+ABaT8
	LEQ0+CYgSEEoXIo3OaM3XfrfJkxcZaO3KIJEEw7RKZ+y1DwNQjb3N5OHFctISX+16pzA0blzGdt
	F4RSSKJdrWFLbLMYHPcNjYfOwlbi8RI8Pl72REVYtvrQIZM5w5ki0WgOget8C5mH0Vs2UgwxDqw
	k4Nle8gVMu2upNCy+br88URaNuOfdrDnFLMFdlhvz5VTtF3g=
X-Received: by 2002:a05:600c:348f:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4a9643d380dmr62293675e9.4.1793203593792;
        Wed, 28 Oct 2026 09:06:33 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:33 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:10 +0100
Subject: [PATCH v2 9/9] ARM: dts: omap: dm8168-evm: enable MUSB multipoint
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-9-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1428;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=T/OTFeU/v/eoDvotZ5j14Er/J0T6ty7EyR4RK8RPU/Y=;
 b=tNkgUp3nDaJHGL2hMsaJN+z8EhlSjiujuDHYAdAC3akJpa5TYYAUeQyN7Hs7ubj5f3GxEPgs1
 rlFx3lwxv9SDGeA63+/JqJUP3QwhstYNTZkSLFqa1KBjtDWJh1fPc6D
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090635_600237_745638DD 
X-CRM114-Status: GOOD (  12.33  )
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

From: Christopher Obbard <christopher.obbard@linaro.org>

The DM8168 USB controllers are used in host mode and must advertise
multipoint support to the MUSB core. Without this the kernel disables
external hub support and warns:

    musb-hdrc: kernel must disable external hubs, please fix the
	configuration

On the affected board this also prevents devices from enumerating
reliably, with descriptor reads failing with -EPROTO:

    usb 1-1: device descriptor read/all, error -71

Set mentor,multipoint to the default value of 1 for both MUSB instances.
With this enabled, USB devices enumerate successfully on the host ports.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index a6d42766a496..4b4e4d850231 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -198,17 +198,14 @@ &mmc1 {
 	wp-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 };
 
-/* At least dm8168-evm rev c won't support multipoint, later may */
 &usb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_pins>;
-	mentor,multipoint = <0>;
 };
 
 &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_pins>;
-	mentor,multipoint = <0>;
 };
 
 &sata {

-- 
2.56.0


