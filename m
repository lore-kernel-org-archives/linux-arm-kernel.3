Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7151AC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfOg9XYdQ5/vxidE+9pPRR6RYjJCbLCLOIt2gCT+9Gg=; b=0K/U5OUw3I8E6/IKNWRk6HUVvg
	HKUn2y9NKId3WT604dpCXRhsIOR01aFbhgaHpfSmx82Fjpd2n0hJdWiN3alzeun7+m3ArQ6Bn2oo8
	I4LwdOdswQFPQz6g9vUqsdFzS+4nrKuAkEMQzccYW/mWhh9FIl4rCzOldo7Mt1MV/vNIKI9aGYA5d
	6TcbwvwKegMxRjjCxXGPkYgEbiZooJBbB4VQ0YDM+uYqd4S6z4kfQWpD6Eq9q7Yrv7smXE50tmmoi
	MfhHiLiYXyBlFlVxQLtBw6myY8mMw44EZy7w0g0zWH0HDfqU5stamEeFtaLyP9l7RGYSz7bRZBfmY
	yNdHciEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lqT-00000003V1m-3BxR;
	Mon, 21 Sep 2026 21:46:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lqR-00000003V1M-49Vq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 21:46:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKencV2741059
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZfOg9XYdQ5/vxidE+9pPRR6RYjJCbLCLOIt2gCT+9Gg=; b=EFoJNMx1X6Pv4FDS
	tMUSGAa9LvqoGHZBedDqvdBcDA7Cvae9SnITto4f09jRtlbuekCrbMc/2MAKvf6x
	gy2p3mZ2bhW8HdOSvKsdo/MKLNoMpVqXD90eb3NjmicVlbPWXm3gn48rxPFjxWVd
	ccE3FYDFyB3GFotA+QlERyQZ16B85/XCfZXm5v3vSsXF7AER0i7zlTvSQHCun1zu
	nfalxcV7idp0hPZlhBnqfZke+HLmsbX2Sc7DCOy8jejO2OtTqVCkLWdLV1vBiXSp
	9DeQc19R9BUJCDEQgouChdIxMP4QiqIcIk83GTs5CpiOtWouC/iXLzm7qBgeMsWJ
	YRLYVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d3fd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:46:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so6332365a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790027198; x=1790631998; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZfOg9XYdQ5/vxidE+9pPRR6RYjJCbLCLOIt2gCT+9Gg=;
        b=S99R1vau7sIaEJ+YM9qMQjfSSa93YhpEqFBo21E8O8mPAYEOCyU/iVY4E4NRY5eIKX
         iA95yfP7iQRbe2kctesFXQkgO90hBSwHPrMY7HvegEv/G2HIeezwZ7OgC6Rl4Dc9wMYf
         QonfieXs7OESkdtlWEsz874Gz2vlmIPRAkWgy8R9uchqygLDXZSsmf6Q2adpPfYqrDO/
         JBObDBobvI2dtV+VXxFYcojk7yR2ZXw6TB3cWS95FBOwsktHKhcP8rdYJ+aLL75uB/yu
         rP0M8tAFOSEUpprVTZCWb36c1BKvwSLzWY0sH7x1tnR3aTi3NPEQzLm100dMSmLAnWio
         pcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027198; x=1790631998;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZfOg9XYdQ5/vxidE+9pPRR6RYjJCbLCLOIt2gCT+9Gg=;
        b=WPAwy2NFTpNfxmb7YRyHbresXGh25JF/C9wXma7vhwOJlI7QlvySb76Bt4EhVwOiXa
         0/BGDqyM5PbWFupZ9xWdQqU0SnStXEFz7WtF5HBbDDzCWp5rIXxTtzcGPHtNn2HbIgjT
         xC48sPoR5XiLpwMUUFJwiHnsifOojD9bJIzXXmfXa0M6UQ5+xhyGLQTiecY0+8FC/WDz
         QYqqOmmfZBYwweff3FzW9+EgfyUW+VDKrApfEB1JGWfiC5XuCuJfHSdMPCWDyIB5Dyet
         aSRkj8tUkAsKrxA9hocJTD0HYQguVb5pW7TQrgAcR47LytZ9pPtaikHGgB5T1wDfpo7/
         fSXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeK69pfa/98lM2thMC2TzzC2oBUp01dUL3Krby/yGxGVK+Vw96VvE5c2FPTtKMcDhh52I93kN+TwzVSdpSrJWp@lists.infradead.org
X-Gm-Message-State: AFuF++m76bB7778jb32cXgtuUizXuiAHdlrQbnHcRARXS/O5Yy2dlkp8
	D41R1HZNMSQP5hQVbiCOO5e82rmxUYU2gXPAULU8bkmTI/616O4pnsGM7ejQi7j+MHd3c/Y48eX
	y4hCLnVranbb32hiaoT7pg2OuDBfDQWvAKRznoAY6sp/V4+R5DBMeNtUUq/cjiLfvnLIRiIGUiT
	nHXw==
X-Gm-Gg: AYBFou0ykC/Qh9LV4SgpEAQeeCxVA0FRTTR0C7djxBbbANKZ1z8/566rliP1YygcqHL
	5yl5TIChWPjl0k3/o5ANDYQ8ej+WDfEBuRn69i8sRwKNk5rV84W5qjrEbQke8pyucvrpPcHw9Yj
	LddcCj6JV477IuMGGA2jqUsZOlI3flJpN8SiyIUdrFZq/ubUs4Q2KLY5qhkZCAUg3HSFG3C/4Pz
	jYITV8A8dSm0Iifwlp8b96Nd03wclOJpyREZycSaSlFX3Qgxz9yzT46i+gmKI6hgJFgVGU2d0+0
	1qwK/jCZImGKVF2HSjO4OOiI+nOkunkwIr3X6qWbPUJjHOtoS5Ly0+tJMvwdpHBnyMptp4n8KNt
	mtJ0JGkgySpef5rL37B/bAWqF4A==
X-Received: by 2002:a17:90b:2dc3:b0:39e:3ce1:d22f with SMTP id 98e67ed59e1d1-39e54d3674bmr17165996a91.16.1790027197641;
        Mon, 21 Sep 2026 14:46:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc3:b0:39e:3ce1:d22f with SMTP id 98e67ed59e1d1-39e54d3674bmr17165954a91.16.1790027197022;
        Mon, 21 Sep 2026 14:46:37 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f0c7e0d1sm439586c88.10.2026.09.21.14.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:46:35 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:46:31 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 4/7] firmware: arm_rmm: Add support for SRO
Message-ID: <20260921144631.00007440@oss.qualcomm.com>
In-Reply-To: <bbb2f1db-5d42-495f-b34e-184a6cd894ce@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-5-suzuki.poulose@arm.com>
	<178978126542.2352296.15676256806777454164.b4-review@b4>
	<bbb2f1db-5d42-495f-b34e-184a6cd894ce@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yagKvIcAqTHKo-tEJqZm5VxbZWecD2Rd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxOCBTYWx0ZWRfX7U19A7r0bhyd
 Z+hTYLfLYuRGEkTzarYx0Tvk4o2m6V2QoXP84/lwAltXwNgKCoS0Qa6QYU/HaCsUVSu3kWWY6dn
 kpDCuMOzCHGSzJeqUoy98h6nRlrhpRc=
X-Proofpoint-GUID: yagKvIcAqTHKo-tEJqZm5VxbZWecD2Rd
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab1a5be cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=yke8hGA7Qea92797WwgA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxOCBTYWx0ZWRfXztTfGr8mLfZP
 0/sZeD7aEVgKFFVNDouCEufTF/dXpYNj6yCol6zG+YUKa2q7ZHVd+j8+zQRg9PNB2JkIGM2jypD
 4d8EJrLWvcnLb38b+Icxk2Opr3E3ZFs3LUm2xRAtY9Y5AJeSDc1AZuVKtUQ3lT50hFoxYm/t3ZM
 Ps+/zBZb79mHpuBpCyJKcSkUnhsrWTIIAD6G/43CowBV6YWmhOTMDSxWxdn31P7V7mOzBZQ2p1/
 ovMn5HuKDMbHkYIE/mk4aGuGXbx3FyMC5IcIMzHYYq3LDRHaif12T8fRfMAPvjEqPfERjpXjFTS
 k4mE78iXG7dOFtqNZN+F/30ZDVjbWwtGH2ZAO+j92GI0tW8qGzHyZB1w+fb66JGq3pW0B3sz4F2
 yu5xnQ6guSx0ckKCA3V4zwJk7U60QcTb+i7FXLSJPnOaD67+nlHTPE3Bo0dd/Ukn+v9rgYKrSWE
 lAa5Wx5hyvxG65qHTgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_144640_173406_6A7FA4E1 
X-CRM114-Status: GOOD (  43.71  )
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


> >> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> >> index 5b0e342ce3d5..4f9898ece754 100644
> >> --- a/drivers/firmware/arm_rmm/rmi.c
> >> +++ b/drivers/firmware/arm_rmm/rmi.c
> >> @@ -15,6 +15,59 @@
> >>   #define RMI_FEAT_REG_COUNT	2
> >>   static unsigned long rmi_feat_reg_cache[RMI_FEAT_REG_COUNT] __ro_after_init;  
> >   
> 
> Was there a question here you missed ? FWIW:

I think inaccurate cropping only!  Have been using b4 review tui
(which is excellent btw!) Not sure I've gotten the hang of it fully yet.

> 
> I have expanded this to cover all 5 RmiFeatureRegisters exposed by RMM, 
> and it looks something like this now, with the use of ARRAY_SIZE() to
> limit accesses.
...


> 
> >> +
> >> +	/* Keep just the blocks the RMM didn't use in addr_list */
> >> +	for (int i = consumed_blocks; i < count; i++)
> >> +		sro->addr_list[addr_list_start + i - consumed_blocks] =
> >> +			sro->addr_list[addr_list_start + i];  
> > 
> > Maybe memmove to make it clear you are shifting a chunk of the array
> > down.  This might be worth some asci art showing each step in brief.
> > Anyhow, something along these lines:
> > 
> >        memmove(&sro->addr_list[addr_list_start],
> > 	      &sro->addr_list[addr_list_start + consumed_blocks],
> > 	      (count - consumed_blocks) * sizeof(*sro->addr_list));
> > 
> > Obviously doesn't save code, but maybe simpler to understand than
> > the loop.
> > 		  
> 
> Does the following hunk look better with the comment ?
> 
>          /*
>           * Keep just the blocks the RMM didn't use in addr_list.
>           * RMM claimed consumed_blocks entries from addr_list_start.
>           * Move the entries left out at the end i.e.
>           * [ addr_list_start + consumed_blocks, addr_list_start + found)
>           * to the rest of the valid entries and adjust the addr_count to
>           * reflect the available entries.
>           */
>          for (int i = 0, src = addr_list_start + consumed_blocks;
>                  i < found - consumed_blocks; i++)
>                  sro->addr_list[addr_list_start + i] = 
> sro->addr_list[src + i];
> 
>          sro->addr_count -= consumed_blocks;

Good enough.  Not sure there is a perfect answer for this one!

> 
> >   
> >> +}
> >> +
> >> +static int rmi_sro_reclaim(struct rmi_sro_state *sro,
> >> +			   unsigned long sro_handle,
> >> +			   struct arm_smccc_1_2_regs *out_regs)
> >> +{
> >> +	unsigned long capacity;
> >> +
> >> +	if (rmi_sro_ensure_capacity(sro, 1))
> >> +		rmi_sro_free(sro);  
> > 
> > Maybe a comment on why you free the whole lot rather than a smaller
> > amount to make some room.  
> 
> We don't do partial free of the list today, and having that is
> unnecssarily complicating the logic/code. We are going to do a reclaim 
> anyways. Sure, I could add a comment.

Might be useful as a breadcrumb in future but indeed not vital.
That was what I was assuming was the case.

> 
> 
> >   
> >> +
> >> +	capacity = RMI_MAX_ADDR_LIST - sro->addr_count;
> >> +
> >> +	rmi_op_mem_reclaim(sro_handle,
> >> +			   virt_to_phys(&sro->addr_list[sro->addr_count]),
> >> +			   capacity, out_regs);
> >> +
> >> +	/*
> >> +	  * RMI_OP_MEM_RECLAIM always return RMI_INCOMPLETE, except when the
> >> +	  * input parameters were invalid.
> >> +	  */
> >> +	if (WARN_ON_ONCE(RMI_RETURN_STATUS(out_regs->a0) != RMI_INCOMPLETE))
> >> +		return -EINVAL;
> >> +	if (WARN_ON_ONCE(out_regs->a1 > capacity))
> >> +		out_regs->a1 = capacity;  
> > I guess this should never happen, but bit ugly to fixup the register
> > return rather than perhaps using a local variable instead.  
> 
> We pass/get the out_regs, so local variable doesn't work, unless
> I missed what you were hinting at..

Ahh. Indeed, I wasn't thinking ahead to it being visible after. 

> >   
> >> +long rmi_sro_execute(struct arm_smccc_1_2_regs *regs)
> >> +{
> >> +	bool cancelled = false;
> >> +	unsigned long sro_handle = regs->a1;
> >> +
> >> +	rmi_smccc_invoke(regs);
> >> +
> >> +	sro_handle = regs->a1;
> >> +	while (RMI_RETURN_STATUS(regs->a0) == RMI_INCOMPLETE) {
> >> +		bool can_cancel = RMI_RETURN_CAN_CANCEL(regs->a0) == RMI_OP_CAN_CANCEL;
> >> +
> >> +		switch (RMI_RETURN_MEMREQ(regs->a0)) {
> >> +		case RMI_OP_MEM_REQ_NONE:
> >> +			rmi_op_continue(sro_handle, RMI_CONTINUE_KEEP_GOING,
> >> +					regs);
> >> +			break;
> >> +		default:
> >> +			WARN_ON_ONCE(1);
> >> +			if (!can_cancel)
> >> +				return regs->a0;
> >> +			/* If we have already cancelled, don't retry this */  
> > 
> > Maybe expand that comment a little to say if we can get here under a
> > valid sequence and if so are we guaranteed that cancel is complete
> > given that is what caller will probably expect if it gets -ECANCELED.
> > 
> > My reading of spec would suggest we can't hit this path for the
> > calls that are not memory tranferring. Then again we can't hit the
> > first cancel either so all bets are off.  So maybe this is the
> > bet we can do.  Also can_cancel shouldn't be true after
> > rmi_op_cancel() as I assume you can't cancel a cancel.  
> 
> Ack.  This was to handle a buggy RMM (and soothing an LLM bot)

Modern job titles: LLM Soother!

I aggressively cropped previous email. For avoidance of doubt
the rest all looked good to me.

> 
> Thank you for the review.
You are welcome. Thanks for pushing this forwards

Jonathan

> 
> Cheers
> Suzuki
> 
> 
> >   
> 


