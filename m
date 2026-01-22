Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76670D6CFA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 18:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kh3llz159zOHhYjpa3DZZY1B3AUjD9TXdEvBojqy5mg=; b=LcspEdX6iZ8GOOdUoDyQWy5n0z
	OlHNhUK+aLG7ooH83hEeOIooP6F4ZOLUqB7MzvZdEBAAWD4N9mpxLRaOorwV0QczcYstni9pj0s0M
	Mpck8cA0fnj714RjPpu3CBAJEW/JMzb27rmhNAMwMx4M3E+Qug4HUk2o3S7ncqAnpygOfCK/n+NG+
	lbqlJk4mF4zQTFe7NNEUiCGflPqXKgDAy9GB9hYBN5nzg0L7dX017NmHubhcZB+Jf1iswp97roDun
	WirpD2yFH3MePfI4N8Qg/lWOQSS9CO13HadmOEoxwx3X3XrNxHY8p39Me8wHAeMIi1TiNbjxuKZfG
	ZBdhJzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizbr-00000007eHz-0MGV;
	Thu, 22 Jan 2026 18:40:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizbo-00000007eHW-45rT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 18:40:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a7aa9efc55so8882415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769107244; x=1769712044; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kh3llz159zOHhYjpa3DZZY1B3AUjD9TXdEvBojqy5mg=;
        b=G96tA+bSSJowuHCvyv5+M0//Q5J7MeF4M7uYF0FXpokMkpj3LKxZDJdKupkJtxq7xX
         WA0euVBvebtgQNmNN9jQZ+9MTFC97RnB9fGtBfEQWPnCWNfmDQWXG6uH2a4lpK43YEjY
         uUmgHFn1eS1XkBX1eD2kvbVe3AECL5EO+r0oKyNcxtJ1o49kn3ES0xnLcIrnbsK1NB1c
         rFzXU1VWwS0xt3LI4ZoOD0l9Wh8xwEcIo79WJ5ndzcau+PHRIK7Ld9QJBG3IUUVAneM/
         yQM6ilma3dofdFFyEStbDlAZq+Z5NnEXidEeks69QqtI4XwMhh1EJ/MqGJvDT4QEfqBQ
         +CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769107244; x=1769712044;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh3llz159zOHhYjpa3DZZY1B3AUjD9TXdEvBojqy5mg=;
        b=c2m1wmd+iXufi+pIvK0PqlDnjcznGYs8TUN/mDNby4ij6oXuOf1zWITfC+tQI+3jBE
         lof8DJ7Dfz1W2qU5FNhO1LMGrGnO2jTbwj17d97O86rMCBImHxMAoa90iisTs9UcVS+6
         0Ra8giFPvgYhKlrj6tEyoRiTwzhDDUs5SBNJZgyzQZFstXPKow2gr34MbrhW3zFAXoL6
         p3Cfy9PwJ8DSZod5A1yXqP1x3uYhn8UpJFQdKtAlJEUdOiVzfoSTyOlrLIXv5dpKPwPf
         tsS6OXqftB4lCo9KDAiyRSXmWhZvwIhKMQ8YUioIlgARa4oaRobisaXsWQUc/ziv4ni7
         0q1A==
X-Forwarded-Encrypted: i=1; AJvYcCWAFwb/YZ5P/EJW3p6vDLB98zseq5cIU+lv6FoGq0Ig/fQMYoqR9vM9r3sTLuWDSDW76hymSqNlNDsHUI7AUlqq@lists.infradead.org
X-Gm-Message-State: AOJu0YzHrp5+idZuiWqRCcC0tVYwdv7gqg6uLo+LNfvlsLqc9ZKFkVSy
	7jVNv8CLrhugidWNyQECwhSEReD065W6RGQFewYPjvuYNbja1IWnGhFZTWGJlePeiys=
X-Gm-Gg: AZuq6aLc+MDSTBSGEP2NkB9hD5IplcxexGReVvNfp4Dcj6nKMtM11qklZHO+9Ghd2Wh
	UI9A/0v/8zmGNsinl0PNzEZdKLwHWVW3lVvPmMnGfqFA8NU/GgNNUxDFEfJiA1pwoBCQ74cPJFE
	Y3BDbnTg5+LOWBoOSqzBO/iLk0hKJZGU2uUVKnP31ig+enqBppoSmi0VzRT0SGJtrLRPLOJC3ey
	kyA08rugjloeWHMr2sMZYE76ABPDGAdAK5qePMvi7fWLN21ljy9pHwsDjP1rYMbfQT3RypBoCFz
	73rhZk3qAY8EowwkL7g7L+iEXJhWLl0avYUIdy/XRSJ7UmJui7vk3s51qUyrn0Wpd+39QUjDL5d
	NHJb7Av0mmUni/6F4We+jsZVCg22iUbfXrdRdr08T5FVo60VKfOD8ePfYMz+3CWc5VCH3e6/JRr
	THjclOSg6o
X-Received: by 2002:a17:902:e851:b0:29f:1bf:642a with SMTP id d9443c01a7336-2a7fe43ee93mr2949225ad.12.1769107243616;
        Thu, 22 Jan 2026 10:40:43 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7b03945c7sm52280935ad.102.2026.01.22.10.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:40:43 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: omap: soc updates for v6.20
Date: Thu, 22 Jan 2026 10:40:42 -0800
Message-ID: <7h343x7aol.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104045_019265_D32A2FEE 
X-CRM114-Status: UNSURE (   6.99  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.20/soc-signed

for you to fetch changes up to dc717e24deb4e626f4ad4896dd722815ef32311a:

  ARM: omap1: drop unused Kconfig symbol (2026-01-05 12:11:02 -0800)

----------------------------------------------------------------
ARM: omap: soc updates for v6.20

----------------------------------------------------------------
Randy Dunlap (1):
      ARM: omap1: drop unused Kconfig symbol

Wentao Liang (1):
      ARM: omap2: Fix reference count leaks in omap_control_init()

 arch/arm/mach-omap1/Kconfig   |  1 -
 arch/arm/mach-omap2/control.c | 14 ++++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

