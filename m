Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FD3C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQ7tuwuM2LFYHZnclmNcrhhek280gEdNY36z2AcaptY=; b=H3Sc8WrvU1ZF19GMeZMhBWzgUx
	4i4JAbcKT1MYt5GJyeCpBHqggXBPUJMHkJ6D/a+uZVI39hff2uYYJXSBuZMke6Sn6/7SbuU8CoZry
	9rkdWPWrQ4mBx+vbxR9Lpm1VvbXfDDoTaZCcUaogSSgRT8YFLKd0JBaE8B6hFO3DxDtiRySRJ2HdN
	6O/6u2ZdR2RqOgMIE0aKNGK+OApRMoHaHh6gtXaw3RdY8djsjo4Kc7k/qeC/LIsEYiNSEq2BHvAos
	vXCm9SEWKleK68GK3DZtrPpXMUeuHP9n+5b7Ixb5QQwtJ5Yn30afak4XGzIAWAJhlYyVaJ/xDm5Re
	DjALn/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBdBv-00000005jeb-2mcQ;
	Sun, 04 May 2025 17:31:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd5q-00000005igw-1xFb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:25:40 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso194616f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 10:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746379533; x=1746984333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ7tuwuM2LFYHZnclmNcrhhek280gEdNY36z2AcaptY=;
        b=Z2jytpdX4YG/9WhZ0ScI5UqsND50jiJr+QtbufVyQmEBEazKLJIRuXeOZA+6HFKtyz
         aYJ8lpqCgQKCnymEb9Ka2MM40TqV3MahEMlsKLknCHh4i41eonJmccHehqVJmajhR5e/
         uw7WiV3x++cjN5y67l6fH0Dm9T+n/k/tB+yMN42IYp18N/NqjofIq1mja2YaxqrcahDR
         9ojts2AljG73l1CrqhtzLnwYfGT8/2f7k6RjnTq/N89BdoRsPPSEayqCSZKPL8L/yBLi
         1PmvAh7AOPjbrPfYEPenl7M3ixFCxlXw+wSQW6S+4HWBMgN2JcqU8E+bGNYdJeBruXT4
         OD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379533; x=1746984333;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ7tuwuM2LFYHZnclmNcrhhek280gEdNY36z2AcaptY=;
        b=fOiTHJ16A+O5OHGuIO93s5XLmVfcEeS37QKMmPGEVK1itnFuOe9Zy8pYdXI66bsDEi
         xcoUhkQg+Y/UBGNWMd/b58jO/iA/pcaHny4k6AhngOjpdiYZeYQUOjBk22BwST6NJ0Wp
         h7ZUJZAyLk9Y4d6ER7fO8IFoYdfQ+ZCBEUyhLClHvnkwiC1EN7pHoGvMVqAi1TzEQceI
         DiCwef2Ya5RrLM8ez7hGzsv85z3avCm67cogdriWVC5oIWQMWy1xss5uePaxkqIy3UFr
         NqT42FSVhXVak1+nV0RosnKX8aOytR7PYwr1MhS5ILet+aVYgwODrtVnOclWyJpi/aVM
         fpMg==
X-Forwarded-Encrypted: i=1; AJvYcCWAcwj0RuMZJBUwKP8mZaRQpnlPCrRKuO3q5GmjNJE4VPBBLdGgjwDvU8IOdNOXqRu3NZsM7iqlPIsPtj/wYh9N@lists.infradead.org
X-Gm-Message-State: AOJu0YyaZSWoc/mXfDaMTLWpKLN19LwDY/5soCH3WYnGfmJarYBy3Ra7
	pLUxZxqd/zEq5Kywlkib9KA7/cP7Xjfdn5wNz4C5OwbF75SJ/UmJhEAI6rVC48DIbWshCLv/Ose
	N
X-Gm-Gg: ASbGncuiZ+lUsZUajRBWkF4u7xDKXr1knYN2EAeKvUv2zlqpfeQ1NiB46NXMBhz0ErY
	nb+pBLKqFeOL10oMekujxi7PoJwd4ZGutpQcmC7/HZlQbZiB46zq9kCuMwAt6tFWPjtnrdylcAr
	N8NeG8SE+TxWScesIBQU3CfQ6mGEWMnq5C7AcY7L5u/oComO2WG2W/c4N2wVSnC4cdDvsMBE6QG
	sqB+WLupWg14KK1kJSpoVIuvfMlsVHrEbN8p6Z+nK7wTFHNa3vJph7N84a2Vp02IMjOMcacNF/c
	dogIL5zhr9x8jFp3EeLdV/x20JDv78VN/gGbbjjrFat/hcv6eWD/7ie2+h0=
X-Google-Smtp-Source: AGHT+IGOU2D1HDiQWNlXLDQ7WFeRlkZ1+eYoBamEUGxGy1/DSVrQ46pnltTWn2EXYZd+XJi5rlymwA==
X-Received: by 2002:a05:600c:1e1c:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-441bbf4af50mr34682955e9.9.1746379532792;
        Sun, 04 May 2025 10:25:32 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe9dsm7896332f8f.71.2025.05.04.10.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:25:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250503-wmt-soc-driver-v3-3-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
 <20250503-wmt-soc-driver-v3-3-2daa9056fa10@gmail.com>
Subject: Re: (subset) [PATCH v3 3/3] ARM: dts: vt8500: add DT nodes for the
 system config ID register
Message-Id: <174637953156.102764.4565832687036270187.b4-ty@linaro.org>
Date: Sun, 04 May 2025 19:25:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_102534_509658_7CF0D395 
X-CRM114-Status: UNSURE (   8.42  )
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


On Sat, 03 May 2025 15:52:33 +0400, Alexey Charkov wrote:
> Every VIA/WonderMedia SoC has a 32-bit chip ID register at the
> MMIO address 0xd8120000. Add respective device tree nodes to let
> the system code access it at runtime for the selection of appropriate
> hardware quirks where needed.
> 
> 

Applied, thanks!

[3/3] ARM: dts: vt8500: add DT nodes for the system config ID register
      https://git.kernel.org/krzk/linux-dt/c/a43a6092e33d6a5827114c797a2951c092851931

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


