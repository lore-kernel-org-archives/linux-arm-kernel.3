Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75087C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSQi8KUPwQ7sewz9dZNSnIXQ06Hyg6lfMvkQJkpmQA0=; b=TDZxHCRLDWWQRsHez2rcVq7UAU
	xQlgIGgd6c2Df3ZNTb1MMsta/AsrxHq6HSxx3koNDQS3KiLLdCmPPPqYSK0OfCW65+u/EmTvbndPH
	+AHOkEmt8Um6EGIYTMef2beX9e7R0wx5t9e7yS7krtSJ3UGc4twK6/QvFAa/Fe80LsmCOTd6zMjfx
	tv3nXkjuG2yMhyDKCeSN11AIxMxH9anGnQnUN5YYp6e4cz5KczYVFQf+q8jYRt9klF7CjX/ESHSnS
	cPJ13pio/AV/aq4zUjlKWPqLfaD1eF/x89etbkoxFa5UurK3sWKMBg40wnNX55qe/4XA56DOksf7a
	4UvUWRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4McX-0000000CZwF-0HND;
	Wed, 09 Sep 2026 18:02:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4McV-0000000CZvf-01NP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:02:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7So22771653
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 18:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSQi8KUPwQ7sewz9dZNSnIXQ06Hyg6lfMvkQJkpmQA0=; b=pzWzBtGf3uq63Kne
	EMslco6jUfhmRL0h1enVEuIQ+qX3dy4P6lulU1cMPrdfemPvte0EqEwNq+h3b8gF
	/tD/3r2bDdsf9RSxeTUbX9fviPxsr6un4RwlJmJCRM25QBym760LZOQRD9kQXE6j
	14wG2YFkf/DHYLF+QAaY6hEdM3PnvYXb4YEHndt1u8Fkg9IMa/3LTThJ2DBO/VnD
	7LtcidhuptVb2MWvaGtpgUt0l2zusLHvvkQiZu1HcARkwIzHkURyYSp2fKnlY09T
	f0DFrUYD5hvimJECNOO7knIJpQi4yCKt+olDX9iK0zwhC+uNhsZ5V/XU6Xxxnpyw
	p0QoOA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x9ybc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:02:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so1882553a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976921; x=1789581721; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fSQi8KUPwQ7sewz9dZNSnIXQ06Hyg6lfMvkQJkpmQA0=;
        b=MT15yGQKZk5kmCPotcXqAAIOZKp+TznkCye3NTJGRKXbwV1Xezs47ciPS60MdFJDnC
         O+brYn9Q0LiTmXN+6+QL5XfRxFzbs8yEV+DNYl6Mv2etjfYf49I7b9zf3mSDgEUakIms
         YXMZZhk96o0kHjJNGmpnY0lEQERL3yLdBrOJ2OuUBgcxnPDKSOomFukSTB12X5qXz8wI
         oWaGQ9XMQcHwPdec7f73adAKzNL36uA0z59jPz0NB8jrWhq7AhFrq+VqfweaFiSU46gy
         yo6INOxQCLfvA7VZfQE2Fn+9R6ZQGAywp8htmTpBC5fV0NR5EySGfOhVqi6kNgjZHABa
         NiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976921; x=1789581721;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSQi8KUPwQ7sewz9dZNSnIXQ06Hyg6lfMvkQJkpmQA0=;
        b=a8ngyOig16aD5SWXUTfyDAD7sP/4Xu2e+I31kkAZ0hJNWHg2c1lUdNJxPSZt9pnb9+
         SYRwgSWS8W5/5CrZCaZAdAO59BAugC/H/jilpm1+VzjTeKQwhuUCZkpUl33eVNtN44uG
         KJs2CDjxorBw1iBkoaEq3vAYy1bwDsQc7iyMi1vjkdMF4EKWkfOO/yO5IQqiMCWWSQBe
         RWTQGdvVtJnGycYb1DrV61pjmF+XchZa/eJqyOgsbA73RYNmYiEBGXKWH4SxIbR+VY+3
         j5IWp4qpgP6UyCHFGkyyz/xH9MleGuJgcod7rZItmWBZttgZX7FDvabSHQtwSE3pBSti
         AL2A==
X-Forwarded-Encrypted: i=1; AKwUvBx4obLFOYGs8x4eKnAWYvLO/Tx+A2F49LIbGAigLcVSIBvogE/OmZBdudxA3ikIt+yULD8gRZ9mcXQBz9paDUs2@lists.infradead.org
X-Gm-Message-State: AFuF++lQWjq0O1TAeEkuDC/y7pTEoIw3lYTUCP4Z7DJdWZwC3sGMDf45
	DqVvvd+AibOzYrHxn7+40kM9BRJz84GlmQYkU7SSFHfvtPrutmMDwXoiKrpf3K1RdFz+x1iyeSv
	qEr4+rOdb2dWrs9X6yqbAKE81TxG6X3jwGqbhyHpPqsBxnPVgfN0L3OFWhNLsFmg2crq5+7lgFk
	qcPw==
X-Gm-Gg: AYBFou3qt1uoyRb25kgGc+24Iy0+Wl1PVwg6aOSubY0Zs2fmxEKc0XEpoj8IoDDXBFI
	XEyFUQAPb5ZL9vpJZASL3UjQdnQRkjyIH8RDh4qsBS4vmCQJd4ckl7LhzgXMfUqxhGMIOXJruuJ
	m+5Ce/r6Dzc/Umr/CsxZar0WW6pas0mveCERuCqnSNKiGc5QLcQ7QQ5JMSCzzYQQBeKGRVV8UOn
	KZ9bGXllnAb1bxazNLzYuJrV9SWfnHLIIJR73sZMpanhFDP30u3Vl9ek8bWcsTrHipBbuENaoIN
	EniSkBFmDWKuS7VX0Pa2uo0ZpyDbImovXFkFMsDo8eM1mLbY5g8ok+Aal4H3wvYRY1+I9AUP44U
	2TULraNFvcUoAZYRemZ+mmFiAir0=
X-Received: by 2002:a17:90b:1d8c:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39d70baf4acmr2943098a91.18.1788976920446;
        Wed, 09 Sep 2026 11:02:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1d8c:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39d70baf4acmr2942987a91.18.1788976919623;
        Wed, 09 Sep 2026 11:01:59 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm42727256c88.14.2026.09.09.11.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:01:58 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:01:50 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
        <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
        <kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
        <baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <skaestle@nvidia.com>,
        <mmarrid@nvidia.com>, <skolothumtho@nvidia.com>, <bbiber@nvidia.com>,
        <harsha.v@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/13] iommu/arm-smmu-v3: Support PRI Page Request in
 arm_smmu_handle_ppr()
Message-ID: <20260909110150.00007bac@oss.qualcomm.com>
In-Reply-To: <apujyBWK+COCa3Ts@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
	<0fe5f381aae307045e4cab97f8000c575f34a9ee.1788222486.git.nicolinc@nvidia.com>
	<178846311318.1308030.15663048615954357081.b4-review@b4>
	<apujyBWK+COCa3Ts@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMSBTYWx0ZWRfXzbMWtz01l8y+
 M7uw50W+QNhgov97O8bdpADJn8+cWXGH3ZTsXrQ+5HkBknewvmCe4IOh/wBSDGj7VaPyAVWvNV2
 z41XrQVP8IxCXrdMXDy2a610GcdUVWg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMSBTYWx0ZWRfX3H5t/DpJNaqr
 2+rcY2Wiqt7oA4mqajWNeuMVLeReOiRDlEoe3lr0Ep7nCZ2IE6uLs97JvKeMCaTvFHBf+KGEa4X
 /fEamUKVhBeXHqHWfQJKMYNu/bA7FCo/m/8mSjATgWnczjNCwSgjsbjBVkaiz6YAy0/Z1wJi19R
 iXZ+HnkM5knvaMQMfovc67N13mFl6ZPMbXcZrprD1USBId2nA5bvIcW4+4t0210va5Ta6tcB+l0
 obo+R0Z/W2N5QwKvcXp91FyDGSgejOczZGqWiFEc6alL8zImo4h1y/37Zh2TvPAQEN+sJQEjk4G
 RHWC/hmJYSEj9EpSGkNyNrzRUfjX6l+3Lv2198HqrUAa0dospCr6crVIbvwXU/hZy7uzG68Li9J
 GUeikHQd9TsHbZ7w4RE9ZEHriLYMLSWbr/Gs2G5s62cffnO5ciJELscTKkkQxASDr6xN8bSdnH9
 lk03JmiMKtVCdI9gLAQ==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa19f19 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Ikd4Dj_1AAAA:8 a=LiRWeZnokV1jdayv_KMA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: T5bKNN0C3dkyYuY4M42afU8ALitY_41w
X-Proofpoint-GUID: T5bKNN0C3dkyYuY4M42afU8ALitY_41w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_110203_164042_4326F4B7 
X-CRM114-Status: GOOD (  31.36  )
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

On Fri, 4 Sep 2026 22:08:24 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Thu, Sep 03, 2026 at 12:18:33PM -0700, Jonathan Cameron wrote:
> > > For an unrecognised StreamID or a master without master->pri_enabled, fall
> > > through to the existing "unexpected PRI request" log + LAST-page DENY path
> > > to release the credit per the PCIe PRI spec. Merge its two info prints in  
> > 
> > Either don't bother mentioning pcie spec explicitly or expand that
> > to a useful reference - so section number, section title.  
> 
> Dropped:
> 
> For an unrecognised StreamID or a master without master->pri_enabled, fall
> through to the existing "unexpected PRI request" log + LAST-page DENY path.
> Merge its two info prints in the path into one single ratelimited line, as
> a malfunctioning device can spam unrecognised requests that will flood the
> kernel log.
> 
> > > On PRIQ overflow, partial requests stored via report_partial_fault() whose
> > > LAST-page entry was lost stay in iopf_param->partial. Drop them by calling
> > > iopf_queue_discard_partial(), matching intel-iommu's handling. Do it after
> > > the queue is fully drained, since the visible entries all precede the loss
> > > point: a group whose LAST-page entry is still in the queue gets assembled
> > > before the discard, rather than losing its stored partials to it. Nor can
> > > a new arrival race against the discard, since an active overflow inhibits
> > > new entries from being written to the PRI queue (IHI0070 8.1), up until a
> > > final CONS write acknowledges it.  
> > 
> > Kind of a general comment.  I'm guessing AI assisted heavily in these.
> > Whilst I haven't found much that definitely doesn't belong in a patch
> > description, they do end up rather more verbose than ideal.  Maybe
> > poke it to be more terse in English language choices at least?  
> 
> Well, some of the paragraphs in the commit messages turned out to be
> indeed verbose, compared to my original writings. One of the reasons
> was to justify against Sashiko that often nitpicks on a corner case,
> (which surprisingly works well).

*groan*  I understand that works and I guess this is the life we live in
now, but I wish it didn't give me more to read! :)

> 
> I broke it into parts; hope this might ease a bit:
> 
> On PRIQ overflow, partial requests stored via report_partial_fault() whose
> LAST-page entry was lost stay in iopf_param->partial. Drop them by calling
> iopf_queue_discard_partial(), matching intel-iommu's handling.
> 
> Do it only after the queue is fully drained, since the visible entries all
> precede the loss point: a group whose LAST-page entry is still in the queue
> gets assembled before the discard, rather than losing its stored partials
> to it.
> 
> Nothing can arrive in between, as an active overflow inhibits new entries
> from being written to the PRI queue until a final CONS write acknowledges
> it (IHI0070 8.1).
> 
This is fine.
Thanks

J
> Thanks
> Nicolin


