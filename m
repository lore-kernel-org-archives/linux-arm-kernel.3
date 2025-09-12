Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D923DCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqqpI2kMloNbQrwtAbrBDd+hBQn+g4T03pkyyFvQVUY=; b=qBY7ufNrrJwPoHUniLRYLTNyGU
	HWVkexWRJLBq3SU0sgS7SDlsLc2thME/sWDz+YGcnjSg8j10yPpcX95CkMcE3r3FAsPIunpSmxuMJ
	gzdS5Pmz9K1BddmCAGnZj5t/eWOwvJkLx9dTpq4F/QaV7dPn4w4XnJoqbahxtVtFIIqp8I4ru8Hwd
	xnjiVWRayu9OgZ8k4HlE9OGDQnnO2yw9D57xRX9ttyNkDNxNblbF69YC8A0+dUP34r7CYejRFCv7j
	3NocEc4BPZfc9Lev56MF2WMoQr4l6WWcDyWLZL3awKiFVNkS4Ue4ID61SUxF3gQjwsbz9YiU76gQZ
	f3npKK3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4LZ-00000009iCI-1M7z;
	Fri, 12 Sep 2025 14:01:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4LW-00000009iAM-1rKI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757685707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MqqpI2kMloNbQrwtAbrBDd+hBQn+g4T03pkyyFvQVUY=;
	b=hvkHjNwExbsgYxcSmbDubn6kipfCCEtFbX44YwBlCTtnbCqmUbupihbFUqerfmbP7wv/e3
	+wOLR8gOXBureIe4lrm3E96BRSuyoWpR+mj/BBgKeU7SfT8bxP63lUNc/QIq2sGY05tKkp
	fYNM5aQlfFd6d3lNglBCw94zQCAs1m4=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-tTprR14fOdu6hpBGQBDq6w-1; Fri, 12 Sep 2025 10:01:43 -0400
X-MC-Unique: tTprR14fOdu6hpBGQBDq6w-1
X-Mimecast-MFC-AGG-ID: tTprR14fOdu6hpBGQBDq6w_1757685703
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-74b64da4a81so4386662a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685703; x=1758290503;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqqpI2kMloNbQrwtAbrBDd+hBQn+g4T03pkyyFvQVUY=;
        b=JnMKUTYwx/jBf+dqPaZ4aBVrOJJ8pttJ4HkoESeRX9CzkLYEbl0XwQkUT6g13GyE1S
         6HdFHX7RM5QasDzUo56AynnF7HIg8IKdwu1Jjo10QYwBYKrrJ01ZG/BlgyxZY8xpDwaK
         /MGlzWChbNbuyUbAaPvG6y/3LGq9X5Y5uDcSR2TwTzKw3GOaDvsF/VSa/3D/gW41h6c9
         Prq4ipb0WTwTaslwkK+NywPSG7ALA0zlxrVDaM3qdQQaACmXwLrhF6lSNB1haH+uAcRT
         GluZbfdCIZwOPW9pVAPW4O8wQNgxt/lksYlPMTrXRVxoHEXupet/HuIbpQrHzOoqxnIw
         iGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwadSIn/1rFliGK40+G3qm+lCIMe0T5NPdpqnQmhPAPU7yqJNZlY9OXanPMYw9OCAfGTAsdBQUHLc5WC8ecRXg@lists.infradead.org
X-Gm-Message-State: AOJu0YwdgwA74xJcJjNg1jYSpM+gG1OPJRuwvkfrIOEXXMdI/1sPuoZY
	whxjOWsNHxyh+3kh+x80v6IPebp72/aDMnOe6kn1qzB+gmloSk029DgRRzWOCeO0ZC2+tXYhdNN
	DM+XdNgWWBE6cajMiRuJBRYsPheKtVG5SZGHixgxUn5VAqne6SE1mGvAqJ8yss434Ya5fbUZjEo
	el
X-Gm-Gg: ASbGnctg599/pWgG+6QfXzqz0W167JZPni+ISAFqohHqcdM0AZ+uBkYF6tcU7pluArY
	1qzy4+QJBg03DW0BvGn3BgjfUFK+eGKr51sN/LSjLgdZYbOnUKiVrbCePWe4BcmJZOkQzKw53F6
	0Vg3dOimmKKiMHbl7qLhmy63qbEuV/P+4ilHe1DxWRNw5z4vGRrwkNRyYCUn9Gd/STQ1YamqghX
	4ntrIp4ZWpgEyVFQNDNeUiUsHpvyyTG1y/nXeD8Ogo2j5SinHxiPdw32Bwk4DLr33W3voONYdCI
	ELpRXIQeym1e9XGVmKH9TRvr+ggD0i3lk6j7ZpxMJUKGRfSFljvKiMKAwDTLf+iOCVYwBdT0PfQ
	GW1qeAWfHIuxhO6cz9FYf2yH3oe2HUg==
X-Received: by 2002:a05:6830:921:b0:749:32a:6e79 with SMTP id 46e09a7af769-75355ac0c40mr1629160a34.29.1757685702760;
        Fri, 12 Sep 2025 07:01:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5yxEH3wh5uzqiZ9fHV5ltsysfaNN7LLcUgGKgcfhcmP2GCkP3kLrFAt6qiJu3nESHP/mhlA==
X-Received: by 2002:a05:6830:921:b0:749:32a:6e79 with SMTP id 46e09a7af769-75355ac0c40mr1629088a34.29.1757685702145;
        Fri, 12 Sep 2025 07:01:42 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639de9a69sm24487811cf.46.2025.09.12.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:01:41 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:01:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <aMQnwU3UA5xe-Eou@redhat.com>
References: <20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com>
 <20250912-clk-ssc-version1-v3-2-fd1e07476ba1@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250912-clk-ssc-version1-v3-2-fd1e07476ba1@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N6O593DCNN26zr0mM8lNPIOHvppN2HM5xJDaeR5sRo0_1757685703
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_070150_558390_0F94A883 
X-CRM114-Status: UNSURE (   9.36  )
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

On Fri, Sep 12, 2025 at 11:35:51AM +0800, Peng Fan wrote:
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


