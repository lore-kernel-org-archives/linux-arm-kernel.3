Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3506C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNdW+yweJKbZGKs5bRVU6qstvJcACkiQgPrrfmicQL0=; b=G8SMIg/zSAY3m82TQNf8cY6PXY
	1r8gWzjZjripBrs7Ct8q0fpsQDgR4K7sK3ARKHybiEot/CyjW0s1FxupHzGP7naRdAKdnMP0bwLfV
	1LzJZt4g/dxJn0NIJPJ9dJIPbs3AgoH4vMBQzT7+l6yX94bX5dZvIbAc3hWIxrM79o/XP0PVyoAtX
	kkJsidrmNpx+kyvf8psOVCy87+LWaHYefvGNKrxHvs7qnsZnlvKGqNd96y4DD8Kyq4y124NzPgUEg
	t5YzR/BpnMQ85OM1VfZ6QdIhefvaOx1goyYYtcityAEYXD9cjbJ2jrgw3Y/Wdid+ijhY5Y5iQMvlL
	8kovrsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckUZ-0000000BQXJ-2z7n;
	Mon, 05 Jan 2026 13:19:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckUW-0000000BQWR-3ITj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:19:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058Ji1H3505181
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 13:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CNdW+yweJKbZGKs5bRVU6qst
	vJcACkiQgPrrfmicQL0=; b=HWaC2kU3vgFofkYiclNc9RRHj4/UbLFBj+PQiNhB
	uBk5fJFfX1eS5li67GLKVPMqzC1pzBu0yGDIPKLxkHNwL1ntyNVW7IietNN89MQY
	kcdOv6It20vf27qbATMohWkzHSQrnIAXgHmwKGC/XaYPAu9Z20KZ7aKv8UA0oMDr
	QHPXEwONP3fuV1D8Nf48Gl4XRQwpN8CxQYoqTV7G1eWJS/xP/O3lUUIOF86PvmXk
	ozaeiuKvRvFwvwKYsHuiyBrK73VvAhax0j6aMfqgpUUyz2M3sxEn1Ybm1aoxMAMW
	k5G1HcLm76JSkAAHltH4gLpuk9ZAX4YyJHxAQCtAsY7xGA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvrmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:19:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so19377315ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 05:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619163; x=1768223963; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CNdW+yweJKbZGKs5bRVU6qstvJcACkiQgPrrfmicQL0=;
        b=Iz9yEom9SHqljXPzZtx0ZKygs/xR/9/47iwjvtNzIXFLa/oxtiWo0JfDstEpiYXiPM
         5pmro5gtj54mm5tgUMEF+p7ZLkxH7VcRuwDggnz0pwANIP8XHfUIgYYI+tQRwyKj/bm1
         uIBn4hHwwmbnATEjJvK7MUnBTWk6mMJ5C91T1uswkJ4HBIBnew5SXHG5mK4dkgjnDTpN
         +vLtOAMNDNwriscm9mSKbLeKwy0HaKIk/8vUpVOXlVNOCHdGSBn3WuUmmnbpjQzvXU9M
         XKwn4WxTbRANLbQbmMc/GLsQ6ffe4opu2fXp3HXexfuxp8kVOo+IYKfNZQ+foRiJoNgu
         n5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619163; x=1768223963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNdW+yweJKbZGKs5bRVU6qstvJcACkiQgPrrfmicQL0=;
        b=p9m6pcyAHIzQYDIlv9wHimsTfXbTz4K8XSRU4mVLMYLcjPb2mQAToV9/9E/nSaScaC
         GD04xrCwZ2JGj+4m6uV+tC4Iq0ZANMIgmofQWq6F/ZzdowOP+DuU8LYcYwer4SUjrXG7
         D2/zWhOt7cu7dbaJUFEqL+KA1qUTYed8i8ZOosRY8XMsQfvKvEoBVLlK1VAYtGwF0W8s
         2oGr0BTnjO3KjDZHTrDaMjyRdJDhVIIYBQ+YnxHRk1QY5RQ8d+H8MTd8ZgSZxV3Uad19
         bh/fl/c0m8BC09rGMihO3KQmHW7fNonkEyA0xCpEoENXBp+d/i6lx1UVFEHUQdKYLTTr
         PqvA==
X-Forwarded-Encrypted: i=1; AJvYcCUwR180w18jMWY33NKU/iw/cBah77Tj1HJGPGCQbQnWhkIKQqX80iSkeRkG1ar75ogask0QpfzSMhI5EEksxBut@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Ju7C/+F8wS8CFbvTqr+OeGk8RCoIaX3Hi+djULq1dX1lgky7
	21lNPWaovDGY/yyQpeg8W6BSptAm5wysbRT2g3v+3k2h/7iCJHU+SzCzGzC4rLcDPwVbYvd6mVx
	touUZ55kEsA92JCTCkKMASRZbRWG8urLOWnQ3kHemZiFG1fwXCQ/ZpGAGC5DEItCD8QMVgzo1T1
	V9Iw==
X-Gm-Gg: AY/fxX7Eh79VAZyIA11pxOxhLqkQ/+zkkootB/XzSQTZy5uH1k3SCJp+A34/3ueEvLQ
	wqD1/bhFdjBpyNtOw/Hb9EfadbW3+HglCOYpVcpcy+blsIdNxG8qGtQC6jHmQi+zCsu1L8k4fA1
	X1OiLo0/7uIxV1X6tvyKhZtUuQFsQkMCudtAKs8vkpbJmoe4BLwSxokkckfkIV9Bc/9zoF8hs4H
	Ae5bYHoc9gZY13RNNuWkkz6m4L8OmMJ8xzIwYimn3skCPtiEb4QEyyTnKW0MrkxJ1cOt51X7F1m
	XdUgPfscUHKfOoQM03djBG6xjl/sV3Lutpwlb20JQkMSFXS0UyVytoGPew2W+k0IOOjgCmDgmOZ
	1iv7JO8pitnT8hIBzbVaa+imkra5uTiXQ0PjNievr1kE=
X-Received: by 2002:a17:903:40ce:b0:29e:fc06:b8a5 with SMTP id d9443c01a7336-2a3c09a784cmr76586285ad.18.1767619163445;
        Mon, 05 Jan 2026 05:19:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfmmjXD52GS+/SFpt/E/gK2kVcZx2dB3Ho8aGtwT5PjefCe11pbLaRe31VDBznhUuFc/y1aw==
X-Received: by 2002:a17:903:40ce:b0:29e:fc06:b8a5 with SMTP id d9443c01a7336-2a3c09a784cmr76585965ad.18.1767619162950;
        Mon, 05 Jan 2026 05:19:22 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm446140805ad.21.2026.01.05.05.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:19:22 -0800 (PST)
Date: Mon, 5 Jan 2026 18:49:18 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: SMP boot issue during system resume
Message-ID: <13e3edb1-24b9-4fd3-97ba-cfa2546a73bc@quicinc.com>
References: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
 <aVfhhXHfFE6lzlzp@willie-the-truck>
 <e71b9bc5-42c1-4295-998e-4a9d71d84b25@quicinc.com>
 <aVu2mEldTlpMK0hh@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVu2mEldTlpMK0hh@willie-the-truck>
X-Proofpoint-GUID: 2Pgcethp8yDm6iRIcnmADyyr9p5SQSVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNiBTYWx0ZWRfXz9h+loMJfnoF
 A48lOpgnWcXEsdrP02j/FuKD4my5XiKCcWndpF9DBn6lpXpXszziJP0kzGvcZN+lgkkow/SP+xX
 fgibsbITLb8fxQSDofJ320kCTSgdr6E/gOgx/Uf8dmX0vlBD4iyqhuSa3gDfDeNanNqJagEMXDW
 bgQrXcRQGeeyx2Livy/fw/v69UCoG51vXFhQRuvmPQEtWXRCr20gI8dKO52USDb0uavBD6pAkFi
 r4ujxi4RVFd1Al9epmdfjZwsy6TfMPAix5/STFUSz1iNcQQrflCD535DIKsWFtVsgrWH5csplx/
 iJ+5Dx6G0YMP+/TaM/kNdvYOPlnPtyeEXKbw5txoYq0hMgf2ZUV1cqSjVd0JDq0TUBEVueLIJF9
 yG+nzKQD1d66+vOn5FIHhhmhVuTsCY6OwJy46pCfJpLfVwk9UrXuWp1XvKjm0WxvwwqHTaMwNGx
 59pOcaz40YUmZ9bykiA==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bba5c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=vTbu8QI6xcUb0PBDzaYA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 2Pgcethp8yDm6iRIcnmADyyr9p5SQSVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_051924_852684_45E1CDAC 
X-CRM114-Status: GOOD (  38.57  )
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

On Mon, Jan 05, 2026 at 01:03:20PM +0000, Will Deacon wrote:
> On Mon, Jan 05, 2026 at 04:24:44PM +0530, Pavan Kondeti wrote:
> > On Fri, Jan 02, 2026 at 03:17:25PM +0000, Will Deacon wrote:
> > > On Mon, Dec 22, 2025 at 11:30:19AM +0530, Pavan Kondeti wrote:
> > > > We are seeing a SMP boot issue during system resume when CPUs are brought 
> > > > online via pm_sleep_enable_secondary_cpus()->thaw_secondary_cpus()->_cpu_up() 
> > > > on ARM64.
> > > > 
> > > > The _cpu_up() sets a global variable
> > > > 
> > > > secondary_data.task = idle;
> > > > 
> > > > and wait for the secondary CPU to come online. A 5 second timeout is
> > > > used here. If at all, the secondary CPU comes online after this timeout,
> > > > we expect it to loop in kernel via __secondary_too_slow(). However, this
> > > > depends on secondary_data.task value. Since we are bringing all disabled
> > > > cores, after timeout, we set this global variable to the next CPU idle
> > > > task and the late secondary CPU thinks the value is its idle task and
> > > > does not enter __secondary_too_slow().
> > > > 
> > > > An earlier attempt [1] to fix similar issue incrased the timout to 5
> > > > seconds. We could reproduce this issue in Linux guest where vCPU
> > > > scheduling latency can be higher under heavy load on the host.
> > > > 
> > > > I would like to seek your inputs on how we can improve the current
> > > > situation. We would like to avoid __secondary_too_slow() spin even when
> > > > the CPU comes late. This is probably not a desired behavior for other cases like 
> > > > Linux running bare metal or some guests. Having a Kconfig option or
> > > > kernel param might help here.
> > > 
> > > You probably want to use the parallel hotplug machinery (or one of the
> > > interim steps) for this, as it avoids the global state entirely. I spoke
> > > about it at KVM forum [1] and I have some old hacks at [2]. I can dust
> > > those off and post them to the list if you like?
> > 
> > Thanks Will for pointing to your informative talk. I see that your patch
> > depends on PSCIv0.2 extension to CPU_ON (context argument) [1]. I am not
> > sure if this suit our immediate needs, but it is good to know that we
> > have a plan for parallel vCPU hotplug.
> > 
> > I am happy to test if you have any other patches that address /
> > workaround this problem w/o depending on backend/firmware.
> 
> Surely you're not using PSCI v0.1 in 2026?
> 

I am not sure, what I was confused with. We are good wrt PSCI v0.2.

Thanks,
Pavan

