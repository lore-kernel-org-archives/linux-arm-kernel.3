Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AE8CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kse27neqs7TZ5sTIdJhbs0CXmugDWDcv4gD+1oQQ4ac=; b=oxz1cfrzJwK6FLYx6tZNzLCWUf
	f9PLNLfbmCgSUA5U66DunXCgQK+PBj2yD8tRamlrb2YMyfrtjrG3VRca7PpPgHeYhuZYv0fAlknhL
	StNcuex0S7cXHGa2GpLjClekLr47ezHyuyV+HdK0fxp5UUG9r90ohO+V35/rhJgTmBPp/22M5lypY
	1q4srAfWD6hzDlgEFfCYD3XGW77cyiX86VAH8oM6UtmA0Jv6IyJ8aRwS9zZ0/3K9COEOMQcJ1Xjhm
	33ctgvJ8PU6T+4LoVyeGWeG5z+iVmnAEi4zGS4BPAzO/yN/32TY23RlHHp8ZlTzuI6FJbAqA9hLBQ
	OCgnfPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8I0-0000000DSA1-3lGq;
	Mon, 01 Sep 2025 17:25:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5A4-0000000CnoS-37F0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 14:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Kse27neqs7TZ5sTIdJhbs0CXmugDWDcv4gD+1oQQ4ac=; b=D1pqgoVBvHdg8z7EDJhnb9e642
	FgWYSQcHm0VKFbxr2LfghZ1fjuBcH3LhcRUQLWhbb2kRMsK7V6bk2nkebR9XtTvdsVkgt+7Z8ftc8
	EGrDjBYnowozMP+YHaFpuutCJvT0LX/5pmh9Ged4QG4fP6wpNLRO9AAE7OCOmysZiEkg5QZdn/UmD
	9hRazggLCNNMGgz1Ed9MYFcvVLmBWpiX95gxP9DMF8oU5XeNh/UBHffZZWuE+S3ShssJU35+9f5P3
	yGt/aeLchBRITtReWvCi3rxi8oB9tvgU7pGwW829lzzo3Bt+oTCvR6Haon2gitd7nKBusLHakdzLt
	Osi4Y87Q==;
Received: from fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.199.210.3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut59z-00000003l1a-3hxV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756735527; x=1788271527;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Kse27neqs7TZ5sTIdJhbs0CXmugDWDcv4gD+1oQQ4ac=;
  b=IeHKIisdRCXoZ5+V441l9oXqa7nrbEkpfLyaC0umnYkFL/LbuVXeiFnj
   BhgsLae20Tlq1w4DSiqC48YHBv+GVqku1yOGfD0fdk6/0lZGbRbuiGVWP
   63r5/nUvd6FMLgpueoH8UgaLfdkjnUSJeOhhv3YaOBZo4m7adb83Tpa7G
   lfEYZRYD4j3yDKoylKH9GKksATNVzCcNeDSd78BLXHlvXyVtH2rIYdW5r
   V7xIJkNaGSvlKMF9+nKvGVtRSIK2LFwVGLqshvlOG5z/KI1SM1ErRbR2q
   tT5PMXQRYJ+SO91KGf1UA/nn9gscfAZJhw0SoT80PRAyGPEepUT8AgZWr
   Q==;
X-CSE-ConnectionGUID: 6cHdMLo7TCuPNE/i2oSWAA==
X-CSE-MsgGUID: 9a3n9BLESJaLUrTeRH3vhg==
X-IronPort-AV: E=Sophos;i="6.17,290,1747699200"; 
   d="scan'208";a="1361090"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 14:05:17 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.234:5495]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.18.194:2525] with esmtp (Farcaster)
 id b74a8fdc-df20-4ffe-a94c-ca7bfc8d3d2d; Mon, 1 Sep 2025 14:05:17 +0000 (UTC)
X-Farcaster-Flow-ID: b74a8fdc-df20-4ffe-a94c-ca7bfc8d3d2d
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Mon, 1 Sep 2025 14:05:17 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB004.ant.amazon.com (10.252.51.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 1 Sep 2025 14:05:16 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Mon, 1 Sep 2025 14:05:16 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "lkp@intel.com" <lkp@intel.com>
CC: "ackerleytng@google.com" <ackerleytng@google.com>, "david@redhat.com"
	<david@redhat.com>, "Manwaring, Derek" <derekmn@amazon.com>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Roy, Patrick"
	<roypat@amazon.co.uk>, "rppt@kernel.org" <rppt@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "tabba@google.com"
	<tabba@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "will@kernel.org"
	<will@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>
Subject: Re: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
Thread-Topic: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
Thread-Index: AQHcG0lxZt1T5YHk+UqqKLGu1cJJ3g==
Date: Mon, 1 Sep 2025 14:05:16 +0000
Message-ID: <20250901140515.15769-1-roypat@amazon.co.uk>
References: <202508311805.yfcdeaFC-lkp@intel.com>
In-Reply-To: <202508311805.yfcdeaFC-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_150528_114182_884F5EB9 
X-CRM114-Status: GOOD (  11.15  )
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

=0A=
On Sun, 2025-08-31 at 11:26 +0100, kernel test robot wrote:=0A=
> Hi Patrick,=0A=
> =0A=
> kernel test robot noticed the following build warnings:=0A=
> =0A=
> [auto build test WARNING on a6ad54137af92535cfe32e19e5f3bc1bb7dbd383]=0A=
> =0A=
> url:    https://github.com/intel-lab-lkp/linux/commits/Roy-Patrick/filema=
p-Pass-address_space-mapping-to-free_folio/20250828-174202=0A=
> base:   a6ad54137af92535cfe32e19e5f3bc1bb7dbd383=0A=
> patch link:    https://lore.kernel.org/r/20250828093902.2719-4-roypat%40a=
mazon.co.uk=0A=
> patch subject: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP=0A=
> config: loongarch-randconfig-r133-20250831 (https://download.01.org/0day-=
ci/archive/20250831/202508311805.yfcdeaFC-lkp@intel.com/config)=0A=
> compiler: loongarch64-linux-gcc (GCC) 14.3.0=0A=
> reproduce: (https://download.01.org/0day-ci/archive/20250831/202508311805=
.yfcdeaFC-lkp@intel.com/reproduce)=0A=
> =0A=
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of=0A=
> the same patch/commit), kindly add following tags=0A=
> | Reported-by: kernel test robot <lkp@intel.com>=0A=
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508311805.yfcdeaFC-lkp=
@intel.com/=0A=
> =0A=
> sparse warnings: (new ones prefixed by >>)=0A=
>>> mm/secretmem.c:155:39: sparse: sparse: symbol 'secretmem_aops' was not =
declared. Should it be static?=0A=
> =0A=
> vim +/secretmem_aops +155 mm/secretmem.c=0A=
> =0A=
> 1507f51255c9ff Mike Rapoport           2021-07-07  154=0A=
> 1507f51255c9ff Mike Rapoport           2021-07-07 @155  const struct addr=
ess_space_operations secretmem_aops =3D {=0A=
> 46de8b979492e1 Matthew Wilcox (Oracle  2022-02-09  156)         .dirty_fo=
lio    =3D noop_dirty_folio,=0A=
> 6612ed24a24273 Matthew Wilcox (Oracle  2022-05-02  157)         .free_fol=
io     =3D secretmem_free_folio,=0A=
> 5409548df3876a Matthew Wilcox (Oracle  2022-06-06  158)         .migrate_=
folio  =3D secretmem_migrate_folio,=0A=
> 1507f51255c9ff Mike Rapoport           2021-07-07  159  };=0A=
> 1507f51255c9ff Mike Rapoport           2021-07-07  160=0A=
> =0A=
> --=0A=
> 0-DAY CI Kernel Test Service=0A=
> https://github.com/intel/lkp-tests/wiki=0A=
=0A=
This is the same thing Mike already pointed out (making `secretmem_aops` st=
atic)=0A=

