Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962CAC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQK0UZKoyz2ZGITRCV0MZEm4Z1Ggizwl/51xOSw6Qsg=; b=VrPgXmyU8l/3qVG1zoepjtMW24
	lg0mKE04vcTfTtLEI9n550DEvGclBwgX7dYxOkvHZiClA1JPX9MW0x0aJyUtadxAGMUc/Biccpxzw
	XFZ1ZV6hy8EiBlCxvvNGofbMVlA+LYkkmINgNPxGSIgRae6UD3KqkloweXW8Mbc6u4IL0ilD6Fjhb
	pY7gOUQWdcxxJXFIEaxZ8+3KxQHs/idAnCwE59Jeby2ojTLQXwcqemrvd3+1+EmMZbNApTI5zcuwU
	4cpdUJv2HXNUJcSEyWUeqsxP3RwswML6yMadhd7neFuRw5oyI5UVGVp8c41InmtTnKwPM2dhzQ06X
	dl0jgMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTjr-0000000B0ui-2bXf;
	Thu, 30 Jul 2026 16:36:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTjl-0000000B0qs-2KDj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KQK0UZKoyz2ZGITRCV0MZEm4Z1Ggizwl/51xOSw6Qsg=;
	b=blmqyeLQ7ccuaXzbIoYXwbLO9xkffpCe+6hGgiLb9DRjSPjWnKOORNNwUfL9yapOfUh6nF
	ELGb/J18CPyVaYufjWrmqkwn6ATflIH5NT9DolG08SqWaqcxsn9NQkqq3qBoYDp2UiC5o8
	vTTxc3JHAoNqRI8QIompJk9Zxgu3OSY=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-SDuOMeZkMyWTBZ_gZIpouA-1; Thu, 30 Jul 2026 12:35:59 -0400
X-MC-Unique: SDuOMeZkMyWTBZ_gZIpouA-1
X-Mimecast-MFC-AGG-ID: SDuOMeZkMyWTBZ_gZIpouA_1785429358
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-667d6c4384dso6119422d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429358; x=1786034158;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQK0UZKoyz2ZGITRCV0MZEm4Z1Ggizwl/51xOSw6Qsg=;
        b=efD6iIUWScInCestPwEr4hcYeeveIOPfCRSh2LmtkzEZKSmezciyPRzi9gGOaLTueM
         4UDPlTa+ZAIE1oj10XMVMY+58whQpJgqeq5XjgIXrkXZ5GOBZHujJV96UveYdRY3hi91
         0AKKva0Xws58noisNIAaUAc/gUob/e5cdedU1mGsNRGvCgJ0GmoUi9csguWjg6INOkVf
         JAolcLCgLCD8UbUKvAGKwdouZDxeZkWXh2aRADaCljW2pkNKuv0ct6Oboqy4CcZU81OO
         KA2/i9VF9j7l7JkHkWsQe9pLWL0xMXVdFfWEG3Y3Npbu6Qzg4V4vR/KE68QZk5d0pYS8
         bIlg==
X-Forwarded-Encrypted: i=1; AHgh+RrfowctVrI5q1CTP+1BW3BjADm38ew5G5lTimXxFY/in9JVt9qicYWScg6tGbiC2/3eM7xiuh18HsZ7GBBwMsSl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcsj/NZqm9tFGaipGzJ+kOy3D6hR3Qcr/9djACJORO4lBo8vmh
	56TZkcaiGgQ0Hbrmp8c5YzndJ3qmziZ2fk+0cx47lotvcwiBoOjh/jzmNOajdMlqvWXpkmB9cY6
	2QvmL329VAUOfzJ/a+txZ4T9zD5sbVZYbLF5M+C20MD8ka3yKDFKBHkY94/tjqJQpy3mhhvYCJy
	RH
X-Gm-Gg: AR+sD12Vb/rj4fqdThYZJGwcWTERrR69G2RcMneYu79IRT4koDPa7qN6bGKTZmlhk4X
	KS1FRlj1Gdy80IS/uLACZbghAePd76o/SuSrURaSdrmQ+JG4Off2CNQLtrGu3m51MZM/AYix+qo
	OFlCOgVCqAfGCSLz/LHgqSGwxmPQTmBOTd4KLj2s4tJ6NTZtNJFXUjfmX/HYjvAJXJ2wRrA5H+H
	6vPLOsxefLeThHC5LiuGv7wdmfqP0LFR9VFowHQL/LGS7ThKnHXS8VqKkhQuL+ot+E36RSwg0c9
	J2xqWNl8KEtrUfBfgmc87u82Ozcu4jL2VCeZXc6bpqlwdXhpm99BwpKY1uRmDHHqoX6Z8B4xcMi
	eZ3VPQcski9b0qrzF08/GHGPBYiYLBV0xMCU=
X-Received: by 2002:a05:690e:4844:b0:665:e31:fd8d with SMTP id 956f58d0204a3-6692f477c6fmr1754699d50.13.1785429358410;
        Thu, 30 Jul 2026 09:35:58 -0700 (PDT)
X-Received: by 2002:a05:690e:4844:b0:665:e31:fd8d with SMTP id 956f58d0204a3-6692f477c6fmr1754670d50.13.1785429357912;
        Thu, 30 Jul 2026 09:35:57 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6693b131342sm358314d50.19.2026.07.30.09.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:56 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:35:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 07/11] clk: realtek: Add support for mux clock
Message-ID: <amt9avQReRq_hWtJ@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-8-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260728142806.1954638-8-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1sHMSVQScro4L2zdzkYnYIu1Wcz4i-Xf-wCTJ5ZgR-Q_1785429358
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_093601_672646_806F3928 
X-CRM114-Status: UNSURE (   9.18  )
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

On Tue, Jul 28, 2026 at 10:28:02PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add a simple regmap-based clk_ops implementation for Realtek mux clocks.
> 
> The implementation supports parent selection and rate determination through
> regmap-backed register access.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


