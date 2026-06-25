Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606F4CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnOfNp9/ctehv6PmReGlUMeN9R8JuaY0IwGr+iGJTlQ=; b=tGG5q1rF5+LQEurkQiaa2s5//M
	/cci4HTctXBV24PLx5GKTYNWqCLgyo0gpBgIc/raatiIQejnHeRcWIV0YZ8clOikVWiuepub5/1VT
	Ks5FvX0WkWVeCnzkEYahvRmnTatbJ3TQSz6vPFj44oClZafnUOGrUklmHo6cEJZn0bBDquK93Evfy
	WpyVUSi6bqlQ493d5TtXC0GF9eopc9SP9h90aqvPbjy+HxViHsfLHm1jAIdZpgaDKJldtEm9sFlCG
	oaoV1CCC91LS0Ba2LFGp5GCW7VtpFzjuvasaonYWLtD4CZ74DqAbH7tgaxCFAglIhAXfrdotRQcHO
	bceL3qBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco6L-00000009cSY-10PS;
	Thu, 25 Jun 2026 17:42:57 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco6J-00000009cSC-0Cqv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 17:42:56 +0000
Received: from DairyQueen (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id CCE1C20B7167;
	Thu, 25 Jun 2026 10:42:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CCE1C20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782409368;
	bh=pnOfNp9/ctehv6PmReGlUMeN9R8JuaY0IwGr+iGJTlQ=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
	b=M7geG8xyuW3jaKBpp3FmBW4kbWpHezIBq47o5MufG7sOysIPZXBqCTpdgclvpB1ZI
	 nk0OqJdgyEKrm4mi2pBsz8xsgWsMUSIAG5uCeKblrU1kMdilPADNuyR+gtBWX/Xj0h
	 t0oswmRWmaHFk8EWTH72SKsvFnajnmtyUCTik4RQ=
From: "Kameron Carr" <kameroncarr@linux.microsoft.com>
To: "'Michael Kelley'" <mhklinux@outlook.com>
Cc: <catalin.marinas@arm.com>,
	<will@kernel.org>,
	<mark.rutland@arm.com>,
	<lpieralisi@kernel.org>,
	<sudeep.holla@kernel.org>,
	<arnd@arndb.de>,
	<thuth@redhat.com>,
	<linux-hyperv@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>,
	<kys@microsoft.com>,
	<haiyangz@microsoft.com>,
	<wei.liu@kernel.org>,
	<decui@microsoft.com>,
	<longli@microsoft.com>
References: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com> <20260609181030.2378391-3-kameroncarr@linux.microsoft.com> <SN6PR02MB4157F6A66DEDE650298E120ED4E32@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4157F6A66DEDE650298E120ED4E32@SN6PR02MB4157.namprd02.prod.outlook.com>
Subject: RE: [RFC PATCH 2/6] firmware: smccc: Detect hypervisor via RSI host call in CCA Realms
Date: Thu, 25 Jun 2026 10:42:41 -0700
Message-ID: <001701dd04ca$0cfd88b0$26f89a10$@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIqsf51yBS/Or0EhgWD9giRtIuOSwIF3n0XAZ3FyRa1lxLTUA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_104255_136372_ABA24F88 
X-CRM114-Status: GOOD (  10.79  )
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

On Thursday, June 18, 2026 10:46 AM, Michael Kelley wrote:
> From: Kameron Carr <kameroncarr@linux.microsoft.com> Sent: Tuesday, June
> 9, 2026 11:10 AM
> > diff --git a/drivers/firmware/smccc/smccc.c
> b/drivers/firmware/smccc/smccc.c
> > index bdee057db2fd3..6b465e65472b0 100644
> > --- a/drivers/firmware/smccc/smccc.c
> > +++ b/drivers/firmware/smccc/smccc.c
> > @@ -12,6 +12,12 @@
> >  #include <linux/platform_device.h>
> >  #include <asm/archrandom.h>
> >
> > +#ifdef CONFIG_ARM64
> > +#include <linux/cleanup.h>
> > +#include <linux/spinlock.h>
> > +#include <asm/rsi.h>
> > +#endif
> > +
> >  static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
> >  static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
> >
> > @@ -67,12 +73,45 @@ s32 arm_smccc_get_soc_id_revision(void)
> >  }
> >  EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);
> >
> > +#ifdef CONFIG_ARM64
> > +static struct rsi_host_call uuid_hc;
> > +static DEFINE_SPINLOCK(uuid_hc_lock);
> 
> So evidently Sashiko is wrong in saying that struct rsi_host_call must be
> in decrypted memory?

Yes, Sashiko is wrong. The RMM spec clearly states that the rsi_host_call
struct must be encrypted / "protected". The other two requirements are
256 aligned and not RIPAS_EMPTY.


