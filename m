Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27031C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPj38otgPfg1CUWLGvk15FrHBLxa1jnnTKS9SOSBOj4=; b=KGGmoyjJSrP1g1/eKLiL5/mjTL
	Y0dwreu5xFH8R/G8NWhisynnx8JigcfTPKpA5UYtM3iv5O5cUvAj88rxyDv5wChz54uCl0Z9c9W3N
	XrR/dMjBWXbQXili/jw2Zg6oANZGBFHANOIz2o9CsFqD8kr4ThHiPyskoSIoyKT2VkoVfw8pLjvGn
	nkrucg1UR/sVxz3vsUNwiAkJ3kWyYqMz4bzS5oKvZWGmDgvH+bYTxQ8O6t/ACLh/vqavJSfLjsMP4
	cZqrMU5KEVusN/owjRrImeZHNXkmtx5QzyHcV/oDjx1L0YEXH59xt1+0n4x7iVnz+WypRd9MEzw5C
	y1EufKFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8Z-000000085ce-260i;
	Tue, 22 Apr 2025 18:14:27 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EF9-00000007QDv-0VqQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:05:00 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac34257295dso958296566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745330697; x=1745935497; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HPj38otgPfg1CUWLGvk15FrHBLxa1jnnTKS9SOSBOj4=;
        b=B8ducOJtDjLhk5+bOz5XI0LgF4+VmewGugakWd8HxUCugF2NI3FPXY+F3YUg3Cy6Sy
         0fjDMqmKAHPhHoS2RFV/dhB3MM64zgqfYbC5wSrkGt+OqFwgN6hc0B8DgmHnFNO5NgBg
         BGN6vX3wNS7ZDl/g4VKRWTAGvNfOHvj1PpyW6EUyjGSMoXc5iCETCsglSeBiDTOvrCwP
         VwnBkCGkVt6bCZDy8BAWehhsJnsaR1E7CBvMxEnTYrzJYKvUaikmLy2XXlRFlQMChQYc
         Qs1/oBIMPkPYHL79BO9PnQz3HZ+Kn0dqDGpYHszMWNHD822s5BY5qjyQvmMmv9JA6pU3
         wFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330697; x=1745935497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPj38otgPfg1CUWLGvk15FrHBLxa1jnnTKS9SOSBOj4=;
        b=moE+IR+X81MR+AoPH5seU5LZuldOmX24owQZzh0dIrXtfr5zkptz8XxntemK05A5w9
         /ZJkJ6fUY/rQXE+kCBqHUKTnJE2FPebMij43kw0Ffait9t48Td6z0m9lE9tFBWHpTG21
         y4bE9xDNMU5c19uoh0qV5lvgbFCDuamEiTzmnt+7QCiiZDQCnbH3ego1+P6tFH2eo0tW
         7I8cniU4b3QuEnWyfpIxodlGN8BaHTP2eRnRPookL/MMP8+1ceUud4NnppJpfvFVHwxP
         XVoQ4hYZNsFINB3rAeYyJkUfsUjroyEJxJE7S7gswH6nesWFcnSypqLztmxZbciyS6eE
         FXSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdQTtM/fnA/JXnntBpAn7XypH7j85vhG1o9pgU5SyA8CwL/agWr5Xg4a++Qd6MVImkr5Kopnnuqbc+yloOTyQm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/C9BhKobP/DZYk4VO5jKPDpZYcgSgb2tGYzw9zE0wkCjz5Xim
	JiBKlGu+f7SdXoHlENfhgrQhp/OHfGLo4udNH4rRXyDWVoTskuDXj0j0MA36wnQ=
X-Gm-Gg: ASbGnctkSM5bqwhr/0knel2ANxzh/Xh2kf0xAw1mZmoLkA6qf/aBY3wU2FOf1UHFhU5
	d1v1HiMNPicF/3l8ERKRqwJxIGqzDxE5p/ph5/3qcHpGmO3+Y/JhfkaFqDEgZAq7efZPI/NWKrq
	of5HustZUeVHlwXijZrrVxI5uf47n1rc4KsZKaxNgKXAQx83WZr7rVE5lhvP7U+l5868S9/HnJj
	GL3jHBTKo+Cgd9XMxZyiul/QDtXcz8kr6Jqp84HPAGfvjjsw2UgdIMlwDY7MWmdBcPWDvHfoMCa
	ooZPfYAMGOB0E7xYchRC2ZjS1C+ufeCqfcSnhg==
X-Google-Smtp-Source: AGHT+IHdC+QkLw/63IGYXQS6q7rBVNNk2potXnQUurnAaNgoQ1+GXHaWxq0i9ui980YqMIhNIDyKmw==
X-Received: by 2002:a17:906:4fcc:b0:ac2:87b0:e4a5 with SMTP id a640c23a62f3a-acb74ac51f7mr1244467966b.2.1745330697218;
        Tue, 22 Apr 2025 07:04:57 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcf76sm669687666b.100.2025.04.22.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:04:56 -0700 (PDT)
Date: Tue, 22 Apr 2025 17:04:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] pmdomain: core: Use device_set_node() to assign
 the fwnode too
Message-ID: <aAeiBbnWgHUkt/HE@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-6-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-6-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_070459_161920_0C476B18 
X-CRM114-Status: GOOD (  10.08  )
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

On 25-04-17 16:25:03, Ulf Hansson wrote:
> Rather than just assigning the dev->of_node for the genpd's device, let's
> use device_set_node() to make sure the fwnode gets assigned too. This is
> needed to allow fw_devlink to work correctly, for example.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

With Saravana's comments addressed, this LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

