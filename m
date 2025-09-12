Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ACACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NU+SVzKeTWD0+BhYK3td1Pqzo+tTZOjwzHuyU7qJoZg=; b=UYEmaWvWnsfPditUxXdWoA+Jth
	RUpO9SxiUjgoPaw9jdf8IABv+xlzGl/4H1HNTXmOMgGliPIbh4d6qW6FgpPhV3zprubVC7FqaJS4Z
	5ZFmLYNgNzzGrpnHvJS7DpPjvstTBtgLqhaRrj8nxg8M49RTr1UQYEBDYBQjxMeHixdgNYUbTjOM2
	wP7/dkl/p5Lfivf1sZWPGh0Fow149ldy1yIfNOG5qbv0kQbk5OZQ3LadLUZ7+KCLF6zz7Aq48/G2v
	ecnhqU1PuWxg/OtutxoZ7SmaBcVi3jHsg2xeNSqJAaKXRFilE3WLOZ1LOvCHrtULE3pGu6npe9QJQ
	A1OabyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux57Q-0000000A2Hp-0CT0;
	Fri, 12 Sep 2025 14:51:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux57N-0000000A2Fs-1ApK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757688676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NU+SVzKeTWD0+BhYK3td1Pqzo+tTZOjwzHuyU7qJoZg=;
	b=iKIr1OvPFqOM54Bae9o3VBrP3eoAxITH+vi3c6A7mMF0kd9dGC5uDB2KWmFPn1TV0/H6N4
	eroVOKHkrBPUGeluYpGWf1b0QgURUNHQcBxmCRuYMSbOjWhugnEwENwNrqZlnDGyj42Axd
	htq6FZiKxI+wVbAEswQqXzAlc+MgbII=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-pZZvv3k5PMKPDUWKh2NNJg-1; Fri, 12 Sep 2025 10:51:14 -0400
X-MC-Unique: pZZvv3k5PMKPDUWKh2NNJg-1
X-Mimecast-MFC-AGG-ID: pZZvv3k5PMKPDUWKh2NNJg_1757688674
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b60dd9634dso48948301cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688674; x=1758293474;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU+SVzKeTWD0+BhYK3td1Pqzo+tTZOjwzHuyU7qJoZg=;
        b=WsaRxmgn1iIE363FmdVNHzLJ9A471MobdXxiTggfxgCHGG/pGlxXxBTyB9FamSt1KY
         DBFLaS5Anqc0LI00KRXU5iEIhz3au9OXR24IOuOOHaX90zTUALG8ZDdL1obOf3OqUm9e
         pMqyxumlXJw6Bp/xvi6TmqdDjbcICXSZYe+QcOoEBsS5LSZ8JERtnbe1k7At0Nos6v7P
         72Qe+njvDzQpMcE2l8QkQAhA3XK8e8SObIJPJGnUSkWr8oG5C0PtAGLGEU5Kx9CljHRx
         Res3Avo4D24Y9meE7VpkIfGffN5XXhF4thEqzFI9ew7cY1UBuk10m3D+k072PabES0mD
         ZPXw==
X-Forwarded-Encrypted: i=1; AJvYcCXuUch2tQ4h9v95IrIRgeWq6I1Ku9cFdCmYxoUvpMOZeXx6AL3nGDjOagGSvmQheqP95dp1otI86PiezJxwP36y@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkn26LvlAeIdVsEc2OYtklxEy0BQ3lMJV6Vq8JHQ5wgYBw2YMd
	yOMp6Ty8ZOsqW72FghxP4HJnDsWlSbM9DSqJKD/SjNnN1C1UTQsfgui1gwS+YDYLCvuo+r0eZ3y
	bdctr/RfsY+uvSfujV3rM9kzpT6F/HtFReKgwiuUC+utuPS4j/4Ke/Tsbd5b7tOwU0knQikGXln
	e+
X-Gm-Gg: ASbGncvH1xBUYELF0LEN9Sh0d5qDmp9irpCTU/Usx9mXJCP/xf3YOMwqYXk9joQ/Soo
	U5XQ4EmCArCEgsO+bN3nE5mVqenm11eVodrvpx4criXotukk/4TDh+f98d2uYL1nClb6IrPk7bP
	KRlgLvK6oz2t2+LOeZesAXSSbQPt7DBqv5oyHrb5N3vwwhGTuafLB+2fN/dPxl6Qu4c6gTqwlG8
	LYaI0uyxcs15Ic9eBbd7Xr+boJbbO/Xu+mpBW3NlBXSJWgPfkjC1oQ6nyh6at7NYLj8Xmiag/BG
	TXFb/HP2yGZtvdRWo1a8bOEPG/4+AzQrltTwTtJhyBA/jbIqH6hyjXAcw3gkWkwPJJD31LMZN1z
	sdMhJCBJEU+HxZ7wNXdNgLWN8lW9dJQ==
X-Received: by 2002:a05:622a:1803:b0:4b3:4b6d:ec52 with SMTP id d75a77b69052e-4b77d0cc905mr42168411cf.32.1757688674176;
        Fri, 12 Sep 2025 07:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKHaF5tvFQHHNEZPu3AfsN41wRwe2BP++0UPlIuNaDPH6QWUiaDDqVyOq53mlk8SSAOAXHkw==
X-Received: by 2002:a05:622a:1803:b0:4b3:4b6d:ec52 with SMTP id d75a77b69052e-4b77d0cc905mr42167931cf.32.1757688673567;
        Fri, 12 Sep 2025 07:51:13 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639dcae6dsm25920811cf.39.2025.09.12.07.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:51:12 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:51:09 -0400
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
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: Add spread spectrum definition
Message-ID: <aMQzXdVHOGoT9y4C@redhat.com>
References: <20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com>
 <20250912-clk-ssc-version1-v3-1-fd1e07476ba1@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250912-clk-ssc-version1-v3-1-fd1e07476ba1@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -QmtB41L1kKEA7pei-xBcJDj1r-clYdCSQZQSwwGJOo_1757688674
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_075117_387340_993DC3CA 
X-CRM114-Status: UNSURE (   9.76  )
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

On Fri, Sep 12, 2025 at 11:35:50AM +0800, Peng Fan wrote:
> Per dt-schema, the modulation methods are: down-spread(3), up-spread(2),
> center-spread(1), no-spread(0). So define them in dt-bindings to avoid
> write the magic number in device tree.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


