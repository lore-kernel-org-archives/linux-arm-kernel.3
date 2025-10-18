Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99518CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gB1PeMOLXs1r3u9Bm3EJ5/RnLcafi4Uhbd6zm8SAQT4=; b=WaaZMRSVc5eafBb4rUHedGor9t
	ex2+e2uJo2B6YNS8/m6xpEEEMgOSfs67I/MmXWCmUDoC7doudw7wP0KBz4lIBWuaNkP2RiOGglH/Q
	eJcG2Q5TH4XdpGR9a2mlrvsYg0iB01h6m8YAt9Fcm2ILuY2kES8pvkA1VlT2tzop8PFDXwJLG6K6J
	LSyHbHBobhoUAfwrYtXL7Cl5dyJpoLxvLby2yVTeF385yBiezIB+CB2KvXsZ+Pp2tXwgMc7k1Bjgs
	KERgmAxrL5KfoamuYSYa+KtWBEgMmNbcodH20xQXEti9Zy8qnfUjzusENbeiaFUYxdtYgTUCx4TL+
	LY2taaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9Wz-0000000A8EM-41eQ;
	Sat, 18 Oct 2025 16:11:45 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9Wx-0000000A8DQ-0cxQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 16:11:44 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-863762d794cso93531785a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760803901; x=1761408701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB1PeMOLXs1r3u9Bm3EJ5/RnLcafi4Uhbd6zm8SAQT4=;
        b=eQ62nDl+F1jHbuRbjoyBJ3Pw917JaFkYlDdAuhjFhEw6cYNSc6duzXQ1haBvQkNzmZ
         +hvYAR+lDhJwZN4QF24bGUauV0bwk43B0UAQTi5T2x6wHYWd2FsYGe7f+KTstKPdDvwd
         KniCnNhhrTO3yWjFYoj1lU7qqgMltvNR7glbKXaorKqLAebvg4T6fi31IW+9TKkMlMEo
         JQMQtVkMNa5K+2vXMgWN8UFhv5wBoHI/z4Y7t8azi3OKu0X6Ac8h+67O9mXs8NwCS6FW
         KzXsXHMziwwLpvLsXsZK6KME+TpY79/gkjNtvxi73J8AVZ35RpMfuBrAC8/JpTjt2VDS
         sFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760803901; x=1761408701;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB1PeMOLXs1r3u9Bm3EJ5/RnLcafi4Uhbd6zm8SAQT4=;
        b=LlZMQwd8WpFucdlQoOuZCyp94ihSCZ/a9F+VSVk9AAgP5XrbpjdnJXR/j/mW4RIimV
         pguaGPHKC51s8kfA72IouXbW1zxPfIlo/6e8Gtsvm3Mxd0qDzdepGwgVp3asFLqPBzv5
         nITmc8xbUGl+s/TK+oee6PmSyy3blIjg7m3lq8F6XZv39YOiha7FDlxRJDg9lXgAPVyF
         /StbD/Zc4BcpyUlHVxgHpYLFNETE8Gt/N4oDIheBBbiFSQLc7QHySf2NLh2IST7atpsC
         dMBLycOri3FIAaY8UjOsgok22mS87A/fsAJfkmCE898RADleEjNJn1dskCnikmOkdo3O
         evIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe/UlttwEidtpYQmpngy8MOrBl9STM9uGVQcAnqnd+78MGbEOxNuHIGg+myxKykI8o3TPWGueFth6IgRsvqiPW@lists.infradead.org
X-Gm-Message-State: AOJu0YzfMhA5fUE6w6lLRbnGRVtpbLA4Qjnx+hGmbKCZ2ItDZIe7wwHi
	FmyIrPH8Z31nV2GAkF+0/fbrAk7zWOvXJtwpRxlb7ZI20JoL5F0RdSA/rPJwgGgVHHs=
X-Gm-Gg: ASbGnctBblYABqldiwt1dIjdqRQcahciH0v13zA/71+ljuFy0mdpVseD4Fwsxw5X0h4
	3mMPEUJrSX5EfjiEMWA9yLUflK8FFF1FDTr/25vkWVSIBRWBsIKpaBdnLppGLsDH11lPESPV3Km
	vqNZQrt9nM0aX+LfFivWP2CadkjgnxZOcSWwWLmGcJYfLUSOP5Ez5uddMJkX3sZUUBQuAXWzCSZ
	+W+njygkRjqhHgC6VyAOV5UmaZpBURy3ulzvxsDczQ7cvSQyP77WUP2mFD7DXytu+7Onxnu39Np
	p7Wm+shsPuioIMDLacRaiUv0/mZ5WeLPW3zeaRN674q4caILMrBdv6KNhbraWFo12zv6xx+kGJm
	MLlPF7IQiPJhSc5pXQ2+/1L8TlyKcI6kZEIt0xJd5IGZeL3Vwl4aCYmggsDOTrEqY38fLP2r1BT
	kUFZrUz7Zp1aVaax/meHmXDjWQbJqV4aJPcrPvUg==
X-Google-Smtp-Source: AGHT+IGudErotX87fbHUUlOW8PhZW3gWYwQkQZjuqEBocyqBpJK6gFfGLxWRlsagEj71JpNhWFJU5g==
X-Received: by 2002:a05:620a:6:b0:891:c59a:a9c0 with SMTP id af79cd13be357-891c59aac34mr254639885a.5.1760803901491;
        Sat, 18 Oct 2025 09:11:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cefba919sm189319285a.32.2025.10.18.09.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 09:11:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251010-s2mpg10-clk-v1-1-dafb5d179395@linaro.org>
References: <20251010-s2mpg10-clk-v1-1-dafb5d179395@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: gs101-pixel-common: add node for
 s2mpg10 / clock
Message-Id: <176080389770.37784.9004691258148372039.b4-ty@linaro.org>
Date: Sat, 18 Oct 2025 18:11:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_091143_212782_0A2B4DA9 
X-CRM114-Status: UNSURE (   8.13  )
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


On Fri, 10 Oct 2025 16:56:26 +0100, André Draszik wrote:
> On Pixel 6 (and Pro), a Samsung S2MPG10 is used as main PMIC, which
> contains the following functional blocks:
>     * common / speedy interface
>     * regulators
>     * 3 clock outputs
>     * RTC
>     * power meters
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101-pixel-common: add node for s2mpg10 / clock
      https://git.kernel.org/krzk/linux/c/f409bd20f0a94ca4eece7eb919b800e013abc043

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


