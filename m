Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF00CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCkZb6qonleX8R/f+hgTPmeir/ympFYBeTfUCEgU1Tk=; b=PsMSNVZseiPLs0fQ1JhNzvu5Kc
	QOyORkjbjWYVjI3aRv79Fj2Fo5gL26MxhNQj/XTZq7exQOsHYLzos/HqbW9gP55TDX9XzSwB7/Y8N
	jReujCl7HfjT72ETXjQxcmKJT/RF2VE/DOB33nFRPPvGCTPr5bvnB54IXyZ2RgXk+fk50dlVw4XIf
	a7W0CjqgPOb821XfUy/nd7j6qjoedKGQUHQhxq+cE3FJbapPowLYiwD7WDUqup8OGvvrsBHrQ5YrS
	tj+Q9bgWeQqhqvgzzpvQABOeO6S5AWywp2X5eBJdVnZHiYWCD+fmd0iA+FwcpnYNOgTDLy39IP8cL
	DSX9NgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sc7-0000000CkBY-16vU;
	Thu, 25 Sep 2025 20:30:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sc5-0000000Ck9L-0LTx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 20:30:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e3af7889fso1386635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758832247; x=1759437047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCkZb6qonleX8R/f+hgTPmeir/ympFYBeTfUCEgU1Tk=;
        b=lpj82SKaAccua2kjp10amxO2SyjRGyNYXV1hWFAq72j+Efu0CW2aFCTz7J6DlKEJv8
         b5BaG7WaZseBqKzg+MFJeavjqz8d0sMAWkWzOsOdGZNTcBkYpCuRm64ojEQkbvtoIPsh
         8Sa1Ok1CzpRN021STBT/0DzBFKdnhHDbzTat+HNQZTqiYWtDOHzYZM2fFsEp/cXyhlq0
         lYaLK3PTRDdDTdapzocNsY18BSbNbutj4Oe60AbWZYzTnAnNCUV7hQGbHTA9cvvm2qH5
         MBVhA7nS/AqS2DZGR7FS9zlTPCX7BHtfWY6hQUh1i6M3Qv/Anht2RMbzru4wBkSDF57z
         lIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758832247; x=1759437047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCkZb6qonleX8R/f+hgTPmeir/ympFYBeTfUCEgU1Tk=;
        b=G9ClHe7YHzYUl4kdiuPtsPpQTMfsShVBRnSKknRsAYcqJ3vEpULxSjI8b8Q0229W/O
         9gXrVZVDFbfy5jAZuTzIDblngH9vnpBmHRFzd/Nm8ZGPF7zzg0uhcDFlXQLeOplzxQYc
         6lZLVY9r/asaDL4uVndkYhy4p/ivCF2DcjYsWTvMlHNBrTCa4RZXAaOUV+5LeU/7Gj6Q
         gKGCziA1th5W01y1RH/p9ELXbTfDcHXlAl5PTyLlVSkiSqEoEQy4yCsl/tjLQjIB3oXr
         0pfnYu3UGbXbWEnvaCQXW4yaGKne39Wijo0Bdjk6ibi4LPrYOyYDe99AarlKyIbPMKFq
         L/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqYWlGMhqbgoL6dzYP54/8Zlz85dwQRzGSd4R6n9Ly/52ACQDc+TYIqCMzNtkUNPiXNVW27XmYBXQU3t6UuPKU@lists.infradead.org
X-Gm-Message-State: AOJu0YwTuMipYGY9j+jh2ZCxOFuvvogNDyUscgCfOqoVNK5urrY2YKZW
	oe8NZuZgSk4xPLEGflK5kQaMd9aD1nNr/eABluvj9C9OuE0ix6J+XfIW9ghau0H67Sk=
X-Gm-Gg: ASbGncuZpRQljz+o1EV5WP1K+fw60RFqQih2cHxFDeeKkuynP/TeT0YNv0u22EA3tCS
	sOWW5Uofxgc2cBgEsq74FLawi2oOITBDKgpMazMz8NbbO1bmYC07+TBphjWaLJfymySicxliFOB
	JAbzvINqqyKaa2/2dprGpBQYAmB4+G90U5lW9NGpMxiOUtV/emlZv7qRHQGujFdnmpCbiOXQbNK
	db3N7dfs1cfEhRf37aU4y8lGrqrLEeyFepmk2U/wRSKO9quR2GUqBQpt2aCyRUsr3VS/K5SsGLJ
	U+PA2q2cPQEDSZcDi5HUreWqUylHQVyYBp1Nh4ByO2na9hDwdS6/lidOtcLceLH5UEa5SF0Hxmt
	OUZXuKmcTnvk38KlsOVv+DRtVcy4SNXbWcPp//TVh
X-Google-Smtp-Source: AGHT+IF7tg4RCzm9amlg/Gw/9ESY2ELu0mfn9+u3GRg5rzK8YPUdHN3cvSLydE0mJdxjQiAumcfhYA==
X-Received: by 2002:a05:6000:25c3:b0:3ec:6259:5096 with SMTP id ffacd0b85a97d-40e45b8770fmr4070695f8f.21.1758832246817;
        Thu, 25 Sep 2025 13:30:46 -0700 (PDT)
Received: from radijator.localnet ([93.140.105.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc82f2ff6sm4137336f8f.56.2025.09.25.13.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:30:46 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] PXA1908 DT changes for 6.18
Date: Thu, 25 Sep 2025 22:30:44 +0200
Message-ID: <2398680.ElGaqSPkdT@radijator>
In-Reply-To: <c0516d21-16c4-4101-9d9f-a679f7459ef5@app.fastmail.com>
References: <4685744.LvFx2qVVIh@radijator>
 <c0516d21-16c4-4101-9d9f-a679f7459ef5@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_133049_132049_EAC19EA9 
X-CRM114-Status: GOOD (  10.85  )
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

Hi Arnd,

On Wednesday, 24 September 2025 23:41:17 Central European Summer Time Arnd 
Bergmann wrote:
> If you can send an updated pull request based on -rc1, I'll
> try to do find the time to merge that, otherwise please
> rebase on 6.18-rc1 once that is out.

I don't want to rush anything, I'd rather wait until after the v6.18 merge 
window then unless the merge itself is very trivial.

My only question then would be whether I could still target v6.18 or would 
that postpone the series for v6.19? I don't really mind the latter, I'd just 
like to know.

Regards,
--
Duje



