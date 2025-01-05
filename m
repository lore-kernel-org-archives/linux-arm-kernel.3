Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65442E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nelteoiqxNRf7ioY30lP7anjKbjLjK5qZE2TjaLHA9o=; b=sO1MHHpUUU+aHagngVH/v0069I
	RWvi3cPupMjqoNeaxIv6SK4ZpQ1uEgazI2x4CjR2zBpj7RG+b/MxyFsdSMQVuIWw7HifnPdxG7jPL
	9qnR8mPitseljmDsXUNnOC+Xj410OE6QOKgFpkNNjsatKC64kQBy2jJdZvQfucOBpMBk9++Mszl7e
	RR1nej0EGT6MBRXkzXOPk4fJOUIk46QsLA8LBIl2cbAPAnjCU4lEy7sjLJFLsWA9wzSJg2ubfCAwn
	Oa3It3eCQvARZHKjf4n3ReByPYvHYy6g/ju6yqQ5d0Nzqd9FKrQaqDw0aEcruNNXhgLM1YA/n2owP
	ftiM3fkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUMsP-0000000GbOV-2DKB;
	Sun, 05 Jan 2025 09:24:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUMq6-0000000Gb5l-0bNi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:22:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3862e570832so1532873f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 01:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736068948; x=1736673748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nelteoiqxNRf7ioY30lP7anjKbjLjK5qZE2TjaLHA9o=;
        b=nVF261hhuZBuuUr/rlsBavkyOtw8Lg5RtiEODcmjlf7GPo5pYqBxbXAW0WEj8+nixy
         NwRqvIofp0XgDDgrdyiqSBVtgQrxkX65mFiva4xb4Gt8vbPqk9CTotyHmqpW78+22ix1
         RQK0cmcrileI2R+1IcBk8xluKAhN4IJ/EsqdnOqaXDdninrZl3yaPuzAtS9496FBnJqT
         s4q8Hgr5+DwaBFVqgMD1/11ok/YWmoHZiZE6Mjiz5l/4hmlpyt/RtHDVQ3SXnKqimXk0
         Zy083Byup864933f30+3lS1v7WL284mcWKy0M4ZoRUUJAEfQFbm1QZh270+joeYU53/T
         Khrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736068948; x=1736673748;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nelteoiqxNRf7ioY30lP7anjKbjLjK5qZE2TjaLHA9o=;
        b=qTgA2Qq+peFAN7r5beLc6f0qn9Twoaj8D9Cy9uZUnainhMJnlE2AxW6QfcrslAVB03
         HgPT6mX2eP7eYZieXIm4jaHA7Ttfj8xxmz3jpyMzwey17d211Xn8sHBjin+gesB7DFbm
         jMpKgsFKnxR8eM9lewTT3zHKSZdxpxoVrgvp5rAJPnw9znAgXwEvQk4SpnZJT3GICl87
         KgrVvQcRLwK5uF2GDhPDS9Wr6zn4fPGeYihn4HMcuik8uroAFLiyWVfw5+0KEjwgW6zX
         pUfT7WVZvxpnOEapDOny1nAOCZqQvc7Cov1lsKNGBoyLq0EdgHxlINY6vhFGDM8QnA38
         VOPw==
X-Forwarded-Encrypted: i=1; AJvYcCVggnx6bk5T6i1frBxwwECBMaa5+qelubZdeI6r9yBNBm9nUIm0kU7SKnRHAwW7jNaJRVo4lOmcZ6qasY+dxx6D@lists.infradead.org
X-Gm-Message-State: AOJu0YzCI6cvg+snhgUC7mYLjEGJ+cqv0c3gdWSNOyrK1/fpNZ90xj00
	GSCqHZXeqNmYSgjBDsmtllsazurSuPbcmGBj6QPVVH2AP5aNU0axXfEZZCxhxU4=
X-Gm-Gg: ASbGncvpYGXnvQj2AZcuygaxh/swU8wytScQP48+JqQczMhtRXdlg4rIJS6DoGYzZnX
	aN9EepW/w6T8giQp4WDD70YmQpVbkBI6KfzbJaAA9smGYDTvrlubX5QVpt7Ya4+F+UcperYZWKJ
	lDuko/o7ytCbrKZP8ECduGTJxFbmPBGWRvGJ1yj33Ykk4xfRrnpcXbg9CJghU9c1C0YqYdrn1y8
	WGel0rh4svdxTt0kbr3+hORXoQkBX1EwcqzOIv7rheEai7oxqtvdu/VswAVYKfXLpJinH+Y
X-Google-Smtp-Source: AGHT+IGDynZTHl8e5RBLJUpj+lO7O7uXhax+G2o9Ltlfc8YfdRjCDTeADBI/fQ0DJuPgpHoXHMUDKQ==
X-Received: by 2002:a05:600c:5127:b0:434:a339:ec67 with SMTP id 5b1f17b1804b1-43668642e65mr197803305e9.3.1736068948502;
        Sun, 05 Jan 2025 01:22:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200ae5sm533469405e9.17.2025.01.05.01.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 01:22:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250104162915.332005-2-ivo.ivanov.ivanov1@gmail.com>
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
 <20250104162915.332005-2-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: soc: samsung:
 exynos-sysreg: add sysreg compatibles for exynos8895
Message-Id: <173606894714.9463.3099242543235588769.b4-ty@linaro.org>
Date: Sun, 05 Jan 2025 10:22:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_012230_184421_ED1DBE70 
X-CRM114-Status: UNSURE (   7.27  )
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


On Sat, 04 Jan 2025 18:29:13 +0200, Ivaylo Ivanov wrote:
> Exynos8895 has four different SYSREG controllers, add dedicated
> compatibles for them to the documentation. They also require clocks.
> 
> 

Applied, thanks!

[1/3] dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos8895
      https://git.kernel.org/krzk/linux/c/38405d3825d883b9e6ae680c14b530f79709533e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


