Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A62FCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 16:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMlWUewpnO5BHrxePkEK12VmSLLS4fX3PTW9+WOgwyc=; b=awqGrSP29Wf2NN9IIOejVMPVE/
	LGZoYb4Dq9IiSDn6gEC3SOHH8drQhOFvkpEZkrNFohf48G7PSbDFEuw/14lR+IxwnL0MRi6bdYBKH
	WxvetymZJNoYuh9kxklQzRRPb1u/Mm9OyFxkWeJVJcmIuQv9dcVglpUytvQMMnJJiOF/GwWe+7ydB
	iM4CZqtwMzSFDnUXZHWXAoSyhm5A02DoPjdDlFQP9z319G2YNLfaDA8TFhGyYJaBiieW5TORglQGJ
	Ia9plWJpaDMP/BBNb8zD3eK22V7mNZFhdDhWbAzsgOi59QOa/SZN8qJgp2ykZQHLXYfP4moDkWBhD
	wcb5+GCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqQV-0000000HSTJ-1wiA;
	Tue, 12 May 2026 16:57:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqQV-0000000HSSl-0AxF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 16:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GMlWUewpnO5BHrxePkEK12VmSLLS4fX3PTW9+WOgwyc=; b=WMzU4sdVTZq9iKKwVYfbaaPnaP
	RfO3BfoXXEvlni7RbqUAWe4Iwn6gECpMFBBuNsxsMXKX98qv//GxGxjasyit4auSYLKqZqey5pDFY
	1R5PPgGcF4GuqwnwJ/1VojuTEigCKG+03q7fTVMgMM6Jc3sMKwIaR0i3nxO1We/ZVEBvHpwKLL/RY
	zawabKTxdUW1pTfIcG5mk2+TqXZHe09mdR1eF2R/wIlWLbLMdENWQBsOR9Fh3MJ+1oEoQXsy2FxD4
	wsHdAIsBYRRw7ZR7FVf8N/C1+RKLfwCqGzKMrpXGJAdwnu6nGD4LPyLGM6+8BFwUjK/cKF7BuxEL6
	9sZK5KkA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpWm-0000000FF8E-2Nc6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 16:00:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so60817835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 09:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778601611; x=1779206411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMlWUewpnO5BHrxePkEK12VmSLLS4fX3PTW9+WOgwyc=;
        b=mSmfALDHGDLfO7PkcJZ80V3HDrqhZPm7dvGXK4pQJI4DIJaDmOyr9bG6Ib3YGMaApe
         VoUKbmlbCJaMhfPH9Ck/mVZREPde9OPq8A8UEhVolrXqXIJYa0/CsdkNE0Xw30Q3QJ5i
         66AhNiGkWHI1YKITAEjFqyODAthP9Oy8BlVXA4KVvW0uJlIFbsjnsASbbIpSeXDe9log
         cnFc8Lkp8eEwQmdiUErX5Zn4csleWqi3mibYctngUHbZhX6HviiUTtnntfh6itXtYj7G
         SU8wURkzZqywR4siZiS7NXuVkR9Uc7wIz5ANOAuSAKZ5jbTJovcU5KzSOMXxQRaRtfll
         jUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601611; x=1779206411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GMlWUewpnO5BHrxePkEK12VmSLLS4fX3PTW9+WOgwyc=;
        b=c2ZM3MtiXcVBbThEGXBbeluJFugWIi4xZ+4lL7dtQ+2Mu2KKeoCUeFrIRL4FvqGgZK
         CsXQ2ZTtwAv4E5cttjviF37lfCe0Okqh1Cj0cPm3WXnNr5PTtWDu+enO1eaUwrBd0Po+
         gfo2r+zteiyzleyu3255QAELUGrKraNcEVdUliyymx3+sBGmeWq6JZqD3MPVCn43A004
         rKJ9692KKeDvLNuH3BkeUTjQqXJ5A5mXL/Pcx3ejjHRtj9/Im8ZiP34cbjhbUt1K/LaK
         6Tml7XXhwfEVRixqK1BTGAHep7Ol4CBSxrCU21MX9BfS02B5mdgikLV2e+DFKHKC3L4n
         zUNg==
X-Forwarded-Encrypted: i=1; AFNElJ/b+IaRgSeabgNp8KwNKQMzI0SA4pQhq6t/HqScnHYcxL/XdnqTbjnXQknKi2eB+KOhZ3lJXkHvwMsbKOfzW5+d@lists.infradead.org
X-Gm-Message-State: AOJu0YyXZ0vm/mb+0j3bQPvFidYo2nCoKvD1P4bZClCWi3e2ZP/2lUyO
	g152dXnjTaaEafqegkcsHwFkuMsBL0QKIlTesbX8SiNkMwuajs+wVvQc
X-Gm-Gg: Acq92OHK724ow5YgjaYLD1YOFN9b2u5wE2srfFi0UdB40y1vSDEBhtg791RVX2fhqfl
	jh//ExrniJNP0i20apqcxAxuqFfq5BRTTD6RdkE/KAvZ2OeNTvO7yuSGbWwGDcCBdgJvCuFyo5h
	CCy4J/QhZnSZ4TtFMskoQaXgcgVZCo5fC7tJH1q4uEF2HHYAzondPHRliD2PqSeedA5ex7rQVBO
	5gIWbbnY5Ls8vydfnERnZzBjTXNtUhF0ZyhJwTEXMz4eRnP4ciZRb0tZHP3ZEXBnnxlscjcxhVn
	GgQJHPS3JdU2Uwj0k26bvibZRoON9tDeKltd1YMZNFPNddy80y1NJlkr8I+sDV/v819HPhNpmZr
	mrnmJqrHTG+AhKt0D1O1Yk0emy2Sepk9CQJvBsWpR8ebhVLZhRLdW6CCeuKKESEVApLM+XIrPlk
	H7MJegxUMa8av8zD7uUbWGwqywo/kS9jHXpY3kSojNz8k92KTKf9qYKyy5IiWan6pB2sjXX2AID
	zT2vPyb
X-Received: by 2002:a05:600c:c166:b0:48e:8499:4bda with SMTP id 5b1f17b1804b1-48e8fe732c5mr56263285e9.13.1778601610271;
        Tue, 12 May 2026 09:00:10 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm14404775e9.14.2026.05.12.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:00:09 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
Date: Tue, 12 May 2026 18:00:08 +0200
Message-ID: <cjl1U0d5TU-5Dhz5uRAUHg@gmail.com>
In-Reply-To: <20260511221741.25888-1-andre.przywara@arm.com>
References: <20260511221741.25888-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_170013_013660_2828C3E1 
X-CRM114-Status: UNSURE (   7.93  )
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

Dne torek, 12. maj 2026 ob 00:17:41 Srednjeevropski poletni =C4=8Das je And=
re Przywara napisal(a):
> The Cubie A5E board comes with 16MiB of SPI NOR flash.
>=20
> Enable the SPI0 DT node and describe the configuration.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



