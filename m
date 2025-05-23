Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4140EC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iy5yNbBCE1W2Xm0/0dFNF6h0KByQe6ipuUydcjP05Wk=; b=D35Y5BZv1VPXZNiQd2ZL30qoQN
	5KSnKOtEn3g5SRoRoiQCjt0iXwa9rwjGLxT+PbRu1FpRxFIUEc2PSWColr8lc0nH91eMYxwB8Uw3j
	VCzUlTcW8ki+CuyhdUsmnHek5zhkes1AGBDsnewf+PZtBPbbQvO50T++LlJyeW4Vl0CP7GqAsdTUW
	BOo1foTMPje2Y302VZd9IK/+7MLwEW9zXUFXB4bhU9L7s1/b5UJvfzKM7IcINoZ7hvXfIEoc9wlKM
	LQVJEOg8utzVPcBF4UOKNJJsmUuxKaFbG5bKIVp8IUY+3I0/37LWoQyQX8AQIkZ5t2VZhuTGbLgNH
	ptS+VZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIR1i-00000003lEA-06b0;
	Fri, 23 May 2025 11:57:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQxr-00000003klW-0L47
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 11:53:28 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a35ae46214so916158f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 04:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748001205; x=1748606005; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iy5yNbBCE1W2Xm0/0dFNF6h0KByQe6ipuUydcjP05Wk=;
        b=RVh1lzwecJEDU8oTItCGXpc67LR/ZDuFOTq9+eOs0FuVHR0Ju+dxaImcYtvuM8AdtI
         u8rxPMUo5CUxQmweH5O5mQkQCD76CduFLiZpSB/wSLumPSmdscgsS9YfBRn22HuKo/Vy
         Ihhq1ANmuMAuVDcM713GWlbBjhcxvJZUegaRN4avCRvoqXlulM6HpEge1a/W7N0Myctw
         9y8RERsKVmEKZhXN9oU9izEwHu5+650SuKUCTBE+mYn1ClNarXePE/1qI8KkiRdRBITB
         sfA0XOhGbJysDd4mMlsOeeh+7/50HgyukkrQmOQhhx3eepJOTShdRxyx81YAHBCCk6eA
         wlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748001205; x=1748606005;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iy5yNbBCE1W2Xm0/0dFNF6h0KByQe6ipuUydcjP05Wk=;
        b=MvOyOgTQ/Ga4H41yqAMXhgtJNaLLTmqX0L8NIpZ2rR8lq3svmMD7B+f/NABVscyg6C
         F1MyvWQ5tR41geS58zd0sGlvvhY8EdI8KI9mJanVXtDxyzWTp06cm7f2GqhsoaQKGkEP
         GW7KTtvEOXKM9fJlAhMIFT5tTKwxtIjQU6YbCGVmdObGPBRJnglrbpxYjJ+hu3ooO5JT
         sgXEIkJgKkMB8jIVsoDaTqoAghaUwMWOzcYn+YQb/vz7AjjjUq84maU7AV6QLUNsz4qG
         JmSw34yr/DHvi3iasDwQ5h25HaTyy/FfO3Ky72bNyLgHEP+rWFCpU7XPeAxRU/gQQYzV
         uhRg==
X-Forwarded-Encrypted: i=1; AJvYcCXi2gTXlcgLu3kbImA/H+T5djL4CM7Vhm2/eMw2eO6+L0F2tkZmfbztnKugrQM0923DhVbL7764S4aKfTzaPdws@lists.infradead.org
X-Gm-Message-State: AOJu0YzE6zVYioGFlv0rUwCtCBLR2UlN3VU4Eb422qZCiZ/vuNAPNTJV
	NMhnEGbJ6KTQZT+KD2iLItcBiCJpdak4k/CIh5cykVV56Zxp3menzSXH+mD/F23R2GY=
X-Gm-Gg: ASbGncsMToZ2xr01f25JY4bTELHbTJnWSm1alaJ+Hc0YHtidvVhAWWXpjlvO73wjQQn
	B0FNLQuI7kjZ25mxuLWg3KjMVkurpzwGl3nmRv6JPud2/HI9kCVaVfPvKVt1T1ahQqxxkiCFHWq
	jN9kHvzp8+PBJfHG348tVVNV70jStH0D86QttkiqG2yvJaz7VIsuvoO7LIyXc+YwPQwr7SmnjDZ
	+CJNfN/KQJsgABRzIOmIuhn3vCgSLh58bNnKAdSFxWeelGjYfmEepvtZriShL3XCTgWePH20kA1
	a8BnAo6ZqjMwdcR0Vmfrbt6ut5hT1rOfkPBrqo5T0jyjE5GdAhdBFMlCzyKYfSzVNqa1Z/paVps
	j/b+EKA==
X-Google-Smtp-Source: AGHT+IGiTwOziR9IJT4L99QRluitOH1c2cD1keE0P4ghCB9WrBBBN5jemRn4okE+9l904fpaxzyugA==
X-Received: by 2002:a05:6000:2889:b0:3a4:bfe2:87c3 with SMTP id ffacd0b85a97d-3a4bfe2895dmr1886237f8f.7.1748001205428;
        Fri, 23 May 2025 04:53:25 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3674fed67sm22064799f8f.89.2025.05.23.04.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 04:53:24 -0700 (PDT)
Message-ID: <86b2d83a-aecf-4ef0-ae02-c8f6bdc72e5a@linaro.org>
Date: Fri, 23 May 2025 13:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: update renamed PHY_SNPS_EUSB2
To: Casey Connolly <casey.connolly@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Eric Biggers <ebiggers@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, linux-arm-kernel@lists.infradead.org
References: <20250523114956.457102-1-casey.connolly@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250523114956.457102-1-casey.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_045327_138684_C593C385 
X-CRM114-Status: UNSURE (   8.11  )
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

On 23/05/2025 13:49, Casey Connolly wrote:
> This config option was renamed, update the defconfig to match.
> 
> Fixes: c4098f3e6134 ("phy: phy-snps-eusb2: add support for exynos2200")


No rename there...


Best regards,
Krzysztof

