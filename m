Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350F1C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPrFnyRkQ5lya7hdY6VenELDRNtS6j9fb64j+zDHYFs=; b=iy2AtRo6zSqNNGE9uEnClfZE/k
	CX61akOA/8GEv/YA4YfR4DViV5t/TPYuf4z/T7mpSIX4gIo9twfJOUNBUXau6gj+N3vO91T5Rv2Jf
	rfTcJRHej7z4tav9Hj701QNG3LATOaE68TgZ7KhlKo4f5s0v8OaNrrMaIMHH9Oq/7PX53sYxPaMe8
	3OIulzKtMnCPjT6o0vx9DzgayGU3Htsz31f2wYHxGnTC8JGkvWBgqGZ4Dh2GhXac4PxKTgpbq21vV
	BErScod9D9ki7TpWe7Leq3MtammFnx6FsCoC5zczzsnvR/ytetXelLObId+spA3XZAfY8D8ZN9j8B
	hZEPuVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PmN-00000001TIu-44o1;
	Fri, 04 Sep 2026 09:00:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PmL-00000001TIV-16KA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:00:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mkCY1770388
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 09:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hPrFnyRkQ5lya7hdY6VenELDRNtS6j9fb64j+zDHYFs=; b=RgwQcusiD+sBqz0F
	jF2XOTgx2pvLO5qTcCp/KU57VdohSxr1FqohE1cUY2tk70/TPuqmFfLaMLktqg5G
	p4MqrQnqlWaHEFJUah4LmnpDevNJ2eLS/gnd0y1pFcnONHPfRtNjZQIVvRymxVSY
	v4R5GIk+wNf0LXbGizShkEWD5YmrmXmp0Xbd1PHNjPXeDphndDl8Ddm1kU8w8OZB
	/YZ6QQtzCG95q1v9KMPEviI16gYbWaZVyfLdO+kisFMjX9kKo1Ks5eGMfFdUZiSs
	rUPqZPmbNa63fw8kXGxpLCAHsjUTGkR52R5Qo/+UoO25SToQqlmkMr/Y2+Ue1T1w
	ifDMYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqrwqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 09:00:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93102454272so14155285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788512407; x=1789117207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPrFnyRkQ5lya7hdY6VenELDRNtS6j9fb64j+zDHYFs=;
        b=iA4hsVgHwPwK1H5W5+38lC7qEVcRzHmgyJGnTBCrow0ct45DfwA1y/HnHXDg+fA7/d
         w/hyerbje/N6A6qfN+2wDA/g/9PY7UTj/ZkAJSqBP346b3ez5jZao80Z+6Qj5RdWL1dF
         6vN5wYboEi+vLeISUWXK34LbbmPHvggctAvlkexHBZ227gm532W2psFYqJTAOzVeVjvs
         dGP2X42UWngymSdl+C2vijb0gC93vZibMIInZwXQOlMKtXqRDqC1EJZHisLUf92Qihz2
         IugeBYTvLidJg4EoQGLE1jT5K0P3Q7d0WtJnN6rFJz1fdfRnUahbd93ukf9v0SlYWhjR
         5Ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512407; x=1789117207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPrFnyRkQ5lya7hdY6VenELDRNtS6j9fb64j+zDHYFs=;
        b=C1OPBlHI8EwhPRwpu0+Oaoz6cVe5R+a2Dp5oNSENKpy3EFIc0Z4mhTZkdy0pVxemOR
         NBJSJAWRk4amlYf0IQqVJYbeZdk/zqmzuTtJGdA/We6/SdeV5tOGEVeRq0R1nFa/UAXa
         DJ1WMoX5yRVcIrM09K/r9IBf7GnwQ8TrDllGlFJsreivdaTD/ow6NW2Jhz0JoZAw3zZh
         J+f5k/nkicd3bf9PuYn2OlaCpzm2v0I8Uei06x9PP2zF3VTZlMlSU6jk3q0XIA2aLfGn
         UsdGDLJjNtJyG5DVKDLiPzlCJe//WjdmrzHpZwNweXri9z2UkSeubo17zU15hkWDWubL
         qYJA==
X-Forwarded-Encrypted: i=1; AKwUvBwXXvCejA5BahkqVPEKUIPKgL/0gHfjkeyNhk03n01ri3UE+d0nnm8nkl0HrtANT0ULj4YPofRvXd7McgTV1+1Z@lists.infradead.org
X-Gm-Message-State: AFuF++nw8iCvYO41Q7R/5dcLGOkGnyFNO3DM2nJ3Zm6rDwwKZSxDP7iG
	6nQ+v+ASHa2iHNHMJQj1ilJYSQCpESb4deof+u83uhmLzHcTvnQT6pK0rJSharf7VTNtvRUQ2Rn
	6Q/zeH7twsqbGmR3lbYBcL59v4X2hcufVXKDDHszBXY8+JFm7T50UMrD3x+H6PypxYg21GvBdMH
	4ElA==
X-Gm-Gg: AYBFou09JEdVTm+mNbpHut/f7WXJqbc34DAlZEne1H1lZFMiWHgfrJElSAJvxOita2g
	OwvLyg7M4h9JMoMCT7ljwKC3ut4ltwdGBJ085CjlELWdY42DVSpR0xjKvoKEu9g5qUsgpvwlHLs
	fd+Fl4989tczC18eA7pTQr2xwU3kujawj/8VezffQZ4YFg/1pILu46tNyQGHbixjdl0wjzB1jI7
	5rx3TRrbG6faUcfBN80YpKpxMKzSNgMHmNRdbI0lT72sydJIEZED/FZmbkIIv8Az0hVz1RLddzc
	1632jPK7gNzmfvcduzdXt/M7+AoFJ7TAtqK3SrsDNmMhCfh/k/ySabiPvZtsgsPkY6P3Ar6+DXq
	az+8I/q3oHGkxPC4FSGJ+Sg==
X-Received: by 2002:a05:620a:178d:b0:939:4a24:4de4 with SMTP id af79cd13be357-93980c5c987mr285928485a.5.1788512406259;
        Fri, 04 Sep 2026 02:00:06 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:939:4a24:4de4 with SMTP id af79cd13be357-93980c5c987mr285923885a.5.1788512405649;
        Fri, 04 Sep 2026 02:00:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm895767a12.30.2026.09.04.02.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:00:03 -0700 (PDT)
Message-ID: <0f5494c7-c3c1-4668-a09f-d8c43d1c58b9@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com>
 <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
 <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfXysgRtUpcBNhc
 ENuOTFs3f98P3r7cjXl+/vPbhXbVbt8nsywrucD66pW5MA2BJTkO5jr/V901TN2x9IhPJlRc3hJ
 tT/8Ta7pSzNEq5X+KQRR2msQAREcMps=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9a8898 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tfn4aQiUfrmVOWBwnpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX2PjyG2anF2Zc
 +idzrvDKpVfbaeKiSPUjNPLmB8okQeS4XbJnfvTTMYD74tZTNS65bCjP40JtJSY8tcfVfs6P/m+
 3FbRv2YPuQNQQZhnPynRS3LhA0Aiy+vnwK2BR5p+4YxGiuzrJGt5Vp4wyLoI28efwftF0wV4Hp7
 wkjuN/+EfFReaazSqgN+VqC6KNrf2ICHj2Kan11qCMJ19hmnk75hWg+4osjWgueXYFoIvV8Ut3A
 5GV7m4Xbn/CkTt0AfMY91Q7+FNvSnmHMQGdBnmXsn85uuMFsH/G69rtRPdcxrwVVsZ0/3kOc2bO
 kjehc/35TCqYAjSMtMYSUaEr3kWj3rw7Dqudc+7gytOLy528VNqDheHC7YbcTElHjQMUD9dWohR
 IMQJ35axgoyw8HCB5WZUjyB167hV4HFzYQLQycMh9qhqDUhtIB1+walSfuwGqGUfgIrmLsH9CvP
 9k6b65O1r8/OMhEc4Ug==
X-Proofpoint-ORIG-GUID: R3RCys4Al6G2XSb8FlftelGq1-jxEQZk
X-Proofpoint-GUID: R3RCys4Al6G2XSb8FlftelGq1-jxEQZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_020009_328958_55D04B46 
X-CRM114-Status: GOOD (  16.37  )
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

On 9/4/26 9:56 AM, Ulf Hansson wrote:
> On Tue, Sep 1, 2026 at 6:48 PM Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:

[...]

> So geni_se_clk_freq_match() is used by two consumer drivers today,
> drivers/spi/spi-geni-qcom.c and drivers/tty/serial/qcom_geni_serial.c.
> 
> Beyond the $subject series, there will be even more consumer drivers
> that call these platform specific functions. As I said above, I don't
> think this is moving things in the right direction.
> 
> If this can't be solved with generic frameworks (clocks and OPP),
> please clarify why so we can figure out a better way forward.

The way I read it, isn't geni_se_clk_freq_match() more or less
dev_pm_opp_find_freq_exact() called in a loop with an increasing
divider?

Konrad

