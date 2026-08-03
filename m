Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27757C55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nlAxRhk4xKY8oaGvci9bYtVTMxPXDjgswhVEfq9D3o=; b=Id6TmwUAmlQVJGBBMZ7Pn88uuE
	Ohr39+obrKqoNMIFc+7KM2qKQe3xyzL4NRwiDPbxx8cEX8wW48QCpPnLYZd2GukS9aopbdK6kGNyU
	xRq7s+ncQ4RboXTARUFLApeanlCvwb5602TbTYWioa3BaUaZAWXtKoREfrgj5Gek5jRgx8L8bAxnq
	mziwPRvgheUsGPXHCrV9we8gRT8RSDaeZAcWvq6FJbuf+Ir54C4w3Dj1UcBrwAvzDGHlsk/DVX+ku
	5oCaYwI2PIwcdqOFVvWbdLtjbBQq+N0z7CeU3q4c6khct2jgVUP9UQQfwbrTz2Hd/Xw3ND8G3f/9f
	HCkyY8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxhb-00000000Oeh-0StS;
	Mon, 03 Aug 2026 18:47:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxhX-00000000OeG-17AP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:47:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47362928f65so3626962f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 11:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782869; x=1786387669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nlAxRhk4xKY8oaGvci9bYtVTMxPXDjgswhVEfq9D3o=;
        b=JCrDIW5yNn7SEtpGeLMMnqKEOzJIcOYXDxqT01RVTF3FrJj1jIjSMbAArygea2gLSp
         U8XR0k7aAVZYb75x//W8a/3QL+LsehhkrKlXAO5H3VPbt3VKqCP2mX1v6/t75/fBo/0z
         RIjao3hFcuBWzyHTqrzp12m8fQFywY2e5RGS4pbqGXFya+PORSAgASk1LAFoeu6CvrPH
         dY6LUMOWT+sIN4koFHyElOGeEhamp7avmVDtjmewlxNY82EwS6AIAwPD6MFhME/eHYst
         x1RyuND1VaIqaD17YZxvkdLOrRe/Bllnkg+rZrRyNu78hmL0wa0uzvRl2H4ZIVOBi1Ay
         VxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782869; x=1786387669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nlAxRhk4xKY8oaGvci9bYtVTMxPXDjgswhVEfq9D3o=;
        b=S0ZkY4/gtlBfFQq0CUWLZ/ewvmDt2ckYsWJjBxA+tYkzIqBokA9LGlUkJSZS4uvwak
         2JIkxmlxmjJGMVsDtI20HTKF0XdHtdQzJBm8u1qPfRc8Itul4fhTa3gxnbALm5ytj7YU
         v+tLvza38mrqhoEOT92B4T/zJqyODDrb2nKUmCaWJGFfBV1Ke9abRmc5vZOaNOZ/mNKQ
         MFOO9iPGU+RVzwNQUQAZ4E+Bv+cpbElV5X2WDMYS9iAvSG8KcnEPRt65jR5+dizwlFSo
         nGym74ZD+N3CydA2786UoJYnF0Yn6dPN14PZinPyiMdT7rG7wHlvhLB9Ey3Ij57NPMH5
         F1Lw==
X-Gm-Message-State: AOJu0YwoiSKDySchjcAdjINe1V85oxGIW3QeIalFYIBJN+PaGU640x07
	g36G0/ANeEoXrss5SKLm/nWOPWtoPCVeapS6/PPBWUuUli5ZG2n38sP2
X-Gm-Gg: AR+sD13PxWUPArzlU7I92xsMBEJXKfhgAWaijmVppfNb3RkoxuVgT/1WFYQKVm/oRn6
	HM/FQ6kbz8NqI6hpwjg3Ej/XwHiuP9rkSQew/vvfObwpUbuz0dmd0NFHNNiBeeL7iMFFH9OzW8C
	98fzX38eHQEFVvzDShUk9RioiDMzh659xIBo7L3z6a6yY/lLQabYIlEp4NQEsXpOyv6J2jgHtp2
	KxPFF4YicEDgvDytgaPgKWQwEmcuoZjpiYfEwQBpTAZxM9QKS1is5m8tKni2JSBchnzUtkDXK33
	x59P42JEaD6y9EjpQCqlofu1saWWYkvS6G6QXKOyWd1GJeg1QbBDKJy7lMSRCtZ403GYuxD/MoU
	kC4NE4xWKwIRkxp8JaOLyyy0mP7J7ZpfC1XpxCBC6h2qRphezl9ZI6Yw1IUncjimkL0YDTFkHJv
	c/1kQr5DHgdyryvmGDmUmTNrf0z9ADWwjk6alQ9V6cB145BqPUrFYo6UCFpkq/X4gh/ul5MKeqh
	zMipzLWMqHjy8dRVbVxoB9/Vvtp46DPwFRVR657ac6eTh43WlgfMHnaPOK+vFpRHFswGEj9pOal
	sh4jKmV8lizkPwZGeE4ucomHmiMUGn1gDiR5/XDKsQuBRiDWzxoadUCBwlNYIw7Iwg==
X-Received: by 2002:a05:6000:25f4:b0:47f:8f8f:db74 with SMTP id ffacd0b85a97d-47fd72bba4fmr29878393f8f.12.1785782868524;
        Mon, 03 Aug 2026 11:47:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b3d4-c101-2c67-9805-4069-c4eb.310.pool.telefonica.de. [2a02:3100:b3d4:c101:2c67:9805:4069:c4eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfde0sm33136363f8f.3.2026.08.03.11.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:47:48 -0700 (PDT)
Date: Mon, 3 Aug 2026 20:47:47 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org, Dan Williams <djbw@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org, 
	Kevin Cernekee <cernekee@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH v3] ARM: set !LPAE MAX_PHYSMEM_BITS to 32 and remove
 supersection mappings
Message-ID: <anDh-ltx0AFUP3cM@gmail.com>
References: <20260725133122.2723-1-kmehltretter@gmail.com>
 <9f7fb591-3d56-4354-afa6-8d1fdf5a038f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f7fb591-3d56-4354-afa6-8d1fdf5a038f@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_114751_330827_B78790A9 
X-CRM114-Status: GOOD (  11.52  )
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

On Sun, Jul 26, 2026 at 10:03:16PM +0100, Arnd Bergmann wrote:
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Let's give others a few more workdays to comment, if nobody
> has any concerns please add this to Russell's patch tracker
> at https://www.arm.linux.org.uk/developer/patches/info.php
> 

I've added it now:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9486/1

Thanks,
Karl

