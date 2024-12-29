Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60620E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo0lFH0D7L1OyRrRi/rC2RixuHioaZMR/O4UKhCo6m0=; b=wQptt++lyUuaf9qjpnlQp4ma3T
	qZTqinUgPPIKc4ys1EAD5S4vUqy4xo/Nxt4mrfG/1GLE+lezuptu7FyRB+2M/ARo9kAK1Werwb7X7
	OEqfuf805aVAIKsC1jPiqf2FFXa5Gu+6gYrBj9shJu8fJHWEWH1PDgUpokhel1eUfECe8vvUHq8Sj
	X3XcCa2ibNloHxc6XSbpZ0ew8+dN9v9kEAMFOzVEEfWt/GLMTcJoNq0sWurGk9AyzdZ+BGYbzAsxA
	K3aOB8yxYo9uubtY1COqGJr9yyY4t3Aqkq+9/wK+mNm9CpJzWewRJL9m9oxxYgM89q0tfffuZ0WeX
	T237Fj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqKt-00000003FPx-3VxE;
	Sun, 29 Dec 2024 10:15:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqFQ-00000003ESY-3uPk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 10:10:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361f09be37so12784105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 02:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735467011; x=1736071811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo0lFH0D7L1OyRrRi/rC2RixuHioaZMR/O4UKhCo6m0=;
        b=q5EFlYrnPwbl4Y4h0QjXyJLptKYycUHv/GKUQaSQ4kvErZ0zxmIikCYfByYHqC4yRf
         8iDbeQGRmv7jDpb15rlfAThk/xhr48pvuSJ+BRZftgEWSH2Xa2MFk77zS77fO+5iufyw
         piiwts6ZHLQBqYtwMtjvs35XXNgeOV7ISYijy9xbaBwlslKafzt5vhv6mmH9UEKS/I0a
         Fn1HRcZMz1YYXBkrKl8k1FXyOGh7JY/5xzgtsp24QudCsw3QkcHGVfIKUhyDliz0N0RP
         U0WCPnT/Y4CZUVQHBHYLN/v2OAzngedv2isuC/cSdqxaZTri0T3SdNPHPrJJzSUmcuqG
         g1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735467011; x=1736071811;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo0lFH0D7L1OyRrRi/rC2RixuHioaZMR/O4UKhCo6m0=;
        b=cLhn57aH0pvddCZedUdnxi7zPIphfPZc1Qq2Qg8/IGSD/Gz0K6RheEE52K+7keSLcz
         ZPz5jbf10a5SvNenedw8Tm8vAOLXFRbhuD1tZJZtWR4m0RNNHSxOv9Fc55cERWvels0V
         7nAbWd1WtO0JJowX6C1MrImW+BU6PXpV+qPJSuqN7DVBVTbU5atV1IxYBhA8qrH91NMA
         6sjm9zIoBppFwVvlrx/gCmcIxth4pAP3bRehKLbmMCRKhgq1USpLAQzqgzvjnkxbUV+B
         suxL4vn8zvxL8Gl+BMETTTJU/EYGYV+7mN9K5hhUdl46LhaGLrv666V4mCbbVRaGA25U
         UfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJu/bOEhgT/GzvbHuIanwC10gUrgf1BrD0M/1/ai5ypm8TLNwXae4d6NIDA+JtiOD1vBKWLWDOkY2la0jopiHd@lists.infradead.org
X-Gm-Message-State: AOJu0YzvrEnM/9Y3tbNjnVPxSQxYSesfhAx415+ZJQrAmPcTA0KP0kDq
	a6QFEnpJ0SpsjJE67d5q2lcObSVK0wCiEGV/G0cMB3oZ6oI0kBuj5AFAILrFvbv4JbW0g4RnAG0
	h
X-Gm-Gg: ASbGncv1wxnAwOUn99frnYJnfGirCR7744XA0MCYAsT5bwFLZ45heei7R3U60XtfQmv
	qN06nq8UWO642SK3D3+6nLxtMJhzF/ltZxewdNirNnrQ6GAVw1PeVcyoIEZmT1Ek+hFwA88jqUI
	U/8TGjlB11mRGum0DH+LK6UYPygp0fr7chYCuY4iUFLyR3a0Vp0txNZpV0RCucKRh3pJXeSsw8x
	GYNnT6pae0WhT91pafEeLmAmCH6FOp1INI/JAe2G/wwXBRa/y1FihvixvUGQ4eAwcuE/DDJ
X-Google-Smtp-Source: AGHT+IHP1vNO4pX8rCVSoOO8ZA/PKbzvByEOcpImjWXAjaOwj9hxfLF/KNxyi+EPgVTvKCoXvpRUbw==
X-Received: by 2002:a05:600c:1e23:b0:434:f335:85c with SMTP id 5b1f17b1804b1-43668b7b619mr106181145e9.6.1735467011606;
        Sun, 29 Dec 2024 02:10:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea40csm320505375e9.1.2024.12.29.02.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:10:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Artur Weber <aweber.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
References: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
Subject: Re: (subset) [PATCH RESEND v2 0/6] ASoC: samsung: midas_wm1811:
 Separate compatible for tab3 + fixes
Message-Id: <173546701025.10606.6645019448209371865.b4-ty@linaro.org>
Date: Sun, 29 Dec 2024 11:10:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_021012_976686_BC83C768 
X-CRM114-Status: GOOD (  10.46  )
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


On Fri, 16 Aug 2024 09:50:57 +0200, Artur Weber wrote:
> This is a follow-up to "ASoC: samsung: midas-audio: Add GPIO-based
> headset jack detection"[1]; it appears to have been silently merged
> except for the DTS parts, this patchset is a resend of the DTS patches.
> 
> Besides the DTS changes necessary to enable headset jack detection
> for the Samsung Galaxy Tab 3 8.0, it also adds a new compatible for
> the Tab 3 (samsung,tab3-audio). This is done so that we can set up
> different requirements in DT binding (Tab 3 does not have main/sub
> bias regulators), and drop the main/sub mic bias dummy regulators
> from the Tab 3 DTSI.
> 
> [...]

Applied, thanks!

[3/6] ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      https://git.kernel.org/krzk/linux/c/2c3c373555460b79a6a201c87230d32b211f8323
[4/6] ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      https://git.kernel.org/krzk/linux/c/d15cc681ba79fdc722d4aa7a83e572850cf5f64a
[5/6] ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec
      https://git.kernel.org/krzk/linux/c/acd33b48ce663c7e293b11cd77df7ea702ca34f6
[6/6] ARM: dts: samsung: exynos4212-tab3: Drop dummy mic bias regulators
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


