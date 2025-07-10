Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0822BC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8z/J1LwddlPoVhpvDuP4Jjqir3C1G5kWxc1+n6Juhwc=; b=tV8u192aBkXMw6rKLucaoMj8bX
	m0Y/rsYrk6Ay6kr+sLDqYxLp12HGnETByVhfpry01OS2ZYwkK5uT7NeKafeiZGGEgFlYEO8koWr/0
	BPJtdOG2UAkjYGAhbS2fW8ourui+sVmElnQAQrHUCdi2kS7Y14PPqXfGuDlgbXPWEpNbqTLtf0TyQ
	/0Gutw9uNvkXBycDGVDZto64EXC+cwi2BksVbVYF22rUt+04Up8tPZWGGy6366w0ew2JF43gbaODX
	vJ7a2z4AOTFdLo6/xD5tWyRRhoAtpAi7GSP0kz/98DXwRiHaRP5TsgCG46fCcq/XlQrC7XHiGpK+F
	fq41zciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlXL-0000000Ayu3-1swS;
	Thu, 10 Jul 2025 07:17:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkXA-0000000ApWg-1VOQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:13:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so5266065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 23:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752128007; x=1752732807; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8z/J1LwddlPoVhpvDuP4Jjqir3C1G5kWxc1+n6Juhwc=;
        b=mB4E6yx0VeO3d24gDIhN1w4zI9yosuYWXrH77A1ShbPCh+i4ICdUfYl4lAId/N1D5Y
         BEfcZHw4PJMkpavic2wCDO8NJJLGHsfEjz5PIJ6cbkqSjgMRql8uocVpG/nMKYgETXth
         41okQDFK2Hve8l5NBNAWHth/MPpu9XkXxBWUB/S7cnlnY5a/Ow62jtWgL39NiJHH+B/z
         7JlJ+OU+47hHMYie7v9RYZYhhrgDdpWUeVaooOC+xWmtTiaz+aVfE1HT1elNN+DjxOZe
         1riBi3U3lZiL6BXGceBC5v8Mf38091F6mUkP4WKTpZ1gPw4fbU06Or3BXD1Hq0Mshgfn
         tpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752128007; x=1752732807;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8z/J1LwddlPoVhpvDuP4Jjqir3C1G5kWxc1+n6Juhwc=;
        b=EZJPIRpvIYC1aPeO5LMrdtVtSEnfYL7AltWGr2uBz3JgNh7l5v47KOnqJ6+ya9K0Hp
         Eojhrdk/vLsikJCr19yk/xRHTkqV8yWNpTqwZeyJIJDJ0WI31VyEWLk2pTN3qx5LXESr
         C2/FoRHxCT7P/KwXxNRBp4EZmjveXX9s4qs+uEOh9zJRvh/I1s2xx0JNZAll466Y/+Ol
         obAmaY2N8Ii3ceipQJiDumfRohnKj+x+5BzXZcaC0TlAaYlsrSMSc7Gn1u8yOY3ygS/9
         edRiB7nlgDa9rp3b6WrqF1j9SAt5MT0jT/TbtIuSfY48DsOia6PQAowq+BH6zHQiETv5
         H+Rg==
X-Forwarded-Encrypted: i=1; AJvYcCX7KoM9n6j8uFubyLIQfPzeyB/A46viZIi0K0mmWtLGBiapgx1ikqXDWh83v7JMJgvXSy0S27G+9zAH63hPR2JN@lists.infradead.org
X-Gm-Message-State: AOJu0YyDDhgDRGyWBFX6HHMKOLd2HVOQhDPwRfS2FuyuulDEg6EheEYm
	yiuiHBdJ6OlvMmIdFKPmWPFJlXW73IT3UCLtQdeMbyaZUMfpXnhhZfsL4E0q3gw3TuSf2+6l9S7
	vZK4T
X-Gm-Gg: ASbGncur/427aoQxkBlqipNfzD3yugc71Tow7Igtm55xOSdPe+sg8ks4Zkt0C2fNYgQ
	HmCrOoJF2/1mNvHPKkFcmFPPK/AuzCWvHu34EJyiVwovD0JXo3KFCCox9grB8lSD+1YbMkpRbIm
	67H4S4cR7y3F7J5pP45YvtAtN7JYPau1Z+MQB8u184ggKceHOZGUsoY1EXsuch2C31aDrAyQMgq
	jmdn7EL8yfNqZmEsKSXLnaqf/kkuJnUPtaWAdO3NEoTMSGiVEGTRHBrUU3ak3vF/VoYhxHltkir
	9WU5ZA/+UnwVdhreiNaJoORjXQbJutV5J66mRu+IGnyMOB/Ksdy5h77trRuZDaWzaQ==
X-Google-Smtp-Source: AGHT+IHg4xHnynLCiIdYwfhLH1O40xn1jbcOOUbuZ4D3/9/bt4jhqFWxA6m1cGXDr1jP9UbGzQIkuQ==
X-Received: by 2002:a05:600d:7:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-454db8d8cd6mr16068235e9.15.1752128006691;
        Wed, 09 Jul 2025 23:13:26 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd466154sm8854885e9.12.2025.07.09.23.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:13:26 -0700 (PDT)
Message-ID: <176473e3012018e7c6e584314fc68679ad44197c.camel@linaro.org>
Subject: Re: [PATCH v4 24/32] clk: s2mps11: add support for S2MPG10 PMIC
 clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Date: Thu, 10 Jul 2025 07:13:24 +0100
In-Reply-To: <20250409-s2mpg10-v4-24-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-24-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_231328_400005_CEC90220 
X-CRM114-Status: GOOD (  10.26  )
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

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
> existing PMIC clocks supported by this driver.
>=20
> S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping - can this patch be merged please?

Cheers,
Andre'

