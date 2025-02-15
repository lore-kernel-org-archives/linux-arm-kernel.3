Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA25C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bzb9KoEVAxpceRAqAhOtXPFddy5YM0ujKSt02fGNR/I=; b=Sxd4Fy51XProW6yHKPz6ZLJfnQ
	TD0+qo709LCxvJvp5VfN9egt+bO8/q28HlkdltErN9jGA/OsjejrQ4mEoJualTTD/sdKUlIYdcPam
	R2F59GHuMoM+fLa1yF8U7D9Z+iPJLYBpGXFxgfOAWU6FEAnCUTPvBcfT5pyRw2xIw3DRuySRswjni
	43nwPIMHZkLUbbq/nQ8G6dml+jSWLPqC/O8xI3donQSYqIigst4Xu3JxpNtHwFbGfmpwHHubee4ZB
	6CzZSNmYUsVWxJQ5TT6YbdYrNgjZ8UZdVMJ05dqcwnI5kP+VdNb4CfZ0xlhMQ2MfGtg+kIDHTGepn
	SUK/OiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjIT4-00000000AcP-2JZN;
	Sat, 15 Feb 2025 13:44:26 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjIRc-00000000ARa-2R3t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 13:42:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38f333c5d35so119631f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 05:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739626975; x=1740231775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bzb9KoEVAxpceRAqAhOtXPFddy5YM0ujKSt02fGNR/I=;
        b=oouiObPp10eB7blGEU/K7XLQgRYvFEvPtJphIKnM05+SSvKdMYbzU6R5m8V223SAAn
         +QBdG2npfr8b0cJTObTo1nT2JhmdcolmasdErldfgG97Z26XC2yVmJYjezw+A+LqWkks
         hDzJ1ekFunf6E3m2lI20sM0Atkr3p4DDXp8+syS7rd3/gIdxV0Y9GAdr+rSquwKVDIxb
         50S3Y/uEJ4yNlihFUxg42vZeW/BTnj26wzESvf16uRX4hnRyLqQTNivWbBDfQ51WKsUE
         pUOwJC+nieZAbBI5RBNAA/s/WnE55fEkXTeALQ8Es+IhQxu/VelNIT0jlfaXXuV9PDjp
         OEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739626975; x=1740231775;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bzb9KoEVAxpceRAqAhOtXPFddy5YM0ujKSt02fGNR/I=;
        b=fmCqkbe6ebmFpd8QvQXjq4dH9korje5YkzwaNvQd5SoMypucazZADoZIZH1ZkoFhP+
         MQaLo757khxkMXXPrL511EiTmXIlXIKjYxOZqp2ES+wIy7IZQ0vFDPjYpnx79y0zR45N
         tO+TfePlzE7V8zCk/jk+q5xg7+4OOOnDkxM/SuJ1spVHziSA3q7aPKfQ/djDnXJBQ/vG
         OPtzj+oIMVFpNoRIteBzVenNtYufBk5zxvTt7A1bDsV0E+XKzQzEcOL0+EkdBAWMKuwI
         OQRXIaEPEvrc6FPi8oZMhQLDuoBbtnOYNcaA07vzKEbPt16vaO0iSBFuqquI2q/+idC5
         CTwg==
X-Gm-Message-State: AOJu0YzlKgTCetR/5UTkAikZDvKBTaefRwMaG4ELULF3SU5Em9u+svZn
	z+eLxyHhVG9O/beLe4EJhLDIJUvRCa0L/zxplVgGP+Vr2Kg1HWOLW6yiYA1+nuI=
X-Gm-Gg: ASbGncuII0b0rxLOMEGKM+fFFRnapPcK7I451yJhyKBV0Ymz8mpwKy8wEzk66lvEL/Y
	TtFHp5v7NFDkPTFTthe4Tw8ysos3Ya+D85rb8AEttxZR778/5mwsGZ9iZw6fuj1WXNgTNMJDC42
	HyJ1IqKROMmGM+WtoG2+VuB2cLwz3bRWesLftesEx/Ho63NL9b2XF3llpDI+ZtOWNhGw7kM5pLh
	6q6435PsFazOkOAjRJO8W6v74Hdc9djFvtNHCJRylCagCWKcCQj7X+TQ3PuA3rT6LKe/SvXU4Yx
	1ML71L7+V+vwaZ0RYco4ZDkbFZqShf4=
X-Google-Smtp-Source: AGHT+IGDxXB1E+X6jTSdESQDd36Tzc/wr84k6EKAU8sGUlvYMhjz/DzYT3hbSvKe0KicE5yIGLmyJQ==
X-Received: by 2002:a05:600c:3ba5:b0:439:5a37:814e with SMTP id 5b1f17b1804b1-4396e78789emr14566145e9.7.1739626974755;
        Sat, 15 Feb 2025 05:42:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396181026fsm69929005e9.18.2025.02.15.05.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:42:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, alim.akhtar@samsung.com, richardcochran@gmail.com, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
In-Reply-To: <20250212213518.69432-1-chenyuan0y@gmail.com>
References: <20250212213518.69432-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH] soc: samsung: exynos-chipid: Add NULL pointer check in
 exynos_chipid_probe()
Message-Id: <173962697359.235665.7938168679485045244.b4-ty@linaro.org>
Date: Sat, 15 Feb 2025 14:42:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_054256_638871_444D0305 
X-CRM114-Status: UNSURE (   8.31  )
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


On Wed, 12 Feb 2025 15:35:18 -0600, Chenyuan Yang wrote:
> soc_dev_attr->revision could be NULL, thus,
> a pointer check is added to prevent potential NULL pointer dereference.
> This is similar to the fix in commit 3027e7b15b02
> ("ice: Fix some null pointer dereference issues in ice_ptp.c").
> 
> This issue is found by our static analysis tool.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe()
      https://git.kernel.org/krzk/linux/c/c8222ef6cf29dd7cad21643228f96535cc02b327

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


