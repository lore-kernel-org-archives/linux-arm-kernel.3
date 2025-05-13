Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01F6C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lr3Kw0x/yVyqdVwkR/x7lOZr5+jKaT8dfG2N3XLcaBU=; b=mVisPQhNYZ+Vw4MUAuY+gpQeZa
	NP0jd8JgoDiGwtMXyOoUaGvz6evXyytn7HPFobNA7fpKfkL1mD6ZYc3fyYPp/XgRK4rw57wYZjDqY
	PmXxubGUawmiZxGVN2dVKHV2/jMzy0G2fbuRXjg9SaVZlFGA4JyY+Hsc+3vmGAtgdq1uKpTuvDMfD
	HPh0pFqsh/fBPmnj0a/j3tgz2VePqkl8j3DQqpLHHUW5zHeG/NOkJKw0jl1ZxDF1YsNGpol5sGeBJ
	+LqcTaTCPY3MswMTrXqB0tBK2vK7wsBlNR02kHBC/47C9ojryuYJN3Fzr1TIPH+DJPXq40AHMSfys
	WwAQ6iTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEt4t-0000000D1hO-47el;
	Tue, 13 May 2025 17:06:03 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsqw-0000000CzoL-436q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:51:40 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5fd32c133ccso3969327a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747155097; x=1747759897; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lr3Kw0x/yVyqdVwkR/x7lOZr5+jKaT8dfG2N3XLcaBU=;
        b=eP0IhcLpbzKAEjpn/Y6hwLH6aaS+AknhYzzqp40ZwwIhvJt95q1XnFTZSnCsB2ATWc
         gQDXJopJ1sBUE80y8J35/kqUDYfAN/BEVEdz6g2BX9ctl8Y1Tggfyk1tfCkCGvqjMZKp
         Nq509snXgyaBKWE3BhG04iji6on1OmUcxZSp1r8YkiOXdaakctU0gGAzMUXL3Ru4qWag
         QrzYasfbPOTt9Balj3KQPUcM1BjTZrgHJjJjDGdCAKHPZoZAkdRKM9fwlbqH3ilmQlPY
         beLbC7mToVLqyZSE1CesydRYXtNzEMXYStrnk62+MUZzeCDfWKhjg3ejPt6KirSSyjV0
         Q7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747155097; x=1747759897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lr3Kw0x/yVyqdVwkR/x7lOZr5+jKaT8dfG2N3XLcaBU=;
        b=szXD0FlRk8Bcmsn81j+CeP2m+DlJ0ohELr/+q584sPJn11V+pSTdTQH7FJk0uV4UBi
         27du9Aq4UgkfvP5P4QMxHHvshvjT3chmGZox5YOpvusrcM1+GX9FXAvP5rExzceRu9PO
         V9lmp4y64HJ2qDVfIUirjaP8scSZdVU1NpZ3q6zJJC+L/9lVXGzRM5WHxVSWr7aDDHnN
         F1oTnp8XRZnh2/pXjmtEQzZZ5sNKC9W7rFEXHpFAd4lB3+LO72pGCECnA9Bh4bku9yPW
         s5lFpKDoZVasxxVJmoSz6h9AyaMDE0fMsPoxhKa0e3ZMuqY+Z125oBxKzuP4XvAbHIjd
         yxug==
X-Forwarded-Encrypted: i=1; AJvYcCUz+WSoGhZfcV0oJpkiycC/Jp9fDEHAG/2YP3boabL/4NWIdXf70W9kfdxwUvCxNeJqaURJTrKn14wbWYX5ItSj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8RmSNyEjhZslI2teK5XMfNJ7idFJSLm3XDtrLccYTShm6KUjn
	jvcrwLHbGzWT9q55c73ZKoIW8k8uLNZknWfogFtDrWHrt0k35GqE
X-Gm-Gg: ASbGncuzOjPmLo8nEfYSb89w9WYI3+W8bK+Uy9M3ibFA9LQJNdORHdVAsrylT+/KlFV
	fCQy8dA8XPnQz9BvxzsIu3LgNgRl8GcYW30gDu+Sq5SeY6atWa6LdHeMz4fgd3laxMs643L0yeH
	AIA+RbddvcZqqcqTfbM4HWixtYKKc078f2A5oUgItr8GPz1ZJduu/DGZzSHIN7ohCMtSg0mKRBk
	7VLpk45BZVN3wquiotN/EnFPSu9QAu2oP5FNYieEF3w4dCP/S0IBpkIHjYnS44Wdbjx1cX0jU6f
	AeudxK0c27IB1gs+QT2R89MhHuC80cD7K20aGV2Bfy6QTlIT8sxpffgETe2HjvCODyR1oEiBtgx
	HMswbku5f+C7HbC7LkKMykapNHfc=
X-Google-Smtp-Source: AGHT+IH/7zg5Sc/5uwXax+BSgnLw8VJOscMNR0Z0aL72Y51/8y3j+/YyqVwH9Ycv88UhttHDrWRLxg==
X-Received: by 2002:a05:6402:1e92:b0:5fd:2e33:fa49 with SMTP id 4fb4d7f45d1cf-5fd2e433eacmr9014481a12.6.1747155096747;
        Tue, 13 May 2025 09:51:36 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc3f5dasm7449795a12.31.2025.05.13.09.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 09:51:36 -0700 (PDT)
Message-ID: <aefa5ed3-1085-4e88-b3ec-4cf9958e7e2a@gmail.com>
Date: Tue, 13 May 2025 18:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
Content-Language: hu
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
 <CACRpkdbqPLaBheEv1=ky1gUJ-qSsPRjR0J-UXEuhXf2Oix_EzQ@mail.gmail.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <CACRpkdbqPLaBheEv1=ky1gUJ-qSsPRjR0J-UXEuhXf2Oix_EzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_095139_005736_E3F68485 
X-CRM114-Status: GOOD (  14.68  )
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

2025. 05. 13. 15:36 keltezéssel, Linus Walleij írta:
> On Mon, May 12, 2025 at 11:33 PM Andrew Lunn <andrew@lunn.ch> wrote:
>> On Mon, May 12, 2025 at 04:22:36PM +0200, Gabor Juhos wrote:
>>> The series contains several small patches to fix various
>>> issues in the pinctrl driver for Armada 3700.
>>
>> I'm not sure all these should be for stable. Some are clear bugs, but
>> not propagating the errors has not bothered anybody so far, a
>> requirement for stable.
> 
> So we are at -rc6 so I'm not sending these as fixes to Torvalds
> right now unless they are super-critical.
> 
> I will merge this for v6.16 (-rc1) and then the stable maintainers
> will have to decide from the point it enters mainline.
> 
> Gabor: can you look over the tags? Once you have decided
> on stable/non-stable tags I will merge the series.

Sure, I will send a v2. Just a question, shall I also remove the 'Fixes' tags
along with the 'stable' ones? If I keep those, they might land up in stable
trees anyway.

Regards,
Gabor


