Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7767ECA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFMWPn5IoBx9VRgYwRavNR0oKcAnfF+3nBU45SDbhVg=; b=hYDQmBHMcxyHdoS57z4H3JFKJ0
	FHCajGFokHXVnkcQnidV9R7q6VnfNtq7mfPRdl8CWdj9ory3DfZV3ui+RL4QXodNa3MsXx30I824p
	yuMS0sEbvIBogi+ARo+P/jTAQD1UojcfJUkdQ9doS0MhLlnQgz9/jpcVDX3M0Nx3iTP7O1BzOEkgJ
	tF/dU1MO+G2YPbKeU8vQIks8GDKh8GoNhp/WWRX62msvfhAXWQ+HVW42SZSryj7mh74LGV3mvuueM
	aSWMl+WTDT9l4e7gVbkPvaLJK7S/7IKv90W1DDr1w9KOrxKTrdro+fDC5f68vwjCDK5HjMAeQ8XRt
	zerZgS1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvo6-00000006Pak-0H3O;
	Wed, 30 Sep 2026 15:01:18 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvo1-00000006PZv-3jDS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:01:15 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b0503e39fso214319f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780472; x=1791385272; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFMWPn5IoBx9VRgYwRavNR0oKcAnfF+3nBU45SDbhVg=;
        b=BPExukzByaY2b3LPtPnOhNWYaDVjq//NDmZYUAREwSLv9Wb+lw8Xt5IZtjKOiuHCzT
         1UyxgwJ/pRqBdNZXJJ0P7J06DIyXE+WMtk/FXTYHrR9pUSqWEI6CQPHuupH1CMJc/8mb
         CbJkZiZa4aSC/OlTpbUj0wYD+MUljoAzFihwZ01SPwsvm+bknmavnZro+2l76XGDka6S
         UpiCWRwT0/vIDyHSHFwYbf/EfaESoLec7W+W0SNJCzmXwKhoGz7Wzb98eah3ZGl+rkZs
         GeaTsOGOsmzxI7saiNuCiZCjp4kywQ26Wg/7OhDuip51W8imNixyP6LbC8tgVM66CjOC
         OPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780472; x=1791385272;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFMWPn5IoBx9VRgYwRavNR0oKcAnfF+3nBU45SDbhVg=;
        b=Ct5pWqwNtrPculw8/lEMkFd+eVQWHZg9ebh98lYx2iEKAQNsA5992gpnUmRKYiWBat
         Cc6a3+jsQpemtsmzbQJoHFIu1jX8vzuRCGQnBpXF/4bi4WLswGgPlNZ6iV40nsCdM3dI
         9cOfIod/S2u8hUJql6gWQQM6gieeW1CagcWguKJdbcfdvZ+DTWjohyaON7ut+NrXmjVo
         fV1ZJKB/2quiX0VVm8G+pHHWlpFaCNCcbHv71vYxULN6A766gWqGoq9rqkBuyTnKVzGS
         DnRn5xkjWNEGpMHnu9DwmBkoYMSjnRTDzKJp/LXbTNnMOGu01wKqA1ecsyBn4e25UDUk
         0e0A==
X-Forwarded-Encrypted: i=1; AKwUvBz6snqPSlCVtk6eWdXyQi+ArpJn2CdljH8vGQ49oNlci9S/OcWPz5GkwEQyexUGPFb8nT4w8pbC+BtTS9nIEvMh@lists.infradead.org
X-Gm-Message-State: AFuF++lUee5eV5o+uoV62jwVH5Bd+XBNB8N/kPOlenWXxCZQXlU4zvVN
	M2PTmcOeSLLe4eTDvNhCUs01Ezhp/B6/CAoi8Ji06UK6cskNuWOmZzvG
X-Gm-Gg: AYBFou0+kdrr/nRqu3HXiwETza+zjZmQzhBois4AIZREOzwqKasHNgz9YWkCTXPgVfz
	FYaytrqC0SQgXQkdlTxECGz6Uz7nx0omyxVjeEksuZ/7um+xQJl8vcq+K/FCfW/uHXoxe85Q+DX
	wktvhuSR7z3ce3jjzv415doo1pTgBxh+vbeNLQ2o81kDKi2Bc6m1csfR5gQ2HqqsxgoxsO9b0qq
	4xJeirkJtdgla5ni/kEYYNnpnEfhS8D9AftaIqbsuCyn3vb8hEh8BrAG+sZ5kvRQIJjOyine+GI
	eAS0pWzD7IvWKMHi/0/621pg41RUaqOInGeLfgM1eOUvWwG3e9FPDCQFwpk/FarM72afA2Aszsd
	nLITjkvyUyi0TZCgJrfIaAMsuLABx5q1jeNWhiZTl5YVFhIs471kfYPk5frLeMeGnNxvgB8HaeP
	U9r6LIndxk8WDrhuKVlRdHtuAHyOz9VBGWChOySHrCILI8Xb2utQQ27Vq7o5yyWPNO/3WniOj1U
	h72aAReyZIVkXmVrVQtYZE9APVUWmi70ZIwwbPSgqE4LPPmnq0RllWYpyRhEVBv5sop/BUzW1Wg
	b1e7QXOraZPOk/R3r1DrC9oj3TCROc/j77v5/B/sfRy7dzJXbQQ4zrchXTbkNqykwx0DsIkSKyk
	ky6877FnTaMVXDjspHILQBfeNWw3UYiJcU+XCU0XkEkGrykoqTT/yA1RmueiF0B7YErOyGjV21W
	SBK71j
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a01c0ec65fmr23274685e9.29.1790780471473;
        Wed, 30 Sep 2026 08:01:11 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01ccd1566sm17376225e9.2.2026.09.30.08.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:01:11 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:01:10 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Cheick Traore <cheick.traore-ext@st.com>
Subject: Re: [PATCH v3 06/15] iio: adc: stm32-adc: add vreg enable option to
 manage diversity
Message-ID: <20260930170110.00005b71@gmail.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-6-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
	<20260930-adc-stm32mp25-v1-v3-6-406834430d72@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_080114_762821_3D6AE275 
X-CRM114-Status: GOOD (  10.05  )
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

On Wed, 30 Sep 2026 16:18:27 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> Add a boolean (has_vregen) in adc configuration structure to prevent
> setting the reserved bit (CR_ADVREGEN bit 28) on STM32MP2 SoCs.
> This bit is present on earlier stm32h7, stm32mp13 and stm32mp15.
> No functional change intended.
> 
> Co-developed-by: Cheick Traore <cheick.traore-ext@st.com>
> Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts

