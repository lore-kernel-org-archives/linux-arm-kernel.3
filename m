Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8988CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTRMdhpVvZM6ziaWR/olIUECYo38sNOd9KGNsVaVt6E=; b=DRQruqlpKTwFaWl0Ep2c6RNtXD
	xpUNlBhfkcZSqmnY24NZpSRC62wtRdEBs8oQXfWzZ0BVbRqLc3B1cq9sjvzqz8yk93OvmYGLaG9Ds
	zGfUXXNDUgEY4sPGo0sdQ7QczdKmGQkRqQJ85aXo8JQGRzc8RwhM2CBSXROBQvl0KlejFkMcN8a8q
	rWsRW1SbcaloKcK6DC3Tr+VVdmSZ4vMnzZvn1rm0TK0w5lO0Jhv7wCpIA6jpqT0xGUWsYeQoPFrJd
	Ny7Un4/uDFnnzOcoCH2TgtymeyuUBCPfI8N2uqlUC51v+NIJ0c48j4k2gbok6akIlTbLMSNTr0swp
	om8K1QeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmXN-0000000B9f6-2F6I;
	Thu, 10 Jul 2025 08:21:49 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlgZ-0000000B0Gy-10Cw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:27:19 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250710072710euoutp02d77dabeeeceeccc6312ab92208aedc25~Q0ymHZyyW2814928149euoutp02I
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 07:27:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250710072710euoutp02d77dabeeeceeccc6312ab92208aedc25~Q0ymHZyyW2814928149euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752132430;
	bh=oTRMdhpVvZM6ziaWR/olIUECYo38sNOd9KGNsVaVt6E=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=CcOZGnCIrleveyg8c3rkylM7kODEMB5dkcxXKpnsK3/cQ1kRBQw9dpILw/FQNL9oJ
	 Rm1aIO1o0WVqOaHokijac1CY8O88tWqLgURm4u7q03g5DZ69X1vt8GyKt7XlgIn00M
	 soKB7QH7o1C0LjMpaNIfza92/e0ozGgtdAkaENes=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250710072709eucas1p2631d5fe8d35d10f7de05bd5ceb8ce5bd~Q0ylbGids2385423854eucas1p2Z;
	Thu, 10 Jul 2025 07:27:09 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250710072707eusmtip2c499c55105ba1e1cb1cd664e35fedc38~Q0yj0B6or0472904729eusmtip2T;
	Thu, 10 Jul 2025 07:27:07 +0000 (GMT)
Message-ID: <e0f09c5a-1039-4d16-93c4-ada79929b8e4@samsung.com>
Date: Thu, 10 Jul 2025 09:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vdso/gettimeofday: Fix code refactoring
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Vincenzo
	Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
	<frederic@kernel.org>, John Stultz <jstultz@google.com>, Stephen Boyd
	<sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Richard Cochran
	<richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>,
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt
	<werner.abt@meinberg-usa.com>, David Woodhouse <dwmw2@infradead.org>, Kurt
	Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, Antoine
	Tenart <atenart@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250710084337-0c82b93c-85f2-4305-95ba-8cb14042aed2@linutronix.de>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710072709eucas1p2631d5fe8d35d10f7de05bd5ceb8ce5bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250710062301eucas1p1b61431dc31a5933087b45c246866fb17
X-EPHeader: CA
X-CMS-RootMailID: 20250710062301eucas1p1b61431dc31a5933087b45c246866fb17
References: <CGME20250710062301eucas1p1b61431dc31a5933087b45c246866fb17@eucas1p1.samsung.com>
	<20250710062249.3533485-1-m.szyprowski@samsung.com>
	<20250710084337-0c82b93c-85f2-4305-95ba-8cb14042aed2@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_002717_309546_86329FA5 
X-CRM114-Status: GOOD (  13.36  )
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

On 10.07.2025 08:45, Thomas Weißschuh wrote:
> On Thu, Jul 10, 2025 at 08:22:49AM +0200, Marek Szyprowski wrote:
>> Commit fcc8e46f768f ("vdso/gettimeofday: Return bool from clock_gettime()
>> helpers") changed the return value from clock_gettime() helpers, but it
>> missed updating the one call to the do_hres() function, what breaks VDSO
>> operation on some of my ARM 32bit based test boards. Fix this.
> Thanks again for the report and fix.
> This change has already been folded into the original commit by tglx.
> It should show up in todays -next tree.

Okay. I got no information about that, so I decided to send a patch just 
in case.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


