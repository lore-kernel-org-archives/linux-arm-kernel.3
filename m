Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF4ECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJg0GAAknmDdoURqaMYxb4ci3e27SCLBJB5wjnR5uFI=; b=Rsvfxht0lAhNlMVAETZZkqS7xU
	a/H6ioI9YGQCKuHh5tFmwzcB458K/AMhWm2OX+Eakl8TZec6pvtVUdewe5I/EudOdwh1Lh2KXRTe3
	/2T+98GZ9yqIsQp9hQs3/1rbd6u0DhZavMIUE892SqsItxzhTde2R1X+mJltmo1NOeXCzGtwaW23l
	h3cYs28qwnoEoZPJEfATIlEye8B8/kNxIxJSR9ifpOd9LdhelSn0DszIsr+VHG8gvI6des6EhRJIV
	B+oU5GpnSS0dUyZa08AFe+iceK0R52BZ1JrXhIQYlSuxuVgdOo3x+XYslCveAZa2xuF2PchrwfPkR
	NUuHTFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVlC-00000002PSm-1Di1;
	Wed, 22 Oct 2025 10:08:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVl8-00000002POK-1NMm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:08:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42844985499so451605f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761127676; x=1761732476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJg0GAAknmDdoURqaMYxb4ci3e27SCLBJB5wjnR5uFI=;
        b=qWn8WMqK/Wmb9i7hUlBXdp23SPozeS9hafhsFB+EiIEvpw/kj2beUXNyPsdhYumfr0
         ceAXak01mDZ9tNNeO3JgzU7/zBA7GefqGhaTvfR/q4oNiniHIsXlc54t5pFV278jJ3Cc
         4Gg/fVNfFzJ5RXB1BdEALq8tcvvEvYaN1Yvs8zhzu9Hl+zmy1RRV9A2fXy/QsC5lEhG5
         +vh1AVI5mprE4mJ2YqfNkJyEiij34C1+dj1i55Sb0HobR4qA2kOxUVgxRmTZTG/rBLn9
         jn0KKdY6qzmtGekw7CjbmnEsIUQT5ND6Pp26+jYT8AOUrENHo61c1iivob7VP8baKsjq
         pxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127676; x=1761732476;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJg0GAAknmDdoURqaMYxb4ci3e27SCLBJB5wjnR5uFI=;
        b=LhF5oj2O8lxbmYfOfAORsZfYGKx/cjN1I31T/pmHwsNtqLv8PeH69gj+i428l7+rTr
         qPpeWhjuxRvMxh4AnSJVaoBpNGpm1Z0LJYTjoKx8isNDD/cLtFsjj8xSt23p5hInPu4N
         LwcF4qyJ7YM8Bsx1G67o282mv3WS4wVpgV1gKMxQHM2H4p2Yi6276/3RG9+GuImJgANn
         a+XJvqM77AOk46GhWuYyMFN2/qz5By3XygFsFaYJAtcGYxA9vMkMafWg0RnoZuvis0HF
         aaXj1RTOybwWrQ9x/CDLYv6Lg0v/kJp3wow9fXNr5Soylxp4IByXHLvRr0OE54VTaHjg
         ZQkg==
X-Forwarded-Encrypted: i=1; AJvYcCXH1njXaus+s4N4FAVVdXJIDAVArGfmmY+zFSGYNZfHGLO/13sOEzCNRu+zCI++9sfHXgFt02n2FX5ovAekDFsV@lists.infradead.org
X-Gm-Message-State: AOJu0YzlRB8TFrEvHhw+ghyacKq3bAXj4hi3ybzDPyIt94PyCGXSDFBS
	jmuP/hs7gZEbnADPVFgoa1fJty6oAiJ43ZcTI8fqq2qdbz/3KOPVGuTK9QLSANCQn4U=
X-Gm-Gg: ASbGncuHA1C5+1M363yQ54e2cy0vy+fcCT7wxAcoGUUYzfZ23UkR5ct7tOIyQ0wED5u
	SM0H79zkIR3vbAOz59sDoQET+88lkr11/oCgXOaopDnUwrZGutHCzFKq+6Rb4BOmhr4CdaTfq+Z
	GaHF6xIWEuIX+XJAV3BCTpoKIZOXfA76ZBfnzKt7Faibz/WacfQj6Z4w8PVSXMZwt152eLGOdUD
	oHwnE7QHKhzVq5jJDgmiUnHezKIywds1PvmufKQS+zwj0qZX1BEqrEJqw1iVAsTwrUay7XuI3i0
	/xeH8nl5SAiDtYb8Gwv1FmWO2fi5hZO36rdx36BEsNtRCVFj1HMDPm+JYKlOf3q1GicIOfIAiWy
	920fMvM3KtUgsVNzX+dF96jzggdX7EgWKgxr7XnOETY739IdyrvsqI8+SH/E9W3xo6ET22+ZuI2
	SB91vlag+wGtCPU1sReLK7PjmNkcc=
X-Google-Smtp-Source: AGHT+IEdX75qrN6US6Y5a5un6NzE8Q7BwB9wmhDu2fD1EZuWaGlaPnM2vNiBGgFCMMmy7GueZmz45A==
X-Received: by 2002:a05:6000:290e:b0:426:ff0e:b563 with SMTP id ffacd0b85a97d-4284e52d956mr2329372f8f.3.1761127676222;
        Wed, 22 Oct 2025 03:07:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce56csm24001630f8f.50.2025.10.22.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:07:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251021095426.86549-2-krzysztof.kozlowski@linaro.org>
References: <20251021095426.86549-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update Krzysztof Kozlowski's email
Message-Id: <176112767515.50428.16111691709369055810.b4-ty@linaro.org>
Date: Wed, 22 Oct 2025 12:07:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030758_392631_3CBCAD47 
X-CRM114-Status: UNSURE (   6.00  )
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


On Tue, 21 Oct 2025 11:54:25 +0200, Krzysztof Kozlowski wrote:
> Update Krzysztof Kozlowski's email address in mailmap to stay reachable.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Update Krzysztof Kozlowski's email
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


