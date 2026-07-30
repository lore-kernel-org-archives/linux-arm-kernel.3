Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDABBC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HWoRuuEQ7zJ3vpj2jIwSgIRqCCpU7QeZRVoWtE84e0=; b=cNMfJhG/ErG6vrYtM6nf6VYfBi
	G9PPYcHRKvVYM3oH4uUwgufA23zakQABwxcdszQVy/SgfH5uBLUbKAipDFQfaUwrgFCyqlCI0d8cU
	xmVv+mgHyx/v5TdhJ7yiGYwmnDFxgZzEOD4POvdQSqFCZerN0I3istrkU+mojDIdXmHHXyxKXCdQc
	0eJoZMX4XXsoP8RhSnTb40/ilkuwP8Z12qc61Sbpypo37OorFhaf8NraF/m4fzm0QRHLsPG/tDJfk
	ih5DrRL00wBtPgXXX37pUwA5UAlzNl99gbARfbG1X5/sjAl5xs0Snc7gDN/5w6XzWdNxBGE20iRbG
	ugHZVdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOaY-0000000AIxh-1Ytu;
	Thu, 30 Jul 2026 11:06:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOaV-0000000AIwZ-3Tez
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 11:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785409565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HWoRuuEQ7zJ3vpj2jIwSgIRqCCpU7QeZRVoWtE84e0=;
	b=jKbvJ0HdzF/Hdl0dG7ADEhOwMVzoUR6D1J/Eugd/DXIIUEWtye0AVff+53bpodAqfqRryW
	6kqyihG2lZcOim8NtSAIbrU1FdCjOveTbd/+L7vUZcsAFEaB+qRvW7BIesRXB+3QXU95nM
	mfz2s50kRsGLRJ++OeHEwlCNa4zddA8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-lsb2KfsGNAWgkNrtynzRLA-1; Thu, 30 Jul 2026 07:06:03 -0400
X-MC-Unique: lsb2KfsGNAWgkNrtynzRLA-1
X-Mimecast-MFC-AGG-ID: lsb2KfsGNAWgkNrtynzRLA_1785409563
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81f0b6bb02dso62611927b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 04:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409563; x=1786014363;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1HWoRuuEQ7zJ3vpj2jIwSgIRqCCpU7QeZRVoWtE84e0=;
        b=d8w9rM1DhbArl6hxtqSF9lGJjXT4q/e2HEpw4U/MSxS0MCcb6tfap4CU414Zl1LRXY
         gvBoZsTEU/kufiiIvlviNKUys20auGQv/aFmrJJzRohKrpKavIhExiDWPr4uUAKQLpim
         E5iyk7dKU/+yQG1qVYrWBCzMA/Ttgbjmv0vXjIXgIcgMB4Kyc9rLYk/F+xGHcblDQiZG
         pDSWdWp/PnY1WRxaS5/2yPtCJCJvQUPTTqDgESAHUyHbqpsMA9y2n+gxs5qH4BYye9bI
         lmox79+XeqbXe09mZhsmj86bsxYSPpes/ER4ur3JOpfbRBOMYP1oYsGDQz+Zg1ZdBn3v
         RR0g==
X-Forwarded-Encrypted: i=1; AHgh+RoKuiiLE4sumxVCsnVx6+prgZCASNrp60L3tEeo4seH93nwAgxPpgHO5IKXximXnnBdwDgzWYxIlKdc/jZRqIw5@lists.infradead.org
X-Gm-Message-State: AOJu0YyjmTJB0694BBvY90E+gUurV++1HDURH5kvuUImms2vs6YgzLi0
	A1ItVlANHHvbB3zY4LyEuMpxRK5+YKHSlSMpvIOFpo8R+RZ5Hb23cAZFaMjn5a0UuIXyLfb0qKw
	eJ0ngtV4WipgWct3wYJGmAXziHCAwk23t0PktCTQFHosetRSqj5RlHsGiLLrmzDVfG8+3iVvJch
	7H
X-Gm-Gg: AR+sD13+DwXNwKEpMU4xfx+pxf7tmb/daENEIxhb4JxcGcKu4r2M8gFXOGS9k84v4rG
	gvVRbNHrX7QwQh2hl9UyToaaWHnxXn+gQl+LOe6+1FxpxmpKPkSv3vk0hulWCmOshV7iZvdfhXV
	sBxOjZzvuxJlewjM06Ez0p6bfztBYkBvJsY5pKUH5yGN85FcTrgmNyRm9dFDDjbQnpDqa5oFOX9
	yStns7m1ZaYqNti1aJqmRfP+rYhf94kuMWiPwTFK9UTvOuDCI4o9OaUXNqeW8SAAHktX42qMbW5
	n0QRpHT06Njon8ulZWKBCKUiDFCS6b1tK0G1Jgjrt8Fz1kNw5QXZSb8W2RW82R21lniWfQUc1Jp
	liGXtU4Wz/jz29D+3hwjPa51zKQaOTMiv0ZA=
X-Received: by 2002:a05:690c:6802:b0:7ff:1a06:472 with SMTP id 00721157ae682-81fb8953b7dmr15182097b3.4.1785409563074;
        Thu, 30 Jul 2026 04:06:03 -0700 (PDT)
X-Received: by 2002:a05:690c:6802:b0:7ff:1a06:472 with SMTP id 00721157ae682-81fb8953b7dmr15181697b3.4.1785409562604;
        Thu, 30 Jul 2026 04:06:02 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8b2975csm7687837b3.48.2026.07.30.04.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:06:01 -0700 (PDT)
Date: Thu, 30 Jul 2026 07:05:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
Message-ID: <amswFn2qWkvypMH8@redhat.com>
References: <20260728091804.382753-1-wenst@chromium.org>
 <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
 <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
MIME-Version: 1.0
In-Reply-To: <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GrCHDJWpdob4Sumw5r9IQNv8tLC3kZYezWT71YI9jrQ_1785409563
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_040607_944901_56E3B2B8 
X-CRM114-Status: GOOD (  37.79  )
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

Hi Angelo and Chen-Yu,

On Thu, Jul 30, 2026 at 10:23:14AM +0200, AngeloGioacchino Del Regno wrote:
> On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 10:33 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > On Tue, Jul 28, 2026 at 9:10 PM Brian Masney <bmasney@redhat.com> wrote:
> > > > > On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > > > > Hi everyone,
> > > > > > 
> > > > > > This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > 
> > > > > > This time around Mesa was ready for basic testing, using both vulkanmark
> > > > > > and glmark2-es2-drm (with Zink). Details below.
> > > > > > 
> > > > > > Changes since v3 (all in the clk driver patch):
> > > > > > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > - Added missing of_node_put() in remove function
> > > > > > 
> > > > > > Changes since v2 (all in the clk driver patch):
> > > > > > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > >     - Needed since the driver implements PM domains using the generic PM
> > > > > >       domain library, which also depends on PM
> > > > > >     - Fixes build breakage (kernel test robot)
> > > > > > - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > - Dropped unused mfg_desc (Brian)
> > > > > > - Added check of clk_prepare_enable()'s return value in
> > > > > >     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > - Saved error value for return in IS_ERR(data->clk_26m) branch
> > > > > >     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > 
> > > > > > Changes since v1:
> > > > > > - Adapted to changed DT bindings
> > > > > > - Dropped driver change
> > > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > > > 
> > > > > > 
> > > > > > This series enables the PowerVR GPU found in the MT8173 SoC, found in
> > > > > > some Chromebooks.
> > > > > 
> > > > > I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
> > > > > go through the clk tree? Patches 3,5 go through the DRM tree?
> > > > 
> > > > Only patches 1 and 2 should go through the clock tree.
> > > > 
> > > > Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick up
> > > > DT binding patches. Otherwise I can push patch 3 through drm-misc.
> > > > 
> > > 
> > > Not sure if I can really take the DRM bindings patch through soc.
> > > 
> > > I will take the devicetree ones exactly right now, even though it's going to
> > > give warnings.
> > 
> > Apologies for missing this, but the first DT patch depends on the clk DT
> > bindings patch for the clk ID macros. This is causing build errors in
> > linux-next right now.
> > 
> > Not sure how we can fix this right now.
> > 
> > Brian, would it be possible for you to split out that patch into a
> > separate immutable branch for Angelo to merge?

Yes, I can split things out and make an immutable branch this morning.
But it sounds too late for that.

> > 
> > Otherwise Angelo might need to drop the DT patches until the next cycle.
>
> Yeah, that's so bad.
> I'd be happy to be able to resolve this, but it's too late on my side.
> 
> I should've checked the DT patches more carefully, my bad: I got a bit too excited
> to finally see this PowerVR stuff working on MT8173 and going upstream.
> 
> Sadly, I have to drop the devicetree patches :-(

Chen-Yu: Could Angelo add an Acked-by to the three patches, and then I send
Stephen an additional pull with just those patches? Do you think he'd
pull that?

Brian


