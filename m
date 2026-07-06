Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF56DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VUxjcvyG7o7DixEmYl5pZcfD8TvxQHqFhtXA36U/44=; b=PzoajHKatClhMdaO1XriJMa3O2
	Za8SKkEDiH9jgXLuC8hYW/uLynusSU/M8ax5MkE/9jAXiCAxSOw1I2sK2uAEwS3FK1CSzZyX8N8s9
	LK4rnBNZd0CurV1+G4fLxR13xXEoMHnQ6Az/n5Cd5CNcfevQiL8+rN8/8HDXdmlax6g3dzYfmAChI
	zPFB1LGaCQkIaVUlmTNChWpobuHSDZqcUlCBdqC6PoCG6fQI6ompbEnwX68d9Y404j12nDP9HgZD4
	ROj0VT1GayTvSMsZi2tMPxU6nKzfYh0RSBXXha/4PbOWGbl1MFS561yU5a4iwtz3ZFs/V9Y5StiN6
	AjqVxi3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrZU-0000000DhMb-1ZIJ;
	Mon, 06 Jul 2026 22:13:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrZR-0000000DhM2-26qZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 22:13:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-475881b9a4bso3045633f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783376023; x=1783980823; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VUxjcvyG7o7DixEmYl5pZcfD8TvxQHqFhtXA36U/44=;
        b=RU3ZTeaer7tRxHruQbdJoXViI/YO9xv6owj3yC2g2b+EwuW+9HbUSLygJC1bloDg0N
         VgAhbUKz2vJB6SwFm1+kQUwCyYHx2/LIi0bMPLa/iQrHFLUnE6cPes6pbOwyroLbHv1d
         x1SOuXckzBtXQUxXdWQqgceVkE/VOWT+7VkoTEb6KFMAAkpkujDHThcQTJa3Qbm/mtvF
         0eqTh3mlJzLbaTeAyhLRQDKlj4PhSVQXIFOhm8wvaG6xLEgUqhcyfdpkgBnH9uReMp3u
         VqCXLRyblj11m09lWok9yzLNlcot9BxgNeaD6JmcuQ2jj9HE2SafQyQ155k+PYOpHuyA
         99XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783376023; x=1783980823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VUxjcvyG7o7DixEmYl5pZcfD8TvxQHqFhtXA36U/44=;
        b=RPQKWHUbDdDME39ql/7UDksE370PAdErboAMYSbrn9KflOT47Z/jtejzMjCV73dbxw
         ZHgeJ+rgA0oXgOrSacNih10DarFUzZQ+LhdUPKtHnJanIHM9J4Sg2QoxMvJpCG0DYFtO
         jQFzQ1WZi0AiFLwHWIp+YEoJCEHx6kdMTm+9WxceO81xMeqEAUtSYVYComMWcIONEYW7
         Es+501/Twr5ohbUM+mF7MbE3Is1bAXd5l/r26VuhOka/ErMH/5z3lTCjhHyBztaRWo75
         EtL+KUqyHic3418O+7lyG0/GDMwR67h1jIZwZ5IFS/+A7auRLh/zFQ1UGOkzUNGOEe8M
         8XFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwsRMkPRb5xnOz1M80QBXxap5L/HABXUteXOA3D3M6yX7jGkFtpzm+riYxXark71cCuOi0k4+bg6gv29/9dyGZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzRjg+z8nQELwPJFHIvetP8az7aMgK+ONQyRGkm5rntDlkPki3U
	ypUd19abe+7x7Bs4dH+PVrP6vAKrbxbLUJp3XSaA0SyFJmdIU5nR5LEvCjrfi7jSaA==
X-Gm-Gg: AfdE7cl4A3T83LW6kS7nhRyZFWkvznax0G5rh6+PCRyg7vVOSPrg3H8V0hZqP+iTyqa
	fmMmoWJI/mx+8i16XBjGFwQqJ+F3jiGGqfKakWP3pIfbEnm5Ls63NUDdDW4fIoZ4KVqzWxpsMQf
	GhbxMZHMmuVtLJ1OaqnnrXkkgcRHntq0tsp3q5PLQlbXe0Z1LaoL2ih7sx/timAz9ucwpKnpNRs
	q3yf8clHDd8xu2BRO/05Losim5g2SrSrvcHhL3le8THvkFiIj8xpwAXQF5s1bJXjHONb/yqBwru
	qa4PzMWW/q3DO6BEhHydMyymnF8VGLOfAbJlwk30uX8I/rTItU0LBYwfTGc4dhKWV3heXQsFZcp
	db4GbrIViaHeMrymETjhBIPCB8rumLeGZaLvEcqN1eCcel7ci+9nK1ku9RirpYQPePiruMPMCg6
	FIz7oKY18sl6RNUYyP+A2b+e6HfXZhULP5aUX9BDu+++/59/hSNVDgr2CicMbLtMUgMP1WrA==
X-Received: by 2002:a5d:45ce:0:b0:476:c622:d41f with SMTP id ffacd0b85a97d-47de66dd5e9mr1597139f8f.47.1783376022918;
        Mon, 06 Jul 2026 15:13:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039afacsm26722332f8f.19.2026.07.06.15.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 15:13:42 -0700 (PDT)
Message-ID: <ad91c7ec-83db-402b-bec3-3821dbc607f8@gmail.com>
Date: Tue, 7 Jul 2026 00:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
 <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
 <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
 <2a556ca0-d276-4c56-a44e-9d8b92a3af6b@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <2a556ca0-d276-4c56-a44e-9d8b92a3af6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_151345_559327_2C41A761 
X-CRM114-Status: GOOD (  13.48  )
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

On 7/6/26 11:56 PM, Akhil P Oommen wrote:
> On 7/6/2026 4:37 PM, Anna Maniscalco wrote:
>> On 7/6/26 10:44 AM, Konrad Dybcio wrote:
>>> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>>>> Program all the register needed to start up LPAC and send initialization
>>>> sequence.
>>>>
>>>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>>>
>>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>>> ---
>>> I believe some/all of these writes need to be guarded by if (has_lpac),
>>> as many GPUs lack these registers and there may be side effects on
>>> others
>> That's correct yeah. I'm not sure what has_lpac should be though.
>>
>> Something we add to catalog? Or checking if it is a gen that has LPAC?
> We can introduce a new QUIRK (ADRENO_QUIRK_LPAC?).
>
>>>
>>> [...]
>>>
>>>>            a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>>>> -                              sizeof(u32) * gpu->nr_rings,
>>>> +                              sizeof(u32) * (gpu->nr_rings + !!gpu-
>>>>> lpac_rb),
>>> Should we rename nr_rings to something like nr_XXX_rings
>>> where XXX is some uarch-generic (i.e. not SQE because we also
>>> support pre-a6xx) name for the main number cruncher?
>> Qualcom calls it GC so nr_gc_rings perhaps?
> How about nr_gfx_rings as those rings can handle graphics workload?
That could be more intuitive yeah
>
> -Akhil.
>
>>> Konrad
>>
>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


