Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1B2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozue1u0UD/lMowwm+i9KBTDQgenusJImLUvjM+8MVbc=; b=43p//Oe26VqZ9emjJdUtnHwyrP
	M5QW83mGxQCTmFhc8DN0bkXo1f6lnz1yjo392M35Yv/fnRTov7vvzVHx8g0SWG9GRAKpumSfV52b2
	UyUc78WQu5lXyV+xURL+x3fRlP6CQPt4/wq1qCbRXSbBtA9jMqRXCHObfHEnDxMS4SzBpXKSWH+5I
	4uo73hYc1nfpY/MhkHZRNNq+Cflv3S3JE5DfYTYljArc9YcR4QP7NocMn6DI13p+rAsY9b/d2ShNU
	PSYFzQPeNn9EEo13ZINq2ULA5sPy7K6Le2XsoXfZDBLBk0j731fpIwML+XP+pEjKFoYHsT3HCCmFp
	2RO1Vl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5jCh-0000000Ftld-06jt;
	Fri, 18 Apr 2025 10:44:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5j4Q-0000000FsdO-0uDa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 10:35:43 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso2657365a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 03:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744972540; x=1745577340; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozue1u0UD/lMowwm+i9KBTDQgenusJImLUvjM+8MVbc=;
        b=bGmdoZPPal9XDHselW6OkCrWIiHkDz1ZfE/uOIy2La8+r628gJ9xaK7ujTrsONcaMc
         HjUu80Mc5vPQT1JMAaX7XBMZX88kynAr41uKMzKtTkrNfiKvYwyVLlH8A+kaJTeml4y6
         aAoVEjJQxPqFPmdlIdsZNIUU5wTGjLM1VZ+gQ1pYc7mE8SwbPVmDBG8y/8uWLw6ArLcz
         JyHJgeKpIbW/rCZONFrICvHifX40SNfC47RVe04zPM+KM//Y7iHTKmBaAzrlNdIiYMh6
         ohCSaBcuwpAR6Kcc5YncQibVOR0OvZtxM8YKaLj5RkxJ6hzX/znZXorG+rlkOCIiLhK9
         EFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972540; x=1745577340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozue1u0UD/lMowwm+i9KBTDQgenusJImLUvjM+8MVbc=;
        b=QcnTWjX0BEdw+xphfkFuO/DN1mkSxgA0DYVGRRmF7P17Nt0eUnA/Inb6DkqTRa3dF+
         jangRcuy+vaXLGov72gc41CHRcu42CmgnocI5qW9Owpmoa28pipg59RZpR9i7F0Bn2e3
         8ErInOcciVBuBetCgZBvgzGj8h24Pzw/LtVEVBcr7H0yMfwP6c6DyOmNwPDUO7G8818X
         YhAbCdEF8a+WSsR04sGB+2LQhXA3OjdcDYwa7UpLaZgxTOcHB3rIhvNIDKQ1E95miMO+
         NPNqkrNwkGKHP2w8CZxFOV0ZIsntbx5mR2CRMPTFxhl7IaWDXIyK31F1xhQ/o751Y3vF
         cddg==
X-Forwarded-Encrypted: i=1; AJvYcCXksPRmuz1HCXVsooRKB/rcTKmbO0VArXZ3WyNCXk7W2YvazVaTvd1Dwl23MmS84+hWI2ryS+8j9DkhhQPLSyY/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa033QuCgObXH8i5lj1IWPQJ+Ft/afCiA7tSUCro+Cg38J3tfR
	Rn27eBwW3d3eb/mQcljNQCMVmnjs2MreWiNadm2IR0XOQvp8XIbOrqyf34e1nhqAQN7oK/lcxMI
	5PTk=
X-Gm-Gg: ASbGncv5rj8zg3urucr+K7mvNkCN4299EoD9S+z+juI8iDDGFbx8UdsgJxBC/BwND81
	wLJf4gs34hvewgkm94bscJav2tBUdN4L0ufslnx75wZ2pGnrUxUwo1YY2icjf7Ln2Y9tnYXnpLe
	ff0rNyNTgwjPoJDLoWbfO6kCqoYBzIpL1vhom6jfWIxnK/45JBvEEHW6367YgV31pMOPbm2+tm4
	b1lU8JLCJ3rv0OU77Nz2WGcxSatrQt9bhMZifbMwSRhq8WT+dO2ZOj9Eypx6P++LQnIrlHLVwVb
	pP5KFQI2Yalj1KgGhIfKnss99hCb0BzKCqRhPNNnoFN9dqmKnm2//OyV35qCZmc7cKaLawF6IIr
	iS+4=
X-Google-Smtp-Source: AGHT+IGMO5NilTQ/i8XjooFiGASJrvfFcSDr2VmmYPyU7LJt3JOcj+Z5vFGa9j6IQlSeom/a+LiTrg==
X-Received: by 2002:a5d:6da6:0:b0:39d:724f:a8ec with SMTP id ffacd0b85a97d-39efbace5efmr1565326f8f.44.1744971048079;
        Fri, 18 Apr 2025 03:10:48 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d69bbsm16142205e9.34.2025.04.18.03.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:10:47 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:10:45 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] vsprintf: remove redundant %pCn format specifier
Message-ID: <aAIlJaZlBxympZDx@mai.linaro.org>
References: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_033542_250051_A14E99D8 
X-CRM114-Status: GOOD (  13.23  )
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

On Tue, Mar 11, 2025 at 10:21:21AM +0100, Luca Ceresoli wrote:
> There are two printk format specifiers for clocks: %pC and %pCn, and they
> print exactly the same string. Geert confirmed the intended reason for
> having two was that %pC would act as a default, like some (but not all)
> formats do. However there seem to be no advantage in having two instead of
> one, especially now that there is no other %pC specifier since commit
> 666902e42fd8 ("lib/vsprintf: Remove atomic-unsafe support for %pCr").
> 
> Definitely having two without properly documenting they do the same creates
> misunderstandings [0].
> 
> Since %pCn is used in a single place, replace it with %pC and remove %pCn
> to simplify such format specifiers implementation and avoid
> misunderstandings.
> 
> [0] https://lore.kernel.org/dri-devel/f8df2b5e-b005-4ada-8108-159b2b94a72e@nxp.com/
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---

Applied, thanks


