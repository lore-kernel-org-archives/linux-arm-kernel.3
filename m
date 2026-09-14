Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1947C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 20:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=De9btpAcgFzmvF7mI//3qVjoSQFLmkKthDu+Y3II2EI=; b=ngvDSHqRbRPXP9TXVCWS94W2vP
	BEcKxSgnF8nkYD4O6c1ooMOML3ICHnWPI0jgbx7qNv59Ma7Td/6awp4ILnS+Wog4UCuPaOH+vu1e8
	5qs+bqBjLgtlqLb/DxQtD6l0YzavaIdgVujhzvXZdV8UiRhuiVoPHk0oNCYv6OklRrN69REn4AWyv
	/V90hM2m9wMhlWuLdbPFyVPhmfsiySCpEaz44xNduYhp9Fz3fqzr8wxFTcHEFwWgS900n95JyYli4
	dDDqKJMuRGlA2Dr6XNM9O6Q26970h8jaoMNx4vfcxt3xacORtcMSLyX7uWYm0O+AR1pDQPb5bs7d9
	+F448dCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6De5-00000004dMi-2NQX;
	Mon, 14 Sep 2026 20:51:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6De2-00000004dM8-1tVy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 20:51:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYedf1383339
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 20:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	De9btpAcgFzmvF7mI//3qVjoSQFLmkKthDu+Y3II2EI=; b=XQK/e0NKNXsxiviu
	MFJhMw7Dvif4XKGgod9mheacclpN9cy+xFxs2bWKF5XHJNE47uuq1nS/WiXbKOS2
	XJqTDvR+Qtb6RQeeI4zEmar/U3LidHzBz8zpTEjt+Pb8kop3MpH/4b00FHa4B0p9
	whg1M5sfPfqDeAHHn68p2nyAGnuBxltiWm2T47QDDG0IQ0jNUBEaVMGQu3WN5GHn
	4zBQ61S5XS+KFiqV3zf6gKXbh7UiGz7PA6YAGE3BFlG4gmpvaqSAlzdHrnGRtZdW
	Kq7M+i+W6WdRjetOAxgoOrdtQmxt8QtoCbPLIZJf6p3JjohfzbUX1r4AYFYqGoYU
	sz9XfQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtj2qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 20:51:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9057fab9eso60356835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 13:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789419076; x=1790023876; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=De9btpAcgFzmvF7mI//3qVjoSQFLmkKthDu+Y3II2EI=;
        b=EJYZLzCGTX2XHUepQHBLQXS+xy7m3vrzYrMi+ELlaDoC2BRZAdUZ9jUrH4dCBQVye9
         CJ1lXVS7MrDuwdsNTmNByLGKweOcYC0tnCRKjWAjujRBa1Hl0McNxUsuRdmQxEXQzG7a
         t1d2CLtOJ1e9HnXcfyrhU9Nl4ZmHVotmkM+AA4oPz86XKrFQ2gtvF0Q1FF0XJj+a3NQ3
         tsxfqqFqnARgWlamn/NvPEd24fZg9ARzTm73kjoY06imC9xpqAYFhZpmTYeRfIj2e8Zj
         cZgB7ew+GZxIr35GN+x91Z+rcmWJSprV3KkIllxYiYGDVof/73wndQ9185WbDrcQkQSk
         EwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789419076; x=1790023876;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=De9btpAcgFzmvF7mI//3qVjoSQFLmkKthDu+Y3II2EI=;
        b=WaEd1k9Ufi8ixkGY80RawZYWlduZyP37uog1aj8rH9k42I3KZovXugaUcTYtCXjoEj
         5Wbktqoyw+qZAUlg4dtUwXd8yFS8bjzocADKEblSWs9pLFw/n+xfbT4tyAf9/Bs/OfdK
         yS3+P+XRBGwC4QrOXpzJeHgVM2CSdEtC1QLT5LBa50U/zLybOgDC8dmVkxpUj0EEBgKw
         Ae54gVAcK0R748L7JWsuEC1332M1vJCTFbeYPvKJlfDZU4GjRpKmjslsrosyAOcJi49c
         q1D+1+vtBpSCxwBqOyPjrLhCgOevFW5wImFkH0oiVVZegdAiHdNAX0r7LcEDHaZQRaHm
         X9Fw==
X-Forwarded-Encrypted: i=1; AKwUvBxYzWDWFKjR8P7Go6tMZHbCGr8APNt+VX3ZKvMaP1uZyav60uVrtNT1Fpi5KwUS4fTRq+5SZFRrmye1LQfe4Ohr@lists.infradead.org
X-Gm-Message-State: AFuF++koC+l1ctTbIUixKwGMjHs84ha+7KW4kUmJFHBszq8muQWGwKto
	9e343d+JYHBl8TwUPeH3Z3a0k3sab1mAD0sbjlXoyOem+Mb/eiJZxIODrcnOk0JtkxGUQlBRaEU
	HjNTInIGlCIlTa2c0BPdXT1ITwvdtI5xafBX+/9eMCIAbfzQdRdLIjJhMCDbid44/thuYtEZWKH
	FGFw==
X-Gm-Gg: AYBFou0Eu3XbkY+P9742XjJquXH+GnVW4w8V5QMUtlE4dSzvKski714NUFNedfWFQpn
	NwgvalzjAt9cOdyrF9j2m+HQCJJ+8G44aQPA6WBPzmm+xhuJXtgFz7WmIevICXczjUmzAAMVwWv
	HcXrJeFULdRW5ko+Q8c1gtvENnI3AkK77XD1NOB4jxvfMdeRjGlAg0yPVc2kbgWrqLkxAAz+ldP
	MQ8bxNtdSGMPTXzz4TXIRuxiZ7CnGC5skemy95+mcobRwvjO+g/pcQt42RAmGXHeGQLsVmiO4zH
	0XIEKXQZD1192gcJD6KXc/GLE90+6/N5c9EUigakuPfj/sFAaiqFrfo5eyPy36uWq9bW+w07k0V
	kh6z/vPStksUNdTea7D8s+amPz+A=
X-Received: by 2002:a17:903:f8e:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2dd6c5d0a7emr85662515ad.5.1789419076352;
        Mon, 14 Sep 2026 13:51:16 -0700 (PDT)
X-Received: by 2002:a17:903:f8e:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2dd6c5d0a7emr85661915ad.5.1789419075896;
        Mon, 14 Sep 2026 13:51:15 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm27865013eec.11.2026.09.14.13.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:51:15 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:51:12 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260914135112.0000684b@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-7-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-7-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa85e45 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Tpk7IuwJ_fedSR-JTnkA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5OCBTYWx0ZWRfX9XZlZjNkr0LN
 84bdL6HxKwS3H7WhpCUXt69gbbzQRCKQ9gFcfrf6y60/J1cwBh6+RPMhLTlHtP9e5QuQNM4MTYS
 SIwp74igIovilKKZeRpKN3Q8STmF752UF4kaXVgT20X5EsgCaOXXE3fh88Xitje4nlTzUJu7mJI
 AspV4tf4oC0u0OObo9Y5NZ/9yKgHk7Pz8rdn8r1rLtIFC7RBKbfVBBrhkluYZuk2cscOlKS3pWO
 QMn57OQTRBy6TvoyAv2BqZcPufagPKwb8qzv9Lpz93I+0DzdWrtJa96UZnlusVAU6he7EyqA/Tp
 DyQhZXkOTAlChoTLfPpggErOHc2Z+XsB8Q1PFEDwWwPdQBs+Cqafrbe8ljtuK0TO45/lTDHcYmG
 bsy+FvKtbW0PhQdYpuuXjlIdlll13gL+fJ5cULHlJUhIf7duRnD4TJQ96L9u+Xf0IbDNTaqjQVh
 pN6cImJeWehAILcvGgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5OCBTYWx0ZWRfXxyZSO71f9Ggl
 x65eTMxC0piFfUZZxMb4ZgzbqaVa2KhAcYTSfY2k/qGOfcyPFfHqa1n5fEhGkn2cK+dkv6JccQ5
 FeM786BaJeKyxqQ1+XNL2qaA2vuyh8A=
X-Proofpoint-ORIG-GUID: Y3BKqvMKfHvOsxDNpIIkoJ3Z4oRXlbAa
X-Proofpoint-GUID: Y3BKqvMKfHvOsxDNpIIkoJ3Z4oRXlbAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_135118_607700_7C7CEA63 
X-CRM114-Status: GOOD (  24.47  )
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

On Mon, 14 Sep 2026 11:35:10 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> is SMC and if RSI ABI version call is supported, create an arm-rsi-dev
> SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC driver so
> it binds to that discovered RSI service and keeps module autoloading
> through the SMCCC device id table.
> 
> Keep the old arm-cca-dev platform-device registration for now. Userspace
> has used that device as a Realm-guest indicator, so removing it is left to
> a follow-up patch that adds a replacement sysfs ABI.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

One minor thing inline.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/virt/coco/arm-cca-guest/main.c b/drivers/virt/coco/arm-cca-guest/main.c
> index 80659f0885e9..7b1fa008a8f4 100644
> --- a/drivers/virt/coco/arm-cca-guest/main.c
> +++ b/drivers/virt/coco/arm-cca-guest/main.c
d)
> +static int cca_tsm_probe(struct arm_smccc_device *sdev)
>  {
>  	int ret;
>  
> @@ -178,30 +170,32 @@ static int __init arm_cca_guest_init(void)
>  		return -ENODEV;
>  
>  	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
> -	if (ret < 0)
> -		pr_err("Error %d registering with TSM\n", ret);
> +	if (ret < 0) {
> +		dev_err_probe(&sdev->dev, ret, "Error registering with TSM\n");
> +		return ret;

		return dev_err_probe();

Having that on one line is one of the nicest things about dev_err_probe()


> +	}
>  
> -	return ret;
> +	return 0;
>  }
> -module_init(arm_cca_guest_init);



