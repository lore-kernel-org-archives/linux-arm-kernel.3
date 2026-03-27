Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3DB10BA443
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQ1yZdSv4qzrzrFbTamOK/pWWsZOMgXzJj/IX5g2c2E=; b=afG3b1nB/swfHMFkLgjt6vCgjM
	Ps1ba2tYEbSwvTeLcEZZ1sp/Dhpu0sAr0vVrOjWTdED+19blFX1L8E4FTR13u5kJjjVPH4R7Gm+kH
	4B9rlSS/OsYi3WcRtqBzu4QJlqXexeLDSWyGxqyD8T8qaNoCQQmglD4F1NF4/M9eTbw77lEhqEg6F
	W603OF18KrCKFNta4hvqtYU/dEufqzJy+6hXRxk/oqB9lfo0YSkC+AL7MZ4E6kjieOGdRHWp8ZfOg
	soLSHnOkbK6udieNcopCOlsVOvxXt5y52sLfTlJzxPKyH5hCC5NdscUZ/u5jikrAK1wbhvvOqW6Y1
	Yb1XuxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62bI-00000006yOq-1hGp;
	Fri, 27 Mar 2026 08:31:28 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62bF-00000006yNB-0HyD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:31:26 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso1316397f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774600283; x=1775205083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ1yZdSv4qzrzrFbTamOK/pWWsZOMgXzJj/IX5g2c2E=;
        b=gYORyIRgLBd+g95CJef+YStWAyLoVqd/DbJ8DfofTjP5D3BkrzqssAlxK7N6vVoAB5
         C8Bragoqr1QRnLqX4EWIfB6ArCgUkuxK+8h4dmJq+hDttWXw4+tXlwM1B+VndWT45FVd
         qRCJmrC7GbwS5e5nxrjfADPZ5ZN/vI1OjemOhOnHMwd1/JRULbeL6arImwOyjlPNytzF
         1v1QyUiEuiw49IE5x6mh4FtJlQJs0rwatk5uQONpLAomzKNnO51PdXXVivZEL1/rXmD5
         +FoAgcHkcJdoNmkaeDZmzcrgRY/b9lbUuMT44WEIYkRyjl3wuktwv9OYaUxYZC3xsObN
         1nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600283; x=1775205083;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQ1yZdSv4qzrzrFbTamOK/pWWsZOMgXzJj/IX5g2c2E=;
        b=JunmCI2/pdpA7SaNNKg4gVTCuv4Fg7idwXKM1yQ//X3fIcJydNy7eK4I/fCH4bOcZC
         wWBPeTY6OCncY+Csk9vIUeLt8ITCYMk34ln6YXVh314XS0lYB2xj2ZPlQvJec6tcuMDf
         FMkxximgeF7YlDzMrJSIhGgAbn2jC8n22Fg/sK8XuPFaTfdVWVjPRFM7IwGOne72y39b
         ZU9Ftgf93DM9xWswP53ExX8KDzmkmt0cm3pUIHiKonKmwkWHtl+2BsAbxkfijG7dejzw
         xYB8PEGTlGCzRWej6CUsbwNFpZKnI2Fy3Pg3JKjWROT0PaqJQjS5enpXU09Gxp/AUlRr
         /HzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXXQ4rDSGx/fDzUHxyfIpJ/jJp3yJ3tQLv2BdmbKp/ZHuWfudr8jePBngigEdSEwqSS2k7mWmmC5GSXNqVp8l2@lists.infradead.org
X-Gm-Message-State: AOJu0YzK5o3SwtUn9ZQtCFUFgkboS+nWsNEZtd3SVH/ikF+Um0SN0E4c
	mqwzhNjQGC3+RmNOa/Fpoka761P88olfMj9an2Xid3YlJf9zN++2iNttq2yKnRXDS9A=
X-Gm-Gg: ATEYQzyULtNu9XbORkiYgxyglCLeSgZz7maO26b3KAou9pxHSHo1XAGWmbh+H6670Ap
	8Op3SQYwpN08hPhATigSO/KhLbxcRpquWyDTXZoJIOEXK/fG9Ko0TAlWWtd9mAVTWfPggdN0P7P
	Arog3a515rDlctTelk5X3EVYzwKm+uDhHDOulmyvtZ1CxAnlijueELx78FX7iezWDxhxN+/jAFb
	lYgZiOSg5kolNFcJRnJFHkC/j4Un8YpiBZ2SxfQlaMbuwxVki8FXhk+Utz9xlbNuuzhYwl6vslM
	tUTwB7Qrbn1aHzMuaBuEDW36lxC7tL4xt+xCKn6l6TlW8pntTJIIxsqUZfWWjswGnLw5VjacBgq
	khc3kN2A2xu3i3OIgFw8E581Fu6GAPQ7C2fcDKjSx/u4SXkILEVxh2MBoozeHkFsBt05Y8JNxe3
	qxnIb5r1pM7R4CrMdUZzkFRCiDiYBmidqXWe26bCj13Or3
X-Received: by 2002:a05:6000:2505:b0:439:caf7:a5e5 with SMTP id ffacd0b85a97d-43b9ea46754mr2454666f8f.31.1774600282992;
        Fri, 27 Mar 2026 01:31:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9179b212sm14490849f8f.0.2026.03.27.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, jic23@kernel.org, dlechner@baylibre.com, 
 andy@kernel.org, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260325070618.81955-1-nick@khadas.com>
References: <20260325070618.81955-1-nick@khadas.com>
Subject: Re: (subset) [PATCH v3 0/4] iio: adc: meson-saradc: add support
 for Meson S4
Message-Id: <177460028211.2323693.5107431910130043283.b4-ty@linaro.org>
Date: Fri, 27 Mar 2026 09:31:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_013125_140877_3932AB59 
X-CRM114-Status: GOOD (  15.10  )
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

On Wed, 25 Mar 2026 15:06:14 +0800, Nick Xie wrote:
> This series adds support for the SARADC IP block found in the Amlogic
> Meson S4 (S905Y4) SoC and enables it for the Khadas VIM1S board to
> support the onboard ADC 'Function' key.
> 
> There are no known hardware differences between the SARADC on the S4
> and the previous G12A generation. The S4 bindings utilize a fallback
> to G12A, but a dedicated driver match entry is included to ensure the
> correct part name is exposed to the userspace ABI.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[3/4] arm64: dts: amlogic: meson-s4: add internal SARADC controller
      https://git.kernel.org/amlogic/c/3b095e9b3674da0666aea3021167ca44097ed7fa
[4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
      https://git.kernel.org/amlogic/c/97c4d4b7de6ef264fbd45300a168c2a0874d6c75

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


