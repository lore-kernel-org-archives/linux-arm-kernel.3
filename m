Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FD3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 21:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dUSsg5D1sQ/n6aucsx7OOyNbAsbZlL33M7HbOlr4DY=; b=rxtX9buvVaiu/l/hV1ovj7/q2q
	x/naCYZ1h6e6gJ2XwljHcrxvz3G/soLqmAdeyf2E+waKBgEIGdw11zszkKSZKDldFxlOaC7FtMy/n
	BCsDAtsyVrwNaKRJvgALLrpTcWc+S3+gSLJVQ6dTmvEV25iLp4Y9HXL+R+7axc1usg3zZa1p2dKBt
	gQL/Xk0iK/MYTX+B4TPG/zU+97ySEAKWlrIG6uYvttyB+4a0paMvQZgBmgNLIQYx+SvxBsqcmU9iW
	/nnFyKCkevSOlGiXT+ovFEXwsO+UrYC0P0E9TJ3+2COkCnTJxcKaZYSPhqzHUG6naztYQhjO8LE2K
	/WKffvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RGU-00000008Dg1-3N2k;
	Sun, 21 Sep 2025 21:06:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RGR-00000008Dce-3CNw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 21:06:33 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-25669596955so33989445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 14:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758488791; x=1759093591; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1dUSsg5D1sQ/n6aucsx7OOyNbAsbZlL33M7HbOlr4DY=;
        b=R+yiv/X8HW1NzLYrIWG2boDtV1AkSe9J/gVsM60FfDEmBDxzI9GwWrtgTKNqkT7MqP
         tVTCGmfbE2JEFSpJymH7OsBG2nuUUUaSWjqBjhUYYhiUkCLnfLceC9Q445rJkoL4UDT0
         9FqjrrGZTBYRy0gLnK0fKgrrszVzMbOOl3xfuVVMVddcdfVnoXCFkO1w0N2DXcoLuQf2
         kkJHTXdsgkzI/BIOLm04Mwf33Izd2SRCF3DoF7ATpkAbb/fTIOdIETeWadlh2y7lk6XD
         0qIGGzXy5SRuGlAbLHEmFq4hLSqe3lVf8zJmfExGU0VqzzXc8gSiOOiwIeKmOcm//JF0
         iTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758488791; x=1759093591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dUSsg5D1sQ/n6aucsx7OOyNbAsbZlL33M7HbOlr4DY=;
        b=UrMGokNjKgcpDgAwBJ4CXmHMuAg6hymfJxtoVDElBaWJ4/f+zEdyUhnuzWEJ2tQQ/6
         iMeWLKDGMv2xTomBdriWqmqitUDxhHUZRu4k03ZfLJTxckDhuSztO2bGRugc8lEJIB7V
         H+yl2rheGJ4RkQ8EI0moZSNp1+xVEjD3zQQhot1mZzSJmdMfNAWd3QpB8PxBLiG/jsAa
         mFUN0XrMS+DnjOvpzExzQga/H9G+dVCin/Lsx2ZzCMT6wWZa2D9JYXyePdZkbcbNneUj
         WUhwzYDuLZfEYKWpk4r+Gg+ZQiRQkrVhMyPLFODx1kUE1EirFuKB8LYrb4xIlyB+sH30
         C//A==
X-Forwarded-Encrypted: i=1; AJvYcCW9dyppWBgjzw2L0U9F3jqbUNR/0xmZNqxSdAHC4mM4LrcLjSVkAdtDmH2Vgqxw/ewdG1oilWB38CEaWkvIvP3e@lists.infradead.org
X-Gm-Message-State: AOJu0YzTYiO58rOlvXOh3TX28Q+/tOWI6vvO0XCPNus1b/qF0w59rqd8
	jTTu1O218vCQa9yabOtF339z1nLzE9AdzSnUWm3BcZbuwvok7TepfFe2oiZeWrXG/I0=
X-Gm-Gg: ASbGncvB762SfFW1oZeeAnv5LCDzgFX7HifYqz9MNTCz6UuT3xFhukK7zJi/5sJA9ll
	lM1WOn2D4sva6kAbhNwu7raMfxpZ22lcnzsJu3FFCrFG1iEAlZn4XWJZvQ8ukTp/YICVBfrPYy6
	KJ5KbYjABJbmD4SkRv+6Hj3t7IlHGTzAAQWq6+0t40LwnAQ87HTQLe1UdagRvz4EK727eN3uSxs
	q8GT60VkB+8c3eqDtic0m+uYIofb3ViADPQdggdpZDeBK+G8L+WZJuQMlbEIv9GXQubVsBOPgVt
	uv1Iadym31Qs/+oxV8lFearsLjkkqAbc2rrPwex+/1TI5EZBqspucQaCHaPP+pq3tccrKZ16mKb
	RYcQVGYbfqoED6TICkxjOVaZW3+dVpNSZaqxRJsoypm4VfDRGlPUEtT0voSx7djKDp7jcCF0yH2
	2j
X-Google-Smtp-Source: AGHT+IHZQgmOYDYkwaNRw5Ez0iNg/VNiStfoYUByPz6lPez924U30hCMS1gj1w6xAjrT5JiXzjQYnQ==
X-Received: by 2002:a17:902:e810:b0:272:dee1:c133 with SMTP id d9443c01a7336-272dee1c1afmr68492865ad.22.1758488790660;
        Sun, 21 Sep 2025 14:06:30 -0700 (PDT)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698019665esm112448845ad.62.2025.09.21.14.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 14:06:30 -0700 (PDT)
Message-ID: <84c979f8-2bd9-4d4e-8437-0b4d3d119586@gmail.com>
Date: Sun, 21 Sep 2025 14:06:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: rk3399-pinephone-pro: Fix voltage
 threshold for volume down key
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com>
 <20250921-ppp_light_accel_mag_vol-down-v2-5-e6bcc6ca74ae@gmail.com>
 <addgrqhxanzrjdhb7y7y2qrqu4odpoclbwlswuua4yqinrzh2l@wcdtuquzuqvr>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <addgrqhxanzrjdhb7y7y2qrqu4odpoclbwlswuua4yqinrzh2l@wcdtuquzuqvr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_140631_813753_28FCC40A 
X-CRM114-Status: UNSURE (   7.36  )
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

Hello,

 > So the correct fix here is to change both button thresholds to:
 >
 >   Volume Down
 >
 >     press-threshold-microvolt = <300000>;
 >
 >   Volume Up
 >
 >     press-threshold-microvolt = <2000>;

Thanks, addressed in v3!

Rudraksha


