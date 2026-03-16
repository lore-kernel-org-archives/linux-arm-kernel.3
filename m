Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABDBF013D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V96CIUlR+qKpqcsbJ7QQgPxxBdQqkfPBggaGNnMwS4w=; b=sDZv7DvattXHi9ZP/B/kis1RTI
	O0WwiuA3sMn0MaQrl39pIHZaaV1jXzEQfrW/2Gn3Ce+Ogt5DJOZLST4cjaCQrLtxwg9wRcJJdkztk
	B1eVOTE62vOP8SxGC1zH+XC/9mFXYwNVlLq9uySicIhycmmbr64VaDOSrY+p80rQ2izyD8vR5+Ijs
	TveURh+/DtAI/vZ2734RzpWiY5iopDMYnNCk6qCik9YZ14PsthhR4g5pmFdPo3i/3HZ/0Tey0csib
	ZGzAn9g0McbRztGqqLBP8jxn+yeoFcH/8MxiEOAtyb3rsGimohYEgVK6k0H6wRMDSV54FGHE2PR18
	nDkSgMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23TV-00000003Z4Y-3Rrk;
	Mon, 16 Mar 2026 08:38:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23TS-00000003Z3o-1Pp6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=V96C
	IUlR+qKpqcsbJ7QQgPxxBdQqkfPBggaGNnMwS4w=; b=hjpgeXH2qeJdxe0TDWI9
	5itL1/4hc9D2a+V4RZhgtiB9CWGMEHN9LA7J+EoA5+baPk8u931NSMNhU3DZPRRC
	rg8V5cjBbEgBgcQOcA3YNSZNVKzGPZo6C0ytU1lBlga9C8r6ycobgEnybDjcv8iO
	Xtf7m2JOUC+hCz4oY/iSrfpDW9ZNvwSYJkuYIAMpHSA+XVdAGOPpaOI6acGak1m7
	n63NcrXCvaq/G6tI70iIXARunUvgyhZDU68XVEoZnxCwcOrK3ebrjkSYHylQmRla
	g2f5ZxyWE3AcVqSgCZlMP4v75LsEkLRwnStHk4T0oN8cDzzPYkhkeMgGudo3Aj3C
	Hw==
Received: (qmail 1334043 invoked from network); 16 Mar 2026 09:38:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2026 09:38:48 +0100
X-UD-Smtp-Session: l3s3148p1@+MK+JSBNsKQ+XdJ7
Date: Mon, 16 Mar 2026 09:38:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 01/13] media: saa7134: rename i2c_dbg() to
 saa7134_i2c_dbg()
Message-ID: <abfBkg8YpDKIlOVu@shikoro>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <20260223-i2c-printk-helpers-v2-1-13b2a97762af@oss.qualcomm.com>
 <76fd11b2-7789-47c1-a832-12907155ead1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76fd11b2-7789-47c1-a832-12907155ead1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_013855_270011_CFABF485 
X-CRM114-Status: UNSURE (   9.75  )
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

Hi Hans,

> Do you want to merge this through the i2c subsystem? Or do you want me to
> merge this patch through the media subsystem?

The rest of this series has been dropped in favor of a different
approach. I still think this single patch here is useful, so if you
could pick it up, that would make a potential future change easier.

Thanks and happy hacking,

   Wolfram


