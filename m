Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE19E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fv2CUS7ZbxpkqmLJHrcp6kZwBl6Wt3zoIFWY+Ye6cE=; b=26S5uIy8cLJbrvWNzX/Nm7feDN
	2qNsfjm3u+LPTI/Q4Sq7mEh62Fl77x3MH5DiyPhGEMSU5wylXIrLu7BdZ4KUYvwj7iNOexIl0vuF8
	wBMcB/3ktijDQwL/zxwtcEFKszKXznn5tbkmdH9WAn1TlFgfzxqPTpUOXgBwm3IFTkoIXSWjp/J+1
	1NzE0qfFivAt0MHxKMYL0geq09f/0OJfkfzQk43Zp90sVld0bb8IK4UvmZyFXZP7dqlC5KnKzwH6s
	jHNrliX29QGYfIpUq4fUYMEwkPsqZOE2QbXQmfwp1hzQhOCHzMmr6kgkzHNxfugcRwHM4qUWmQQck
	Kh6Twi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPN2T-00000008OSz-39rg;
	Sun, 22 Dec 2024 14:34:37 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPMuH-00000008NTA-1cYs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 14:26:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa680fafb3eso53589466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 06:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734877567; x=1735482367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fv2CUS7ZbxpkqmLJHrcp6kZwBl6Wt3zoIFWY+Ye6cE=;
        b=L19veCqHwH9XWjpjZT4SxmEafLFlKk+b3cWLFdpNQPngQAdrXs2FJShbevlBUiNA9V
         e2vXdiRX165E7VgYi9WqBnZVTil0coC/PO2NIZoWsJot+9HO2q76cAop2ixQSEPm1d11
         mipt1Fg+fCeP16tHFwqD/5LPJinCcrBrhiwWJoDVvKpfAvflkJBdMaSJ1eYnN4XzSrks
         zkW8ZGwCjwKg0PMpeXRtA+knKfBx6yvNv3he4Nd9AoEZGZJmoCrsEE1e58qYcgEDWOJu
         /XnyLXtxg5AQYNZlmEZU0ImC2u7tde9N0i2mjo+brLUZh/qSh9YiD+GUydUXwueybf/z
         0eJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734877567; x=1735482367;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fv2CUS7ZbxpkqmLJHrcp6kZwBl6Wt3zoIFWY+Ye6cE=;
        b=tCM8cV/EI1KcBxl2qOFhh2w/+BWxtr3R24NPb5hC8MYq+JALpxHHz7nix7UCj69u1k
         d9a8zcQNu/7Lm5Kiecx+74GgpLZf3bM+UPhCMnC60EN4U1TL/5J1j0g8M+dwII9OwtVg
         7FXzcj/VQTjGnEYXG/2eJ7MRrdkkUMsVwERAHcIodmY4Bw7FAKNa7DuX0seDSMawPndG
         iNTIGqsSQ/9fqqZ6FlHOIyq1t6b100BFtpLfxM1PCS+Mm50aXPu8c+oYit5MVfSClj8A
         77OrLB/s7GFhstqyAnWSMPPhDhJrK3wls4njIAcTo+SW/DgGXxlWWwM92W3Xa+o4QRDU
         aqxg==
X-Forwarded-Encrypted: i=1; AJvYcCV1wIubszyLorR6ULYQinXByBFZeRqG5eeVet/lrwJemKYtF+7+uZiofzjzaNcMe/TZFqlzkM8eaSv4VrU1iPsH@lists.infradead.org
X-Gm-Message-State: AOJu0YzIjBwbyTKJjEbzKhFeVJlId01SWr7eQGjd6mlBO7gK4ckWROgx
	6yFzDq2PHplAzEb206Jzoj7idv2KLze+cVP4j4oTjRnn76hgbx0GwHRVesrAth0=
X-Gm-Gg: ASbGncvFOX0uNsldIDN5dOnnwXgR7lznoBoTednEK1CdzhbrePihrvsggReYsDLMZya
	I1W07NKpZv+Rvdzft6RsU2nmtGzRZj9963UVqJF2NduaoGwI6qrxlhPsFOmRka29zAbyMo7po0f
	lTR08dcO7uvr+JGkndJrag/BoJcNjme93RNLM3Xhwq0FPXC/Cu+5u1iYcMMfH/pnlUjHTh2ioQu
	l0+XVIvq+ATCveray77l6vufeVQpO0Uk/hv6iX3DDj349fHhWNkfY3/nNmFcWFEGR+tQZqjljSv
	5wV3zkQDLAsgfhTQt+Q9lRIcdtRldzM=
X-Google-Smtp-Source: AGHT+IF6cnIbn11yHwZazziFYqCjkPi3z318Kw+gMS01o7Ckh/xs17Fg9qz8u39nDgfnBnEA00iHqQ==
X-Received: by 2002:a17:907:6d1f:b0:aa5:a60:ad6a with SMTP id a640c23a62f3a-aac2d4472c8mr325314866b.8.1734877567625;
        Sun, 22 Dec 2024 06:26:07 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f577sm392716066b.18.2024.12.22.06.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 06:26:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 igor.belwon@mentallysanemainliners.org
In-Reply-To: <20241214115855.49138-2-umer.uddin@mentallysanemainliners.org>
References: <20241214115855.49138-1-umer.uddin@mentallysanemainliners.org>
 <20241214115855.49138-2-umer.uddin@mentallysanemainliners.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: exynos990: Add a PMU node for the
 third cluster
Message-Id: <173487756559.3738.15589488923856918285.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 15:26:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_062609_472756_A6EB7C20 
X-CRM114-Status: UNSURE (   6.88  )
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


On Sat, 14 Dec 2024 11:58:55 +0000, Umer Uddin wrote:
> Since we have a PMU compatiable for Samsung's Mongoose cores now, drop
> the comment that explains the lack of it and define the node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos990: Add a PMU node for the third cluster
      https://git.kernel.org/krzk/linux/c/86c0d7f230fe71952cddac9905e4c090e09ecf3c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


