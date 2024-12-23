Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F674E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 14:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ULyKc7BaFBov8XvSS8Fc/ZiZcJcVRa+PV+hStUeCV4=; b=DcQB1ruU0jP7lKctugwc3arjso
	MltK8jr+Fg0qZE2ibkdphmqgNPAvFBAd/iNKeWzT9P3pDOGN0g9H6NAYgovqcUEhqs0mStIpPkcBe
	+ZURks+r8U1xmQtqXYCbnEBVzhbJEx5l7qr7Oh+PIvDaW9sn3mPeOsT+eg8B0QfiN779dgaLNIBH5
	DkBjlzVxmD9soG5YooVrW0t1GNkxN5lZ/t8I2aj2Lmxc4AGOw081SUJ6mZbpknP1qYbU4WeZECh5R
	kAkESjdAJEZbnL8f+g9SY+WBzA8ZAbLuylLM0zPwnbRxwGC7C9E94fnc2hXXknGn+3uLGCBtVh0oK
	CWuxuo5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjIQ-0000000A9RX-2VoR;
	Mon, 23 Dec 2024 14:20:34 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjG6-0000000A8kK-2md4;
	Mon, 23 Dec 2024 14:18:12 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163dc5155fso37249765ad.0;
        Mon, 23 Dec 2024 06:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734963489; x=1735568289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ULyKc7BaFBov8XvSS8Fc/ZiZcJcVRa+PV+hStUeCV4=;
        b=LhqQ4K+xdHKh6X9Iy5Xab8yzXhrEFexWE8/beaQO2zWGQfBARANCEnwzkPlTpuAwT/
         fQ6YbP+kIiZIrV40fhV/kXwBY7s9/GRFE2kdA79xM6gkeIkyCd9Rplg6WJfXewf71DCw
         qTHKdvvB3IgrzEk2MRF4arM7ugev/PVEIrmIgVb2iCwY8H0pfXpUIWwSu9yfdmnTxuEa
         oWw5HGnJnzFr7i/itFf86XhUDj2JqEYxEmfDh0z2ciQpzVYb5YDYWPrTmaulYpY/nn9D
         e9uArK4JiqzVSDc4QXB4RvKLUQI8+MZTSOOd8KeH7gK5HGDCCPrfxwiSqy2EkFa+dIqe
         K18g==
X-Forwarded-Encrypted: i=1; AJvYcCUfED1q9Sp/SdVVK+UWSO9hJ/kIIRZtWgm7keIu5kL8y4jJMASct+eGDhBdKtHVNMj85kW6qiHvWvDpIL+vILA=@lists.infradead.org, AJvYcCVZfPtBvr8NT/Skh+gx+C8Vjb/7eiEfTKSMZYkv1cNrUC/nMpNXGt/ruTPHwPV+DBvXT45NCn5C60SqSI4bGco/@lists.infradead.org
X-Gm-Message-State: AOJu0YwjqRLZFXXDcFA7k19PU105PFiTVSQ6xmCrES+dVhGdo5X+KvrK
	rkV1iQzR16EEYLkQ66m+UI3HZ3onfg/5JevgGgOfBQ/1cDIJQwkv7o3enwLB
X-Gm-Gg: ASbGncunM82Im4c0U/QpKITiYx5OVufUtpI74w+oEkmXjgAWcrKj+JC9VB3bhFZbncm
	bi9FCDE0d/5ZHE4ilfdt2KrXBN2/rKzDqOEbZ9w75MPAKtNvmrEgV0G3oJoYLzbPWU/K5zikaND
	z7p9PuIMl5yhZx14O24aGu34R5hlrmqcFht0hpY/nALGpyefxNjaN89hnX1hgBWWff9XBuBYKlW
	WlGu/P5XMBl3WVi5Jd0qHxcoetK17mFPuAuy8vAwJSzBwanuM+BTFW/OnZQ1hu3oVFSZpLZdiPV
	NZUFrZwfT8jKYP0=
X-Google-Smtp-Source: AGHT+IEsnlz4mPE8jueX1x89jlq0C0eIXgwZmReztfvY5cxV9abureUI6eHDpct2UFToIIV6d9foAw==
X-Received: by 2002:a17:902:e886:b0:217:9172:2ce1 with SMTP id d9443c01a7336-219e6ea255bmr181376795ad.22.1734963489177;
        Mon, 23 Dec 2024 06:18:09 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca04ce7sm72205685ad.283.2024.12.23.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 06:18:08 -0800 (PST)
Date: Mon, 23 Dec 2024 23:18:06 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] PCI: exynos: Switch to
 devm_clk_bulk_get_all_enabled()
Message-ID: <20241223141806.GA1864738@rocinante>
References: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com>
 <20241217-clk_bulk_ena_fix-v5-2-aafbbb245155@collabora.com>
 <19eca5c3-cedb-4c5f-9b70-9c25c8387414@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19eca5c3-cedb-4c5f-9b70-9c25c8387414@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_061810_706960_8D89CE4B 
X-CRM114-Status: GOOD (  16.36  )
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

> > The helper devm_clk_bulk_get_all_enable() missed to return the number of
> > clocks stored in the clk_bulk_data table referenced by the clks
> > argument and, therefore, will be dropped.
> > 
> > Use the newly introduced devm_clk_bulk_get_all_enabled() variant
> > instead, which is consistent with devm_clk_bulk_get_all() in terms of
> > the returned value:
> > 
> >  > 0 if one or more clocks have been stored
> >  = 0 if there are no clocks
> >  < 0 if an error occurred
> > 
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> In case you missed the previous requests, we need your ack on this patch
> so that Stephen can apply the entire series to the clk tree and drop the
> obsolete helper.

Please, take the following:

  Acked-by: Krzysztof Wilczyński <kwilczynski@kernel.org>

Should be sufficient.

Also, sorry for keeping you both waiting.

	Krzysztof

