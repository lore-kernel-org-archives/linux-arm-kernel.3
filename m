Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC564E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4iQzS388Vkl1dIKlXcv5oxRgFYPMQyIAJx0jAV1ZO8=; b=w1CQnZuOrPx4wX70OrdWRgqeOb
	s6xoKcMmYWaXkPh8gGKzs0TGAsCv817tVlJD0URIS/b1a/hbnJZJMxDm47deljPEnacJuSL6aWqrl
	YIGTTB9NkCKKprhn3UPK/wcer1HWx0ZssFKxtIA91AOOIHbeX2izYCGD7yjkwa+oa6C8uu+wRJ5eZ
	p37D+bjyAf0JEFEkdxvLxqtG1xcZGY+PXTrM0VXKCEH5tUr0+JqFcX488nadMBt7bxBXn98AdsOUG
	4IvZNxZRFaL3HnbOQ6a6I2uYWcczulCr65b0Iy3r2O9YRr2b74gSNEiHTxDsUTrP2wmp2R5p16wPM
	INV7OrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdRf-0000000Eehc-1A5x;
	Tue, 17 Dec 2024 19:41:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdO1-0000000Ee5t-0QPz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:37:42 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-725abf74334so5006465b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 11:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734464260; x=1735069060; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D4iQzS388Vkl1dIKlXcv5oxRgFYPMQyIAJx0jAV1ZO8=;
        b=FucxdOnLPC915ZZuGS1hJL41ELgLBWbWH/ZKuQvwxgTyhcapobpdtAa4WQx1H5h/Ku
         g0LFOTCAVPoJ8UtWPWDxXYk861g71ZtxtguIzI3SLx4au0DAqL0sBdImSgyf9jSTYqdD
         qCvAVUbPXInK0sPSsc2TKmyvhUUH2gyrrVZuciRoRp6QO17ecrhURxlhsbzjpkZ2fyPP
         Jea4nqz9R7glufvW51jOaWwKl6b3EbmL6KQSK3yL4gtK9JnVVGVSMmZRo/ehjH0NoWGj
         kpgXsdEwC7EZgCpkp7bTr55+s01RuuSmX1LnzuVq63SBMi1wHjcOvnnEpzTZZeMPv3cw
         cRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734464260; x=1735069060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4iQzS388Vkl1dIKlXcv5oxRgFYPMQyIAJx0jAV1ZO8=;
        b=KvA1jU9EuzxEBVmjRe4FWNqGcCgdio4iZPY7LS6KdLlc1nQUfNBvZwaAnGfYblhUn2
         upFN+RT/Fr+ranvjvIgK6mSsn0YwJvSoWS3Ao+Y9yB0+XeSysKjt/iSmOb8zGDF5zJkv
         TqCUakKZxvw6VEnceOoOtxZqnrtbRaHhylfPz/5gG0bweqYfNWCFLJZ9uu5fbz6ISeEh
         Fxtbf2XNnBjE/aVoNQmFC/oklyy/3zv1fAJTLBXUDGAv4vvM1xhIgsbPncoh6BdZNg8C
         CPKZJW/o2WeOPYauexzl7a37i4siIKTne9cvTPXP5V7VaXSvh8Ea7xN0ekCFgEeW7yBf
         5rqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOXlXAKPy899xSn9ZSBeAD+x1XcHVpzlFx8JVHkSg/RyIP2aAhLVzsDokTLKfv2vhK/mZugzoNtJD+7ZDLVg9d@lists.infradead.org
X-Gm-Message-State: AOJu0YyeScLmzbJCP0Ze3zJe2QdyWZxByT2vggGV7S0IhYfFdeBo9dKZ
	RiY6nl0mXSHFHCZVkXDxhggEmVjaWtG5qza1oR7VzM2ARYg5/5dElqvmmxecAw==
X-Gm-Gg: ASbGncvtklA4W3oJEvsdDvy69DuZp7B+C2I3phUXHJHNo3Ds/pvle28veH0dIFQWzM/
	3pgdtfpbKXWgLobhIJ92T4c7GZkG90+jDUhsl0tNPgadPpmQ7ZUwlsqLszAtfuxAdh/5kVhsJXU
	ViJdNC8Yr8roR2r6K5VERnAV6uEj2VY0Dsr0VVvLHIlTFooAOISk08hcgeZArtQFUXeC942MvPJ
	Ws8+HRtOJ7ZzlTYzSBa9rOb4Podh1Dyrw/5j9ihzDZ9ThcAKBKdmtHck1qyzGnZK2ikKCcIY4tY
	ecfgklKWIPb+2C2AiA05dtgH
X-Google-Smtp-Source: AGHT+IFSh0wcQB8WeGymgHrpQl9Zg51F0JJud967hTyCNd9GHB2YYAEXbnbHcgR+dP0LBD2AX4WQjA==
X-Received: by 2002:a05:6a00:114c:b0:725:f1ca:fd76 with SMTP id d2e1a72fcca58-72a8ce37eacmr389503b3a.0.1734464260229;
        Tue, 17 Dec 2024 11:37:40 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5ac872bsm6209895a12.32.2024.12.17.11.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 11:37:39 -0800 (PST)
Date: Tue, 17 Dec 2024 11:37:36 -0800
From: William McVicker <willmcvicker@google.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] mfd: syscon: Allow syscon nodes without a
 "syscon" compatible
Message-ID: <Z2HTAJmBeIUlWysh@google.com>
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
 <20241217-syscon-fixes-v2-3-4f56d750541d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-syscon-fixes-v2-3-4f56d750541d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_113741_137295_C8D75991 
X-CRM114-Status: GOOD (  20.02  )
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

On 12/17/2024, Rob Herring (Arm) wrote:
> of_syscon_register_regmap() was added for nodes which need a custom
> regmap setup. It's not really correct for those nodes to claim they are
> compatible with "syscon" as the default handling likely doesn't work in
> those cases. If device_node_get_regmap() happens to be called first,
> then of_syscon_register() will be called and an incorrect regmap will be
> created (barring some other error). That may lead to unknown results in
> the worst case. In the best case, of_syscon_register_regmap() will fail
> with -EEXIST. This problem remains unless these cases drop "syscon" (an
> ABI issue) or we exclude them using their specific compatible. ATM,
> there is only one user: "google,gs101-pmu"
> 
> There are also cases of adding "syscon" compatible to existing nodes
> after the fact in order to register the syscon. That presents a
> potential DT ABI problem. Instead, if there's a kernel change needing a
> syscon for a node, then it should be possible to allow the kernel to
> register a syscon without a DT change. That's only possible by using
> of_syscon_register_regmap() currently, but in the future we may want to
> support a match list for cases which don't need a custom regmap.
> 
> With this change, the lookup functions will succeed for any node
> registered by of_syscon_register_regmap() regardless of whether the node
> compatible contains "syscon".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

I verified this works on my Pixel 6. Thanks!

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

