Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5913C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3njgz9rqLz/snE4bZmzziBWQoLAdqrbyVgCfoTyS8RU=; b=fZ3YIJgg9ts3eXbPehDSu55LOA
	mzbmm3uPBv5wVClfS0EiFUXWT8JTyNVm/2Fz3lj7TRBYRq8Y9E27mhPgzFNgyFsh2YZSxvG86bL8G
	4tlMAcDd2CrWxhHiJD6zExThtbI/oRSDuhkw9eVBz3IhAFIKkOmqVIwFfHBrbURBBD++dn4i7xlAo
	qMDLWLmp54mG7SwNNM5OrvHT4K35D3zYC9EI9+/wJzgMKoMbk/XokJIEsMrBa+2NhUmNo0QPJvDLT
	fSXx93P77fgHTkUgsh9oSiyrL/ni6/jfyWhzwROYooBE5uqci9QRS8fMz2IaO7DsVvvz7VtL3M7Gw
	jiFBx2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1uLz-0000000G5LP-3kjw;
	Wed, 02 Sep 2026 23:26:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1uLx-0000000G5L2-1QtU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 23:26:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHjoL1768673
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 23:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3njgz9rqLz/snE4bZmzziBWQoLAdqrbyVgCfoTyS8RU=; b=gaV05CQDIXeIayc6
	ArOpHeepH7gPfPDdzosrDr8iw8RcGHvjqK19NpSh1Ddq8qG0nYa32PjRJ6h4jnMr
	hUf8BxUkjIOwvuYCCKGHjaITgMuefrqHTNsoKI4hCy7lJDhw3tkfUvLCuDlp4rn1
	yfc+T8bSaawf+fD1CmHY0siB5JqOH35ouoySDYkGgoFJ5akdHpcutFRmIf2p+mjx
	y5mriJKXEYRAkgGSYTrXX1KLut9qZO5SKmfGGklTYNvN4xqpcLi9SbXh8L89WQvo
	gXx/uBl76tMjHvOTj5VROfncD6aFIR//Ypt+yk3pzov9WydMOKY4jblJXLhDearT
	VVPdhA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja2ngp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 23:26:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so569307a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 16:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788391607; x=1788996407; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3njgz9rqLz/snE4bZmzziBWQoLAdqrbyVgCfoTyS8RU=;
        b=imt8x4axCZUb/8pKj0dvG1YZ5CNT0w9qfHjQWRoOy5iFaUT4BjbHqBPeiimSwEOe82
         0Wvvg1V+DF75EdXw98kjjE7U3NEnQeFTfwn8gS6IoGUrvpoz6JuX2khznXsMCVoRxyRe
         ILUUbTHjYEThhQOu1A7HojJBKQUPZ1GF24U4qrfUtHrVbJvDKUfpXC7zSaBapau0EfgK
         dp+SKyr1cb3B9dHDRyCoStliEOdnlNDyWQGCQL1bzIxw/SCSawpm9pVIUblvGPeIUhgH
         0X/2xshRoy331h8fFSaavLEIe8EQlVHQ9jZTolktk5KboVCrKwwnCbx9IcpZFJZXJuwU
         UZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391607; x=1788996407;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3njgz9rqLz/snE4bZmzziBWQoLAdqrbyVgCfoTyS8RU=;
        b=b72IM7oGBDUoBf4k4IRnZ6IvfQgfppGvmty43kBbszqR25va7p8/1bcLCR/JEnCHAX
         LbdaFL3G6UypuLmLNpNFA7kzRZfr56HdDUh0fBAbGfgJvzuk82jZJ1IcrfKejq0qK12K
         psAU+srMs/IptVgE2VKK47HCwbYMhipXif1nSsAV9LPLSgNdCYb7ZgTLB4iP1Qbn113+
         cyNQJE/dPYZKTqgP4KPyzQVZy3PjlfPBIFP8rt6mXwkOX1S4PWGQzvRckRAhLAY1d/IN
         KUt6cpaMDXAucCa2oMbNVuq0HRz9jthMO20S9uKA4isl16Hz1v7680xZ/tnw1xm8D/AZ
         f9CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlVHMaPm1W34qeMKIThZdLu4mG+1mBFq7WryOEPr4MCCixuXvG/2HVcjRhhoyP1V5I80nM/Noc5mQTIuCl6Etm@lists.infradead.org
X-Gm-Message-State: AFuF++nFnEuGnTaB+Tw4kCopZKHkgFA4IuRe5EiYqusufim8pbvUVFOJ
	V/2Xl58iRs67LrkLu2Mi4aBi0XEiXtDhFFd3VGXkTWcjjTAaW32U+tk2mYDwkE2KTqW16a41bIy
	albiD3/LsJj46S0ekFcsL26VFKc7XpoPOwLnO3ube2iCBh7v5hl5ZLVzV4xBwpmnvysy9m4AlFw
	MewA==
X-Gm-Gg: AYBFou1rJD3/P6OR26x/O2quRaZYQGLpF9Zn7r7XtEnajTZv7YP1agj//4fx0/cmF6p
	sAer++2GKrZO4laO4D1x8FszD0GtxOPgVQPls2y4Wh4p7L8uZmGEqZZGpArSTrGa01i00LLehS4
	Z5I1/SBpkk3ow9wpqvIEBp7c8eYzfJXpt/5qZrFWthISSAf+YkP5eht1x/O3X4Zktr3JQfKasNB
	VEW6GVVD5UV3mMakNWwWyaZ8Qyhg9vGbwd8nIhfxUnlC+R5m9ItaKN26Yb8SaYsBcW834KVLO7r
	Kxy8PD3fpOJ9iaf4Edy8imeG3LdysTyNixeZAqw4GBAArepf6OKeZ0fanbacW6k8QJDLb4JqRa7
	axDPNZudLyTRsOY8UiC9n1fYLN+8=
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr2327212a91.20.1788391607413;
        Wed, 02 Sep 2026 16:26:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr2327172a91.20.1788391606962;
        Wed, 02 Sep 2026 16:26:46 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm1332213eec.24.2026.09.02.16.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:26:46 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:26:42 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>,
        Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        "=?UTF-8?Q?=E2=80=9CRafael?= J.
 =?UTF-8?Q?Wysocki=E2=80=9D?=" <rafael@kernel.org>,
        Danilo Krummrich
 <dakr@kernel.org>
Subject: Re: [PATCH v3 1/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
Message-ID: <20260902162642.000008d9@oss.qualcomm.com>
In-Reply-To: <20260902-tireless-steadfast-mongoose-cccac7@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org>
	<20260824095121.00001b9c@oss.qualcomm.com>
	<20260902-tireless-steadfast-mongoose-cccac7@sudeepholla>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: llBD6u3viaVR6QMb0RUqBkQxa8GOVJtc
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a98b0b8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=bmWpZdXelV54CUJQUpYA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfXwQ7hbFspzJTV
 D3b+C4Ce1fKFtauYXwwFqLOIQUCVmF1AZ2pD6e5pHW8D4ToztNw2b5Q4ZFr7oQDsNc8JHuNi2sD
 /ixgJ6Ato3vYghA5xZ6edEhcusdxYTs=
X-Proofpoint-ORIG-GUID: llBD6u3viaVR6QMb0RUqBkQxa8GOVJtc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfX2Ifru0lcA4L4
 uhteUOPJxTfzWqT2D8ZewPteZACaChsENNV8UfSTEV3iPC/aFVuZIXfZsN2WWV+Dr6EzXjgNVDR
 xMv8ZKMKvE2oL+5l6DOHwSz8UmAOw6wC/bW0+rFmSbOhT9QkEi0mKLIvqOc9qiUu1wwMfqOFYJS
 VLSXjd2PcTeGVG1er+3fFUsl95f1n2EroKgccxwV2cx8Djz4mUP/Y23mB/4gJVky/dnM64o0PwH
 ClkJI3bb7dwzZ1H6n+IiDLzWmBvQlZfx/EtpO7vFMiy1gXwkmLzvPNb0u5lacpSvDmOZ/tapXVr
 pYg9EDiOcyJZysRg20mFglYI+ocT3QxqVwBGRY6DbvmC/7g0bsJltnantepRRS1AS5FMLjv8IxM
 sKL5sh0IBjSJ1vZ2GQfi3HVTwE09npU+hX0ijNDQf/tytG84HcF50GnEiFp0az1OaxUR8kb1m1T
 0EwL6PjIzORClCEU8yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_162649_425787_2739AE8A 
X-CRM114-Status: GOOD (  44.02  )
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

On Wed, 2 Sep 2026 08:51:10 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> On Mon, Aug 24, 2026 at 09:51:33AM -0700, Jonathan Cameron wrote:
> > On Thu, 13 Aug 2026 12:32:56 +0100
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >   
> > > Add a call to device_set_node() in the SCMI probe helper to associate
> > > generated SCMI platform device with the firmware node of its supplier
> > > transport device.
> > > 
> > > This complements device_set_of_node_from_dev() and ensures that
> > > firmware node information is propagated correctly for both Device Tree
> > > and non-DT (e.g. ACPI) based systems.  
> > 
> > Hi Sudeep,
> >   
> 
> Hi Jonathan,
> 
> Thanks for all the reviews. I was away for a while and started to look at
> addressing these now.
> 
> > When you say 'complement' I'd like to see a little more.  The guts
> > of both calls includes setting dev->ofnode() adn the extra bit
> > in device_set_of_node_from_dev() is about ensuring we drop existing
> > node reference (there isn't one) and increment the reference for what
> > is the parent of_node.
> >   
> 
> Yes I agree. At the time, when I hacked this up, I was supposed to take
> a look at it again which I never did.
> 
> > I may be wrong, but I think that is unnecessary and if I'm wrong I'd
> > like to see more info here on why it is needed.
> >   
> 
> No your concerns are valid. For reference-counted non-OF fwnodes like ACPI or
> software node, platform_device_release() drops the fwnode reference,
> but device_set_node() does not acquire one.
> 
> > Also, if this is commonly needed why doesn't device_set_node() include
> > that dance?
> >   
> 
> I think there are new helpers added recently in the tree, thinking of using
> then. See below.
> 
> > Unless I fumbled the command, a grep suggests there are no instances
> > in tree of these both being called near each other.
> >   
> 
> I did that too before adding but somehow kept it for future investigation.
> 
> 
> > Jonathan
> >   
> > > 
> > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > > ---
> > >  drivers/firmware/arm_scmi/common.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > > index fe8c22cfb9f7..cc7d11c3c1f3 100644
> > > --- a/drivers/firmware/arm_scmi/common.h
> > > +++ b/drivers/firmware/arm_scmi/common.h
> > > @@ -650,6 +650,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
> > >  	}								       \
> > >  									       \
> > >  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
> > > +	device_set_node(&spdev->dev, dev_fwnode(dev));			       \  
> 
> How about something like this instead of above 2 lines:
> 
> if (is_of_node(dev_fwnode(dev)))
> 	platform_device_set_of_node_from_dev(spdev, dev);
> else
> 	platform_device_set_fwnode(spdev, dev_fwnode(dev));
> 

To me, if the reference counting is useful (and I'm a bit doubtful about that)
platform_device_set_fwnode() should be doing it. +CC those who might have
more insight on this.

Jonathan


