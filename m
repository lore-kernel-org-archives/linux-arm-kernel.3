Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHcV7kAhtigHBS91AH4yrxaBLXSSv++mF7YkQi6hXOE=; b=2BJeEBI3Tk8+l6zuJ3cKDbeWJQ
	g7npa69522s13k5RdXVIiRfjNg2LSQFzoLID9jiRl9GVMnORjDZnedIyMmZqW7Ka3A3wdvQyLV7qq
	XZeR/vjLg4P+1z5IaITwI7UcqtujkZwC6o5RaarN4pGUR/n7tjNXsQlkHO7VDRtrb1omXufDsjKKc
	TiNHmqRSTN7kdnsBwLEQWF9qPdiC7o4GiRww1PtNqGN3VcxLreZZHgLUF7TnDn9UUbs/Rmx7rGsuI
	1w/RYzKKP0OPogyg/AFZ9+ebwD8UHcAZfIy0eMpSatypT+PgfqJgDChxjXgOa18Rb6K8AlhUSXVKh
	5jKuiKew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfu6O-00000008EL1-1Afv;
	Sat, 04 Jul 2026 06:43:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfu6M-00000008EKf-0v9Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 06:43:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6646hfCg2292895
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Jul 2026 06:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHcV7kAhtigHBS91AH4yrxaBLXSSv++mF7YkQi6hXOE=; b=hz2DIuCXDtweiogJ
	9FrOmmF6xnSA0abpnJoLk5EkHFSO4Z3RMTO/VQCBWgMjhgRxqAzipmzG4Ypw4lxa
	fk47EmOKcLpGi/ME/7dMtF721Vm3nET+tnJXStFtPeTPzEJ6zqJyrDVhmy0j+Wjh
	6WHPPgZUgQ2HcJ+U9xPnpYK0+xKT3tU8pYKJ7idLmPnVjshnM/tXem19nTrS+ipB
	yL0gw1aDgGTlbuzHSSXXkEgJl8DisoRQo6sltgUywHdbQCiwLYkL6bOSrBeMfAbC
	entTs/8yl4Dj5SzafyI/1R9etZcccXJjnpKlkFXoZ4MWoCTLA6dr5OMy2jrfA5zF
	RpqApg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td389y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 06:43:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5740so139084285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 23:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783147423; x=1783752223; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHcV7kAhtigHBS91AH4yrxaBLXSSv++mF7YkQi6hXOE=;
        b=eWUjuP/hMViYyRmMsUxI+1RxxZ52cF5GDURkXeljCJN8AtvFVvu2ASaWe8NTT60DTc
         moQGFVFF6AVe93JfG4j6W7PQ8HlEBnfTgIQQy/0QEdPRNvBl5LUt59tI6J/Tea4q1dz2
         gbNFYJ7pcgoJQuY7qgAOY5xNOEyPYQ3G8usGSAPEUDlD7I/TA8fXq77FeOi6QHTtIptE
         aAd/6WjzGlOG0pVOe6aSOhViXrW0VO6oML7ucybyuKdWGMWDg/vo/hD6il9bcsH4QWKA
         y3f+z++Q96/dHuK3JefbBEJNXamWEd8PM8rWphrPJ4MOUxsiIukas73sEX6TzbcqMwgv
         gR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783147423; x=1783752223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHcV7kAhtigHBS91AH4yrxaBLXSSv++mF7YkQi6hXOE=;
        b=Btk/mTbeoeGC7ThIAJlaiZJsyi3cGtWa6Wk7VgZeP9qvWj2krVtLW6mNM+xOyRcflx
         E8oUC7d/Rx7kSGwwuLYh8IMUQTb4HJIf6Scz41rCIZiYb+qO5zpXFBYWQ3AZxuSa9AlZ
         GRml8B/40X2lgRYAznOYk+8hZjxHATJRmkIC/J6gwcqT7XJ0FcW9VPvkzLOkQTy/yXsS
         W6g0fCuk87rLKH61JUfk9d5Jyp+bZjxlX4YyJin/6x0lBYATLFfBKjokiAk/5+n0uD3a
         ieZwO7yc3sGH7PNv0c32MAKy9d40K4vo4H+xg5JQQGXsu7wVSPuj0E5SnQPpT8gcDM9X
         31KQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yT8818D6PcrWNC4TrdAYwu7eCfd1Ex5jxPBDqpSVWMzj8MNkEWZKvWJ1XrUl9Slo/HJrnvOpGw51NgJzUK7/h@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn7FyguRcjkQBd9fYkQCdqLgrTsaeTS/jvPZ1KF1aIg5D1O5pa
	8445eNTq9m0mhhhFc5lNfLDQ36JoJL7/CGY/xgXznZMO0MIr6wj4MW03b0HaiTW/g8JT+ZVLQ8p
	C3lP3WrbqrBcwcf7kiKeaUCKHCA91W8bXUFv19IC2Tzqy2sF+NaYgY/BOGnDUPAUpPSpw9Hjqfo
	9qog==
X-Gm-Gg: AfdE7cmBWHRu2kfu9ZT31SO7dDp73Q0UE4vLQJhQ4QFrThhO57i3rBIxOZVGeQoiNi4
	D8bouYfE2CVh+O2FARN/qNE5ecBKr4WtzQwEmVJGPzhT3c7PR/cCuocsaaFbZ9FTUsHHJe/vHWF
	WnFrBxi05fWELBoWa45shzdHdNktCcj8X5SRt33uKkQzEONfEzgeakb2zDurVuN422isFZowEDe
	KX3eqpIhOqrc3MryqVzWS4M/icYyx+pfNsM9mmRvDRFIWf/e5wYzMMQemAFDJBNlRCUAK74mB5Y
	AEPCwdly6FE3SNUDiXuk2/1XjyY6AoX5bQE6WUNtG0KySo8Ngr1hFOyjqZXhW7pI/O/KYtFzYta
	tMm94Flg3YOcst0q4qeR/KAKTP71EyTzxZesBf3pkrprp
X-Received: by 2002:a05:620a:3728:b0:915:675d:a2d with SMTP id af79cd13be357-92e9a4caaf5mr344602385a.51.1783147423278;
        Fri, 03 Jul 2026 23:43:43 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:915:675d:a2d with SMTP id af79cd13be357-92e9a4caaf5mr344599085a.51.1783147422733;
        Fri, 03 Jul 2026 23:43:42 -0700 (PDT)
Received: from [10.111.130.138] ([212.136.9.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c41sm377843266b.59.2026.07.03.23.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 23:43:41 -0700 (PDT)
Message-ID: <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
Date: Sat, 4 Jul 2026 08:43:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDA2MyBTYWx0ZWRfXyObaYZ10e52K
 5vVr1+a8OsWJzqexydU2BiRygc7fTAemBX4zvDo8GFA/Lx8Vxy7hIcSkGKnVZhYEWVmwKxiUeMf
 /lE4oSuOfospGJmeV3mSB+GgdXFI7SQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDA2MyBTYWx0ZWRfX3tleG1adX34r
 uATxNh0zsV0wsWP0/IUnXNRy7CIk3hoQ5+Tqp9FF9FENAAFmWsoB5HZ5mPRN+drmDf5r1ll+w5R
 6DTPxQr25IJo9RtYXbnBOgNygiAKvNwC6l+uh9yawPd+R99GSmF+Rfrm9VzOHvjcCFRFOK6QWp4
 yfVUrO+b4rKLY9sx0jcx5bRoLyZbCGu1XbHM98BXNNA1dc5KtH1WZbJW5Q+l4ReBiifXaEpBiw8
 1RjAY2QfODAu3A0oZrPNZ6++hlBh3iLDZdKyahscGdXJVAXO1sXIlx03rv16lbVTcE8Ot40vQ36
 4zXPZ5wKMh/OITUZdtbAA72EO/g3FPMEONNkNBBSkQESzRjH/1h9r+juMiAbCZfZ/X+NNvBHLgG
 ei9sFVdQ0M8o2uw2bUTakD2tDFWONkFkOPVOmAmtz8LNjclvr3uwQFTLF26LGXJFeY7zC3cMLer
 vxXpm64nMw/a4vF47gw==
X-Proofpoint-GUID: i2vC7aIChRF7PWMmLGO7wJU4rNazydIC
X-Proofpoint-ORIG-GUID: i2vC7aIChRF7PWMmLGO7wJU4rNazydIC
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a48aba0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=HAiw8MWB_luJwFoROhsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_234346_269551_717DFF5C 
X-CRM114-Status: GOOD (  16.85  )
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


Hi Sudeep,

Le 03/07/2026 à 17:51, Sudeep Holla a écrit :
> (It is always good to cc all PSCI maintainer for any ARM64 CPU
> hotpug/suspend related changes)
> 
> On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
>> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
>> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
>> retained. The hardware design on these SoCs forces a constraint to suspend
>> and resume the system on boot CPU / CPU0.
>>
> And you fail to explain why they have that constraint.
> 
> Is it because some secure context is not allowed to migrate ?
> 
> We already have a mechanism for that in place and this hack is not at all
> required.
Do you mean a mechanism for the secure context or for preventing CPU0 ?

Can you clarify ?


