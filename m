Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FEACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIqv0G7pcNUthypgI4hwrs447IkAWzrBTbrewno8Kdw=; b=jU0Rxlil6aFQ1GuK7Dl//ZKGzp
	/06JQe1B1cFzaumAwTj9k4DCj/H5jeyseY+rjX6Mu/1LqNDib/oryIz1w316Aj5ReECjj+93tZ+PS
	0S7PMwzwClcHehMquIHk2oVpTIJtqfE7knaRwYfSBJ90MehdaDG71N21F2g2EbwMh1I5FALEW3N5d
	ZzNErKO/9mlh2F0A8rKlyTpCyW1L6a+EbpQhTOejvK3lBuDN1xDnTqzkShHRsFcyx+3RZBz/TRJJL
	22trxuxuzf6PUBj0UKNf6fYgDhSBUGYnKyeuEj6TQS7qQR9Xkuv/MzV4pE7waZH2ulPP0lHVqUzO5
	Dte/BbEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAbF-0000000ADCC-2vlO;
	Sat, 18 Oct 2025 17:20:13 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAbC-0000000ADAz-39in
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 17:20:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-63c184bb78eso406935a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 10:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760808009; x=1761412809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIqv0G7pcNUthypgI4hwrs447IkAWzrBTbrewno8Kdw=;
        b=CkHT4qW0ypUnG/TPF9rqSwBmkbFnXjvWOYdWn1a2sJHR9DWs90zW3jo/rYBXKnPGJ6
         U6HNZc+nGVHGZCnuUIz13zbSTpi7afSAQSUvqQEIUl0dSqTG/I3Yg0HrelNyWPaPRhYz
         JC1RTlje3FQ9cunsBKTM2A8NIA2VuA9wSEhUMiTrKedCoqHLHZAx+GXK82WeSxaYHKW7
         cpdin9yeSfIaWfd7ec/7m+cfduVuiCK9PwxOPQr+gp0ftA444PAxxWo/AVtBCqQYcZR6
         AP5kQnNIOz0oHnoOkzdq5nZSgGgJNnLO5ixWkJJLy8/01pRnE2MY8Thp37sQO3fomDgQ
         eKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760808009; x=1761412809;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIqv0G7pcNUthypgI4hwrs447IkAWzrBTbrewno8Kdw=;
        b=amshkn04oNGPOzs709dfmb1Z5YcOnlEQTEfkKjvbFnTg0ZpWKmhQ6/yPAhS0a/gSPk
         4Gkn/IbYG2Cmvidh91rVx4e1xKigF/YRxeseyIryT+dlgovCTqMvjZAizj40Ov4hS8P3
         TqnYyiPHtBJWXeYTuL+lEMoCnwRHhcsG+Ipu5bIRBHuJ5Vrpzl9U4M+gqCMmcp7xV94E
         XlEegfDoFQVI7oF33oW5vDnXBKwm0EnMi7occ0uopam0hb97pqk3/fOg5nJPzTfrC0Ph
         lBZ3XJgREwnxcSoxowISanbFvHvqObmb+WJIZceyAvlbFO/NnBE6qX6wGfgpdjk9UoWP
         HKjw==
X-Forwarded-Encrypted: i=1; AJvYcCU6e3NCfffEj03nk7/fxw1v5jJ+F5890U9gS/qZ24RvKqv5Auq1bXmqyqEH5J1Gx0EV72ipVDdf0IxtwIGHZmym@lists.infradead.org
X-Gm-Message-State: AOJu0YzP16JhLaCLFf3ctetO2AkqLqWzdN306MzHcFZiTMyM6+scynfy
	V48vmPXUxJxdipwdkAQvfYXCX1wCD9V/LfxLVdwW8p1uQy0vYeqWpJfMkpR9oOqEqNk=
X-Gm-Gg: ASbGncvPp/czUor8CYOxLMrTkiGiCqYEwvPu4AGF6Lu8AwinijMKpFp0O+jkJkpG8jT
	FvapoXm02PRnPxvPskeWxYSK3G8Uele45HkJXO0JD4Tc0JzGFsc2b6cYNwngc/Tb9k2cdaRfU1F
	lgNpt0M1zz9SmaD1OCEuK9n9Q0B+sBVWzzOPaDVI+7NhACQ9mEjg7ilDw8fY1CyYcqFzsJvHyTO
	eV6je1lqWAzfvnPnYKt2VvLvqbbQa2sEz948pnlAsXqgOOmGj7eeMEQKKTLbVUv7XXxnc8Qdm4Y
	b1rQDdGdVx6NMczZNdZjT9GXDYLRdU/TqSLpimBJdEz2Xzt1Uk7PSBPfzBjDWAf3F3PczmewMZd
	1b0RVvaaQtBe/YuzAAAnoVISsWHBvSp1Rwqzv/q82W+bNBCAAgWFssyfJqYSc4xdq5tby/wn6z7
	O8mqUzbE+0fR7oLhLxLoaA4NNcF3A=
X-Google-Smtp-Source: AGHT+IGBcdgM0967gN/kR0xVBFnZIJCLjXA3T7puvo+DFTCpYVp/IZYsxwyj6U2svvRV5RCZd8q8fw==
X-Received: by 2002:a17:906:641:b0:b65:c8b8:144f with SMTP id a640c23a62f3a-b65c8b81515mr175092966b.6.1760808008829;
        Sat, 18 Oct 2025 10:20:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2bc7sm280666466b.16.2025.10.18.10.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:20:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/3] soc: samsung: add chipid and pmu support for
 exynos8890
Message-Id: <176080800766.47136.15583076071412742188.b4-ty@linaro.org>
Date: Sat, 18 Oct 2025 19:20:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_102010_967945_B473E063 
X-CRM114-Status: UNSURE (   8.91  )
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


On Sun, 14 Sep 2025 14:29:39 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset documents the pmu and chipid and adds support for chipid on
> exynos8890.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: soc: samsung: exynos-pmu: add exynos8890 compatible
      https://git.kernel.org/krzk/linux/c/a1d5955b288988596f1dc0f953f239e968a14c10
[2/3] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8890-chipid compatible
      https://git.kernel.org/krzk/linux/c/7319872fe0d4a623e86a0f2747b11d4f52b5a0e4
[3/3] soc: samsung: exynos-chipid: add exynos8890 SoC support
      https://git.kernel.org/krzk/linux/c/aaf9a2f487ad88298d94d32954f8ab9e8ae008d5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


