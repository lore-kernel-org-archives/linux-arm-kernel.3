Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71365C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G++E0BbS8a2hLlYRQNjKfQSgLliGyf9HwygxEobBzkw=; b=AiXNFQmifXlqfSfgvktTi80X8a
	eYY/LGWvOQ/MWIcn9D+fFJSNUV4ggyRXg659AWvMAMdjIfcZ3mF2peHKA4uavobm6MIvAfof3d8fP
	iy3HEf5CaNRjS+LL3M6Jll2+I8LJOtCveXPdfkTQtDJHNjFVsfObn4aihYpzEFlJYWFXKSgGOcQIE
	xxwHRSfP7CjTzxuk2Jhve/7QHkvoJXgu2jh3KKIO6pBSyQHNqJvAyhhYM8vU61GftIBpJ/UKiKzJn
	XBybA0wak2A3HOca2UHSjL6P6VTt2A10lBhbBel3f0bGMMTtz09gj8y34H7Ft1n0j/NMtKyYjhF7F
	CZv1WtWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eUv-0000000BTxO-2Y6m;
	Wed, 23 Apr 2025 18:07:01 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ctl-0000000B7Iw-3CoQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 16:24:34 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6ff37565154so909457b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745425472; x=1746030272; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G++E0BbS8a2hLlYRQNjKfQSgLliGyf9HwygxEobBzkw=;
        b=PlBiwG/ChM/T4+SX4+cRtXPQiM2PKJgKiBZ7f0GroXompErzHkcQUmLHFvVtNWk7Rs
         ow94J6SFmxALjfRHVDck1BYumtuIt/wIhgJ0gOtkSlqCgNr9D5Np1oe04fQ5mj43b+Hk
         tYLWCmPSUslZYTTzRppDfOyzxUAwD2EMpeUJ4kVAPLmpIxfsINbd9t49ZCwMmPWJucBe
         qRiGX2GXf7Y0xtCl9wZFpAvfeP3rrM0e7W5kiWl3L9xpubTJDXb6Vv76u6MlO5zBrpSV
         4PfIObKUt1yz77uEA1VNX+lC9Tu6F6ZnSI9nH/Cz7zkmouG3eWzLx+MbNbnS9gikHC4c
         xFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425472; x=1746030272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G++E0BbS8a2hLlYRQNjKfQSgLliGyf9HwygxEobBzkw=;
        b=dqm7hPnozEsvZ/o4SRqgX0kMRUzQImGR9q03WZwlqflGrQEbfmxE4EP/b9HeqQtfpl
         8dsvqMcot0+nxDGViL1xA40qWpVNDbR5yoQy32rmSdsWCvaL+NxndFg1BbcXDqnqpXej
         xC2orBZcRPs+KACfs4e+bjouqnExXdly8aulXq6OKHv9kfKx57qopkWcN5OIwQbJlb+S
         vSGN55RRT46KMO07mQZu9P/LHL5AEf9D2xCr0DiEZw73bCUEpo6ZrF3KVGmZeutNMtdE
         5Gy4YGrzaDXP3mzHoiDwecjVPnZxhrIb1IOVmeiBS61NbLQFWTUKOJpg3/8YM2806jKC
         18JA==
X-Forwarded-Encrypted: i=1; AJvYcCVTYNqo+/qFvcm/5estRF4jWCYJ20V/IL5GET7xYAecmW1zfCfIfoJDYFwCX9eim+4+/+kLHwqBnXHEwJYZfOqi@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqm4uqcsffBJ7A75f61+9Pp4zj8CmGCOM1n6/774o/EtvtYy8k
	4IQPDU3foPcZyI8PVzsd86o7inp7bYkMDEp5sQi7PcIG/c3TVFWEI8SJKxgagIId/0KzYPMhUkZ
	zE9KXOQF3Bdz4m+bU/UtNBCapSqQ=
X-Gm-Gg: ASbGncudRAcqPdim5P8A9gKETxCUByEAL5oB5nM4wIaeFURBMI9DkMVYkyqZtJ319Gd
	D7YODLYrjhvsuVr6iPlhFjBvR5QRikgkXOffK/J5V2rsnLM+lxNdJXanSH9VDm2YQROLbWqO/Fb
	/wlIbezBzOYT8C6Sua/5PnO5QcwVG9hk2hcg==
X-Google-Smtp-Source: AGHT+IHs7VB0iY6Hw7N5rvnV+mLaMrJKNgLLnkV8ud2KiERF243U4X7v8mCrDhf5Lox17WfhwqI4Z2HUJBZfiX1i/DE=
X-Received: by 2002:a05:690c:370a:b0:702:72e5:793f with SMTP id
 00721157ae682-7083c566db4mr2968467b3.23.1745425471982; Wed, 23 Apr 2025
 09:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com> <20250422133619.GA1095169-robh@kernel.org>
 <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
 <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com> <CAL_JsqKwASbUtpO=wU-16v=y8S_wLyBxnFUmQqsE8GkzCz0hDg@mail.gmail.com>
 <aAkLY3TYIPG7ojwx@blossom>
In-Reply-To: <aAkLY3TYIPG7ojwx@blossom>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 23 Apr 2025 18:24:21 +0200
X-Gm-Features: ATxdqUG6yRu6Z589SiaPf7hPYu4E07bIBQRBOixmyYz2zFeCy4cnqCijifN7bws
Message-ID: <CAMT+MTREnfB2MH=i84ZPa0LvgdYz6a+aRs+Nb07Ck10y3wstmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Rob Herring <robh@kernel.org>, Nick Chan <towinchenmi@gmail.com>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_092433_803160_038A171E 
X-CRM114-Status: UNSURE (   9.62  )
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

On Wed, 23 Apr 2025 at 17:46, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> It sounds like the path of least resistance here is then:
>
> 1. rename the bindings to be apple m1+ (at least for now)
> 2. keep the driver as-is (no mfd, etc - at least for now)
> 3. land just that (at least for now)
>
> Evolving the driver to share with not-Apple, or evolving the
> bindings+driver to share with pre-M1, can happen in future series
> if/when somebody wants to do that work.

That is precisely my plan for v3, which I intend to send soon-ish.

