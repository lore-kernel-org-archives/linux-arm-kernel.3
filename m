Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD92CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SCUkszQLT3jhOeJ8xWYrP1u+Oz6oVJ2BJ9Vl0R1XPo=; b=lFgSO7sCCgh25ubP8iZW4Qqe5Z
	ZgS4XoBh2f9xFrJ68yzHbOI6IPnqQfABRZ2ixsvG5GD31htJKY+JyJIIa5HjWAw2jN028YNKeZHIP
	vXrdHyb53Muq9ZoFE58j4X8sYxB8VpRE6tWVeBfJC+ewGL5AuMAJXGjwrN4AHU8zFiDXu4xmvgx/v
	zAXiCuJ61wZW0w2KLrXH5jTL/zFO0Hq15i94RYEtgqRdwsk8zODh4fRD61cpt0A9wppGaiTHuGWsj
	D47h8h70NZANtw9nnDABm0EVwJ8+327lPfoaxHI3Vf1Hk7mau7u/4LuHIcPESGZtkxnB52oRdsatr
	ZGhFcGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI0u-00000000Tu3-0TNJ;
	Tue, 21 Oct 2025 19:27:24 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI0k-00000000Trd-1vFa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:27:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3f4319b8c03so667983f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074828; x=1761679628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SCUkszQLT3jhOeJ8xWYrP1u+Oz6oVJ2BJ9Vl0R1XPo=;
        b=ghDDA33YTQ0PiXkLEUqzWyHyVNtHamtkNQ+jA7yfrrYeN06DMEmNiluDMyQTXywn3K
         Spx6xbczNAvTFJHIb5saEHV2BMRAnEMrihN2zjtaV20+7F9pBO5mnUfHevul0FQuKmY8
         6+TqFKUujdQmN4i4e2fvFrnG57I2F2jblYjKTjq0AYvUV7jWHtLMrNEYeAmH1Sm1ie59
         t56wH3yYvEEUq3tMcG+wg5eagf7ji4Cl4FD3/c6VXuYR0L9ZhUzYkYd3GwWbhrxsAgTJ
         ZuB/vlzpZ3HF1SBm7AZpZcko7F6oi7gD7pKlaOoraZmaiP6bEJpSGVcnyo+CpsA43dv0
         6WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074828; x=1761679628;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SCUkszQLT3jhOeJ8xWYrP1u+Oz6oVJ2BJ9Vl0R1XPo=;
        b=LbkG7OPlFeEpyzE0IEUkBnZC3xn8tY8fZ4oxYboRW088563UrtYCDPkE+6V8TkpLlP
         5YvVU+K2aLRIuyQqI/Py5aOY0NYLNIrSkT3KN92x0ameUF5LonlW5W/Riw/6LfH9mEnv
         54LUuo+Ef1Mp9b0hUr49OqRvRuzCf24rgqFfrn6eOhXmWjVYUZqHZw0Siu8HX28bEAlo
         PK7e1j9oyWEfy95z2mxH1M9vIeUobDYrdjVlNSoHVCF35Q24vcbcRiNAR75tgRyVCuvP
         usxeinJnyUPuQBBmJMZu6RD1GPyw7UL1L+u3N0Sx7jhnax3y9gffleHcqFYSDU9BJ3N6
         qsiw==
X-Forwarded-Encrypted: i=1; AJvYcCVAAHWU4Ffxp18TcUj0dznWk4oNYB9QvXa75TmWYFGNyPkAKk6RCB6UzRLKOldmc9PKeGAi1yltA9lPlF5Djt1K@lists.infradead.org
X-Gm-Message-State: AOJu0YydACoolu0fSAsAz+58QH8OW5TbVivO0vdUUa/OmZOk+XTTGb7J
	Is0YJUQioJ+sASITV77nLHP+iRnK9/ahhUQySCPilPNfB6vLT9nhjcYm1D1bW68a9+s=
X-Gm-Gg: ASbGncubSpNCPXW0GAUpakW6N02CMNCvjvzc9CoYOuGqn3GHmb0acqE/Y943Jg3WWAU
	XgwlDv39OsSXVZNbArDO/6hI99UvBprFQuT4+EbAo1Nb6ACfX62RTxlnWNy4qkI9ij5RBetHmZp
	970LSSqyA0IrCUMROR6y/Bu2QHosbgUiggjNEHhcOEEf0AtYHZmT/TO63EWgJtMGA7yrAZuRG1r
	aUmF45YvZmHDif2HcoOzF/ZDvhmcafIFlbbNk5T1a70pqTxxARJ8mP3V8an9YX41oygvIVC5EDR
	a1xdXlWL2rt5aLQ11dGOFlOgWgiFVwbkyCNmtksDFFp3445v+Rhe8pFty5Eb2VMZmXCcQnulrB+
	v+C5iZjkyxWSPZ+KMaYjza2CD5OcYNo+9nMp6B5ZaEhFTH2bbHtX5+1RHmo+4OhIShQsRBAzdO6
	/yMaeXwHy/S9nVSVSVr4GVVneZ4YVhxt0kBk3ATw==
X-Google-Smtp-Source: AGHT+IEyLv1lnWbFD6puUzU9WbOWyzqsLRxtSYF5/o3s87IaGKKi+zQdweoF9FjJ4w5n57/TykzA0Q==
X-Received: by 2002:a05:600c:458a:b0:471:1d8e:3c7c with SMTP id 5b1f17b1804b1-4749435b2b6mr19420285e9.4.1761074828560;
        Tue, 21 Oct 2025 12:27:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 3/9] arm64: dts: exynos: gs101: add
 sysreg_misc and sysreg_hsi0 nodes
Message-Id: <176107482703.33931.10968219434076858681.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_122710_505491_9639A1C8 
X-CRM114-Status: UNSURE (   7.22  )
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


On Mon, 13 Oct 2025 21:51:32 +0100, Peter Griffin wrote:
> Add syscon DT node for the hsi0 and misc sysreg controllers. These will be
> referenced by their respective CMU nodes in future patchs.
> 
> 

Applied, thanks!

[3/9] arm64: dts: exynos: gs101: add sysreg_misc and sysreg_hsi0 nodes
      https://git.kernel.org/krzk/linux/c/08d9d0d9ae6f9f83bc1802a3f8ab2a4801ccd3e6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


