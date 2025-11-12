Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A66ACD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e08UAvHE3HwHNhFXMb9zeUVXGG109BSK5gKH53JPKPI=; b=TBqF92uwTvXyOBY6mKjvEwLi9G
	qAzAWxRkbsjXtNWzuTYnk7pxVoC4e4BSJ3uosOTvC/o/58/oi6IvTsbWfvOUfjQxqDtBTH/nL/Qr1
	KUJRxFnWN/bR7rzUnbi/MTgMj4O9WoCjftFFdem348BwOBAwtXUnjdKvyDYyFtM/74VhOHfsosPGy
	Z9TDDDeEvHVGUKPFFhpNmdj0W2J+pDBKg2mByyX3FEZJyQ+aP45jtwUHGgBW9aBGs/BgrBZC1req0
	Y5qgj9GO9aZPEclVf2iL2/VC/CyTOD1GXykMAh7Wou4yI34df7DyB+N27NpOyV723NZ4NzRryRtH+
	CqAHX0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEpT-00000009GFU-3wz7;
	Wed, 12 Nov 2025 17:40:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEpR-00000009GF9-1Ror
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:40:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACHcCc7908003
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 17:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e08UAvHE3HwHNhFXMb9zeUVXGG109BSK5gKH53JPKPI=; b=QsGiCItFKl9i1/1T
	pJ1HGJCr56iP305Q4gOaPjrzG9V/x9SeOvbr7KsTAFso6WUG96K4SDJrprm9+ccA
	dCvNn0xK5lvOfTsx+pW7UhmnCDRTfQpfW7ZWG13akTzS76gvnnsOSwh9NqNpcg/e
	DyZl7nptP2i3tQ4JVK8fZ7ws7eT4aTKmI9X5y9ACTJVoOoYgqLQi5yfEu4qvxvNo
	c2mpyl1eIIUe9Aabs+vXHBOQtkmNtADiDaZjePpQjbXipRvRz1rg561LXYZ3EUvq
	+OeC+7tATnBTWPvQvilFLhPEerYD4mAfyRWwNB67a+EH7MmBs5RglTrIIFwF/Two
	JO5hyg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqur9f09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 17:40:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed782d4c7dso24369701cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 09:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762969220; x=1763574020; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e08UAvHE3HwHNhFXMb9zeUVXGG109BSK5gKH53JPKPI=;
        b=Ms7akt4ZEcZQKl5fB6i6G6CDehKpHVS0dqGL0Pa6Hppx8yNAqxb9viAQs+BwuBlJvn
         UgxLYPuhShuIPpHTjJJsAYCQhk4RDEfrWqeCWZzCOhzh/lSZTa/96k+KK0lWBuooiuPQ
         RJXe6Kv3Sog0qnxo2EhpyFl9Wh6nXM0PBJ05sQ8WXttx4JEpjxQBjC97LRaK+FfT5guN
         Oxu6i8+oBgNKsaF4Uy10qRY9YKrFh7XWGLJh0trxjuvaP1wSQz31n4VlH6upDkvd7oL7
         lHvWd2+uRgdDN/UrZthZdPBRdnQkDz5Yd89TLeOXpwntjD/VrpjKDxCRgVyCm1hBDeEY
         rEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762969220; x=1763574020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e08UAvHE3HwHNhFXMb9zeUVXGG109BSK5gKH53JPKPI=;
        b=gQSyk4LljhFARUep6y8lZGCSmVVVoEMM2ZuekiPe1jMLiQSIYivjAEbYwska16fiC6
         hQjVvOevAUQgU/qGXMKLFO/zvjUKw5cKnLq4eR3dAc/8AZ/cG76IDcUEsWLs3ExhXLU3
         aXs3Wl3vJDqKhavvfPrf1DOKlXat713ARrzeXPWZ4Z/EjUd+Y3t4q7PBJ7pD8aL/l8k2
         NJGsqpVjnNp5yoYHI8effwr12mpgnI2/pFY7Z8nH7JUBaQQPG5hZtrk9FYnhJlj6Ylr0
         hcubK5XX1O21SWnMPEOoFJIS4zAThrvmopVycZ1YNAJaSBoZcTJslEPvrMWT9w37UjW+
         xYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1yLhrc0Hu3fJXl76aKsXVzS1anL+9TOm6zaik6r4cafO817dPDmh43yC417bx2oC21dqu2QPB1d1gvbkYl+bG@lists.infradead.org
X-Gm-Message-State: AOJu0YyvPXtpsc5/qQ25OxqW0k1/iNYghrARSHhhJCOzQBjbxPk+iHMy
	idYbnouIUFU1UR5qrCHe9nrtqSOzI6o6g3u+0qBYL/YRCvluRaR2w57v1/vp7CzcRwoI5+33Etk
	2aBarieGFWU+bueT0zvIQpB9zukGpvL/bbi5hqJen6Q/0qB3uLrK5qiPCQdfliXxmE4/sQOOlme
	zOZg==
X-Gm-Gg: ASbGnctr4LdoEh3PnUyTur7apT1ieAdKJwGD/nWKBAXon2It1j9GnalYO+Qv4eEOHt3
	FpwlgE30CikxzNypKkuGWL/HLWBLNR+/q463F90Ol3mLW4JZURW3PFZeUOM4r1WypEC5Epv91Sj
	ISlFgEw1UvN+zFc09RuhFCwLNlzom5JKuiwTBorSVdYHCnlylRCmHJowcK2MdBf18xksKjlR472
	F7j2hgJD3Cbyfaxqo6ImhhIEL/NY+Fu4g7knSMcoL+tzfA66Skf7f2CMzSUXwTFRZz+U2yt5ICn
	r8TakAeFYo250y0IytoaPH0cDbSf7b7Oc9wKPmIlCV5E1W7u7u3kbpzmCMBALZZBHBvH2vg01Og
	9LIPGO/lKTtXgCzPhVE4OjIO4iaeDfIN8
X-Received: by 2002:a17:903:1211:b0:295:a1a5:bae9 with SMTP id d9443c01a7336-2984ed2594dmr36215675ad.8.1762968592848;
        Wed, 12 Nov 2025 09:29:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ2HzLkIezdF965YJswc0FqGVDKJyjtb+WQ6A5da9sGC1VvOWAJVcFOByW6f1oWaWQ3aYZ5w==
X-Received: by 2002:a17:903:1211:b0:295:a1a5:bae9 with SMTP id d9443c01a7336-2984ed2594dmr36215185ad.8.1762968592289;
        Wed, 12 Nov 2025 09:29:52 -0800 (PST)
Received: from [10.216.19.73] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dc9ff68sm36244955ad.56.2025.11.12.09.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 09:29:52 -0800 (PST)
Message-ID: <4d344e64-ed4f-eb9f-60e4-1267ee53b839@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 22:59:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
 <3gvxaeun4i3ajoo3perjvdsohmtzgstsctdilorr65eexesxfh@hyoinhvkgi3c>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <3gvxaeun4i3ajoo3perjvdsohmtzgstsctdilorr65eexesxfh@hyoinhvkgi3c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE0MiBTYWx0ZWRfX0PLiHv7E7RG4
 6F5mTj4y3wuhJrfFjjb5Vmw8w9F4TUj3X4N/mrE1CM7pXwPdMwNkF523XG/vJ2fwMwkgmU4i+0m
 OcMPWto+M6lLVdAa+XjUXpe1JlmrME/TsJ6OBdfRvIb0A9u0wAFwxznWS+ACUJHG5RcHTJpEzv8
 X521H7zeTEUVVJdChsRoIMjSB7WgC1oGpI71FBhxuYqpRihqrck33+rGpfFWbpG6g0HImtEFUgE
 H0LPa9+4cTEHkkH2m59i+yxd3/o2YG2NiVZvBEp7x7lTRIWkU1i09TGIqPZQcY6AOQKT/Z51qMA
 eAF8ct3FdtZIS1uJTa2w6JD+cBW2n8RJxA5x+sUO+id122tB/pL0FURMk46efGETULGTWq3EU2v
 nAAENLvJSW7HflBNheGuJL7e+fTeZA==
X-Proofpoint-GUID: 4jk-HqN4GOQCpa21NouYdMhebfG2GXMK
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=6914c684 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=H7Ky-y1aa2JJ90q3J4YA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 4jk-HqN4GOQCpa21NouYdMhebfG2GXMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_094021_531796_92B54A01 
X-CRM114-Status: GOOD (  18.85  )
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



On 11/11/2025 10:29 PM, Bjorn Andersson wrote:
> On Sun, Nov 09, 2025 at 08:07:22PM +0530, Shivendra Pratap wrote:
>> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
>>
>> Add support for SYSTEM_RESET2 vendor-specific resets in
> 
> Please rewrite this to start with the purpose of the patch, introduce
> the fact that we can use SYSTEM_RESET2 to affect the reboot mode.
>
> Make sure you include the information that this isn't broadly available
> on all sc7280 devices.

ok.

> 
> Please line break at 72 characters, not less.

Ack. will keep note. thanks.

> 
>> qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
> 
> This looks like the header for a list, that documents "bootloader" and
> "edl", but it's just one lump of text. Please improve the formatting. If
> it is a list, then make it look like a list.

Ack. will update this commit message.

thanks,
Shivendra

