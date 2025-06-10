Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53666C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuRj0Ug6ZJKS4fqR2KpE5gyA/o+babJBVnYG2DvTa+g=; b=cohqNM4MkkB3zLOTUgKR3/lbX/
	f5znZCGnsoR0SHwN+Ma1ZSzM88DKvJGQA2u0ZBhHf+GIEA7s8gRvqTIa024nh+efo1KQfPjEMAYXO
	1wPRAIDVxZuOaXagbh9z4kbKHtCyWE9+CtZewKiHLF29mc0pDBog2Qeq6ku+CopLMYUu73nV+3nMl
	Dbbv8AvC0LD5azqvYpaocACllskYOBbSeOHqx9bxoihFQvoI4pJzzCrkN5rbCBAwO6v0y2yx15vRl
	0UXvkdAItg4YR68WurgqEgwXvhqBZ3py2UFtKBTgL1sV3Swd4lz/Yv7IwJb1zLYMso6T3AO943paf
	tfF1TyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyq9-00000006vXX-1BSq;
	Tue, 10 Jun 2025 13:16:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxun-00000006kMF-3PeO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IuRj0Ug6ZJKS4fqR2KpE5gyA/o+babJBVnYG2DvTa+g=; b=PWrig18QduyT+Seiymmq9yhyUP
	pGEud3HrNK3HhfANSSMen8AJy5eTwVwDB7pBeNOrYLxFBbcJPNH3C8ZTCvWaSneUwNGqMVwtYNguj
	5XdVd8giHsQyUZ1da+QEkzlpo0o/y9gBbRvWwMKhLmf20JJY2YCYJkCU53J9vLJWn2ehSE9qLyZWy
	WVThD+Ay17mqNeqO43Ku1zLIbg7AnB1n76zT5S0i33lJWt11SHBrERhAz28GPN11L03Sdf8uHJvEU
	AOqhTti6ed3Vg0QT8R92rv4Zllzo1Df4HQv3lgdw0cnRWSa7Itz/hNo/Aciahz/Y5Gq/Lxg36gBk8
	t/Xmx81w==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxul-00000001nqm-3LdK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:17:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4508287895dso39330125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557833; x=1750162633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuRj0Ug6ZJKS4fqR2KpE5gyA/o+babJBVnYG2DvTa+g=;
        b=X97siPqpd36CNMSE2ARlDhOHfmrGBMK9uOWjlu34nMPa2A7F7/WGx0LwqdYGP3zyIK
         nVDVkhPi/UIFZN2XKvmxYy5LC4tJKkkthgLFpLQ7blv64bhCNBShrb3GWf2SDLlPXOQJ
         fzINNZ7tFp91VYjh5fVPdUz2CgIjacLIhIjP9hHPhTuh8KGIgtpUnGCtD0p/ICHpPvoq
         BmwmbSDaZeCxuILfyAm6c5HiSi4pN7eqN5mjATmRVGPY3+iq4dGcmdBewPiAUk3oKvpN
         QbAPQcgOTrOI51fpEceQgNPM+a4MMDEdksRBJeaKjecCpA7KhRCTZ53M6ce/mBiWpPLw
         q+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557833; x=1750162633;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuRj0Ug6ZJKS4fqR2KpE5gyA/o+babJBVnYG2DvTa+g=;
        b=M2xOuJ3L0AwjX0uIpBRpPHHC6OwW2ElMw/97CFo9VqfgQO9iCvALvz+GF0m2+JgA9g
         leR1Vtp8BQ/py4XkaapukyxrV/ssXVVi+WoxarPglxc6wzjtSSBXrXWVrjPf+y9Jil11
         xKM3QrJVdU9pnGuilU21PQDMvo7WvW7uIq+FDNsDsA6FpT5+qP+89QYFajoNXE3ZliKz
         37YgpXuQPUPYBxH5T3mX8w5ZaVucPl39gRyYwdkL+LpURBpmv6sIb8L21DOF7VdGBM2L
         O0fF8nv64qin2E7vaN4N8iowcSv8PSpn6/bwKTKxc4VSMFvXL3e9PDy3teSxe0rQKZ/D
         ukfg==
X-Gm-Message-State: AOJu0Yy1EfbpplPJPEp3isCmIPkN4WUn6vtAF5TOXdlcifZeRJNmGoQG
	Y7urRULowQwPrgh7AikbbBPelx+n9Kcy6hIUfWMvz9rxaqoVyXsJR52/BVgiqOPLb+U=
X-Gm-Gg: ASbGncvNYZMmIYtGDg1ogPM6qCDLyZipn+QSsEze9YiJFtUJV4N0bDAEJBRfDBD6Evt
	WTHCZMvjg7qlF4viOkkQqk9SBsVGIzvGaSm/z7i7wFRZt0H66marv+EEYiubm8QrqbbhwW81NEN
	dIe5TqjdmF/BGczmRzimZXLWK6noUUw7d2wmJmG3Rm0+i855+9eSC+3cqsa91AUm3tJI2AIBV2f
	b04EU6GOZvnqmo5F8TW5XpJzvPOc79TIZp/D/HIu/Z8Q9BrKhkwdvW/ikdepITTfmifOMXhD+0y
	DCd0qAC5GYAsAfBvq5V4TT9J2A4Jn5kqrnPrYVFBaHaQQ2eQM1GQ34slk/NVP8EU/Xncz0oW9xr
	0yhFuCuY=
X-Google-Smtp-Source: AGHT+IGZryHptsIAfWJgutrc/pv6q8jGoH1/bsVGr2feMOgq4/suOW7VZ43KFE9ciIcwtc866C4hEg==
X-Received: by 2002:a05:600c:5251:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-4531ce9f6d9mr27818275e9.7.1749557833268;
        Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:17:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
References: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] drm/meson: fix debug log statement when setting the
 HDMI clocks
Message-Id: <174955783271.1721274.13898926968868576990.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131715_904775_BB595470 
X-CRM114-Status: UNSURE (   8.57  )
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

Hi,

On Fri, 06 Jun 2025 22:37:29 +0200, Martin Blumenstingl wrote:
> The "phy" and "vclk" frequency labels were swapped, making it more
> difficult to debug driver errors. Swap the label order to make them
> match with the actual frequencies printed to correct this.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: fix debug log statement when setting the HDMI clocks
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d17e61ab63fb7747b340d6a66bf1408cd5c6562b

-- 
Neil


