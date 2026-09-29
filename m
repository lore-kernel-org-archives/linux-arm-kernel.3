Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D5BCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=; b=ya13gZbrH3scYCcQdaeTeaz3Db
	FcGTgy0Oi3047UuJ6pltaQS9LNvLoc88fYMp030G5pOgHUu3hlnZmbv1T5bZ6wUXsv6mf/zRYHk7V
	YujqrKg07k4uhQQUSQYszmbbLm2YHR/cJ8QhnOQ59yVkbMREUsWvuYMKIFNGNPP3pqJS/W8i1fKqq
	341jgSdEImkc4KEB+iyaApACCIMK7RJBcVcN31YnMMCZ9eCNiZvTqsK9rzrA+EnahrO7efSgDoYEQ
	xiwFPFIvLyzVDIUVM6ssPOEgF4dTubyEQaqwMMdhvuQh6ms1/MM9rw6jbHuA5XUk6C/Hb7yk6jiEc
	YeUh/5RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR0n-00000002PNb-1uRu;
	Tue, 29 Sep 2026 06:08:21 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR0k-00000002PMs-01P9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:08:19 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-488811c9ebaso1776639f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662096; x=1791266896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
        b=lbRIQjp1/H7NQ/Q8rfaxBSZYMDMOwwTbSGoGATuE0gJeXftMRxOnweyFmdh3m5s5Ip
         xt929v09x5UlsefpqA7p/BlWm3G1LHciU6exm7bKmPD3CVZidRI3NXeojj+wCGm1xYF9
         VdpM8RivLxrz7580p3l+UIX4RU4KOgv8n1tw4FNKG8iHW0IMp8WLHSlObRS6qoLyq99d
         1xrKxj+2PYaoaAz3B/7sOrEsVMHseVpaTQHqNjzkZf47mw5ggO5A0k0cmsOwERAHEvqU
         385eXaFpex5FEdTiyk0duiuCtpEdBGaEW9hXKNR7njXZHbzyOuYxHOPrWV8DJFY9l3Ef
         d3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662096; x=1791266896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1nqsj9H5H4eMiTYvWq+JgqtS1aF4n2hF5KzkhNqrNs=;
        b=Z4qViZvhbrebD3bXft3IP3ifVdFFH7InlT/NhkVMvPU1Ddv3x8zz8EG4zxVxds93el
         1RjM7HX4Ly721OGh28n8PbeooRuGFXn2ikCbrQJ/4PVfGbKwAdIzbqgQAXejKR3UUxwN
         MrapffEyOFDrdgB3cDorLpPiOhwH/rmnGT4OgAgwzSUd+P9yLeGgxxmKchUsj7kSJu0z
         ioKbL+Te2jkm0x/E8f8dRiZo0ZPJgO+de570zUyFDP+IBxzG+384hPnzEcntTrNs6p4R
         YCWdIywbfpBt6bxshjR0Rgz2BPYgWA7OcS7QgHZhsWY1M6ugTr56z8gzkhMd3gjBJTvF
         TmMA==
X-Forwarded-Encrypted: i=1; AKwUvBwsTRn5fqQrQZNsGmgS4m0DhRrPE1jsb7AHbLwozirndJaQgyL6qe/PzTwMCRbpsdbNyaRBxlK3cJEQG2t6nt4k@lists.infradead.org
X-Gm-Message-State: AFq9FYJx2wdSiD7oZuE7zS6BHaDdc3odIYMqiWcx9WcNlvOaYqp+i/2y
	oh2UJFgYyLdGYAEuhBslRR4EU3DI+yF18ZlrUci7mw0n5g1iFxBX7Qi6
X-Gm-Gg: AYBFou0b/g4X/BgHi6/ey8r94MoOJ7uCYGGOWVQmMDufokxufP1iKNUJ3PK1+VB3nAN
	odhJ8cNy8WNv32rqp7qvSdAet8eHx5o/53MwiS4wsBzC99hqG15eeXO2EiUFocWQlUxxCsPC+HT
	7J0Wl5UYVzrTlofomM4Sfij/Z3rlBpjNNl8vuJ4z3LvapxtzLQ+PHYhjPoqR9iKvJkgryAcQZ8A
	COoOqHtfGgSXeZnPLjKr/h7XJeEycu6G28cGIGByj2Ywsb0qMBMce9i3/FrQbYR0TjH8H8oJUht
	PanPNIDeEw/B4KP/bgABvdMk2UG7r9gSBGq04drV5e12l/0kz3s9/ZzJqeiN/DWuQ89Z2hr8jjh
	i5k+fji10AZzn+cGgHh/Y70Jr4jktP9WNmLH5yFadku4P6Zx/ZCTaF6frajwOj3lxvEMwxpPmLP
	6c8B4K6Y6G0y+WmtoXDM25XcNCMuuYMDkYMNkNvg+/k7SCd0v9Eol/NMI5SebJnlPNeGFucAh9i
	G0Ys1C6
X-Received: by 2002:a05:6000:41cb:b0:48a:f511:e40a with SMTP id ffacd0b85a97d-48af511eb10mr783882f8f.34.1790662095984;
        Mon, 28 Sep 2026 23:08:15 -0700 (PDT)
Received: from localhost.localdomain ([62.56.221.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4e8a332sm1628730f8f.0.2026.09.28.23.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:08:15 -0700 (PDT)
From: Michael Freidkin <freidkin@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the aligned canvas
Date: Tue, 29 Sep 2026 09:08:12 +0300
Message-ID: <20260929060812.2041099-1-freidkin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <artQxRR3kJUv-mBF@stanley.mountain>
References: <20260928165045.642354-1-freidkin@gmail.com> <artQxRR3kJUv-mBF@stanley.mountain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_230818_052973_DA9F7856 
X-CRM114-Status: GOOD (  12.97  )
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

On Tue, Sep 29, 2026 at 08:46:45AM +0300, Dan Carpenter wrote:
> Reviewed-by: Dan Carpenter <error27@gmail.com>
>
> It would probably be more reliable to just ALIGN() the width and
> height at the start so we don't have to do it over and over again.

Thanks for the review, Dan.

Agreed. I kept this one minimal so it backports cleanly with the Fixes
tag. If the maintainers prefer, I can send a v2 that aligns width and
height once in vdec_try_fmt_common() and derives bytesperline and the
plane sizes from them, or do that as a follow-up cleanup on top.

Michael

