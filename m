Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881EFC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0X0JZ/sJPZkI4lLJkZG4Lcqmvumgx8c7FdFwse+1v8=; b=j77G+GFi3GXVk7d2sGfgUVA31q
	QTyKH58kxzoUr3mRimyezZZPu1xgbengT17Pq+QC23ZWmjMVQZezatXnqSpWzdTfkGOZXvmjhsdfP
	dqfgFxyz4o6qNgWUZabZWwC+F2wgA7cVKX0D6rU4AqfH5ObYCrJ0sNRUOstuDoex9jfwcxoEYo4Rn
	1cZj0IIjSLd85SucTUXrzMUkHlHrHiVuXbghuN7NBXJupBOGOuY+QeUqIGiDhsgoH5SRi6FBBLMMy
	SkrrNbjumLcr03WUgYSIbNloqob5smcOamFFfyFOT2kKEIulc4qWAkX2Y9z5EVhfWUm6diMZN7iui
	Krjb0lcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AcG-00000006hev-2DAq;
	Tue, 22 Apr 2025 10:12:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u782j-000000067By-1qU0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:27:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4394a823036so37934855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745306864; x=1745911664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0X0JZ/sJPZkI4lLJkZG4Lcqmvumgx8c7FdFwse+1v8=;
        b=RwIA429DvvZeJVZQmZEXqR6WPjjtohtZkyg8FKwaEkQIGB9rTbvWz0AbdRPidvY7pJ
         R4BcTIn5b2cHy00IzCZlR3+r6QYW6alCCnjHiZic2Hg7OccZFXXY1Bzcz8FpyCsPocTN
         kotHTG0y8BJi3HpGDVXhVlZ5K0sPvX9vFbP0+3Hh57CXE6BN6gQK3ZeY/FLuZrVLVWJ/
         7OWjsnIejXUPVEnXYVeROfzCk6VvXB8TJxfBbK+cPY2K43qZBJBuX2v7yCI/u6pzG8O7
         MFzK1gkfjjKksoKdBhieRkNToaq9zpPCNWEhM/yCovbZKNz7xkGfa9zojP3tpHIve250
         yWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745306864; x=1745911664;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0X0JZ/sJPZkI4lLJkZG4Lcqmvumgx8c7FdFwse+1v8=;
        b=sE+joUaqkFtoERjP9kVmjAqoAO8wJYSjDfeLTzz3OYO5cGVLG2XCktp3E0ZBEy3nxB
         N8RZJIuNcjtGwp16xkKsB0+XCcf3FZABW4QbPyRbG/McsMqQIbgDmV2O3sqRpq8FT3N6
         Mvpm7V9LHnvkD3dPRq1SeMA/0OXVczlfj5pVG4BIsKY68QDdf+btOVsqXpVBf3BxJBMg
         P40/q8RRsD2eCjxBDwyjlUCLaRosfUsIgkt2rcGx/svQ8G7RzaeIE96HB4hPtfrVL+AI
         w7q7X5EuiIqXLhcVih4fEhOBJuhj+VswVr34M5hr3zFEXMnoUmXeu2Gg3F0NHHXOPY2e
         qJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7+ogCfj10DqnsxOL8sxXPagO8toGn1TbZ/gF1+sljnYDsssPkHq9Nt9j39NpYTJ/kGe/ICb4m6aMQiOREvfkj@lists.infradead.org
X-Gm-Message-State: AOJu0YyIOaeduJtXsvkWjKi5eUnfJ+1ztu3SyCVE2ng5+T4VCfuxxX4H
	SRU28j4kGjg8h+xonhJ3eP9Sj6DLD9PvydojiQFnfpjAkV8zmJv507XRij8o1as=
X-Gm-Gg: ASbGnctn2mqiw2al0EFeJBy1MPNFKM9dS6LzH4mMADjtBDL2OlUCyULWMgP7TvS/z1i
	kR6InA3/HQbwir26RmVAvlxboMTATtQWfdWZLYEWKTrVas6iqK8AgVy7Ut/5enUprxCeNOSXQHM
	eyAKL81gJnt0IFjXcSn+TmgPx//RtczSgio6Cix7rJT/GOVcDOeLwNy4xCk9FKYe+aUgOD+otlk
	PfgDY9RtbFuhnb6es6V044cZCzUJFPMyAOZ/y7Ek5m1Jwlw/TEk6LAmNcCTIrHbSslGoN1cR7it
	b0LZE016qpOEUTSUVAKPz2cCYMeTP6knhu5u4VoDW+J5RJpNsCZp59F/VHEyUA==
X-Google-Smtp-Source: AGHT+IHWhiVi1ueArODLM6UBb5a4IpmaUoKJy65slIk54wuHnzDLgvlXzR90XdNucBZm/loWgUlT5A==
X-Received: by 2002:a05:600c:510d:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-4406abb2066mr131093765e9.15.1745306863720;
        Tue, 22 Apr 2025 00:27:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d7aaasm160798255e9.39.2025.04.22.00.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:27:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: jbrunet@baylibre.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 christianshewitt@gmail.com
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 0/4] dts: amlogic: fix FCLK{3,4} clocks for new PWM
 controller binding
Message-Id: <174530686316.2776757.4066244887775087849.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:27:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_002745_487977_A8202077 
X-CRM114-Status: GOOD (  11.52  )
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

On Sun, 20 Apr 2025 18:47:57 +0200, Martin Blumenstingl wrote:
> Christian has reported Bluetooth issues on some of his boards, for
> example on a (GXBB) WeTek Play 2:
>   # dmesg | grep -i blue
>   Bluetooth: Core ver 2.22
>   NET: Registered PF_BLUETOOTH protocol family
>   Bluetooth: HCI device and connection manager initialized
>   Bluetooth: HCI socket layer initialized
>   Bluetooth: L2CAP socket layer initialized
>   Bluetooth: SCO socket layer initialized
>   Bluetooth: HCI UART driver ver 2.3
>   Bluetooth: HCI UART protocol H4 registered
>   Bluetooth: HCI UART protocol Three-wire (H5) registered
>   Bluetooth: HCI UART protocol Broadcom registered
>   Bluetooth: HCI UART protocol QCA registered
>   Bluetooth: HCI UART protocol AML registered
>   Bluetooth: null: hu 0000000023fa9791
>   Bluetooth: hci0: hu 0000000023fa9791
>   Bluetooth: hci0: hu 0000000023fa9791 skb 000000003f7acf2f
>   Bluetooth: hci0: command 0x0c03 tx timeout
>   Bluetooth: hci0: BCM: Reset failed (-110)
>   Bluetooth: hci0: hu 0000000023fa9791
>   Bluetooth: hci0: hu 0000000023fa9791
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/fixes)

[1/4] ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/3409f843c04df9434beb637602382eeee90e0bee
[2/4] ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/a994b58f9d1163c4f559bd169721f0fc15866919
[3/4] arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/511d388a4007ba580feeb2fd2e9ba35a614c093f
[4/4] arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/a08b28c1ed454502abeb90ffa4a55445dae1d22a

These changes has been applied on the intermediate git tree [1].

The v6.15/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


