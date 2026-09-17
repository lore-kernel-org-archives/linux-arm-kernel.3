Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CC8C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=; b=bBaq7GBaFyLBoMgL4o/ZqL4Ncl
	lorMikRpJuHJPUrFNoCFs2axkiP26X8/790WFW2w2hYuhBRc1/qng3zs3hNctZKwPR/wPYyOG2WK+
	ZqmdacQDqToxYALdydpY+PEvQfUyJwLf4Z4GAVaZf1ECzcDsJ2XoZKf/1v/Vx3E9jbde+7Gs9duJk
	hFi0jhkLeYHb016PWzgwU9uBieteG5MPpTRD129DgrS+hA9haLsM4ZV9R1sEzQbpCeSSltNSViqkm
	Drh/BaIyeCGqGjjy+UnLcrxH1lh05PGOe2BnJKmMW+KkVCh5hqycRJ8zFhNP/5DbD5iT2xVX4gNKy
	40jJG9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Fi7-0000000C43f-1fuI;
	Thu, 17 Sep 2026 17:15:47 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Fi2-0000000C42e-43lH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:15:46 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b965f447cso9560405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789665341; cv=none;
        d=google.com; s=arc-20260327;
        b=guCqC0lCxkQc4pAw9aHF4l5WCXVItrRGtOUFawq5uSnCnBfU9OEAwYtkloIGLQgXwq
         IGuqvT/y0tmA1aSUI+B3w2831wf3bvD8hMWdSuUexIdsUSXeDVAKZRwiMhw0tLECze26
         ikD2RH4Cv2vCGLdixoUcIE6KL8Xsv9bwFFEZvW1ufFxObbJiuNqfMvHBJkzGFwg9aOQn
         fR2a39mASrTNPPXuyXcLGOhfjU6pnH+6E2TymEVEy1IUpUmXgA1O3GKefxPd4wSoWHd1
         5YrtX37ONhB5p2QPBnZ5QbVbG/QuGXd+aab5EE9DCcCXdCxGfcHtD2nQr3/K3dOqW7zf
         LQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
        fh=4PL0dQrqWDHijoYa34UEU3w1yuoG3AKtjenIn6krsxU=;
        b=Zq+KWwhXftmsDLNcQYfbqEoesQ/Zyd9+Qsa7BLsyww6IB33xysxmeaQO2HTBDau/LE
         JdmSectXSuLBbN6xnzuZQjeufn71p0xvQqP/seDOwqmItKixzuAtWtD7CxyvO6SgFNT6
         O5IF1u5ZK06C5pCL5ZySzhXRfshjmGORBu9Uz5vgHbtFierLpIFI7IjeRIAnzzaIgPtQ
         150EQJYVv5/ouMB0z4h71/iMRPp4+pI5G1lXQkZdBZKTk/zlk9LllEW/QoxtPlseq0zu
         qRiiMSch7rOIAMB2sVF0VG83iOJtjq14lVD7LBkoZGIanm5ZzAFlg63JqnQIZt0+cltV
         zdRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789665341; x=1790270141; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
        b=XyAw7EzaEopFJGyWADbja9gDHLsNDKhHt9BoeMdBb7WRB+lbrCvEcPXwPutGB0U6wk
         HN8yWMcCKgBfMISBEggkj/s+hoUZFYil305DL40SspKtEuCeIqHZovQUkaO/EGaUaVYb
         h9SmRhY7HofzGB+Y+op/lbQGTeoeHXGL4kCZB394Z2MbwyjgIQ2VwEmzgcAl6BI4LQvV
         6kw2uMzQYyrl1QDUpf5sqs7mjM7+DkyrQtj26PYGKFechEMSJJpvEQGHckt9UkrO3A4p
         lxk9BsWAcbj0roXkKKNh8EDqUA4H5ZpFO+O2vGld/EzL1H0GM9lmaCOo/rhYJRiifQLs
         VD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665341; x=1790270141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
        b=iwDgdt8CQCVnwHHDuOIR2TtEAVrQJXLJEJVXRogTJcamaQOpDnLCVU2zzQiBsBcCLy
         dZ8JUCrIxp+YSbh0DV6wbH5IH3AqtIalU7s6W9DiOCgGBbADEcy83dlqsQpqxzccToQa
         0HIUprA1qEwljD3HCj2iseCKNdYDuohJK6ReD6yBsx4x3ZMVgC/wBmyONtayCsJEb/e2
         xs1TFdy0OzQa1j5Z3SH4FVySnJ7Ozo/hcqG+K/YTopF1uP1m7gBQZq1Bz+k3j8m9ak0L
         8cIOfjbWwsjmk+35evdU61P9TMhxmomgy+rqjRNKlHIjceogJkRSgKSmxMe5fZxXPFlF
         HsRA==
X-Forwarded-Encrypted: i=1; AKwUvBx8xt4ws7zE+j4FI1VGHvTwYHOrZmbWo6Ktm+gewvpCaJbLjkevpdcAKZM0facMlMpjJejM/ZlF1rFQRVHQ/8C+@lists.infradead.org
X-Gm-Message-State: AFuF++kCVGgUerWOGjfSF88aZTP+GjtcEnAS58V4L2sopWAz1hW7J978
	TUMMR7ci23gU5AMQ7WwmNXAbTR1ZARn9jEYwJP9krhbpaCGrwalJWLF/FbIs1M5kkKczExk+WEl
	W8qfLiRtxxQ9y9/1jeVSBFg5ZzjEgyvU=
X-Gm-Gg: AYBFou3z4M43XhDwrMoRPHCoybQStAEF+ZOtWBUAscXKe38OPLPFxkd05T4CAnMkbi+
	vXKZfqkfgEPic6V6pmccfsL2M7Hw/UDKAAx4ZmgmWA7mnCP3MXU6Qyay+Nu5qAyzsDymm3zsdy6
	jdWDE3dokXjonWRWBGawK2/UvyAITRDG1XCX13f4UYla2JanNVXqfpzwiPDlnjwOqcQxbCgGmE8
	nXivJzA44DohsblcirCEuuGSwB/hlx3Tvq0DQgU8UvJdR0JnaPEopx2IjDevYKsEmm3JaBIRd0L
	OkUcTFSQHa7Xg88IlZYNRE1z8fVAAfnxqCZcOH2jR8sZPX1h9q0J5HLk0u7B6X8iZ6Jm3OHA2iR
	ZlQBZR9ky8muUAnctIg3sgk9WAEQd73StD+EvYew+FqAYe5tSjdvmwJA4QupjQMErl+j8cWzkg4
	TJm/aRcT0tBPUnUE0B2uGGlIItu4OgcyK8urF3nD8TlmoIUa7IDkO1Z3igMCXS2hGLRgi/U8bP5
	gDkjqhe+arVikx/sgN0IhDsub4tooQwwdpxMgAPsMB1C/CeSm2n7fqH+w==
X-Received: by 2002:a05:600d:4447:20b0:49f:bcce:13f5 with SMTP id
 5b1f17b1804b1-49fbcce1a1dmr41833255e9.24.1789665341002; Thu, 17 Sep 2026
 10:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
 <aqpgUPWUGZp5Cjzt@hovoldconsulting.com> <aqq_ymTi1I951uQp@SMW015318>
 <20260917102429.00002faf@gmail.com> <20260917104233.00007a85@gmail.com> <aqwUky1jSMGbiXCf@SMW015318>
In-Reply-To: <aqwUky1jSMGbiXCf@SMW015318>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 17 Sep 2026 19:15:29 +0200
X-Gm-Features: AcwNN1Vx0h8quqew4hNT7uRkgLUXPW_uCN9SLNcg_QuQOygx9-cYOKOmc0EAV7A
Message-ID: <CALoEA-zMXhy1VX1MLVCy3d9pmC0fx22sJULamLhMmBX6xHutwg@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: imx: add missing pm_runtime_dont_use_autosuspend()
 calls
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_101543_045792_BC88C81E 
X-CRM114-Status: GOOD (  28.58  )
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

On Thu, 17 Sept 2026 at 18:26, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Thu, Sep 17, 2026 at 10:42:33AM +0200, Joshua Crofts wrote:
> > On Thu, 17 Sep 2026 10:24:29 +0200
> > Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> >
> > > On Wed, 16 Sep 2026 11:11:54 -0500
> > > Frank Li <Frank.li@oss.nxp.com> wrote:
> > >
> > > > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> > > > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:
> > > > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > > > on teardown or error, causing potential resource leaks. This series adds
> > > > > > the missing calls.
> > > > >
> > > > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > > > resource leaks. [1][2]
> > > > >
> > > > > The autosuspend setting leaks if you will, but that only matters in the
> > > > > theoretical corner case of someone rebinding a different driver (which
> > > > > will soon also taint the kernel).
> > > > >
> > > > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > > > which is fine in itself.
> > > >
> > > > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > > > include these pair functions.
> > > >
> > > > I get many similar patches since scan tools is more powerful now.
> > >
> > > I suppose that could work. One would still have to scrub the kernel of legacy
> > > use/dont_use_autosuspend() calls though, so it could end up being a large
> > > patchset.
> > >
> >
> > On second thought, some drivers do tend to disable PM runtime system sleep
> > etc. so it probably isn't as simple as adding the autosuspend stuff to
> > enable/disable.
>
> if runtime pm disable, does autosuspend still work? suppose it should be
> disable also

If we add dont_use_autosuspend to disable then every time the system suspends
and resumes we lose the autosuspend config, meaning it will never autosuspend
again.

I guess adding dont_use manually to the driver's remove() function is the only
way (which according to my cocci script it's 195 drivers that should be patched)

--
Kind regards,
Joshua Crofts

