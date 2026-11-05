Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6D2606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tkDM+ubF;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=JKYwwhzG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Kob7YlwVM+xHHu2Uvpi+NLog2cKg/RBxEB5tTCs0Yk=; b=tkDM+ubF/CMresLFDgvibpSuPr
	sNCvBqaG2DOym/JYS0syb5RYol6/B+FsjdKrQe4TWo3u6VvFYuCCtoYT1zcy4I+b7Nw4yWcORbpKp
	2waJ1Pi9TdFbEEgQxZfDA1wBBEJwRPi3tiWuF/W1WiykmOz0Af+ma8F+IltzpxlfjaCxwQe4Meb7M
	bvYSAFM2/il1XHbKS3gcT7P7qpRS12E36LwNaDTa93wCFIBiERCtyu7X4B5hJOGQ0GtzmkqkpySpz
	P3TZGBoMo4o/DP9GhL2lEmaWEB+oS7YqXDzb1jSTwICkRONTS6iBZtegoKyq7BlE2kvPKcYiSWFn+
	2WxJlqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtBj-00000008CQw-2jWu;
	Thu, 05 Nov 2026 08:51:19 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtBf-00000008CPv-2QjU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=2Kob7YlwVM+xHHu2Uvpi+NLog2cKg/RBxEB5tTCs0
	Yk=; b=JKYwwhzGpO7p0wD7j5WBusl+5uPKnIQr5LW27p1RaPjWrYpSh8yCRZb6U
	+TmIjyOpHIfW9RrkNOELPIWVswKCRT5peC2xvMKYxwo7Ng5WVknGYbitD41LzJMi
	3hQVAk4Cj9+lUC0vy0uDXkrVoNRuqCefqCT+K4YKSV5DGQGau+Ol4C2c78vMRz2P
	4Ps+kCSSiHIryaR1trBC2kNtQA1NZuMqxJenGosSjaGB0o8sTiFFUo5lqVseKLR1
	7GouPftCld2vLt1XOjEDx9/vbQBG78k62eQNNlgpQJRfSUkxQ7aPfmBO0GjFlLUR
	p214tVN9oyOr/mp7dTaacE9WY10GQ==
Received: (qmail 1074718 invoked from network); 5 Nov 2026 09:51:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 09:51:07 +0100
X-UD-Smtp-Session: l3s3148p1@BjyumINf3sTAwtcC
Date: Thu, 5 Nov 2026 10:51:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Guzman <Dmitry.Guzman@mobileye.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-ID: <auxDe0lmVCDu_iXA@shikoro>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
 <CAD++jLm+m+YNhTaUnTm=dwO4p8xYe8OjZ7qhQ9_u15dnxURiVQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm+m+YNhTaUnTm=dwO4p8xYe8OjZ7qhQ9_u15dnxURiVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_005113_301586_51ED4CDF 
X-CRM114-Status: GOOD (  17.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 09:42:02AM +0100, Linus Walleij wrote:
> On Tue, Nov 3, 2026 at 9:30 AM Dmitry Guzman <Dmitry.Guzman@mobileye.com> wrote:
> 
> > In nmk_i2c_xfer(), pm_runtime_get_sync() is called on start and then
> > the controller registers are accessed without checking the return value.
> > If pm_runtime_get_sync() fails, access to the register of the device that
> > was not correctly powered on may cause a bus fault or other unpredictable
> > system behavior.
> >
> > Check the return value of pm_runtime_get_sync() and it if is not 0,
> > return the error immediately.
> >
> > Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
> (...)
> > -       pm_runtime_get_sync(&priv->adev->dev);
> > +       i = pm_runtime_get_sync(&priv->adev->dev);
> > +       if (i)
> > +               return i;
> 
> It's a bit odd to reuse the i (= iterator...) variable for this.
> I would just add an int ret or int err for this.

Yes, please.


