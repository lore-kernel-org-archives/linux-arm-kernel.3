Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CC4C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdXYR/I62+aZcxW37aH9KmdUU3jeSFhaY6J6vyoXK9Q=; b=ehbQzTlA9lp14EmeYPwwaGemh7
	msyslORsdAD+odbMvZ5OqbQRlPqDBu8LuotfRSVz0h12YhpWB8xrFQyup3QSoOjEzIIxde0TqYq5u
	6eKyrtJMS3WIEi+TcfQB/cBr5WOK9rXQHwHoCslcBPcH5w3RH+PCJXfwcNsjBgMB8QsrxHq5nugMT
	VDgVxzQTTPkFFw1jyHT9e+ji1HapAtQSjshCOubaRd5eIud7BclqS1yt9XcO6hj6pKSLauHMmEgwr
	VRDDNiEFN9nNZfrijPYudHvVh7EyJG4avjUTJHSUtF0GbtK9Muk1xefw6Zobi7d7At466xM8rjNMk
	10uoaH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPpD-000000053C2-2n93;
	Fri, 21 Feb 2025 10:00:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPXh-00000004yug-3Erv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:41:59 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso370404a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 01:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740130916; x=1740735716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdXYR/I62+aZcxW37aH9KmdUU3jeSFhaY6J6vyoXK9Q=;
        b=CnqPHyGsne3Vus5YoPP5oGmEpHpl+Gv8KSQI9+vJDH9YaokR33RX8IpBZFapJZCFsW
         TFw4s+aZgWwys65q3B4EMS/8rCO9YyV94+gS4MZIcb5r7J/SycKp+lBdE1B/DzD2fTZA
         R6Fay6UygqUK5wkbTtQJ/1tfClF6Cd/hWkRQ1fz0M7c0zbEefGCI+e6WGkgnavbHqayo
         F1uDp71xZHTE1lNSfT1c7uUFB2epoeYjh50RAErpiW0hmJNpB93E8wFklR7a58hKmU0B
         6ZAqJeiIizfGdOL+c0YYVaeglo7n5riseOZIAqSpH3NHxAui0oxJ8xtdG0kD/jRJiGvu
         empA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740130916; x=1740735716;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdXYR/I62+aZcxW37aH9KmdUU3jeSFhaY6J6vyoXK9Q=;
        b=IR33Ie+rwvOqLrsRqiudWLGol/Nlrn+Uwgd3wBhPttbgKI1/Ng7CkqOs4vRSIUoeY9
         2DoMo29p1rQ5E/dMurDBkD41niN910sP6tCSbewvgn+/h/qmxgeDxFEbb1n6BUdnOk9v
         suEKhUX4jgFRHnL0/L0mDXKXIQeJGj1CL9kPGGroZ655JmuHT5qCTcHyscw//UqKiBh4
         zL45ZZuFlwjpZ94hQcE99qWeNYCwsa9dC2USU/bLCYacdbv/nTrevRFCXF0ejdlgOoZK
         4qcMKar/fDEiMSK/hvpE15AGnNcEePAtrDDHnqUMvG8W3p9093bcMmOYwA5Je/VW0e35
         uSWA==
X-Forwarded-Encrypted: i=1; AJvYcCW+lmM5kGnUJpMk8Pzi3MrGANYD/lqBkWnm8i6DtiSvUWs5lxLHIGnAYWBxqcjW/yAUR6NZoE7k5HZp5Fhl487I@lists.infradead.org
X-Gm-Message-State: AOJu0YzLJbL8Forh800HrFwkXsNI/CFIhs0YVzBLx+bdziB/1pYQGik9
	ctwQZvXTLp417QaL7eaaFxpMdiSOJDSq5gbAC1ha/Yhw5llv9hllqy3f1DmClCQ=
X-Gm-Gg: ASbGncs7nL62KL3Ksm+C1YT61p6iX4Jz91duof0Pb0tHjcZITu9/EWEnSo4nnkorSG4
	ezFGy/pfBQvEcFvFOOhdrc7pAKRhTMGfDtDhLRpeKHa4wLJR0MT7i7bAsvvefq0Brz1wYn2u+9u
	l1q+UajrN+Tg9u3Sz3Tf2XDBx1aSxBB8Y/dyH5nkG4vvoQUImseACw+JZbuXqYVPcmqtcNVwJE4
	cbXqldbL+aML4a4XzUhRwFONkwGYK53mOT2ZEK4DpDGvgMB1sQQaRckAYsHTRXheshpxuT3ha7B
	639FmHxQa7srkP1D/hWuUi5yz/CyhCexeysr0MGS5SVy4hFekm5Uxd5XGKPZsRQXfiV/NEADole
	C
X-Google-Smtp-Source: AGHT+IFL/lM+F0ktUjddFj5OzpJ2DJG7fI8Z19V6vvQBBy7jA2Fb4GY7EiIh5I5iCTTx716z+h+jMQ==
X-Received: by 2002:a05:6402:34c6:b0:5e0:8275:e9dc with SMTP id 4fb4d7f45d1cf-5e0b70bc3c3mr703304a12.1.1740130915955;
        Fri, 21 Feb 2025 01:41:55 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5323226asm1617470366b.8.2025.02.21.01.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:41:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250219-exynos7870-v3-1-e384fb610cad@disroot.org>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
 <20250219-exynos7870-v3-1-e384fb610cad@disroot.org>
Subject: Re: (subset) [PATCH v3 1/7] dt-bindings: hwinfo:
 samsung,exynos-chipid: add exynos7870-chipid compatible
Message-Id: <174013091442.25434.11831404613747395475.b4-ty@linaro.org>
Date: Fri, 21 Feb 2025 10:41:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_014157_845478_AEC40823 
X-CRM114-Status: UNSURE (   6.33  )
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


On Wed, 19 Feb 2025 00:33:11 +0530, Kaustabh Chakraborty wrote:
> Document the compatible string "samsung,exynos7870-chipid". The
> registers are entirely compatible with "samsung,exynos4210-chipid".
> 
> 

Applied, thanks!

[1/7] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
      https://git.kernel.org/krzk/linux/c/0a86ea5534a9e4ae988a2e174e741b102d8a8691

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


