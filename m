Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80234C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRrXiWbp5BCMXI1+0yfdqp8zjwVidH0MdyBqKFKUh/E=; b=i47KbxQyBcsiLC++biNg64wAIe
	Du1GWEe1rbBLUxRkcOf2WXo738ht5TI2blwN31vfkEjuNCNL1g1Y608Wh9IRrTU7tZclkag7p1dPz
	1PErC3AXXzupaibwC/UglP4E6P5A4eZ7twXl+BxBTueRFu1TBaKoUGeMXdN+YIG7yTvp11dGy2PCJ
	SqSU8GAFmLga3gSGKpQ2p656+jPT7JE+Fp6qoSrCvxDCgCbYzR/9qNXNl3/Wvem+m/NY7yRhPaE2q
	clt/vUvo+nrUCUeEe+D09FjBOVe1Oo9PJtXSryVXiscxjKXJHQXhnv2W+yVzSIhsmVX4O4brDHmuq
	ZUY6yGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweum-00000009iGZ-0yDg;
	Wed, 19 Aug 2026 11:57:04 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweuj-00000009iG5-3NN8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 11:57:03 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-66c711b7f2aso1613481d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787140620; x=1787745420; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRrXiWbp5BCMXI1+0yfdqp8zjwVidH0MdyBqKFKUh/E=;
        b=LcQlyWukI1NritmZ0jEMzc2buRkCb64hfq9olejtO/D6uvny8KeV4xT94dwkXm/bSf
         leQu64KpWApDSQHE4bFEOwx3/Xv4kgxYVFvWD1A//yV/FAHqOnRTgDu368GooQdTnNju
         FJlPPGwQ6Ot5L2W6O4qFCBZuGoJcgJSrNV7VIdW/uLOLxh0IDkFNBotHqZ6j/HyZSKEn
         2swq8ByKviZLdLE5X9/zgda5PXZj3xo1yJ8RjOTYk/aHH7SsPVDAbokUYmeiWNHMjvMq
         KUq19tUE2XLkHZbeRO9BIsW+90/JPGWcC2zrAhpxQaiQve0TSKNuUPc6iPo98dNVAxqI
         hHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140620; x=1787745420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRrXiWbp5BCMXI1+0yfdqp8zjwVidH0MdyBqKFKUh/E=;
        b=AJUFVHWt6NE1Eim8943mFKyqJZyyNNEdIdoXsMQVq9R9PlMlRm84O9L5tCXLDlnrAc
         7Yl5Mznalppxkk6aAtSWMZHALS7naD/JwPFWLtrej3YGUZUmMXZ2j+rmscvZ1eZr470c
         pyc+jlclhENPCHU7gj/d40yTnT2QvSjxz5tnctoiWXaAAeMPKRU6y3SIMef4kuAsYySI
         GffNWcQQjfpBcPZzMMtMSJPkaR9Tfgn1rlDO7ERm5TAvrnkPFqL1QFLPAXHnxZv+2cUh
         W7sS5cA2y+OIGVNKQbHK92M0HsdLL1mx2ztRiC0Ytjo8D2qG85j0Dh8TGbqREZjev4/i
         xGnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8xhHmjNb49UChVLEeZgBr27mQ+o2yQDlBxDK0XwooeUA3xqPwAn3pGe1rycTR5OJuGv4DDCqPsoOLKe0yljlC@lists.infradead.org
X-Gm-Message-State: AFuF++ne9+m1OtcX7j0YaZaCR/1fIWO+kplZ49eDqWleMamRop2YMgFz
	q9z/A8HbKCIJkIBxilcc2o22ChDqxTnZ6mcGPbvSCG5fvEJ6HiEtSAc6
X-Gm-Gg: AR+sD13TT1scUfq1Q0VHAWLZZT9uQuEWjqr2SH3wEMsZgWIqRuJsJCHy9xQCmS6dXi2
	2bb/wVFJOxPljP1zY4uHMhMdVKpqqVbTaKZy+xOKfjut1OK7DHRP9NcpJ9P7JX5IKFyBsSqq6gZ
	NYAje1H+SFBvrPVzmxSUndC7ueZJplodN7LsM9vRwKWns9EGlAvriRxuUGHRVsIK5R81HXzVaxo
	JS5jjMjpLC3tRkjy7fmZG3sN7zQIbXycS+6y9YxR74E5qXLIUWT57UWgUCiaPFvDmUQTMBBKuaN
	MC0rpM7QkXoOXcinIfieasLIXRAtTfqK1GXmjXB0DSk1tbbs2I0j+HhWNIa8NzMJhDR/tu8cGvX
	60ItgBaesI30Jm6Q8PYmkeKZo+WwVXKW62t+M+iSuumK2Se9EoBS86K6rEYs3hs/48XF9Qp92wq
	9/uTttHxEW2cozVKEfhl9+aRgZQIEr3Qo+ExHZOETdc/WNAvjAzsUIeo2aEuRJlFFNNVE=
X-Received: by 2002:a05:690e:4807:b0:66c:82b5:7d59 with SMTP id 956f58d0204a3-66ccb5cf30amr1129726d50.12.1787140620402;
        Wed, 19 Aug 2026 04:57:00 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66ccb1a03c5sm817419d50.20.2026.08.19.04.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:56:59 -0700 (PDT)
Date: Wed, 19 Aug 2026 08:56:53 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <gsihg6tzkrq6gcygquzbjtiqntvoxp67lo6mqntnmbyvyw7s3y@suv4t26pl5eh>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
 <aoSqJ7pHEgJ_RZmr@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoSqJ7pHEgJ_RZmr@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_045701_874091_58DF4E99 
X-CRM114-Status: GOOD (  24.06  )
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

On Tue, Aug 18, 2026 at 01:53:27PM -0500, Frank Li wrote:
> On Tue, Aug 18, 2026 at 03:08:33PM -0300, Leonardo Costa wrote:
> > It seems that the drivers are being deferred at boot start by the
> > device_links_check_suppliers() function. It runs through the drivers before
> > they're initialized and defers them if their suppliers are not available. The
> > GPIO and PWM drivers are able to follow the gpio-map and pwm-map properties
> > (through the of_parse_phandle_with_args_map() function), but from what I see,
> > device_links_check_suppliers() has no such mechanism. It follows the phandle to
> > the nexus connector node only, and since there's no compatible driver for it,
> > the function defers the consumer drivers used in the overlay.
> >
> > I think this is what is happening mainly because setting the
> > fw_devlink=permissive kernel parameter (which sets the DL_FLAG_SYNC_STATE_ONLY
> > flag) solved the issue, though I could be misunderstanding something.
> >
> > 	int device_links_check_suppliers(struct device *dev)
> > 	{
> > 		...
> > 		list_for_each_entry(link, &dev->links.suppliers, c_node) {
> > 			...
> >
> > 			if (link->status != DL_STATE_AVAILABLE &&
> > 			    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
> >
> > 				...
> > 				device_links_missing_supplier(dev);
> > 				ret = dev_err_probe(dev, -EPROBE_DEFER,
> > 						    "supplier %s not ready\n", dev_name(link->supplier));
> > 				break;
> > 			}
> > 			WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
> > 		}
> > 		...
> > 	}
> >
> > Has this behavior been observed before? Do you know of any work being done that
> > addresses this?
> 
> Does a dummy container driver (for debug) to proof your analyer?  Let
> me to find time to debug it.
> 
> Frank

I made a dummy driver matching that compatible string, and yes, it did
solve the issue.

Leonardo

