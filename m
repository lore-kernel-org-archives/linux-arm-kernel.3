Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD58BCF45D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 00:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ca7ba810N8yfT2a0uOQiRTeHQwK7t+A9fpbfT6p0g0=; b=f70lx9YwfR5YgjXLHJPAlhKf39
	zfTIq+3IBRhfM3e/Ia2WckZqCbfNd1aP1x58ayvkIlJuuPAV5dkN7uUlcp7dkGBG69sKwNgdH6Z7y
	6m+SQJkTRM0UPOcjfuThWlCYwFy+/zhuR19L0MIEsLSuFVHykYJP1RmBBVe3MnIY7EeiWiEKfhvfm
	dzGmnU1DO2Ck3Mq6qyxjE5WNNYCU+prM0UTMCIv1r0JbeoCLpURpokn5oTr2EhfaVhiDzk2mcVpms
	oe9yxH1xS+yqGCNrfcOe4IB4T/G1ogsvhqLRsHy2CODEdmSECIhazPjzU4sJtFfZMisGpC+4C3syg
	NLh4AKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRpo-00000006KX9-22bO;
	Tue, 13 Jan 2026 00:00:32 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRpl-00000006KWo-3W7N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 00:00:30 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2ae255ac8bdso1478788eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 16:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768262428; x=1768867228; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ca7ba810N8yfT2a0uOQiRTeHQwK7t+A9fpbfT6p0g0=;
        b=hIegzBMVCZ/oYs7PV4ynaYTMgOfVzzPelagi3xoXofTQh7X+xjEvUr+gsUKqie55Qp
         9HjZZ2lIb1JHwSA49yWTmlTNG7BpiebAOPlwAPvx1hLWSI/VYES1yeQdVWPW7HSScM9z
         oygGLyt+MVkRtgpa0PX6QQlq6HsoK0WsczKCD4PYdiQi1oklzWJs9E8O1en8Hp+4hNtN
         +WdSG82pW2HZOstqHMqoeI1cAbtwjGvL/zhMV85FD/Jh5fCsjYBeYX1zE3DRizBcZ8io
         liB5+2IDmdCMk7CL5/IAT4MCD8ZRqWXSkhgWf+Y/OL0u6e5jkmM6znrTBz27FAhp9gPy
         /8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768262428; x=1768867228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Ca7ba810N8yfT2a0uOQiRTeHQwK7t+A9fpbfT6p0g0=;
        b=fi42XaNa6sPBYNNFUi3WyKNL/iPOL2hK62nf7iyiIBmztgN20tLx0TWx9uVK8Xual0
         E7iek+VMWDZgwfhIhRHIGiTXKTuaBLMKAeq/bFiIavelu9LPVlDlpvf2eA/r3UB3Om38
         Mr0c2f6lNup+Cd3bUPSH0tyeiKTImasQ33KQZX+eSSVdjHSGFNU9gBwpA3U1fb3ftJEF
         J2mPRKipNvxTG8h5zwxJDvvKM4BXURcCTKt73wCgcwbwWtnF78bpYfoniYhzR2LW1hXV
         m3t/zruRi002SKXalDDOGzu3o15FtJC5kz+L7sSyyfHYLkFFPRNSAylv71zlzWYTgMC8
         oPqw==
X-Forwarded-Encrypted: i=1; AJvYcCWXgq6wzQO7pzy86xlxU2P60pDAHDWrsRX3iS0+JUWA4z06Dy9sokrpGpepmd7AaBgQYb9B5O+jlxeJrOhHQDYA@lists.infradead.org
X-Gm-Message-State: AOJu0YwvXy2FuiV6pF4BpekZoFLebCfTuPTpyBdV84vc7O2wagr8+lyg
	nJROae93boVC1GMPYtMEpi2/ImPRT6tAbCAiHsNRTKAePI6YiHwFLR2O7hqwfg==
X-Gm-Gg: AY/fxX4dwIW3m9XDPo9WwEwEflO8vpALy58NwBqQFkDvjqFjf/cM3fN27f0vvyI1Zp4
	S8eBEMKjN2iR/BzhpVhhSKsGGJ/ERd2wgDB6mLLXRxJjf7k3eyR3PlmuG5Q6cEk9ISoUrMYFfZt
	bZWeUlFLmYtEkJZgUa6P3eHCmtHe7+x4RSVh36IlybBdGDQwej0MdQyGkMJi+aRhi2Oxg9YKGTD
	sz9MLTEyd15G7St51NvvVUn7rsuZhtAjnRhmz48hLXRdnJv+d218khq7NUwlQKyIctsaqjK2Yg6
	fBowjmkbLCysU3zaTIKfIQ6b1SFgsVdunNei/BQAvj7rMFlG236vTxv15ZyWBQrKZo59u1W/E0E
	Hl4wu1GRBtab+FhoLDE9hhE+UCWXbnzIfdwFGfPsQXaInBbe6KkkQdncWfiZjbR68z98B06hJ6y
	tzGzs12dJbwUqcaZztPa2Csnxx
X-Google-Smtp-Source: AGHT+IE6yvQ2ddlvX9nyemFmo4N5T/S3GXfv8OCsJYg1pE6WW3PJHwa8O1dQ8ly5F9NmxtGXBloc6A==
X-Received: by 2002:a05:7301:fd8b:b0:2ae:5b24:1cf6 with SMTP id 5a478bee46e88-2b17d30f886mr14686787eec.32.1768262427467;
        Mon, 12 Jan 2026 16:00:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078ccf4sm16958219eec.16.2026.01.12.16.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:00:27 -0800 (PST)
Date: Mon, 12 Jan 2026 16:00:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to
 DT schema
Message-ID: <8d63c13e-15d2-4555-a110-4d446f3db314@roeck-us.net>
References: <20260109-dev-dt-warnings-hwmon-v1-1-f2a84cdb0e1b@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-dev-dt-warnings-hwmon-v1-1-f2a84cdb0e1b@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_160029_881936_5CB8F9A7 
X-CRM114-Status: GOOD (  18.49  )
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

On Fri, Jan 09, 2026 at 04:40:28PM +1030, Andrew Jeffery wrote:
> From: "Rob Herring (Arm)" <robh@kernel.org>
> 
> Convert the ASpeed fan controller binding to DT schema format.
> 
> The '#size-cells' value is 0 rather 1.
> 
> Some users define more that 8 fan nodes where 2 fans share a PWM. The
> driver seems to let the 2nd fan just overwrite the 1st one. That also
> creates some addressing errors in the DT (duplicate addresses and wrong
> unit-addresses).
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> Hello,
> 
> This change has been on a bit of a journey[1][2] and was eventually
> integrated into my RFC series tidying up the AST2600 EVB at [3]. Rob
> did some further digging at [4] and I've now addressed his finding
> there.
> 
> Much of the series at [3] was merged so I'm splitting out what remains
> and peeling off the RFC label after making necessary fixes.
> 
> Guenter - I've included your A-b tag from [3], but as I'm sending this
> to be applied through the hwmon tree, do with that as you please.
> 
> Changes since the series at [3]:
> - Update #cooling-cells to 2 based on Rob's observation at [4]
> 

Applied.

Thanks,
Guenter

