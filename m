Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981B9FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fylLG2wwQxPhuCjUzW2jU3hgZkUTYpwG6DpN0l0UY6o=; b=QAySWYglGxhottQqf44JIp+Eqk
	8ABdfaiFjmi6E7PX0J3V4iKSK5EI178/HhDoy0A7K02C3cK3nuBU66uyKA9rqo17gke81YA08YzCS
	zYwrv9IlIb4ca74ZrUZbtl1Fw8JZzIFWJ9mODudfniZYkSUpgq7xE2xpuXBhlwoAoNZTSOttOv/+M
	izgY2Z6R07Gn4SYChsmJN0s9/GoUcoH1WALVH/jMd3feteODcv4NVEQaeymt1P4o/VqAaNmGKhWXh
	A97Flwxd40+yzs4GShYTMje37gGSzUWov+W44tQOVmP3aSQIhsFgZvrVpt1OLOm9y9C54lk1iau+J
	4etc6Heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhcp-00000001RMx-3mZN;
	Tue, 28 Apr 2026 12:33:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhcn-00000001RMW-27Dw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:33:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7kWtJ440715
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 12:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fylLG2wwQxPhuCjUzW2jU3hgZkUTYpwG6DpN0l0UY6o=; b=orEIIWdZySpVRhh5
	Cf+JGLisyug1Y3j9mI/t/kiROECrg7f4P3964rlz1aTuj+q+gEvx3U4GPhveIFUp
	LqPIpGZfdfQdP1Kq5eLbIJ1osgrsTLutwKkPedYmbaB/hddqgGBRBhICzdotGM54
	7F4qiv84RzxAZtAfToG33ZOHaQ6MXPGFyaXUV6fWL2F0ZHKXph0jnuLd2guXN5o/
	f3yMvhxGJAGU3xKZZGSLY68WEJoVrifNHqyF290JiPNWipRSfURd+TmmgVOs+6Pv
	hjHK88nSg0EDc0NxHbVR0L9cZrHw1ogztkj0/p+nXKfZ4HKxgYR7/hqkcTtKnZMG
	mmDobw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac44dxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 12:33:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f543bae3cso6116657b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777379592; x=1777984392; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fylLG2wwQxPhuCjUzW2jU3hgZkUTYpwG6DpN0l0UY6o=;
        b=ehWWLqc1thkN8o7j2rJeTNSouEsmg6RehGTQdr5MczwOGKc3gSJox5Wep/LkRscAoV
         8qvfBEBmoG0jSe01MJ2yLraWPFtmCPszpizVd9SfXNELlUgXj4zafWbzQbMS9WjYcxto
         MBw0M6q6Zp0TjvvtAMOug6fu1AA3nczmwpFi9pSLP6GL7DDwyq9mSnWSA1iKmO+4aZRH
         +YS1VxakCBwlSwbGdNITCxf+nb2w84G27pzAFtx/V9ZeEs1bSDy/SB2i7HrNIjcJs3GL
         vbj9YW73IqAZaXdqq0QZ9bKrcwFDnb2jzbZn0tdXiodPVao3h+7cNkBmA0Lo6sJkAa/W
         4VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379592; x=1777984392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fylLG2wwQxPhuCjUzW2jU3hgZkUTYpwG6DpN0l0UY6o=;
        b=Kp/sCCmgU8wedNpO/oXCQBGg+3ccTdpGcMSr+DuO3kPpfX1bqLC1VFTNYD4mE4CEtW
         pwoI8qGd3wZd0yGx//j8EGR+7VIayomJM4juuUF93I+79P5jyQrr4OIuoUz4g1GXapQ+
         uOMnxnsP696FHI/2kRRYbtXJpaX4Vfn2o+Bz8J+T58jzPIULFDtGt4T2UUs9yGGPg0X8
         tRFn/r9WcQQjuXeqRxlf8uhM7TWhOU6RxzfwPSsJqBrvFNcbOy/Y8cpWDXXv6yq2pFHR
         o8jmLJ9mtYgyl9uoYcwgYfunOw3q1q+X03R7N1uPcGDVaLjnDFqkqJ06VoIypREWTqeN
         NowA==
X-Forwarded-Encrypted: i=1; AFNElJ/xXBOszHnFcGqKLKjlsrXDLdJSoXB/d7OXzD4z/nct8s5J6Jk5Vx1/M2NeyrtCcHbePGmCe+Jt8aoI30bH54vy@lists.infradead.org
X-Gm-Message-State: AOJu0YzsjtCNjb77Sr0SiH+4crYLNYte2GM9lHhzoVmh6R/fLkV0ZKJx
	9VMdbYRUBZJqmCrOug8Ee9dtZY4gPxgWkAQFWsWxn0KjpA3dvVeuj3aZ8VK6majU1MX/+wgCoBM
	bE1DVrVse4pEnmKLvbBvuihTDDClvN+txX/Hz72WssDFIXsn0xOOMJUGLNmlGZpkIPK8xDvwe0F
	1Eiw==
X-Gm-Gg: AeBDievp/YSuGPbBSauT15xKYL+dz9sSz+ffbA+yLUwobPYxqHpQOutMSafQbK/bikS
	P57flA2/AzgK8PFvcye0silvdSthyGzxCuFUd9BgiWCEI7T8qUW0ehi+NJMt+eooImeNy1eeHKd
	a15UV4RKw8SMS1Y7dhitsoslRMPXdLElBqT2I9aUG66N2cA/OkRwUUGB82IozDSkEPK4DvgZMFz
	2VJP89rIMUsNNI75xWsLzphdrL4p2FKFitOD8DHNHzaQV0wFsCyXqMggPbHvItH9BogysOhbOgy
	pL0QtaeY0vQHsOEc6vKQf4kTlBRAX/0Awk6b1QI4BPfgDbHsspreG9b/kqh0xtwkrBB4mPdOM08
	oQeHxoUrYjmUXbTbFL4gE0y2b6DztaWKdMm7DdaHsGWACB6EQ9ZUwv5NsIP5O7h+XUbE=
X-Received: by 2002:a05:6a00:80a:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-834dcdaf080mr2760980b3a.25.1777379591395;
        Tue, 28 Apr 2026 05:33:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:80a:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-834dcdaf080mr2760933b3a.25.1777379590888;
        Tue, 28 Apr 2026 05:33:10 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae04e49sm3228694b3a.2.2026.04.28.05.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:33:10 -0700 (PDT)
Message-ID: <d0420528-cfab-4b43-8488-015755777194@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 18:03:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 07/13] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-7-dcf937775e73@oss.qualcomm.com>
 <CAMRc=MdLTMX34DEhoMskMzjRqx+Cdpm3=P5QTZ8S6sUVJ3eTbg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdLTMX34DEhoMskMzjRqx+Cdpm3=P5QTZ8S6sUVJ3eTbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sbMLTAEDzYEF-uClL1YS8wbga0VpOxaM
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f0a908 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=xJRVJYJ9JtZugbA2SwUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: sbMLTAEDzYEF-uClL1YS8wbga0VpOxaM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNiBTYWx0ZWRfX+C851K+/QHwo
 I6TLIx4Nk1tzAyaEppY5Wmtg4QL1Y27pKl88jKgzoW/0BKwzF1i2zxfaRmgcolrhd2NF39FWqGe
 VX8DJkzJz+A0WpgLCYun/JvOKTtB6k6E5jGIiWrD1nzlkKhAZDvDo2vAVqsaRVpiYjFo/Td6DUd
 SxipLF30YG7dlp5OFRjmXFkfNNjQEDjW+WCY1Snd1lrpueoqsYgl4B5rDMFA1edaB3IDqiJ4wul
 +oNC5cr/0gthI0lTDRGAdE78zUX1MWXmrZS65Q1EjfsDZfBQEHFCMvrwcjQqGV4QPkyrdJupqyh
 yNt2e8008QcNdwV9GAOloY9P9oACvGq5aochDvrXFVboEeKYpKaus00n6A4gpWOv6YSVp2jNqdP
 SJj5wFX5mT2zf1xu7TZnT/HWD45JcsOfOQak4xkQxBkvAsuLWrv3QbUVaFyJmde7LGt0a1Sfvdf
 36jS9c2tgemCDu7kfqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_053313_553059_07085415 
X-CRM114-Status: GOOD (  11.89  )
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



On 28-04-2026 13:26, Bartosz Golaszewski wrote:
[SNIP..]

>> +
>> +	return psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[1]);
> Looking at this, I'd introduce a core reboot-mode helper for initializing the
> predefined_modes field and adding an array of modes and use it here and earlier
> in the series.

sure. thanks for review. Will expose a call from reboot-mode to init/add 
predefined_modes.

thanks,
Shivendra

