Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10618CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzyJ0fh/wAbVru2AIw9Z/iVWtj/2W/vCo97JCS7BrIo=; b=KJQS3E+SQN8efkaj9Svl1mC4bc
	JiFqCXpUEOZuokJ2wjyXe1EiYFdNUWWBK9SgFYKHxYQsxSy2skDgC9+QqE81QoIm/aBjEzSBhdDxb
	VcOeQT2c2IIn0Smoe+Q8k5alWg7caLOVmib+9WxPSZzuBZ1QixAfTrpBQ5xr1/2qzo+XIUyq1PE3o
	1xUucBHOetm91Q1CDLUMZ2cgAobJoO06bRAL2vYw04uQn55h/LLuKj4h6ohXM8Iw9eB3beg3+cBHg
	ypJr0P6tfb7veWWH0qSukOvGUAz4n/2+2/bUvVWZ2D5QAddPZHTTaQoHEJjsgNCB4momxYYrolLDL
	/m/C/ULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXtb-0000000DBk1-2OLx;
	Wed, 05 Nov 2025 07:25:32 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXtX-0000000DBh1-0MTr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 07:25:28 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b70b40e0321so30395766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 23:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762327525; x=1762932325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzyJ0fh/wAbVru2AIw9Z/iVWtj/2W/vCo97JCS7BrIo=;
        b=oLJR++p6XJ6o0M8RODpUC8GQhEtWvGY9n1iCEww03hBfE6xGWiYBp/znm8f3BOkDr1
         h3ij1FSJ3cWqH2Ya8033T8g4PZZy6rGd9Tx4lAjGqkmXT73vafKlBHuTiwed0s1f+/av
         2l56AqEImhsyl4S36ztmqWXFJdrlgNqJzGcf8eGHYCi1XiG7BpCPH0ISBNTMULTurl1M
         pWadl30PbzINFckjsG8vwinwF4BXy8uJITk0asxkq1nENodded1lIjEP/9P1CccYnTps
         nlKdw6NropNh7qHYckwsE2GQ3H9buG/GPnvW3Zur2ZBc+kOrlU7xtX0PYUTUzDapKmTl
         dbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327525; x=1762932325;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzyJ0fh/wAbVru2AIw9Z/iVWtj/2W/vCo97JCS7BrIo=;
        b=naMec5DUxyCCauH7SczJ/17FLPORm5GhcUIf+P4iH9Qzz+82Zcjc8vDJXLEmrmsXmk
         7lYwZEjT9kT4j4K8ZDVW3wRCbWNljlIaosvyS1t+HczCQmHe0OKZImrgTHGCHrC82UK9
         3ab1j7NGyFuVISiTRqw8TScPcbk2NCSf//ugSxiexJyIwZ5O2HKTf1zknoCVAlcFf3Rv
         KL+LwovKFNXa8M55I2MdNLryXzpMQYQ9vN1XRZllphlmsNIJUmtJbhP1B517c0f8gdiP
         GDhdXMVZhDb3ZWtpJzMaKj0VvE3cY01h1mi+ZxsthjrhpuhznjEpEoBNh/tZzv17j4fS
         GTGw==
X-Forwarded-Encrypted: i=1; AJvYcCWnkmpDEbeOSFlk3cwylpovLeMJIhU+Gygb4si2IfJkatNPCZH3HV7rxRQ4rNQXA6tKZskt6bY8g8pKeqxBk7NN@lists.infradead.org
X-Gm-Message-State: AOJu0YySq5Vksqz/f/W7f4BP88TiKSeKnDCRWvPaLwnp2lroyaEGupZy
	CL30i4aZ30i09gN851fG/d6jg1e1DYppLgnkP0kZmOWEuAln20CA/Q7uYOILtQFFlc0=
X-Gm-Gg: ASbGncuCfddyVaPErlt+kjEBIcYDxyPOq3Dezira9z8kf/OnzBBowSBmXYUtIESwOEe
	3WnbBD0W7V6M1bOOuRCPSUCRI/qrG5t2xUAWQgjfjKqlU5dyutg/OZZYlacOe4Z48iYpPhlbjKw
	NDsANAsN+fCyGGmHc+kURGQ8le1BpnBlFFb6AuGP2IKqgD6E3IWfl9DzTkN8oMJXVwHjnLXvsFx
	5CHA8X6grKfwmFA1YgpZZH6PGKcNLPhPJlOLXAYvKqJjWnDmI9m6MNjv5hAIj5bNw4Ku9cCFb27
	ZqqIsZtXwKQHj0kqxRD5kEm1tXQU2iPQz5Pn8XRduhMhUYY4lju2UOdJsizwxz+rezCmlCeDQlb
	zqoZQD9ZbeE8J7488V2nMuodTukL457u04VdlK6FantWEBqzlw6fujHIMIy25Kt5eIkDVSkUJuD
	nKezfQY0piPdc8ym3X
X-Google-Smtp-Source: AGHT+IH5PD1LXiuJ1OVxB91pB1B4L0WrpF1/eJTOcdn/V7iCjj7s8mrxuloXatGB8SxHsWzsC8nfAw==
X-Received: by 2002:a17:906:f34e:b0:b72:6762:f76c with SMTP id a640c23a62f3a-b726762f87amr59779866b.5.1762327525074;
        Tue, 04 Nov 2025 23:25:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm411534866b.20.2025.11.04.23.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:25:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031-exynos7870-drm-dts-v4-3-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-3-c1f77fb16b87@disroot.org>
Subject: Re: (subset) [PATCH v4 3/5] arm64: dts: exynos7870-on7xelte:
 enable display panel support
Message-Id: <176232752377.13426.2352187579192770383.b4-ty@linaro.org>
Date: Wed, 05 Nov 2025 08:25:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_232527_134628_6FB6B6DC 
X-CRM114-Status: UNSURE (   8.64  )
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


On Fri, 31 Oct 2025 00:50:17 +0530, Kaustabh Chakraborty wrote:
> Enable DECON and DSI nodes, and add the compatible display panel and
> appropriate panel timings for this device. Also, remove the
> simple-framebuffer node in favor of the panel.
> 
> This device has a 1080x1920 Synaptics TD4300 display panel.
> 
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: exynos7870-on7xelte: enable display panel support
      https://git.kernel.org/krzk/linux/c/35e69cc6bdef74a3c4794bd278a94dfb512abd7a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


