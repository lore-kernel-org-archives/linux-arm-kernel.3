Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42307C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=; b=lgUkNhaJ13RMaN1H/FSGmqOLNd
	b6wVb+RWxDaw4vnOnJJ5wcx+d6zAesyEy+8zxp4/hBojiU96FyVdgfxjjWI1DfExALsW5vNh4rkmT
	Hh+MYh1jDfVQgL60xxJEH9F8zWDmEsSQ+THeVSCtD7fvpgGjWLLk7BvUToTsz2O2oRiszM42FGv7c
	DMbnPxsR3dU6lDfS8UfklIPITPjlcQIgy8i/Zr44AzgKHzNyTCNxkDVwxg1WU7f8eEx+6DxDGFHTZ
	HfMPRML3zqjy/LTdTK3RM8YFiYRPOLFhModh+jfDcegcDnZVMiLM9cXvs5afXN0O/NwsA8t7vdvub
	iMcSCmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kRt-0000000G1pc-0g1k;
	Fri, 18 Apr 2025 12:04:01 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kPy-0000000G1a8-3tPL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 12:02:04 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3feaedb4085so859692b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744977721; x=1745582521; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
        b=Ixq91DjiOsQ0gL/xB8VbmLLAG+8/QoGW/dzCOpsLiZVTd0i2wY7ttLPXSLoJ9DHsoy
         Poex5WKl2SmyNoa2+a0shzhrY8FF8n4YkwBvziy1Vh8us/SHr5JfK7GjjgIdmCrBVXHf
         SJym07WvcADSk++ev55R0Z9stJ+M5yxgegUjkdGaAjh+xPNWrzM5i1yu3FNNq5YoE18y
         L6aV/7sClWgeOkv7QmbL0BS0k5N9O6ZMYU8t1P7aoUtpVAjZxQoSzaFQWwmuzZ87BSDi
         to/Xg8Z5LuR2grf6tAZCC3zMJ4DNru7aLSeqaTP1Ebry/PfeMbnHxEeqJs0Kum01NXda
         LtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977721; x=1745582521;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
        b=qS9j9mTL9MDtqHWNXirvNYs+oNbHibMxFBhMCLf/cONdc8liLAFRy7Z7G3XqbHmRYV
         5Z4/wgxQIA+d7FDgMF8D5vGIn2pVNGEOL201d3VK3+Ol7ORH2RMMSUl7Vp3qpucFsrOU
         mPlDi9B6IqoWcRfabj374ewfR++Dgr3+dMi4cwbmJ4bEPULVsMG2Pt0L+E36jQVeRc/T
         VkbfzU7Oc1C1wOFAZCXY9Yd1sVGKigXublewQtpYQBVyP4UifhhYyufAojHYpl7xsvLh
         TsSEZVaU76b6jg3rtnXAy/bO+tEhkNOMHx3zL52fBL3/oBlszsGGpmV4uYPkjlWyhBkr
         /OUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjZ3lM3IqbDAUAWBnGcOJ+EYdY99uB8dC7gGlcpid2rj0zpI+GE8nJf/a+bwVNjHeVDp1zO5zheeT7Dgom7Z/I@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4axzcflGPkJ55yCPzltxEtutUGoq7/0YnFRAh3HO+aQTX3Yxy
	Mw9oOAlXG9QZgGMVd/SQ4KJaDONEQYBgAR6gtkMSLOVTLpKx2ook5gZh2fEOTSA=
X-Gm-Gg: ASbGnctuqsB6vMtdDm+AKzOAJXnzOYcdy9pN7ezrlZAGCwFiaL9wjWiDcKFnx1WT0oV
	IhUC5SMRnJZDUk87om6gQEcwelT5CmSuYFdOIfNCs1N8JlgoUgOpBDYWsgx9Fwy3hZ1nm8yv15M
	7/xP25BycHDuAWLwQGKvYXOdvBoI+q0fx6Ts7QFAyGKLnnq76ug7mCHdT/hy//NGblSuI+EkyBg
	7bTUQTAWrTToTnNxqQHxNPMvkNWySjtLpA9hLAQwCX27i4gGlyRcn+eTXrnAbTh5ZL4vIx9JaOP
	fz5BpU96ucm++1X7l9dHRKfXk1phEZQ+1TV5OWrNnFv3+w==
X-Google-Smtp-Source: AGHT+IFpmEodtbmgdnihqC7sA3nbhK11fYL7TMUIM5m+Rg8CrSkqO37M6jThPDqqOLUcCHvHUJZ9KA==
X-Received: by 2002:a05:6808:8019:b0:401:16e:b8c1 with SMTP id 5614622812f47-401c0a9794cmr981088b6e.15.1744977721359;
        Fri, 18 Apr 2025 05:02:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b324e2sm9870316d6.61.2025.04.18.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:02:00 -0700 (PDT)
Message-ID: <e47bcf7715dc31144b5cb6d81957ab067fdccaa8.camel@ndufresne.ca>
Subject: Re: [PATCH v5 0/5] media: imx-jpeg: Fix some motion-jpeg decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:01:59 -0400
In-Reply-To: <20250418070826.141-1-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_050203_231011_B8F8458D 
X-CRM114-Status: GOOD (  12.65  )
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

Hi Ming,

Le vendredi 18 avril 2025 =C3=A0 15:08 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> To support decoding motion-jpeg without DHT, driver will try to decode a
> pattern jpeg before actual jpeg frame by use of linked descriptors
> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
> used for decoding the motion-jpeg.
>=20
> But there is some hardware limitation in the repeat mode, that may cause
> corruption or decoding timeout.
>=20
> Try to make workaround for these limitation in this patchset.

You should maintain a changelog in your cover letter, this way we know
what has been fixed. You may be interested with "b4" tool, with "b4
prep" and "b4 send" the tool will assist you in doing the right thing.

More details on what is missing:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#resp=
ond-to-review-comments

Meanwhile, just reply to this message with the missing information.

regards,
Nicolas

>=20
> Ming Qian (5):
> =C2=A0 media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
> =C2=A0 media: imx-jpeg: Reset slot data pointers when free data
> =C2=A0 media: imx-jpeg: Cleanup after an allocation error
> =C2=A0 media: imx-jpeg: Change the pattern size to 128x64
> =C2=A0 media: imx-jpeg: Check decoding is ongoing for motion-jpeg
>=20
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |=C2=A0=C2=A0 1 +
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 120 =
+++++++++++++-----
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 5 +
> =C2=A03 files changed, 97 insertions(+), 29 deletions(-)

