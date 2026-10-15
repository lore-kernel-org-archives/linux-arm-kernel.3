Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4747CCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTiAObyAESh3G5YxQwvY1f/k5aL+7XVnCiMQ+GLcbRk=; b=qdVYUoAMR7eD+pUc7rvndMmrm4
	xIssDrUeDercRRf51PZVXpzq97Ab0lwQ14c8Tp6lztNwY6M6TRKrJd49fbDcXhR1VTfCABCEy4zU4
	/ReIx1CVE/3ANAKy4KbFY88IFXjk4sc2rmRfFJbsE+rEGNVWD0Jk0a7RD2EVOmCtNi4AehBWwdQwO
	vNbo9Wp7SoQXvSYrao72KE72EKOy99UfZF5zRnvp3egb3nSNUMz5DDGMdLf0NCiGZQhjNQb3dKeB1
	GGI3uHYw7PRdEhwy8hlxGB5jIgG7578YcOGId911tZoP6/yh4EhLQf1Y+Mv6AoQiSz6fhgY6yU9QC
	FtuTVt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIAV-0000000HLtT-0res;
	Thu, 15 Oct 2026 09:54:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIAU-0000000HLt3-0n3i
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 09:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FTiAObyAESh3G5YxQwvY1f/k5aL+7XVnCiMQ+GLcbRk=; b=E1NN7Ft7gEWjC+vq5ZBRZvekE6
	8QHNYmvOcIovBCRlhZRiDEDtjT4aE31hSUB1yRCR6g2E2ZnSftpK+Z/7jKQHWbUvSXjvYWRW1rLtL
	wmTqfU6WRwnwFOSZ46WjhT2jOouW7hv3xsatfENINvhHpn6ZodybcSDT7mU7Ol723nJhaejY2qlf8
	L3zl290DDAF+LxqiaAPTYMXz8pFBBWoCBsT4ruQuMYrTKwrtQxDDJ2Bg+o/5JdH4rZexSlmjfOGkU
	biocYur/dUibauJN4Q1864tBSA3J8wPpYnHFPk/gtnjU2OWMLK8bhG99756YTem+pIThJa/d1EdZA
	x9wmFGUw==;
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHIAQ-00000000Ck5-2cAy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FTiAObyAESh3G5YxQwvY1f/k5aL+7XVnCiMQ+GLcbRk=; b=dNnLFCDdJxUFAnrNjRUh3QEdY7
	2KbWJtVpT8MtlXfHPk4eNHJ0WK0IHo26G9EEcRYvjgB21eaBUz8/eg+lr/VKHV4xsxuwxhEgClC5v
	Sin9Tp+SerlmItUku+HmrO1sk0egRZlwpHgJrGq3UC1n5SnbgDFZq4A1N8KVgXVsM3brOzcMfZX65
	CScOmGCD+sEkN+ZwDz0wRROYnLq8o4GpMh9Y0DKHQHUA5UsZI7fu/fg0t6eIoPWVOVmD94lCBg03U
	kdUaj7kaHdSWHDTbKli3+NrOc89nucwHa/GwQQCF3dTFnjvtB8NZXVsHY8IQ7+1710ULQyru7cUbR
	cK+eNmHw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xHI94-0056ak-1F;
	Thu, 15 Oct 2026 09:53:06 +0000
Date: Thu, 15 Oct 2026 02:52:58 -0700
From: Breno Leitao <leitao@debian.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, 
	Oskar Senft <osk@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jani Nikula <jani.nikula@intel.com>, 
	Vitaly Lubart <lubvital@gmail.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Philipp Zabel <p.zabel@pengutronix.de>, 
	James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, Dave Penkler <dpenkler@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Dan Williams <djbw@kernel.org>, Mukesh Rathor <mrathor@linux.microsoft.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Alexandra Winter <wintera@linux.ibm.com>, 
	Julian Braha <julianbraha@gmail.com>, Karthikeyan KS <karthiproffesional@gmail.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2 1/4] uart-routing: Add common UART routing framework
Message-ID: <atCibvmbCSTMTMYD@gmail.com>
References: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
 <20260905102901.126035-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905102901.126035-2-changhuang.liang@starfivetech.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_105430_870273_3E8A94D0 
X-CRM114-Status: GOOD (  12.67  )
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

On Sat, Sep 05, 2026 at 03:28:58AM -0700, Changhuang Liang wrote:
> +ssize_t uart_routing_show(struct device *dev, struct device_attribute *attr,
> +                       char *buf)
> +{
> +     const struct uart_routing_selector *sel = to_uart_routing_selector(attr);
> +     struct uart_routing *routing = uart_routing_from_dev(dev);
> +     unsigned int val, pos;
> +     int len, ret;
> +
> +     ret = regmap_read(routing->regmap, sel->reg, &val);

It seems routing can be NULL here if the file is read while the device
is being unbound, and uart_routing_store() has the same problem.

I hit this while testing v2 on arm64 (next-20261008 with KASAN), and the
code is unchanged in v3.

        d=/sys/bus/platform/devices/$DEV
        drv=/sys/bus/platform/drivers/aspeed-uart-routing
        while :; do cat $d/uart1; done >/dev/null 2>&1 &
        while :; do echo $DEV > $drv/unbind; echo $DEV > $drv/bind; done

and then got:

    KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
    Internal error: Oops: 0000000096000006 [#1]  SMP
    pc : uart_routing_show+0x64/0x288 [uart_routing]
    Call trace:
     uart_routing_show+0x64/0x288 [uart_routing] (P)
     dev_attr_show+0x64/0xc0
     sysfs_kf_seq_show+0x21c/0x380
     kernfs_seq_show+0x138/0x1c8
     seq_read_iter+0x358/0xa30
     kernfs_fop_read_iter+0x438/0x500
     vfs_read+0x484/0x6f0

--breno

