Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D56CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rY8qDK38lNCOQgDsv3kjC81fEngfx/ZqaQmDfuHd82E=; b=lv3EUMsuhF282RPnzUTT4WeJNA
	cKNqd/PmpUgHq5qUnQEn2htA8E/pt/5Ud9+ZM2AitfIXExbFBYLS+hLN3Icp6flZQDXcrb2ePApcm
	04cH99rkdm3jihfzZSEBxMbfo9nHVctFockXE9loNL7JmFy1TS7PM1SXAzYYU50V4GoPlY1GHe+oJ
	//j6RFqFNJCoDvIsmMPek4XOUS+6QuUQBoezd35DJ2dy1uNEJQspvF1xIqt4KdKQt3YkZPmYPLmFI
	3nIOOk0HDk/xFVwxnh+clcC596iV0Wzn5t/6yZMoL7GbDgTmMRAdCaJeQrnQ3p0bijZTYlk3uUQ1n
	6jb96N1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXtf-0000000DBmr-3A1T;
	Wed, 05 Nov 2025 07:25:35 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXtZ-0000000DBiL-46fb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 07:25:32 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b7128683174so36466966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 23:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762327528; x=1762932328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rY8qDK38lNCOQgDsv3kjC81fEngfx/ZqaQmDfuHd82E=;
        b=KN71w3GYHH96nRn/9k669g6FMRQm1jwp5q/q+Er+xf+P1R0BeJcJrqvsLdYPoG+rA3
         MBpBdgPUs1icClSkAr8s9wyD1uZknK1u+OT+LS28N6EO6VUfzjkjkZ+M/sDF/kB3V0Yq
         z0VA0gmATEtJpM/rOlnWPoN9xCTTc5Lzhw5HP9wRVcEoti4du4LpYq7HTxXuPQfnaB3Y
         PN9tsR33BbTM1+3PaEhVVaQAQtOEZMt3vzAUpGed7Ox8rxKkiuWVZ9q1I/E68LWVU2Bx
         MRpkd4aurm0LRHLBRHXDM3auPbEnB45t43zOm3ESLpCOo36CZo9ULPCyuaVXZwd8tgru
         9AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327528; x=1762932328;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rY8qDK38lNCOQgDsv3kjC81fEngfx/ZqaQmDfuHd82E=;
        b=w/jw4O6Zl5djQHPZcG+Su+CCsVyvx+xiz+QCofN5Wg9UZWGV6FLCDtwBIHUGew72mA
         7mGp9o/BVz9gAK7VbW6eyrnthUZFx9roTutLznqC1SSb9si6loLXLvDEyuJryZ2LBomi
         4D0H2MdPh52kBnvHMjIEqONFzBvWEUQdzPFCLUcqEPmfFQpnC9gbhA2dsPesg5QVwUQi
         MkEHIHmzWw/KwVejGLGLPRQrObMqKWWf0LomtukoVQnifvV8vtFipVHHF0RJmLi4S07U
         NS3TbXWlBfFD6//bltgMrPsALdODHlW7Zq4itd5lMU2wokvdt5V+pNjhIUtV1shq1jaI
         QxNA==
X-Forwarded-Encrypted: i=1; AJvYcCU4YY6wwAc3BmL37GCHkmpIR9SD1OQZ8d7v9Vm0ymMULb5HVlVgKwCAU0cG6dVkq448XYyR2v1vAkqOrg9PfYiq@lists.infradead.org
X-Gm-Message-State: AOJu0YwtyOWjkIYcA6c3TYRQzmRtRnfncU1CbJIC3QpqRgxpDBu0Vv9q
	+su8+SfSjgHEP9jU5pJI7dYUQ9dIo5Zprph4bEFdVnUcJ2VV9klRnjcDcK2J7RI/15w=
X-Gm-Gg: ASbGncv1+S0qyBx3+dpK99feYAK6XTmVytoCpK4Rhp1SeHsO8hzB3eD3wFVU1g46qoR
	x3FcThD0HiW7ARFAc9lfsxBVWwHStVDPLqLVFcesg7Gl+BxqJEh/k177muDruGrFvvrKhhr3jDV
	mMLRW+cI9gXN8hG6WH+ZjwP0ZOeIbIgFvIkaqLrA//edtEyeQgMQmqD/4XJB+imV7E/c+pG0NFD
	trkB1rnMIAMCv8NxKb3M46goNXycqUJaSClJnRmEy5zsUPlwcgAOCrp102RLqR/8AxzO9IshzGw
	vMzSLdgulgg8TwvIE7KqjchY3IV4OYEuIbKQ0xME/uFEtta9x4HcNq2jsuX+AdqNrmdYVbzQYN6
	baOoAWGjF+t7OtgkchiGw41tTd7vMlmoaU4ieQNksC/yVVAWT7w6zZYcXxV0yDxk2JDwsqn6RVE
	h/R540ubYsxBYuZDlQ
X-Google-Smtp-Source: AGHT+IFDmGcn05NWaAreeMUhIBohR2NC9khjvwR0aTsIxLFrJ5oJ/5mfubvbfEmAQ7WyS1CMvUR+Bw==
X-Received: by 2002:a17:907:9628:b0:b72:7761:1049 with SMTP id a640c23a62f3a-b72776157b0mr13498866b.8.1762327527943;
        Tue, 04 Nov 2025 23:25:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm411534866b.20.2025.11.04.23.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:25:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031-exynos7870-drm-dts-v4-5-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-5-c1f77fb16b87@disroot.org>
Subject: Re: (subset) [PATCH v4 5/5] arm64: dts: exynos7870-j6lte: enable
 display panel support
Message-Id: <176232752674.13426.8964418397433880549.b4-ty@linaro.org>
Date: Wed, 05 Nov 2025 08:25:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_232530_053723_88E593E1 
X-CRM114-Status: UNSURE (   8.89  )
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


On Fri, 31 Oct 2025 00:50:19 +0530, Kaustabh Chakraborty wrote:
> Enable DECON and DSI nodes, and add the compatible display panel and
> appropriate panel timings for this device. Also, remove the
> simple-framebuffer node in favor of the panel.
> 
> This device has a 720x1480 AMOLED Samsung AMS561RA01 panel with
> S6E8AA5X01 controller.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: exynos7870-j6lte: enable display panel support
      https://git.kernel.org/krzk/linux/c/cad767a9af055c921e29b7b268f99e83c82baab3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


