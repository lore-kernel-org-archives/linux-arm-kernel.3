Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7B2F5A8A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8autXOz4+KZwRvZdblx2ysMt7DyheBXaGlu2LgBdpo=; b=r2DXgILvoaUETo1K1lej4PhVGd
	BL8227CCZ/D7R/7oWakQLqS3wTqnLSXoH92HRWBc/2BmVN39f9DZ0Jj7SbERFX+SKCbKnkCdmoj8s
	kwYiIbBai51KuiOIB6Z5wrMTYSAFhXeP3beHdDRvtVctSuI/6sMuwdpscqd23Tx8sBkc1vaqvt1Ht
	bppWgpW+VOxaYRRv7O7rayTJOf7lyUIwFX/ZgKa8+KAHsWvS1w6p1JkImOySh7xKgp+Ah8tWpVO89
	7G/qsRNNIMjE1yqHcfZT3Hf47ir3zR5bEvDlpuull7ic0e5l4UKjaY1BtTpv/Y/ebRW27E9Eekdoj
	FYMUReuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsEE-00000007Tpk-396Z;
	Mon, 20 Apr 2026 17:16:10 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsEC-00000007Tp4-17AM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 17:16:09 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12c565dd3a7so340422c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776705367; x=1777310167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8autXOz4+KZwRvZdblx2ysMt7DyheBXaGlu2LgBdpo=;
        b=aL7Ub/CMuaLxEhr5Hg6g0spAobTx7EOMF5+mJ4C9g/YovhzyT85/MAxPXBbVOSTgAe
         SQE2UxMhs4TE121NVNbgLk4ULk4OIpzw69E/M9qjbcLwF0H7kiodtuW4aB+W5/XJ+X6L
         3QICjBczOXk76G5c5cdj6RXbuSzqp1alrhEJz8HRgvv6awMeG1xs97vIHwA4637+9ioq
         VKXQ64wWcAP38aiV+oppzfKPZ971o7uFiiazAdqQ3qc6kOKE5fgfnfbiZEPVx37APrVL
         6jcKWffbprF+vUwpwO+2aplDKXbnl9Q0TNIz2IXCYo+xebi3dtTvJZ8A2QlO1a9FqA33
         iF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776705367; x=1777310167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8autXOz4+KZwRvZdblx2ysMt7DyheBXaGlu2LgBdpo=;
        b=aI8T1zcNlcKYEkOdUyjtyaPQZAPXfm9z5MhtsI0w9sOsXnpU/DAbGS+eKpOOFBUFaM
         zp3J0Fmgf5anhC7+iiy4BHfPYShtgNVWvljhmmms9XVbI/YagkfWys5pj+vN7lf/N7TF
         rirppy3LNy+ok+uQpFJF9tA5smn3eF7xxlzNh0jq4uYgZ7AR378Iaxaj3ncSFvw0okWV
         zkjjTHfIAs1aZh2dPe8ctbT+EcawydY0VnYwJjpANzWfqs7D4+NZUxapU4pCqAyDsgMX
         AgcsvGX0Nhf6XcI5tlCVb5rCSDx6jt7GG3WKHjSZ/V7OcOYvCLSbw2RIAF6dwgAol+kG
         jeXw==
X-Forwarded-Encrypted: i=1; AFNElJ9hDzU+mzxI9xpQjBmmQQUdzV4OxNWd8fb6zuLudxJuX96ZW3eYgLlILjfgo0QeFdsI3AW50AFBCu7iy6zW3hYw@lists.infradead.org
X-Gm-Message-State: AOJu0YwoXLglwcAC64KMNK204A1HrIgCik09gshLDGaarku9vvmK6Gdh
	1J2e2MJkjY88AetPkz1m1ZEyi5D/0MBI9EckAcsyT7wZvhb05AuRScnV
X-Gm-Gg: AeBDiet84do2EyjdaMopYdQg+TR8uzTxiPKYB8jM8ZplwgKPdGEvmugsDtobIu/KfQO
	05TTJPjVbPPp+tqDEIPnd0bl2L2X5lZGiZibMHA4WlDbKBE5/x5CvLqnjWdPBC/BpY79rFtJH0O
	1+6UmpJWOKaJrCP34Pq8jlf4l+0RSNn9oHQXgGio5Kkm6QOgjvU1lrUrEUpQlJXsdHRn8RZ32tE
	O50e1UftHAejkirNCveQvba65arUiRH92hry/oTYy4/3+1i34UN1iHL2RJK+tUDJ96f+TTNMQjU
	EX4rHyZaHkohccmFLXZy+CNLloc8tQIiuYx6yOaDJKKdeOAcHZDZuaLio82ekluCCatwlPKTxIg
	7wvVZ2TY0k9amPkYjWyyjG5KZWEGFHA8K5wgaS7eE0FZeVzhq4GuAS0NlXuCgO66ufHcU8DYHaB
	b6yMuGgu/uDEQIf32OZy9ilsI+Tuy0kFTpfgYfRlf9m29On/AmRYj48N4GZfGKU7ngqK6mry059
	r8=
X-Received: by 2002:a05:7022:6627:b0:128:d362:31e8 with SMTP id a92af1059eb24-12c73f95c9bmr7706236c88.20.1776705367122;
        Mon, 20 Apr 2026 10:16:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1a4e:4965:5dff:cdee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e7025cf413sm9717145eec.15.2026.04.20.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:16:06 -0700 (PDT)
Date: Mon, 20 Apr 2026 10:16:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, alexander.sverdlin@gmail.com, 
	marek.vasut@gmail.com, akurz@blala.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aeZe7XoDbOMqMG_c@google.com>
References: <20260312180304.3865850-1-hugo@hugovil.com>
 <20260312180304.3865850-5-hugo@hugovil.com>
 <aeWtDA7snjJmiF9K@google.com>
 <20260420110159.29ccb815eb584bca18a407ac@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420110159.29ccb815eb584bca18a407ac@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_101608_306993_3FFEDAC2 
X-CRM114-Status: GOOD (  11.91  )
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

On Mon, Apr 20, 2026 at 11:01:59AM -0400, Hugo Villeneuve wrote:
> I tested it on the real hardware and all is good.

Thank you for testing the changes.

> 
> So I imagine that it can still go into 7.1 since it is a new driver
> and not a modification of an existing one?

Yes, since this is a new driver I will include it in 7.1 pull request.

Thanks.

-- 
Dmitry

