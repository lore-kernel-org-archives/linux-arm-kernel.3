Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22BAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 04:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFemjeCz+svPiqDivRwBTX10UQyG6EeAMs3A599m/to=; b=07jWB2VZ3Yz6AIHQ5Bq6OOGH/h
	B/qBbrr88in8X7kOIHJ36Mw1aVrdFnoFFzs8Ooxky4m7YTLB5ASAqST/mccNvIKDylK9z1RkzSghE
	vgLUbRsAMvvdL/fcqgqu3cXxsv+5v5fVunan9vtzxkZiA+31gPXpxrNPHMXa/JZ/FXAUi6FfUDD2h
	J9uZJGyhqTjgTkXMmzpr+eoatmm90APghkbVMz71iA89e9ob3jMFDzM/o4okQuBDRgVbp7/zv7cqz
	SdcZ62SkUVCpWW7Iz7ymth7GOT1AMVYeM7UGYbILpx6yri/SGPfAjATCGZJBbOx+viG6iEIta0SDT
	VbIxQO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti4AD-0000000694z-0e62;
	Wed, 12 Feb 2025 04:15:53 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti46t-000000068lC-1tPZ;
	Wed, 12 Feb 2025 04:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nFemjeCz+svPiqDivRwBTX10UQyG6EeAMs3A599m/to=; b=Z5LoVvQA/zxGFaX61quTDq56Mj
	oNQtaYQvv6Rw2AF8EZygCpYZMQfxJVbIQvhZwRYIbr9LpJoXK/Nc6FG1UMQnen254HH4/KlvnVvw2
	+9MecugkxOSWxuJ46kJCf95Mc4iXYCY5lO4Wpen3f/Mr4kChGXUXjsFg5QnU6lrIPEp9EAHLsWpBS
	ukX4lOUfTJpSVc+ghdWw1+91hZXJvRBAa/t19/5dAdCSd8AhYcuzsITuwTZASvTK0fn6HC28aCdr9
	eHgexquxsna1PjKv3a1HcFUTxvJde0kMg1HehJHW1XDXVXcmXrBT5mQ6bVKPAImifEXX1HEnSo1lC
	A/UBqaCQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ti3ZQ-00HDVT-18;
	Wed, 12 Feb 2025 11:51:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 12 Feb 2025 11:51:13 +0800
Date: Wed, 12 Feb 2025 11:51:13 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: clabbe@baylibre.com, conor+dt@kernel.org, davem@davemloft.net,
	devicetree@vger.kernel.org, jbrunet@baylibre.com,
	kernel@salutedevices.com, khilman@baylibre.com, krzk+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com,
	neil.armstrong@linaro.org, robh+dt@kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH v11 11/22] crypto: amlogic - Introduce hasher
Message-ID: <Z6wasftL23_K8vA2@gondor.apana.org.au>
References: <Z2aokzSrAHpJE_PG@gondor.apana.org.au>
 <Z2aokzSrAHpJE_PG@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2aokzSrAHpJE_PG@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_201227_483509_87160CEC 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jan 22, 2025 at 03:41:29PM +0300, Alexey Romanov wrote:
> 
> Why? I couldn't find this explanation anywhere.

Because the digest function can be called from atomic contexts,
such as networking.

> In addition, I found an example of one of the digest functions that is sleeping [1].
> 
> Links:
> 
>   - [1] https://elixir.bootlin.com/linux/v6.12.6/source/drivers/crypto/mxs-dcp.c#L804

That driver is just broken.  If you look through the git history,
you'll find that a similar problem was fixed by replacing the
mutex with a spinlock in the cipher path.  Unfortunately the same
fix hasn't been extended to hashing in mxs-dcp.

Cheeers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

