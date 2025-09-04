Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A493CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vateX41qLmBe78jZzOt63uJFfCVkgcgyVW4UPJkHk7I=; b=mpdsIgu9DZKPNU2KmHMicIiwe9
	wIXpas2LvUYUetB2OT6FzOosASJr+1T7zB6OpLHxSG5pUIiArPcBEmveGVSIsYE1Ydlkojt1kSmF4
	5lfUIssSOH4z38pvqAjU3iWOmC6/PfaysZW3GzMz0YGZp0XE3Y/91yuKLtKMAx8SmVKRt1c29UTu5
	QW9bgxZkgGREw8aDmT2f2uVIIQxjMEQzK0zZvwbSTGJL5PnNhDmZd6utICt+by4SXe4PqfxwMu2gO
	Y2G+1tbe07flqHN2OJWyNyzAJ9x1Dmax+wII2EtlPTudjj01GzT1hjUWkIY02YARghXg7zgcNHVOW
	G+CG+6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCuO-0000000CyNx-2n1R;
	Thu, 04 Sep 2025 16:34:00 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAI0-0000000Byhr-2FbQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:46:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b017e4330c9so12759766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993571; x=1757598371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vateX41qLmBe78jZzOt63uJFfCVkgcgyVW4UPJkHk7I=;
        b=ZNzxL+CpFS52+Y3UN4JPut2PYRWMyBRVjomJLhWmxhjp3CfytsYQOZcYBoByrSa5Fj
         U7Ku49bwSAztqvWX6vHl7QDWrEre1OuB/flXltR7EXP9yKPxaKBmWx2Cizphf0GsutUs
         4wy4zusD+zUYya0MS6ejJu/cEFdmJzJw0fw3QGtV8obWvYuWU+OT6lM9wtDhoGLMCeQA
         nx6soSutsrjRnwmEUhDr1Jaa27Hx/K36q3UPxAfiiG2JtApa40tP5gDo1BVVCXYcrCue
         Tra3ZqSlfl0xzUHC6f+kSqu/21lIKPNZqn+07wmbO8XhuEMY7C8C9kcfOKtb5/OkODKp
         o0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993571; x=1757598371;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vateX41qLmBe78jZzOt63uJFfCVkgcgyVW4UPJkHk7I=;
        b=GzE6g37Q8jF6HTn8sqE4vg9myWp44ew0+01hLhO3p8boy5PFsBnuUXnDUzOcjpOx1H
         Q0gqTD6OOU/iLuKrhA9jRdsU1xDopsZDZAz8frr3yPEpE9LYMnBDjY0Ve7NVVaavGClz
         JujfKnUe27A/UE3+HREz/b9OK+LxGKqMeUNa+y7nDils+/Fv0VcETRViBcSVmWPxI0Ua
         d1SSisCK1Oz2dAWNZQSfwdJXSiQ6HtCm9YxH8K2ArN3Lk7iSoNnJ88HsFUtdAvcJ5u/C
         4T7A8QlNiSPw8MIaNJ8WAXVENcLtE6mk7vJfMr99A8skZpHnvh15wvRcpzsRZ/SU9Wya
         jg0w==
X-Forwarded-Encrypted: i=1; AJvYcCWO4oX3WZON5rdEfSx8pq7tY5jcqXWEVoP57Pf/Zv7rz+oyzrOPwax9SsrcnEhDXSM9YDVrjamoPUR/Qj3zeHtW@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ5SFMK4maewUVz/qP/ueHvI/6q7ZO8Fp7mwu77Hk/gA+LtfHw
	X8Wf3ZS6aTMr30ohSoOdjHunsSr7HLmMes66YpwH4e2C1ZzD6e5N5pOCPX7apu0ci2Y=
X-Gm-Gg: ASbGncvHQiQ5VOUJD7S3BJ/+/qZvyhiqVEwH53tHkAx27EH2YOwOhroiF1PT28YFDpx
	H9RFcKD8vWwtmoGBvrnzNcUQeC8UxOtWkomFp/9fX8FhNg2GvxtbUyQvjJuBTva9nrx1YntaPd/
	VZsjdkRkD5kXhlTv2MuEFKyw8QL3ehnHLdcFA6sC8i0R49EPAWH4V1WrAk0jKMKCoKdSF2+1NZO
	HR3/e5WMVLRi168dYCJFfj9kc9hCrZ4yOLLLXpcccYuW+tufRnkqUU12Emqzp7lursund3veFNj
	KiBKLPAEIyF1YBhoQpZivdMCNGV1I0FHbpHGQyUk/7E8rZuboOzyht4lFoOXupFCzK9Cq1/vDul
	3kKMup6BJuk/DQ5e6/l1f3RnRbB05dbYjBQYXpT2UH7gBzA7IWw==
X-Google-Smtp-Source: AGHT+IFvWV4hrMxiuD4s72RuFmU5dC8uJSFz1ccYAGwp5WTz05lim7XPN1obF/dY5Raugo8Ut7n0LA==
X-Received: by 2002:a17:906:4fc5:b0:ad8:a2b3:66fb with SMTP id a640c23a62f3a-aff0ee1dcffmr1098615466b.3.1756993570841;
        Thu, 04 Sep 2025 06:46:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:10 -0700 (PDT)
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
In-Reply-To: <20250901051926.59970-5-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054254epcas5p24db87bd64fc57a25b17c51e608f15e7b@epcas5p2.samsung.com>
 <20250901051926.59970-5-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 4/6] arm64: dts: exynos: axis: Add initial
 ARTPEC-8 SoC support
Message-Id: <175699356858.171312.4717453350737707503.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_064612_577507_46AD45C9 
X-CRM114-Status: UNSURE (   6.16  )
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


On Mon, 01 Sep 2025 10:49:24 +0530, Ravi Patel wrote:
> Add initial device tree support for Axis ARTPEC-8 SoC.
> 
> This SoC contains 4 Cortex-A53 CPUs and several other peripheral IPs.
> 
> 

Applied, thanks!

[4/6] arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support
      https://git.kernel.org/krzk/linux/c/2b48947f7b03e0fea32ea2c6841a0d8cd67e737b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


