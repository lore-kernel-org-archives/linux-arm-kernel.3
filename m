Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CE8C2A099
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEkWzBbnfz8We3qDGpvoZp5+bJ/kryjzDFwZRQ2Ij4s=; b=k0nE1cAztjoW1Chk/5JpnVQs7h
	B3V2xqOpPC8kp0HEgn/zybyJ00WmSniFnSqMscB9Y4DDilkH1WRYN9+9Ihpn/FvOIefrs8eUgbtTQ
	iK30UK5Xxu1/sa0ZqNdd774PNR3rV70OJIfJ+8FOTJszk17f3Z+MDYWD126cJj6NiyP5zzoQ6OVXm
	ZRvS7yV3vlKZWt2/Eddwo9mIN9sUjcB4rnfodveggp+qwabWXaxQvIQtKdnnMrArZALvCBg2h+6EW
	tqC4ZmcjqGqYtR5fOuVfuTk0NO4XAOYJb9jCcex2RPun0E4qHlcD+PMXVH5C/TKtb+q5wHCjzUJKb
	1OZVmnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciEh-0000000B9By-3HrR;
	Mon, 05 Jan 2026 10:54:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciEe-0000000B9BS-4Ae4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:54:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058KAUD3867998
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 10:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MEkWzBbnfz8We3qDGpvoZp5+
	bJ/kryjzDFwZRQ2Ij4s=; b=fuuF22yHKXhKayGE5q3TviVOE4zUh9m9d15M/cFh
	w96XC4zz07sYaNe52gqWb0r/6gB4YaLFH5bxj6WI9qnwXAq49BwkCkuCcfZZ7HAy
	yFQ6FCergy6oNCELrZ4e0fpLzUxSsftw9BJokv2IVbysGtvNHO1msIWcVensAcvx
	sxDdO2TLoNV0iwkhC4aMu9igJ3WSIhPAQfQzX8wHytB75WJSFORtRXdWZgv0yvRI
	KDQCjfACHiHhDwYYqihxG0ljjIDbyw+5bHz0KdjxbUewFzPaV8vX0DNg5zF+2Qal
	C3cF4lCavipPRmzXHAsC77pySWQcjjkJ1Hx7VEvpiDEbDA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0hpp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 10:54:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba92341f38so14993571b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 02:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767610490; x=1768215290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MEkWzBbnfz8We3qDGpvoZp5+bJ/kryjzDFwZRQ2Ij4s=;
        b=K20Fl5QMLClD4h5o46BmjpFR9/Y1ScDJ0j3o6razqukmXhWZGMVud8tvqlThzVto/s
         vCNZlJ0bRK+dJupq84Py5Gp4VrR1Lsnerv1rtOhKmBKwEGZ2+jp0/q7PsnU72Uho4bja
         802loVURH0/uaffT92xHmMJCRET5FBjoFkDvvQtMr6oEOmXwuh/WEMiPVHDzQg2PCkM8
         3d0WqK+YrMsXNJOoNHZvX8lK7V2FmV4NVWPBpmuf57DtbhKjXYVorQlXKu0M4uHRw96c
         0D4z8I/E+1actW+I7pCRUFFqmMGuX7UJTkzFfWRxiOIoYeZgpDSunT97XyRTVUasxyAo
         DGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767610490; x=1768215290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEkWzBbnfz8We3qDGpvoZp5+bJ/kryjzDFwZRQ2Ij4s=;
        b=NCOEu9L10U3Jst/mg+w0Er/58vQyzg0FW/jKu5YzybBSL3kA74AOUs37v/cq7X+3qG
         Cc+VKfFuw33MKFCLmm9uJc6CoDM6x9PPV6viv6Qlh+apPR08O2PdzLTLUwKmDSUuEZmy
         EMSFV/AfUpULq3M/jCV72XP9I2QeaAsdqIQ1hGUz3RnyjMF4JUPDyIfK/8RvfU86l3OC
         e2QBHDCxFaZdhX5x6zAAmiJbAT3brX1ICXLnqokwME1ot5nK29OGr/pUV3RQa/ySZCiR
         nhiBxMH3yIaXAwsn/XvX9ZcymQGkT8jTcJ/0z8EGIyaR9B0PNLjUmm9GneKcwsLEr2lY
         Zx8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYQ9dxTk03F6fLP7ySushlzXo0sUhhJR5EBFvzOmzn2f/+Jxwoy3K1vKFi6oDMoAwsGkO2kuUJvKuw0TO+PM3J@lists.infradead.org
X-Gm-Message-State: AOJu0YzeZ6N06ab/2NXVNxvXEEi4jB+i/J0R+zoADPr+QCvqon83EGwn
	lD871Ae6YqSacT8aEJmRc3x0OD7BJ0D8DIxoma94YkR/3GRFJnpOfrfzBqNLmRESdrBEPwqp+7y
	a2acUDCW3CYmJTHex6agLljrgZwSJqop5kbj6XDAdCwsVy9NwcSQueV4jNfM5xbi5zSlWsgoHzQ
	a1Xw==
X-Gm-Gg: AY/fxX6ISAVIUzs6LTk1jT2txfl8O9hsvd935brBpXZhTvFPLAu9g7gT6/TcZrEmH0p
	sGg9Ku5lSDwG1tEQaiFqp2lEgkKSGZNvTyl/bC359FfT9HbtBr8FvxRkUb5qhTrEpGXx4MynUKn
	QrFpqr0gJmumMrBZb6j/LQdkZBOIZpF4JEuZzfcdn9oZZH6O9hIYFs3uP2vSVmKQW/xvuUE7JyO
	U5cFD/dj3sg7JTwQFzWFKPfkvXo7uiZeZTBm6XBk0v25BddUta1Ou8HaigOOfUsYm3iDE6EMrn6
	5rGtGydkW5cxEJZ69INIUk5xF6faoUvPht4CxH28y+T6yKyMOq2M971sfWAbxoAC+XGgZnwOIjl
	OYZm5mS32ob6DTlOvkMgO0Hd/kjPuAjpEiy7/d0VOpKQ=
X-Received: by 2002:a05:6a00:4484:b0:7e8:43f5:bd3c with SMTP id d2e1a72fcca58-7ff66d5fe23mr42311658b3a.40.1767610490146;
        Mon, 05 Jan 2026 02:54:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAITuP7fdCdESz0ZEvgIRpDOtfsj9uOLwGoYUIF8cPX5p7VnJeq0LMZkYIVp8Nva6oZtar7Q==
X-Received: by 2002:a05:6a00:4484:b0:7e8:43f5:bd3c with SMTP id d2e1a72fcca58-7ff66d5fe23mr42311636b3a.40.1767610489638;
        Mon, 05 Jan 2026 02:54:49 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f300sm47905161b3a.54.2026.01.05.02.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:54:49 -0800 (PST)
Date: Mon, 5 Jan 2026 16:24:44 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: SMP boot issue during system resume
Message-ID: <e71b9bc5-42c1-4295-998e-4a9d71d84b25@quicinc.com>
References: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
 <aVfhhXHfFE6lzlzp@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVfhhXHfFE6lzlzp@willie-the-truck>
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695b987b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JKDgdTFgQULNwJHYBRAA:9
 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA5NSBTYWx0ZWRfX8GcmVX9DnzdG
 NEXiRLLSEI4I9r6DKt2sTRpbJWRCA3gLgx9EQhmCaWaUO9CYaVVtonYo2SqQ/XlGd7xPfDztX8a
 rGoE9xcfFkBCDAHbS66DVZ+4ltVJp/k3mpZzbkq2JRi309KGskIbbWO4A5k2mBnUz2Dh6XGKnIM
 9ZJiduLmocsgP65EzOU18ttGt9b6jxJLg84861cBvOmAtnom/vVg4+DEHViUwnHhTMcsoBJxi5Q
 yA/9BFdwLA4lC2Dw2EYe1hDQa0N26OEvMWzKCca2WaPhEzdRiAnj4nr3djqiDflr7WC/jJ83rpH
 0yLR2zE+T4OKHk1h+xgaXCvM8De0pmfEDwCRYQS/FYkZla9dCtNMug4uCwR/oELzWVbk3R49KJF
 MiiXh1R6oddliH3XR9Ka9AQZ+vHwgIM2HRzYjTemctE8smNa79rSi5zUlNSwv9Ckn8tCxL8+Kpl
 V9LYm+CHoHde4qfe3TA==
X-Proofpoint-GUID: 0StdkdUj5XaZ7bVQxLWIXbA2qBRS2Ijg
X-Proofpoint-ORIG-GUID: 0StdkdUj5XaZ7bVQxLWIXbA2qBRS2Ijg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_025453_161733_F37C232F 
X-CRM114-Status: GOOD (  31.41  )
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

On Fri, Jan 02, 2026 at 03:17:25PM +0000, Will Deacon wrote:
> On Mon, Dec 22, 2025 at 11:30:19AM +0530, Pavan Kondeti wrote:
> > We are seeing a SMP boot issue during system resume when CPUs are brought 
> > online via pm_sleep_enable_secondary_cpus()->thaw_secondary_cpus()->_cpu_up() 
> > on ARM64.
> > 
> > The _cpu_up() sets a global variable
> > 
> > secondary_data.task = idle;
> > 
> > and wait for the secondary CPU to come online. A 5 second timeout is
> > used here. If at all, the secondary CPU comes online after this timeout,
> > we expect it to loop in kernel via __secondary_too_slow(). However, this
> > depends on secondary_data.task value. Since we are bringing all disabled
> > cores, after timeout, we set this global variable to the next CPU idle
> > task and the late secondary CPU thinks the value is its idle task and
> > does not enter __secondary_too_slow().
> > 
> > An earlier attempt [1] to fix similar issue incrased the timout to 5
> > seconds. We could reproduce this issue in Linux guest where vCPU
> > scheduling latency can be higher under heavy load on the host.
> > 
> > I would like to seek your inputs on how we can improve the current
> > situation. We would like to avoid __secondary_too_slow() spin even when
> > the CPU comes late. This is probably not a desired behavior for other cases like 
> > Linux running bare metal or some guests. Having a Kconfig option or
> > kernel param might help here.
> 
> You probably want to use the parallel hotplug machinery (or one of the
> interim steps) for this, as it avoids the global state entirely. I spoke
> about it at KVM forum [1] and I have some old hacks at [2]. I can dust
> those off and post them to the list if you like?

Thanks Will for pointing to your informative talk. I see that your patch
depends on PSCIv0.2 extension to CPU_ON (context argument) [1]. I am not
sure if this suit our immediate needs, but it is good to know that we
have a plan for parallel vCPU hotplug.

I am happy to test if you have any other patches that address /
workaround this problem w/o depending on backend/firmware.

Thanks,
Pavan

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=cpu-hotplug&id=6ac1e52f7cdfc2437dbe3ea727bd01df342a0fbc

