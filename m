Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C981CCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUVOYaTKR2BcmefABwOjJaCKklr+SYDWM8eaXKmt/FA=; b=wenovUUKSlPyhfkAfljn2ikbZs
	3D5ITEKESB4zL6+wfnD6IoPDlsb8Y3+jDt7jNCakXI2XHBOhPLT1VPQduKV42E0SPyZcWVHm1AjCr
	Cqnl9RDg+fONuoC5SrTcVhnsvh/h6XW35/8MdcbNuiepEtiHnQEgKtwRrA2mjD2Kq44cKvaAR0H09
	6tLZQY4WEA9ojW8Skob75yNDL9RC7e1GKdtlWJEnTArcKuhPtRivhJFWj5gCxoYQVgCUZustpoAe2
	FIebdNzxLOoIQh1YQINEesxSqANibEIO72epsZZeNxvxDUMYoOBKc3JZQDHLszaFxB+q6CtLhajV2
	0LPNHRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCrg-0000000CxJb-3iol;
	Thu, 04 Sep 2025 16:31:12 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAHy-0000000ByfK-0uTK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:46:11 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b041264542eso12368366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993568; x=1757598368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUVOYaTKR2BcmefABwOjJaCKklr+SYDWM8eaXKmt/FA=;
        b=rzrtOu/YeD5bctEWW7Nbjyh5ZRNmraLmdqUZ5+pudc23bbwwXYsY8xDG+PqBDAI+TU
         5yKKInrlJg57skob9F6zm7GG8dWbuUDSDi00UZnwjSnMXMs2SG30zYtcwnH7XrUByxLh
         lnEMnoI1Z3Wxu2Yn3kuqeiz6fhK8Jz1+pTJtj5TkrXxqLTo2r/dOyIYhiNCAlGofslT2
         YZ+xXUHqx1kyXTiQIGk0xhkYnQVBHcmDePuExwkDnD3B1+IulSUL7QUXFqkLgLL1cUfr
         RNzCYswF0XdSPXYL7CUpPsDQ+N0elzBFg5dfm/uw7YP05F57ceriZ/ApODr/yJPQ+8f/
         2xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993568; x=1757598368;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUVOYaTKR2BcmefABwOjJaCKklr+SYDWM8eaXKmt/FA=;
        b=FAJsnQTOJkWYQLHnyEADytuTQerlfpa3/ueCQS7eLJGYrwE86JsMGXjVlxq+OzGpEE
         R++mTsYtGe+Qtrl9FboaFZOMl6OUP33OBqekaEauqkQTEip3HklNRrV6rI1UTDFcEtz9
         8cyrmPRTEBGltDo6XwYucY5i3iMclC8CFyWjRaWKbyQZHA3qp5DfSN17rHu2Ty89mJW6
         /dmExbV2v/z+wFJpExTZgWJNyQN0RNfcjcABZDgg85drh/vsU+mxxhpHap8GJRvw6IA+
         eYeXPD113RJBkFa0Vlal7yHhvPmMPuPoVeddjd8FGCpRqWMA5LEVSlMhg3mVTE1Pn3h3
         D/9w==
X-Forwarded-Encrypted: i=1; AJvYcCVw2/NEqzb64KfWi98FeW+HxXETM6Y823CMMZmPt9sUIxKS8PYHExSaL45Y5JUWV3R6dj8XmuyZqMV9bv8nMD69@lists.infradead.org
X-Gm-Message-State: AOJu0Yyil1bniDFFTX7RFFgzaxe8XH+rqo/8pvCohoRYK+Q/A3/3yYHl
	VaSXBriO8AU96+JRDtlZaxqw2QXek7lkrIKKKhOvGCXVXehKByiClMIC4/UXEF7gI3g=
X-Gm-Gg: ASbGncuO6YDmmF1+Z8hgDV6Wv+JQbTX+1EN7eLIqWn1OiU2L2YvcWLZLLeKX6SEEsLi
	I0OylHDeos8FJ02YqX1MvhP9DG3z+3K/9/ci2w6pqI0owXoYFRf5e0eFU/N9rksOEEB6YNDasfe
	CRhV2gpo5vrTIaB6NrhfmPC1p//DBehUtzwGwQmoEhgQKGzcF067+s96eUyWFDmI4o1diELMhPG
	GAt7URUoJASvknM7ORxXY9IOPDrRpL/WsAiXLpIkLHsqkf/897V7hcEQUw3C3T9Yz8MDYTELSko
	HaEK0y8R55UdCYobWIVxNkXjPP31nGGCgx0fqsjiTz1/vlYUEVlAUb4bp+K5j9GryRF/fbesDMv
	RBamQN47ZrEKwk+mRfgXlp5r6wVXg67Lk9HJQsIk=
X-Google-Smtp-Source: AGHT+IHR5XB2P+9jpNOyHwbkAht1wt06oHD5IV8g09IEd8azHiDpTqXuJszFXYr9m5Jzcbq7eoSIFg==
X-Received: by 2002:a17:907:26c3:b0:af9:3758:a85a with SMTP id a640c23a62f3a-aff0ee81aa2mr1052139466b.5.1756993568421;
        Thu, 04 Sep 2025 06:46:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, shradha.t@samsung.com, inbaraj.e@samsung.com, 
 swathi.ks@samsung.com, hrishikesh.d@samsung.com, dj76.yang@samsung.com, 
 hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250901051926.59970-4-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8@epcas5p4.samsung.com>
 <20250901051926.59970-4-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 3/6] dt-bindings: arm: axis: Add ARTPEC-8
 grizzly board
Message-Id: <175699356578.171312.4960170053878609185.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_064610_283083_4ADA9574 
X-CRM114-Status: UNSURE (   6.03  )
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


On Mon, 01 Sep 2025 10:49:23 +0530, Ravi Patel wrote:
> Document the Axis ARTPEC-8 SoC binding and the grizzly board
> which uses ARTPEC-8 SoC.
> 
> 

Applied, thanks!

[3/6] dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
      https://git.kernel.org/krzk/linux/c/604a932fa924e7b15be47c6208a305f289cfa309

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


