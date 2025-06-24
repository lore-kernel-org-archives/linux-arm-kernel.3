Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F419CC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3O/kbdN1R6dzhK7EawM1PIi5N4Kg7zW17zp/dNMj1c=; b=qPhyKZLk0K5m42j4h18uSOkzxD
	pdr+S0UMDE6+uSNa/qlg735j6RkvGjXZYkuObbOt2L2mUZc7EGW9/u6gyZLNYMlldvRAv53AcALBb
	4dJ/SJqtRLi8CwojmG97LWpeJqdyQHiQR8Pi0BTkbsP6hXNw3i9P8G1mpRgYzDTPOEsSRfo0W+4J5
	w1vBJAnps9z3B5jYV2i7VMI/y77SZw5OhjZzM3CaYXXW2vW3YfsZjy7RhVFWl00UpVijd3uSxLoxO
	KrQMx0F+DTl1GPmXinAHPcpRSrPPqPGTHat+oSUmY6Tu286NrhoV/YM2rMhcmgjSyfEDGfT2s6SXa
	Snl6YO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxzu-00000004rFj-48A8;
	Tue, 24 Jun 2025 07:23:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxrT-00000004qVT-1XPH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:14:32 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so660666466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750749270; x=1751354070; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3O/kbdN1R6dzhK7EawM1PIi5N4Kg7zW17zp/dNMj1c=;
        b=Pi3uQT7v+45cB4imcBiRuPr64R1EdNOdp1BWh16eimzmq3dHSp4caA38bi4Oz6ynb6
         6F63stbbNYPdElAj8WW1v4R+OfcwsSkIaq1Y8hS5Lv6verEH0mu068fIckPin85nA+/t
         ThJZZS40y9ob8UiQKc5qwYw9uhbrrJG4I6DhC31WqKqdDZpZ9Ax6OjgQiQS2HsuLFfW7
         0P3ZHHIYGWi+n8pip7Gp6VrbJbv8ojjBo4b6CL4Sfyez6uIq3VEezNNBa6/4CvVn2cnA
         Eh5scVjnyuRP6zcXYE1MLlDaXJ22aVc8RD0nd/xMeT66fxQYoJNhBp5JOdS1vLuoGm//
         ahMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749270; x=1751354070;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3O/kbdN1R6dzhK7EawM1PIi5N4Kg7zW17zp/dNMj1c=;
        b=Z1+Qrxi2eNhADzUL/sh281d0ku9//AW0GDpIWhbgS0KvotM+iJVcTCvyyhvSr+LyOU
         sIRzLqvKfsYN4QRYa9IIW7XhjBP6GA4+JqAfkeDtrH47GILk3yIAY4oj1BHtWqD8Wfy8
         HKt1o0nvhT0QD8SEq9tKrD0vu3wN2dd56e+xuPaHxtqWnnGFO2QfH/touwXOI++3MHF3
         QRv/hX8BC4VO0QI211/tv/SDLlqKrGhR3KqaAX7NGTcq2KFRdD353DfMhuf9BLHDmy9z
         +Lp1yPc1HlICJ/ik4q/eKT1PEWzt7IwBlKCTXo0ICVbJXcfmf3OU3XAH264rq73/LZqR
         9IeA==
X-Gm-Message-State: AOJu0YyjaXWLZE4hhxMgNe3UE+meDayLySSHYLJM3j/VynwR1ySjz7Wt
	fL7vAV5niWpygIBzf4h2E/ut31H7Ad2tMa8RzczWojt5frkrqglfyanpiZsKiDMHUnc=
X-Gm-Gg: ASbGnctFhUFHGsDUMCRUo+NyRpv6iEbckCNAM9so9+Uln6VUJqwAM/s3MnYC9yM4E89
	+e9YSQYS9kxpuJw1zCVrVSp/6uOfyBRpehDcZJaopXlNAJeo0pYfr8qTzzamtp6yRfR249lfJ9V
	b6d/vi/TVuQkFxosPszMcIZKujy5lfNzFi7WlgLnu4PR/f6aIltpBPHzi3zYzA/7g94AxnOrVzG
	l34D5IEgapWfQduX+FwUjvqvRrnyrmqWKAcm0oYkgIiaNrViSA5mQhmtay/eRRTrNJCiPgWucf9
	PuOj1jjN9TVecLh3BTsDi9aDA/9gCAw9HraU8dXiuyQpAmuUbcZfEKf4If/gCx6UUqjx3cw=
X-Google-Smtp-Source: AGHT+IFyqZi3XuHoAqSel9NcTyM6a8to6TnnNAlILz2CVQlPmoEe8VkJjYi2Jq9ty/8Rh1HMu6sWxA==
X-Received: by 2002:a17:907:e2e2:b0:ae0:b3cd:8f32 with SMTP id a640c23a62f3a-ae0b3cd91cbmr16862866b.11.1750749269565;
        Tue, 24 Jun 2025 00:14:29 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209a40sm837830566b.173.2025.06.24.00.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:14:29 -0700 (PDT)
Message-ID: <c3ce0abd-d924-4c8e-9cce-39d694a19418@tuxon.dev>
Date: Tue, 24 Jun 2025 10:14:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sam9x7: Add HLCD controller
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250611-sam9x7-dts-v1-1-7f52fcb488ad@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250611-sam9x7-dts-v1-1-7f52fcb488ad@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_001431_413622_42AF2380 
X-CRM114-Status: UNSURE (   8.25  )
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



On 11.06.2025 12:17, Dharma Balasubiramani wrote:
> Add support for HLCD controller.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sam9x7.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
Applied to at91-dt, thanks!

