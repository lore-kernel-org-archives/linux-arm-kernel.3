Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE94FC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqxTDa4DhWJhcXAPACl5qTQfjpblrskBrbY4onevVXk=; b=UAHVVjuDe82yoBQhzJmKhal6ZH
	FCoqG2FK9WPviDQTkaqm1yFKo7ya0YnYFoEQLKHU23ODQth8pTIZASXhjgWJVo3u5puC7EuPJnhm2
	UWiv2GjtxcqTv+agaDSymLOfuErt+RxoQCEpKQxqGzaMFSxxeoLQ+tpup7FBuz+nisHLSYkOpgz7W
	te2jrlPdnlvVlhhFVzAwY3zFnmN+Buv04rs8ShR0MHdp3sNOq2isU66zdN+9+rZKLZLc6V09ahiGA
	fNLzBFvUfxy6JFEzU+8DUA9sp+7WcAhY0jfx3Sa/58xN4afh8n85kQDe5hsxKhAXLh2Ose57xHL6C
	dJKNSHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXyhg-0000000GJqh-24uR;
	Sat, 05 Jul 2025 08:57:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXyd9-0000000GJX2-0YjA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 08:52:20 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so73200f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 01:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751705537; x=1752310337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqxTDa4DhWJhcXAPACl5qTQfjpblrskBrbY4onevVXk=;
        b=dbE7OxtAjyOEB6SkR1M6Ef26Qob3csIt2prSdYnhFeGIfHyI6d1RSBkmnkaMFzMCvE
         wMaLUg4VHjY8McMUzkZG8RQlmOFX7UNe9o3GmdN0+kfY5U7um8lQ4m3o18xA2agDUx62
         4sO9DcGmldQIyY/XqnlO3mooAxlhlz4sC1aQv0Qm4Ckym/LvKHoGLyYqYhqqhmQgQ2Lj
         3dGqcQE+CF2tU1mZlMzEDBqBBCDazGinm3nCOejm2VIxDK2RdtQXasI3bPfIn7TZNKJO
         JbqB+Gay2yDdPxqeghoVWyZAl1eqILeMHw/T02KR2N5Nu4vS6c+EYIlh2hnwQB1go7r2
         Rj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751705537; x=1752310337;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqxTDa4DhWJhcXAPACl5qTQfjpblrskBrbY4onevVXk=;
        b=d5R5EVL34Wy2LXcNznCFAvGIaUoMeMm1I8gRCb7gdr5Jqzg2ZoMRG0f8LJdQnV/l1g
         76DKDWmTizV+Z2KW/NDymFeNGHl+FOUEBOm5f8l8bLDZznIGv/pMi0nCnRnu0GI6kPYj
         tsCjSV1W4IGfpJYc/87SZZklqmnVSWQjTBVSu56mlKrZTBXbF9xhUElJUJwYHwrLf6sE
         3mr9Ox62ALLu7xh0n+Irmg8P1IsLoKS1hmEdkS9V7jKlpbO4ayB5Go+SuRPLJMQT2FOI
         dSyIrfh1pYCzGTu2kOEKbKX5Idm54bLplAhOUrR319KylhqCfAUyA6iVTXVfBsvMdjXj
         Lv8w==
X-Forwarded-Encrypted: i=1; AJvYcCUdhlI8GtY2ZMsWw2yG116sOnBh27+Uw6Gh7SVuWqHCk1RMfA3h5xBi8K4bwNutjVyBF28xoBFZOv9/l+P5lSkV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9kLGgiRBkcvf7actIh/8X/n91fdg1Nivztjw+/fkGovzJ2x7x
	rrobIgUz5lO7k9FZek/sT1kvYMDDAJZgvMw4ZyiLmyRYiomAcFIaRSNB9A1OVRIvtkdaYfY60MU
	zs39z
X-Gm-Gg: ASbGncvQCVCQvOTAb2hOJDznJ9FXhU7y8p7cCCbCBt6sCwM8Nii3auQCDsRYUCh73YB
	94tLueVnK5HQzQuHYEc0yP73/WCfFJP+ta0FbhuzgqNC/3Sqp96KC9hOJTcIoPmXWhzgX1Ineuj
	ZZeaWiYZqCj2Hi2XC22cs9hBVavwv//7K97sLrPqjf6dWxlpjEscBINInuGXxjQPu7GwrKmYycV
	EZ8roYklZe1o6IEJtFz4OwU2Ul2A8D8IBxUtJ92Yvvw8zDibCYFdBb3CqXoQC32obzebq67pyAI
	W5Yeddc3HsExmRGZj/sJmk6VOhxeKhRipr55qZIq5/dOee668cHR9ZqjVQGR5Nrw3BODioQiYCN
	I
X-Google-Smtp-Source: AGHT+IElwpP/DQng7j4Oje4er7qQ/M9/KObJu58P5AwQY+utyeAiG9MFQncSMbCXC18YqE2yzss9aw==
X-Received: by 2002:a5d:5848:0:b0:3a4:eeeb:7e79 with SMTP id ffacd0b85a97d-3b496606062mr1737174f8f.12.1751705537562;
        Sat, 05 Jul 2025 01:52:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0af7sm4644670f8f.35.2025.07.05.01.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 01:52:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250626-exynos7870-dts-fixes-v1-0-349987874d9a@disroot.org>
References: <20250626-exynos7870-dts-fixes-v1-0-349987874d9a@disroot.org>
Subject: Re: [PATCH 0/3] Various devicetree fixes for Exynos7870 devices
Message-Id: <175170553635.13627.13202029423234330131.b4-ty@linaro.org>
Date: Sat, 05 Jul 2025 10:52:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_015219_177929_51617809 
X-CRM114-Status: GOOD (  10.44  )
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


On Thu, 26 Jun 2025 13:02:55 +0530, Kaustabh Chakraborty wrote:
> This patch series introduces a few minor fixes on Exynos7870 devices.
> These fix USB gadget problems and serious crashes on certain variants of
> devices. More information is provided in respective commits.
> 
> This series has no dependencies. Would be nice to get them merged in
> 6.16 itself. I assume it's okay to cc stable as the -rc releases are
> also owned by the "Stable Group" in git.kernel.org... [1] [2]
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: exynos7870: add quirk to disable USB2 LPM in gadget mode
      https://git.kernel.org/krzk/linux/c/e9355e894aebcbeacffd284644749190cc5f33a4
[2/3] arm64: dts: exynos7870-on7xelte: reduce memory ranges to base amount
      https://git.kernel.org/krzk/linux/c/2bdfa35a7bb6e3a319e7a290baa44720bc96e5e4
[3/3] arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount
      https://git.kernel.org/krzk/linux/c/49a27c6c392dec46c826ee586f7ec8973acaeed7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


