Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A620CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06zgkTdvLdS4MNITPMlUpp0m9/L1LkTY9remEcOcFr4=; b=uo9zDIrfZgrNCsu+ByP5KWPf4c
	VxmhyuJd1Bl/ArM/RRRiFPhzIPAfLpJyANIuI+L4iZCZsSKcU+eK2niTphFa/F+4s+6izENa2pM4s
	8qWWsknt4ZlP3yPJPuP0Q9qTgeF1sex7z7gXd98vf7ijxc0Drh+hDjElmYZ/xyQGxxVdbhYCLpUab
	XG0U2bB2PzNyK5Dbh3OCWhPO4pWZBeyej1o52kU7Dt8OwdabYYLg1o4RvtYXBX90XmSV4GZYn3qCg
	RDdNnGl8ud78iwRLpUNUuf6ALfmNu2385PEqxRmQ+hy57VAC9TlmsycBtdV1Q6hKJnjsn7u5cUlFO
	TOYIV38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoB-0000000C6Eb-3n5J;
	Mon, 20 Oct 2025 06:55:55 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjo9-0000000C6DS-2zRr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:55:55 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b6a29291cebso8806966b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943351; x=1761548151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06zgkTdvLdS4MNITPMlUpp0m9/L1LkTY9remEcOcFr4=;
        b=x+DwsB+enIdk3Fic2OCiU7kMwK/ofm91x2c/D1GV51FJbPO5NGWTnKaKXuXs50x7G1
         rrodSXeYwJ9KnOsmeib/7qLKcFiRNRp7ZpznN3cCSXeA2Ff/81i9i735As6bsVT+1g+Z
         Xn1RgdEchkcMKqxps+sxPKsUfG4dFn91nYmGUMVzWIdXSyZ1dq5ZZer3lLnJEkwujVIg
         5R2+/4ZZ2enPUqwg3XfH+zcyNuYO+oerTJzT35QchRSTGrIO1pimK5d7Yg+hccn+FZOl
         4/1LHABuoY2CkIAhdfR9j1VejPKqyER2mDP3EiMcjCTvyfzUy7hFMnHBe1yKCSgEB9kG
         Mwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943351; x=1761548151;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06zgkTdvLdS4MNITPMlUpp0m9/L1LkTY9remEcOcFr4=;
        b=CDpV7Xqe5Qm24p7lb5Td9gtQjhredGWIVmuV6BuMtKFFq++YbMS78wA2aZsmycBuNx
         +HMEfbx2gasJwTYsyY4Tv78vS6KJ//Tp8PNW7VqUqw2EC9nMNpJjeZldMdpCZe5/9EOF
         WoQKT0SnJ5yyEbPn7frbtOv8UixznC80IXkJzvXPuTzc2VAF/+ywVR14eKJ75Fvpe7Di
         OZqZqjtSb+PzUAY0iRpoflCqXiSUBL+SufilsMocacwTrW3Bv6+6NycLpN5TAcrlZkeK
         AadBSPI5vtTk8xRG9h/GLjtkxrmVMwHPky/9svkgs36T5uxgU2xqmJcSU4AlRmzvUz6l
         1dMw==
X-Forwarded-Encrypted: i=1; AJvYcCWaay7M1G0y3NB5rulP6oek7Mr5A6SJl0cHDdig1u3LXwtTS0HYdMxAglEMfvOfFNnpAE75WuATs3zJe8YwE2AL@lists.infradead.org
X-Gm-Message-State: AOJu0YzQqqu42mfip/PYBRe5IerDimw01tCK7nbOI1I+MPRBiSUVbic6
	9Ex86BgTGCQQMCwig48EYgRenJyNl8EC1uH0jPpj5NoFgdSjat+HPunQrn4Z8sBlrbX0neR4K9h
	dzs9w
X-Gm-Gg: ASbGncsq8u9d36Zzs/am38vxtT2qexA4m3+5TBTlAKYgXSH4+DumQ1DBxrhBHoOSDG4
	EhYLu2vk7rb0kmk7pADRxEZ34cuJ8BM2I1aN9FnuX4wfjECmHaxU/r5aM1K+L3liMIT/sIRRlFM
	CnOUlKPAFkj1XpPuZ9f8Kp+PAfW5WkfTEl2cX9Tk/fP2UcwZmTbI3k/dXJJ//LtYKmk4eVXOJWj
	Hn1iLkFmVAXVa6KDOEskewphljKeYFfOS+mNs+6d8aAASb3qGhVZ2ZtxBJ/H3OklmpvvNy2j/US
	Y3/vl+R9kNtRKmR/fcBtQltiFCY2NYxIfruFgd23oqcpkLtKI7zSyWQwUpEvM+dmytRexsIutvE
	DHkJFR+9h0Xz7BUmMytiYOC+2Im+SXYsnY7BymXQPIfZlSEIvikGbx0YbZwZoI9w0b7Z1LJHVX8
	HNaSFXjkZNTrQ7iR5QC2NBq/bEig8=
X-Google-Smtp-Source: AGHT+IHAht6KxB0Ngh4X743mU/9uv/8gNjvcOQoHdUUnr/RK7iqnks8KTRJG0OT6ymzSEGD6XZTvrw==
X-Received: by 2002:a17:907:7f8a:b0:b50:891f:66ae with SMTP id a640c23a62f3a-b6474639388mr840879066b.9.1760943351216;
        Sun, 19 Oct 2025 23:55:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-1-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-1-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 1/6] dt-bindings: firmware:
 google,gs101-acpm-ipc: add ACPM clocks
Message-Id: <176094334888.18498.257368855953115301.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_235553_772948_78F47C34 
X-CRM114-Status: UNSURE (   9.04  )
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


On Fri, 10 Oct 2025 12:46:31 +0000, Tudor Ambarus wrote:
> The firmware exposes clocks that can be controlled via the
> Alive Clock and Power Manager (ACPM) interface.
> 
> Make the ACPM node a clock provider by adding the mandatory
> "#clock-cells" property, which allows devices to reference its
> clock outputs.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      https://git.kernel.org/krzk/linux/c/83c4e3c39b2b55afe56ed0d14b93b5f219350c81

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


