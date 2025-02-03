Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D89C02196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4w6z+wwJMdG8nN9Qcvb+agCCZc4JaIRFTNtg95ls2M=; b=HKoVhLcGA51Dl8D0deRkvsFMaS
	EFAhPhr867UNCvUNYo8AZ43th7wb2d5V6FKIshTqu99e1PUREdskihXT+2AEB7FXwIXqzameESrcr
	BHcNNnxUC8wp+aFMo45+mScUlGLFTlls91c40vzJTDXqrlgX6jiQ4Puh5jF/QAXULY0EW2imHyYcA
	FegRUyfWO3nuq/oQvIpEEV/Chkz0wJMDSN3NZKDUbyE6r/ddUKoGiCT09V7xf1aIcYvTKPLtI3GDu
	xM/ysmUcfEl3yawmXzBx1ZuloWA55YKO5X7zsXrNDZKgDGiX1eUZPDDuOm7/LP7Qtz1tkQHnEmv4H
	Pn6daqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev87-0000000FJAg-1B1n;
	Mon, 03 Feb 2025 12:00:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tev6m-0000000FIvQ-0GGh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:59:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so6571495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583958; x=1739188758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4w6z+wwJMdG8nN9Qcvb+agCCZc4JaIRFTNtg95ls2M=;
        b=KoVGSJXRZbgk9LKRBdKNuGO8sNbcwY8GlLWosHaJZt5TwWW3B/73RiMcH9KuwRdW4Y
         GGAIuv4L/Ra4D2udNBrErwRTKP6CMznOfkKnDUiw0gzZdh9rjQpmtSZoyIHlCP4JIjsL
         dVapLkBCW46JW7FDtpUg2LGwWL2rAUdwDMdz6ih0vS2s0ZgXeCSaDZVNPFnJ0hvEilcU
         cy+rlJKl0K6zyz1Md0Ez2rw+07Yc9DXfPTtyaQd+fikVNbwpH04gd5qYFeuMG0D9M7vd
         cLEJc2bEiVVg6b5UZxh63+hCLwnYmQ+oNZ9hFqZeLf8eAQk7lYf7ULH+EWBNc5MLvI2d
         QGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583958; x=1739188758;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4w6z+wwJMdG8nN9Qcvb+agCCZc4JaIRFTNtg95ls2M=;
        b=SHKLOS1Y8mE1eYw0C0VHNgjFVKMw6LDfbPwe6KS1knsAZelEJj6RyBpOPlRlM4GN6e
         9thqfD27zoGUbIwrrW6gXO5pTmu21v0mK7Fv5+R543axKxz6qlFG0/0XRStxp684OI4q
         ToyXUICQ5JXB78MThzFW7sQ5ZpGGxi653c1W0uACUEbOysao+o3fMifjvj7Mk7Fz8bKz
         6Elb312PbNZO1uQUOYlDFQhFthEzHZwxRVe5+dAy/tx1vlx+aJcjewKn3jEbLohZsI7V
         zRf2U7VtClvR4vG1zs/UWmbjmVVHB58mQQ85gp3XhlyNRAF2d/u1ZvCtM+pZggM11dWS
         OAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbYPMYhjD+8VnC9EEFkzNzriJW+K9fqHawwk6+UF26TJ/SEag27NVUsz/tPOFh0UX6iWmyVGbECUvVHk4FIptH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcob/z8GJt6OA/8sksgpqhYtUqAViWga6n2Chd0p/oIQ54+mqq
	dxhkpm3EuvEMJJZiX/I9UUAG3tLXFqeWUEjWhYvo9ZRFSCgky5GNiEuc9GwdsHibxC25ey1gy/z
	k
X-Gm-Gg: ASbGncsiH2ufHUVoiwJnS+rjnmEQph1PyReUAvuGtK71v2VhTyQFyZsa3PzjDhdep06
	wfFP6Q/2o4/wOjpp3LnJZxMlLgAfUXfHvTp8i/yP1BV2jo4e+bt87qFTSTSWliQqOG/PuH0VvFk
	ALuJXt/A+wttdtaqGQP5tLrLTr8vympVeYJGBmFJFTkcQ+4n1pyzlGbGZxtDT2wA6/30x6flZv7
	5g0JtaHwCGjZbxlCd6hDBPJvrMU/ybpiFI2I0Ln+MqyDmMKzQkVCsguKa8SNIXu1H9buHdYwt0U
	fbBobe93lXNEmzU6e7zPUaboI8hONKE=
X-Google-Smtp-Source: AGHT+IGL0xSElRrwcfKwrUUF6e3pFFAp10ZvxPXdfiqbtaqax1cgDagk0qGOXhxfUjZX4jjdbpXMsg==
X-Received: by 2002:a05:600c:4685:b0:438:ad4d:cefa with SMTP id 5b1f17b1804b1-438dc3faf7emr70962115e9.4.1738583958145;
        Mon, 03 Feb 2025 03:59:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c12247esm12921274f8f.53.2025.02.03.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:59:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250111185402.183793-1-krzysztof.kozlowski@linaro.org>
References: <20250111185402.183793-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: samsung: Use syscon_regmap_lookup_by_phandle_args
Message-Id: <173858395687.133675.813378795094586109.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:59:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_035920_109952_DB5517D3 
X-CRM114-Status: UNSURE (   7.69  )
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


On Sat, 11 Jan 2025 19:54:02 +0100, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> 

Applied, thanks!

[1/1] soc: samsung: Use syscon_regmap_lookup_by_phandle_args
      https://git.kernel.org/krzk/linux/c/00c1fda73df8081f40840f860c8d75e2c9070d48

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


