Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCD0CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CF4ODf2wTRFML1B4tRmpvs9bZoB7DEQ9x1Ify504Ygo=; b=TJesr5zERY3sxA5Nme9HX820Q+
	bz/I/7sdviWnTajAGibvC8Xq9rstyCM52FxjhZGhchtDGLfT9SENw++MXJoOXNpzLdwhkJRn5psz2
	4SAXlF0wqe6EQ4vj32YhW/BKfqJkfRuTXl0S/5YxKCFuS7NCJCJy+tyByOqUFb/K0GjHnr3nFoi1l
	b/llq1TwM0hCxsb+2uirDNsCNCYbGyS2z11AkfI9vHbhEzCrkSxNNmoSjsQ+riVmtWevmW5pwhcJG
	8ILn8BbLIySdHAc4BF73H87MrcEf13EQu7EFurvoAz7ZiLOaWEn1d48ObxzP9+G28hrzOlxQ7pqFg
	OMOliuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3eY-0000000G0SP-1hDj;
	Thu, 06 Nov 2025 17:20:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3eU-0000000G0Po-2lSg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:20:04 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-426fc536b5dso851000f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 09:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762449601; x=1763054401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF4ODf2wTRFML1B4tRmpvs9bZoB7DEQ9x1Ify504Ygo=;
        b=wBD+VsZUZrxZ9d4kWOKwXdRHZ8WBDlnDv1uesGs7LorTwP6lCuzfREE87sYDDR9pGF
         rE3l0VL8MZcASFX0aqxwHzkwVrpMEMi93UjaJ+CU2/9y+n+JOXZFYNFtNUC0FHTRq4qP
         yugf4GnsZxaRHisxZYEz+sc1ijUde/aoJlqSaiygnYjHiySzG65T16gi9e0CEt5pTMEy
         ELI9PZVXdlBajcwhZJU4WlViL3SQX+8IfQcuddnvmP0mhkYGXvFFRiruFfT79zO4w68B
         kpFMxCEK6m9GAX18EFwpRPmYxbdKJbVsw5IeWBQTMKVVfzhdVjzg1wJ8dKvu/zyUBhmf
         7VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762449601; x=1763054401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CF4ODf2wTRFML1B4tRmpvs9bZoB7DEQ9x1Ify504Ygo=;
        b=uKl0Lz7sZO/s3hyQhTSacPNianTYF4rJ/jniC1VCHltbtG6QyiOCEYlsl8CrwQtmvP
         Nc7LonwF/qswmcUUSxptkpmhyxplWbXuydXNk+TVTUi+FtA0abWEVXjP6to9Ya8Do9Jj
         wKYe5tWq6HCh5WLqq0B86AEVnyTZn6eO+zau4TdCV5656ai0cbRglKGSXlRCS2CrxXuk
         E2Wa4q1N3rAG/Vupg26y4LOp5BY9/8QIhXMHI0IDeu3y8RBG9kMlIm2nJNFSfhwM73C3
         Mn5QSwXswxEE7MpZdZtmihQFhFeebt3akR+2fp9dxfsD/9lthWCcGKWVPjni7BUD3w7P
         kW6w==
X-Forwarded-Encrypted: i=1; AJvYcCWEV00rQ8uwzbdJlKY/RSMSuMLivO/OeD6a1mW6b6B5/30FQjYJa6OBPFIrAG5prGOK1kjYP6hJj3xPBGmcoyS/@lists.infradead.org
X-Gm-Message-State: AOJu0YwoKAZf6NyHjm32ErkyrSQ0FDNo3+70nWG70hV2cGcM61/TDF9b
	2MnUftL7ZvHxmYloPzhxHQHZaiafAC3tnmhIU5UAH8rCZbPdOJaKN4XfHTlAzp0cxLE=
X-Gm-Gg: ASbGncsfN7XN5LiDwF3v+qIYm4SUrYNAiY/cbxtDZ6gr6Ty5XgoDa+js2tAMBzZZ9VC
	0LOLqh0iI0V4PnsaDXVi5iA4xpdCa/OJDCoUX8sb4AYsQHtTQ34M8wIEeRMchoTyNbBQtuTF37J
	YOMHegldhTvTCOSKxtUI7CFDl8xr/bRgpt06t7dDtUYxC2F+fj4R/dlfYhpmQToDNdOHfRyMeOL
	rO00y8KKN6Zz4GOgCTUypq5y5+Bjqty1sCirPGMsf0YQv9dbaLjF48ckbXQ+7p49F7ItREmGUBA
	Tat5WRfc/R0WGfvncVrBkB1gUrT1+GWAj6DYIIsAdKUAims3roZbq8Cag7GnEJUEK8nkiK2eNbS
	9/unQUJAUKVdFVDeWyhKIQcbkc86XUxnWaBjInWehhzP1zmjoDCUr7sOrevpepd7HQdsdcg==
X-Google-Smtp-Source: AGHT+IGv3ddFv7Ixmi0z+24Qd5qosIPKUTQKcEJpg9ieaTfBELOhzQHfNLOSGn3SU4H3SmjfT+TvKA==
X-Received: by 2002:a05:6000:22ca:b0:429:cd3f:f43b with SMTP id ffacd0b85a97d-42adc68940bmr1528f8f.4.1762449600670;
        Thu, 06 Nov 2025 09:20:00 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677b41csm215368f8f.34.2025.11.06.09.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:20:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: (subset) [PATCH 0/4] gpio: Simplify with of_device_get_match_data()
Date: Thu,  6 Nov 2025 18:19:58 +0100
Message-ID: <176244959622.43499.14570364732284486996.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_092002_945861_F23B184D 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 06 Nov 2025 17:16:24 +0100, Krzysztof Kozlowski wrote:
> Few simple cleanups, not tested on the hardware.
> 
> Care has to be taken when converting of_match_data() into
> of_device_get_match_data(), because first can check arbitrary
> device_node and the latter checks device's node.  Cases here should be
> safe because of_match_data() uses 'pdev->dev.of_node'.
> 
> [...]

Applied, thanks!

[1/4] gpio: tb10x: Drop unused tb10x_set_bits() function
      https://git.kernel.org/brgl/linux/c/4436f484cb437ba28dc58b7f787a6f80a65aa5c3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

