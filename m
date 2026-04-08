Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0036A1073CBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=; b=bQOndR1fv++1eAji6PrypRJmLv
	G51gUN4i3Pg/3Ta/Nbi1w9Pudoztbjs5FZVNfmUXPMlR7sg4XLw+yBb2baWRWDI2KIPzGDirtqcIg
	BJBnzvnlRopJxtntv8CMH6evyl5C9VpkgZDVOozpMWS3EpKRKrKsuqcnRnNupomrVWEi8jW80LKOh
	pC94zCU4i0B0Rps22QZkSCxPzdFkccpecdTjY2IJ2mobqqk2KedltHCqC175HQG0jpIys0k8HLJXK
	LEGQEtVPsNOOWG9p8uVKeLtQ+tHkYF+BMaGjj4akl26RCsxU1KVQFE6TV0krT+OLssMvSLIIPMVVa
	3/d4h79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATX8-00000008y8K-3QRX;
	Wed, 08 Apr 2026 14:05:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATX6-00000008y7M-0LLK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 14:05:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso42106015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775657126; x=1776261926; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
        b=XLVXiYfgDUVwB0UDrlGrsal2+uQCTCvnT+q+bUhGA2Y4lMKp1v/JsEGIh4R+grU2Gn
         8Q82NccI3yvqUVVinHanOmNwJu1U6xSq3IKrHguy0WrtBQ+yx6dxUV0MVNNZaVcVckMl
         o7Fjya2ajlGX+nDzqvmXzOeQQNPO9MZbuSdFHdOSTu1zULvAtWKaz5lxY18PFeBEssum
         7crC7gjFQDmpbDTG4rnrd17bfWnqvMSD8BodhREp7eRZqQjtN0REgRcfvPBYCL1HsoeW
         xD5+E8o08Ye3YIAPOlcwTWZoFduc8Lx3cL5tLnEW/lbj/QTqTm3E3F9jGinccaJePSsu
         IwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775657126; x=1776261926;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
        b=aZujziyzvSWyS5l93AIjJN4fUf+/C+BrSjeB4SJKlrr2195yk2bZ0OwavtO+b5z+xw
         GlgNVv6Ct1Mu3pdThzyYRPSD8wjMbYnlCgwAzfODyy34k7F/Tw7D9nF+dDL6QvOeQdX+
         tqvocw2iLTEuMUDSl4NqWcYhoU6fu4edXFY25y3+zlK7iuyBnEgOizV0hf6hHGqox9MX
         QZneOiWTJGrJt3Cfq7EGeXA6cBJlDn4NV1N9s7rWxAsmD2QhL7xHpggoq1LoFlLzOJTQ
         WHjhMtblOHeVih6t6LI1YiyRYVwv3y5cm2ASxyP8ALH7ZZAvSwIraAHvUwqHPYzlXCRo
         KIgA==
X-Forwarded-Encrypted: i=1; AJvYcCX7hfScPdpWS3QTa/ibY42tFMIuhqJ6cghTlOa2cgCWOAOQxmy80ynqBJWSZXIR61p8q6HhmsvxPdJQlXl/KHuH@lists.infradead.org
X-Gm-Message-State: AOJu0YyoDsxbwLzHCOsU0rr4p+lSZ/TLVJWjldq6MMKKZCqv+/DT4qwc
	hYKvYO3euKenkq5tU6O/2snLd5fBwmxu4TGmaJMRYXqC1i5Re2I84+8g94A09ROMz+A=
X-Gm-Gg: AeBDietuSWKtQMtUzhwkeYVhptreyjL5QCB0BujB2fueBEI46UPlva2VYqLdyVG6Qjf
	Qd/01HANh+xbQDnM2LlcxbzJo8h7DLao5HA89G+sQTIzwqf9VVjY3/FsOD/fb9bkeq4OK/lVTZY
	IAMWSlvtkT9Tytp3w9J2v9tPNmKBFdjMPUUIXlHFyI/V5cYJQT16wbp2oBbIe/5lunUlpxCCU9S
	7k3JJu2zEXlfh2ajQE2Jg+/Pejkgmx9jcQQA6t98aSyZiHyoYI1LyJLV/yeO7b9D+xmK/2dPYru
	SPGcL9vaD3TrnHhY8nl7DgFMJdHzyVgS1UJpqXJuGkKE8rr3KKa+zWsvfblBWzxGXKgr3Je3Ks2
	K9x3/nY6EPdFovG+2GU1Cg2wgKJIKVpQNvO/vmTy4lpmrV2xAEPCtJ2kCmWG11LxpJRLLAyuGOS
	CvjMidcWMzqSFZMhMbGx/1KXmHSaPu/W+iqvOTte1QPamPsO4yyXwuVasBenT5UT4UfREOOi2AY
	bTteIZaZzkfpfKHvg==
X-Received: by 2002:a05:600c:638e:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-488997b23c6mr299995865e9.24.1775657126171;
        Wed, 08 Apr 2026 07:05:26 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f08sm61358898f8f.6.2026.04.08.07.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:05:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 15:05:24 +0100
Message-Id: <DHNTX1T5S2UO.28SO88SS2HDOZ@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Exynos850 APM-to-AP mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Sam Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <d9c714fa-988c-4b0d-b756-c6e7a40da587@linaro.org>
In-Reply-To: <d9c714fa-988c-4b0d-b756-c6e7a40da587@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_070528_142535_B6F40B97 
X-CRM114-Status: GOOD (  11.90  )
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

On Thu Apr 2, 2026 at 9:45 AM BST, Tudor Ambarus wrote:
> Hi!
>
> On 4/2/26 5:20 AM, Alexey Klimov wrote:
>> This patch series introduces support for the APM-to-AP mailbox on the
>
> If AP initiates the communication and APM responds, shouldn't this be cal=
led
> AP-to-APM mailbox?

Yes, there is some inconsistency in the naming, in the downstream too.
If this has to be aligned with datasheet like in the comments to another
patch in this series, then name should be APM-to-AP or APM2AP for that
matter.

But let's keep it logical. I will rename it to ap2apm and will re-check.

Thanks,
Alexey



