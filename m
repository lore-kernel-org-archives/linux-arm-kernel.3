Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B777FD26D70
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMKc9MHd9MKGMdEe0mbvetFcSECq5KlF8/ItyQ9UOfs=; b=wMLaEVZRYGRfRhH8Rp7nsQfSJV
	3POxaqMKL9ZxkXbjIvPs4wBYHD0zEoA5483Dycs6a9I1RULDB2XHyBdY2PMG/JZqoeji6sefgqb4i
	44ZU3Q9uztq0BWuoE/Vo4b5xBvvQ/aI6yCcQf3tOom3tYypVo0aN0+pb3rUDd+G9pMolwUMQ+SiAc
	zAug1t4T/DEVeIJuvJ/aYZIB0/nQZtjC6Ne7RmOc1USdJZxd0tBpr5uyjQAZIV8fHlueQ3p982QtR
	1UoQwa9d71I0I6bpSCGklZ6TxbOkuyypaDUYmceq073Ci3LGSD1q9Sh0IIqEl+FRkP7IvxRKu1cLY
	VGHQhQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veF6X-00000002YpF-293U;
	Fri, 09 Jan 2026 16:12:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veF6U-00000002YoP-2q5j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:12:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EAB264E42021;
	Fri,  9 Jan 2026 16:12:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF07E606C6;
	Fri,  9 Jan 2026 16:12:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 919E4103C8928;
	Fri,  9 Jan 2026 17:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767975161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IMKc9MHd9MKGMdEe0mbvetFcSECq5KlF8/ItyQ9UOfs=;
	b=y8sgO60vNrvAN5ao1UXWP6frwmiiF1cnmKVMcW7QO/HxbpUAJ9DUZYz8PYoxa7TnZrgNHn
	QND0OCqd76x2H0tjmg8+G4y+EtalIPSC+KQYf8rjCNA+B5vKbQ7u4oDcUStLUPz8K94/C9
	oyRk9NcfDbOqVoQ0naI+QN+HiG8sH2m5klgIFBZj/3DQSQTfjNIQKQn/ggmyMPfbWE34jX
	CVuL3G4rcCcj1gXHvVrTXR94pzDkpKEQ64TpUMAPIFBtvXhBobJARsAvcWYmEBKq08Aajg
	6m7OKpbbmdqmn48f1azdA0ffbcXKznXdVek37fyAE5LdhLHaDG1pH4odU3nhqQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: kernel test robot <lkp@intel.com>, Rob Herring <robh@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Beno=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
In-Reply-To: <202601082105.TThX0916-lkp@intel.com>
References: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
 <202601082105.TThX0916-lkp@intel.com>
Date: Fri, 09 Jan 2026 17:12:35 +0100
Message-ID: <87qzryn4ss.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_081246_840577_D6E75836 
X-CRM114-Status: GOOD (  13.25  )
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

kernel test robot <lkp@intel.com> writes:

> Hi Gregory,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-CLEMENT/of=
-reserved_mem-Fix-placement-of-__free-annotation/20260107-211455
> base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
> patch link:    https://lore.kernel.org/r/20260107-mtd-memregion-v3-2-f9fc=
9107b992%40bootlin.com
> patch subject: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' en=
tries for memory-region
> config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20=
260108/202601082105.TThX0916-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260108/202601082105.TThX0916-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601082105.TThX0916-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem' not=
 described in 'of_reserved_mem_array_lookup'
>>> Warning: drivers/of/of_reserved_mem.c:902 expecting prototype for of_re=
served_mem_region_count(). Prototype was for of_reserved_mem_region_total_c=
ount() instead
>>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem'
>not described in 'of_reserved_mem_array_lookup'

It was a stupid typo in the description!

I will fix it.

Gregory

>
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

