Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BC0C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gs9qjJWfXtPIqCNTFhtaejIkA6pnbjDMF0lYDQwceAc=; b=MpVQG/oDTFvPYGgWS9a3zvWpsU
	G9S6PcHDZ3qOAswIlvrTVx/rwhRDNEXFX7F8bA+VINGBxiMSdkMY2qgou1UhMmsNU8vkAIaLnqAJD
	a7HbdtX/v3E5EYuGQ2GJyO7PraNgLs26oJ08mLCHzM2aX5Hl5AuD8CpVrX4fcz02Hg74LrLKV8uhO
	Y0W4CqDp+W6x+R+EHSsrbNPfL5ELbwgo2tPKsIdjIhxELtB/dtsfnGSnv96ntdlCetALLZFGEfMnb
	JZEGEm99OseXTprEUDWGSvUMyYgi+u7NYnK/d5wIU36+lkibFsgCy/DmrkBqOQy4pZt66jR/AA9cJ
	fJLuywqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMtm-00000008XNe-3E2r;
	Mon, 12 May 2025 06:44:26 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMnx-00000008WSj-1uzR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 06:38:26 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad218ed3cf3so44894466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747031904; x=1747636704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gs9qjJWfXtPIqCNTFhtaejIkA6pnbjDMF0lYDQwceAc=;
        b=C80FbWvy2Gbms7FqRJBWjqcHJQptN42Zqa9POcVYxhXIroYnmJDLyhSU8fwTZEnyt+
         wfR20NJwJmFnJcw3fAYIPRkEWVV9G0UuZ6yoAWw/BxpBT1dl1ZOuLjSLdkKXTsQqVE1G
         FYy1gFMxKOipL/lbEZixw2HmVUnBBC1ilczifqcY0CF14ECH/Q1DBFdqA9/7jYcjs5LR
         La7SlXptPHiEt86GX1fMZ5iyv4fynnkMcUrAL/bxLHe3mgbaKT4HsvL5igHg6HnyRK3n
         w8qRgRBbd7ZLftzI9dpPJw4Hv9MwKnWKX+qq8lFcinH/1+IdGQb/UpebtU0a3vbH5c48
         k7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031904; x=1747636704;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gs9qjJWfXtPIqCNTFhtaejIkA6pnbjDMF0lYDQwceAc=;
        b=o/uqM/m8U8lBSdOI/3AKwNXUAjw+qiHBqTT3CkYGce4TPcTN88GN38N4z5crkmPJ/0
         MGTYcmKAfCJv/jwQ9CcFaIb4/27oWcjX7VbeUyNZHmZFu5roPOg8AZEUkbHgL0v2Uvyw
         CYxWE+S485af5kxhI3J1UcjpO4SbRXC+ADZRqXpHTAbYDTnN7xc5MkRUTssYDW+wojL8
         ykKGLQNAx2MDWL4vkP3s1EHRwwsvgwe8u7+6WPQYMaRfX5yXEZ5IyIgJvGQWb7zSYRIM
         Dno1p0ASgJhxqsk5KtehOiTnxvY1kD48WraiDZZeW9XXfMVhi8G0X+1YmTa/DGAMfIBy
         9WZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmFBeN4chAJOldFRaq7mG3ZoDXVqnGh6bVK/xH/CLNo402Qpl89oPeqckU+brJNqLcWCLkKcfxMlCj9em4BDbq@lists.infradead.org
X-Gm-Message-State: AOJu0YyWrNdlpoR8kjyBHQgURyqhfQiMqsl/lDMY6IigX6eO0l1ha9E+
	17snRU4niUOzFTq3XiNld7QpWWdNl1CKM1F6Yd3jGUg4tvaLGp8A8p/z4OAMxb8=
X-Gm-Gg: ASbGncv+hbjsRW5SEYV/E6HXcrYCbRAshDlcvXjmOIlbfbbl1g9964r0G7aoWnMj2h4
	jI+Tr95DPeg6lbXG25iDLRLOGBt0kVeDekrQziHLAl+YwbMcLhxJd2Ik24E5M/8rmijaICG6qct
	Bg9UVeEP3Ty+RW5m9jl/rHMQmXkUedbydbMzFmmydpvt2YNlFsr6YPdePOoXuGoJjR0WmeuOH6L
	JeuXGFwRoWNGPORQdK6yRFmP6cChxJSs5yEZlXb/1C34jkU9FcmNagoo/oORCTHa6Jc3GkQVjda
	kcLJrtdqibU8pByTUdx81RuXlVBPTs7qzhexbCQZuUQG/ff2IJhysbZQ68cz0KcwwKEtT7IBHdv
	okxlcpQ==
X-Google-Smtp-Source: AGHT+IHvnruoQf/zsWKz811qCbdXO6vDPHDtBmgtxIKDoHCWYrcOhWQOhDK0kiHkWvqsK39CY/vV6A==
X-Received: by 2002:a17:906:81c5:b0:ad2:20bb:1cf4 with SMTP id a640c23a62f3a-ad220bb20abmr329227966b.15.1747031903658;
        Sun, 11 May 2025 23:38:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21985342dsm560597966b.169.2025.05.11.23.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:38:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 sunyeal.hong@samsung.com, Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com, 
 stable <stable@kernel.org>
In-Reply-To: <20250506080154.3995512-1-pritam.sutar@samsung.com>
References: <CGME20250506075413epcas5p2ce0db6da9f359e9c3bb16b03c1a5eb4f@epcas5p2.samsung.com>
 <20250506080154.3995512-1-pritam.sutar@samsung.com>
Subject: Re: [PATCH v2] clk: samsung: correct clock summary for hsi1 block
Message-Id: <174703190180.30824.7869810440516124016.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_233825_539316_AC8EAB47 
X-CRM114-Status: UNSURE (   6.98  )
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


On Tue, 06 May 2025 13:31:54 +0530, Pritam Manohar Sutar wrote:
> clk_summary shows wrong value for "mout_hsi1_usbdrd_user".
> It shows 400Mhz instead of 40Mhz as below.
> 
> dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
>   mout_hsi1_usbdrd_user     0 0 0 400000000 0 0 50000 Y ...
>     dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: correct clock summary for hsi1 block
      https://git.kernel.org/krzk/linux/c/81214185e7e1fc6dfc8661a574c457accaf9a5a4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


