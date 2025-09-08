Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC97CAC588
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEz+Em4KcFOihPHl7+oJJANOhPUPqUcx/sA2JXEHLYw=; b=ylSCmKmiuXIdSvHtZcBlfJDYUK
	Ytps+o3k5/i1FZnDudlhe60BIhZW7OF2lk+Hmj1pjsYxf58jaH5Wl8AdpancEiB3r0hSvLDQzPa4w
	tFNntISWdBXyELPlpRi78oqLOMhqT9u3RaG22+pqxjKuvatS2pbdl08jnJ52p1O02J+3ItZrTPAF0
	mZ76Vsff4BaJTAcKOEPT/FZ6LvyIQSDMYkuGgVb4dzWdWSE6NefW7Ru0CY08jTbZbjyYNNSMNQYh/
	ScZeD/CnO9vERpyCVpkCrSH1jcMKYro4FVYcgaAkcoP6u0OlvdOgrsli2AK3TfDb5VLmI2SIT+SXs
	K0LoTYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacH-0000000GrE2-1abr;
	Mon, 08 Sep 2025 12:05:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYpT-0000000GHfO-3ERH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:10:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso20577815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757326230; x=1757931030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nEz+Em4KcFOihPHl7+oJJANOhPUPqUcx/sA2JXEHLYw=;
        b=hhav00Lj5HQfKddQWgaonjoOqmj40Vy2vPYM3E6D7Ico1+woGxibHcYXYVPCem9fla
         QytVfwrOpg8hpBjLPespr8JEiyqLyaafYJ98xKHslETWOzum6zotiD5R9LXwxLeIqXTm
         u1/xaLhptglroLVJXPrUVsKNfDiIoiq9MOKQ+txtdq0TAFWJDEF5XAsQ/lXWqIz/lhk9
         ihxnevgP0WE0QBc2fuHkn9mDZFlD14SPp6qchzHrY+Fjzz1EGXvnyWfcgxUaRB+1X2DT
         IX73WNN4QEGW18rvHU6PJ3NtpJGAIDSmtIy0so7fc3MBwLcKLCdbCrGtbEgr6F6AkYtS
         vKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757326230; x=1757931030;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEz+Em4KcFOihPHl7+oJJANOhPUPqUcx/sA2JXEHLYw=;
        b=BN1LeWInhWFbVC+pXn6M4iPXdmZ2GZo5TrWvGqBF+vuOjco8zDcXJ/jC0PWSBenZUB
         nHdO0RYP+yj6OGTwK358e7GEgJHzxE+PxiU7mX6J1jHkDjn4KXP1Td3/zF9PF3qQ8aJg
         6fLnpaly64MzvlsQHFBO+cP9xNHrBT/TqgNyOThMADj3U6YPpD4aM3UBzFIdO5Yg20iu
         T/LtCb3FH/te6w9iSD7oXOF90hZ7mpj6DayapgGgljrzqMY3jl0y68QDpePbXbmmW/j9
         Q0ycj7PR96pY0Hl/I6bCNWL14DTAdbFWki1omwVvgxYNmCO/jmyKpOmmKtI75bnpFTXd
         E88Q==
X-Forwarded-Encrypted: i=1; AJvYcCUz3k3thHa5Oe+GUbo8Ti1DACg0X9jlfHynVvSt4oE/TUfkVHGaQR7yAdJJ4LiyFGGwpvKwXK/ULh5o9+3CYAhB@lists.infradead.org
X-Gm-Message-State: AOJu0YwziaH6xmYsT3BzaOtEb034VyX92kVSJMpV0uBvvfXi/rgG276G
	GUhS4HvTgCBxsNnESyvzYLa5IXshmKezXH2Huq9WEid5GxsxoPPvHRUD61m74NLsOck=
X-Gm-Gg: ASbGnct3MNGz3yldLAGf23XaOZfa5GI7ZpJ1iiesoVRtVf0rWb8hLVxXaRgUeXMawOv
	Dlnt55aLT0V80VuKpQhg9/qfEhHFnNm95b6P9hVvCyGmkSBrR0GyiKyOu2fVpvx6QYxS6eseKUF
	QaG4sq+XdI/j2ARRLR/927ocuavcm93O3We8XsV4XMT3cw/9n1RmeVPg33bNJQECbD04MkOtLqI
	/pNYboUufj+7/fC+D3EkcSlzT06N2gjFeWLhkRSalF+JGSGdE7kW2QEQh1OHnnSc7B05h02m54w
	VsYxPsYjCnqtyYrGvzbKyMgPlBpWEc69CTZ1dmXGP7NVzP55Q+IMXJ2HX8zd6BTWul32pjq8bx/
	1YRfj4K/ecRkPs6diYTF9COkr
X-Google-Smtp-Source: AGHT+IEXq7zsbLWoeBLVjjDgNCg06cJkPK+gGZDWWxQKZCTOtFGDmBRwiKg70/ycWnZxMXLglLDO8Q==
X-Received: by 2002:a05:600c:1c0d:b0:45b:9961:9c01 with SMTP id 5b1f17b1804b1-45ddde832ebmr76690925e9.16.1757326229742;
        Mon, 08 Sep 2025 03:10:29 -0700 (PDT)
Received: from gmail.com ([147.161.145.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e50e30asm439408275e9.24.2025.09.08.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:10:29 -0700 (PDT)
From: hariconscious@gmail.com
To: corbet@lwn.net
Cc: catalin.marinas@arm.com,
	hariconscious@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	will@kernel.org
Subject: Re: [PATCH] documentation/arm64 : kdump fixed typo errors
Date: Mon,  8 Sep 2025 15:39:01 +0530
Message-ID: <871pp8a9ze.fsf@trenco.lwn.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250816120731.24508-1-hariconscious@gmail.com>
References: <20250816120731.24508-1-hariconscious@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_031031_800727_A73E7B53 
X-CRM114-Status: GOOD (  17.01  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Message-ID: <20250908100901.S6OfbdZDM---Hza2K4csn9fb49aOm_4beg7we04gPF4@z>

hariconscious@gmail.com writes:

> From: HariKrishna <hariconscious@gmail.com>
>
> kdump.rst documentation typos corrected
>
> Signed-off-by: HariKrishna <hariconscious@gmail.com>
> ---
>  Documentation/arch/arm64/kdump.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/arch/arm64/kdump.rst b/Documentation/arch/arm64/kdump.rst
> index 56a89f45df28..d3195a93a066 100644
> --- a/Documentation/arch/arm64/kdump.rst
> +++ b/Documentation/arch/arm64/kdump.rst
> @@ -5,7 +5,7 @@ crashkernel memory reservation on arm64
>  Author: Baoquan He <bhe@redhat.com>
>  
>  Kdump mechanism is used to capture a corrupted kernel vmcore so that
> -it can be subsequently analyzed. In order to do this, a preliminarily
> +it can be subsequently analyzed. In order to do this, a preliminary
>  reserved memory is needed to pre-load the kdump kernel and boot such
>  kernel if corruption happens.

I don't think this is right.  While reserving judgment on
"preliminarily" as a word, the intended use is adverbial, so this change
does not make things better.  The better fix, perhaps, is to say
"previously" instead.

Should you choose to resubmit this, we'll need your real name in the
Signed-off-by tag, please.

Thanks,

jon

Hi Jon,

Good day.
Thanks for the suggestion, will correct and send the patch again.
And my real name is "HariKrishna" and see that it is mentioned in Signed-off-by tag.
Do I need to add surname as well ? Please let me know.

Thank you.
HariKrishna.


