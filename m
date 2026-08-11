Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAEDC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:From:Subject:
	Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=f7g/g32kJcsQBACBhpVlNkw7qk91UwNmsYCyqe4PR0g=; b=agUm9MjjVjzA2/881cuaa1mxno
	csJAkFjgns3KFXNU99rK9ynXriHhlepRs0dZBMH+1o2c88VVMjCopOQ4G/sRf4VErshtaqCkLDuJV
	sj/cmVHuLE+Braq8jlx1CsSyVIRdwkbD1u8JHlalHdltbkBaMzR9zNfZtt+dt5YbKhzxw2+J9pzRE
	WXab8v4mQqsPAnDmBKEPHq3F3nP3C9JgZyJ0VdfDXGDv9OOKVoo3PRCKIlC2iYbjkLuy9J06z0VJL
	2ElZmpKLw1bF+RV0/oqJbjeonz0ruVDMRVuF/6Ppt/3drdxjKy1shoXAbNAe29RptW/W/6UWid6bz
	xpnT0e0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjCB-0000000DmyY-2eCM;
	Tue, 11 Aug 2026 09:54:55 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjC7-0000000Dmxe-0S5q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:54:55 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260811095443epoutp0304c3cc42fd45b20d8b36cb1f7f385414~Kt5w_e7TC0813408134epoutp03g
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:54:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260811095443epoutp0304c3cc42fd45b20d8b36cb1f7f385414~Kt5w_e7TC0813408134epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786442083;
	bh=f7g/g32kJcsQBACBhpVlNkw7qk91UwNmsYCyqe4PR0g=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=QTJLqr4xz5s2r9iJlNWfKu4SR4AeMc5WPryCtG7jRMWKWFl93lt6blyEBLUavTXEN
	 GXXfawUx3ftBoWVdjLr+Sq+R7Uuh+Hq0realiXp1AbXJrmsXzSZCq+gcQoDiOOaM4w
	 KPFZ4rrhFk0rDdqODMfFQ2nNMo8bQOmRo/H/Z8fU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260811095443epcas5p20d81d46c89f9f8e507c54b6fcf281087~Kt5wUN2eH2361623616epcas5p2J;
	Tue, 11 Aug 2026 09:54:43 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hK6RR16Wbz3hhTF; Tue, 11 Aug
	2026 09:54:43 +0000 (GMT)
Mime-Version: 1.0
Subject: RE: [PATCH v2] arm: backtrace-clang: fix wrong sp usage for
 unwinding
From: Maninder Singh <maninder1.s@samsung.com>
To: Nick Desaulniers <ndesaulniers@google.com>
CC: "ardb@kernel.org" <ardb@kernel.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "nathan@kernel.org" <nathan@kernel.org>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"morbo@google.com" <morbo@google.com>, "justinstitt@google.com"
	<justinstitt@google.com>, Onkarnath <onkarnath.1@samsung.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Rohit Thapliyal <r.thapliyal@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260811095443epcms5p238a0ccbc4e42db5355fb6f181ccaeafd@epcms5p2>
Date: Tue, 11 Aug 2026 15:24:43 +0530
X-CMS-MailID: 20260811095443epcms5p238a0ccbc4e42db5355fb6f181ccaeafd
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260805045522epcas5p39659721ef26a447b71e860c2990a60c0
References: <CGME20260805045522epcas5p39659721ef26a447b71e860c2990a60c0@epcms5p2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_025451_642927_53496DE2 
X-CRM114-Status: GOOD (  13.82  )
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
Reply-To: maninder1.s@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> Thanks for reviewing the patch, Actually I was not aware that ARM patches
> has to go through this way.
> Maybe that is the reason my last 2 bugfixes are also ignored from ARM side :)
> https://lkml.org/lkml/2026/4/27/265
> 
> So I was checking the way and created account there to submit the patch.
> I will post the patch to suggested site today for further checking.
> https://www.arm.linux.org.uk/developer/patches/

uploaded:
9490/1 	backtrace-clang: fix wrong sp usage for unwinding

https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=9490/1

Thanks,
Maninder Singh

