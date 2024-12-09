Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F22E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 19:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcInZ7cAZWZG8+HBNkE/FJUcMkaeDAVgkLqMgxcS4kQ=; b=Fw4cB3mde4A72/I0U+gOd8H5pL
	vtpUZA76L62L2mvQlxINFTVr/8crDhzo6avO+w2fAL9t3ht6ewt+eu4QSgKIJtkSrzUIKVrYw687n
	MAsXUCc5rwnMx4aVcoSlp5g0tZStF8DohCpkhH0gClkAQhuXdVLXCW6Z+u0OVbqaVfBjdln5yEeKC
	UTlmjTGYPCupfN/np5C7MTzMnga0pPL+xPcfKFSYtSTRcBZoN+l8bJEV0FsS52pzSLQbfDp1eOliw
	KHw8vvyePC+xHNM6z8Pv5NCpofxvqMdfbAfVSICTjCnyefXyGLaY7H/uu6VsO2PEa/n263MSxBshI
	Ky0vu2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjpT-0000000966n-1mLN;
	Mon, 09 Dec 2024 19:54:03 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjnU-000000095rc-3QhV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 19:52:02 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3cd8e59fdso356508a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 11:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733773919; x=1734378719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcInZ7cAZWZG8+HBNkE/FJUcMkaeDAVgkLqMgxcS4kQ=;
        b=g4A/yVeQZhY2b/EJbfFKdZa1LRlQei7THwH/pQOhTOFuYOnstjnCAgg43dBj7fPwjD
         Va/zXYnXZTf9O96S609wsshmpattiP7w8mui590KC7LDNp4JrjY61Ez29MWgKZCK7wU1
         sbIA13TUaWL1QRcqufsyrbRj97DB+qfAyFA//jSX68YEYhBhbj3s4wMWDZEX9IW/f/DZ
         jqKFHWZgOfw8yhH4Tkd+lLebeu1cxPWVAVb819JXXytSpoK23t0Y0qIDMoFmZjqGGeI8
         ll8yaJmAhr6no24s0/VXDVGF7o/H/xtsHtjFIw8jOTWoLb68Oh/ucyTkAPfWuWIDGSaJ
         MV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733773919; x=1734378719;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcInZ7cAZWZG8+HBNkE/FJUcMkaeDAVgkLqMgxcS4kQ=;
        b=xFtzMbqnc3lm28x4mWpef87MbH4X+ANQZSGhEBuA9cuJrRJjEKPcjw+xKjHbZuS7En
         tAEJ84qkH5Ikx7MncqGT7sGp7HFVLl4novI7FnTAb0uAAKt4jDie1eaSfypf6g1mmso7
         Jbjpahw9cwtA/Wz4R3MPqwDzXEYJ3R3nk5gsNvQYSZKj4jy1kb1Z85qy98Daks5woyC2
         FLXgAt4WZuBZPBYGQ3UwT4WIKq/0zZvau2a8z5kYDldtpWI1ecbZz0gTbp0NK95aiIRS
         AH2b7xGlhrG8vzEb3ZfHFIA8PgRMmmXTtKvfXSsStb2eUGjZt2aaozAc4muhahWkC7j2
         Dz1g==
X-Gm-Message-State: AOJu0Yycwzh0U6U3/K50Rqc/ZNjjc5x/aMi4U8weqJI6o/1rDc5W1Seb
	99QQSSzjVL3SJHPtoR5NdYiCVtAFZhstrJd7c6gUlsAb23Hfno/kBZWPbMkWPPs=
X-Gm-Gg: ASbGncuYB1s1GKQpb6AD6GipCamPUt8viQEOz1gsuxhSB1A+XCMdHRtzi7HXez0HZ2f
	9wC9Id6TnvCgSMJx8bdxObFTqKG8YFlUD/D/7hT2375ACNgi0gAdlhOqoSHDOkXTwv7yVMQM7El
	Gzr/wDAzJo2i28DgLHkkKXuVD3uN6qQqF5TWrPik8G7wfx9g0Cp2OIBGS+0lJOm2XaMmCBf9ViM
	NinFFNdbV8Qr6zZcGAK1lDuXh0O/NdKjjoE3OrGz3W32QamEA3v8W0/IP0/biCRLiZW3g==
X-Google-Smtp-Source: AGHT+IGZXsH93Y0M2+nnc7IYqxUfw3k6tfsPFGPEyxmWBQNb2mUim2xJZvm/VhaZREPeArDMlc7Kpg==
X-Received: by 2002:a05:6402:350e:b0:5d0:bcdd:ff9b with SMTP id 4fb4d7f45d1cf-5d41c65121emr353310a12.9.1733773918716;
        Mon, 09 Dec 2024 11:51:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d475ca85sm4539151a12.47.2024.12.09.11.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:51:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 igor.belwon@mentallysanemainliners.org
In-Reply-To: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
References: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
Subject: Re: [PATCH v7 0/4] Add minimal Samsung Galaxy S20 Series board,
 SM-G981B and SM-G980F support
Message-Id: <173377391743.160715.4680965991151574957.b4-ty@linaro.org>
Date: Mon, 09 Dec 2024 20:51:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_115200_873113_C118717D 
X-CRM114-Status: GOOD (  12.62  )
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


On Mon, 09 Dec 2024 08:00:55 +0000, Umer Uddin wrote:
> This series adds initial support for the Samsung Galaxy S20 Series and also
> initial board support for the Samsung Galaxy S20 5G (SM-G981B)
> codenamed x1s and the Samsung Galaxy S20 (SM-G980F).
> 
> The S20 Series feature a lot of similarities in their configuration
> and internally Samsung named the common devicetrees in their
> downstream kernel 'hubble', please note hubble excludes the
> S20 FE series and Note20 series. To accommodate this, I've
> now named the device tree common's matching the codenames
> (x1s-common).
> The device trees have been tested with dtbs_check W=1
> and results in no warnings.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
      https://git.kernel.org/krzk/linux/c/2e342a80b02c64d2bae6f1070c473a8a9c7a5b9d
[2/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (x1s-common)
      https://git.kernel.org/krzk/linux/c/38794a41be2bacc698fc520d75d3aea88c727a01
[3/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
      https://git.kernel.org/krzk/linux/c/e7c075846d0be40f6238ea9c784c5d553135c1ae
[4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
      https://git.kernel.org/krzk/linux/c/4ccb27d48a73d8be0e532353d0d9445cb52587c9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


