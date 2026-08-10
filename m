Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2877DC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsKi5A5SAA7rPP1PbUs4CoGffjmVgKp5PFlyNfYqwL0=; b=cSIFzwIZQmlzvrFs8pyY9llWA+
	SeFg60W73Q+YWUhblOnNZmzHSUT2rT+9qSWTTvzOqQoZrbwH6G+85V2kXeej+eFFfpxRfq7VwTheN
	FL1ZqNYiFnT6CNP5Z/vsO681jeH5tcTWrlvjgw/hu2LOXR9MnfttvMMe+D+TM6zhRbhIiF2/HaXZR
	keDe/RM3/8E8RGaJdnQjhrWRjzOqD4gzRGISSa9WEHskZ6TFhN3BHp+HxWsm+8FRsyFf/Dyt/J2+z
	la3kLPymaf50Zt9wdV6sTXa4d3Il5xeCmU9mniIk/FdOn51XDDhr0U1IxRLEi19ikYHqUEWvMdLvL
	CxETLKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXZW-0000000CuEc-0SFl;
	Mon, 10 Aug 2026 21:30:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXZT-0000000CuDe-15z7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786397410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zsKi5A5SAA7rPP1PbUs4CoGffjmVgKp5PFlyNfYqwL0=;
	b=gCUF+L1wa/hRvCAZ50V2wOjV4FNCn5wR7F7AwIrVOVPt/ggbR/wQVNT/TL90nIiVzjnN/r
	ZidVaQivmT+5AAVS2oseZKd2geGGLoL00k2jo/nuzaOir0gAigFgwFJlXiUzXriYUt19pn
	z7MOjh4wWATChx7v7syVlyYxRFS2twA=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-cR5yaYC9M8yew517zLiAGg-1; Mon, 10 Aug 2026 17:30:02 -0400
X-MC-Unique: cR5yaYC9M8yew517zLiAGg-1
X-Mimecast-MFC-AGG-ID: cR5yaYC9M8yew517zLiAGg_1786397401
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-668a55b1809so7063174d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397401; x=1787002201;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsKi5A5SAA7rPP1PbUs4CoGffjmVgKp5PFlyNfYqwL0=;
        b=axL91+6AEEP2XvHXohmC99fC4dhDFKIfZtFikCoKZfjySoQnvDcRSmNDEnwBuoGriH
         hW+FZNpXI/pXLjXaLZUaPMsYfb5caxNJh5qzqvMC+C3LhWxF8xwFiNF+m9kl1MCkYd6k
         Xlv1gklPWqPz8ELdJ1ZhkrC6rzEQjPBqmPSx7Gpc3TTpbBiRFjkOsHJDEe4oN56OSMqU
         zJIGaI4EolmuhzddPlvl9K87kFqmF1/xl6gx4yqNQ0O/bXSkQbD/0X6EgLOk3rkA3oHA
         koNIr4Xedh5ff+qQtcRcKMNetHdFpEtA3N4JG/PZvTuysf+5sQGZ4ikus7mmY9K8b+0o
         WX0g==
X-Forwarded-Encrypted: i=1; AHgh+RqnZNff9hmBaPo0o232yQB1BBy0km7OLd4sXcUc/j/t/MDJZVFluvph3RZfxv5R+wE9BDaF9PqCCGaukioYXprW@lists.infradead.org
X-Gm-Message-State: AOJu0YwXYoYDnZsE2bFd3P4gqmYUT96QqNYJgJQrisVP1XC0PiGIlXpL
	fj2iFwjuom8B1WGYn8BOLOIm+dpPoXxbvS2SDlHdmS4R18Ov6k1JJyC5h9JV7Sn8Pp57ob1G4Ro
	aV2mV+y3UwY+TcpIXRXRA3Df5hmfqBaGJk0dzHGpdm8h6uzpr/D35GfyKOpXvwabRzk/EJDtU7T
	x/
X-Gm-Gg: AR+sD11SBNQJe5w2uv5zzaSJUMBu6juf7DiyKU9HKU4l3U1YY+lFNvx6ZawpQbs7hDE
	5g3BD0TwnJJc1huzcM35u1lITZHZHZSsb0nWzh/dm8gYodSnrRhtN4NEzV3claqQLjl2U/31yWA
	yjYlogDwEulZQMQNlMtA5wb/FaT320igLU3T7WEyBJI9QOM0DSYobb2Fj8V2UtkGJd9rOAo1ugg
	rZ5fT96GEIIeMqPsVlv+0JFqmWRsR7OXbFO8++pgIT20kLzfUkMLZo5xTzv/cmtoJ8/t7uuGq1U
	8Ao1Dsy4zA/bm5oYHRKAOzBw17VmCL6WzdMIGc+IhzwHBHhmBSpiC3UU/Jm2saJ/1rqTa1r8fj/
	la031RbAltj309nsSySgXAwLX2OPwVOecCI4=
X-Received: by 2002:a05:690e:1341:b0:66a:faa6:b5ae with SMTP id 956f58d0204a3-66afaa6b713mr7196130d50.19.1786397401487;
        Mon, 10 Aug 2026 14:30:01 -0700 (PDT)
X-Received: by 2002:a05:690e:1341:b0:66a:faa6:b5ae with SMTP id 956f58d0204a3-66afaa6b713mr7196081d50.19.1786397400986;
        Mon, 10 Aug 2026 14:30:00 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acad2ade5sm7178798d50.7.2026.08.10.14.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:30:00 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:29:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v12 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <anpC1eRq5ajN01En@redhat.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
 <20260804163807.1285869-9-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260804163807.1285869-9-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xmWRdawiduXcRpJHDfiSml5owbL_uHOLh92-FMHDQHQ_1786397401
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_143011_368216_3B934F47 
X-CRM114-Status: UNSURE (   9.95  )
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

On Wed, Aug 05, 2026 at 12:38:04AM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> operations on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


