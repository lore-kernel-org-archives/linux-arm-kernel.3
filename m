Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7E7C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vSVyhelhFsfegw4hVxsjPHJm1Yo/7biii+IJ3uJLRNo=; b=JSBRtMMeFb+BVJ
	WVcMZaqmmH6tgWF7T8D7tNcxgdPqPBMoGQ6ObnIhTijrwTu80vno6Iq0Wp9jqjfWDTjNm20rzYkn+
	uvcZciERLpjUoUSiUHjEhgO2wd+evUm4c93/4qdeV5xLS4RH0onftLl4RnrHcfK4h3TIjfXU5risq
	os8X23AwwTT2OUDPmVhNL3pwzzuehWWyh0EeJc3ho89KvUGPwZ10A7AWUbKqQP2DLR4bVHIazo1qa
	wjlFzFBIFL3lXxIHE18iRD7URpXFUY+EgGMZ4tMCq97JaEGvgBGwb/U14peVvJGsArMyVv7t13FK0
	eZ3HGIclMMvd9kB9wl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VLu-0000000E1Fm-2PO4;
	Fri, 18 Sep 2026 09:57:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VLt-0000000E1Fe-38Rr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 09:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=vSVyhelhFsfegw4hVxsjPHJm1Yo/7biii+IJ3uJLRNo=; b=ikIonn6J5cx6MdbhszpRQ/jNIg
	sYtZ/hpHT1pK92d5+Ils4UxbXnnRVSkK9T9tXlQ9zYcm5W7CQQ11uMRhQB91Y7qwtWDJfwYWaUwAa
	9cj5tDWgyzxHlW1gmj93+tJaVtKXT+hZGq7ggoQlyeNyrFqq2aT6NxWSj36Ozh22i0OAyYfjvYFe7
	Ye1hboqySICnKqlcnGqo2W1CvOAffbVlRR1S1U4L3cq42ll3G5q+3GwMPbLSxW63yzs84KJ1sN3KX
	rjDNJLKTpG3CFcAS8Duw9De4gogn99PVZ/kNIjiRJp43Ps1EE8/fYKN5fby2vhlX/sE8jxN9aV8iO
	Tmw79Yrg==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7VLq-00000009sz0-1fDu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:from:
	content-type:references:reply-to;
	bh=vSVyhelhFsfegw4hVxsjPHJm1Yo/7biii+IJ3uJLRNo=; b=je90bFkvhOQrvZxbwrZZrlVKBo
	/6CZ2ngkSPuohY6QFxZ3/GbKelfat54bngKn8uAmjXkSldlyMKu+E8xYtFjgKhLTzxu1IselZuShw
	dCIBxavcRp4LfrhHaI/kfvfkWUjTmef8gjium8ydW6oxp1qZocfdYonoaaZfkcQGLcMe2orj55ugE
	VyLzokIkTgjKsTEQZp4yWOGI/OrSI+ZKCLVte2hIvEa76emPoQKgx1aunyvWE7zUT9wZUpPQKOiGj
	rFXG8ST4naS73wbJkbJ+8XwvBBL8YNy63RdjKWGSD/zIPE8DHQnM/RK+i5OHZzhVk6jjTQ42eYDrQ
	5jfottaQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x7VLQ-0000000FM4K-3Gpm;
	Fri, 18 Sep 2026 17:57:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Sep 2026 19:57:24 +1000
Date: Fri, 18 Sep 2026 19:57:24 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: davem@davemloft.net, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, bolin.liu@seu.edu.cn
Subject: Re: [PATCH] crypto: atmel-sha: reject initialization without a device
Message-ID: <aq0LBO6C20OuPVdE@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913125143.109897-1-bolin.liu@seu.edu.cn>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_105750_538807_106DE026 
X-CRM114-Status: GOOD (  11.19  )
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

Slavin Liu <bolin.liu@seu.edu.cn> wrote:
> A transform may be initialized for the first time after the last
> device has been removed from the driver list. Return -ENODEV when the
> lookup is empty, before the debug message reads dd->dev.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: ebc82efa1cd6 ("crypto: atmel - add Atmel SHA1/SHA256 driver")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
> drivers/crypto/atmel-sha.c | 3 +++
> 1 file changed, 3 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

