Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E35FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5kFeqYt/6hoO6aGdTKf3E/wifl3FzIvEDfFJxnGaXE=; b=xF/Z1kUmXAsE/0tNFk86fqRmwE
	AKahFXhNe/4hb37U0rDSx3Em/HhfR8WeSmIQsxBvSS6cqB+slgJWc1q204VJxG91tHZ8mx5FuHbSP
	pFkitTkk4+GU0Rmht8d8CR1cZilQsFXOJJtgWYSyAmezRpWEAEcJwMQlfYXTMA82i67D00UAKMO7F
	zph7wQSYADtea2uYSV1YCwOpzg/dQW8b9CWPtNTRR4WVRrDgIC/OXpRFElINrtMi/mIkNTyW4jZ9G
	wR72q5MpzP+Rf5r7Oz2ZzT38VlIqN0Mbrjo+Yx1+rcInNeIejca/MH2mSRgEssqSfLD349pe5X+4D
	o0ybQang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhOI-00000001PcS-0oe4;
	Tue, 28 Apr 2026 12:18:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhOF-00000001Pbw-2RYM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:18:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SC0ajr1625125
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 12:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5kFeqYt/6hoO6aGdTKf3E/wifl3FzIvEDfFJxnGaXE=; b=A+xZbf2gkylFt81o
	x+cSbgpkgy2MCYpYlbrhyfOtVlk7k/QVjPNC8dY1doBJk0mHmknvWTQbVpjICUeu
	ryCIKDN6nBNLuxQ0NXTzDPaWJuKX+i83c6bN02soMKSaf/MVKUGnCIvRireT6050
	Bbe2yXPQKyLJDW56Exk1kG/78wtLIpHBraPeluatU0U4YFwlx0HXV59wveMu+7it
	929B3DQxTIVZr5jibBm4YO4rb+/GDFOs2lNM5ZhelSlENe82AjHHjAtGj8p3r0WU
	9lXompbtVmDjPFB7w9ADopV3I9BeACDcnyg+ICxIuR88hD6fQYHxnQwPFrf8tZUw
	2zD56g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsawkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 12:18:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35641c14663so13307043a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777378690; x=1777983490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5kFeqYt/6hoO6aGdTKf3E/wifl3FzIvEDfFJxnGaXE=;
        b=UnM0a4pWOmbnFfgp8Gx8gF61snnQGyZ96yCki7XaX55v8+jP9C99yTmvih7T7PGSOc
         CZT1Xpm/f9V1BQsuJGrp3xsMgwpiu5ZUclYNu9PTN53p5FSvhzuRS8kPsBq8OYLl6pVr
         XDr+fy+zTV8NAMT+Zsaw9P7yvvXb2eBBU/qcXPWyXF2jnPr0rrvtY88rD4+3CduKRXOc
         KWl8TiDEXTlTXRZJaeND3kM9Brfq8mX06nDeXdfMjtVS3KCYyTX5FvP4RV2wNch+sfch
         0Vbiywh6ntaPht5r+PAbUS15n7/qxIrmhzsTMAmY9/VjeVZjY3LlSHXOPdEXsc96cNtU
         EiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378690; x=1777983490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5kFeqYt/6hoO6aGdTKf3E/wifl3FzIvEDfFJxnGaXE=;
        b=LLS6/h0aDSmE7m1jnK1o4NgZZK4AaU/t6U3KywvAhR2ZEeGPoziEf4JjKK639fDPu7
         GMs85DIGIzbUl/FumkSopyahSBjDeIc9JtzfRRa6BTc1UkuEEp0TPiMuoyhZFeKWoeAK
         lnZl87PPYo3GDecHLR/dF7n6q+gZ2OFnGc9TBTs/kICD9ykeFhZIdsaFcNzHTn4Wku9E
         95m2V8tAYr7PO+LmY8DjVql9rYSShz2JibAeU/5WR1l/mQPR8JuT7kaAi9Pt0WSfC1S9
         KXr3BspVeY6c+9RjTLR02kt8bKeP1GzSpNniVZrv89YmrPolDDyhMxLH5LKdFNoseD8c
         J60Q==
X-Forwarded-Encrypted: i=1; AFNElJ8P7sCSBe9imJydlhUP62ejhlSI4i7riqQlPFW4qs/UxKkmGlBaC3ef+ySsKUfribonZtBb1JPLaQy9sVgbPI9U@lists.infradead.org
X-Gm-Message-State: AOJu0YyBYhmeA0QMhzZtYS83tpQbkSdvQINasbskGKO8ueZOrlcuoMk8
	fhYBzSkFwsgn4/tVFwPY6D542OLbXBhYm7uALZ49nMiS+LGuyR8+++Yr9U9P8NM9sDKhPknc7Jv
	PMat/5Yuk0RkVTdopM9YK6ML0J+uEMTxiwSm9N3cG9qq/1s9Wrn2nLQMry3BpY8LxJKl9D3AFkY
	KQpg==
X-Gm-Gg: AeBDievfh6YLwbS9V/zql5IQa+HKLuf2DAz+9SmVKaAux3YOVYKXqB6UE6XTjz2Rmoe
	P94wejkezgRM31wdlmxpIoSVMPEu2sx+gCQkalG9jM5vgaPvz3n9moCAn+Et07gjj7TKkRMPN+l
	XPF/jPBgi+7Ia47hUpYVjRxwjJBYwASmeuPvFe3S9L2hDOU5Tpbk0Y/e58AxQfiLax4HPFfitDQ
	mgUfwTXwDQzwGKkGdYylTEKEjwSbPjWdq5vPMLPn2mlwrSuGOFY2X4jooLrsVrGWX7MUuiGJIW1
	dpfjYZTeYWUMuKVaoCAeXEIh+fekf3d0z1BiNpgOtJa9A22Ko4IJUdaqOEh32WuJ7Mm7UGKBJij
	ayU3bVVBvVR2uvvB3TdpKIuDdVY8bIXH7nFSB4paFfaabxi7diiudOd8YFMwkcqI3dVo=
X-Received: by 2002:a05:6a20:958f:b0:398:7830:8a40 with SMTP id adf61e73a8af0-3a39c0ed8c6mr3526716637.23.1777378690282;
        Tue, 28 Apr 2026 05:18:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:958f:b0:398:7830:8a40 with SMTP id adf61e73a8af0-3a39c0ed8c6mr3526670637.23.1777378689785;
        Tue, 28 Apr 2026 05:18:09 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc6015691sm2244868a12.18.2026.04.28.05.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:18:09 -0700 (PDT)
Message-ID: <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:47:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
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
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P-LUUgKgODNjb2ilpKx3aI0NPwkM5y9n
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0a583 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SHOFGYX_daQPcY9Fc6gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExMiBTYWx0ZWRfXx6K/ZdIxl2ey
 W9GB8ecuM8o0HfztZEyn1LW/PbCqowX16v9dO96KFiwWDjYbHBfDNgfca4tYvUghUkH4VRgY75S
 GDhfo9ALhh5xz9UT4tmAXHc5dTBmlsSXYJbIIA7WJx2VXLNoWhT8yjuic34aZl3MEph4TS7+mnG
 wyxxqAOfVbC9RP7fPzOTUrGoyJhxw9HAAjXx2m7OBBYID3+p01a+7kpL28Nu3bHr8J728GYIaSz
 sUiUKJ8m5/PVbjXLxJbSORfb9vRWPLfI19ui/DJAhmrRgYmAMGE5Yy56Iviw2ZVm0oyBiskXvcr
 d7JnVpa3KvrR8tjAisWp2X6QRhb25rJ04i1twcimoqtSayAgT0IvX+9mn7+0OxmAGQNNhivG0Gw
 PfD9V5ExI8nNXtCGpWVGhlMXL/s0hByJf7zznwo+QozIqtayxgIRor0BkgbgGvmlwzl3GEi1TZm
 kNk+ZrG0BQj6QzMloLw==
X-Proofpoint-ORIG-GUID: P-LUUgKgODNjb2ilpKx3aI0NPwkM5y9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_051811_649515_9F8A2752 
X-CRM114-Status: GOOD (  18.05  )
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



On 28-04-2026 13:33, Bartosz Golaszewski wrote:
> On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> MFD core has no way to register a child device using an explicit firmware
>> node. This prevents drivers from registering child nodes when those nodes
>> do not define a compatible string. One such example is the PSCI
>> "reboot-mode" node, which omits a compatible string as it describes
>> boot-states provided by the underlying firmware.
>>
>> Extend struct mfd_cell with an optional fwnode pointer and attach it to the
>> child device during registration when no firmware node is already assigned.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> In the following patch you use this and violate the supposed constness of
> MFD cells. This also mean you need to modify the mfd_cell at run-time. I would
> prefer introducing a field in mfd_cell: bool use_parent_fwnode which would
> indicate to MFD core that - in case no fwnode was assigned from other sources:
> DT or software node - it should reuse the parent MFD device's node.

Have one doubt on this, When we fallback to use_parent_fwnode for cell: 
psci-reboot-mode, at psci_reboot_mode_probe(), pDev->dev->of_node point 
to psci node.

But we want dev->of_node to point to "reboot-mode" node. This may need 
an explicit assignment again of of_node?

thanks,
Shivendra

