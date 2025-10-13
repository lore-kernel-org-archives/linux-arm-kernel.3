Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC18CCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49r4OZCVCJl4F6bzchFunKqMZbc/Igv48ydqq7l5uCU=; b=AZtDraeSDd+ByGBGjYEP1NgQ9/
	Ul6u9Mt/aFiZjC6hFG1AIZXE786LBjBE42Jzg0ADNcbIg2JiEy/PljMKs8H79DStIYFfmd30EN9Yo
	IncNdGU82XVxjY5yL9ArpNidhialQT0tz8ttSq1zp9Iw5pn8FHmSTrnHPhKDtFx9VRdvqZm+kRmox
	LchIkzOxyRpixhSShcB9arQ8TZxc1QxGKnUprAkQZpnOUwma0OZ4Yd3X679NqxxXQXvV2a00P2XZ2
	8gj/1mR4tc4pT/KB6vPhHriC1Lyw7PQg8NrWKEwINyB4M+DYm2O47SzxHBSUzeKof5CRfpe4QqLNP
	M8VhsEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86xP-0000000C1Br-0qGJ;
	Mon, 13 Oct 2025 01:02:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86xN-0000000C194-02UC
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 01:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=49r4OZCVCJl4F6bzchFunKqMZbc/Igv48ydqq7l5uCU=; b=Ikrm6Xoa84GeGv+vL+4MJQgwxh
	saXEVicYMj5vjrefoF1HXiQDZNRvwr+JGaSQiL4e65kpTfHzG3A5xD2uUJtezggKp/wUTNSrDrJlF
	4RxwuapGYDOS+mdxIMbpD2l5XiR0fsW2/J9h9tvoxfa6/tRItZV/avnTC83cUO7lgZxWzPW790bM3
	xdEesg9Fwjun/lHanJGmBhJEPF6dKfIXN9EdJ47UQPYPWXmjcXLSbn+cmjvvCfJ8J6tx57oLUtQD+
	lo/I0kAR6ABT753fueoqjCk8AVSrUs75ZF02xjGp4Wt1yzUQWANnsw4qGNlUO7F6HwVGAa9cfPkr/
	I4Iktc3g==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86x9-00000003yIa-1raR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:02:27 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-78afd21cfd4so193361b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317337; x=1760922137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49r4OZCVCJl4F6bzchFunKqMZbc/Igv48ydqq7l5uCU=;
        b=AJQYai8G6at1/VcYqC5WSqeL7kNJIa5tifi6sW9wCO0QVxMve3Fw3NlsXSBELgfx+Y
         uABu3YbMOojwK8JjO1CiDmHAIyzD5ASWk4+ohEm1bh2tPjpC1SZI50OsZS8cJJYRRLtB
         q/LRoBBTeDPXpIjxOV2U3kBEw0FIkjciK+UuVhOc0RwKpmml1OCe5ltv4Fz3x141MKFn
         zaO4oFBO/ffaFsRL80h6bKV6vLfy6N5JUuQwFKuFRUpCEhlABMMtcgubb1DJgmgTaXN7
         GjHHTzYshU/CU2ixhYJ0NLIwF5gwcs+tWpAwuM382wxe0MdWeRNfPlUNDN0fk/joXgXj
         2wPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317337; x=1760922137;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49r4OZCVCJl4F6bzchFunKqMZbc/Igv48ydqq7l5uCU=;
        b=P7HiUpFhzN2lZ6B2KU97wt3L69ov3aRJkqosHBWEeCYcSB6y61HQ80v656RlVvxQGu
         D1UIWsShyC3+I6knfgA3RaTSjH/N+XSfKHG4qpbZskM22v7ves+7fI4Lq1s2c5DnZ6gs
         199RbjXEmbc/YAr7FO2LDp2P2Q7PLYPXTst0o/jr80nG/XvBjjw5KoVxjB18+tn7W0Ok
         gVvlsZF+sRpXjwHLWBQ4efyLzesi1cQDFvd5LJ04oGnXAl3+/jKk5HizpLLFTYm97kN1
         iJ/kOh+VTEon2586b3gqDIhMXYpr0CU7UgrQyh1izs2/vxvMu+fiyPargSrx6g7o5cAe
         4z6g==
X-Forwarded-Encrypted: i=1; AJvYcCUmnj41Q+1hvhGNIrKVypg78fY9RuAZsisb5Cpfk7HkuI1oCc2sdhIL1JZ49snb5hlOz1tdlhdfClXi8GfrXDEo@lists.infradead.org
X-Gm-Message-State: AOJu0YykVWm89OVBEr/5g43hlS/41gGOR2tRtYGJIRn5phrNZMFoyJbF
	WSFsGB5QXHBo+ogPNDtR2y9F9hPze9fq9OChvz9VY9x/T7UFR8LcceSne8B/fzMzIzw=
X-Gm-Gg: ASbGncsPWBLJMUFVGFLXm+hLUDz0s0xDb17NPFJ1ObiFNVkhFmjTZfdAPYsKkPILjUE
	zEYCvdekhsmnogABUT74qxTUx/XGZkm3nn0m2CcHzhclks3GtXYLpJ/U/UmYveBP6LmHl1dqvK8
	QKCCotKZKLrFB62EE/TWjl8qAxsP1oYZcGg46v+HUSLUV7grV3Z6ukqyEzTnNsHsMEeTC5sl7u8
	pP2mG9YjB/Xvn4dydta+v3zGYzthYCdBgLmWQomI03x42YSEfGz1rk5YFwu3VJy8vOpZXmIhFV5
	37PtpzfF1TUikZXq2u0XVs17PjCVOeFppcGEPnuArF9yx60dBraK3jE2EgHCFk2eIi9+YlD0TyM
	4T+pK1PI/OW3cNWME1v/jER46Ox6Fp0TblV0C2m6Na5v96sKvbsRJ2VQeP9nDWGXRD+fJi8k=
X-Google-Smtp-Source: AGHT+IHdWvsayO7maue0By4WbQhYlT572j0j+2mQ7G3lnuobyyblOpI7dDXgWIwyUScRYBarFk896A==
X-Received: by 2002:a05:6a00:a589:b0:781:21db:4e06 with SMTP id d2e1a72fcca58-79382794da2mr11782142b3a.0.1760317336612;
        Sun, 12 Oct 2025 18:02:16 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
References: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
Subject: Re: [PATCH 0/2] soc: samsung: Add chipid support for Exynos9610
Message-Id: <176031733307.32330.8934958583314860754.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:02:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_020220_764798_6BE05A8E 
X-CRM114-Status: UNSURE (   7.13  )
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


On Sun, 14 Sep 2025 19:50:18 +0000, Alexandru Chimac wrote:
> This patchset enables support for chipid on Exynos9610.
> 
> 

Applied, thanks!

[1/2] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos9610 compatible
      https://git.kernel.org/krzk/linux/c/944d40232eb4281aa8b56ea5389a8fe83b7c7074
[2/2] soc: samsung: exynos-chipid: Add exynos9610 SoC support
      https://git.kernel.org/krzk/linux/c/fe31e894c284012f11a841dd2346fd99bce4a001

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


