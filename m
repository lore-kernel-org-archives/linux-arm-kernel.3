Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB57C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Kj6OXmnI796AJi+KtMQGs/+5fjlPUrVETNMvDH3Q10=; b=3+180hcsstYhFR8f53K/DkPJBX
	LmDtWm6yaSm+IMmEdb2oAuSfhhBz7yDFUZb4NcHFM7S3EMLyy2a3m2606JBV8F6angf6jvej3SWvh
	bILNbgCB2EsgtPLxk2LXFoN+Y3Jg5rBJmSbjcj5WnpJtI8Rj2N7gblRLVCHNszUx1SRJdI1hNc6uh
	ZZoQh6I4/xiOTtbdHL4/yzCbLSlQnpdMoo9DM8YsPAxNZaehtq1cUA/+qc6FWF1b2lYTJ7+xkeCuR
	Ol5MgrNPI2ETduHgnO4UlnVCS+XuzBrD1ZLxWr2zcOKGqnmR+LW/BXgcJl9Cg3E1q3wxClIGFZbtn
	3WBFu1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n7T-0000000F85H-0KeX;
	Wed, 02 Sep 2026 15:43:23 +0000
Received: from out-60.mta0.migadu.com ([2001:41d0:1004:224b::3c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n7Q-0000000F84Y-0iCl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:43:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TDDB9h6jCMOmpsGVUIa0QZINLyS4wj3l4QWCvShhMTw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788363798; v=1; x=1788968598;
 b=mCTA+Fgqx0q7VIF1BKxZBxvH/N+TLIMVml0ynAaVnZtPdrQa11c2wjl4pP/jM+damoXFi85Q
 6Gwm5x+Loor74deH5aYWuqjgiL3rzJFJGOyTBtdOtezyvGTAbwcc0OdFU1x6SEAgwH1nejYnsm3
 ce1+iCDF2ECTdybBIzl5kRqo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e3fa1f804db94fd1;
	Wed, 02 Sep 2026 15:43:18 +0000
X-Mizu-Trace-ID: e3fa1f804db94fd1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so3005e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:43:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwcM0Ok2H7XLcrchkJkRcAUoM/RddAJSLSfzbngPv+ReIjKX1dqDwRYc+JoLoeeMRNe6yxiMtY0urycNdzriCzl@lists.infradead.org
X-Gm-Message-State: AFuF++kkY4hEOxfl6dZLXsPXxbYJo8waqjsqK1HKIZCx14w7xCLJ8D48
	26jNcp5CvgKy0NvZb346ZsxCdp62BlUkRO4Sj5fTp4FWUBnBD3k6nfZqs1LR5SPto7NfD77d5xG
	5fMVDelU3B20jRIVyVyEr/WiuB8MuM23EdlhsT6L+
X-Received: by 2002:a05:6512:1317:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b60d662ef3mr52821e87.3.1788363796807; Wed, 02 Sep 2026
 08:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
 <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com> <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
 <0b2c58d2-cc82-4c68-aaa2-83449d0b48c1@arm.com> <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site>
In-Reply-To: <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 2 Sep 2026 16:42:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTymqz4gA4OU8TULa-NROfpmxg0_K7UJd_00jFhVJLtTug@mail.gmail.com>
X-Gm-Features: AcwNN1Vqyai7NwAklslw_P-gB_E9iMkS68kcpmtYOZrPmf--aKrYMKE_RXKOiVE
Message-ID: <CA+EHjTymqz4gA4OU8TULa-NROfpmxg0_K7UJd_00jFhVJLtTug@mail.gmail.com>
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under arm64.nompam
To: Xi Ruoyao <xry111@xry111.site>
Cc: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_084320_349396_399FE4A9 
X-CRM114-Status: GOOD (  15.52  )
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

On Wed, 2 Sept 2026 at 16:27, Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Thu, 2026-08-27 at 09:41 +0100, Ben Horgan wrote:
> > > not, could the caveat go the other way round: arm64.nompam is for
> > > systems where firmware ignores MPAM, and should only be set on a
> > > machine that does not boot without it?
> >
> > Yes, seems fine.
>
> Sorry for the late reply.  This is indeed the original purpose for
> arm64.nompam, a dirty hack when we have no other ways to make the system
> boot.  If you think it causes an inconsistent state I'd not complain
> against adding a loud warning or something.

Thanks. After discussing it with Ben, I think the best option (or the
least bad option :)) seems to be documenting it [1]. I'll send that
soon.

Cheers,
/fuad

[1] https://lore.kernel.org/all/0b2c58d2-cc82-4c68-aaa2-83449d0b48c1@arm.com/

>
> --
> Xi Ruoyao <xry111@xry111.site>

