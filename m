Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48072F3D337
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9amGm3yXPjWRedkzMCt3rIna/u2e58sR65tEMjLkZI=; b=Itgh1QlK59rcFC7OdwauPrkDBF
	Bi56knzkJOAmpFlsCwSSa1wIId+QGpUtFn4GOw/Rk3Aklzo0o+tcOv36GNmAC2z+6bLweELg1Ut3M
	JC8nN8XKCa0WKc2USg4wnj0nxEuY8U8X8FxCsbHR8JehBYw9sHEo0v2mg13uM/gkRajvdiOpjW9yd
	MnjPd4mmdxPjy/rW0zmTV/+qxJmFWRwAuJkYooKE7E1Qzng2o1qqu77S70ydpKW9AUIvpJJtqHiEC
	AKZa5y+3iNuqK5PLEY96Ci2k3FwhcLUfO85eT+UoN3fWv5Yx5h6NCKBRFM/p111s7i+rJP0YO+GUq
	5pE/xP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCAJ-00000002Fmj-40V0;
	Thu, 05 Mar 2026 17:07:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCAH-00000002FmJ-3A6p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:07:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625H2B1V2986298
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 17:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9amGm3yXPjWRedkzMCt3rIna/u2e58sR65tEMjLkZI=; b=a4bEybrXskoGZv0G
	azDDjfpL2IOffTbrcBuFG67SPotuiTOys4t+8fwGZFuXAThGyia+MdFPamiAnnkT
	StMJYJp2iyF90+1NwpdnGs78OqSctI1r60JSwVcog+/aLGd44RS4ysAda3s0lxqQ
	klZ/sO1w1Uec0bLVnGgh6xrBTPw+tZmyopB25LlZvQYB2mG8SUoS8GLMK2bU/NhQ
	rkuJpbieG8FfRmrqYDDqq6vEH8BYNzpwVSjJnvkgwkebOqqiUpqe8dejBshev8NJ
	zAVC02J3kIE3bAHpvFLVsT3d+xAg1u+TQF6Dx4lQFS98Wr+QdvpIbr1K+gr5ovi1
	Z9rqYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqdvkr0mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 17:07:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae59e057f1so52381275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772730428; x=1773335228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P9amGm3yXPjWRedkzMCt3rIna/u2e58sR65tEMjLkZI=;
        b=iyA+ZvrPItRGV0Ws6Oup3qDKOo08dr5n1gWn/gtcgKkiTP62JnWWZ1ZqKfD4Gw4uV7
         UMsPBqfp6hQL6t2ZpEoUFuAJMHr4gg81ktm+jrQCMlz2SEVsfcEUODr/mj0CXVQaIfTw
         oLcAyP9E4GuiVXmQLebtCWdzrj4R/sB/bnTDZt2iCzDJrQx+tzsCTahTC5l31E9LHAie
         ev0h+hG0no7MWKTBvJrqoZvahJWfEHbALO+u8hY8/D7/1rTYKm3N8rD1h0L8qJTMMCwh
         Uj7sl4aljAMUNDEZJRRsLF2+OECSramzGz3BZfQjkkHMARl1IXINGHCMVemAfJCG96/1
         +Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730428; x=1773335228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9amGm3yXPjWRedkzMCt3rIna/u2e58sR65tEMjLkZI=;
        b=MfFCBrsF4fbGlo89s0gUrD+1MEzW+vHeWD4s+sCjbzt6n8SA3977ybqmBMm0cfQPvx
         CTU1D3YWRlJZwE4t3NDL3Wd5c8Yu7h7zCbyUzBlblyhPCxSESmXdcfso6Xi4T+d2dMvx
         3klbN5qYmHDPpx3eFWJ5JKlrD09kEyPs0bvd0cu5UblKid5K/2lfsjR4jx7ExAhc5pHe
         gaa+W1dR/KHhwb/ti9OyBzLE4zt3s80PFgMgIzUexolpd4RFWHP1lBEzU+qGaElZtqxP
         InJSrdv5BCCv9VI/ffzO3hrvgARlbeTq3zap2xhIaOmAAd7TS0BWuCtQuaLwhS7SvxBt
         /MPg==
X-Forwarded-Encrypted: i=1; AJvYcCWgBrpuj2Ei//9HJXDWEp0fkop2+4YKbMoNMAQtRT/dvo0S4U0XaSST8LFKxmO/aTKuBUY2fzgWDpdhtnd39vIZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyfAlkj3Fx9fwJMbFrPeIcqwAsAW0N0J/vbIG0Fc9IQN7+pQ5jz
	YBatW1Dzxm30KrJSTfeAWcAv3Yo0RXTYxXYg8R63CAuOyq52dCIfGVpGClaomftcuLFAg0QUnkj
	ZU39NzxVum5mHbt7lyhM8QEpgMKu6YaZgYy6vOM46zk/t+rU9vpUdeOSkDjOilhDBJzKS1tmYtC
	gZsg==
X-Gm-Gg: ATEYQzxpTwkJGBn2s9B7UOJ1P6Y59pq9iV6T+XHQEOW/VzqCyjmJe7Qs6UlOeVAvZZo
	N0BDu59w1oQFqw1HyUcMDBeTZ0JKDirXRhFV6vnnuXouBWFZTHCFuYXySKM3A4pudXqnBuwUFdq
	8uKOh/TjA9NWJ62DtHUi1cZxjVHn3kBMGKWqn0HxWNtDG6ZvYPlEJ+831E17QXxxXwuGRDU3tPJ
	BCaOS2KM50QdqWjTddU+KWgfsT0XPZ9IrWdI/YMRMjbrP0o9r1TwaxUUrvflGYRjZIBptVTwcKs
	9TOmZPYg8AUbl018VNBKJBM3v+xTS8jxUwCeETzWbWCYt9D6/KV9FMNLrTeF66hCnCMiX2ZWCc2
	P+BqXQczRF0YhyeI8THkRpqx5BtWDsHhL4sm1351VG11B9PqLtevm3EQ=
X-Received: by 2002:a17:90b:3e4c:b0:359:2d1c:9206 with SMTP id 98e67ed59e1d1-359bb45b0b8mr219552a91.33.1772730427631;
        Thu, 05 Mar 2026 09:07:07 -0800 (PST)
X-Received: by 2002:a17:90b:3e4c:b0:359:2d1c:9206 with SMTP id 98e67ed59e1d1-359bb45b0b8mr219498a91.33.1772730426982;
        Thu, 05 Mar 2026 09:07:06 -0800 (PST)
Received: from [192.168.29.31] ([49.43.226.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359aa2c02casm1708265a91.8.2026.03.05.09.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 09:07:06 -0800 (PST)
Message-ID: <1f75b250-c3b5-45da-bc82-aeadf44dfea4@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 22:36:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
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
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <CAMRc=MewwLTsaHCOR2iVYZRM6kWptQfZuTe=2i_pfpTwjFKEpQ@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MewwLTsaHCOR2iVYZRM6kWptQfZuTe=2i_pfpTwjFKEpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xA6iws c=1 sm=1 tr=0 ts=69a9b83c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=mvMbtr4cKWCpcPtdaitTtQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xSGJYzCLABdN7Qz2ucIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEzOSBTYWx0ZWRfX5G7bSj2HZx2p
 /VMSFNH4MBWwpdqsf3mn8cyLkBj01nUaFiwPi2nUXBwaNZAP/zG9LVza5LflsRq+Igoy0ONFxb+
 nfMI5OheUrqFKBY2pSbUbKvSyTHghbcHxiPfBRJfqFnEje+n8e25JxAff8s689UYP4H5RmncEg9
 sSFkcuikYjU8nuEQ8JVdA1HwQo+dWkUWDXQHarEF4YhvSZdQk8dYe5KZujnvCbdxbderg1GXusI
 51ic7YzO+2z0OWOa2VPx8dQ3Wg6ODGYBbAhTgN0XptwYPu2FAjeEZjikltklQnqVqpScUK3o//u
 wyCUSWI0DKQLdKi1Y4kIZXtlr8tQKJZ4vvmix56lYpa7HhTGxw8i0N9BoYO0pxBWjFLBUIyAcb1
 PM/seZRi6vcf4SSp7l4tAsmAwj/IDTS3aBPKeWjloxdgBI0+3vdFBl/SeiqLIMxl/anXq6P8BtX
 6k7lT1TTjry0n6Hof0g==
X-Proofpoint-GUID: ebv3s3w6JI3pXpnehqcvxG7i1_YSUPDd
X-Proofpoint-ORIG-GUID: ebv3s3w6JI3pXpnehqcvxG7i1_YSUPDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_090709_812342_6CC5E5A2 
X-CRM114-Status: GOOD (  17.58  )
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



On 05-03-2026 15:32, Bartosz Golaszewski wrote:
> On Wed, 4 Mar 2026 19:03:06 +0100, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> PSCI supports different types of resets like COLD reset, ARCH WARM
>> reset, vendor-specific resets. Currently there is no common driver that
>> handles all supported psci resets at one place. Additionally, there is

[snip..]

>> +static int psci_reboot_mode_register_device(struct faux_device *fdev)
>> +{
>> +	struct reboot_mode_driver *reboot;
>> +	int ret;
>> +
>> +	reboot = devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
> 
> Have you verified that the faux device is actually getting bound? This is not
> probe(), you don't supply any faux operations when calling faux_device_create().

yes. It was verified. faux device got created like below and the 
end-to-end use-cases are also working fine.

few logs from device:
--
# find / -name psci-reboot-mode
/sys/devices/faux/psci-reboot-mode
/sys/bus/faux/devices/psci-reboot-mode
/sys/bus/faux/drivers/faux_driver/psci-reboot-mode

# ls ./sys/devices/faux/psci-reboot-mode
driver     subsystem  uevent

--

> 
> You should pass the address of this function in faux_device_ops instead of
> calling it directly.

In last patch, we were using a probe function. As faux_device_create, 
calls the probe from its internal operations, "of_node" can only be 
assigned from inside of faux device probe.

As our primary requirement is to assign reboot-mode of_node to the faux 
device, thought to make it this way. (As we did not want to assign it 
inside the faux device probe).

thanks,
Shivendra

