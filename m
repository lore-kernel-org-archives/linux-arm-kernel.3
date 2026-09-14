Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FD6C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6Z+iVYBfNSCWeowkj5JZHLt7Ogk7p4zAvjEwB8LuWA=; b=Wq57Y1/p2CmhCZRjd6c0CAoHqI
	/8heXPsF3L7IKL2cbZ01nR0dMzTchvnRVng+rMWnPUVc8ZaAXtHGtz8265F6tF9h37ynT0pD71Y2l
	uEja3dwYH/95Zd+TSwfdJsIMKLbnnJbkUYl/K/MqgO5xugI5IgYN+clMo90y3IQ148XFJxbkTZkDh
	odPTX5zC7ea/ym5kpcAkFZ2wF3pUoK4doK76lwWMQqFiH67uWeqw9xpYjKuBIXGv7CzCWjOu4WfH0
	hwd5aXcTiiehvsEg5hSfChhrUS9hf8uutrNY1WmtD4g/P9je4S/sAeFLzicc6dIv7Vu1LofYepV4t
	e9KlS/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dy1-00000004hJj-1eZg;
	Mon, 14 Sep 2026 21:11:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dx0-00000004ghE-1Jt9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYcnY262568
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6Z+iVYBfNSCWeowkj5JZHLt7Ogk7p4zAvjEwB8LuWA=; b=Jp5eldK1rwlCLxUp
	UueWoBWXJgmhAxxZJbDltJvMEbBuiTjtK+F/MeWcjuF4gubumkmh57uSxH+MX7tl
	vZz6R+KGE8WbZmx+q3oRl+rQj4GSWwpIeULX1PFCku1MK3ZPZN5d8irum5GMz1dy
	OoFPCwDT2JNDfaUy395rlFi6j3RpYpHyYRdrJdOgpy3JiuD2dmOCdBP9vk85cPzc
	RIqY0WvNdBK2xRW+2VAxM9ebWX2Z97SDc3x1/+prTV6v3JbpWM4j/7UF8NkcrRlr
	XLYHEMURqdiCPlZR5n5IKrFFaB5sNZGm1LFBo0El16giNTPDBmQowztDnvJkJsrI
	fWMccQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergamtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:10:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc2229450b4so3326360a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789420253; x=1790025053; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p6Z+iVYBfNSCWeowkj5JZHLt7Ogk7p4zAvjEwB8LuWA=;
        b=btiwYkJHFuywkjkSCvZ4tIS7XyqOkypIiyudY1r6QS6A7mDhjN3p0qtKEeCW518ing
         2hxRAO/8qe20j1g5+vtzu3RrvxbCrsUzy3EwC/EK9LLt+gPqu9ei7mxvjXxGVYnroPpj
         DdKHMi0V58wTfBGq8nQjM4dtD67CVHeIKBfEq4dAfcaBzuGSNWbfx5pU+3ja4PgVr5RB
         RiDk3M9FlpcJJt0AMhNQWUTexHI78hBVuBvHmNEUFravYxyEEWtl1a1CaFcyhOQA/OSy
         t2W1llwdOrfBuDusRb791C5HSxvNeJBR2D8WXtpJaCNPLJQqeLjcJ1RIHNcvEqxIAR52
         gKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420253; x=1790025053;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6Z+iVYBfNSCWeowkj5JZHLt7Ogk7p4zAvjEwB8LuWA=;
        b=F7iWrXNSFQu8LO+Rryjj2ECdN2UmYSqGiO17VDz0WuZI+fxhQ27LMvU1kMbQckpBUx
         qk7p1aPcgs//bhm8/ZypMZOdT50ZvXzKPj6i4ITammo2Ub8j8UyJqGQ2TIkOos2CJTsl
         EFkF/hqgb3Ysdiqtr9uIliyYTsUWsSrBNMnbOA/x5mUvZ5so6opp+IDblVOAUsBbP2h2
         aGFhDARQqlcoszC+lzYDPm2lUcFlnTPzK3a6bQFd7z4d/ah8BmYdrSn1YpNDPcSeQgTo
         34QJEfhJNPw+vK0RVczfAUkxtrFI2hE1jM3cCZ92B3b/wLRIKh5sDRlyNPurw3RStlQK
         Rykg==
X-Forwarded-Encrypted: i=1; AKwUvBxSRfMgWXGZddYwrzB72l+cAocyMUsKEPzfTLZ8dMpJg51XSvyWYqMEs3oRdvf6iCT+GUQvOFqN3vPwpWS705Hv@lists.infradead.org
X-Gm-Message-State: AFuF++k8QSeQ0iLgUAoYiu50y4KtE2Y3PhSoJwNiMdsV9dmMD9ma+JLt
	TDjIpg9ZPSXelUICCDI/UX+DMrY2uS1eSIKxedDHdGi3OXycNU34KOiPHLN+m9xy3jF/N3ju4Em
	LIq2JYAQsND1NFtUMcA1oGvwW2/JdkzMGo6C7r7ZRj1In12KiVvLX+vTtH0SexV+KwplnH9dG5+
	fd4A==
X-Gm-Gg: AYBFou2BHzYcv5MCjOmTmS+wklAzcm+cN5LqvC2TiK+nZl9JpouWKaX765SL1MuHAXX
	TD0T9sbTEPxsFXTMuvS9nCCLhT9cDrIjQy/iCCcPcpmAXAFoL+Fg6JV4rqUMY1aA7lhUONIMthX
	V/qFW/wuDDCdE+eLuLTfQuzSu+QJkAxjIpuVnjukdR1q5jC68o56dYfASpGLIizwucTTkIQ788F
	zpaI2K85dpFDfvHdGwSYL0ADxGO4W+s3o+FIx0+7hs0ozlW51bM+v5lRHdxzm6oE+mzKlCry+pd
	ubfQvGg46qYIHMljtT1Zk6WsAWRvciJAu6Hzs2X/JPs8yg6Xz8/oQfcMS/bQ2PqUt8mQwg+B61t
	Z791PXrCkunyOhg+o7vkYrgYS2YY=
X-Received: by 2002:a05:6a20:7344:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3db40480717mr8952852637.12.1789420252918;
        Mon, 14 Sep 2026 14:10:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:7344:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3db40480717mr8952794637.12.1789420252504;
        Mon, 14 Sep 2026 14:10:52 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b347e6sm25355458c88.4.2026.09.14.14.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:52 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:10:49 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
        <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
        <kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
        <baolu.lu@linux.intel.com>, Jean-Philippe Brucker <jpb@kernel.org>,
        "Eric
 Auger" <eric.auger@redhat.com>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <skaestle@nvidia.com>, <mmarrid@nvidia.com>, <skolothumtho@nvidia.com>,
        <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: Re: [PATCH v4 10/15] iommu/arm-smmu-v3: Support PRI Page Request in
 arm_smmu_handle_ppr()
Message-ID: <20260914141049.000077cf@oss.qualcomm.com>
In-Reply-To: <aqSLsg7AVgqusKob@nvidia.com>
References: <cover.1789081084.git.nicolinc@nvidia.com>
	<cbe6e6f578af848f4efdd8d1050181032effae37.1789081084.git.nicolinc@nvidia.com>
	<178908564507.2841562.6430226716089872094.b4-review@b4>
	<aqSLsg7AVgqusKob@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa862dd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ikd4Dj_1AAAA:8 a=HAQNk-a_8tHaYfDPudEA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: IKYDOKADPOLACU00i1uXRzA7b-NNnKiI
X-Proofpoint-ORIG-GUID: IKYDOKADPOLACU00i1uXRzA7b-NNnKiI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDMwMyBTYWx0ZWRfX5LFTYnnJ5X2A
 Q9zpBCx1bcDA2ZNa13HJeHPdL/UQvKhkNXMgoUcYBfMQEL223z5iRXWHBs8ijokCbkkKLyInz5t
 khdPhu45ixBQVN/EK8xLgUM5WzyAOmtWJ/O6Icbm+nkR04vFr50LBbpK+YozAfJKPPcXRTRSh3a
 3+selmKu3iBbJmLB2euduPVfJsNlOox04s7ya/wuFURXaHkCj6Ie+9ThTgs4fQi37DLvVyncwgR
 IHAbWeCpeQsqHnw+tAaPOZ77vwwdxlYc804butsYuq/GSJZyNYlu7ZlRhKdY7v3NDQ0RrBtK69y
 D9RVvsrLpVBFA6hxIIbsB9NwPCKbYvTyEs58zhdqumujM3eFQlC7IxbZA3S32Rrb93l1ZiHh7dj
 k39ulqPdnX06pcetfa5kfgIB97eaJ9hn/TXaVlrJOlWCrN3HN9DcI7mnchcUPdfI7ww72oNsR2a
 q4W31iYoodKzVinSRzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDMwMyBTYWx0ZWRfXz0hJdIc6iNSW
 bqCtk2KG6ICHad8XLb60bqb6DK3sTkaZIhNYYqOJSV7cJGcbCu9ytZqnv5rVUvnT/3PTMXSPQvQ
 WKZGeCnJpcY54wC21eK0GOjDwNfzXOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_141057_034066_7DCFB9D1 
X-CRM114-Status: GOOD (  27.10  )
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

On Fri, 11 Sep 2026 16:16:02 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Thu, Sep 10, 2026 at 05:14:05PM -0700, Jonathan Cameron wrote:
> > > @@ -2380,9 +2381,47 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
> > >  	last = FIELD_GET(PRIQ_0_PRG_LAST, evt[0]);
> > >  	grpid = FIELD_GET(PRIQ_1_PRG_IDX, evt[1]);
> > >  
> > > -	dev_info(smmu->dev, "unexpected PRI request received:\n");
> > > -	dev_info(smmu->dev,
> > > -		 "\tsid 0x%08x.0x%05x: [%u%s] %sprivileged %s%s%s access at iova 0x%016llx\n",
> > > +	/*
> > > +	 * A PASID Stop Marker (LRW = 0b100) does not expect a response and
> > > +	 * must be discarded before fault reporting: see the documentation
> > > +	 * at iommu_report_device_fault().
> > > +	 */
> > > +	if (last && !(evt[0] & (PRIQ_0_PERM_READ | PRIQ_0_PERM_WRITE)))  
> > 
> > There is a bit of spec language about case where there is no PASID
> > LWR=0xb100 not being a stop marker, SSV == 0 and should be treated as
> > a PRI request. I'm not sure what that means in practice but maybe
> > a comment on why that case doesn't matter. Feels like breadcrumbs we
> > might need in future.  
> 
> That's a sharp one! I didn't find any the practical action was
> suggested either.
> 
> I wonder if we should let it fall through instead of a return:
> 
> 	/*
> 	 * A PASID Stop Marker (LRW = 0b100) does not expect a response and
> 	 * must be discarded before fault reporting: see the documentation
> 	 * at iommu_report_device_fault().
> 	 *
> 	 * Gate it on SSV, as without a PASID that same encoding is a PRI Page
> 	 * Request and it does expect a response. So let it fall through and be
> 	 * answered with a PRI_RESP_FAIL, since iommu_sva_handle_mm() rejects a
> 	 * PASID-less fault, or by the PRI_RESP_DENY issued below.
> 	 */
> 	if (last && ssv && !(evt[0] & (PRIQ_0_PERM_READ | PRIQ_0_PERM_WRITE)))
> 		return;
> 
> Thanks
> Nicolin
Works for me.

J


