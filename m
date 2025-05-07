Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B86C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCmXTEs9MesTHuPpFJ/NvOgzXDUn8ZZ+zdOFzC8r5lA=; b=SXQPHdrNQZCK1IfyC8S8Zk4zU6
	y4RiTrvTdNH6h7lUudDK3eOG8FJaT+o+IINGgR8rrWjc8NnFHp0eZBe+8VpeiiCl4GFP5ar+w6Uyv
	0zy6Yp3x964bJAHsx5+uSm0goCRNlLaiweBzOqZhVRuzNvOLl8ijCabVBjTtyPUdZX64QL4nbEqup
	en9JtVDDWOLdm8T0EUwgdjzdDSmHpOD0sVWa2hkgzx80aL8Hq+iiLEO4hEdbt8d/Ib9Y6vOBk4tg+
	DEJBdjXGn4E7KTjIxVtKMiIv4RVnBwlHefOaBrT9Q3nXFusVZoGKfZpLGMzHzKOdCDJKM2DaZ0L7+
	w2R5GddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWm-0000000GIDH-0Yvu;
	Wed, 07 May 2025 17:25:52 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh4S-0000000G3FB-08l2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:52:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22e7eff58a0so320005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633151; x=1747237951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sCmXTEs9MesTHuPpFJ/NvOgzXDUn8ZZ+zdOFzC8r5lA=;
        b=UEyoBi9j+S35p1vd0N3pmpojfNUnE6LA4fHGUWAuUJavMdpCidQWpa0AJPAZw3lIO8
         dRAEK73F2N1MW2/41FOes3378Zhe93tU9MFTaj38ai8lKb8eZ4ZLpQUgNo6Wy1DSDXUQ
         Fn6mPaUPHVnQfB/PVM2sALtucE/Q15BhXJPBxNMO6ZD42FWhTmMj3jcd8uNl3z1I56YK
         zYI1wxRl1VDOWnIMQWc8AFP3hE+b4DBDxuYy/jl3n10u8nDRgf8rKiYHe1eTM6wbsoDC
         d0WsnDQJ6oTvprAe/TPUHDAqRm+rwUVVsVgreGnU0SOipOZWLr2jjjpGvc5lLAUhSpKV
         eclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633151; x=1747237951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCmXTEs9MesTHuPpFJ/NvOgzXDUn8ZZ+zdOFzC8r5lA=;
        b=ZQHfUSLy9V5QgtoOIavq3h3X41hWOZV9OlDE9mYzy8G24jcyvX3824qW4vfFaNrACS
         wbRjdDGyk7q6u7NGNoHvA08odGaE9eC7sjP2PnakqxznnDUa2zRR/ko9VSumE+mQ7P5G
         iMwJj4dmq0k58+d4hChtWuEqQoO1ZIjNhxcQrpVwZQP0+WuBHgzWZgQleOn424KjuQZE
         1pXKdlBPFG71M2gE2nNq350z6mLhZx2h2mEujaR4LAFN5e8dakaA/AX/oJpO5ui/udIU
         JQqdv+UR3PgxJ8K9uNJyRd+olIuRJKRdZHKLM0o1yPRTjWy2bzMZEHwepXEeSAyrx2Bl
         LpEg==
X-Forwarded-Encrypted: i=1; AJvYcCVd6gqhgdZteS4R7e4xqhZSlOr0y9hyNHFFAOjzl+AWRO3Rsx7qKvkgTc3XSe8mSBcde6Y/Jbiy+LdDunD4ZdOl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1PmxMTVQaRvqE2ld+UolcAHMLMv+OF4l2gyNabc4w+i6aRHRo
	NsFfTuZNrC3HJ0+Y0Uo1md2U3YgxTqP4hqDvuU0QMWVmdKOpi96Y
X-Gm-Gg: ASbGncsCfcwfL/JezPrf2oJE21PgyQTsWvnX0Fdy0l+d5yXPYIXAdLjftAZxYqceHow
	4Ff0NJA1FoWu+F4gtURAiTxj1KefBa4kKeJJpZCMZL3dgwMBw4sXBvb5cFKj7YoxQviYywAMV0u
	pqVb271OXKL5V71WR3SgpyEK6bZJoIknQashSJ7lRi0520jULjm5eBbDV0WBWxWb5dFVoUDuX+2
	vxn7k59mGBBlat9nUuDtUfq4RgLYfYZ3i5MqATdnfnYFUBPJJ9OVpErZ54GxJgiNEQ3uiIMGrwN
	upn4zqNJvTZkQ19lfxyWjFJPYyiemEyB7NN6RSg=
X-Google-Smtp-Source: AGHT+IGIeRiD//5aB3Lp0GTAmkUq9HKBWgvRug2zQlreh3HMZNf0lXvR6y+wTe0PX9iANCSO8Ya92Q==
X-Received: by 2002:a17:902:d2d0:b0:224:2175:b0cd with SMTP id d9443c01a7336-22e5ecade46mr51329175ad.26.1746633150657;
        Wed, 07 May 2025 08:52:30 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228f62sm95204515ad.168.2025.05.07.08.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:52:29 -0700 (PDT)
Date: Wed, 7 May 2025 12:52:24 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/3] firmware: imx: move get power mode function from
 scu-pd.c to misc.c
Message-ID: <20250507155224.uoxabve2qxncioqh@hiago-nb>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
 <20250505154849.64889-3-hiagofranco@gmail.com>
 <20250506044618.GC24259@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506044618.GC24259@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_085232_069594_1A018BF9 
X-CRM114-Status: GOOD (  19.59  )
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

Hi Peng,

On Tue, May 06, 2025 at 12:46:18PM +0800, Peng Fan wrote:
> On Mon, May 05, 2025 at 12:48:48PM -0300, Hiago De Franco wrote:
> >From: Hiago De Franco <hiago.franco@toradex.com>
> >
> >Move imx_sc_get_pd_power() from pmdomain/imx/scu-pd.c to
> >firmware/imx/misc.c and rename it to imx_sc_pm_get_resource_power_mode()
> >to maintain the same naming logic with other functions in misc.c.
> >
> >This makes the API available for other use cases. For example,
> >remoteproc/imx_rproc.c can now use this function to check the power mode
> >of the remote core.
>
> Better put this patch at the first I think.

Ok, I will do that.

>
> To be simple, I think just export
> imx_sc_get_pd_power in drivers/pmdomain/imx/scu-pd.c.
> And add the function declaration in include/linux/firmware/imx/sci.h.

I do not think this is correct, since it is specific to the scu-pd.c
driver and none of the functions there are exported. I believe the
correct implementation is moving to misc.c and export it there, just
like the other SCU API functions.

I will send a v2 today with the comments adressed, thanks.

>
> Not sure Ulf or Shawn is good with it.
>
> Regards,
> Peng
>

Cheers,
Hiago.

