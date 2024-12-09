Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1731BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRioCcmJDy8djkmiyQ6PlnLYMCijDL6jrj6MyazB2/8=; b=X/3Db9VPqEo3mSH/Zj0gVHGRu2
	Ntr43ESc+04ttmPnBNBtaCx/GH8xxlFXH4eT8DgugXwmq3LCOasL2J88WdXC2parTOnIW0OAoL9Dg
	NfKCsd9LU+iwyXl8eVoDq172hxKkdeuULH1gq912xbC5pVdvEeC8d/PVqrt60h//8b6RYvKFYN2L2
	E0HTc/wc9tUZ7cG5z2I0rVkQ6Y1ZIJ203n1tDFkxBb8n8V5ioo226+26bsUWmFpCG5F8ewSW/401U
	f22G1pnbXLDgRvoo6mZ1x1PKQmHtKmHJ+qExJo4+lHBiHCi/ANcFOOG2uXLA/M17N2rLPU880SPFX
	r16DphBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbO2-00000007O5x-1Sfe;
	Mon, 09 Dec 2024 10:53:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbL0-00000007NSz-14sR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:50:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-434fc523c4bso353675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 02:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733741400; x=1734346200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRioCcmJDy8djkmiyQ6PlnLYMCijDL6jrj6MyazB2/8=;
        b=OPs8iCehDGLzyQwYp+uWf7F2ZvNEpU6/gK6EcgWchFhBWMK9/hvv3hJ1gULjnqc8mF
         nMd3JiSxbpGIRq72WD0gv/D7QtYWMnnFZH9bxXMU/O0QxliuccKJT836yET4Fo+V40cu
         KDlrKOrQU2YchmY63eennp//eh7RZVJepTmuLsus/CtE8eGch8vBQ5iCMyVp+6aUJYpI
         yB8j6qd2byfw30VOkAC2UQwl4YQNFqJiVf8iiPod66Zb5qIBGjGZT8jyH3rFwUGK3/Y4
         12mVTfn2mxu44A98iRbPJminstrygNcWeg8lYPGVUVW6BH55m7ZmZumOjQICnaG3eTdg
         rJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741400; x=1734346200;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRioCcmJDy8djkmiyQ6PlnLYMCijDL6jrj6MyazB2/8=;
        b=F7j1Cume0tZRAh/mM/N61bruMCoyD5i/OeejJywFOYPQTr+o9fc/3oXC7n/DdQG7Kh
         e/ockxl0ZfcnnKdMEtkIaSAnKRRD7SNV4St2ZaYRB1FfEYBqkgMdjxBwFjaLvjVig+qu
         YLtR/GEpL+obpzCBiAMYtR0Z7yGf/rtagBaBPgLRbpwRlJOLL+buHeutmgYzQGvy+SlV
         B6U3CRRy6t4e5rbgLE79xHF4kCMHrJ64MJn32qALjlX0KuwsoIZZBAWY2iqR3oQkTtCp
         enJmRsOHIFJLy6ckvRirc1Vbk72hO8mmXm6EXhynltSI/rmplusQPIWZckKF9Er2DSt7
         tXLg==
X-Forwarded-Encrypted: i=1; AJvYcCUbKM4A92K4B2shNKfQ74+U4xtINtTLDjmASkWj4zKR7/oIDS9r7az2LpWUhlIG5uJevYIeZaEe6iEZIBaM9Pef@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ApozHRVe/MSq3Kx6qnnhek7mHgBGqf3f6Pnu7m0vgGCIT9ms
	w0J9ZAffyUnO+l0DxIjET6dB7EnSND6NK7hHybjD477dUJbGHe+SLgxa2z5Xw4U=
X-Gm-Gg: ASbGnct+NrmxItzbf1QjbnKd3jZ1vhhqFe86RyiLLHJTybbLw4nEdSuzoiHd8X+82Qg
	HZYlVjcQRfevA/EjHg478tdg2RD24RSu/dsTjO48cNbN+ZOioFN7y2vHL82qhP7mIoRneZhkLM1
	0v9A+jB3gDdb42HmYhw1pcNclig7rl/OUN+4u9s4qIkeazXoKEmBSHgt/iO7xPBRRMGxE8VYA7u
	Nnd7vbBmLSvDlpxGxSFQr/h2GnpvEIqGtp5bHfsp65TDVVNKnqm9tXCq8KuqOLVlQ==
X-Google-Smtp-Source: AGHT+IE/viVovSPI39lIWcVsezgqXa23ODao8hwSq2oIVnwoBrcfPb0n+9g7Mmj6cCGSK0ndX1fPlQ==
X-Received: by 2002:a7b:c3d5:0:b0:434:f001:8680 with SMTP id 5b1f17b1804b1-434f00187bfmr20178805e9.2.1733741400471;
        Mon, 09 Dec 2024 02:50:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434ea1ae415sm80301445e9.33.2024.12.09.02.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:49:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
References: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: add myself and Tudor as reviewers for
 Google Tensor SoC
Message-Id: <173374139927.46435.9500356182814320037.b4-ty@linaro.org>
Date: Mon, 09 Dec 2024 11:49:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_025002_299369_EEB6A521 
X-CRM114-Status: UNSURE (   7.02  )
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


On Tue, 03 Dec 2024 13:03:52 +0000, André Draszik wrote:
> Add myself and Tudor as reviewers for the Google Tensor SoC alongside
> Peter.
> 
> While at it, also add our IRC channel.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: add myself and Tudor as reviewers for Google Tensor SoC
      https://git.kernel.org/krzk/linux/c/da9ca3164d1794660d9ad650beb807b9a47fe18b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


