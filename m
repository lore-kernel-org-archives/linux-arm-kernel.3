Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EB3D11194
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 22:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rHJELaF04JBRi0aLmrWuxoS3tWtyUhwmRJRrDNiPz8=; b=d4cLGVzDGO0gi2dIlCeuMKgY3w
	r3NorhRNlQ1SHKO0na65drvaDVoFHtnwHtuI8MuVv4UpxFjkPTpUa1wFWO1hvu+3oyEs6EOjYsEKH
	G93sBMMaWN6Ld+T0/HJIEhsXnxouxTnALT2BuvwbrwH7yDScs2WKly/cS+gbkk99YbrGH0dcmuF9/
	OeXEv+zMb6LAAMHAv/XiAndRvlWmXVbjGFRBvyqBeGylQj2XvzzNoSbnCkQFSfmT3D6+jyNcBrBFr
	fC7zDnLSC7sNBelJ+gwe2oAAQa7DUEEul4iMTlpTNobeCB2q0Z5mm6n8FMjRq1sui3InNFPZyIHbd
	vuJyV0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7iqm-0000000C7Lx-0eGH;
	Sun, 03 Nov 2024 22:13:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7imz-0000000C789-1kmL;
	Sun, 03 Nov 2024 22:09:43 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-72097a5ca74so3367367b3a.3;
        Sun, 03 Nov 2024 14:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730671780; x=1731276580; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/rHJELaF04JBRi0aLmrWuxoS3tWtyUhwmRJRrDNiPz8=;
        b=S8laLkhXFxuQTCMEBgEQKLYGYS1tiv3v+/vnn8OyjxmUnyVv0FDvG3Jp4nwGxZgjrr
         tu/Kad9Li9UYh3L2xAIh3jESZcT/vBBolPQmOXzqIezkfzdDo9ZY5zGdglU6bFF5POkt
         YW5qKF5FA5teoKOnKEam3ZgLXMfVKCgI98d8VEvVbLpXnfJ7SnnX8PrXGqL7ZhqmnWPV
         qFVNrIyXn3BkoxAIZey7HNpELNl+hFkmT3KaSo4KBhEh/gkI11bWif/8h2DH23IcuJLu
         u9KhPQHgrAu9KAcSiPscZeDO6jSTl3WqhglJtiJw1ic4KfUBZJ9SnLlPB5a2So9YsLq5
         QVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730671780; x=1731276580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rHJELaF04JBRi0aLmrWuxoS3tWtyUhwmRJRrDNiPz8=;
        b=Is+oZnNbSLDcA723hTFpJIrEey/EMkcYfCe9ycyBUIC+VzjYdoO7fvW/6fYTFpMvYw
         Vk1GX/XZjP4Nh2RGM6PL+XexnqQD37AAeK+JlvJSRTwX1/jd4dJDwkWIIYcsK94qEAvB
         eD44zS8YhXPSATYWI9U+UNTXbPWQI0yDiFOaS1/g0p81xz5dB/C8mZA05lGajS6packx
         W5uNop2+Y/Pxbrv2+Osx0SktK1YSgf8enqrDL+P1k4q5Zt7MIPJ0BxsSG6h6kBB+Lw8D
         V44ZyWoNpdjrhJf9ifrNt1VYoEf4Wcfu9pgozOpTFv4Lzve/x1266pjaHzC9QP5TbQ/9
         o9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVqmyE9BbjkaFBdcec+hK5dpg3KB8mK2JgQnDT14EeqNlNmnMEOknz8CKRaAw60SkALTudyxAryLJIoHSji0dYR@lists.infradead.org, AJvYcCWkbxxcD+ANzlHe/xTvzDja+wzn90ompsFAyPJDsBAqOd7RwbP3+Yc8mAbPxJTdvFwHYRfOCOdsiONvRlU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe2yUK70Da18gbSe3InT/6t+ZMhJF5VfEb5AAT/VlAeOMuZL3C
	0ovTGi5TXv++zZEKjycLIMZze1uS3iy39lUR69lxyK5e2Lzn0axJ
X-Google-Smtp-Source: AGHT+IFKyJJZHHJG1xrvYibWpBIs/FS0N3kdjWrsxFMjWgEPFe5BpYTq3ei0lG/0AXdt3oOlAP3xDg==
X-Received: by 2002:a05:6a20:e605:b0:1d9:dfd:93c0 with SMTP id adf61e73a8af0-1dba556fdc2mr13977660637.49.1730671780063;
        Sun, 03 Nov 2024 14:09:40 -0800 (PST)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ba033sm6074536b3a.34.2024.11.03.14.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 14:09:38 -0800 (PST)
Date: Sun, 3 Nov 2024 14:09:37 -0800
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Drew Fustini <dfustini@tenstorrent.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH net-next v7 0/2] Add the dwmac driver support for T-HEAD
 TH1520 SoC
Message-ID: <Zyf0oVGk6FiVrPsB@x1>
References: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
 <662a8258-291d-4cfc-b21a-f3c92f9588f2@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <662a8258-291d-4cfc-b21a-f3c92f9588f2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_140941_481794_EA81425E 
X-CRM114-Status: GOOD (  17.07  )
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

On Sun, Nov 03, 2024 at 07:12:24PM +0100, Andrew Lunn wrote:
> On Sun, Nov 03, 2024 at 08:57:58AM -0800, Drew Fustini wrote:
> > This series adds support for dwmac gigabit ethernet in the T-Head TH1520
> > RISC-V SoC used on boards like BeagleV Ahead and the LicheePi 4A.
> > 
> > The gigabit ethernet on these boards does need pinctrl support to mux
> > the necessary pads. The pinctrl-th1520 driver, pinctrl binding, and
> > related dts patches are in linux-next. However, they are not yet in
> > net-next/main.
> > 
> > Therefore, I am dropping the dts patch for v5 as it will not build on
> > net-next/main due to the lack of the padctrl0_apsys pin controller node
> > in next-next/main version th1520.dtsi.
> 
> You should send the .dts patch to the Maintainer responsible for
> merging all the RISC-V DT patches, maybe via a sub Maintainer. All the
> different parts will then meet up in linux-next.
> 
> 	Andrew

I am the maintainer for arch/riscv/boot/dts/thead. I'm planning to apply
the dts patch to my for-next branch once this series with the binding
and driver are applied to net-next.

Thanks,
Drew

