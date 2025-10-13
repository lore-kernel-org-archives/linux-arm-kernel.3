Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BE1CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10a4vKq6IEmQUW56jJWKaFLXuKf0sl8IrALpzNZuGbU=; b=mwuSjP7GiD5CUdXFT9+jlB+jmg
	T5BuSgZPGzlyhVc++LcCe0bH4kQaPzj95FXesgD0QpiTzIxUgLegrdRLUsQSzMBhazLHibgr+B+2G
	JOA/A5aA4RwpsgyCNUr/BgscH9F9cnEcdmlcSE4JNCXwjC+KdRpIsnzeuHF9iCnvqaNgoOAbUX7sv
	/iY+jVV40M1ds2q4RRYEL/HrCimWH13seffGu8c+rdC7C5f1o/vLnaDQ6idWpQPQzC4ZhDuAhDxvL
	XmgahMC09Z68XZxA503o+kdNPKsTZ+OF+nsjpGhxOd8UcwjORz8oyzbeiTE4ofXvAo07vzCUjN+2R
	+WNkfcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86xO-0000000C1BM-3b4D;
	Mon, 13 Oct 2025 01:02:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86xM-0000000C190-3tJf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 01:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=10a4vKq6IEmQUW56jJWKaFLXuKf0sl8IrALpzNZuGbU=; b=J9Y779LVPgDnLfHGKZiTF0w44u
	3TejWy8FSBk9LfYnXnMLmFwxQRGxbUHaEvnJtO7h6yTKChipSXIydiIpCoNDMmiFmgAuacb+Xt7IJ
	q3imD/xfl0XGco+kotRyufuofUQ1V8WJTSTrkatdmkUzMFPZfK/cixunO9Ucb12QV4JU67AmF3IdT
	k4tthwhSHXl3V2IlwAUu7TDOCjYTwiztV8uZhg/ZgC+mWCBOgyiN50vsxELNL52/VoRynymAIcmxZ
	uxQiFc3Ea+9x2hDmFJWR3IdcAEeX8kg9BIZf5Fst8NymILyS8U0qx7ug86/NE8PHPJ7rzn0sK21qg
	J7OB85Mg==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86x4-00000003yHU-1Yly
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:02:19 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b62e55af64aso136818a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317332; x=1760922132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10a4vKq6IEmQUW56jJWKaFLXuKf0sl8IrALpzNZuGbU=;
        b=zKnQjRcYRTlZ7rX02BCpX6X2+MJgpAz2XFUmedGWdVURaVbpb2Oojozg1tLlqsKiTu
         heZZo12Q3N0f2Ka6j6Hipe5uiJv3n0Hv+LPiH8JeP2EBKkbzitncnMbYuiIVwYJGuSHq
         6s942xilvVnCRGHr4bCgtk1OV7my0VOScAQTJYLHNs2hkBkgpEsztRKhWUEk2Ae6orO/
         RZKx3MnJPbwD3geurK3UCxYYxdxM2EvS4yaUuRWpvN1E1VzG/JlTS46lRR1xmPVFG23D
         CECmB12Ih5fA3ID3GnWk9HjeDKDGUPvnmHrL5GTBRAnv5N0Mb5Dc03KQQ4MThNSiuaRq
         UcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317332; x=1760922132;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10a4vKq6IEmQUW56jJWKaFLXuKf0sl8IrALpzNZuGbU=;
        b=HSAe+tkaBHFHzqSfwDOvn8DRhn6Jm5oSFNhXY7/pW8y1YVwCnbEA8LDgBSnfc2A9Z0
         +r2N6qw+EhMeEMFuOLDMvi4yQoJTbPB+WXTjpMFcZhBcFTMcp/Jj96zitEW490fUIGK4
         4Vn3Pjyfw5FxZdt96atMpvYfgP1FIt25OeP719QsvBn8le0M4yONgAZbVlUS/8iesAPk
         bQdAoLZQjk30PsfUYz/5PE5wGTnWdWx9UNPJGspvRuAYMZ4TD0AzO6tXN+nitJb1+jqR
         6GyzpxpyktFb/NAYgyLQw7z2zO2reNvj8eAfsDASgWkuU04PGzkFXKq5b4UXKalvJ6wK
         KXJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZSU7eyrSI65MboEqlpMWMA+ergqeCAXEcrwbN1T1TV/Mm6QfB859CUEpQcuCs8ttjSiWCyYenQzKhJUSdGKOj@lists.infradead.org
X-Gm-Message-State: AOJu0YwzwLvfZlnS+E2+/FJq9SdoWUEU7+bv6ix7CfER0EkV+qcX1gXv
	1Ve4KK5fpQZf4GnF3o95iGurd19/0GUIndQOI0BnEgQ9Keeu+unrC2U+yIuVn5zs9/E=
X-Gm-Gg: ASbGncv5rWigGRFIZxR2/AgQBmCDPJWrbDXWlG8jYvModz3ppCO4UB8fc5OlMnsmAYk
	7n8Q1FT/QnWf3Iq/OVasjbl9LqlI+CqJKzFP/h/ly4O12N8FY8YU3u9eiLWRxiwX7gxR2qrttOe
	9VmB+FjHsWPsgvfzJ7wunpMmaJllzrMWvKhOwfhkg5SOHSQQIaktMb68r8UNHUUAcEljIoHZXsN
	plsA7HzdRX+tZrc0HdvbbfM0J6Ybcl1kHQo5QxJlDmBiVQ50keuKiqueAoguN/mzcx05td5IbNy
	8vyMmd6znoWC/7reUIJ0laO28QGsP/J8/ffsqACFibnXkLrcaGXb7xyl8eKPfpogJnnIEifl9eC
	OinDfEMLH6Dfn0ZnJUgcGPRe4PtXO0z4VX7eSC2Wv9tkscYE5ogH7CwmwjpPJ
X-Google-Smtp-Source: AGHT+IEt21JJ0GbW52Ae6IIeXGAxkDnv8PoqVX129SAInTnAX3MkkPG+Hi8yBSex+9tD040Mp73hFw==
X-Received: by 2002:a05:6a20:d526:b0:2f9:74d6:440e with SMTP id adf61e73a8af0-32da8508ec1mr13363457637.8.1760317332410;
        Sun, 12 Oct 2025 18:02:12 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org
In-Reply-To: <20250917-perics-add-usinodes-v3-2-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
 <20250917-perics-add-usinodes-v3-2-a3629e4666ef@gmail.com>
Subject: Re: (subset) [PATCH v3 2/7] arm64: dts: exynos990: Add sysreg
 nodes for PERIC0 and PERIC1
Message-Id: <176031732773.32330.8134222095806318376.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:02:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_020217_540409_59956EF0 
X-CRM114-Status: UNSURE (   7.12  )
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


On Wed, 17 Sep 2025 21:04:22 +0000, Denzeel Oliva wrote:
> Add syscon nodes for PERIC0 and PERIC1 blocks.
> These are required for configuring the USI, SPI and I2C controllers.
> 
> 

Applied, thanks!

[2/7] arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1
      https://git.kernel.org/krzk/linux/c/1e6daba7a3c05af0f8b02cb59e71ce18fb913aa6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


