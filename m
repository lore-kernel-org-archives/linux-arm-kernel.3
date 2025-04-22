Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED36C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gFPbHcslBrShPBfeniLTCdmwDJynv5JMNyf9loIAkY=; b=azCuvt5/m5X25sMlRROCwG1a/N
	7lScoHrwpMXHEaI3vNYyhCo19lpBq+VvbGwLVl1tJuq48ciXWYnggG9766yCwPJWKDwjMiWiEYKYs
	KX7Fk7HvBrPS3iYuJqc0aDQzUcKfBEQ/V4QSreqI8U0W0c2w+bF+MTuQ5xzcSTAgHzPGYYuP83k2O
	c5P6hkVz+VjErA3t1kZPelzkFMn080zg1WcXczxI1Gj0IfJtzstzzHkc4ILD/dbYLzsoch9ApM5TW
	fepheuTdTYZveldVkoWF8EDQgqUSIhJe3fmiysQEYnk9edVrwXeAi0rT0n+2vtFy65UNFI/8yf1sq
	GxqAxx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ahn-00000006iqS-2q6H;
	Tue, 22 Apr 2025 10:18:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u787O-000000068J1-0Xp4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:32:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so3289148f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 00:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745307152; x=1745911952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gFPbHcslBrShPBfeniLTCdmwDJynv5JMNyf9loIAkY=;
        b=JVehmCPZ7LVoom1yz2xFDTBhRkNz9B22N1j2MScEWsjHgT/VrAwFkcwMY2B8YHvEE1
         l3AyPUaWvvkSWVdZWq9MY67JIdCswX7/YA5F2phy/efxjzb1RglWtwyWQO2+kk+Sbwsq
         E99CD0V9wnj2IxLm7hbKvAWhwyHjS4OkKNGrRh4z9mtSXRRT2Z7SsnWhxUXd0CVOYR4L
         ZSprlUUGO12olbR9SaHOeAVnR8HIQ7RG4sb2/Hey5mOX9/xFJENiy5JNtaw6+o9w/3yM
         DIl0wqzwixqa0TdIB/JgmCHMKtkKqKpO5AmTF2gdKQYwFzLaXZorpfVfvge5s6kWiIah
         YnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307152; x=1745911952;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gFPbHcslBrShPBfeniLTCdmwDJynv5JMNyf9loIAkY=;
        b=pyzSrL4lQcK90L8SLJ8uVx7zlUJGJTHbGCeiafosTiyppjbdNqc77l/KmCAZu679US
         07yrQ8HAap42OfCFcPXtpB2WUK22Zq62KMyCGLyo1/V2Nkd4b598fRLNTEGhDxOQSuwB
         2vJxxRtWHzphXWGaLJz6/U/mSL57h7PalTX+x/3dTj3zs4fg88TbF+zxCH+m0FlM3EgP
         rJuaKtM4jOS5YxcDQ7Cnm/zvkeYrq9C6WgXRWqqFPWKAzA5O7w9R/eD26/1qnORpZ1xL
         20RkcIKR4rC1Yg/YToSIKEfbmvKB1PJ8Ch9WbgE0oy/rd/roPZYNzVeBWCW6dGalWw2T
         JvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq9htsaTdKQsBrFqHeAa4MOHH8QtQrp2VotZ5qX7ceGFCRKD8xGrcNgUbZpGw6Zg4El87DkgHJYI9oCrVF+KPM@lists.infradead.org
X-Gm-Message-State: AOJu0YwrcQa/Mpnhc6raw0TYtyPXfS5IDw1rJdnslVRe+eU0lXNTQDQa
	dK5I2z87IxEk4e4diz7mQHJXeuOmiSWnI0hSYW5IoSVJzrufnZFb+CeNWGkYvADUsL9hq2qtcFX
	K
X-Gm-Gg: ASbGncsOuyZd9JWdfrVxjZ28zhynH5MOm1/vMge7C3UkOBFOCxBN1JBa77MzrN4JB1Y
	pqf/yVQ89IzY/lO4e/v1raTkx6Mhw/spl9FxyJq4xtDuDX77ld0vYqyxiuF+prwf04ifiKGtYaP
	6RYJWdXemOvMawPF8kpjVZlO9z8sZc+7ZU2J42+XxUAZyhRmB1uKrVM4CZJUWKAvP6dVh0VeVS2
	MtBcb+XXhyGJ4FokS7/QWeoAboCexl2S2qNeUCpMbjbL73Oeh+gX55QJYJ6OxX++0+bgP0Q+Tpp
	t/AY7wwuRK1By7SvbgQsr6k+ZutFEZ1tsmuvrLGea7pOpS8lV7P/Zji4eUpaYw==
X-Google-Smtp-Source: AGHT+IFclT1+OQXEDIxxx/AMqrjY/N1Yvy1xLXDrMHQkl58h0kU69MTBU2hwvhAytgvH99PcAzfK0g==
X-Received: by 2002:a5d:648c:0:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-39efba26220mr11676730f8f.2.1745307152441;
        Tue, 22 Apr 2025 00:32:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43c079sm14450855f8f.50.2025.04.22.00.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:32:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: christianshewitt@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk
 calculations
Message-Id: <174530715197.2805907.16376775353354108716.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:32:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_003234_199953_A9E3D0AE 
X-CRM114-Status: GOOD (  11.68  )
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

Hi,

On Mon, 21 Apr 2025 22:12:58 +0200, Martin Blumenstingl wrote:
> This is a successor of a previous patchset by Christian [0]
> 
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
> frequencies. And importantly it uses the relevant 64-bit maths helpers so
> the code can still be compiled using for 32-bit ARM.
> Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
> still something to implement with future patches.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/2] Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f37bb5486ea536c1d61df89feeaeff3f84f0b560
[2/2] drm/meson: use unsigned long long / Hz for frequency types
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1017560164b6bbcbc93579266926e6e96675262a

-- 
Neil


