Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D58C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBTG/80ituUWOqNVevH8q7s7UN0DFkGF9rfsMiylJyc=; b=ucXThnJqse+KiGoHGLxI52qY6k
	Fzh9LjQVTASe53fS5n2kf2VE97xeFkybkl1vsvTzgDu/m/nAGKu6y8OMXFCT2tRPwSbPmGu8oyPlp
	Ts93FL9faauYZ33pFWuGPGF5Y2mxXa6q2752cROTRFXbqTrvvRh8BcRIhIgtW46LNbKnCYzB7H88a
	1JtlhPGoDicRh/Xgnox7Sc+6PFMNPjGiQ6hQ4Np0y88//HvAO3l4wNk9tQiVyt7qvgTu3xAH/gx9s
	o+OoWKJbRNWJA3VBVrjlvcCiiP4hx2+nFn6q5SbeTIvy/XrU7Nncd02ri0maQIlhCH25/pTuY89cu
	f4WdUdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwi6-0000000Cmu5-1laf;
	Thu, 10 Jul 2025 19:13:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuK1-0000000CTwh-4BRX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:40:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A93wSV014475
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBTG/80ituUWOqNVevH8q7s7UN0DFkGF9rfsMiylJyc=; b=A3IfB04rdOspZSph
	YfFzQX8nIIovs+lWueNxyWlgP0RIrMq7RwTogh9qJ9i724N7FYDXh8aU/ejIfbG2
	xjmdPsQJffatVi5fEWbxy5e8aWRYZz5JjFjOuA7eFep/CFlf1zdHhJLu/ebTMQnT
	RSlrEJmwpQhG99lYI5FTf4mpdxYtuxrgC3ghmyVFYCjFa+5bMqlhNB6WUCEynjrQ
	NXfkWeLbD4++UpWrrGWOH2KjLUohhLlNxOylWG6/c9YzD8k8iEUjrKpiP0XXArwd
	L54M4aqokyLNcSdHy40oNPu5BPdqnglCn/Us3mufkO2X0wcILJDff0c5qJSAA4kO
	IoBUxw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b16mks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:40:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748d96b974cso1046618b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752165633; x=1752770433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBTG/80ituUWOqNVevH8q7s7UN0DFkGF9rfsMiylJyc=;
        b=Iegjqq518ONOVPdoKxUO4GGZCrSLcdG0fStKUruCX1GemeJWxAELPFDTBXW7yNHphb
         vuwFOS4KreRC6MelMm0I/xqiabOUL4xAjrp/MVexzsn2gHcWPrncRYI0txS+UogQi1sw
         hKk4x6FPCLx4g6pfJyqwZbNM5pHBDpTBgGOiQvL/XSRDndhNzbsi6xWwcdAmY3YCTj+U
         XNfAI6Y384UaCDJqA4cX+neSl/Qh+a6dzAhVZzsXagS2OSrse/9IErcEMmO9atmawWpW
         LrTleqMK3+HxbHR5zyDgTEDouoZUdZFi497cRGKANSroiDNwH2kiy8416G5lh75PnZgh
         qBkA==
X-Forwarded-Encrypted: i=1; AJvYcCWBbaRy4u4uLcB/v5KphdmWOM21eqYyYGabxpBFv8JvtNUberw5ncC5b2Yhh8GDJzjF28zeCZNyIzopF5nVQ6CE@lists.infradead.org
X-Gm-Message-State: AOJu0YzOCpckq2AWECteZbaPC9BnG6S+d8cGsYjeXF6Zdke0Tqz87uzn
	0RMgaDZh15EEotf+FMzT9RWXxNRnl8IhaxEk+2ME5740T3x4jnQj5KTbL2q7ZdijHKzfll8z+H3
	SIYH8eIVswy64H/0VgtRA3Pv6HthYqPL1nPNbSRmPzMjR1QPIv9dgWRPi28olNuOA94Bs/kT3dL
	mNpg==
X-Gm-Gg: ASbGncugFXyXpSVpwgOm7tKj9eW4GPgop/CUo9BqdRxGeyoyW26TEIdIXPPKjXVHz21
	JAJXCT7fB1KIrPJ5RkFTpyDVkKmvCn7G/Yp3x/spEDVHqKQkreJfL/aN8LdCeAc4pIYzMtSjVJa
	XPCgtMKszJ62WnSMXcyOffhGSISWduMk7mekZJJ4ZBpbuUsBfd3w7gU3dvqangj0+xTfPgzqJYG
	0OoL4VG9nnpyRCuLF0e/mXXp4GBLQrwQ/wJofmNNBMvrmSmrA8j/UWdW2qu9Gq0LPX2qlFSz025
	K37Poi+Ogt4+5MdlLpzq5bMB+ahI7cyOBYVw57CrNVEkEwA/tkMooPCT
X-Received: by 2002:a05:6a21:6b0d:b0:21f:4ecc:11ab with SMTP id adf61e73a8af0-2311e53470dmr106325637.9.1752165632430;
        Thu, 10 Jul 2025 09:40:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHydOYOyhSewH56uQb9WOivpcBapw9P+fJbdPXdbKRn77lJVLdsVx7hajLvC2ylRUs5DaV0Pg==
X-Received: by 2002:a05:6a21:6b0d:b0:21f:4ecc:11ab with SMTP id adf61e73a8af0-2311e53470dmr106276637.9.1752165631958;
        Thu, 10 Jul 2025 09:40:31 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f8f878sm2576220b3a.166.2025.07.10.09.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:40:31 -0700 (PDT)
Message-ID: <23323fac-7ff7-0179-3cf3-99bc070f8778@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 22:10:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 03/10] power: reset: reboot-mode: Add optional cookie
 argument
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Andr=c3=a9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-3-b2d3b882be85@oss.qualcomm.com>
 <12c9a69c-7e27-4d43-9b1b-542e735176ec@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <12c9a69c-7e27-4d43-9b1b-542e735176ec@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686fed01 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=sDLv-8AjHc169E3Bnz4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0MiBTYWx0ZWRfX8gyBHvlubulP
 0YcKjb8YshJjUi+1uOcBV6B9LrWt84D5QHDFpZoW+zYOZglZN0oofclEvgM7chftDeCyX6on5rD
 q7MPmOOTK3rKN68tFsunNR/nMkAEu9tQjHDCTdH7HH/IxNCrrt73zxtdg0f68ZTlTb7KCYrQLBa
 y/wk5PowkfKWQ92y2OPU+qFWDoXewQrUnYu00YfynqozLdayt5WJYYCesyolimPhztGVazUEjnu
 r+5Ji26iQqloXAyAFG5uxy8sPqTmTco5i6vbqHFgYdcp5p+TgytpUyfBgY+TdOrr+RsfIWKjhAT
 dBpf6tpnaYShLp2mCPqLSJW6u+rQST5vuYXomlIyBzhpRLYtepyNyzxB4qZdPXH9uBCOKjfnzZh
 tIcUiu5QWeiyUubD8Xhy3VDjyl73/iX1WQddw+OaQM5GRm5bv66GF22JqQ1POZ6XrWddLgpo
X-Proofpoint-GUID: bGrZdQu3zFDMDGl954-jAVBdt1WfqFAi
X-Proofpoint-ORIG-GUID: bGrZdQu3zFDMDGl954-jAVBdt1WfqFAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_094034_060309_7653BB3F 
X-CRM114-Status: GOOD (  18.79  )
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



On 7/10/2025 8:59 PM, Arnd Bergmann wrote:
> On Thu, Jul 10, 2025, at 11:15, Shivendra Pratap wrote:
> 
>>  static int reboot_mode_notify(struct notifier_block *this,
>>  			      unsigned long mode, void *cmd)
>>  {
>>  	struct reboot_mode_driver *reboot;
>> -	unsigned int magic;
>> +	struct mode_info *info;
>>
>>  	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
>> -	magic = get_reboot_mode_magic(reboot, cmd);
>> -	if (magic)
>> -		reboot->write(reboot, magic);
>> +	info = get_reboot_mode_info(reboot, cmd);
>> +	if (info) {
>> +		if (info->is_cookie_valid) {
>> +			reboot->write_with_cookie(reboot, info->magic, info->cookie);
>> +		} else {
>> +			if (info->magic)
>> +				reboot->write(reboot, info->magic);
>> +		}
>> +	}
> 
> I don't quite see why we need two possible callbacks here, could
> this be done with a single '->write' callback when you either
> add another argument, or extend the existing 'magic' value
> to 64 bit?
> 
> There are only a couple of drivers that provide this callback,
> so it should be easy to just change them all at once.
yes. Three driver. Ok. Will modify these driver's write function
prototype to accommodate the second argument.

thanks.
> 
>      Arnd

