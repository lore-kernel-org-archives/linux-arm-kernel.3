Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906DBCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jONifV3SAqgTpD6n3pEouquJmVfQbYGkPJ7FQpi+OiA=; b=GUpPhCmqqc36sywWS8LnPB6Qei
	muA/FHNUESF5QI+zEYFb4ZqDTQ05otXips6RY6oCJXfHXNT/+GyQa4s/nBmjJDRaVyW67u225KIi8
	aoZgRHosNTAqCdqZFZRo1c0T5EgJ15wewDP2sa97QTvOMbSrE+OpYCayKBvVTjJNr60AxePSw8EsH
	a5DvwW2CAyat/Rq5kadIX960iqKzPBgDRI34kb6yqUvH5m+4Hw5KMiRzz6lHQ3NTv1aALMV6P9IMx
	U5gPCCaBd1RimoUN4JqDpIGd9wTEBklyNTZYlMJq7J0QW784sO23fOpBSHTZ087uHE3fxFkOlZ5t5
	h9xORShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJaf-0000000F74n-1f6O;
	Wed, 13 Aug 2025 22:05:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJJe-0000000F4dS-0nkK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:47:27 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-323266d74b0so319220a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755121645; x=1755726445; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jONifV3SAqgTpD6n3pEouquJmVfQbYGkPJ7FQpi+OiA=;
        b=fdJ2009h1OOMJGSQFRgwoccbh+xW5+cA6rkDzzry1WffNwy6ToN55sWLPbjPvE77ZF
         6xzY8QPVMpnzPl34bBSfE3n5LiN7G3viTaf/jDcOopJjgj0CfsJDZx1IcMnoOTtF/2O9
         inP35L36TkQBlSKm98YmrFt/baYwKRBZ9yIbSZntag54GuJA/X9JtYE5jx/eu3ll726P
         zmve1dMnzXrFzJwROkqpzvbMF0H/IPSsrGLh85HoNxNBwbyHbVA4QdGN20c952SOzKao
         RPp2kRMelQLSLyGmL/dbQYRdVSKfKeuSv9fsWMNtpbEUnd0tW9vStzt1pIPv4UcqxG8E
         skJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121645; x=1755726445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jONifV3SAqgTpD6n3pEouquJmVfQbYGkPJ7FQpi+OiA=;
        b=fwIhJG92/B0Fx6Of0nLaoIcePv6/p2E9W4bQVIhrDj3fxwjEZJvCrhCGD+6T3ezC3y
         vH/8ZsQop3BwKT5hSzaqR7hn6t832eFtLQ5aCPKgRqA5UfyZJhehy/CxWEpNF7LvIckf
         g7h8d4wWbhD/9FpyJNCmT5bBrs8xDvr4S21oxG0aXA9qDotuhoaPMapd+2jaHNia1QRO
         k8XXa91QbQvSln1xoOhi2AUGMzj+r8j6WzCM4pCWkfaLkSqwIXO+jkJyrzCsuPXOA+Hs
         n0NHIGe0dkmWBoU/jepkFzlfqBd8HGooln514YBBGzH+ZU2cqGjSVCInHtDL4+CTjSD9
         IXLA==
X-Forwarded-Encrypted: i=1; AJvYcCW8tK5twycRPyQWdybsKQ1nGxtlsvN4J6CAzgO11NHMu3yG+0Ud/G+CaXaNwfke7NBkRZ8TFGdQG12oKPn80kqm@lists.infradead.org
X-Gm-Message-State: AOJu0YxDu06YvJ3PzcZwhiw2sSDorWWdiU67SXmOvFdUa4z1NqcRqLj0
	RyQDN9UzyTIEvyWoUNlDTEJYBmMg+UscaGL6LNIqjRUMxyqKumE7/QM4
X-Gm-Gg: ASbGncttYvwPS3zSmb0JIyaStdH1jjZdUs8UVoYVlTgY7V0ERmrSwUgqwBmtlWAHKj1
	UZ4bdhkwDR3yPzB+2ZesMv+o8qII7ZlXHepzJHPpJ/wNO+dRNeNMvfl+WgrG2D3swlG1eJopFLP
	wcKN1Uh/mu02NbWjCJIZTAmgbdM2sYJISvaJNGVMmocTWaqkOLA+r6XQIjwAYL4ElMKR4r+sLWZ
	hmYoiPjjOSmXwdQKIplvg6DRZsC9d+PZI+RtR4Lq10HHECV7mr/YSN57M+2GJrhAjJyWKR8YTJ8
	8d8DExe36ZbgT4q3A3zCuh5JhZ7vFy1r9++cKy2jkxN29cIwvg7+eQyRKGuRZsk6PXGpcaEQDEh
	cwc7tKSDmQBozsDKajAvSGSm72ZRH84sv2g==
X-Google-Smtp-Source: AGHT+IFnG1VfjTfFzYy9SU6px68SStWgfbepA09Klycfgu1ndr7pAZJLu+JzXbLn9aZDNRQzy9oRlQ==
X-Received: by 2002:a17:90b:39c7:b0:320:ff84:ceb5 with SMTP id 98e67ed59e1d1-32327a634e5mr1308738a91.16.1755121645110;
        Wed, 13 Aug 2025 14:47:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:89af:72ea:c356:f3f0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323257c27absm1022898a91.27.2025.08.13.14.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 14:47:24 -0700 (PDT)
Date: Wed, 13 Aug 2025 14:47:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/21] Input: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <3hjodmfpiuh3xeiwugtpfs2sqoinb2toir2v2rchhv3nd3wdwj@2uiynsb5bzlt>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813161517.4746-7-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_144726_235075_5CE466BF 
X-CRM114-Status: GOOD (  11.25  )
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

On Wed, Aug 13, 2025 at 06:14:52PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thank you.

-- 
Dmitry

