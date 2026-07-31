Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD02AC55172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxJ+yA42EHLQdUzb/+RpNk8wZMGnUA7//ORKkd+D1IE=; b=yUpu84FzP3p//T42kiJg/qGE/0
	B47sVI0FV/q4mZYaRWd3CskR3XHWWVL9LfPEizBC7Cuabb0O728BPW3eIM5rnE1BL3b+zJm3j0K9t
	5mxZXH0Y1LacVS47DlEX8BFUY8cB06bmHsaxGx07/l3dGZbBw7r/regMEuJ0W4NdhvggxAoA+iLfd
	d2bSWHjTWxLz8ycXPJdDcbQysnTVXaZYM7gJNeaJa+pbjZ1/wzCtvgs7znzrK1MF2X+1MX2w6bo1O
	GZgpZg8MeQGx9qIAp7AKjsqui0E9LdCq5XB5G9iaNmZiDDaGXGFqrYQqE3zV27QAwDx4QFcsxZZyP
	xV0rUclw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUg-0000000CUYs-10UH;
	Fri, 31 Jul 2026 12:37:42 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUW-0000000CUWD-2zxI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:37:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a18180so183144a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 05:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785501450; x=1786106250; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zxJ+yA42EHLQdUzb/+RpNk8wZMGnUA7//ORKkd+D1IE=;
        b=XU1uWljjpik5CyLp9jOYWZ4gq/dF4GZW8sauHQ2u/PuVUnN6HZsbtu/CZ0gj7Ld+c1
         1HgNTfeWW2F7fC5IeLh6ndd6M3IYqjr7oq/bedYalE1oHISmxzlHJSL8PEEjAtErqIGS
         3N/jx2BP3KlflOYITmndSSb4qGSeMcgjnUKBJyXLXuzfqqHKUC0mPl4CRtN8fICEaWMD
         0QfIBFyThV6XDWPrjTHFxU/sOfDhXQWBEyZtbxMcERZmtltXIb+GJHF1roeNiLsqXhq2
         7MWd2XqJD8o0wCxgoBFctZ2mE+i8c+3QSJ7Fp1JIZaCCNs5YQ4Afw5JLHNB3wj4/hH70
         xRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501450; x=1786106250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zxJ+yA42EHLQdUzb/+RpNk8wZMGnUA7//ORKkd+D1IE=;
        b=IVrh2rnA/m8HqOJWl29Ulvj/DGIwwhnakesDrq9ArzLkcLm12UUa0nleDAVR80B6Iw
         /snzG4z95D0T3sj6OeuM3ce8dPjOk24yyqmixuYzk0W6VyImif6jkChGLkFFj2JVEeA3
         TqaEHAoWUPlPZ410E+l6Nm9UX3bjS8QlPOwbBsUp8jeksvtoSY2SdMfaeSh1F3+0kng/
         odWmhiZmXN/wgQZKIztdsJ/P6nendL/NmtrxFzDh/2Ug2AaBRMv/cmoXVq9ljb9Oa+ee
         fpupsoqscI9t1QklYcOkI47PRmDZcKRu/C7g92hpohjTm/t0cPvvzpEHNx7vO8xpeUtx
         nd7w==
X-Forwarded-Encrypted: i=1; AHgh+Rr4viErdL70iYvuYNZ3zwt4/bmUAy2jn/bxR0vSZ+nilRcWzb2oqVxdTKQeAv+Cy+9ZZUkDAm57uBUykEJC/jA2@lists.infradead.org
X-Gm-Message-State: AOJu0YyYa74kV0PK2nIuCpKh/PaHpORvPkFF4+DzRP6d9S30SZWOCMFR
	31SHMyDAeCLZh9yGUc6j1dlbwnjFvEhLTgLRX0H+vBB2/HitniKmLejh
X-Gm-Gg: AR+sD13e/wGTGZq9k9gxZfRRBOUqw6UNeISO8RD+oTiUFaPyV9+TJ5+E/bTh9ZvxLI9
	vcK0sg4LnwbMgMitBVgNXOj3lRy5RBt1vGy5zOWpDZyovGaIiWqAqFMtu5OoeZeH312Yr6XWE8R
	z0QFReYNSaN+m54rDnN6JBoUDZzkknb9wD8n3mDuDyMwEaLEkOy4ZO6OfxO82IiCvBlqvjO+kgj
	gkHaFGJGz/FCKHMVWcVyLlr/yUhSuEKgFMkbIANKoSPo8mqI2xyAkmbYjW7tMHWVYEKvcR/xqPB
	zELDmbYXbHGjExL4TDSm4sgXGoHYXUo5y0XB4G2pVZHu3O7MaNogqGL2K+0bdWUJ6wbDb/Cmas+
	qmqjJVns7DKOB4OJLVaKquc+9eNIr0RXMCciH93UBxAxK4FhqkgOGkfuPrBndc7R6Ca+7M9L3qA
	aLmIgxo7Q34NkzPwAFcegCRLtIKhJRlMcGIifFu6InJytzCTxtsu+32SnpOIcQoc2KEwDMUBwu1
	3ZbwjO3zPsPIA+p//C3vUZNb4Da15NAavpNC+ASKpVBcUAxDtLFF6Gkep8EZ8n9Ec/rf9K2X3Y3
	5xRSDalQmRqHHq/6fcCsYzmATmd9XqA/XGMV+tkH64H3xoCAMCQQWPSvK6jb+vQAt8wt0rk=
X-Received: by 2002:a05:6402:51c8:b0:6a0:1704:de29 with SMTP id 4fb4d7f45d1cf-6a098d07135mr979233a12.33.1785501450131;
        Fri, 31 Jul 2026 05:37:30 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c660febsm1308537a12.28.2026.07.31.05.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:37:29 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:37:28 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: core: do fallible allocations before the
 console can be registered
Message-ID: <amyWRaZN2kSiv3YQ@gmail.com>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
 <20260719221014.44354-2-kmehltretter@gmail.com>
 <2026073056-embargo-rejoicing-87c2@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026073056-embargo-rejoicing-87c2@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_053732_759688_55E77336 
X-CRM114-Status: GOOD (  13.28  )
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

On Thu, Jul 30, 2026 at 04:28:10PM +0100, Greg Kroah-Hartman wrote:
> > Cc: stable@vger.kernel.org
> 
> As this can only be duplicated with fault-injection, it really doesn't
> need to go to any stable kernels, right?

Agreed, I'll drop it.

> 
> > +	if (!uport->tty_groups) {
> > +		kfree(uport->name);
> > +		uport->name = NULL;
> 
> Why set this to NULL?
> 

It's not necessary. I will remove it.

Thanks,
Karl

