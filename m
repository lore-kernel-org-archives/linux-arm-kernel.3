Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2A7E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4nGgzN+PLoX+DtGKu6QZhwKkrW+RWGU8KNUJKfHD5k=; b=bTxDWVIL/QaIEXn6EgCXsZEtXL
	EnOgef7a5mAwBmULwEvADTI+qhKEnIOc8BArmmLFPPobIWiFbip4XDizrPap88u8xOXx4Br6z+aMG
	R+eO9ebDOOSrFmVTQUKHfTjy2f9ZedDb0+2k2r7hmuB2s+aq9KRpQxGApxLwa5UC8i1C/YtTA2YHi
	QTDZ5KXdlhm2chuqYAkvjtMgDN22yxhNCfCowp4mdKtoo2TrtPRE/5ss1gWqwe0iSsPTAxdT2WZvZ
	Qo+7yvrBexRAOEoILhBZvZpRJVqLQ5lHrWTd9+Uzu6BoAmwIw3jzW390dLIYoTBPWSSQkJXA4pGiw
	DBSuedKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsOZ-0000000GTiC-0nko;
	Wed, 18 Dec 2024 11:39:15 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsNF-0000000GTPX-2Net
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:37:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-725ce7b82cbso7333061b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734521872; x=1735126672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4nGgzN+PLoX+DtGKu6QZhwKkrW+RWGU8KNUJKfHD5k=;
        b=My3Gnpngbm56rqOrOFNWrlRqUQR/2ifxAKDgiaRjlV36ClYunta8eBd7IiTzutVF4L
         DhFPzJgHYskeAQ+ueH8YU7LZvPNVyUoBkFocy+TxSLAH5cF++IM8ZyK8O04n92OdaubG
         UxbCmWVmt95aikF/1BumHe6aQAtbUfJblvPUwbbBbYk3ibs0BvzQ5t0HeblWa11uwcZv
         9Ml9lxLd4HpzqvflToqi/WeTRGqICpgtFWgwztONl+3WT0sRQQpevtsEyPd4XKiq7rOQ
         OKgyjEVgd98shS5JqOtKuOr9ZLW/RU7BI6gY2g4dX1t4qOggiNTz/hgoWlfKoeksyKQf
         +5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521872; x=1735126672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4nGgzN+PLoX+DtGKu6QZhwKkrW+RWGU8KNUJKfHD5k=;
        b=FMm1Piip4BhAMrDAF/otgn43xqNy85nhfT1dQ5mmpPCb3jnnx5lSAGlLYUWlNde0DV
         sNqawiks2h4u7aguIv/oIgKUMaaJO6d3NuKAwvxqCx5fT10E1rS5r4vCjt/ZJKcwLNiO
         GE7ikAY32fODYAXPb2Py2hYYfncxVBpqh8Wav3jet0JnKZ3K/7GoElW0cyZ9hsgD9fxP
         zBLiOD/Zw2uf+f8m7i1AuUKec3AYbtu6DC/sbpLxDIA9V51E6goru0t0/HthVr5DbrIz
         ljzV6nBFYZaljlKSWLmfQ1uFBQcz0VIiwM9K2xkCFZ5F9b/7/Q1soCPNPUSizbEjUdbe
         x17Q==
X-Forwarded-Encrypted: i=1; AJvYcCVa40zWNQHmlMHaPLi5sVT6UEu2b5viRqXLVOU8FT1cN/QDzXS0FwS5/qwCOwcL+37dtUzOPwAIhmVEjtpVl/+v@lists.infradead.org
X-Gm-Message-State: AOJu0YyDMK0KcMpVGpw8cDGCMoz0kuvVYUjmnwHMlGMwPxeOatYof6iV
	i+N5eNM6ZNQQczCpdDg/pFrqummiA0v3xaJ9vaHcbR0ei0o0iA9OOLlbRA==
X-Gm-Gg: ASbGnctRL3PqlQlETqNNvZCiPpwxUPh0c1OkqQOB6zFP6aARbpheWOHvGlW2RaDjMS7
	2Kt0CJCLKnLUELPPVqfkKCYDNFi5jL3+mxwkVzm47GvAkHSyQq1cGFzOdYY2RaEnmlEWCo9m7nl
	LvFKFRN+AYKpYnQ15I/lHqeBhBUUOOTSCnyjwJZS8zlnfXbANywrn19e8S26A4CCpV30bDub1Ix
	nLgeKG/6Ees14Tsl981nFqXINRDn75U0QRaxrc/sMcduvChLfK47g==
X-Google-Smtp-Source: AGHT+IFBGhYjjpAE0oXnnXnxBVHrfx2nI3EfADj8QvczSv8I5fWLimmdInMDqXwJQC+cnnxzTSbD3Q==
X-Received: by 2002:a17:90b:2dcf:b0:2ee:acb4:fee0 with SMTP id 98e67ed59e1d1-2f2e91d941fmr4373626a91.16.1734521871854;
        Wed, 18 Dec 2024 03:37:51 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e72292sm73745605ad.273.2024.12.18.03.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:37:51 -0800 (PST)
Date: Wed, 18 Dec 2024 19:37:43 +0800
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v1] net: stmmac: TSO: Simplify the code flow of
 DMA descriptor allocations
Message-ID: <20241218193743.0000521f@gmail.com>
In-Reply-To: <20241213030006.337695-1-0x1207@gmail.com>
References: <20241213030006.337695-1-0x1207@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_033753_606062_F6292FE0 
X-CRM114-Status: GOOD (  14.79  )
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

On Fri, 13 Dec 2024 11:00:06 +0800, Furong Xu <0x1207@gmail.com> wrote:

> The DMA AXI address width of DWMAC cores can be configured to
> 32-bit/40-bit/48-bit, then the format of DMA transmit descriptors
> get a little different between 32-bit and 40-bit/48-bit.
> Current driver code checks priv->dma_cap.addr64 to use certain format
> with certain configuration.
> 
> This patch converts the format of DMA transmit descriptors on platforms
> that the DMA AXI address width is configured to 32-bit (as described by
> function comments of stmmac_tso_xmit() in current code) to a more generic
> format (see the updated function comments after this patch) which is
> actually already used on 40-bit/48-bit platforms to provide better
> compatibility and make code flow cleaner.
> 
> Tested and verified on:
> DWMAC CORE 5.10a with 32-bit DMA AXI address width
> DWXGMAC CORE 3.20a with 40-bit DMA AXI address width

One more DWMAC core tested and verified:
DWMAC CORE 5.00a with 32-bit DMA AXI address width


