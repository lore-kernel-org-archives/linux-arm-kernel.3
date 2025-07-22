Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E49C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 22:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8hcD+fzN/rLyW2ntnhyBmLcEi4uK+H7gUEsQ2j7Juc=; b=pcxqXddN9kXeZRwQMEqO6klVGh
	QJt7FI2RdZ+GLXI4LUFWh/SHFiDD506NX9aQ39weFlg5zKWsZe9OmwKPO+pSM+5ofQ5ZYghAL5GBc
	0GeBDJyOyUH660vbuHoEfEVp84HtAjpcW26yRkiaPdpasYUOGDHCS3VO6KLnMzrt2750WHnun0DzM
	lNx3tC1NEFsk2ji8TziRClLtvhdlkSSe/vsUbqLFILi9smjz2b2CBTceIFqU+c/Q4dZMiqyUTpW9/
	c3Hj8ONufVEukL22N4XbnUv/Dw0gYYcAvkdAPMnF09PAZUNmW/z3JID+ZNWO8+ntamq6U7yZzg3BZ
	saolFEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueL4a-00000003ZQ0-0SQ8;
	Tue, 22 Jul 2025 22:02:56 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKzr-00000003YKO-0Gur
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 21:58:04 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso4715a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 14:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753221481; x=1753826281; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w8hcD+fzN/rLyW2ntnhyBmLcEi4uK+H7gUEsQ2j7Juc=;
        b=hj556VDQA+StN2V/8VcRWRAhLkb2SPVJCF3Ruh0l/GLEvMTe2yd9AxB2qCPIP80Gf/
         qXwues31dwLB221FTyk0xiNZJ6abnKu8spEl4uLwVHT1EA7LY1O3tmtcH5e9bn5jWpyw
         +Vpu5iHxx/TeBY9bRAazjyMvUW9pU/ewBo2K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221481; x=1753826281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8hcD+fzN/rLyW2ntnhyBmLcEi4uK+H7gUEsQ2j7Juc=;
        b=tikRT7kn1z0fCY6eRMuJYIUKg9rj9q71J6ZFP4mkQ2kYtcr7YZoXBPZz4eFc5Cx3mU
         rAQ/7ZSOlzpSwCcOBlmoOJ7ZZojxssA3fP9KT2XRAegYFT8RVSEb6n3B7lOmFHw2Mt96
         0xV1E+O2BXOEAMXnA1mxOa33NqQdpKTS/M8OsCigCBcOvPvIALMgCqA+h1xdC5Vi1jOy
         iLK6qhLxlkUKzpKrHqUduTGj88SY03nlKkVJM6OYMWOM2Env0aBsAKgbhbpQ3O0KG9JX
         p/LCr0cpiuCUrZsGINwmBoJ0Vq09No2uLEfDwYHwhQD5199w/fyTyJoI3bxaAHFcIWDW
         13Sg==
X-Forwarded-Encrypted: i=1; AJvYcCX/7fpO5LmugB0Y8UDTEVN/pfrEP1QxvHE7dBogl7ULTOW01m3cXLmFUkThzaQZsYQKOwVfIeh/CMKfmIr+3zPF@lists.infradead.org
X-Gm-Message-State: AOJu0YytoiAKdeYnrJzgO9pcJSI/ErbWN/q87bvh5fjhPx+iNEju9saz
	/oRbs6pRH/5jyFcueEnYY1wpY8SpM8cwitMFTOvm3uaodI7dmGepm9Ijssct282koWgvPLswPnU
	P/g4qKLb/4+g+BpZK2amulUXk/cFiV9HzHS2JMCAd
X-Gm-Gg: ASbGnctytfivcVWCgNgQCXjClvXgG3Zlg816oQpmsxiBgIY/CakMrzX5k598l+durH+
	V97khLTRpISrj+eVOrO5aAYIdW0i0W3ya4gld6wU5RTPCYfXLPqB3/tL3c7p21X5KcQo9BzXQk+
	ou9WIRkeSPPr7w1fdKH/j+q447XjZyCYw9tFm8rbNJt8cmSoskj2tqvXomsDJpaMYwcJFuskZQ0
	GxWsmwtR9FIIoO7ee0KsCvOCzi1XaC3WQ==
X-Google-Smtp-Source: AGHT+IFuRyHVLlTc9+mvjyXn9nDzKUxgSkHkWINR1NMMOVHEBiRhg+HBPAtm00VgI63bbY4a+rdh39BgoHymQ+H8ciM=
X-Received: by 2002:a50:cd42:0:b0:612:ce4f:39c with SMTP id
 4fb4d7f45d1cf-6149a332acamr34752a12.0.1753221481275; Tue, 22 Jul 2025
 14:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com> <20250722-ddrperfm-upstream-v3-6-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-6-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:57:48 -0700
X-Gm-Features: Ac12FXzhD62MTJBHmWXOCNn35YJ884MYdMc4gPYhqJDJjbLE29Cjc-kRxryta0g
Message-ID: <CAODwPW_7aYdEzdUJ7b2nT4-zS9bu_hbNqjc7+_wSHbedXZXJ=Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] dt-bindings: memory: introduce DDR4
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_145803_105598_488688A0 
X-CRM114-Status: UNSURE (   9.00  )
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

> +      - pattern: "^ddr4-[0-9a-f]{2},[0-9a-f]{4}$"

This pattern doesn't really make sense when DDR4 doesn't have the same
manufacturer ID / revision ID format as LPDDR. You could either only
leave the fallback constant for now, or define a new auto-generated
format that matches what DDR4 SPD provides (which I believe, if I read
Wikipedia right, is a two byte manufacturer ID and then an up to 20
character ASCII part number string -- so it could be
`^ddr4-[0-9a-f{2},[0-9A-Za-z]{1,20}$`).

