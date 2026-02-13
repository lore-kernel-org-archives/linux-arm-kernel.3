Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD8DEF99DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 22:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKMNigztuqTGlg9wJdp0fxp4ayo1kIW0ikl8Ufv8adQ=; b=1gWitlMuCJdSVZjQWV3qBy7fJ4
	QBW0KN1o4wteyn0LUgMvhCY1sTNTI7W1Yl6uTRhK4hpca4XDrRMWUIC1Y6rSVo7DwT7clKd1CrcDN
	t7SXofwia8516Yogz2k5V7n/JYS19LawxwapWmZzM0aAMIHiDCrPVwLuLISXSl+Jt8cThNp/oVVFN
	gMPYmeNRkE0tPWdV+0/YCUGy/EYg7xwxcOHE3ge8qz0qmtMYOEBqdyHEzHgYYT71a+OtCF880/WQH
	E67+zDOvKT+DPlJClFtXhCp6SfETWz+mhj8u4g3HwDL4m/nrw9Dpzkqa4kL7rPGel5W7fGEk43XvQ
	zL5vXbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr1Hp-00000003yRW-3PTn;
	Fri, 13 Feb 2026 22:05:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr1Hm-00000003yR4-2lYB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 22:05:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vr1HO-0005gD-9k; Fri, 13 Feb 2026 23:04:50 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vr1HL-000e8h-0S;
	Fri, 13 Feb 2026 23:04:48 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vr1HM-000000008cL-1XIN;
	Fri, 13 Feb 2026 23:04:48 +0100
Date: Fri, 13 Feb 2026 23:04:48 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
	Matthew Wilcox <willy@infradead.org>, vbabka@suse.cz, akpm@linux-foundation.org, kernel@pengutronix.de, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, ilias.apalodimas@linaro.org, jan.kiszka@siemens.com, 
	masahisa.kojima@linaro.org, spu@pengutronix.de
Subject: Re: [PATCH v2] tee: shm: fix slab page refcounting
Message-ID: <252s4lfnujhrl3bkqm3xwatdkcdd3tfge3e6fla6f2llq4szjm@xltjvpqjgffn>
References: <20250325200740.3645331-1-m.felsch@pengutronix.de>
 <Z-Pc6C1YUqLyej3Z@casper.infradead.org>
 <20250326110718.qzbwpmaf6xlcb4xf@pengutronix.de>
 <CAHUa44FUK_73oKSaqGdiPqB3geZbTNDFsC1Mh=KN3YPWr9=7gQ@mail.gmail.com>
 <Z-TXMIXzaro0w60M@sumit-X1>
 <CAHUa44HEsMkzQHZZufdwutQyZRtig6e0qWomhwgDZAhy2qDyhg@mail.gmail.com>
 <20260212125830.jfwos3flga2l5uwk@pengutronix.de>
 <aY8N90jMp25bBZhi@sumit-xelite>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY8N90jMp25bBZhi@sumit-xelite>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_140514_705480_6D9440C3 
X-CRM114-Status: GOOD (  29.07  )
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

Hi Sumit,

On 26-02-13, Sumit Garg wrote:
> Hi Marco,
> 
> On Thu, Feb 12, 2026 at 01:58:30PM +0100, Marco Felsch wrote:
> > Hi Sumit,
> > 
> > TBH: I was hoping that you will take care of this since you're marked as
> > maintainer for the tee-trusted-key and we noticed the warning with 6.14
> > and still no fix available :/
> 
> Mathew did suggested a fix long back on which everybody agreed but

You agreed. I said that the current TEE API also allows non-slabed based
backed memory and therefore I don't wanted to send this patch approach
and instead asked you to do so since you're the maintainer and fine with
the change.

> didn't got enough attention from you to test and report if that fixed

Why should it get attention from us? Maybe we do have different views of
being a maintainer.

> your issue. Since you insisted further, I have created a formal fix

Why is it our issue? It's everyones issue which uses the tee trusted-key
driver.

> patch based on that here [1]. Care to test that?

A colleague of mine is going to test it and will reply on the patch.

> [1] https://lore.kernel.org/all/20260213113317.1728769-1-sumit.garg@kernel.org/

...

> > I checked the code once again and figured that we could drop/replace
> > tee_shm_register_kernel_buf() with tee_shm_alloc_kernel_buf(). I don't
> > see why a kernel driver needs to tee_shm_register_kernel_buf() in the
> > first place, maybe this is legacy. The only users of
> > tee_shm_register_kernel_buf() are trusted_tee.c and tee_stmm_efi.c.
> 
> No it's not legacy but allows for efficient memory reuse within the
> kernel as to not create bounce buffers to share data with TEE.

To be hones, there are only two driver using the API. The tee_stmm_efi
driver can do the alloc during the probe(). The trusted_tee has to use a
bounce buffer, yes but how often do you assume that (un)sealing and rng
ops have to be done during runtime? This shouldn't be a overhead at all.

Therefore my suggestion would be still to drop the internal kernel API
and only use it for userspace pages, where it could really matter.

Regards,
  Marco
-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

