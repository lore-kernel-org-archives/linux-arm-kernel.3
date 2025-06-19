Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5EFC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Gg7ntijtB80tv+b2enRtRMmTEicRNdW1NiQNVbSDNo=; b=rS/SzyNE221W5xiepoZjDOZEfy
	Xf2+uP3hIsiBLhjKG5ZSvaejA3/RPpUVufm3ojtpbeiHp4+ZR0cU+5icuvH/+hxrlrSXTR/Yvl7b+
	Ww4+s4o6lPlukOc3elFr2gm+6lm1WQCycyFq9MioWWyIr81Ohsa93zPV6yTYJGeTgurdwR30eRjmz
	fV3yy2CiUdB9iNk/UYgdIoJx3l2p8YgXbCZfwAUwbfY/n1NxtU+LM42vTGc/BBQvMpNA7MhjiNbw+
	opFMx7IUXtig1dqskh22m2ZDvN5r4BjyRJSk8Uw0cNw4DPlYAsrCyodwRzMBBqvGrn0PAU73cdVUt
	+t8KpCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHSV-0000000DT6S-2RpS;
	Thu, 19 Jun 2025 15:45:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDeF-0000000CvRO-0tIw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 11:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4Gg7ntijtB80tv+b2enRtRMmTEicRNdW1NiQNVbSDNo=; b=Dwrqt6uaTxpqQX9PtKyXIfi50G
	1cYG0YAHGqDoiPrACGMSLCfi3jID6R3Zaz1LuDcrTopwfNj/Lv7t/O9BgNeguawwE7fuzR5BUHZAa
	Fxm5tOiIL1hB16eT2kteY9sXoWCCPTYnwoTQZGC01QgwKbxpRMvhPlfy2imalWhTSVBcVFMB5YtG6
	Whl/n+OZMhZZqnGnIhPKGusY/LDChUTiM/ENDdI28BJhIq/Rs2LXLGhoMdtOyPqqDFALduxmfmZ+e
	MorMtDYkvEppHoyNVu5d2fy14Iz7vbc0L3fRIMqtoPpCp/m3372iJ0uvcOzzaCpy7oYQoFUOHuz5u
	lhZYwDzg==;
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDeC-00000004RBW-1k2W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:41:38 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e81749142b3so658246276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750333294; x=1750938094; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Gg7ntijtB80tv+b2enRtRMmTEicRNdW1NiQNVbSDNo=;
        b=X3u104M3XxPO6nlqWjX9f4nja0frH4uEOvyaWT6PbWXSi00q2dRrN/Pe1usfSofecD
         J4YSce8xS8j93VgxY3wo1LrYrIVeNQnrKO5bNuTDWD+AAUvjKHxDHLVxTKRfFngioe0+
         jKSTLLMASp3x1lBzDwDMETw4VrrG2aZ8rYRctZby+QmMWRmhtfPLN+U8inTBT64qd47n
         8lzNLHwgZozXn16VekTxcLXPbKMvSYepaEdSYIemaBkWrwTpe8iiJGtJUmX7Hzdn1f+/
         xp3sOrP+swpAwZy6oVxmGUXIpiXXygo5HkwHGhus64UbJ3D2mqyX0Hz8dYfMhkpE95FL
         asyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750333294; x=1750938094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Gg7ntijtB80tv+b2enRtRMmTEicRNdW1NiQNVbSDNo=;
        b=CK23rjgf9x4ND1JnbNjGdb9UPhXm/eDM60IA0znnVOHA7kQK+yI2GMMaNrL+2ASift
         PIkZotGCRszVaouQMhJ4s/3rofLkvy3Fcm88449pBq9Txtib0fetCbmE2MIAfgL5oh25
         SSoy20p6Rukff42FIXIBtXcCYORi3jrmyxgL6yts095pT8RHJyT4tU0WK8xxyXFLK8pm
         OOi0KY9RKq/T2bbOccSgF6sPEgD826qKtt0vkVLE6Aa1PF8jcjG/hYsLy8qaXSJ96HP/
         qOCG1/AWbJD1ryY0/eCLAQGp3Rj7ODNC0Gb4xtckVvncV0xoRJuYsOmtWSUkTfgWZTW7
         js7w==
X-Forwarded-Encrypted: i=1; AJvYcCVSatKuKRP7EA/A5U8gl9puZqya8YTV7DPfRkLJ8oTQqROIR+fx3FJcDqEnaqMlEF9Oz4FnVXEmNDYQsgDI7lYu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Uag5fNOTMXxtRejGmqmjZxQNm+mlLm7qQQz6A7s9txgxfHCF
	mibCdh2jcT+DhAMO+otAmBkeiqbD6eKzKRFumzp0TNe2igi/eY4mGhgW8P1OOC0CUzfGy1wKbPZ
	uL4KgmlI5Pr2IsQMZl5ZPoyzg2Kdh60EPKHBSF+gusA==
X-Gm-Gg: ASbGncvoIsRpwGu/xiD2OU6jCsg2ZBAZtmxtusWR3UI5JkGUNcahjD7LTMXK8ILa9Dd
	XeKQBclI41A8oTE32Isg2fweexgO7pLSMMZyg+csRl8h38L4u1ePBd6SrKmETx1Zfwzyv62ZAvZ
	T/yWmVvRpmwZCeDaNVCKWDUvhjgUqpd62XuN/ppebc2ioK
X-Google-Smtp-Source: AGHT+IESytQv1SK+Cd0PiaLJS4H3+JL25iRqvMAyP4xLxjP0vD5U9p3Ec+J/uOKogngm7hlSby5T2PNl/VdbIi6REWE=
X-Received: by 2002:a05:6902:1b8e:b0:e81:9d60:93a4 with SMTP id
 3f1490d57ef6-e822acac581mr30264102276.10.1750333293696; Thu, 19 Jun 2025
 04:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org> <fd4cfe7a-e29b-4237-b82f-48354deead3b@ideasonboard.com>
In-Reply-To: <fd4cfe7a-e29b-4237-b82f-48354deead3b@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 13:40:57 +0200
X-Gm-Features: AX0GCFuFeZwy4zEBgov1_20jiDIxj_2DarP8G86PtCbzf_bxqvHrj-WuuKyOtBY
Message-ID: <CAPDyKFpprO=HGuiHX3MQ_+m1YRnaWG=XwCx8-fSdXak8VBDUbQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] pmdomain: Add generic ->sync_state() support to genpd
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_124136_607101_EFA9BB00 
X-CRM114-Status: GOOD (  25.09  )
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

On Fri, 13 Jun 2025 at 12:33, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi Ulf,
>
> On 23/05/2025 16:39, Ulf Hansson wrote:
> > Changes in v2:
> >       - Well, quite a lot as I discovered various problems when doing
> >       additional testing of corner-case. I suggest re-review from scratch,
> >       even if I decided to keep some reviewed-by tags.
> >       - Added patches to allow some drivers that needs to align or opt-out
> >       from the new common behaviour in genpd.
> >
> > If a PM domain (genpd) is powered-on during boot, there is probably a good
> > reason for it. Therefore it's known to be a bad idea to allow such genpd to be
> > powered-off before all of its consumer devices have been probed. This series
> > intends to fix this problem.
> >
> > We have been discussing these issues at LKML and at various Linux-conferences
> > in the past. I have therefore tried to include the people I can recall being
> > involved, but I may have forgotten some (my apologies), feel free to loop them
> > in.
> >
> > I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
> > Let me know if you want me to share this code too.
> >
> > Please help review and test!
>
> I tested this Renesas white-hawk board, and it hangs at boot. With
> earlycon, I captured with/without boot logs, attached.
>
> The hang case doesn't look very healthy with all these: "kobject:
> '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is
> being called."

Tomi, thanks a lot for helping out with testing!

rcar_gen4_sysc_pd_init() calls pm_genpd_init() and
of_genpd_add_provider_onecell().

rcar_gen4_sysc_pd_init() is an early_initcall, which I guess is the
reason for these problems, as the genpd_provider_bus has not been
registered that early (it's done at core_initcall)

Do you think it would be possible to move rcar_gen4_sysc_pd_init() to
a postcore/arch_initcall?

Kind regards
Uffe

