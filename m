Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B006CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZscFgxaOdMe9Fpbe+Rp7hnlp06VZswaAdymqLttHLhE=; b=OZkuNyUpIJW0KJn4kMf+FWlWpe
	nU57qd9W/8f1yL/QiFj8vjq9y4jecULTzImzY02kDTwIPJw+QKqqf9ZvbUyh2Iv2Bf0Ydwv6ppZ2g
	YduWVFey4HFYe2b6rx9ybycOl9tgp0kskmrbZOIWNz0a9Q5YwqjnxS3XE3XgLGQ7LGsZaUlen9D6E
	Kx8pdXCb7fj8/SVC1MU28eJU9BHChljheFylDaJqZiykEvTsmkU7OU9nocQB14GuSXeeopS5+kOfH
	R6A6rFA8SlBg69gAZy5xHD5i7vJ88X5z6dWdAxJbXsmC3vJb8BpaC6GpDTQORabPaeVlx4fQ0Qsva
	lHYkaGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0HLw-00000007JWT-0DQN;
	Sun, 21 Sep 2025 10:31:32 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0HLt-00000007JVv-0oWA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 10:31:30 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E42FB240101
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 12:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1758450681; bh=ZscFgxaOdMe9Fpbe+Rp7hnlp06VZswaAdymqLttHLhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=NkL1W8RiTiZl08x88D4b9irNhv9y1E0474eP+AsNO8+V/IoNX33D55e5l8pu+HKJf
	 ISOb4JItPSgl4TgQe0n/n8QLDTjauR6IPDn1yRzAt0gmM62BrVoTbJsg/1NEz2hHpN
	 HGlUl9uwvMcJZrXrlINEGvg99o3Muno0VbwdbNUCQhaf+KIbNRxPOHBGa91wjsz+Sz
	 Fwzu533dfsIZ/O1PyEZbIbtQg0NRU2XLJKKXSCuRdW1prpkf16pp3tKq0Gw0WYqhQu
	 DJ0nJ91KTF9uj29qDY8sXd8eX/DjpH4F7sfVyYWgbqlzqkGBeiuxCGP0JkbotL3fAL
	 x9AxKA3oy3Fow==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cV2bC1lTqz6tm8;
	Sun, 21 Sep 2025 12:31:19 +0200 (CEST)
Date: Sun, 21 Sep 2025 10:31:21 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] scripts/make_fit: Speed up operation
Message-ID: <aM_T9mtmEdAGNpLi@probook>
References: <20250919224639.1122848-1-sjg@chromium.org>
 <20250919224639.1122848-2-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250919224639.1122848-2-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_033129_394800_C24F546B 
X-CRM114-Status: GOOD (  19.82  )
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

On Fri, Sep 19, 2025 at 04:46:25PM -0600, Simon Glass wrote:
> The kernel is likely at least 16MB so we may as well use that as a step
> size when reallocating space for the FIT in memory. Pack the FIT at the
> end, so there is no wasted space.
> 
> This reduces the time to pack by an order of magnitude, or so.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> 
> ---
> 
> (no changes since v1)
> 
>  scripts/make_fit.py | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index b4caa127d2c3..904f45088978 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -100,7 +100,7 @@ def setup_fit(fsw, name):
>          fsw (libfdt.FdtSw): Object to use for writing
>          name (str): Name of kernel image
>      """
> -    fsw.INC_SIZE = 65536
> +    fsw.INC_SIZE = 16 << 20
>      fsw.finish_reservemap()
>      fsw.begin_node('')
>      fsw.property_string('description', f'{name} with devicetree set')
> @@ -330,10 +330,12 @@ def build_fit(args):
>  
>          entries.append([model, compat, files_seq])
> 

> -    finish_fit(fsw, entries)
> +    finish_fit(fsw, entries, bool(args.ramdisk))

It seems like this line should rather go into the previous patch.

>  
>      # Include the kernel itself in the returned file count
> -    return fsw.as_fdt().as_bytearray(), seq + 1, size
> +    fdt = fsw.as_fdt()
> +    fdt.pack()
> +    return fdt.as_bytearray(), seq + 1, size

The rest looks good to me. Easy optimization, big win :)


Best regards,
J. Neuschäfer

