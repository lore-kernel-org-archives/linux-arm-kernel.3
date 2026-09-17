Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C2AC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFlrcxSZmPD5dZXM5GhCeqxfFV5r+Gw3spLtAai033g=; b=mo6WwFLuIu5kIXAO8nlbRaT9js
	SYbPiUePgebXG1PfjGIjIMElm9SneNwG2x9sNDkWJ6WILIXtL0Ia23liT/Tt4Kl+34jpk2AkPpbGT
	bVV2LXp1yBEL2ARqvCsX3/BZhnMAetHmARCUiA71ZJrXAQhkq92Dozx0bkAR6SSC0d/mKjLm90G0M
	V2vaGulAYz+/D6YhQKJqBdmi+UhSD5pDBCgCrriH7XgWzz+syIotYHOYOi9fjpI7HWK8lZJNHhHyF
	nKj9F2GF0+/q+wyCX4kUtXAe4bUV/0s7lQXwIgeqZezOJmT43FJpUbxC6c7mpGBv3yBFzPPhJLlzh
	JtYEbkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Q5-0000000At8e-1ZBa;
	Thu, 17 Sep 2026 08:24:37 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Q2-0000000At8J-2tMW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:24:35 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso5287805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633472; x=1790238272; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DFlrcxSZmPD5dZXM5GhCeqxfFV5r+Gw3spLtAai033g=;
        b=LCpVrOclNMivLkEKO4K1RK8lZsvq1sQxgeq5YloTrofsTM0ae+gX+kS9KWxQdgROz4
         drVQurwi2ogf4PzCjHa6mNA0cVoA0wNLBZ/ZZWpceeWitQX7RCm/iPyhucut75RasNwx
         jR4OyVzh9jwWyMQCn6sCjU+OJhHHDbdRXVokH6UbnAQaQ8g1yDgo/mooMDyLWYy9jo8c
         tFUZyzrsBFz+bydjKoQFT5+EOE4o77gd9GvLh8qmcpqHrmiXq8o8/AEkFSsQrnxC90P2
         dYRvkPTwQYppCCut+QYpaOcs77oWL383HtRfZq+kbvSz5gN3+4YjlruxbbxtiQYf9ncU
         etZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633472; x=1790238272;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFlrcxSZmPD5dZXM5GhCeqxfFV5r+Gw3spLtAai033g=;
        b=0Rh4DxCLlQAEFsuJFR0Rjw0PwbOIdo1pYOQcY4sXAmtv8HlQ2g+umuMJ/V1nc5ipBg
         Y/GX/XeCgCg6pBMyJQ/4+2YuKo52O5GKX6LvnpBB1cXWot/HMnDJIc2zWp/VQZvpShWa
         5+2qQySr8b1D3Yu+fRH3uw16RwQAGhMbPOoXHBKCDTUR/1U+asGYMHPWLduoAcTYsczW
         q+IAOgIIL42kks1bPpJb5UrRxAgkefQF1HjKvPc/fr5Je6KtzDq34VWpVeRzhG7zIxba
         ygcOAeIoMYtufMyn5NKJOMSBXeGLX0Nv3lpkCHRgg8bhVW7vv1iDteTGsFwvi+lZHLxX
         DVjw==
X-Forwarded-Encrypted: i=1; AKwUvBwvnBUgyIPSiJoPcZ3sWdJTRRi7JR8cNnltVWtLQsyHZ6Li15x1+CLcOExQBaQvdL+DXqT3q1Jra0Shy7jf5lTC@lists.infradead.org
X-Gm-Message-State: AFuF++mgpU2Gh5+qW5fJMvN/lrh6YP2ckHeldzgJE6IjvsDSqdioi0Vm
	rvHd7gK+Rs8uevt8kEgHW9hX71yhefgSh7gYZqQwNju2peRQUcniXInM
X-Gm-Gg: AYBFou1lN+IdO8UeHzu+Wj3Q5bmzx5VB3Wr5TT1EIs4ur5EP2NYZYBhYYl/oGrTG9Hx
	NT1/VBWRz2/wwBSWI6kseWuVpchfTvFgLlI3VXCXyYSWlUiHDU6X/olp8k4BI+gnYYVdugDf0h1
	78E4ed4+mQ+qLcdeE9EhAU8912/DWbwsXyXI6AtYMOoCZVOHvlA7U9wg4LxjbVVlQ9+EdFhwPSV
	EK3Ft0E7fWXkb5M3cwBaeZwoo85bMC221gcpzAO5qXmlbGcsyHHQBvJhWII6CEhR6fTmEjFFG5F
	PeKEMeNHf/vGlncNsyJPDxZ3zPBcDm6OHR1huFjXAej0/k2TKZn46rq5x4smo1n6yVNMLJOSe0I
	US1PvgZy+zQS+uNJnLam7nda1XnMHro497ztWZaJKC0uOZFWN2GgUrRiqWWPhkbuYeax8hZLrgN
	BuBzYyvW+H3ShCgc2EAu7AorvdCrs35XUK6xD1YZOld2XPLf6lbdiGlR/fWajtn48WPbCsuJt1b
	auEysfYStpidbiW/o+O8L1tM7Acrz/tio9PHi97ZsDbu6NxhwxSMiksoX1XwTF/9a0r89W2Pvgf
	6fGu50Y15ls2PS8oVCGNYo8KFkR7tZnjP3i/pPVCy+abW3hbQ2n8kQmlgRqXXMVu98Z4oLeaP46
	kpBkAG8Hdf3XfEl51fg78Q10LHYObb5gm60XQ0aaEWzRBq0wKNC1Y/QLaGiik7a/1mVVARwPQ/R
	uiHaLEjyrVPXG1n/U=
X-Received: by 2002:a05:600c:35d0:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49eb7320b76mr75942795e9.20.1789633471744;
        Thu, 17 Sep 2026 01:24:31 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbefe1791sm38435265e9.1.2026.09.17.01.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:24:31 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:24:29 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20260917102429.00002faf@gmail.com>
In-Reply-To: <aqq_ymTi1I951uQp@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_012434_773301_351E0C24 
X-CRM114-Status: GOOD (  21.97  )
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

On Wed, 16 Sep 2026 11:11:54 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:  
> > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > on teardown or error, causing potential resource leaks. This series adds
> > > the missing calls.  
> >
> > No, as I've explained repeatedly elsewhere, it does not cause any
> > resource leaks. [1][2]
> >
> > The autosuspend setting leaks if you will, but that only matters in the
> > theoretical corner case of someone rebinding a different driver (which
> > will soon also taint the kernel).
> >
> > So don't exaggerate the impact, this is essentially just a cleanup,
> > which is fine in itself.  
> 
> Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> include these pair functions.
> 
> I get many similar patches since scan tools is more powerful now.

I suppose that could work. One would still have to scrub the kernel of legacy
use/dont_use_autosuspend() calls though, so it could end up being a large
patchset.

-- 
Kind regards,
Joshua Crofts

