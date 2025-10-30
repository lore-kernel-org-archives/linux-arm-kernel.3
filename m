Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74507CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiJKIWzvTq177G5Z1HqBbhq6LXsLpoXZ8DAbP1RW7sI=; b=tAfSo1u2picjgktYhS06EXLsHI
	1MGs87y3k7XWgDyutT2pxmJzuyy8JILv/XwEt2zczSnxzAEskehAV357mKrDjZtIkq9OwSbkGrg6F
	DeaxBt90DWQ/Er6vm/7BPpY2kUDVEu6ERJviup7epzkX+d/L+qCBPT+/4xufvC6uLi+2iLxfi5dnU
	jZdu1Bz79DpfMDKq5vygfNUOvg8z2OyYpbXYkNhpDROkUpE3RDJSdpxDfFwZbUb777x0Y436d9p2L
	ZcdlZ8u/au6cddAXHGJSSl2LZ4izvoirHGDkjfIXSGj+gqnAlBWV388hq5IZBGpLw/9u2FPLCtgf9
	Te26DWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOmP-00000003pjz-2dhh;
	Thu, 30 Oct 2025 09:17:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOmN-00000003pj9-0gAn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:17:12 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-290a33bfea6so850315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761815829; x=1762420629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiJKIWzvTq177G5Z1HqBbhq6LXsLpoXZ8DAbP1RW7sI=;
        b=A57iX3Oj3XByd1yT0s/wWH/i/XpYGs0dw6vg4tKhbpN5YvEfkwyzotmGO0euy3Hpai
         Wao3n6sSrKEMCxuNHvWDxYfeDwKAefUfPLnDjvltI2k1MpPJs9S2BQg+HwVa98mxahtR
         uFlhItCHUl9jZ3vfYvePHgKTMDPqFiBhNOJj9nZ4QqczK5ajLpQsDiieatSzLmTPXt1D
         BGLjWChwBU/1bh3yqXhOvuZ5m/aqQZTaAxuGLpzE+vh6QWcjs5MLruJG6Ju1ZQo6JzPJ
         6l/UfAZocI+9Od+LnrAXTHDIgyCyUK16CbWWlmWcqz41fqkNlk6NQgz/Fsib/0P6dSAd
         fGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761815829; x=1762420629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiJKIWzvTq177G5Z1HqBbhq6LXsLpoXZ8DAbP1RW7sI=;
        b=XZIB8jC4aLn7W/J0DeTsvurnjXL8vOCK8HfGB/enhXWbW+3xsZoMsjz0u3fRMS14pV
         Q89ib8RY5WT/ukpjDK7D7xIFpUcoz9K7swbWAbKuhW0/6mjxpWyK8/fiGdM6cRgGvRIg
         wjCzE+PoqKJx26vxqy2qH1NJFiw4YKuTgZkraIotJLqBzJntZwLW6ldAJfPBskIaB6pr
         gcFEY/4+9t/zLsbUkq8+L2v1hAtuKQvWlSp+bilT8P6N0cJlUD7PIBBkrMj9nxLMhHx3
         qXklO3MhT8qE3T51MBy0zSxpZJDBkvW4xcPZoI3rTTXoeYet92Xa1lrXZ6c7cWHlC4Nr
         blnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+Q/C6Ew9/RyN4rftiukK2dA1C0HzuPosrHyWyx9qYK7OlfsccumRVAoHkKv7eJImYwIpBchyk7PumF4UiCp+7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy34IHsNLGh1r6/huOToedIOMQRbH34hX6KxmSNx4S1ERmkK23N
	gJ7y77rZaw2u2g2iKjNke6ApvSPPQCLcOyJsa87BBRWellQI1clVRjEs
X-Gm-Gg: ASbGncu5SKbDJYNRrPDRruOYBBmAVEtmaJgXmrn5DpPcmAegUr5lKADrtO4/EjmdxZa
	XDeFpcRSzL9Jfk5hzxhoCeb4MvFbx4iDl2yqJfsFHfrAXt/82n+edLWU9WDv2TgK0PWGQQg03PW
	KNIyipgqPZ4msaRt2APhy5WFHUNUb7FDy1RQSP8JQJA9fpUECwyoC9T54F5lUd9SuhqwsdI0PpU
	eY71X0zadFBHencLZQgHSJSJ+EL5WP/2T8i0u7BQrNE5eSMiei0V7S7nyjqyV3NlQy0kRpy4YxS
	Q6R1ZLC0RFVG8+1ZxznWjLo3+sBLdLEKghyP+DZNV4XgYGmb07HEjGZth5GYLZVpWWZHGA7ciQO
	1FuOYW0XilnwExOCQCz0Pw33/gJM53xoQLvpXyAV+8DfrZaL08ORjD4G8LiwzBLgPfIXsjTVt+p
	hP
X-Google-Smtp-Source: AGHT+IEHwddQUWpun54rQcO7TrQwu6s7Rbw0jMDLSLHGGO431eRobH10Dl1uhW5PbFwDQhRzruCIvw==
X-Received: by 2002:a17:902:8c92:b0:294:9847:fbfc with SMTP id d9443c01a7336-294def6c333mr27333195ad.11.1761815829218;
        Thu, 30 Oct 2025 02:17:09 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42f3fsm178469605ad.103.2025.10.30.02.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:17:08 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: cnsztl@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dsimic@manjaro.org,
	grzegorz@sternicz.uk,
	heiko@sntech.de,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org,
	shawn.lin@rock-chips.com
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6 with A3A444 chips
Date: Thu, 30 Oct 2025 17:16:49 +0800
Message-ID: <20251030091649.25396-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5af928c4-4b6e-489c-ad39-26cef3dd7473@gmail.com>
References: <5af928c4-4b6e-489c-ad39-26cef3dd7473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021711_205119_4E57C32D 
X-CRM114-Status: GOOD (  14.56  )
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

Hi Tianling,

On Tue, 28 Oct 2025 01:34:25 +0800, Tianling Shen wrote:
>>> May I ask you to test another patch I just posted to see if it fixes
>>> your issue?
>>>
>>> https://patchwork.kernel.org/project/linux-mmc/ 
>>> patch/1760924981-52339-1- git-send-email-shawn.lin@rock-chips.com/
>> 
>> Thank you for the patch! I will ask my friend to test it but he uses 
>> this board as a home router, so it may take a few days or weeks to 
>> report the result.
>
>Hi all, sorry for the late. My friend has tested this patch and it works 
>fine after 50 times dd operation. A big thanks to Shawn!
>
>And hi Jianfeng, I found you made a similiar patch[1] for the ROCK 5 ITX 
>board to lower down the mmc speed, could you please check if this patch 
>also fixes your issue?

I don't have rock 5 itx near my hand to test, but I have another board
ROCK 5B with similar issue. And after applying the patch from Shawn, this
board can run HS400 mode with max freq 200000000.

I will test on rock 5 itx later when I have chance.

Best regards,
Jianfeng

