Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612ABE7718E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 17:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpfjO3nCfSKSU/F6ZQHVcOz1mCD2+D/yZzyTSXWn/XA=; b=yw+xs3J4dXdAMRxz8NvY9kEEeZ
	5GkO3mqs5KjZdDsUutv85ADIMXdffTUQkmbcjeSGfgnwEzRKX9gQhdu7pVJ+725qQUEmZuKcQM3Cm
	Yo6McnC5kRMu+4IP2xeBSKkRTXD1kB+gOAm1UK2swZG+ZruDztirJNQts/xescbdJYGHbGGi0oy03
	vHtAkX+RaCEgilISAMmjImSsDUMWXgO8AqClmBZHqMSVDpF+ImT5FKtEPAAcpzt0SCeWZqBjkAgnF
	J6/2bL9TDgi76a1ZIvMprqe66cSJrMMWXgneR+b/iDwRexeRWwtPzl9BrA1yLKF2uIGpvNkuwmzhc
	0aELLSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQroT-0000000G9pm-19fN;
	Thu, 26 Dec 2024 17:38:21 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrkZ-0000000G9IP-1X1f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 17:34:20 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so5707081a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 09:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234458; x=1735839258; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UpfjO3nCfSKSU/F6ZQHVcOz1mCD2+D/yZzyTSXWn/XA=;
        b=cGDeAdL6f0pDJR8HguzKjZ28LRIWt9Asub3VBozrlnMmX+sjTFGefBctvYXY8EDnIp
         J1pfn2nOMjlRfGJJg0FRqp9Cr4a8ihcBDfNKZjFDxnpdglbau47I1RNp0o1czqD7Ysax
         SHgbs0dDIVMWoPQ4hU6hrxMNjD4jr0lB1cnuu6+Mix7/DkSRaT44SyYRgv4NWbW2xQRk
         a2P2v7wCPkJ5kBuhAESZVkgRC5tNY8if/QIQxv8xe0riL2F8/+iawy78EDYhOvlmw0gg
         Pk2j9iV4/wn48Of1/darbFeeZayEFapiHAWrDZqb4pqkaPK2zbQLpKpXSHuhWuyrBkzo
         OSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234458; x=1735839258;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpfjO3nCfSKSU/F6ZQHVcOz1mCD2+D/yZzyTSXWn/XA=;
        b=wcSLFSW9P0WBVlodcrAxSrkPMmyrvAq7hAvx3CYHVNNV1URn7pvaglLuQcL6IsaJXj
         H9SAWwEcWkN6d0fDhg4SaVOMPBgxsxach7yRhmEAqEBrVOJCRy4cRqkgrPKLp1nHejIt
         RpYWcZzioUHVNL7r9hlr8y199VOz5bZqcxCwMHl5J0tGl1nIzqk5cohZEXVC2STPJV87
         kymzLcaq95H8sdPzkc2LtjQSD7tEFFzfCOT7iCWxlSQZOHx+322nVqljvf8ASUNyc4ng
         X/9YW1gLjKYOxbXrCk7AxNMphgFUzIpVr/fhJVofP2lQVoR7AupEvP8aZlnvmzLFIFK1
         TYHA==
X-Forwarded-Encrypted: i=1; AJvYcCXGrXpt1j18F/WZiYHVjwt1YDk8pBhq86foHAqPbNOtLolQC/7Nt8TqWdzmwBsSGFqMAh5LAAdZnUaVbb4L1ba0@lists.infradead.org
X-Gm-Message-State: AOJu0YyEmZb6oOnt+MIP22UkAr6snu/mWyVFO/psSXqWi3zUHVpe5Jw4
	15btCPZIrqO4pNWHZxjTuE+ZyJJ4Avv9434hKFe2/GvZ7M3lH691c1mVE/chrg==
X-Gm-Gg: ASbGncuD9/o9bDyJ9nmCs969MnP8UJhr6vSaEpH6D2hXNaXff/M5HoemgSamktp4LJC
	goLh6Q53pQ5I8bVSEqoCmrZuUpejsLlpTbSFQdGg6w89MSiqHvoqxIOU123zwQIARVfRf7KK/PL
	dGz45yFhqP5Xi68XpHN1A7elhMtvUFSpt6CtftOoePw9lqsuZIM7x1LuJ0sCAt+ZjB6bsDqNYn1
	2LwnwMKgxCkjzEX+gZdvhj09Gy0RdveQy6mXB2xCWRO48MiudFg3aDJs9LRS3F8vGD9wxvPv+So
	BcjyQ8IJOyjPlC6evgQX4bdk
X-Google-Smtp-Source: AGHT+IEXR2tW0UBVoELj4Ujtb5xezOwJU19NdsTJFIlGuhV4cKpQboh3iQ1wj0Q6nDV1+6ZatyEKfA==
X-Received: by 2002:a17:90a:c2c8:b0:2ee:b2be:f390 with SMTP id 98e67ed59e1d1-2f452ec3780mr32597910a91.28.1735234457983;
        Thu, 26 Dec 2024 09:34:17 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8542sm14223370a91.17.2024.12.26.09.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:34:17 -0800 (PST)
Date: Thu, 26 Dec 2024 09:34:14 -0800
From: William McVicker <willmcvicker@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 7/7] phy: exynos5-usbdrd: allow DWC3 runtime suspend
 with UDC bound (E850+)
Message-ID: <Z22TljXrbBNazNwW@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-7-f5961268b149@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-7-f5961268b149@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_093419_409044_D0E8942B 
X-CRM114-Status: GOOD (  15.77  )
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

On 12/06/2024, André Draszik wrote:
> To make USB runtime suspend work when a UDC has been bound, the phy
> needs to inform the USBDRD controller (DWC3) that Vbus and bvalid are
> gone, so that it can in turn raise the respective gadget interrupt with
> event == DWC3_DEVICE_EVENT_DISCONNECT, which will cause the USB stack
> to clean up, allowing DWC3 to enter runtime suspend.
> 
> On e850 and gs101 this isn't working, as the respective signals are not
> directly connected, and instead this driver uses override bits in the
> PHY IP to set those signals. It currently forcefully sets them to 'on',
> so the above mentioned interrupt will not be raised, preventing runtime
> suspend.
> 
> To detect that state, update this driver to act on the TCPC's
> orientation signal - when orientation == NONE, Vbus is gone and we can
> clear the respective bits. Similarly, for other orientation values we
> re-enable them.
> 
> This makes runtime suspend work on platforms with a TCPC (like Pixel6),
> while keeping compatibility with platforms without (e850-96).
> 
> With runtime suspend working, USB-C cable orientation detection now
> also fully works on such platforms, and the link comes up as Superspeed
> as expected irrespective of the cable orientation and whether UDC /
> gadget are configured and active.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Verified on my Pixel 6 Pro.

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

<snip>

