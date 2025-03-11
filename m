Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1388C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk8/jRHxFdOn9j6NilUq3fYq1U2KDGu3FX6e3aC3Pvk=; b=afjjuvVkWPO20alcNi+xsk0LH7
	95+L8bdlTqf6jOzKYg6dDoUY5CsHJDL9HbH5bUDttIN/c17wmkfQmdiJILYJ9a36zjz51fuiPJLEd
	DtasZxg4q2t0Er5eaKuqdkozhAjMp/Bbklqe5XDHkpnHE/ZZYkW/nX61vJgaMtn3PoZM+ahWpb/cq
	U9obnqolq9khm3zCPqManY+QixQWzwfOsqDVG1m0De6yDVx8xGoS8UL1sq22LtOJNyQTUMUVV9UM9
	ZtftFBJtGEoJ30Vn/72RO4yLNGqqPYDXPAFfMdiz4nzsX+WrXuuQseu9WNAngdHqySYFjoleBWmZ8
	FTsA/PVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5W1-00000006o0i-3Cq7;
	Tue, 11 Mar 2025 19:43:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5R7-00000006nTR-3ZGO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:38:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43ba8bbeae2so7287165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741721923; x=1742326723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hk8/jRHxFdOn9j6NilUq3fYq1U2KDGu3FX6e3aC3Pvk=;
        b=vCZOYQ06F2hkdl8DTPS35iJ9fUwXKEvdtoftzA5LnroRKKeZIbH3eRZmiEtj6xe2fM
         K36wD353XK9TRRUBxoMvduwPfqEc/+lOTRVbvWlRsaNLNAj4q6Cnd8nCysqQROTxCzxr
         N5KZeA0jEEeXMVnTmOve841N8YQWAOOsYNC9lqnzRKQW+XMtWfg2NyJU8j2hheca6/i/
         vYitJfcAhW98tR7PtPT2qnhesjNZjhfT8YX16e8pZCfm0EBdCWcLRJH2tG0j9dFiouNI
         ogGrbaWfbXwUB5x9LD/uv8RbaCBrug5lpITJ/2THLCygb/b4qmSLHqkE/OjEhDNcqBKu
         X0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741721923; x=1742326723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hk8/jRHxFdOn9j6NilUq3fYq1U2KDGu3FX6e3aC3Pvk=;
        b=xVVryEURkmvqk8/C/anvT0ZkBRtnI65+KTy8kll8q4dcTXOVtK6+kiGwaDZlsSav0Y
         AYcF8YAAkYq6b6ZtetKZ147/JyekzhtqsIeLlFMNtIeK9P/Qd8+t6MnW+PPd9P/KlUFL
         F9EQi5nw8RHRJdlHgL23YHbbQE85JE9PGC1uXwV4xn/xGbk4zzLmQWeEF1i3a0rfyhiS
         gHsCTPOeQaoUGbHhM09AKDQO1OUNDqtM7WwRR6W5ptlf01QI+X4hUaUbsrSD0GnhrLs+
         l2jIIgmsYCd6Nc+HMeFqcRiv2S1GU+w1zOJtpwpKvXUs1Nz2KoGQd+iAZ4rF+f6qyjfG
         oInA==
X-Forwarded-Encrypted: i=1; AJvYcCW/pZNJfMUcLsX79dUbOyA0DvwO7pHdO31aerHQyIhtErS1umiqDuP/MPluyMFG++is0yEJLI4lLM3ttFvZV3q9@lists.infradead.org
X-Gm-Message-State: AOJu0YwVloNNox5/ivIN32+N7VJjeGEQNF+CTCyENFp85w9xy7v6UgVy
	qhPNG+DWSkqkJVg6Azbm2QKPP+Yh+LRMCATBTXcSyZ6j2sSk+wONFFzfGJgMKNI=
X-Gm-Gg: ASbGncvK4chIGNXIYFot10ZZL+5W2d4mt/FFBLG3XxeVmuAhHJimQn28RRPT7Xs803i
	fDQv+KvuyE2zpmeWcBufGkRON8KSGCJQNYRtVjGvdStTcZ2/Gg8PBNxOmqZhWPJIHRadAzDDfkO
	MvPb6zb1c5G/ibqeVEbid/t8otL0KgyqAC7uxWkRCfjehFafDbZKx7SmZp+bK1KgaRZ0iyBhynd
	hviWLmlq6b0EmEo1SznoT8xLkY3MoZ+TV/OUKwL9C0doP2ByC8v1rxvy1Pdu6NGDu93YJ/7/G9i
	+VHKuATRs6t0kE+6iW2TQUIo9nvb8qIQfEPpaffwAv48r+4xz/8/m8+JAA==
X-Google-Smtp-Source: AGHT+IEEGrtv+WVqplhsyAIOJvjlmuBCpHGGUDzZq6EETtMUE4CHGK002+5IMzV1Oj/aRdFt9ZT1FA==
X-Received: by 2002:a05:600c:548c:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-43d01c2b40bmr22475345e9.8.1741721922987;
        Tue, 11 Mar 2025 12:38:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf892d380sm81727225e9.24.2025.03.11.12.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 12:38:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	jaewon02.kim@samsung.com,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/4] pinctrl: samsung: add support for eint_fltcon_offset
Date: Tue, 11 Mar 2025 20:38:38 +0100
Message-ID: <174172189759.119514.8325135286672051459.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307-pinctrl-fltcon-suspend-v4-1-2d775e486036@linaro.org>
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org> <20250307-pinctrl-fltcon-suspend-v4-1-2d775e486036@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_123845_894494_68B9012F 
X-CRM114-Status: GOOD (  10.94  )
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


On Fri, 07 Mar 2025 10:29:05 +0000, Peter Griffin wrote:
> On gs101 SoC the fltcon0 (filter configuration 0) offset
> isn't at a fixed offset like previous SoCs as the fltcon1
> register only exists when there are more than 4 pins in the
> bank.
> 
> Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
> macros that take an additional fltcon_offs variable.
> 
> [...]


Re-wrapped commit msg to match wrapping style.

Applied, thanks!

[1/4] pinctrl: samsung: add support for eint_fltcon_offset
      https://git.kernel.org/pinctrl/samsung/c/701d0e910955627734917c3587258aa7e73068bb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

