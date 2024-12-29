Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA1E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 10:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1e4Zcdd64n/Uq8SZYq9uZiFwUddDGBarfIwN7jA5P8=; b=Np22wgIn4eqOwUjorAdSPxu8Qj
	CZIBrI0p8ffw1Noml/lspNtLQt4OLMVaRrNmaKoOV11EgMbM6cSAepxkYdhtw9fpjC4nPpacTHQUk
	xgrm4hKa72a39WMkXomqsRGOeX3efyiu/9g/qPm8CuVdIyVvwEGRH6Kj21iJ6VtxsB2wAvzZfSGu3
	Fn99+lmNpJdT0MNiL5n3HoiYzoRti6CvMxbGPB93rH3PrHXHPtlmFJ/x+3oaYkJZofNhcE8pRF/iC
	yI1zBphrsT5r0iqrQ9H29TjfUCCviSoImZDiyl3hYmBV1244UxCZbCy1cJK/mdMPMKHyGs4QQrM9C
	T/Kx7BwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqHP-00000003EkE-1ttt;
	Sun, 29 Dec 2024 10:12:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqF5-00000003EMz-04mX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 10:09:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3862e570832so1030556f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 02:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735466989; x=1736071789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1e4Zcdd64n/Uq8SZYq9uZiFwUddDGBarfIwN7jA5P8=;
        b=J6X9PHTjlR3U/vaR/Vv0+OM3EdBLYhaJSAAPEDAiT39OBELe5Sq30AYw2nb/ixPafW
         e9KO4hiOX4n6qeb7a9DNAiC0jq4vuN490GRvs6dZ8l7L01WUQ7Ukw6Ga+50Q9lHGBmqn
         laD5OPJh6+f7ZbLvtDXZDHKXMu6hLYA8K8CT1RP+SqCcnRPlzVbJxLqQ6UyrqmKyQDoK
         /8XAprIa0taZMYTpp9aaQLkfKMLHkETmx4q8Wk/Q6h/Sa4p7VvK6MetN9SxlvlXbBz3c
         6Tc/84ipuIYBQg2GQgqLX/8iT5lIWuw4qNhpuQjVMCzyVep0nkm2Dy2ejH1Upo6e4F37
         YgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735466989; x=1736071789;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1e4Zcdd64n/Uq8SZYq9uZiFwUddDGBarfIwN7jA5P8=;
        b=AFbpFx/o8DNFM1PrfNuWZJtYaUDZLxxi7sovcSpDdKj6s+ETeuWyfwTKxnjtZC837b
         h231jmz/XnNc+qcNqG5ZGRsyTo6U10TjtRRroBDVJZbLFPjZXVVQ/ePGj0Vk+9QnU4GN
         btwPj9PV3/PAX2I4EfI6gtEXKvItNOHt26CETdfiH+LolmESBdx8V6YTL0PczxyijSIz
         JrrTrYHluPpiEwVKjFlSqBXdjxDxHUrqMRKFYAEmqt/VF+s5QLgtPLmlYUtZRJJTf/aN
         1QDrtemab2Tt0P2OyUCbVlBGqJuE0Zw0+w6qYGOnPBuKTqZ6zPQnxpXuuu2W2IsK6weI
         g8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWeETBeW7XvElqBea41TckZnGgT2IJCAwI9o2p1m5dfcPdUoLAtTrlh6dP2k9Q2NwnuwOyFgyGyNOBzz7ghLVBm@lists.infradead.org
X-Gm-Message-State: AOJu0YwwiqK43rOVattWZOWaiwrRP46sKePrFs4R2p7uAco13PyLQVyg
	wLlI2BsKJr811l7i2+wzdd3oFp9G7XCxPMr7OuvQ91JxiWwd27Nf/8xFA0iuQCo=
X-Gm-Gg: ASbGncvoQe+TLojuBxVyN1g8slUkglH/cG8TweEQap+yBYWutsWktBt9TWlDBsmbfY1
	bSPDjdWgfiz77+Glp3hJd027VjnyExadMY5ft0d9Ncr4BFyquAerY3xvkznk3a97ujpJ9P7ramx
	yKL9Ry+fzATO9X8ZbnR+6z2k04cIz1t1ye0NDGaCOZ+d+mCmp5G/v2nfkhfUrv04jCKkZt07jv8
	aivuPAeNd6j423sKzO2MRqSJtLp4KhRRKS7I+NfRf2tQGjBqSUlLuLjCNWhmTTEAgvn9ALb
X-Google-Smtp-Source: AGHT+IFqkvxQps+KrzRziDHQFsICEA+v2gm37Qee519mhPRQQR4sbGLqJY626OMpwV6K23g0gpxUnA==
X-Received: by 2002:a05:600c:1d07:b0:434:f335:aa0d with SMTP id 5b1f17b1804b1-43668547269mr115138885e9.2.1735466989158;
        Sun, 29 Dec 2024 02:09:49 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c493sm318174575e9.28.2024.12.29.02.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:09:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241224-cmu-v3-1-33ca24b2413c@mentallysanemainliners.org>
References: <20241224-cmu-v3-1-33ca24b2413c@mentallysanemainliners.org>
Subject: Re: [PATCH v3] arm64: dts: exynos990: Add clock management unit
 nodes
Message-Id: <173546698710.10457.3695234536331992206.b4-ty@linaro.org>
Date: Sun, 29 Dec 2024 11:09:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_020951_063893_830387D8 
X-CRM114-Status: UNSURE (   6.14  )
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


On Tue, 24 Dec 2024 04:33:36 +0100, Igor Belwon wrote:
> Add CMU nodes for:
> - cmu_top: provides clocks for other blocks
> - cmu_hsi0: provides clocks for usb31
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos990: Add clock management unit nodes
      https://git.kernel.org/krzk/linux/c/f21231ac28f44cd5daf50bc8fdae381f451b46c9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


