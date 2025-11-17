Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A40CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i93olX92WqAcMU2/NsjuIGXAvZ22y9Ah3If85Gfr8Ow=; b=Pwf3BRHB4RDAq2DnDcGoKYX22x
	6j8fgCawe4vkYm/g0Zbw0XgAPLFnVyBzAQZt4Ve92A39oTDfE31nTXpVvjP3W3zGdfz74oTw9uIfQ
	YXj4h56KDCCe6inSz/jst61Dvg9Av5xSUIEKVA13SEP2IXPJHroLTwxkxdfURt981pQQk52FlvZpZ
	tvaIleyyX1RZoF5ynhT7qEXjaNtDTPVqetTK9fucED02ZHC4LweEqFZ6AjucN0mDst+9Fxk/vGYh0
	bAQsmPH+esPv9hSplqbFYOSoTFl9ht/cga8CwgUZtrh0AFIMOoxcDhyYVPCSzJbIqfTII004RsHXG
	/hLuqfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2rV-0000000GWRW-3LVO;
	Mon, 17 Nov 2025 17:17:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2rS-0000000GWR3-3HGh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:17:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAkMeI2790796
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 17:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i93olX92WqAcMU2/NsjuIGXAvZ22y9Ah3If85Gfr8Ow=; b=mSKJsYvNcgJG2DO+
	S3tSss88S85wvJ3o7N7LILxkPDMEHZVJaKyjDJ1DucgTVWlrLjtZF5tRrL4Y7QZm
	nIoMyZ16FrhfHwgPiyC7T3Pu4KJ5xRIVWR7WazUT5RPZNiw/51VcxnE2BnSn1j1K
	dsJnghBkf4o7mttt7xjzcgVlZx9gvaAtezl6DXMJaPTYsBfKJiwshwJ1vMl4rIlL
	eIUzS/ZXD6wKoH2Yb+qXAh3e2VIlVobf4oHSXgcEVQWImqv33MAHcrFgi8T5uoka
	exxNKi5SEz0/FYMQkZmTcTRL8Gm4y5K7wPZcCvpcCcyOvpA7Kj6W8hxPn/9GnNIx
	L4dfQw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bjeev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 17:17:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-299ddb0269eso16985355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763399874; x=1764004674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i93olX92WqAcMU2/NsjuIGXAvZ22y9Ah3If85Gfr8Ow=;
        b=UE5RIPXUj9DqvPUiNURjiG9wPNXqjeZ8QK7tajO1P9uJlGTACmQO9kPSDWuUPNB7d8
         ly8uljG4qiIV60RK6ikS3Ojuq+YEpgHLS7hmKUOjffkZVGg3j668ufPaWQZqSXl7FMMc
         cczF2IALyoBfZKavDUFo6dckPidX5pXbbKwZLGCaUt66Hl9R+iB3AzuebWrsZvZz8hh8
         i/EO4725HmRNdcEW7tuXjLMA9WpHM8bMyIpaN68rQp20tWtLJB5XP/xtFBOfXKaSYVhJ
         JRBRdHCzAVlrJdv6BWSwHm/c+Xyy3Iu6+il4lXY4gz169vI8LIuiaOd/t0blVdTF/B4E
         UgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763399874; x=1764004674;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i93olX92WqAcMU2/NsjuIGXAvZ22y9Ah3If85Gfr8Ow=;
        b=H+q5podDo+NNcwLRk2G5TktAhou9sXmLh2GLZLnFQMGU1KSTpOwgsRCdMKSF3AHl7c
         z+RMMTtEG12ryWAtPopP8j9g9DDt+91Y5Giy3oVKBFmk+1sv1MQ5xVQMJQc/Gfkac4DM
         2YWPJYMCtUMsTYZkrqK0nN2OZHUzUv63rQX73NcvuwmOEyws7e0aDiOEJREoeWYX+jxn
         Jxt/kMBKbcPysdp88AtMDDJfsVBpvYp7up+uQJp7J2um/RkKuDI8VlbUjfZ5aU4gDhyn
         tceM+TR/f49MJa0jLS0Uo/9gGr8GV3yovJH1lXy5uNhVofQGnnpFnYhlxCUyu82uSPkF
         VkFw==
X-Forwarded-Encrypted: i=1; AJvYcCXBbUrIsg9hjipJJw3S9GZaCreAXmvOi0Ft9Ez8OsMJnmibMdfpqiFK69T6mZFhhwKXknJvInYsJVtLKDIUSsLI@lists.infradead.org
X-Gm-Message-State: AOJu0YzsTXIm++rUMjE4QUMjlKyAsHpvR+Z7RTbDe8Ts80kLcDMfnbEz
	hs3LuiA3WFCGvZ5J/ZjLO689zVI8+SUwx9hFXDPGq4Vcinp0qaYQlZIGROTLrKcbD6CNkwaBc9W
	V4m4wTgGd1pvN5B0XrS2gR5qsp7GpzLmNQgvFP9y+srESPG/goIsiaV097cu7YzasNeHY+Octww
	Cc6Q==
X-Gm-Gg: ASbGnctvzncPeetfa5TyrpwmuuKc88wZcooSvJrZ7SPlEBdgmXeS2LFLknwEj4DMiwj
	n2C62xin4ydpWfb/CufuNufsWzThPJdRKg7jYlLSRac1M9IwBH4XjAYFH1V0J7wLDQHfi5R4eJy
	1k9vwthKqUW9sac6/fNWXZbAPSQ9z3cz4f2YpyheEtwJSnUW5GwjGmxTpTeKOTQXgDS2Q+ayLS8
	jhiuz6OVBKLA3uG6RduoD6PkZYQHzL4Gwa+2gqjHufJd4MmPdNP3999yPEPWlU3l96oXINclYHe
	JeL7EIrcUrkFvfO+mNgPyr/RO39E29ec7ABeQhaDebuV98pyMVOQAcgm7yMXFgbRXlrtuRNw
X-Received: by 2002:a17:902:d607:b0:295:6a69:4ad5 with SMTP id d9443c01a7336-2986a75e3abmr163279065ad.56.1763399873600;
        Mon, 17 Nov 2025 09:17:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXqHYNFy2gFUByh/xB5XQrlDQJxkWr13L5mGpmFTI1mFj2T5raib6vRXVu9+YiT1oOKIIsdw==
X-Received: by 2002:a17:902:d607:b0:295:6a69:4ad5 with SMTP id d9443c01a7336-2986a75e3abmr163278645ad.56.1763399873107;
        Mon, 17 Nov 2025 09:17:53 -0800 (PST)
Received: from [192.168.1.102] ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b06b6sm146804555ad.55.2025.11.17.09.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:17:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christian Bruel <christian.bruel@foss.st.com>
Cc: linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251114-atu_align_ep-v1-1-88da5366fa04@foss.st.com>
References: <20251114-atu_align_ep-v1-1-88da5366fa04@foss.st.com>
Subject: Re: [PATCH] PCI: stm32: Fix EP page_size alignment
Message-Id: <176339986701.12619.4602667156488973060.b4-ty@kernel.org>
Date: Mon, 17 Nov 2025 22:47:47 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: y9oDCcdrqC-Rolbv_KfYoep1UsiCcgn3
X-Proofpoint-ORIG-GUID: y9oDCcdrqC-Rolbv_KfYoep1UsiCcgn3
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b58c2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=do5hrM8nwbRZ-HPJZGUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0NyBTYWx0ZWRfXwMNHOPmJU/Y2
 BAdG6xATyqk5oqv7knRVbrapIk5qYHGDlqi2Nm6hkIwDlp6H6Rxxd3MlJ1pVcwFlhdmYniUAzk+
 lBY7qX/gFeMATAZWYTX0M+868QRDzgwxhu36ZuSw7ehBSxISMkbQBOWGGQuvQP6moGlFzHHt9rn
 ONODRhSKrXH61W5Q8hJQm7KVJdRiO6Tj+Le7F7fGt1TDzOaMNHlL2FuUrXyGUdEgZlI8rUVSWvx
 soK2cSfMKq+sn9vlO6hhR8TxuejT6/lZdzdv0NH1FS8KSn4muKkYitcVmDRk5VoLGB8997g+Q9p
 lf0IdfFaYZc8haQNnMYb0tNQjf4WIdmDFOHT5LpLitM9TbU9fX/VxKo2I9RADTV3YHZw8a9buvU
 A4gAWA8874XOqK6vXlUudx+7hhOoBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_091754_831569_3DCBED32 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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


On Fri, 14 Nov 2025 09:08:05 +0100, Christian Bruel wrote:
> pci_epc_mem_alloc_addr() will allocate the cpu addr from the ATU
> window phys base and a page number. The resulting cpu addr must be
> correcly aligned with the ATU required alignment.
> 
> 

Applied, thanks!

[1/1] PCI: stm32: Fix EP page_size alignment
      commit: cf2eff021ee3c179a4ec4a6c1d34a27fd92b8acf

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


