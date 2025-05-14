Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F750C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5/9vS4FRS/VQGDmtMWL7u/M6hqf8gvfjYWZW3i0Gc8=; b=QJMmncwFE8UKHlhzEunAZVWPNh
	O03t2oUUEw/6BIqHso9eTjEOzSE7zrA4B7z4upsmy3eex+vc1jGDusbOcxrr7fRcUV5Lb5/Q9FF7q
	z/di8M8IYKEO2YsLgoMjH9TYhU6fgiR8imDRf8/rz6jQSRcskNjVttpFHnizGPzw7AlHuDOcw9xpt
	pK8ShjPCFc0Sk3zrkcN87wW9YHQkrR0KNU1zCieHtgysJjdmNsBERSakO4YRJJ9jfbo4GXx3kj6AA
	lJuZZ4qM+m3rSzyu5q6Dkmvq0dReS7LYF8jkkRW9mvpk89H/95VN7a4j4AqZT79Rz4CeBLAemPZhl
	O74iVKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5iR-0000000EBQR-0CMf;
	Wed, 14 May 2025 06:35:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5gF-0000000EBBw-1Xrr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 06:33:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E31k1B006881
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 06:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5/9vS4FRS/VQGDmtMWL7u/M6hqf8gvfjYWZW3i0Gc8=; b=Qgum9RVdjs2zkR+i
	e+oEfIDzCrFRwrJwHknja+NnTYGUe0kfBGaxE/kcH1zG/HAgklYoRDOwP9WbKIer
	JsempM+UrVFDW0Ca2k6zuHTR3YlTCCeGehDU8P880C6sn9rTz1C17HS1IJkgknwl
	EMbX0ZmrTikpz8hny2XKCvYV2IUuFi4JSMIobRfrCD3HsIhMxv+A8kMvaRSj+3sm
	NVCUWEEkQnKoEsoLsdpf/TVzw03pnSRTjgfeQYWsb/Jxv+yi9STPWZqzAuqpBffr
	1ffX7foKv+FP8pLkITytCg+xFIiiSi+DWt90BfNQaIFiFVrYDKj7i2ZQI/HkSZ1O
	o/x1lg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyhmub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 06:33:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74089884644so5792678b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 23:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204405; x=1747809205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5/9vS4FRS/VQGDmtMWL7u/M6hqf8gvfjYWZW3i0Gc8=;
        b=YeTt2cL7i1EqmaOETMxjYD5UE7qk191dAX8Gj7fPwOKcdyaF1L6px0GvjHgLK2jYTc
         /pKfWePSYQ9svT6+1AIXpdfFnwzNsd9rn0y8sfuufwniQuLc2JeO1chKkevDTct8k+X8
         eY5zSwd5WEpEci3j8AViN84HOrB6qL7/7EHRmrFkspu91VmAPJXn5HL9YHtCnOl8r7jk
         QRtGuF8h5FwFuAPQiJRThSbW4TAbgnStLnLqsYVMXxcYla4dED8vzQJWfbOtwEXayPiM
         unQoHwrk7/4Tww7RGmDk4nkq9CqIMuBP7U7yQxjCupEZ82mp1WQZP/1MXWomYEGDO1j8
         pU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKRsnHQk2eeuFikP6ycLdZQfoDFkXYrVryjdszArnzQs4ETBOSuxvOWV2N8LMSOvfYEi/ekWsjI1uuVHWZKys5@lists.infradead.org
X-Gm-Message-State: AOJu0YztYw1n9viXuWDM3Gv603u0JTafYefZ3BOa6/0c/ivmwjO2ylOy
	T7USeBTWkBu32jNiGw//Ti+ZkavJyjpFZ0zFP19BN99uqkKxUWHOvPmcI5Uc0BwxLg9NqQDF3pG
	x1SL5+4aMxaO+InGJ6y3iBjdeYXJnXGYBdIXD22O8wFZI2emrj5LRCIys8++GamCUFJUCn6+m8A
	==
X-Gm-Gg: ASbGncvCwSWVr9bS/kt57RBcgQVDhysRjIdg6VFCh3hRsvNPWtw1sAu92RpDKmzgf9y
	d6vRaMOIK1NW6WfL9jSSBZ4areU1UShgZkY/vu7XamaqYfnVnfmm30loz904kwvgNcG8HXDamFu
	enymmpqD/zsLqY3ffjI1TiJCEak+CBjx2bRcoEQBHOlol9hv1JHlPHaVURh1Plcn35YyknEw0YG
	XTMjn41h5xRbz0YDy+G+6vjhDiKo8is0OUzHPN3v767oMbqHS3L6LPb+6jUNBkQllrqNu3HvmEF
	vi60+RxZgjzOZcxC4rTUa7oE0C1BLccdRQZ21EvT3A==
X-Received: by 2002:a05:6a20:2d2c:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-215ff11a590mr3261468637.24.1747204405600;
        Tue, 13 May 2025 23:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETSoI9iwfk9eb2Ld/QSv1BSUXn0GR0U4QVFH399Z38VQi+OSfnyJ8EGrjE5OEBrun47fcpcg==
X-Received: by 2002:a05:6a20:2d2c:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-215ff11a590mr3261433637.24.1747204405177;
        Tue, 13 May 2025 23:33:25 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234941baacsm8298049a12.14.2025.05.13.23.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:33:24 -0700 (PDT)
Message-ID: <8899a562-2efd-9a63-5fc2-2972f47a9296@oss.qualcomm.com>
Date: Wed, 14 May 2025 12:03:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in a
 platform specific way
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
        Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Marc Zyngier <maz@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M_FuWTW1np2IAg0CrsuRhVjEHcLJIXdo
X-Proofpoint-ORIG-GUID: M_FuWTW1np2IAg0CrsuRhVjEHcLJIXdo
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68243936 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ljfrh_M9o-RCrfJy5NoA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NSBTYWx0ZWRfXxX/LsdgOYcqR
 rRQUDhfth/3mHASBkUPPgkdPE9USHOP6+eR0lL6azYRuNK51YEcqb1vYBqxMuuto5iGsnYxep8O
 fftPCJrNbLeGF70fB0BcVd4PhndEZpgveYauy92KDN963ee+N2K0I/GhwNaCBTbJ3UDVBHZpK7Q
 pKRQavXjZsTP09qUYFvF7SuXt94UfmR8xipRExW0L7Y08/iRGf2+X1wqgdNEifobeYNVqEXQpCd
 rBNfAuwB5HVMNwva4kgq5A0TKZyUONdH6NQUvGLKnYFlgtQ6wZpeyLFegxsMdYdJ3LpSjWKlsaw
 EWJNc90ylDOlsweXvIQxW2RRyo+e4KKC0Q+gRJu1ne3LUmhq/mXXBqG8hUtCtnb4F1nMid+Zhen
 Ca/zGOYpLKqsLecUbg5xEz+Co4BBP90mWkebEHslHBJlvDRhAC5RFkeADWyaZYaV+Uq86deq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_233327_425339_6EA809E2 
X-CRM114-Status: GOOD (  23.58  )
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



On 5/8/2025 12:40 PM, Manivannan Sadhasivam wrote:
> Some host bridge devices require resetting the slots in a platform specific
> way to recover them from error conditions such as Fatal AER errors, Link
> Down etc... So introduce pci_host_bridge::reset_slot callback and call it
> from pcibios_reset_secondary_bus() if available.
> 
> The 'reset_slot' callback is responsible for resetting the given slot
> referenced by the 'pci_dev' pointer in a platform specific way and bring it
> back to the working state if possible. If any error occurs during the slot
> reset operation, relevant errno should be returned.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
>   drivers/pci/pci.c      | 12 ++++++++++++
>   drivers/pci/pcie/err.c |  5 -----
>   include/linux/pci.h    |  1 +
>   3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 4d7c9f64ea24ec754a135a2585c99489cfa641a9..13709bb898a967968540826a2b7ee8ade6b7e082 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4982,7 +4982,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
>   
>   void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
>   {
> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	int ret;
> +
> +	if (host->reset_slot) {
> +		ret = host->reset_slot(host, dev);
> +		if (ret)
> +			pci_err(dev, "failed to reset slot: %d\n", ret);
> +
> +		return;
> +	}
> +
>   	pci_reset_secondary_bus(dev);
> +
>   }
>   
>   /**
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	}
>   
>   	if (status == PCI_ERS_RESULT_NEED_RESET) {
> -		/*
> -		 * TODO: Should call platform-specific
> -		 * functions to reset slot before calling
> -		 * drivers' slot_reset callbacks?
> -		 */
>   		status = PCI_ERS_RESULT_RECOVERED;
>   		pci_dbg(bridge, "broadcast slot_reset message\n");
>   		pci_walk_bridge(bridge, report_slot_reset, &status);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 0e8e3fd77e96713054388bdc82f439e51023c1bf..8d7d2a49b76cf64b4218b179cec495e0d69ddf6f 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -599,6 +599,7 @@ struct pci_host_bridge {
>   	void (*release_fn)(struct pci_host_bridge *);
>   	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	int (*reset_slot)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void		*release_data;
>   	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>   	unsigned int	no_ext_tags:1;		/* No Extended Tags */
> 

