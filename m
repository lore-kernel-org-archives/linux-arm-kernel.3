Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35557C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pF2rTDt4Vl7NBjjbuhRzwdVJI8zgAEslXXnd2LthCLM=; b=LleCZKHZp/PoxvHbyCOZhapXcH
	MwcIynH3PS838uygKbPtNrisd+3hHQCJr+kD0jI/dRw0Gha364Cj6mn6lThvpJHO5zq49q8XYNRr5
	b/TccUoqv8Uh0rcstQg6KIO8kjSanbg17a+FaS8NWiGZKMpL5FJ2eXfFG0F15dU70S2+nASw5Q+bR
	qr5QJ/pGAg5W3Vt3YUEj/VnAXUEAyEBn5425TJkU1GFJ2zfLpOcDA0i0xu9ZPUhPCSpkjppoFfi3j
	wM9qAvC5pQT6HcYx7/guVHaJsSaI2cMzEwd8voHNDxotmcO4JR7DJ9WamntaQp46Soy6z/3Qcbb45
	5J3P0ifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9gI-00000001m7t-1C5V;
	Mon, 03 Mar 2025 17:34:18 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9dD-00000001lMz-15Ab
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 17:31:08 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so6253705a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 09:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741023066; x=1741627866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pF2rTDt4Vl7NBjjbuhRzwdVJI8zgAEslXXnd2LthCLM=;
        b=XCC5H7UdHLqG3tqdPmoDFcH3x3ZHhY52yXpzhVzE15M2VXj7koFhxwwanRqIcSxTvF
         WlYuvl8EcugHHwxMD+zMIjebKgTULX5JGQxLi/vFCB7Hb4Wz6fgy51jz4PN0i1FtuHIr
         Mf7mC8SPVTzC2FO1/5r805kIY3WGcsNZYGs8t+yEvi9OmzhB7mr8n9UFvLW3eD9sq6Sg
         por2i+7Hyr7pvz/c0uNK/6+5A37Wudc1PQa6R2siHXHaocrSowNrsaNJiZRKJ0xj/0rZ
         Ekk1dok/8fxz/uy8bJdel7kxHCy77E0jDMeuPB6OrGesE9wKp1nf28AzJA8SvAK/c48v
         Rc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741023066; x=1741627866;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pF2rTDt4Vl7NBjjbuhRzwdVJI8zgAEslXXnd2LthCLM=;
        b=ZBbvqZwJbrUvd+4h8nrdFH1ci1hJvQ3kn/UzMbKqFaWw4i/RW8BbMpRlWPOVa4OKSK
         Jpkl/t7wJ6viJ1ho/WSlmyp8LTmdEqdryrhohirFCAArpL4AjxD3nGkski7ChN+SzTlw
         fQQ3Bl2LPRNLuRxCNuippNoAaldsBeNB3Gz4mslYmpbMlm15D5qUgtUtIYpdj5HE5uck
         6lBNgGxsWSCS8T0ZROaIN4GPLK7FM3KzYewd4jC6DVmA2dqVHST4Dw2+F/+JBIiA1CCW
         5DHycys88cIb1R6s3VbuADBQ6sqemiC1x4sCCqJ9ehUPw7YhHJUxx/N1r0s/pBBSrWOQ
         Dxjg==
X-Forwarded-Encrypted: i=1; AJvYcCUKd0eL8IgyclbucOJOPp9bVrDrJqCzKXxejJyhdKuCIgxjtaorKIGJzMXc4ipFoLpiTomlCHsY1f5AG47Mf63c@lists.infradead.org
X-Gm-Message-State: AOJu0YxBF7yGpgE9Zew6xfUk4rpRXieE3E97v9uXXWupsMtR038Iwi1h
	9dVHAAA6BgYoVAVBOLWB/t+OfxuRE2o7AudRAI0TBdndNO+ZHpDl41YMkoeS0+0=
X-Gm-Gg: ASbGnct7pY6HaPlJx/6Vk+GDlLc1yLYE2eUz0QRrK+cRe3or78sRl9NPIggzKHk/zo2
	sL69GjuYmNwCKRr1Wo3JkYp5wiXHAl1XsYpjeUQp+aW7dolw2mo7ofzBC81LQTBrdqH7U6UbzSy
	TR8XCngGdK+jJrHbLiwplxsSLuINEJbzgqlxFZnJRiGGJDMonphvSI33zaChPFEkWDqvInxA/TD
	suzzLTgCvhiNrMNnxvXCAJO7o1qIZpYX8uUPenRIGr+RK13bQgHOwixQlUsKteDWlGxDC7u2geF
	ghDIA+Q6cicLT0b/mNqLweDFWbQ/BKWmMfGpMh0xa60=
X-Google-Smtp-Source: AGHT+IHZFUDG4I1s5mhjx5BD8Nhn984lVguIKOxIFYPolda1uofxljVhHU7U+dUntUauGH1gOLaGlg==
X-Received: by 2002:a05:6402:3491:b0:5dc:7643:4f3d with SMTP id 4fb4d7f45d1cf-5e4d6ad4170mr14262858a12.1.1741023065567;
        Mon, 03 Mar 2025 09:31:05 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6d26esm7085355a12.20.2025.03.03.09.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:31:04 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
References: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
Subject: Re: [PATCH v4 0/6] arm64: dts: freescale: imx8mp-skov: switch to
 nominal drive mode
Message-Id: <174102306220.2928950.8878245519332562153.b4-ty@linaro.org>
Date: Mon, 03 Mar 2025 19:31:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_093107_304817_D12195B3 
X-CRM114-Status: UNSURE (   9.72  )
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


On Tue, 18 Feb 2025 19:26:40 +0100, Ahmad Fatoum wrote:
> Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the imx8mp.dtsi
> configures some clocks at frequencies that are only validated for
> overdrive mode, i.e., when VDD_SOC is 950 mV.
> 
> For the Skov i.MX8MP board, we want to run the SoC at the lower voltage of
> 850 mV though to reduce heat generation and power usage. For this to work,
> clock rates need to adhere to the limits of the nominal drive mode.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: imx8m: document nominal/overdrive properties
      commit: d5992f1af1550a9e11e42cfa2ca1ad2a1b7fd7f3
[2/6] arm64: dts: imx8mp: Add optional nominal drive mode DTSI
      (no commit info)
[3/6] arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
      (no commit info)
[4/6] arm64: dts: freescale: imx8mp-skov: configure LDB clock automatically
      (no commit info)
[5/6] arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
      (no commit info)
[6/6] clk: imx8mp: inform CCF of maximum frequency of clocks
      commit: 06a61b5cb6a8638fa8823cd09b17233b29696fa2

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


