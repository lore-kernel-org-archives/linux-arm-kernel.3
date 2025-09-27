Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972D3CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkNWDYlAClljJacvPFHJT9/32vyeFE8E70qgHvwmkb8=; b=LUeBFzZY2VhJ90g9h4lQL+8IIU
	Sn5Ho5lIihtfz/xTgHU+2jqkYhW8TJHITBACXyF9CPkvnKaZPUjAEtY4mQ0g0JJOYlm3PlcxQGdIC
	qmSbd+0THgBHT5Bg/Lxh5D+Y4rv3GKsPf7wh0eemd2xqzwSu2kSjejvX5UHeHUfTyQ5yi1n0FZUxB
	IpLKqjMVFUi7nKnHH59gcm7649Yw0/Gjb7v6hlCVXjv+Dr0yZ2nu+KN0SKT02J5YUJbsVPcH/Kheb
	QbE9LNE71S8PHMp5xvd+N+BuBjj+FnEc6vQu6mCMaSMPecUozPjSPM7eEsIPWpkI9Mtb6NKdrYCCG
	Gv2q56Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Shy-00000009Bmz-1RTc;
	Sat, 27 Sep 2025 11:03:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Shw-00000009BlZ-3Wou
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 11:03:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso18428925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758970994; x=1759575794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkNWDYlAClljJacvPFHJT9/32vyeFE8E70qgHvwmkb8=;
        b=GZ62+TG8rZuaRmmN8D+cTnZxwNxce2FwKtzH6HmT1iF6Rt1322ywamGBRt4qMySi/Y
         mwo6bEqU9I9/CfevQKawWI+IDIitNpbqWlhW4QMvGyKrle/D7zBycOhJeUeChgttQ392
         SQH67S3cVZEAbzNUxpCDCxT0x11aJBIz0jspNNbFGQu5Gumsq+V+cWyfZK6OflRjpuZw
         1vigCPi0p6va7/RKvJCewmAyJ3zYDaPNQq7NjRxG+cVG4g6mE7pRmZpBu4nSGI2rLaaU
         HZYqCUXR0yE2xgYOYE7pPXHCEZu+9SNUCFK5BraEF31mTCYlvgUO5GaF+4hfWS2SdTLr
         kl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758970994; x=1759575794;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkNWDYlAClljJacvPFHJT9/32vyeFE8E70qgHvwmkb8=;
        b=r6Y85OXst8HOS0ZySiWKnX22Xb0N65JHkwNHw3nMsdvkzi5e+Hj7hjudyje3U9yFvD
         eJrl+x46bK4nKiGFIOkww+XL5LUJ1tzajgsVt78nGv6GbhYb7RiPftomNp8whHK8IjIA
         Z+P5ptQVf+QLOOOm+TUPeenFzv0/CNn5m5SJxy2FKXWjDz4nnHYIY/xBIUi/zelBuahL
         qhXf/ToMAHGrfoUe/y18JG1NxAD+OEojy8bGSmkqstK6hCtUIf3AN8Erzrydlw+oLPMz
         T45lEJMJpapMPiwBSmB7lBDJVQGxEwtW9zsLLIbTJ1AwYFUaqstEreH3v3k3Rp/zf7CG
         uSwg==
X-Forwarded-Encrypted: i=1; AJvYcCUJLOZD+BvVF3QR2x0wkeXBLYBgXVnjOb5fVUE8S/5YGbzJ317vqaKm2kRwyDXUQXbGbn380OCgMwPk1Gt9tQSJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwQquJ1yHMuzL2b5uJ7wP7/mvIbqsrkmC1uFXryeXyIxuBKOZXs
	we6SPFO86sih/kjanB0uv5SQ41+VNDX8Nfa/xMWYftlEr0HvF+qYXYGHcCKkCg==
X-Gm-Gg: ASbGncuVGdZF/3xwRIIF/09sh9RbrPeHC0CW8WVjgM4ZCLxTTuemhuZsOM2kQ6pqelp
	YRcAZh/HZmOAW60XmoAXIVVClZJW4v7mJjEiP8puXavTLYE3tP6/qj9dz511MM0Ev4rcsSC52w1
	rbI9qffdYKnYBIvJ1gMNwyl02bsmLJxKpxcAFoW0stzSJtMxLFjkzLooGUFxjowTy7/n3FFYp9q
	WdC00678JueTU1cprUEqdhK4rFJaV9qy3kqsGOJyBrrEmP9bfShIvpltIOic6lnov6JP3OfKnvh
	dI3y3U8eKq1Xgcfhw6VbwQQVLU7Fb4VkbSzWAy0RG5NwBXCjrEwV+OFQE2StCy4CR2xQRzOC0f3
	8YWPoyN07R+OqfM0fIKzVGROMl7cxJAld6Y/PnRaowpDRt7P/+giEpjYH773ey8T84mcM6wIDbX
	zhKvfvjLv4sWCwWg==
X-Google-Smtp-Source: AGHT+IF79XdU3MiveCiJWHuSLef1NIT2fZqNrN2anDonGJumcYidxmAS11xssMvpXUUEBE8RsYnPGQ==
X-Received: by 2002:a05:600c:3e86:b0:46e:4784:cdf5 with SMTP id 5b1f17b1804b1-46e4784d03cmr11911565e9.15.1758970994270;
        Sat, 27 Sep 2025 04:03:14 -0700 (PDT)
Received: from Radijator.localdomain (93-140-175-232.adsl.net.t-com.hr. [93.140.175.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33bf70b5sm106190035e9.21.2025.09.27.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 04:03:13 -0700 (PDT)
From: "=?utf-8?q?Duje_Mihanovi=C4=87?=" <dujemihanovic32@gmail.com>
X-Google-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
In-Reply-To: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
References: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
Subject: Re: (subset) [PATCH v4 0/4] Marvell PXA1908 power domains
Message-Id: <175897099249.11004.17270115916151643401.b4-ty@dujemihanovic.xyz>
Date: Sat, 27 Sep 2025 13:03:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_040316_890450_B9F404D4 
X-CRM114-Status: UNSURE (   8.23  )
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


On Sat, 13 Sep 2025 23:12:47 +0200, Duje Mihanović wrote:
> This series implements support for the power domains found in Marvell's
> PXA1908 SoC. The domains control power for the graphics, video and image
> processors along with the DSI PHY.
> 
> 

Applied, thanks!

[4/4] arm64: dts: marvell: pxa1908: Add power domains
      commit: 1ee5305033c227610c072f32c4ac8ba0adbd42bd

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


