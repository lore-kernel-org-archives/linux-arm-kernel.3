Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD0CF46C53
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWslBRf0qez7073VMBbYbm8uIhmaBf/eGLBWgOwRt/A=; b=rxBowBCjuygafkW9bXcnPLJiAi
	d+wraXgp6N8fRQ2SDVufE7Mgvp6AZ/kDft3vApqaBeMyb/DyFe/ustO6nvvxeRzjQgnFjHKJf2aTe
	vklMY4lVZIJfaJU7Itm8stc3QREWOap/Xjb341bqSIOj4s4FoOhQ1GNsYQWlaQL4Fq6h5edtFu2iW
	9rVWuoMblWvt1ep6i8DsXjmGTzZmlq035dUlzYPmdFTIA7zExAadEuCGaYO+UQK/9PpBcPkK8gTj3
	djjRCSKo5ct9SjxDAS6JbN6DlPETzm1G1a+dFnOTm1T1f26Gzk/7IZvj9N37ParIXdE2D7YjZN3hH
	hW4YHZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9mii-00000005JpA-0gss;
	Mon, 06 Apr 2026 16:22:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9mif-00000005Joo-1NWN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 16:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775492551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sWslBRf0qez7073VMBbYbm8uIhmaBf/eGLBWgOwRt/A=;
	b=JaFNq6/XRLcn4ySGWkjlWJetnBb2WrNyLGNVKmsiflq4nM4em2wyt6q6gJIlEk7yckDqi7
	cg37iKHr0k5NtDuHdho19k9uWTsQ9K6DXiH/05LfmU4xQ0p2ilmiN00wZEhOhBPHbA2Kua
	lFVGDIm1F7BD6SnH4A+23HutpR07lrI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-DNU_7Tg_NueLlblrP-VSyQ-1; Mon, 06 Apr 2026 12:22:30 -0400
X-MC-Unique: DNU_7Tg_NueLlblrP-VSyQ-1
X-Mimecast-MFC-AGG-ID: DNU_7Tg_NueLlblrP-VSyQ_1775492550
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfc61fc9b8so1027460985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 09:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775492550; x=1776097350;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sWslBRf0qez7073VMBbYbm8uIhmaBf/eGLBWgOwRt/A=;
        b=p8t8LTX5rHf41xiUPWK9+zcFe+hz90LEZu/SsilUI8k7Zu9g95Xi+77Gjgdj81ynmX
         VEo81xvMyYCdY6AKYF+tCcgz84bsohfvIClW6TiV7dDn7d8jfVF/Kpl3sr6La+UOzEvV
         ac1GglQci4MCfXrGzceb6P51ln+b7kdqyRu31sREXLTtlIzkFeLwDkO8W5KlvHKVRK8z
         RBMgVZT97RBuf9+83T8rKQsJZwqGEaQifvJqGTCNL9+MVJla5DD/QICu+4ywcvJ8L0Jh
         AaELs6fKz4CBD3RbyaXdUmC43KpbOaEtRHw8wcAJ9vI/N7ghZGGCzpbdR2YVjnVasupb
         ft8w==
X-Forwarded-Encrypted: i=1; AJvYcCWCCcsq2EWynJCCCHyImzXkIR1V1WPeERhP6N1OxJ9Ah+lu3/m6GRTGg6U5E1plnCdzmGA22OksADRvKMNXB/gl@lists.infradead.org
X-Gm-Message-State: AOJu0YwDfLzVGAdjMxFi5wsZ9uRmkg2vXiJCYWQlsfCPcGbx43q+IHb8
	zO2LoONThSyajr1o5UY4qYa7P1sLANL7y1gG+hk2giZxpZZJ6NwvjmqUWcc8F0366vI8Okdkv7p
	aGEG3uOvzBi0za3k41D56KMKhiPkm7EcXo3vAh8YtMv/l0atxN30e099ZD2lmlHZiUCzXneGuwv
	k0
X-Gm-Gg: AeBDiesvsCJwDAwJyXCLUnEu/B1wYZ1A7LQS44G5jsVdUtqnKVA75tcpj+AKJ7Sdvbj
	Ik+2tm64vuOjq7+b7LzHnqwEHbNyN93v/EI6lDOZELONfxChEoUjWK/O+9tbzbNglRlaMPPC8ih
	KcHsIQlCdx2fHghu1M28S88GnDvEm9kGkgYaot8S3vgDzi5qrzkY6zfqEh0BNivyymBDpec++j3
	1s2ULMmwrl7an1oOGhZlA81D25VQgb7lwJTOS4qq93mEbA6hxusE0cb/+5orvE1sw/y+EDnLFRQ
	DlFZtafGqAbcS5gGDN6ryxfceaMvjvSY1QCv7kGxVksORWVkya8+XtWVIq9ZWsjdgkbbANFn9at
	G8kE5izFB4wI+9oB3cmoovSDjTWOsdLiSbdoVdbs/q8DIPFPmJ0StV6fp
X-Received: by 2002:a05:620a:1983:b0:8cf:d717:c22e with SMTP id af79cd13be357-8d41c3b4bbfmr1914123585a.28.1775492549536;
        Mon, 06 Apr 2026 09:22:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:8cf:d717:c22e with SMTP id af79cd13be357-8d41c3b4bbfmr1914116585a.28.1775492548827;
        Mon, 06 Apr 2026 09:22:28 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a5c5cb5csm1099220585a.15.2026.04.06.09.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:22:27 -0700 (PDT)
Date: Mon, 6 Apr 2026 12:22:25 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] clk: mvebu: use kzalloc_flex
Message-ID: <adPdwTGDdt5MkDp6@redhat.com>
References: <20260403194701.11902-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260403194701.11902-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yolSO8_k_kRGVQbvrnUHxgd6CYEHi3f9UTzzbK8bi-A_1775492550
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_092233_543844_2A453459 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Rosen,

On Fri, Apr 03, 2026 at 12:47:01PM -0700, Rosen Penev wrote:
> Use a flexible array member to combine kzalloc and kcalloc in one
> allocation so they can be freed together.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment right after allocation as done by kzalloc_flex with GCC >=
> 15.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: remove now unused goto label.

Reviewed-by: Brian Masney <bmasney@redhat.com>

This is the third time that I've asked you this [1]: For the future, if
someone asks for changes in a previous version, then be sure to CC them
on the next revision. I was the one that found the unused goto in v1.

[1] https://lore.kernel.org/linux-clk/acvUoSOOF_9UQC75@redhat.com/
    https://lore.kernel.org/linux-clk/ac0o7XbBm8aBOa7a@redhat.com/


