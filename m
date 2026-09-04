Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1296CC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=; b=0PVxUvwWaWr4k7iUKsPTkLXTTB
	2U+mdPSAs9A7n4yHJOy+ptTNd8AgUMYF8EYJHG9kJM5ecYLP2AIGRJVvfPhOM2R+2rvzfrkpgLgrD
	uIS30AguKhOttjWN/z+yTuqVBVK5GEVu0f+UL6mJHwwfPr9FkFCf0+mY2is4HuzXX32s+UW5EHUsy
	bxxEJhPV9JYm061lA6G1cpx02hj2G+Zi9vqnbwjMME/NE/YOaG1TaRcBimJ5DyMpkbkst3LHlcLzh
	zyMC477W4tNpS6/zsLEJM2dHrYhgylSjnJffnsFyczEc0AGuApsDtK6mVT9lQkOtoTzVjFX9hADGB
	CCulmXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2USN-00000002JU0-3wfd;
	Fri, 04 Sep 2026 13:59:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2USL-00000002JSH-0uXv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:59:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Dh1e92537656
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 13:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=; b=fY4xsw7HwR9/FMO3
	jOCQfqol95XN0fLUfd+N7N9h9PW9lOFV19GbCzojuA+I13RdKhzgtKmrd7n8dszf
	prafltu/5WW2i4NjouPgcSrgFodABKV5nC952ErfIgC43A9skmCRrCs5FOWzuWKz
	/HnqL4OULbe00I1oaZuoG9BpYT+Y1wQVIQBgKsE2AZDdPJ1usaoCjyFxPSWtwzmn
	KwjyRAJcfQsNFRuwcbQyCK0RuFnOsLqMyw3eg9yw9D3soWAOporGKiIyX8pCTcwq
	jjGbBEkZdiDzedjEcCrUG2ZeLiYaH31aRza3C6znRn8fK3ajtjc3A1OZUVX+R8XD
	nyKfwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqt0at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 13:59:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1585026a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788530388; x=1789135188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=;
        b=KuxYwu6Nay2+5jsH+6R7LkLc48ZFZhgNAbfwBVLigI6OpEWFGoUHb/WnnOCpQfEiF5
         JB2ixOCP75uaxxH28rYEHPObOkWFvj46aCI0D3k0N0T9r3MY78ac8kLFxfTLs2BKwvWb
         hfsQjNs0D66ciCDe/XWkTdkfsmz3YKZkZE7lQbQdJCl6MsgOAG+mlPZtGiRU5DVwSBob
         GXMOn1PG3LaU4kVYzyNGj7L9Pd3nIIN+jHjzEYdzpvsZ6+UdszHSROgaOmxzKLuS4hBa
         qF1mDBYmdOL6wkPAjs2OcjyWQOacKLY7KfxkhUbxPzlldBHz0feAZdwRgkCKyPihY6Oe
         ydgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530388; x=1789135188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxs2oaGwNjggxYlTmrfnys1Rey8M2EkDDSrCRn43Mpc=;
        b=HhdfL27VXayk4c3ZhlxTMITMJXr4jGjTqbQBS2RxmWC3Ctjee6xwqvfQ6e+maBVZSK
         IosY8aXpRxVlqo0EZVXdVdlIh4SdRAlB2h6gTvimROhxIXQXLNrnYVaoopLr07/yJodd
         a+Jg0A396CoN3O0rq0nVHRM01LMtkpbUVtRUsYxDYPGSnh9cxweAxuFFzYx/IYM9oadr
         xcR8KtuKu4NKa+i4YGCf9ELvLRsPwOasPEMhrfikUft4NIJTgUeT0K7QaMj6WCqgNFn4
         qzZx+9X9SqZbqy/vtOGXfDYQWc8LF7gJSAZdmfkT6GLTgFM74GAdm6UnMSZOEYMFrY5r
         5juQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgVxuuzTgIG87Iv7TRd73e9wQNshBFKOaqHkeLZhz9qCQIXh96Gvr/jR6j/wji90OYc6TzjEJHdO3NulJxTk0l@lists.infradead.org
X-Gm-Message-State: AFuF++lhLYLVOxJr18dyv6IXajTVM5BNQbdRXnxmOrBXUC2Cdu8Fb4a1
	NgkjJWYEvJCS5qBjgeMiGZA4NtEWzA0h+99Dh2jZB1hhsW22oe3MSf5/4P6Wy3LqLV85Bij9MC5
	mEJkTKB2TajPfDszGuuOfvPg5BzpkFvPVzuUbHFMiTjAsBMCDBUliiiRxDyvh6/XdEePo2QiHNl
	ePOQ==
X-Gm-Gg: AYBFou1yzuJgrho2iIf6Zlv3Zee5++PriNJAWl3TaKImvDMdVlTfDrlJ3WF7dVFs2Wh
	K+/LIlxXYriuzZ4WR/RyVSlZeD/81YjahBJWjNbC7Z+ERtzOaJ1q9fg+ElCProVO4skPj9+Ld0Q
	Zad29K5/xM/+z+DltTyiXQzGUDKmiyjBGzRma6N8xIVqnJWPRhiJzp75vok0xc58TCKzwf1HTt9
	Zp/RCxCiErULGdqx8Yb86XZNiXlyJKC8Dngu0t3/dIvKMgDFJZdg8IHBsIF+5tcPqznaHy3cZlm
	4sxTpCSrP5BCYFQkxZjbqmKGGQyIRsqz7cWpqKqFMRupffrxlnvZKga03UMDLjfmYBR8fSegJXa
	aNBDIHCTtA/scW1yIZmMEBWyTbt0WNY2s+gM=
X-Received: by 2002:a17:90b:4b90:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-39b07f2f31fmr14673344a91.6.1788530387617;
        Fri, 04 Sep 2026 06:59:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-39b07f2f31fmr14673267a91.6.1788530387149;
        Fri, 04 Sep 2026 06:59:47 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.235.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm10478642eec.16.2026.09.04.06.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:59:46 -0700 (PDT)
Message-ID: <8968c292-0613-4420-82f9-2e3fbf30d81e@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 19:29:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 00/12] Implement PSCI reboot mode driver for PSCI
 resets
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260903160401.GV2133376@google.com>
 <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEyNyBTYWx0ZWRfX9mefLRfLxFls
 7FoMu1CsRdoKm1m0ZsGu/vpslHHRH+2J0b2CJ4lMbcOejTHUQiuJtvDbfshNuC1UinFrHKTe8AR
 Gjq1k1Tg+g9Z/kSbpmsEhlXBCsU+91w=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9aced4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=KLk5RGObiDQBJbYytlEIzQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KpQgwA5mMx-DUpL1sGUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEyNyBTYWx0ZWRfX8HBHWHOeVu3g
 Pl5e+qESeaO5GIYdH+OoQ+D6sfAbAUS6j+MsqxXBS1L/uLE3R5g9myhKKOBQOJ4Ptx3htYCMaB1
 +5lVisGoXXtUCEV5xHb8BjFbwcZuwCkVaITdmDyjpwBX88QHKjZ+kYWuA0kS1CAHnss723siNxM
 MOKN0tGdKkv2HT1GggPixJwPnJipS5XEI2v8XVwR/Bj2J0nqxmkYKFK9M/W5xSOO9vfDYkPUFzd
 owrKcLvPv5k9bk/Kkd2HXv2U9SUMPCxhZJtB/hjox3wxIqIy3w6DgxbL9m47g9PN9lnaVC4hCkS
 66dXfr1bcnK4MKb2P3FKflkFXwGeMovJ3GigMK6KViAOjfGxSWCGBMdsXqVP3apTd6giWdEN0wV
 583dQaI07YvNPaGaF7lbkZZeJVHvS90OtTyD+T7An2b1ceBQhND1qAUHk/NWyRNQeWZfAkfAv0G
 ztbTw+ZHqLp2y5YZviw==
X-Proofpoint-ORIG-GUID: 6T3ZvT-i230Rgg4C64zOtW19RV87xMKu
X-Proofpoint-GUID: 6T3ZvT-i230Rgg4C64zOtW19RV87xMKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_065949_258971_3001E713 
X-CRM114-Status: GOOD (  21.68  )
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



On 9/4/2026 12:47 PM, Ulf Hansson wrote:
> On Thu, Sep 3, 2026 at 6:04 PM Lee Jones <lee@kernel.org> wrote:
>>
>> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>>
>>> Userspace should be able to initiate device reboots using the various
>>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>>> patch series introduces psci-reboot-mode driver that will induce
>>> command-based resets to psci driver for executing the device reset.
>>
>> The more I read through this submission, the more convinced I get that
>> it does not belong in MFD.  This is a potentially nice "architectural
>> workaround" if it a) didn't break some of MFD's fundamental "real
>> devices only" rules, of which cpuidle and reboot-mode certainly are not
>> and b) didn't require a massive expansion of what the MFD core is
>> designed to do.  I am more that a little uncomfortable with the 150
>> lines being added to MFD core support this workaround.
>>
>> My best suggestion so far would be to base these changes inside
>> drivers/firmware/psci and use the aux bus to communicate with the
>> various components.
> 
> We had some off list discussions about this as well and it seems like
> we are in agreement. What you are suggesting makes perfect sense to
> me.

Thanks for reviews. I will move this to Aux and re-post.

thanks,
Shivendra

