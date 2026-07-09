Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21E6C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=; b=ef9HxQcrBZGCNmMQcousZXWmPW
	IGopkAz/aqQuwLBnaFVrp0q2JHWn+8BMiDktlWikHmMsBKnV6S+sfYSgQQsGaJOeWlGWDKUyRDe/I
	ESiydLyTsg0gccSVzYQfmfBig9/Q9kP1moCYrTPmgLv42gxMYOwD2HelJyY1lyReR34TLFL+Xfjmr
	rQU1DFENcn2o1AfFmjqIsrB+OFKSjt3hj5wTMQu6Um8QnLNt5DUv+JIE8QqJbY3OJEwJux73GHdPG
	uZYuPh48OvKwCTxEyDt5JcxrQ6HGI9jX2KsPcRzsKmlbSS8ti6fKqD3Rz5Sl/si/aVJT32BGfWOIs
	1NDYt51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpPP-00000002iGH-28qs;
	Thu, 09 Jul 2026 14:07:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpPN-00000002iFZ-2wKP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:07:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DvwtR1870351
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 14:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=; b=R9VjSNvCHGYmCikI
	POz42573KX+Iw8RgVFzKweFwM4uIUVDrleq2QM4u4N63wFSC6y4eafKE9g+j6oJa
	wexGDy5oP/PmZX42bkzmF/XrlxpSS6BX7oIEQZGzCw7j6s4+GtJc0iA1pbPshNHH
	cf5CkhjCw1KEKiXHeOGvqq8Aj1T1lvSY5wZ/8MunyUee7rcn8OuxeqGMjBHWuwtU
	C/DUKHRVGdTyUAlWCTSh1TThGgE0dx7ILNfY7enxMbLzoJiknXW7dZ72gHeDUbrd
	9D7nHt+t+WqUrbC1OrumUCyLK+4XIsL3yVhUniz4wDq5znTasz4NYtkq9CNCHNSO
	VEq2oA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u499n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 14:07:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso14512841cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783606040; x=1784210840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=;
        b=OknfJ6eX9snsQWnE9UqXT8/e6yFQumZcAY1Z5Q25J7ZKfesYZrMf/qwpi2h2DH1TXT
         SzCgxpqzNtECI7szNtjW4hwtJj/5vhzusk6+6T1iX4/zpqvFz6Nz9C87I1ESzxcGwZWk
         dDWI6XDlBb8WBicbqSqkcoYqr8phaH621HVNo+ubdwFqvlTYZpuxtQ3cQGw/uFldEtPW
         mJmRvYTXP1FZ5muqk/kwbOBT1zeaImWD4cqdSr9v+fYgHOH+BUcuCwKOU/9iJb7Tvo0f
         l8F/UBslnpW0OZHS01IzalYneSHDnbNdUHvuWkRCpGTrEffDLP6C7vXS9X0F7pkrULjo
         iSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783606040; x=1784210840;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/y/ahoOnHj/TUbb1MBrebh+AQ6I/elKTEZ594W2J7GI=;
        b=SvnMycSUtpwRJNaQplDdQJYTZtT01l9QszTLE8yxL1H2MVMmV2+O/CoZkUgFmO2a+m
         BI3zaH5oHrrqUGVD9BEHlPqzlcabypfENO/8GeklvEmkBzr0Ww86gXhojL1bSxjEmrlf
         h7dzxL7A05QnTvK32uXG8OpQ/4rvahsGK2abQy3JeWvJkTbgntVhJftlPEB36KH5qFXB
         9vsghubYvZ/T1mUk27pAEDwFfGnXpusVgSu/88KideDOcNJ3GwT8WPUma98mrheUBqeo
         0BO9I2LZm4A5TH+mz4Ll2IF4LMozYRvwX5Ol5ndGV3naZPLgyU4IroqvbofjzLMqeN+D
         Nn5w==
X-Forwarded-Encrypted: i=1; AHgh+Rpy3MOK3S1gNJxUmBoAhnx3oYO+esxIgfkPRgxzVzZYEoD5NP1u1w4MdP6OXwqEGBtU8V69uAoAdWh+HognM3Va@lists.infradead.org
X-Gm-Message-State: AOJu0YwF1+Pghn1pwYbFiIO+DY49hgWqdhe04SherVTxx9fKVe8ML44n
	UbVXxajp5oSBUHXk+p0HOz6o4JgtfzW3FlvPDP9w2Y8lL917DkHN4OT3YcpD8qm2B4V1wQaFr+B
	U0bQTl42+KH4wCVLsJ2rSEkL64sp1ydcfPwi+3CXHDzg8aaED0D7ee/cnflneqnIa3ZcJSiO4ld
	JjuA==
X-Gm-Gg: AfdE7clNcbwHm9Bs1Xme5ki4/PQCPUmefmSvK50JCwHjaJgetbeYWSdYQ6mumhI2DYX
	aOMa6c7v2jbuBLXhq0EZ3xcrXEZzudOF0ZG89VsA3Rlap6pd8TYjnWILa0vm7kXuK//Mz5v/2rF
	4i5jTmguwqVMYeadWBP1FDmOk26mEnlLB1e+xUzOQE3Aie1jebj9LZcBnwF5AxR9DSlZIut3R7c
	kCfIJmZZ18a/rngFXOYJ68edigveMfMLUqIIx5iSihGD3OSiI3yDen8biDsQzqmchA/9Kh4ju8w
	MD0TcaZzBj/FI2KN5JEyB0CZH9Ey7leZzyqai7whXZ/cX/OcTHsvSoKyVIDzcPbCNyM1lgLJZzG
	UAIjfuZTD2dqtk749x0xIxoVBAu/5sHHPijyJ7rjxmr4AELzCySSQtfnNdjytdSOvdaPwixMGcb
	C3QeE2cJaq5eTMK8TAkp+xZdw4zIqTGGXd8af9P/OiRjJv8iC9uOdfObu/THFTdjLc+EipYOv2O
	sl1vw==
X-Received: by 2002:ac8:5d88:0:b0:51c:667:7e30 with SMTP id d75a77b69052e-51c8b4d60cfmr76151911cf.47.1783606039940;
        Thu, 09 Jul 2026 07:07:19 -0700 (PDT)
X-Received: by 2002:ac8:5d88:0:b0:51c:667:7e30 with SMTP id d75a77b69052e-51c8b4d60cfmr76151081cf.47.1783606039359;
        Thu, 09 Jul 2026 07:07:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c79f2a3fsm301861766b.49.2026.07.09.07.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:07:18 -0700 (PDT)
Message-ID: <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Brian Masney <bmasney@redhat.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <ak-h8oPcL69fCUg2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfX+RVXgsEnrgkz
 5mDZbZeHa9Dyy/pHighaZa1ZFDMNbgVP/ZSfEjgwVEK4rrUKxZ/jeZG/7UWGzMZ8HnOMlGZdTIs
 VHK5XI0IriUvzf0uPxItKKFndeovnas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfX+dCJgkysn4W+
 InRfdnShI0iDO6vSLo466FKizSniTOWCOKcXiCVpOmHZHsZxwxHO6ebjEddQ4oFftVTeE6up8TY
 PXDUT/5HlncDXdp2uXy5TI9hu5GfD9q/olk7CaCJ5dXd+guhAau+/lizwjvsvW1cB7cJ2BHH4I8
 cySm7wLKpib5IOuXUEXNbmwBB80JZIeaDqVjuyiDkS9STsZ5xDKECmkwJoTBxgbKYxS50BAxKNl
 EkisU5PCQXWxtp8PRo4WNMf6cOtS3mEkA1V2xUH8leiXfwi/mGbxwJFIcC8Tlzo7hmJKWjRYdL1
 hqwx8uG0/PPgHBc/XbrBO5BphqLivN6aGWUdpKzckvkt57bsZvtcqJv6hXlwHVIy0TKRCT7N/Sg
 I/ddWX2wrzI0xrKWrkh1dohBIj3E2TW6NqbZAf5z6ujlbWT+7jyEKgekla9edL9l5k5eq3oxBFa
 rERRnsjXA6AQhTC3v7Q==
X-Proofpoint-GUID: FpaLpRdkiES7TZhmCwtEBDkGq3hTOZZ1
X-Proofpoint-ORIG-GUID: FpaLpRdkiES7TZhmCwtEBDkGq3hTOZZ1
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4fab19 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=1Iq74HBXAAAA:20
 a=EUspDBNiAAAA:8 a=F1v2bmbY3Q6w0W2l7n4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_070721_775531_F5EA7222 
X-CRM114-Status: GOOD (  30.54  )
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

Hi Brian,

On 9-Jul-26 15:28, Brian Masney wrote:
> Hi Hans,
> 
> On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
>> On 9-Jul-26 12:10, Sudeep Holla wrote:
>>> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
>>>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
>>>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
>>>>> modules, but they are then not automatically loaded. Rework the SCMI
>>>>> device table alias support to make modpost consume the information from
>>>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
>>>>> this information, if known. Also add a protocol-based alias to also
>>>>> trigger driver loading when only the SCMI protocol id is known.
>>>>>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>
>>>> So I just gave this a test spin and unfortunately it does not work.
>>>>
>>>> The problem with Fedora's kernel-config / setup is that the
>>>> request_module() from patch 2/2 runs from the initramfs, but
>>>> the scmi_cpufreq module is only available in the rootfs.
>>>>
>>>> It does work if I explictly add the scmi_cpufreq module to
>>>> the initramfs, then it does get autoloaded.
>>>>
>>>> We really need some place to put a uevent sysfs attr which then
>>>> gets replayed when udev is restarted from the rootfs and then
>>>> re-reads all the uevent files as part of its coldplug
>>>> enumeration.
>>>>
>>>
>>> I don't have much knowledge on uevent to provide any suggestions/help.
>>> But isn't this a generic requirement ? I mean you could have modules
>>> install on the rootfs and not all of them are packed in initramfs ?
>>> Just wondering if that works for other modules, we can examine how
>>> do they work and what are we missing ?
>>
>> scmi is special because the actual devices under /sys/bus/scmi/devices
>> only get created when the module with the driver is loaded because
>> of some funtion/id mapping requiring info from the driver.
>>
>> Patch 2/2 tries to work around this by loading all scmi drivers matching
>> the scmi protocol which is known at bus enumeration time, but this only
>> works if the actual scmi driver is in the initramfs because this done
>> through directly calling modprobe() from the kernel which does not
>> get "replayed" when switching to the real rootfs.
> 
> Should the SCMI drivers be added to the dracut module here?
> 
> https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73
> 
> A few years ago we had to add the interconnect drivers to the list for
> Fedora.

That would be one solution. I first want to understand the problem better
though. The scmi bus not creating the devices until the kmod with the driver
has loaded is weird. I wonder if we can just move a small part of the drivers
(some mapping table) into the bus code and then just have this work as it
does on regular busses. I hope to be able to make some time to look into
this soonish.

Regards,

Hans


