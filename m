Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764BBCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 13:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dHPPdGK1dXtt9f7hQ69cCKPbBtNi3yHfXrWZHFelknw=; b=LVFRVuelQxFwulTrFeHuCwN3vE
	VJVHGpzY8+HUUmljnzNjLZ8JxGqEReapIUpp47wUmpMQ8E61k3ZHjLY4JyJUw+lcp0+iSNKDUM1oe
	VETrSOYHWngJa+0+2mXEyuGoamlK+5ECNmxoqa2MUvWIPoF8fktrm2VvMBRe+Vfkg7lImlASUEe6h
	tCtYc8q+kI2csLdc1NYIwisUzgBz50HrUU7b9KfoaJkacfwtusvRrsPeZF2eQoRxp655ykZjEwJU3
	cois3miEyDxa73BgfXj+02ApAsiLJwUz7VgUg5YJJmAGJLvG58ci6Ibxt9pOoh8ELI1246ArkZtOJ
	i+UwkDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOsw-0000000CLFt-0Mu1;
	Sat, 13 Jun 2026 13:58:54 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOst-0000000CLFX-288M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 13:58:52 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso2641759e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 06:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781359128; cv=none;
        d=google.com; s=arc-20240605;
        b=OazGHXVIM0qeVzm+PPPPAHs1gzINcRD4upmGkuAKU8ws25eDE8Jc2pFRpnWOxF4n47
         7AucO3Z48FIBKoBgFsckgx75p2DFZFlLbfp4Ih3gLxJLUTmzloeLlnlqTbH9EJaM8gp2
         likQ3ebZvL8wYxNl/5jiEOXCDf4VLfFqNCcIQlY0h0GCPl9Gj+tzLePiMr9PfRfym3n0
         aiLsM48L/4vAHLyZQAiaihV8HKv9Tzarb3C7RfBuxQYKTNrn9Rxjn6APsTVTi9UZIMW4
         9oYiWlyA2N3vJ8nJFXMSwLjlrKyM5cY/COg/65wSNMpToLfRZVpaWPC1GB6MquG4R58S
         tEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dHPPdGK1dXtt9f7hQ69cCKPbBtNi3yHfXrWZHFelknw=;
        fh=vza81m6RGXIj+iRoZE7Qt65U+0DTyi+eE6ox9nMTTRM=;
        b=gE2pJLvXVAIYgWhLRTWHlKnyhp8GY1yfJXNkNhAy6hOgqjOG0hr1awKMKTSLHhq1tN
         P2fqFdGcfEsshGvYHCeYRo4xmsksdgOryBtTPigLDJsEhog2l4tVdWr5jqGtURyDWA5t
         CvHEpYbwxvu9zrlezyxaeo78/kLk6ESZaKor85yUhzgKvKtiBJbU+XM8fCBOSPMTqtNk
         4LgtU830JxQE6eE3izxefI2vPPSwVYD4qdFdEvU2d+7tUEIWvTueD7nY6qtKdyiAQgfE
         wOCrq/L3TgUcTNqVtwR5vFhAkGX6beEBm+QZlspVkKSz2DOD4pL83GlVO/kHyTFOwwko
         SD+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781359128; x=1781963928; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dHPPdGK1dXtt9f7hQ69cCKPbBtNi3yHfXrWZHFelknw=;
        b=SgUv7rNmV9r+2dDRfvIn30sW4FrYdEUXORDB97S7uhiojJw61AkBDMXUvD6rF6MeCx
         w7ROaAmBpzKY3G+QOUTvxNpNo0Ynaf76yiTu5lqDTvCXJEbuGloNGmUmnQloXKqaPhpE
         1VqhvW1BMjXLK7yM/8l3bhoK9uKq1iw4jKl7MKbtjQRNQHN3aBXIiC/X5t/6E6qpM1Lc
         YsjzajMTJLc09oNaoK4zEQJArL6YfovYhFY1RjVu2ZSi5bBrt/IwUKhDxTXg7YZ7oGOb
         /guPzd7BK6RgoUpVgci4y9K4vTJykpkEHOz7yh156I5PpO7Y7pOgEe3oWATQdYssbrKx
         mnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781359128; x=1781963928;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHPPdGK1dXtt9f7hQ69cCKPbBtNi3yHfXrWZHFelknw=;
        b=QC4kqHNFqexzT7zcSzck6A29yE/pMTr/m0OKCHt5tGNR+w3pm2i0bFxhomtn2gVy8F
         dB6ILTToDE9XgJmBZltoA1BBwbAZJ+wjkIpozJwDqBbTsYUA2O6HGzKyYL8pbMVxa8Cd
         KZ16vXaqyIcLNSu+ckNlnHM3kCGi8lA6pu+CDefBWQAxOtlAQ6v+Ud5FKwJ9uGHecDNN
         Nmciu/773omRXBHpQoDHhEVq+2OPP6yH0UMr4OfUkge7ZAkaJWc2jubtIiYrzVgEyl/4
         iv7Q9chmzlT2bdvmRON0ZhxRnxJp6sTutC22KOfVfO2gxwGO2dDVczQlXCzbQHwC9F0Z
         2++A==
X-Forwarded-Encrypted: i=1; AFNElJ9nSAKIfFr9FumOhFheSjxvi41kpwDn3lTFDAS51lOMxqMLM8l7RJalyr0RJKfiBcdYY+Yjf+y0/Ha/jFFFYDQG@lists.infradead.org
X-Gm-Message-State: AOJu0YwPx68Z4PYcUq58brTl5b3/0wYwf8GU2Bs5S/m5K+xGh6Mxp/YO
	CeIjj4st66ByuuVDvijPSgp6d2FkF8wkSApSmpnB18XQJUui6yQR8aquLi3uOAZ+nEybeRwQeug
	l3WooY3mho0hs2ax3jP27yhmx5cyh3f8=
X-Gm-Gg: Acq92OHMwrrDgUVq2wGx5JM3nNf8A0YcJFbkq0AthfPW+vSu08ADf3gls7kuEnrylF2
	HqQbIeUOEYSeKS2pT7gtq0/PUAbVanWPZGDnmeCtCRBI5m+dyBB9LOmIrlx0Z38A1tmmk+osTp1
	yNdvLrRpJfWl0B+hcVL2qYrJ4TreANHUuZj6nWmx+OxT2CeW6jvczB3PpC+X1Nsub7XpuIdHXjD
	vapZIY0Bn+xUiVEkeTDpBgvulgjCeqHQ/fIh5RL5qBDnp9HYl2AeM+H4QJoey6VzHct0OB59Sc5
	bgZlc46+hV7bHb23zGCvm4fTVw3e6vv9UiIjNT3x/8Qv/Rk1AK5r/Qyw0qnctu80N76BtutU
X-Received: by 2002:a05:6512:3a89:b0:5aa:7397:73a8 with SMTP id
 2adb3069b0e04-5ad2d6b1f51mr1543146e87.15.1781359128179; Sat, 13 Jun 2026
 06:58:48 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 13 Jun 2026 10:58:36 -0300
X-Gm-Features: AVVi8CeLiOVPoCKk7Cmem5uIarxsFiGWJssOt2XYfd-cjw1UyE7apA07XsAIA0M
Message-ID: <CAOMZO5DgENq8RU6s2CPnKsf53i=7zoBeO38m_BtV=w54hr2hgQ@mail.gmail.com>
Subject: i.MX95: EdgeLock Enclave secure storage
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Stefano Babic <sbabic@nabladev.com>, Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_065851_590835_2DA4A9DA 
X-CRM114-Status: UNSURE (   9.77  )
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

Hi Pankaj,

First of all, thank you for your work on upstreaming the
EdgeLock Enclave (ELE) support. It is great to finally see the
ELE framework landing upstream after a long development effort.

I am currently evaluating the state of i.MX95 secure-boot and
storage-security support based on current linux-next, with the
goal of understanding what can already be achieved using
upstream software and what pieces are still under development.

From my review, it appears that the following infrastructure is
already available upstream:

- ELE/V2X mailbox support for i.MX95.
- OCOTP/ELE nvmem support for fuse access.
- Secure-enclave bindings documenting the i.MX95 ELE HSM.

However, I could not find upstream support for several
capabilities that would be useful for secure storage
deployments on i.MX95, including:

- An ELE-backed trusted-key provider for the Linux trusted key
framework.
- Integration allowing Linux to use ELE as a key-sealing/
unsealing backend.
- i.MX95-specific crypto acceleration exposed through the Linux
crypto API for dm-crypt use cases.

Are you aware of any ongoing upstream or planned development
activities in these areas, particularly for i.MX95?

Any information about the upstream roadmap, ongoing
development, or expected direction for these features would be
greatly appreciated.

Thanks again for your work and for any insights you can share.

Regards,

Fabio Estevam

