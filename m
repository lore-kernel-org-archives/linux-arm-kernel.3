Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8676ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FudAgAKSc+eWc2hWehqLWzQsASEKKgo0Nzb21vtErnQ=; b=mJWLHkhntjO4kh0LyKte3IGTMg
	Ukyb3YCJxR1UYYac0MJLb/gE4Ms/VwfL9gUQLEoNQHFzrIL5Z5nboAMJucru9VILzyBQ4KBflavdb
	+6k4WvmbH8nMUiaUw0dZS1zCM/cuTXVntwjPiw+gLE3RrhsAXcVcYzoHZA4vPq60z7rRDp2dtOkM9
	qX4Zw6NNiTmRMKVol+ZavG90A0qTUiaC6o/rn/Q//e1f2gZ/niII3FB6Wqlp/cK9Ma8nwdCLRe9af
	sjnzZ0CS1j8heGDUQlxQL2aI03gtwCyT4hFizeXuG8+Qg6MRA/VBcnwHn1nZEaqDgIoqdPNIycOEg
	cRdHcOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkEn-00000004Qr9-1cm3;
	Sat, 23 Aug 2025 09:08:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upk6q-00000004Q2n-1DAS
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 23 Aug 2025 09:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FudAgAKSc+eWc2hWehqLWzQsASEKKgo0Nzb21vtErnQ=; b=UyZYtLKbEDedqV2lreCmFt2hMx
	ckRtS7x0x+8aCcrpBajJT8f4Rj7gMSey4gb+Ko+0ObShpKH+DrtR8elUYpru7vF1cOhJegi897L1k
	xS1WA4PezH1yms0sBEXaqlhMWWPyCGySjXvyEiTyUM/ljjMFqSHvbxbdL8JulTFjWIptBjQugJSPS
	N+bO7pjfIpRim2r/gnC6m9xsh+rBVlVI7jn7X9K7TfOW1WhDfl6pOYifKaGf7QyHy6D73CCtv85ko
	0YODqS7qM76CVGgOjsKl+VUajoLheV6MeC/6adxLHX8ejJLuIRD/RvW1e5qwa4dNbOnxmeEfcErBe
	GEcbKT6A==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upk6n-00000001NUD-1b8C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 09:00:23 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso358812a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755939618; x=1756544418; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FudAgAKSc+eWc2hWehqLWzQsASEKKgo0Nzb21vtErnQ=;
        b=qda9HLisjIBiQwhfEkARUd38T69x57gZVsdjjSa6qdLkhPnbQslkjLK5NfL2xuEldW
         l+UMlkEMIo0ado4DDOW9L6Mvd5Yy3S6f4xCEzcJBrQeo1hAB4mq7STRhEzfAQl+gHAo4
         lsr2y00xfR8t5yB6eOixPzjx6Bo8noQCWt+0U7AhoZ018S0uCD4q/6bHRnIjF87CX+3q
         mA0Ybcebofan1gFwNxfYhKh9d9Ir7XIQYG+r3FWTJoKyIDfJX4W2nn+E0s7D5LUTY/be
         RxrvPWFap1NN/QnCuBKthOS81HPjBx9VyWFGMWBM7F0EGsvOhgHcy1jeqz35eIdtSBbf
         m6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755939618; x=1756544418;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FudAgAKSc+eWc2hWehqLWzQsASEKKgo0Nzb21vtErnQ=;
        b=gPjPsYlIkCz6uE65ieqJFNIGXiCzpqKR5qtCybEI2rFSOFrJaVENyE97tAATtAMDRj
         Lf9raTetTCgJ4+ZvWN4MYF7t2y7wRcTZ9+fc5DG2wqu80f0kb3g8ol3ELKI078lfa8cR
         tcTMpRWafJXzhhBmlqqeS3E1Pb42L0XmCvFGYpzIOu+WEqYSbQTFsawRQN9zVZTmAxRX
         ZztXPzW/Uyb5032LBqxeRXIPuIcNWEfVWNnjb6Dr6qFpWl8G2hctWdjOBhQeK6XuyPlH
         vrhvYkOgsWv6wBGQC3YkB4TTWj3UoSowprHdcdQgZ0nYQ9Nj9tYDYHLxeXEO1Wf1KYH7
         9vCA==
X-Forwarded-Encrypted: i=1; AJvYcCWc+Od4nRH4A57agMpkCt33IeR+uwTbvBDq4DtgCxG/MRXY++R9RyMjRMSSPIQ/VM/8crGzo76Ez0wS8QeMqxto@lists.infradead.org
X-Gm-Message-State: AOJu0YwDXIsDinPLRz+aRiCKbRHtoDX8cGbnheyLneM91ra/oJk3QTo7
	KZ371BtPeFvYZQ9QsF4bxq2qgfxZ/qLWMleWpOb+ok4jc6zDBo56CMheBVk+SXfTIOA=
X-Gm-Gg: ASbGncv+M7dxtcHVhoBncknha982aoZ/tbpc20AzcLvJTfRJRcw79usx8y6rUgWphh6
	b2EwaC4XSAfoIbPE1xlEziCrEmw+eSkNWd2hCtUnFhzs5a2CQxjbcV8qyLAwwDqilnWUN55WSGP
	1G2su8qGgzvm46PVD+xSnZGI9c6kDQOyNCP6+2HLCAV+966GkKi/b6/sWEYHPov+1mtr9mZ3vcp
	yctG+cHh4L+i0gpJDnhjhcM4iS44BIJZJpgixb3xrWMDcD+hfSPTfJHQZpKJW9MBrVJOGq+fivw
	JAM1Kbb4UyVIrX0UEQwyNjLnlF2enqMMm6mrtIeYKIp3oKfQECWYlV+L5pAlKRpIsoHhb5YiFrM
	JQw4wycbMNkFQToYf73NVvxp5dqlI+s+l5Za+o8AZRF0=
X-Google-Smtp-Source: AGHT+IFF6ycqlUrRBwaFvrj2Xr+Cw2HS4eO7rMsYmrCv8MGa2LJQxfuJYSOOsmb0nfzRpn4jiuGIxg==
X-Received: by 2002:a05:6402:13c5:b0:617:b5bf:f03f with SMTP id 4fb4d7f45d1cf-61c1b4d013fmr2702207a12.4.1755939618290;
        Sat, 23 Aug 2025 02:00:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c3174f6f6sm1205522a12.51.2025.08.23.02.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Aug 2025 02:00:17 -0700 (PDT)
Message-ID: <a20d4a67-abef-4f97-95df-bcbeb0eb7d67@linaro.org>
Date: Sat, 23 Aug 2025 11:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: axiado: Add missing UART aliases
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250822-axiado-ax3000-missing-serial-alias-v2-1-54052d75467b@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250822-axiado-ax3000-missing-serial-alias-v2-1-54052d75467b@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_100021_582468_4F723487 
X-CRM114-Status: UNSURE (   6.78  )
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

On 22/08/2025 21:15, Harshit Shah wrote:
> Fixes: 1f7055779001 ("arm64: dts: axiado: Add initial support for AX3000 SoC and eval board")


Completely misplaced tag. Please follow submitting patches.

Best regards,
Krzysztof

