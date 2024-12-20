Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF298E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 19:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olddjwhjXo1DqV4GopOeuanmM4eDV0mXoyDwwruYnUU=; b=Jyvy99dQSlvnxQZkCmrxw23vR6
	977Qygmw9s362FkzDsALlYYn8AV1VE2Cr7fGCgZZFMiqHuj3CH9jM9uCXc6ragq5iSizTL2BMSAHu
	5vZNO3/+ign0e6SJzhPxtgaOffYN95OmosU30UqNYUEdLX9Se3SIOTBMreDOfWeWP4n3wlUQtqbK2
	9jj2I8zW6nfTqt2wesT5hkuhBuXVjVAuCpupNq/63WgA97z3ZEPXhJvIdjGSde7y06l0kkEeXfZ0n
	jmUCXNVTB7rI7YChVZUdz+vDaIG39TiCPW9+bUPIrbETS1gyJOqOZYZJuHOTb2e2jqgjbTpFgA/8+
	GGCYdckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOijT-00000005xAR-3b8B;
	Fri, 20 Dec 2024 19:32:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOifB-00000005wHW-0ZZ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 19:27:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-216281bc30fso25478415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 11:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1734722871; x=1735327671; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=olddjwhjXo1DqV4GopOeuanmM4eDV0mXoyDwwruYnUU=;
        b=CHegx0ju0iXKAnF20XYDP8wKrxT9kmTmcZyw/+ew/LWXcf4aLbaGpeIQbBV2uSPN/u
         /AmABFKg7/1mRGLIWwHFs4XOrzl4JUfjvJzQvgE93QboHkZF+vS0z8j3DAetnafdcjm9
         pxoU0WKA2lXA0WVQpc+sMRREcDlF6ZR4brPqQ4W/FXmTNh/2Haz53BHwQwQLdn3VTObc
         9EqkOc5Nn5dQrSRMpmfiwLdtr2+4ZupQcJ6NcAnYQEjUHANz4YxmNhlnV+0aPMn0Hwez
         CxWSl+xR4k80Xtq83vV20QJqniseG7xyTnY1YjKBGRtEsEl96ILSuub7oF6HVa2WTc6K
         6NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722871; x=1735327671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olddjwhjXo1DqV4GopOeuanmM4eDV0mXoyDwwruYnUU=;
        b=wsyaetXDwG5TMFOl2FnGI6rlKN+QlZejBG/4feYnPSoETXG3uX8tA6TzlmJO8N0flc
         te0xahX6dbt70FoYdK5bTI+8bN6jlt9HlOnTvs7zga+su68hHttf3ECMHdCE5aIIujmx
         BwVYGiPFezUnkjoFEYHycDMFuae4ujc/Td8ALP2Wzednd8Rx5D6i0N8RUlwAMtJoe0fR
         qOAj5JUaYUUFgO2wQSsMldIe6MzcJdDtSO3tYKM/T2uw0NL+HXqJ9TLbsiNP8DGuwJ2P
         bevUi/tXwbKsLUAOj5aAjMIGs491c3qSPt+VFvVCRrpENbfxfGw/pt6eAWWEaMZXhdAV
         bW0g==
X-Forwarded-Encrypted: i=1; AJvYcCWcBja0RuGcu7efHsuxB9IbMz2e3pyqFPpWKRj1h5DfT9584f89ll0EmvB4YDupsd+V+PguPPQpQVfCBG0socfb@lists.infradead.org
X-Gm-Message-State: AOJu0YwqJ1tELFKyolOmQ1ZhDCzARA3Qy1RMIjcPvUWQ0SY2NpDqvKfn
	9TqHSXSRE0oOOyGx5pPxVCCpAHUBaejC9JZhrElkdVLJhbGttmMlR1kwx5LYsxw=
X-Gm-Gg: ASbGncukggTzbi2lFij4Kl5wxM0xMwiNzqyF8a/oXn8JKyy/uAD68bMkPi+QU6ZacLO
	EL0oe568/k9TEL0Tt23CFzd+rXVNlq4Yof7N7LX1a5CTWbpL7Q6HTtavE/s4ZMl72ywukEWzymU
	ja8+lJKTkjvlOA8XS7s7JeWy4xzBns/6kFNHE++HDoZZdggLb1L4rGWm3urg/Ll/vNi4PWp076/
	smtvogy9tLeQ2qyprv/GhES1bBOys1wZNIb8LhSSMfmu73O1a3AytXrC0G0Vnw5PGR2kSHtM6O3
	m7YzxAqilBf5tR8lMyi8Qw==
X-Google-Smtp-Source: AGHT+IE5WE5VjVzI8McvBS1EPUk/D6S0aLKI1p8PJ/8RcVaqoOiUvLB51cQP6j5D7CMD/aylGcndww==
X-Received: by 2002:a17:903:120e:b0:215:6816:6345 with SMTP id d9443c01a7336-219e6ea278cmr54424305ad.16.1734722871527;
        Fri, 20 Dec 2024 11:27:51 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde37sm32680745ad.131.2024.12.20.11.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:27:50 -0800 (PST)
Date: Fri, 20 Dec 2024 11:27:33 -0800
From: Olof Johansson <olof@lixom.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, soc@kernel.org
Subject: Re: [PATCH v2 0/4] ARM: config: stm32: Remove useless flags
Message-ID: <Z2XFJeMgUdaeAqHS@chonkvm.lixom.net>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
 <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_112753_443418_FB6837C5 
X-CRM114-Status: GOOD (  18.91  )
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

On Fri, Dec 20, 2024 at 05:47:01PM +0100, Arnd Bergmann wrote:
> On Fri, Dec 20, 2024, at 13:55, patrice.chotard@foss.st.com wrote:
> > From: Patrice Chotard <patrice.chotard@foss.st.com>
> >
> > Running "make savedefconfig" highlights that some flags are no more used,
> > remove them.
> > Remove some flags to reduce the kernel image size as STM32 MCU's board
> > embeds low amount of RAM.
> >
> > Changes in V2:
> >   _ squash patches 2-7
> >   _ split patch 1 in three parts and add epxlanations about flags removal.
> 
> Looks good to me, thanks for the update. I assume the plan is to
> have this in another pull request rather than me picking up the
> patches directly, right?

On that note, I would *love* to no longer get patches into my inbox,
and I'll start to kindly request the senders of said patches to take
me off the recipients in the future. I'm not actively part of the soc
maintainer group any more, but I'm guessing that the others would benefit
from the same.

STM32 already has a maintainer, so there's no need to send these directly
to the soc-level maintainers, as far as I can tell. And certainly not
in the to: line (vs cc), at that.

If there's reason to send them directly, such as the platform maintainer
being unavailable or the patch being urgent as a fix, a justification
to make sure they're not missed would be useful.


-Olof

