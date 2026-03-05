Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F64F47CA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5Ga9dDil/3B9VR9KlURzGCWzoPjqQ+IyQcq9xHkWKU=; b=AYneZXVFLs5ZhJUFlgON+nozPx
	6yyymsdyfGy1fqolZwwVMamDZz137TXxe+C3sPpln+PKCAV9mB8hmYZrytKlYgqiWIspT4EvU1Fhf
	AOJHkp0WETXDv0MU0Ersp6CwuetygfmuIfoV5IyU/GflYjBWMTB8/3X7q5PteDT0TX8UN555SWI9U
	3uRoUzG7+HN2mCPt7Excq+w7b01RWh5UYQT7vdUs705/Uz9853/QwOuHl6Vs9JV8z5WEDwhDRsXMS
	IITDOA6fvUZn4VP6iUVKzzFxaw15juuZiN9YTqMpZAcV8Ku6DIBKjS8fQoKOTPMiiSGtVSxzqKMt0
	1sKLHwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCss-00000002KXt-0x7Q;
	Thu, 05 Mar 2026 17:53:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCsq-00000002KXO-0a5v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:53:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625H2BAF2986298
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 17:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5Ga9dDil/3B9VR9KlURzGCWzoPjqQ+IyQcq9xHkWKU=; b=JgU6YTaTq7fpD4MU
	S/8pEqJlucTfas4yiL+8tyzScKEy0/aBWrrcE0EfohZ+97WBx+BPQyOZR29zvIm1
	5dfddeY0o5VWpFmTWiZvgbfARXYvWeMTDZLYa9btBL2LwmFwK47woY+EPLQ+IyL5
	V4xkLgxANLR6ltvz9YyPvhjy+lN6ElrHGRGEoNDdER0Up1nC0R7JgnqxQAAusJqk
	7Ac+lej1DB1166lHFOs0TLSdK1rrjNB/UJ+ztoXj4CBFyRvNsXpjma6FO8SW/J6Q
	vi3Z67EvA7QUT4PdpMbcQ3gS+xjH/XSQ/j2QIHOrG5REshh5g5PUAQBCjVmwi0hN
	J4iS7w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqdvkr6ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 17:53:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae61939fa5so76925895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772733191; x=1773337991; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5Ga9dDil/3B9VR9KlURzGCWzoPjqQ+IyQcq9xHkWKU=;
        b=kQosOkabvOwmbGkuqp+WCqri8uEnoDF34HIrvf6Azm1ajQsVS1HqaOsiHCO1gs3+xV
         qhYgYQQkiE/y5ykbkHGmG+50dJ9DDAUBTvQ4MubTcZEDqUKMRCb/SZDkkMCGNfwkIVBv
         2fjPJRwBiz0nXm3A2LNHl2Hdp728In4KnURTP3h8bt3xrpMcM5Wg8yvEaACfTM4a1j/W
         2sW0471pSPb8PIFIrWVDuiAWk9xTJv/9eQMszGxiP+OmEZ8+4bOopeF5+MjiHDXRJSbL
         Mbz+X6J32EJsoRQu6CwR/P120tEltBOUQn5MQSAbTCQ4wQJsp/fUiynpLJeNlqyd1u8E
         LC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772733191; x=1773337991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5Ga9dDil/3B9VR9KlURzGCWzoPjqQ+IyQcq9xHkWKU=;
        b=KE9PbNNlqyB28AeydNhPI8DGMOvoLwj8oV5YQgDvOmRPuFS6E41eKe7wxn8lEx2Qt3
         kvA1kLBEHiyx7QwT5SyU0D/8oHGz3suR5H9KBQz62Et2U0IXPKP6lbziDtHz6bgbwxvL
         4NAdTXTEMZ2ko+vNRspUq9SfGDROhSByyJO5K4q9T69YQ2ivFJqaEdTfNqTl+YBivQ8w
         QPVC9X8zrVQhuzfzNyL+/H9DRpW7n0Pw6oFq7BzYdcX5VuYCXMruJvy4FWpJjuSP6ij4
         rhqvqIhmpd0bNaje6Uxxd5o2v8DDVIxJC/DotKwHMuD5vQOVK6+IbXssWajPbZkbsjvw
         GzPw==
X-Forwarded-Encrypted: i=1; AJvYcCV8WkvujaoBC6OP9p1kLSHjsuILOO9K6PN3GZzXP5pombxkesViLH368TRufBN3OoleDNXA/RzlLAd3jq9O5I+G@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwe6eWb+8uEpnmF6m4RMHhWrxn05PKCv7c5WF2uTD0Hs+rCsKA
	wKxglhsNTZvJgGygWunR1xkGXM1cG/N7JyizjBGLrkQlfHfa47djY9nSKiIOt3WCVQ/5U0QyMhs
	LFvT3jQAo1fkqCnyYRVaFYC9XI0Nq828mz5Ct0bFw7V+DgW9qEc8oRbQNsLnEw0XM5kUk7cyGR0
	dXdw==
X-Gm-Gg: ATEYQzxWfebtAGEo9MCQ3NV2ppY7Z+dGBSo1SJ3tNt2vkN0FJhvb9ZnfyOUb25l3bIR
	MLMLoZm1CN6seVO5KSML8kY+jrrVcaRhX6p7/IDk6jm1x1VbtoNKxgHz8nAJ4nfUmLHBPil3ZSF
	1HfN6HJrkjRyqM4WvRT0Bt0ixI7tFZ0QCazattUUxc+fPAeJHcTBLzv2WjK2y5WRdrmricS4UHO
	flsPXfk4APZGrE1TemrN12uz5ybmj1ggM3uFPrxiUbvOCU6RlPPy5hxahQ+ylvtJdoHQSbjNPyB
	8nEwR0kVVR1visRlde46kzPnFiYZSbPNUM3Mwpdn6h7fHlrM5zs5Gyr1g2YCFhH/pstlMF75sK4
	WWtZKEj+tnlMnhP1HZY/WHs1S7YsfYpBXsMyercnGL5aFyScp2AVos6Q=
X-Received: by 2002:a17:903:38c8:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2ae6a9ed5ffmr69921855ad.8.1772733190708;
        Thu, 05 Mar 2026 09:53:10 -0800 (PST)
X-Received: by 2002:a17:903:38c8:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2ae6a9ed5ffmr69921425ad.8.1772733190225;
        Thu, 05 Mar 2026 09:53:10 -0800 (PST)
Received: from [192.168.29.31] ([49.43.226.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae464ffff3sm143642605ad.42.2026.03.05.09.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 09:53:09 -0800 (PST)
Message-ID: <c3e94089-bad0-4cd7-bde2-c17e16712467@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 23:22:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 08/10] arm64: dts: qcom: lemans: Add psci reboot-modes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-8-cf7d346b8372@oss.qualcomm.com>
 <4d4cb697-17c0-4610-b498-04a3bb252923@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <4d4cb697-17c0-4610-b498-04a3bb252923@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xA6iws c=1 sm=1 tr=0 ts=69a9c307 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=mvMbtr4cKWCpcPtdaitTtQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=JqnQEXjPz3xb6-exIXoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE0NyBTYWx0ZWRfXzAaOyKkszmw/
 TdThSk3awwsUqA4kiffHOmcZ3QRWohfF0liC58fhNPrFoEcvEvkSurWl8CtzGsTONKfHGu/v229
 IeB/6kxAOGUJGs2AmNs56QrvHqgF6vHgDM71blfIDmFWe4zFPsrPpfoShcRR56v0+7Xyju0hnkL
 hyu4BjuADA1LL3SGjhcELJmIlmC/GTomkg/2gkmsSIgeJphtVKF7NeuEjtE9FQIoLvG/JLVVewd
 5efEw4OvAni8b7Y3m994CxAgjfXOAgJ/CcFJaTtkwkiYPczO74YtLKsnxH4haCmqL8GDgM1xQWh
 L8d/c+NqlPhEm1GdMaN2KqtM29ImNxggQfZbg058MyueF67AcflOv1X6zWpNOc9lPA5vKu6pEnI
 iH1htLh0iXcq06p+JpZgQf3ObZ+Q/P/syitQqidNC7nfYY+T6BX8sKEUgezR+xN5ef+UNoVXwGn
 A3H7SZntnY/KcfcQLYw==
X-Proofpoint-GUID: hLsADWQh1-4pxCiq4dv_O6fBRzopyL4r
X-Proofpoint-ORIG-GUID: hLsADWQh1-4pxCiq4dv_O6fBRzopyL4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_095312_188711_E0FD3528 
X-CRM114-Status: GOOD (  17.54  )
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



On 05-03-2026 17:03, Konrad Dybcio wrote:
> On 3/4/26 7:03 PM, Shivendra Pratap wrote:
>> Add PSCI SYSTEM_RESET2 reboot-modes for lemans based boards, for use by
>> the psci_reboot_mode driver.
>>
>> The following modes are defined:
>> - bootloader: reboot into fastboot mode for fastboot flashing.
>> - edl: reboot into emergency download mode for image loading via
>>    the Firehose protocol.
>>
>> Support for these modes is firmware dependent.
> 
> The previous patch only enabled it on a subset of kodiak boards,
> the remaining ones do it globally, even though you claim it's fw
> dependent.. this changed in in v17 apparently
> 

Thanks. Let me review this and make it board specific wherever required.
Will update this in next patch.

> My fear is that those may conflict with other methods providing
> identical identification names, i.e.:
> 
> psci {
> 	reboot-mode {
> 		mode-bootloader = <0x80010001 0x2>;
> 		mode-edl = <0x80000000 0x1>;
> 	};
> };
> 
> imem@f000 {
> 	reboot-mode {
> 		compatible = "syscon-reboot-mode";
> 		offset = <0x65c>;
> 
> 		mode-normal = <0x77665501>;
> 		mode-bootloader = <0x77665500>; // conflict
> 		mode-recovery = <0x77665502>;
> 	};
> };
> 
> will the syscon write apply and the (unsupported) PSCI_RESET2 gracefully
> fall through?
If a SOC/board wants to use "syscon-reboot-mode" / "nvmem-reboot-mode" / 
psci->reboot-mode, has to be taken care in the DT as per support. Will 
make it board specific wherever required after re-review of the DTs.

thanks,
Shivendra

