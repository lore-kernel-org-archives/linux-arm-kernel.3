Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4BBC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 04:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOc6z05PE+JQqEEqbcSZYn5GdoipElasSOcBl/QC7mg=; b=KDegRGZ5ADokThRGkYOIugWXAE
	h4BKWcBKiuXux9o1AuclBJxVmn8vbmrJFpnWpsYTTRr58ZUIfh3rxfwDRJFSC0nf+L+joViynuE7/
	9wLrbODlVDSKFJTg6vnfePJwAhMoZqk1LmxjzQPFYvUes+BUCOtKdRwAjsCBnuRycvCHqhA0re8Yy
	eWe84zpBuMNzjnOmbFsX/1ONwT/hqcJrUYfqB/BtfxNwp7XEDB6K1680Gdgafyoy9uQjmjFHBrugD
	8UAcX7tkLoQyczfw+YiTid6KnSLNya8tOoX4ZWtRIVrLrTGcZeNBZeGYNZa8ePqxGhYevWan4kvwx
	M1YIYQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9KL-0000000BkeJ-2ZS4;
	Tue, 05 Aug 2025 04:31:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9GZ-0000000BkMq-0cyZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 04:27:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5751T0GG013729
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 Aug 2025 04:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOc6z05PE+JQqEEqbcSZYn5GdoipElasSOcBl/QC7mg=; b=kThrxO3mtDNyptln
	ENj7Vn4UHb1q8h4R/1TPBHteW6nAWsKccbCxgqx3M2Tsp5BF4lbQSBXdzn7Y8CvX
	unP4tP0f7Eg8v9agYfX/RG4oyuQLzYthdK/1fTVj1Dmgn2zvDqhovuJL+k4ZlIQN
	l65RRm8cSYq7nQspXUEBeRnUflH/zkRDomKPWp9LrQhQGNVwtM5pEhUipo4AXWUr
	Z7Jw2K2YJI3/NRya0dPmhBGmELtQy4/iCNm56LtqumsWlbB09EjccwrVPXSlt3pe
	CIA0lIWAnYImH0wM/Jbf6oMIYuvZC1xMWW9ArpYQaqrKIzlzmK1fo3y5k8d0O2S3
	Z2U1Qg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b8ag0cg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 04:27:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76be6f0bbfdso4750369b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 21:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754368028; x=1754972828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOc6z05PE+JQqEEqbcSZYn5GdoipElasSOcBl/QC7mg=;
        b=mvieEamyXVEHPkpl7YFApa7jsEr2vvKLiMWnCYMT+2b4YoIwK1GMSaSpdwUcd2vwVA
         6EAHD4YhzawHc6M9XL8DsWGUv+KkgKU2gO65FmlUngl+3knStPXw4o7wGhNyMkggF8I1
         /L7vk75jIrPFyNkCj8JxwTjuprB/aVSELJXv4z9bS1EToO+krg6XglmIIl5Z0jZwJ/KT
         aiVbSm2d+HoiB/vA3FvXuhSnuo3AGP09avqq/Kbkw7i+4Xy+eP/payV64bUImntuO0z3
         qFVhEP9tZJQ8/dPmv3GzRd+LRVUe0Rpppt50NFIfOZw2/wwAUI3SZyqxh1A4VDBUE+aK
         aoHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGZGELx9umprlcDVzPwONYDhlQWU4ki5k9B6xzlPAe20kIK9xhrfhBMyCrOwefYgmN26SlJyKsBc4RPnDB8vkc@lists.infradead.org
X-Gm-Message-State: AOJu0YzDY9BoUGZkwHeRWawlcHmYKQuWuuHRgr4jcs+KBD2ZNHIc5m0a
	PcXYAIA1hTB8YTiiRcRVfjLmmvlIMrfZDpkWt3mSnoW+eL6+rd6FasqZECmemGiCm123TV9im4l
	GlwR2pC5n17vhq0vJix716tdSHKwPVMJFHVYAPFDuIo63KezsIzxixVFeZgfrCeTK5i8z0ooPXC
	S3cw==
X-Gm-Gg: ASbGncsx/UBKxcc+Nr4HaKuiXH6FmzzSv4bPQMNFGysNRHMIJRNhbvOZPlbyvVL83Pw
	p5soVWK5EVENobygJVnhGcVlsjMpd/+JuYhPu46kdVrcp/GlAu3LKNMU+oPWTpRnCVOLIna6EUI
	suAk50/jiCqPSz1HeS1XexpyIKOSlyNc6eUeaiIIBtopmYSIA8jnk4IvzfogWFWZeBk7W+nb34U
	Nvna5esuinsRSnMVryUeNCpwQKhzjqWwaFKOFuHpzGzDVKftG8+53pN6i1E+9orl+w4eXSPF1Do
	PyAI/ovg++n9d2/elHMvwtEtiZcdejdHHncIfnaXrL/AD007LE6CK/dUbmg=
X-Received: by 2002:a05:6a00:21d4:b0:74e:ab93:422b with SMTP id d2e1a72fcca58-76bec2f304fmr16590710b3a.4.1754368028224;
        Mon, 04 Aug 2025 21:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw0pS+Af4/vl57IxtwquJOBQTfIqG+DV8SuowUeMiLkLhA25xCUY8PxbXrQoBIQT63gbcfpA==
X-Received: by 2002:a05:6a00:21d4:b0:74e:ab93:422b with SMTP id d2e1a72fcca58-76bec2f304fmr16590676b3a.4.1754368027830;
        Mon, 04 Aug 2025 21:27:07 -0700 (PDT)
Received: from [10.5.16.15] ([14.99.203.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd4893sm11746425b3a.107.2025.08.04.21.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 21:27:07 -0700 (PDT)
Message-ID: <3e880194-5ac8-4056-929c-ac103bedc737@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 09:56:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250729090032.97-1-kernel@airkyi.com>
 <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
 <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
 <pk5wecbbpxn7v4bdwtghhdnm76fmrmglelytljwfb4cgvpu2i6@rk5turgyt5xq>
 <0207826d-a987-4464-b306-29bdbfac45bc@rock-chips.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <0207826d-a987-4464-b306-29bdbfac45bc@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 38AQPeg4LHkuGyDiGSwBMqUog4XdtqFM
X-Proofpoint-GUID: 38AQPeg4LHkuGyDiGSwBMqUog4XdtqFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAyNyBTYWx0ZWRfXxHAZ01tpAkAC
 OZQYbjxEi23pZZUtgAI++TwSYB/W6Al3nXM2r9di26BKRVgTQmayPbn+RcCW16lzCoePPt+7QEz
 iejGM3M3wRXSVjcww2Ces26FxxI2Ghd68iQ68Hbwk59ZKOLjQcw5HZ2INYqIVx4Lwwc8XvqynCM
 3Kbw0iXNzLKpBq3Dcs0/248w5+6HLtQSOoUBlHyE7QbVEvb5mKAUUfJqqnjmDNzMs5qblpfP3JT
 8Gu7A18AMmfssLfv0EDJ0xqL4VbMMJ/mspeMNY0/xgqTjY5NrkHB84l6QN03Cu5YhDIaXNMQ6hA
 yYq1w2vzUmJS1sMpYYWvbGwicfekFbX8XFaNmBlRbRlsFWPluQ8BwmGjmZG1TFxrOxB3Gr9hC07
 TyBuZDWgv8OH6F7zmkZrLP9KE2npu2F8HVqXaNQFM/UaxVU6JXeAelUYoS8mL5vdICZrO8sm
X-Authority-Analysis: v=2.4 cv=aJvwqa9m c=1 sm=1 tr=0 ts=6891881d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=BCJAbJEDZziWQyy0sFgk6w==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=lJfCAnFZCnoPuUJW_CAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_10,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_212711_317865_DC93EAD8 
X-CRM114-Status: GOOD (  39.77  )
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

On 05/08/2025 09:13, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 8/2/2025 5:55 PM, Dmitry Baryshkov wrote:
> 
> [...]
> 
> 
>>> Currently, the software simply selects the first available port. So 
>>> if user
>>> plugs in DP dongles in both USB-C ports, the DP driver will select 
>>> the first
>>> port. This process is implemented in cdn_dp_connected_port() .
>>>
>> I think Stephen Boyd has been looking on similar issues for Chromebooks,
>> which were sharing DP controller between several USB-C ports. I don't
>> remember what was his last status. I think there it was easier since the
>> bifurcation point was the EC.
> 
> I think the latest progress should be here: [0]. It seems that it hasn't 
> been updated for a while.

Might be :-(

> 
> [0]: https://lore.kernel.org/all/20240901040658.157425-1- 
> swboyd@chromium.org/
> 
> 
>>
>> I think, CDN-DP needs to register up to two encoders and up to two
>> connectors, having a separate drm_bridge chain for each of the DP
>> signals paths (in the end, you can not guarantee that both branches will
>> have the same simple CDN-DP -> PHY -> USB-C configuration: there can be
>> different retimers, etc).
>>
>> Both encoders should list the same CRTC in possible_crtcs, etc. Of
>> course, it should not be possible to enable both of them.
>>
>> This way if the user plugs in two DP dongles, it would be possible to
>> select, which output actually gets a signal.
> 
> That makes sense, but this might make the DP driver quite complex. I 
> will see if I can make it happen.

I think it's trading one burden for another, because CDN-DP currently 
has a complication of calling cdn_dp_get_port_lanes() / 
cdn_dp_enable_phy() in a loop rather than just enabling one instance.

> 
> 
>>
>>>
>>>>> BTW, one of the important things to do is to implement extcon-like
>>>>> notifications. I found include/drm/bridge/aux-bridge.h , but if the
>>>>> aux-bridge is used, the bridge chain would look like this:
>>>>>
>>>>> PHY0 aux-bridge ---+
>>>>>                      | ----> CDN-DP bridge
>>>>> PHY1 aux-bridge ---+
>>>>>
>>>>> Oh, CDN-DP bridge has two previous aux-bridge!
>>>>>
>>>>> Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
>>>>> state between PHY and CDN-DP controller.
>>>> Does it actually work? The OOB HPD event will be repoted for the usb-c
>>>> connector's fwnode, but the DP controller isn't connected to that node
>>>> anyhow. If I'm not mistaken, the HPD signal will not reach DP driver in
>>>> this case.
>>> Yes.  What you mentioned is the case in
>>> drivers/usb/typec/altmodes/displayport.c . I have also added a new 
>>> OOB event
>>> notify in the PHY driver in Patch 3, where the expected fwnode is 
>>> used in
>>> the PHY. So now we have two OOB HPD events, one from altmodes/ 
>>> displayport.c
>>> and the other from PHY. Only the HPD from PHY is eventually passed to 
>>> the DP
>>> driver.
>> This way you will loose IRQ_HPD pulse events from the DP. They are used
>> by DPRX (aka DP Sink) to signal to DPTX (DP Source) that there was a
>> change on the DPRX side and the DPTX should reread link params and maybe
>> retrain the link.
> 
> Sorry, I still don't quite understand your point. I think the entire 
> notification path is as follows:
> 
> Type-C mux callback -> RK3399 USBDP PHY -> PHY calls 
> drm_connector_oob_hotplug_event() -> DP driver
> 
> Are you concerned that the IRQ_HPD event is not being handled somewhere 
> along the path? Is it that the Type-C mux callback didn't notify the 
> PHY, or that after the PHY passed the event to the DP driver via the OOB 
> event, the DP driver didn't handle it?

The IRQ_HPD is an event coming from DPRX, it is delivered as a part of 
the attention VDM, see DP_STATUS_IRQ_HPD. It's being handled by the 
altmode displayport.c driver and is then delivered as an OOB hotplug 
call. However, it's not a mux event, so it is not (and it should not) 
being broadcasted over the typec_mux devices.

The way we were handling that is by having a chain of drm_aux_bridges 
for all interim devices, ending up with a drm_dp_hpd_bridge registered 
by the TCPM. This way when the DPRX triggers the IRQ_HPD event, it is 
being handled by the displayport.c and then delivered through that 
bridge to the DP driver.

-- 
With best wishes
Dmitry

