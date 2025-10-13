Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79140CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6Z1PIUihZ4CoSKz9QE5gP7AidgQI+jfdksvedwdF34=; b=Fsgybnn8dXnSmXmYBsd9Wu1/0i
	ky2th0Nbhs996L5HMP/OZb1PNEtyU1x/upaoTpLXo4epA3FvEO08D9HUBeawofT9b9FDSEWT7Vq4T
	dWHZ3MMj4+YCWzlJiS9m4B1zYjyfZ7NWNJpyORszbz7UL0Jyxe+GGAJePv2sMSOh+TIxA/pscWULV
	hEzdvLuDDtbgtQeoSMkhOG8cXUtxBz5wOcqB+3iVK6Gu3SaYBKCehnCgIKB5KZWZtYgYYltRuahUo
	0M4IcsH7LLJIX6cRjfHarY6gQeiNRXV5HjEns8Rck71ScAwqVV8f+i2kcOt2lYL+4PkPtX6WBsLsc
	eY9zu6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wN-0000000C0a7-2psP;
	Mon, 13 Oct 2025 01:01:31 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wJ-0000000C0Zn-224j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:01:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-789b93e9971so286434b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317286; x=1760922086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6Z1PIUihZ4CoSKz9QE5gP7AidgQI+jfdksvedwdF34=;
        b=FYYLNcVJvaO5mKVM5m6l5xy2U2/ZeF01Hj0tGgCVC35/OVkJP6bQYUXle/TtJYqSoj
         njM9OoCuFbW5prKteIt+v3iWL5HLUuHha6mKsGRDQcEKoBl9BuIMWicUrjlduAsXtg4q
         uxfI86dVdT7cmtWqgLZs0ASLSRuJKMiVIRhEj3Pz43RnIRjHSM2etCdkwvNfe98mpPIt
         eh43abBoiwy479294+biihYv+zTEyLdmAQg+qeDnia3TADoW8xAL4J01hGM7pnuuLMGa
         iAVLSs/rdbtuiAHVwaeAJAJCMuXnDUOx54jAQjQsEkjQiOdm3M5yd96M7X0EsYjkg+F6
         CY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317286; x=1760922086;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6Z1PIUihZ4CoSKz9QE5gP7AidgQI+jfdksvedwdF34=;
        b=e6Z0N2Q7w4LwYmTD7FWK+AciPYEimifILDhmMDzDB18ED9CE2iQ948XRYYoARlU3jA
         4Fck/a/sONo0A+dCpDgPs/NIvBA+OD9KkfHNrQ5XSE4lwAZzVGLuymr9kdavdaBDkIpx
         sgpCBAkgyq6hYjdGlDoXDZzhjkKK8CrChNtlibDAcNkeggg/2yozzfqBYaahVrPxGth4
         AzOZ2Wqqfe/90Wb69PD6HT71w1G84ijKqHLYYhv5IcxDzaPjZp9aaouEfWQFh62TpFBa
         caqAYjeoP/m4XEPIbayIwiC0DyMI68fxtjjHRd1yKlUZqOV/yfP+EjI+bfqb0jNlsEpN
         250w==
X-Forwarded-Encrypted: i=1; AJvYcCVH6EHLS/yVBQWBAP1HZGf8ZS3SnwDWAiNb037kNUCTk/ygDZKC3VbbNmrEr/KjQuRkKC0qgkLrPzihPgtjdlgG@lists.infradead.org
X-Gm-Message-State: AOJu0YzdJeRxd/uGl8Max6Ykfuh7nsKeNK0WmFbDOUvGiDIoHxA9Omq8
	2Hu58OGMeOTjIHP7xtnUde8bSDD2qDqzIKdCOkPTjigWYGUVsKIQDNGzMOxuFSqQpfQ=
X-Gm-Gg: ASbGncuPfyR3Pe22M7S8QHhQHFxKuae/gfGDAUfvnZUQFyK6J2hxuovxszY1ndDDGYx
	d7J6yl2uqHc23bHm4oUiZ/VSFY3hSH4XEtIjkMpS2onT3C99iL/VoD/QrEeNftGAeZwlxcotjLw
	9xO1Y31G8SmU8naTqTR+iMwZLJgw+RP/ACGjrihHfbmEh67AjXAMzxXgzIW1/5PMcHUvSatV807
	bEq6qhGbHzIIRrGHyA5AJR4kjvjHAzVHqShrbyxGnX7dN9SX+NH0Tb3J/NOiZLOarlqYF2Uxru2
	NVs3LxnI1uOn3f2vwKrsg8g1ggUrbX+DD5xGWNsQ8ImwzfDN6zFMnV5V2yfr4HY4p5HPJWK2jqm
	VPqpGmqIQ9XZm774GuXbnVtRJa97Dq+GYHmdd9uWr5y3/pDrRvIWV/7GONw5l
X-Google-Smtp-Source: AGHT+IH4f79PGF3pwTJWa+RZTaKvtY1wF99tutuYa9r5c4lDGKIA1fkdUmCffSl7ZEfXNQxSTp20Eg==
X-Received: by 2002:a05:6a00:39aa:b0:781:1f5e:8bc4 with SMTP id d2e1a72fcca58-79387a281famr10486681b3a.6.1760317286563;
        Sun, 12 Oct 2025 18:01:26 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
References: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: google,gs101-clock: add
 power-domains
Message-Id: <176031728187.32330.16757640384726154867.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_180127_559202_8D52C370 
X-CRM114-Status: UNSURE (   7.07  )
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


On Tue, 07 Oct 2025 17:03:10 +0100, André Draszik wrote:
> The CMU can be part of a power domain, so we need to allow the relevant
> property 'power-domains'.
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: google,gs101-clock: add power-domains
      https://git.kernel.org/krzk/linux/c/8c644749ab6e42f51fce82e3325f58ffb70f87b3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


