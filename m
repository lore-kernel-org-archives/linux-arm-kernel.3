Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073CFC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Spb5DN7Z957auhFhK10W01ysEwluGPWuq85ZNm+0g8Q=; b=3wYtGf2iSNgjPdVr9/7kckA2nt
	5LWda6YKg70QuG0zrdY1h7zZnpHEInYc7dN9BifeE/gZ1FY0iVY4VxT/mF3eZuVilh4TinQejlmHP
	mVKcJ1ia/L7LUmAodcyHAOXU3YdDTPAOqTTG8hzjGet6Yce9whjJWVWkhE2ZF4T+1qX0Wwp0Ef3b1
	acKG3dbWCNuxImyNXtVVqZ29WNQ1udlHWgMOYplBizxRzNKgytw6zicOM4agUejZTFfLBS1xs7Cd6
	25Amwa8+pyLvs7DsE+qD3yYxSjZJy2QySAyK5jErm1NRMmfBaiEZB4MFFoqoMR5DADD4wKZ1alZus
	k9QLTLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9gq-00000001wXj-22Kq;
	Thu, 20 Feb 2025 16:46:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9dK-00000001vX8-0HF9;
	Thu, 20 Feb 2025 16:42:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f265c6cb0so634676f8f.2;
        Thu, 20 Feb 2025 08:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740069760; x=1740674560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Spb5DN7Z957auhFhK10W01ysEwluGPWuq85ZNm+0g8Q=;
        b=N+Ngk6zP1bCIJRQbQeDz/SgXyDNJbLklng2avqanLjDWAJPsP/bnGVZfV6T1MtEsqN
         vLP28T2oPHsYLvxQDpaNMd/FD7b+TmjkVy696d4ZLrkGP4RxoZ4hjG1REhc20ZWK0kfX
         f7cc58YXjwN9o4+XSxC+Cp2TfH/FzNe9BJaji7mDMQO0GZ9pia6xPUHFiE7nWqvEdK0h
         JsztEDh0VvztYDsDWIOWagJiK3M8396rABChi7+ABEvn36LrAyCV39j/p+rGv6RxIT7v
         IvL4nUEhmB5LwIjiG0+7VlWdSblLMD+J8I/xDd2b072OvCz4qNdBHo/3R5Pit7P+Cgkx
         BD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740069760; x=1740674560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Spb5DN7Z957auhFhK10W01ysEwluGPWuq85ZNm+0g8Q=;
        b=T/c1JU7kmnWrXo6FW3Gbttet/vL8unxo+WZ2YmqPUQP1zFqLY7cBSD8A+baFxFVw93
         UMQs8QofVQgEro7MjKZTbR7O7r7fMT1lCLIzT53uKSE6Nysv7PaTVHwJK3TYpQV8KNcq
         RGAJ0i2mHZIS9tu0xyuS4WyFfgp2Q3u9ERXfUTTAq+Dd5lBB8LzdPFpuPusghJTpcyzX
         SZI2SaQ+xhiCnQ9OfBYTW6Rp5oG/2goX8/Aj1SfzT8HE7Ira5rxRlpVLF+vjWa3eyDYJ
         GiTwpPVL+CJIpk+A7URrzMaD6IeyBB82aHM4kmfZ1maS9LkgaR1F8YFS7XJVksvZe9rF
         C2HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQVdV4CNNif4AcJZ1oboZBQjEYZWXyDOZhE4EBJDZ5lRI4vX+JvkcqT2m7ykM7BFN/k/XvXzQNYFMGy0w=@lists.infradead.org, AJvYcCX8KbsORSgaZ7PNjieBmQ91JhK+bsdpn4vDwklRo0Fxp9UNduxc45WTuwYgrj862JdU9C+MlbAs9x2UVUaJNOIO@lists.infradead.org
X-Gm-Message-State: AOJu0YxJWv3jLjFH9+lN9rMz3W+Ce6V6byoKDA3Iut6o2gVT/Qr+OenP
	OwE94yXPus+3X9T+BfOH/qRTz8IXfC2e+j24eLthrxxXd96FVz8F
X-Gm-Gg: ASbGnctTXpmAPOKFTw2oH+nD4wDUOVLoHNgE5sTnyDdiQZw6mTwMiNNCGCVDhSDBMyN
	xyFmhemKKSReXMohkPankzl1kHtjMvmCep4nroRB4tZMHzsFV9aYo/CF0EF6yzdkbjOTdz5Balu
	VpoLa9KB3NZ/AAgnOs8OH2mLxVyFL03NvpJoqOitiaBB25VwH5LtJyVHLa9Txh4n+5r1KizB9j8
	XNi6Plzj/DAn9R6BW5wLEYcKquhfwW7jubwaezA9B4q9Ojumzy34KhPMtop53q8DavMzQ+9p8tu
	M/9QqiLc0vggfxQxB9a7H0O3gDSzjVnMiIDCSdhWgi5RNaT0FI79w0YrudQXaIpyQFU=
X-Google-Smtp-Source: AGHT+IHKAPnHG28kS2PXP8ZMEI3ZDWU7Yq8EPs8z2/DhkZ5Cc4K6VvdHC46lFrkP+dx+zXRT0tV7pg==
X-Received: by 2002:a05:6000:4025:b0:38f:4176:7c25 with SMTP id ffacd0b85a97d-38f41768063mr14903972f8f.2.1740069760495;
        Thu, 20 Feb 2025 08:42:40 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5c29sm21139863f8f.72.2025.02.20.08.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:42:40 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Aleksandr Shubin <privatesub2@gmail.com>
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>, Cheo Fusi <fusibrandon13@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Thu, 20 Feb 2025 17:42:38 +0100
Message-ID: <3688166.hdfAi7Kttb@jernej-laptop>
In-Reply-To: <20250213094018.134081-4-privatesub2@gmail.com>
References: <20250213094018.134081-1-privatesub2@gmail.com>
 <20250213094018.134081-4-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_084242_100407_244B951E 
X-CRM114-Status: UNSURE (   7.71  )
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

Dne =C4=8Detrtek, 13. februar 2025 ob 10:40:14 Srednjeevropski standardni =
=C4=8Das je Aleksandr Shubin napisal(a):
> D1 and T113s contain a pwm controller with 8 channels.
> This controller is supported by the sun20i-pwm driver.
>=20
> Add a device tree node for it.
>=20
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



