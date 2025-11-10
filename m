Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2548CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYPBMmPMrl74VcBNfaZK6P0Th/jmEX2D4ZwvG4S3pO4=; b=VGlauecIfJViSO3CEaYMI/G6hR
	hrxcZhdtEFqlgZiY2V0hQALOhknEFDJlUd5UDRu8EaaxuXGr5ZADiNevgqcr8m1emJbkCXkgsnw9r
	7Um39eQ+Ov8n2cnCCR5K/sgtOOs11A1RyyTiuXgwvwNAi+2dzkB5pLY2WCpzw98vYNARX1SXmYtEW
	RRBjvypNXe1FXnfsjlWpBtkGBcf/wo70iQmfKaIgoQZjI0qRPhB2yS2UQcTLX7tpWr+aFot38CMt2
	XerW0CA4Z1uJTDHRVmoqswksw/Us3IcSQZs8VepHuV/XdOcYcpMlEpdibXuQ58SOMwT/kiJeM9OB5
	tmgW8bzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT5Y-00000005bqV-3j4U;
	Mon, 10 Nov 2025 14:41:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT5W-00000005bpt-3iIi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:41:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9EjJJ2992480
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 14:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYPBMmPMrl74VcBNfaZK6P0Th/jmEX2D4ZwvG4S3pO4=; b=bfILjCMMjXR9ll5x
	cD6jtvxG6fD6T52Kv9T5eFgtaACKtgd2pxJrJYkaEhSdnaM0G+6qMOnEyxVw2yen
	nmcvAkwEwJggDXfQcRGcs/MT52ntoYywDMTghWYOAfQDTvazF2IIX6muvRRypGTt
	x8vgomIVGqrxB59uYFQIxGMx3TZWKb3fmh+SmVuUNocYD5V7cwCQsPZaZs5F2/RB
	z5OlpnaqX899nLntx4ApLqe42zY1vRkWgA0SMYsI+iKlLn2JwNGALeD+zMx57m3c
	hyhkTX25wcuYf3cNxj5vL8BW4eS4tRJhRvSUdnKFh8C33GUfWnHecHjyk0tCeDsj
	yWYvEw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88rww4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 14:41:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b522037281bso2215503a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 06:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762785706; x=1763390506; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYPBMmPMrl74VcBNfaZK6P0Th/jmEX2D4ZwvG4S3pO4=;
        b=RbFb0pl9oAJxnwWu3SOvnejojecPAz5xa4XVcITBqRV9R7I0Vr0RXJpv/WbtttlV/Y
         XgSm+okq280P+liDXh7osFv9LHrsK6ZX0pbQ6zjnsm4A5LJyT842+u90CxQlJZaoXDkA
         L60RCuJtxLYgQ7cERGhPcvfRtCGCa0IAn0bveKfUHB6I6PEYZjWOVOCjS+2OWfGZG3ZI
         H3rV82nThqypZcW8kaEgGvb/04NEIrB30Z9g16akwquxitdqAhRiOjXkTOftRdpC9VSz
         eMMLcYDLQzP7xhDfLRCWlFDPFsiLKuMIBCVomKQheY83c0PARU2AEzkE3RxTizTdbdrI
         PokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762785706; x=1763390506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYPBMmPMrl74VcBNfaZK6P0Th/jmEX2D4ZwvG4S3pO4=;
        b=FQVLlzILCW8r5CPmAQeAzD9OCIqhusMOFmciV8MNspujGrOLR1iLI1Lo7kloORngTx
         DlFDnwehxCztg3M0uL8zLLO1dx6LEZ2IzU7qvo7Hy1t0mbESLS149IsOG1qS8ehnqFqn
         3ZPz1/igqzZNATlp2ZwAlxPzSUuaVSJpfO+2RM9aVR9TJYOt4ANHgUD+GzpQRBdNhs8J
         QO/SUv4Py8G3mDDfqLdoSxiDiMrJQyHLgX3syadsdNuqLAdexYz9a3hquaqpekeOhJgi
         Nng4JOrQSquzlqU5lt+QPELMB91hsnJyXU/MUXHNuoq4P+bChq+H3CsSph+VddgqxrpW
         ekSg==
X-Forwarded-Encrypted: i=1; AJvYcCWcJZivhisYFrDe4k223aAkF2CF7dbededGSraUevS1YvnRwMWT1tcNp5CijQnkKf3erY8WlfVT/V3KnrKhZpgx@lists.infradead.org
X-Gm-Message-State: AOJu0YwtuCSYwk8RqazCM8t2bmfxlWkiVJK/VqQwRhsqykURudf6AZrx
	BsLyrx6FjqOcHao3/8i3yg+ZuqjT0XUBdzO5LaWlOnvrexEmsXfj6hoSf9q9cwy3uPJi9OOzhIX
	AexmMp6mpzRMaTSkFOh10vc/OXUpkYsk5WvYY/0eLTqu6o5EHBg0Afj0mWiIdUUxiQ0YQps2k3p
	WF0w==
X-Gm-Gg: ASbGncuTJ41pQRCQ1x+1vC5vpw+i2I6TBKihhSqpsfyJZWiv0PEyDm2FjyLuzt54HXX
	PGKiqdApa/d9UFpekYgkEjY29p4XJkjCOCK3H/tZYwqu5elbp7f/S9DCWTOD1lNsuWZwJDXyLjk
	ls/wf2c2JXCarU5iQExIAR0UNb4F5kL5ubKxPMEHNHVR/+lDQxF0Dpj9oOP62h9VW3Xy0lhomwN
	c9vZVja8SrI3yehxNrhHfb2Ar74AKyO/66IaBEUOj2euPBISsEODMMBaesiCnxOigYXeK7HQCT6
	j2xUbPJ9IV+zMEXKLl8ly90QoLOS/3DdEmtev21A9L6VXWi9fBIFhCv2WCVGTrw9JjuEQARx7fu
	WMHuksuheXKpfdm7AT7JL8hL79OdVnDrF
X-Received: by 2002:a17:902:da4b:b0:27e:f018:d2fb with SMTP id d9443c01a7336-297e540dbf8mr103670265ad.6.1762785705555;
        Mon, 10 Nov 2025 06:41:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzUGI3gfRP1roHcIKhz5BZsgRD+n11EwhNGgQ9IIMPUd06GGUlB6wwr56gPGTWX6jx/IrBZg==
X-Received: by 2002:a17:902:da4b:b0:27e:f018:d2fb with SMTP id d9443c01a7336-297e540dbf8mr103669785ad.6.1762785705031;
        Mon, 10 Nov 2025 06:41:45 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34370ec58d9sm7675580a91.6.2025.11.10.06.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 06:41:44 -0800 (PST)
Message-ID: <821358a8-64ed-46c9-3fd4-538e194fa5b3@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 20:11:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 07/12] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
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
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu
 <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
 <ec5c9da3-297f-4a07-bb95-512cc607917e@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <ec5c9da3-297f-4a07-bb95-512cc607917e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x20cWSjtLM3d4bEXqOO-5wmjhMpdowyK
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=6911f9aa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yV86LA_xD0RmO51t7RcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEyNyBTYWx0ZWRfX1fy+iSJdZGtd
 ADk04KXn0tCu48OCDurC8HkW2Rk3f0on3CIskOXtfcy5ePAWiLoUHp48+NHk3kwy4zKBLztYoBq
 Pe3FvWzO+LnSqac4kCyIAHO27If4EcxcZioO64eHwg+oGQsD9yARxK77Fzb3lBE+7MWP+n0BUuX
 J+Ke8bFyJF9TehfS232uV/wxImK49+rll8B+CNV7CzQT3mSiTiXZCsXkx/t2syc0Z7Xv6fFGwfw
 UbeGssB+QSJ8xPFiWjRz78zaQNQRCLnQ7YVbaLeoutGwehiXmwmnbJb+W6hteApjhRlYS9odPDO
 wbrFKqOsaxX70SPRIDtJ2b+zUNJZX/qCSe/KjC1dARNWEaeyUaVglK/a1wInvmpSPYnwj/FzfYH
 zp0kNw4oTAtd8dv5eINChr7ufG+6Vw==
X-Proofpoint-ORIG-GUID: x20cWSjtLM3d4bEXqOO-5wmjhMpdowyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_064146_935890_FE758003 
X-CRM114-Status: GOOD (  14.81  )
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



On 11/10/2025 10:10 AM, Kathiravan Thirumoorthy wrote:
> 
> On 11/9/2025 8:07 PM, Shivendra Pratap wrote:
>> +static int __init psci_init_vendor_reset(void)
>> +{
>> +    struct reboot_mode_driver *reboot;
>> +    struct device_node *psci_np;
>> +    struct device_node *np;
> 
> 
> We can take advantage of __cleanup() attribute to simply the code paths.
> 
> Declare the variables like below
> 
>     struct device_node *psci_np __free(device_node) = NULL;
>     struct device_node *np __free(device_node) = NULL;
> 
> and get rid of the explicit of_node_put().
> 
> I think, we can take up this an improvement once this series landed. But if you happen to respin to address other issues, please take care of this as well.

Let me evaluate this for next respin.

thanks,
Shivendra

