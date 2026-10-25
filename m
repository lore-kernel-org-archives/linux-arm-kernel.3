Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA410606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 06:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BrUZFsl6;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=DhLWgGyV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GG2r8Tl22bjKCflCUtqfigNjXYsUIoAtpX9Mov/rpIc=; b=BrUZFsl6MNMm3wpVCJQ6F/n6gh
	kZ9t52dyHXo2bNsTi170NEgGNRERltLcpm3ptBE1mI539AVNB3FtV5t0u2Gj10SsfiomTEmbsmJqJ
	6gxrULP040lYnB+m8wwuLoTzyV/5rsaOGvqs7VVl9zct7i7BUamCbsIfCm9NjItVcmcDPYxKMiAGu
	/bfVzcdXgDuu0PpcHmgfm0IPwT5nAsVL5L0XUsm4zHs7Hm67PkCp8VkHmEirjKKE8s0tE/IXObDv5
	8XSUMxaowjccO5LKfgHeMRHZw8m+XvltXoERBM+0q7OYm69D9RjMj2iFcI5soen4+dZuOPXQPTgu4
	g14EnQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrca-00000000n81-2Dmo;
	Sun, 25 Oct 2026 06:22:20 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrcX-00000000n7c-2seb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 06:22:19 +0000
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4sRAZ2783225;
	Sat, 24 Oct 2026 23:21:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=GG2r8Tl22bjKCflCUtqfigNjXYsUIoAtpX9Mo
	v/rpIc=; b=DhLWgGyVgSN63RFfR8Q+fxtZESFnXLgYONOF8MVPsXABKRDe98kUM
	OtHuSo4VLzP5IFyZRirGARjkRR8kB0+oGg6SpkkY9PTswIgYIx4NLjryMjH5aioZ
	Mvd9vm0Lb/GwI/dhS7X872bRslmYKx+IV4PkVwD/eumzEGEhh9xnV65GZDWpqYtm
	7LaQjO25u4gw6zkFFJce20I1IigQcIAgfiGgHP/q1XwF3FAD9J66vXl9xw2ooHms
	Xf4F4x2ZAkShuCac8Ab7fg9djyrAYC4jBh/0sYJ1nNN389h/Ay4mpNTGAbZpbSBh
	HymF/EX2JI+Ox8FaBkPotUWP86YlODzVA==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgtc0uaef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Oct 2026 23:21:48 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::8e35) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Sun, 25 Oct
 2026 06:21:47 +0000
From: Amir Ayupov <aaupov@fb.com>
To: Leo Yan <leo.yan@arm.com>
CC: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy
 Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] coresight: syscfg: Match feature capabilities separately from device class
Date: Sat, 24 Oct 2026 23:21:38 -0700
Message-ID: <20261025062144.2322034-1-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261021143958.GH26205@e132581.arm.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNCBTYWx0ZWRfX5m9ejhggEp5I
 a6cVaZfyfNhnjqOLvrFNZBbL21ONVYyrk9nYbkY/RitXWGEXfi2Q7aO3iJe+9dz0B+TimTkUW1w
 aIEMFzPv61Kym9VxRQp/1l72664AD8FQtv1T2d8Rw2UVc+ktop/cYbae5nJZKS2mmQ7nE2+DGKr
 y+btj5S/gg4Dkam7Rsbv9aj3lfir8mIWAy27Sbw3dOJSZd/fwJtGek3dSKVzkAymliT0ujx/PZR
 EfTSmrCZVWT2mLrPUeK5Q4xKul8o1R8Zsz96UH89KMPZ8npZvgE3NgoVc/nFU0AqAt4bmXjCje8
 TUiNm9xDARJtrVo1UnQNBIvp6AmlqJktFfNYt9e+qHgClQdAF4YzRHO+o8ehNFcX2oyYjMxVZSh
 N/GYch2wKBaVtj4x/Lwhz7LUgn4eS6LuHL7yqO0/aHd5jEgcljstikeBPCp51l9yvGVhfF5IAP+
 GfF21jWklHyLG5c1oow==
X-Proofpoint-GUID: Z-Df9JaqLY1KMccEAuXJqFB1pvH8atD6
X-Proofpoint-ORIG-GUID: Z-Df9JaqLY1KMccEAuXJqFB1pvH8atD6
X-Authority-Analysis: v=2.4 cv=eIGGH3p1 c=1 sm=1 tr=0 ts=6add9ffc cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=PAz_-FQ8hEVmOPYdF0yf:22 a=NEAV23lmAAAA:8 a=7CQSdrXTAAAA:8
 a=XVXTpROMIXIvPH9SelYA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNCBTYWx0ZWRfX5l/tXf5MvNcj
 +QKgU3MzPfgfhJRvb1NQ4w00zCdbYkMy+ZGWWC5HDQv2dnPMagSejFIRnDO6+xuSEU705s5r0Gt
 8PR3n8DRNkNlgR8Lh4BwxsxIuscPcio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_232217_736884_CFCB44D2 
X-CRM114-Status: GOOD (  21.89  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 15:39:58 +0100 Leo Yan <leo.yan@arm.com> wrote:

> On Mon, Oct 12, 2026 at 04:05:21PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
> > --- a/drivers/hwtracing/coresight/coresight-config.h
> > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > @@ -30,6 +30,12 @@
> >  #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
> >  #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
> 
> It is good to introduce a marco:
> 
>   #define CS_CFG_MATCH_CLASS_MASK       GENMASK_U32(7, 0)
> 
> > +/*
> > + * flags defining device capabilities a feature can require. A feature loads on
> > + * a device that matches one of its classes and has all of its capabilities.
> > + */
> > +#define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> 
> To make the mask explicitly 32-bit unsigned:
> 
>   #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
> 
Thanks, will apply in v3.

> > +
> >  /* flags defining device instance matching - used in config match desc data. */
> >  #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> 
> Not an issue with this patch, but CS_CFG_MATCH_INST_ANY appears to be
> unused and could be removed in a separate cleanup patch.
> 
Will drop in a separate patch in v3.

> > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > index a816c22c87bc8..1545d64afec01 100644
> > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > @@ -172,7 +172,21 @@ cscfg_alloc_csdev_feat(struct coresight_device *csdev, struct cscfg_feature_desc
> >  }
> >  
> >  /* load one feature into one coresight device */
> > +/*
> > + * A feature matches a device that shares one of its class flags and has all of
> > + * the capability flags it requires.
> > + */
> > +static bool cscfg_match_feat_csdev(u32 feat_flags, u32 csdev_flags)
> > +{
> > +	u32 caps = feat_flags & CS_CFG_MATCH_CAP_MASK;
> > +
> > +	return (feat_flags & csdev_flags & ~CS_CFG_MATCH_CAP_MASK) &&
> > +	       (csdev_flags & caps) == caps;
> 
> For clearer comparison conditions:
> 
>        /* Class type must be matches */
>        if ((feat_flags & CS_CFG_MATCH_CLASS_MASK) !=
>            (csdev_flags & CS_CFG_MATCH_CLASS_MASK)
>            return false;
> 
>        /* No required capabilities miss from the device */
>        if (feat_flags & ~csdev_flags & CS_CFG_MATCH_CAP_MASK)
>            return false;
> 
>        return true;
> 
> Thanks,
> Leo

Yes, that looks cleaner, thanks!

Sent using hkml (https://github.com/sjp38/hackermail)

