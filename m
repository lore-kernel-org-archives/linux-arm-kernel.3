Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94001C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 11:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=px0hPaEeyRW/CvDRRPztfyMotj+Xv6y6UjJ57CxB080=; b=jP5S1AgEF0oNwlTVGMeztsqLQN
	K7owj4SpEaUSlpgDwTPETL7RGYKjoe0wOVKak7ous6lv330Kh4lbLFPOybdsSlNaHKDDu1WXJgyTn
	87gbXt7VkSrteZE/y4eNlnMvrGGVaz2Da9zPM1g6jQPklcbH48ZAgWdZ4uwG6dcpRJliBcb2G/KPX
	CWQxthhxfhzhEjOi0Ji2ika5jH6LhDvpaBDmnIW+4KIBB9RBlcWUt+AvKnnP/RXPBkpEVxRcml6hB
	tUBn2EBvsY8XFaDcmQR2tPQgVWoxmRslGM13N4qy6tLAriL/+lZ0wa1UxjogD0vW0WQ1OZol8PPb9
	3aTSTjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u66mE-00000001GGj-1w3Y;
	Sat, 19 Apr 2025 11:54:30 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u66kK-00000001GAC-1Mt9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 11:52:33 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so2561810a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745063551; x=1745668351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px0hPaEeyRW/CvDRRPztfyMotj+Xv6y6UjJ57CxB080=;
        b=mjqI5C1QJTdQ/rZUo59SNQXSiDeXzVftK1hw2i3cpizkSLF27f4f2Jt98URAOM/f0k
         o+eSCF79/oWiCdPc5p1XCS3Es+Z1nfakGt6j+auJ43+5stJqEf5gn0u3Rew2BL2eoRjK
         x2rcBiHA8VOE8K0/FU7A0ccD1OyfFTyDWLMVrmTZ6ClbALPB0Xw+iDXmTf/WXIK8OF2z
         /QJ7r4SJqpt/BIxzl+2cn0n8WJiQ+QwO3SkP3oH+JPz4cnk5hjMRCEMH5dOXBSXRGQl6
         TL9CoQbAU/I2CjdxgtcVML4I5cBgHLG1ZfEDQnHSCy4O6WGO50StF5xujQDPRA+f/j0A
         BwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745063551; x=1745668351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px0hPaEeyRW/CvDRRPztfyMotj+Xv6y6UjJ57CxB080=;
        b=mAlkoxWiclKg5LnBIAVDqsNea7M1GrZvgCFMQwSmvln3Xevlrg9XYx0hIkUu8pr72j
         Q7sBwkEb+BmFLRxYiZcarOxt9wNM4I8R4wOpDjBhUtNpijlqBe30YZShJlCs1KTJrXbN
         PvFFp/X/XlBXBv3it5QvxMjE23hIS2oZiGyCk577mJSjhkVafaPn71WFQAVtyVQgMu0G
         6wyVzBjAn35Mf1gYo1QFluszZQix260QoJFcvyWscmEGaBmTkRFsJuZLmY5R4P6wZOx/
         T5tZ4Mk9qVuvGoiKFnayMJYMz5iCrxJnvmC43Bp/v6J8UZ1XsoPgAD2HwWyfh9oWAuMy
         +8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWI3DS2RREPS7g8GP1zE0qqd1TgzlK3lwnOMBojjV2He0+JnvnipDiDoBhJo+2vPkchLqoUoySCbOE7/Xb99r+y@lists.infradead.org
X-Gm-Message-State: AOJu0YwnOl7CVMRDq6aOtp2ckeGnFyJO41qrc2lbZx0dR/r3l8rUmCEW
	R53XkyDPF473B/eirO0DKs2sbwd0p9azBsXU3hDYrSiGDwLN+D1WHQO7Qwaa7A==
X-Gm-Gg: ASbGncsV8IP7MrK2+wyaO1rRbH5kbIxKTrK21n7xaE9tlIUS24ydOljfWmhz/YmKKCR
	DmIsRjEz+YLW2du9SZEFldyTO5PHbtUpcNi+ajCio8guJhxIvEmJQVBSdGTZS2W8ciygu266iKC
	7W92vKNLqOdmNczZiHFIPoNxv4MHBizzqryAyqM0YLNc92eee/UHUlBDtFr8gE7UySwdbhLvKmF
	xi0w0qj13Hjn5VU+lUtOmpnMmmylN9vFw0wD/lTMZRCLCM6V6nBGlB+Abp2YbXmjJ49bYYzyBI9
	6pZOc0arpb2SiS9tUlCaIP1TvEoSqLcTwdnn0M9naTMLbaqR/oxugw==
X-Google-Smtp-Source: AGHT+IGxohOcrVLT2HpkDYi9xceN2Uhz9oDZW+ezY0LfwsFn53P6RbFmjao2TeMC0K8cXhOK65CtbQ==
X-Received: by 2002:a17:90a:d010:b0:2fe:7f40:420a with SMTP id 98e67ed59e1d1-3087bb69218mr9255068a91.17.1745063551225;
        Sat, 19 Apr 2025 04:52:31 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ece2f8sm32069075ad.189.2025.04.19.04.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 04:52:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Anand Moon <linux.amoon@gmail.com>,
	Jensen Huang <jensenhuang@friendlyarm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: rockchip: Fix order of rockchip_pci_core_rsts
Date: Sat, 19 Apr 2025 17:22:22 +0530
Message-ID: <174506353387.39503.4719676281195371261.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
References: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_045232_370873_1F37F285 
X-CRM114-Status: UNSURE (   9.53  )
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


On Fri, 28 Mar 2025 18:58:22 +0800, Jensen Huang wrote:
> The order of rockchip_pci_core_rsts follows the previous comments suggesting
> to avoid reordering. However, reset_control_bulk_deassert() applies resets in
> reverse, which may lead to the link downgrading to 2.5 GT/s.
> 
> This patch restores the deassert order and comments for core_rsts, introduced in
> commit 58c6990c5ee7 ("PCI: rockchip: Improve the deassert sequence of four reset pins").
> 
> [...]

Applied, thanks!

[1/1] PCI: rockchip: Fix order of rockchip_pci_core_rsts
      commit: 84d79f3304645d6e87b936d2bf8b8310798efec2

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

