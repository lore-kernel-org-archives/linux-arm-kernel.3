Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DA3C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPsuvIVCjk9dgW5qk+ZZy8wtpQYYoP8bQTH9T/Us5UE=; b=G6vUoCPqeVp2tZEtYE9wuhr73j
	/w74ZA77Ygar5nQcQ0Z9JsRYvrpedNf1EszRKj3b/RbOqwaZKyjF+8ZDcnsKtnynUj1U4Ke5Ytta+
	EtGfqG6NTPpOs3UelguYygbFRDm+9bRCAIaE2OFUj0Y0zfTjfUNFt0EXwgmT6FDRIuKceP3m+DAO4
	Ko+hifCBNE1tbv1NIXdQiKPIe1hP5OSMeOItHmDBbpFgdp7YZIY03sTljT8hgR1ivWvIePCKo9YDg
	zCJHQdSZ7CgcXF2I95X8jRk+mKWIPtGo2qNCx2f+P6W0QParroX409EuGWBJocoqwmBxOVAqNUvE+
	STYye7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0Fu-00000004SEi-1V2K;
	Mon, 17 Feb 2025 12:29:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxoV-000000040I6-2aUe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:53:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso24395315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739785998; x=1740390798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPsuvIVCjk9dgW5qk+ZZy8wtpQYYoP8bQTH9T/Us5UE=;
        b=sC7XF7YpJcgHBXmqf4IdBeKd9bkfhGybppxFcvdPjualDtQq1QqXOdzqngFCGn31Fx
         lotDVMg2MTQ2YEZ0Bjxa8tmkM8lHjMHWCyYvo8oB5LfjfyptNWDLkG3kG9Bo2StfqK+U
         KJvxhArWF8KknYq+gQiAFL5CoMQufy/2dYCjSNR38zddKBEY+qcFf0hlxdenU/EWg9jM
         ggncwH6WCFfrur+dVN1rs7psUA4rPqkY8VSSWQj1L2MTJxuyHtiBAYy0EcUEsNF9+5Wp
         Bmldm8k0vlIdUuY785LnpTr3AF/PVKYOiUoKp286xmuv1/euLGFenj6K+ZkqLWHj83/S
         qZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739785998; x=1740390798;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPsuvIVCjk9dgW5qk+ZZy8wtpQYYoP8bQTH9T/Us5UE=;
        b=CJ2vA1SKJdepbu9/PWQ8kY+FtSoB59XxZKyPHjLgSIFSYGWbnTVIsSHyTGI6K5T31N
         SoL3DzjLDSCUeegqcwTFNj6A+6poIYvGdUr3Y1MgJZuPZrX+9Ay9DlirpOSL948ud4m6
         r1DCmkNE+A1+IOWaT3fGhXY6IhxCcP7FXZoNl9VHnkre3E5x23TasxPQMuP2PUC9RTz4
         sZz/N7L42mt3X7PFMBPHVSMdF15qaL6tDDQAjUgjSC5jQqc4YuTLLhWlThokRND8+4ox
         wfu/Iy9z/L9H/I7k+g4NMappCEtf29KqgRUtZ+YFPaSYTWjvUjOt4Rugg1sDHTyZ1w/f
         I6Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV9iZav/DLAz9ZMwJE0ZLRf4KUfj8rSfu40uC/hSgnmcxUEvJUuR1LhroXqMpQfvtp5awqH8MhRoDloJbgsr+4J@lists.infradead.org
X-Gm-Message-State: AOJu0YxAWX1iuVH5RpHKR8hxHF2B34yBGw4KZZcP2HxUB/qIQHwdjOBo
	6NEiVIhA8/PokcwusjEu2mYkGCnWC5E6OW3NfP4HNeehPFZUZ6PpP56NRPqikts=
X-Gm-Gg: ASbGncueijwIGRC2xDaUJyzeYaNMJ9PNklcJrb0ic+c/IMwCvdUwr/X0rUMB4nQ7IOD
	HcEcOZWWpQorrV9HoVl7RKbhzQ2Ofd4KNISdFzi7TyH5r602PO6IQ9xjPJUAEb9iDJHg19qhpjr
	Rmst8SkZvRm9tTfEq75rjqJtYENwCwchPyR03Rytt7u9xAsMXezs7++3VQvb6JUed2DG4xCZSrF
	j2tb185487XBybxN0AdgDmkDtHNfWpJnQ5AZJ5Q5UA6VhSnIvik3HtdvR0VfqMyQMfmPa87219k
	lLTXg7qt+4YOXdy/2dtkEDS1b6eiRaPjvg==
X-Google-Smtp-Source: AGHT+IEOYIa8ffLFYb2JZ8gSPjsLQ0t83+FYPxRHrdauemZg6o916N1LhDz8exoVJs4omLbErDeTDw==
X-Received: by 2002:a05:600c:3012:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-4398490d2b2mr22061025e9.4.1739785997586;
        Mon, 17 Feb 2025 01:53:17 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398a64febasm9743935e9.1.2025.02.17.01.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:53:17 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, detlev.casanova@collabora.com, 
 sebastian.reichel@collabora.com
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
Subject: Re: (subset) [PATCH RESEND v2 0/6] RK3576 OTP support
Message-Id: <173978599692.25901.15315285566342669137.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 09:53:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_015319_673822_0FB7E681 
X-CRM114-Status: UNSURE (   9.90  )
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


On Mon, 10 Feb 2025 23:45:04 +0100, Heiko Stuebner wrote:
> This enables OTP support in the nvmem driver for rk3576.
> 
> I expect to pick the clock patch (patch1) and the arm64-dts patch (patch6)
> myself, after the nvmem-driver and -binding patches have been applied
> (patches 2-5).
> 
> But kept them together for people wanting to try this series.
> 
> [...]

Applied, thanks!

[1/6] clk: rockchip: rk3576: define clk_otp_phy_g
      commit: 3e081aa132bbefe31ac95dd6dfc8d787ffa83d0b
[2/6] nvmem: rockchip-otp: Move read-offset into variant-data
      commit: 024e21343f3cbcde0343473fcaf094d2c19cc7bf
[3/6] dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
      commit: a1bf00100d06ad69286154a63e548ae6f6ce8539
[4/6] dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
      commit: 8c94337ebbfb840944574f82df0cbe35930d8df8
[5/6] nvmem: rockchip-otp: add rk3576 variant data
      commit: c5ebefe4e20d9fd99ae49cbfd1c18632cf338fa5

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


