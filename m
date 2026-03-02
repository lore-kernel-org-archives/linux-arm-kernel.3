Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBDAE9B36F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4ngh7auUa12FfXGU5s7rRoEdx8wE5chgTwMb2MLbMI=; b=cQt3NqWySNSu3lfSWkOvQdMHoS
	sBkiihEhDmO1PIdTtoKnGXoQCBgQIudP0LOISO2xd/HFsSXHliBcHA+onpyckHBH3aoKhDN9vOI9Y
	Q5USJXwpsM+yIUnk1/DuDc8+q+l8sBOhhbBBtVv1c8jd990bwZGaZGLQpi2PyA3oLu6JyVSTW3o5d
	myikptup3EdxlFDRZl8hSzdtDf8+AgO1d5oKuNaX4OOv9RC85mg2m7GTo3zOQ23xaE7KvL4xhAwxw
	I0XGZpT8CcuUEGekXUSwNmAwLoo7FFU/77xt0hKVvoixHMagvlB9E3eT11tIe+23BS4xqd2Irp64B
	8l7vc9FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2RK-0000000CzPp-1IXH;
	Mon, 02 Mar 2026 12:31:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2RI-0000000CzP8-0G8o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:31:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228C46r3223577
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 12:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W4ngh7auUa12FfXGU5s7rRoEdx8wE5chgTwMb2MLbMI=; b=l/2j2UZHcRmn5rbV
	O+/c6SmQKiAQFuspxc+q4FCvrWT9S6yIzhVa8Y9akmNXjm05hHuCGnhiSszkeE2t
	Tt9p5y7553HB59PE8K6QFYxgXTCiAET+SJS4XQ/EuIrIfdRaggFXhvkL64DiU74J
	XuTRyox/KzCVD7zGuMKrBcYaRZm2CY7KMqcMpdCCTjlFzu6WgJQT/nM57oAlL6hs
	CPdXrCOL5aIW2MSj0Q5+62V6SezL3lTnxlBZBof3gET2+meUmLMhU0DZP9NTlYIb
	jf/eQU+s+hcL9vPDZAws6ysuIIhX10gQj9KSH8jOtUGKTFxhH5YKEtbSLBDX4XH5
	/mYAWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1j4kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 12:31:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso2962461a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772454714; x=1773059514; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4ngh7auUa12FfXGU5s7rRoEdx8wE5chgTwMb2MLbMI=;
        b=F/ARIGQatjQooPenP4QbNkeh91ghcOtv8ee86z0VE7D264vWr5Ew0pIT5Pdyhdg6j0
         8UsL5nvTDGFvax9SwTSX0HTKKOfkhUk0F0m8AyZvX3QyvFcumLTdFUB4aO0xxjR/0I5w
         uSG/2TIF4bR6QsWcnW6hLtFqoR3AGTJsC0IzSl4q2ioK7dPM0xVzijIMdQ9u9oF24Buy
         1cviXqZhkU/GunTcd4yF67MWCMYcIMaRvNeayMYdFuuCHrY6AyhcNiATnCMJZfS+evLM
         Pvqh8GlpSeZDZM2kDcFNH12dgpcrEtMghGtBRkdnWs1fzXTYnIArGZVKE9aRFzQoOfZj
         PzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454714; x=1773059514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4ngh7auUa12FfXGU5s7rRoEdx8wE5chgTwMb2MLbMI=;
        b=Yw77XO6VP3q+I3sW++Iamt87ndI0cG6B2yMLR/GW7zA8QoVjlF8JXz/iczPNQALXDR
         HQs9QYteHc4/1vkATxdQxSGj+VM2FldEQLdN8Py49Jqa7jXMxalUqV0XR/pIoXTCU5Pv
         qqMPmUGyesQWD/IGmn5W+eM85jGmjZ9V+rh8ONVvGkwCEtzPF4Prl5LBmQLR1y1l/aLa
         atRRFtIknWmGunexmF0YYB1B/7+4Dsfm1lj5dUE7/WmZ6cv6/CD+xWi71hPoO/g7s7C+
         /LwaM1ppZ8S6JZHIJY3gGywBdTYcOXlP2omgKvVtqO0Zho7KVo1DEjTUuXSQTqOtddTZ
         zp8g==
X-Forwarded-Encrypted: i=1; AJvYcCWmdZPE0rmRiar71fEpGXLJUdustfEOQYAQLEoBaEElwtmwbSYAOQuwoLRNEDtO4sXyJyApTsf5Nc++L8jpkcmr@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs7vVzGpCxSQwNeUkPLLXX4El40TtxFpNs6etSYQpt49sWozld
	CSPK7n6HMTu6AYV21OgOT3Y7jy4vi5yh9cTCXgI71Ae0Ep6MZJMeerFkm2nf6vYYDDaKeYR85t8
	T76vQO745LUjpaWYL0N1G9BBhphtx19wzzu6viIVwdRXwDFJ4VFWD6UDZuQVmR4JuvXo08tP3V6
	tnTg==
X-Gm-Gg: ATEYQzwoU0yXRIAHbDNJvTfY23zdLFLcG9IRpS420TH0W/+BJA7F51fBGVP9rtQorrB
	ek/LLiZI+K/I6pJu2Hk6tXFzD5ZG/64RKzj1PXsMib9vJ3Ht9CMNLneCCRcIxNzb0niyuVSk+Nd
	xDILtGG4LMCC4mBt2KNKWAxSA3vMc58euVteyMeL6Koc7L/xNBG1TMJnaYn87eNhMKc4EY2SmHV
	9BicGjRTZcYTMcilGtUiaAF+gvVq8khpdlOaDmvkx8RA/r0kkiA29xZplVJ/Y6n0EvE3azsbmNw
	Jmq+5wDgMGlWkONQsWQSF1YnwsWNQuxZZWGhtYNIXcuPRLsf15YXYnNjRQNguXT/V0hNy7+KGdz
	oHHtbXOx32hqo5bdjUpMDmScHZ/nsT1bv2we/m3plTnUHJUz0hCD8zA8n
X-Received: by 2002:a17:90b:48ca:b0:356:24f0:af08 with SMTP id 98e67ed59e1d1-35965c17eb7mr9037600a91.1.1772454713724;
        Mon, 02 Mar 2026 04:31:53 -0800 (PST)
X-Received: by 2002:a17:90b:48ca:b0:356:24f0:af08 with SMTP id 98e67ed59e1d1-35965c17eb7mr9037568a91.1.1772454713176;
        Mon, 02 Mar 2026 04:31:53 -0800 (PST)
Received: from [10.218.41.175] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35977bf69bcsm4006727a91.7.2026.03.02.04.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:31:52 -0800 (PST)
Message-ID: <ec377914-32af-4db7-97a8-64995f5c26d6@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 18:00:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 06/10] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-6-ebb956053098@oss.qualcomm.com>
 <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zeVsx7Eqfc-I0U7orKzedr09cTNQXGdy
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a5833a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UGKnsmkkt59Ar6B41U8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: zeVsx7Eqfc-I0U7orKzedr09cTNQXGdy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNSBTYWx0ZWRfXxtk/nAMQjhpR
 linK9cY/c7FOXlbBJ/R8u442CRwU0Egd67UqaNrbbi40l9Jwu2yA0X9eNaP/wBndWGtDSIkdUdd
 kCtI+9b1XkR+tarJD9pkhTeEAlKfsVirEz2l3LQLAn7Gz2F03FPUASz/3DtfKIWV2qL6eYE96uX
 Tkbzn9bXADJJGaLX+WdrOaLrLMmtBpM3UrbMTKfCCLsX5bhYBmJbiULtJiKEFYYOf/y8wiqwzDR
 k2QvGCutmwiBeeIJx095sUCOy+jjTFBKPz1zmLsXqh0TS+a/fHpObWqEEBUBNLeFdyrM/Ha/k9V
 +PHkBUTboB45FO/hPCddnf9uOw8bJcGzH5m9XW8JjXXyxFXXBQ5Oq8WLaTzv1bJq+AWesMrx2xe
 Sm/XukoCZyzmdDk8OIZXzP6IHwvA7tLc8Ex8CubRlzXwu1B7jxHlWlThVIysg2+6DlK4EkNTN9B
 ME1BahNGOQHh3hcVzRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_043156_129995_1E1D4494 
X-CRM114-Status: GOOD (  20.08  )
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



On 02-01-2026 17:27, Bartosz Golaszewski wrote:
> On Sun, Dec 28, 2025 at 6:21 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
> 
> [snip]
> 
>> +
>> +static int psci_reboot_mode_probe(struct faux_device *fdev)
>> +{
>> +       struct reboot_mode_driver *reboot;
>> +       struct device_node *psci_np;
>> +       struct device_node *np;
>> +       int ret;
>> +
>> +       psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
>> +       if (!psci_np)
>> +               return -ENODEV;
>> +
>> +       /*
>> +        * Find the psci:reboot-mode node.
>> +        * If NULL, continue to register predefined modes.
>> +        * np refcount to be handled by dev;
>> +        * psci_np refcount is decremented by of_find_node_by_name;
>> +        */
> 
> Can you make this comment into full sentences, I had trouble parsing
> the meaning for a minute.
> 
>> +       np = of_find_node_by_name(psci_np, "reboot-mode");
>> +       fdev->dev.of_node = np;
> 
> The logic of the device assigning its own node is a bit sketchy,
> ideally this should be done before the device probes.

Got one doubt while trying to move it to init.

We used a faux_device_create() in init.
faux_device_create() calls the probe function from within its
implementation, so do not find a way to set the node "fdev->dev.of_node 
= np" before the probe call when using faux device.

thanks,
Shivendra

