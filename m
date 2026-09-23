Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574FDC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syJmSg1jd2+OqFENPatOG6ZxGNllzRDnmvLVWXY/WFw=; b=ozZe4wfYFIZ8MSkRKC9gGxs9eA
	YfJmUMQA7IMuKhNf0Sk9W6qeg/22qjqlTJ8xErjTCuILbKFZbTZC3zeKfc5WgvP2Nugp6wregk0Zf
	ht5+lcg1RvKH5oDpiWiYMARM/cuLsR0ypKiH2Li/tMOLfxriR9x4DSXY9FlzJf0oLU5zf96Eg8kLn
	Op5+AJEAZAFWMMB/UEalizZWyVTvueWgT3Pk8WyVMP/oxVjbMh/nNOrkWpHtDO1JVZRT+NPrHrRve
	41buleC3IT4p6mycqreashPgMKc+p42ZNe8OWGf3h9UpeMhXEVDt7xsbBoGLyUdMhGVx/daNl0pHa
	KVfNDyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Pvi-00000008shs-1qEf;
	Wed, 23 Sep 2026 16:34:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Pvd-00000008shP-4Byf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:34:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGU17C3106174
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	syJmSg1jd2+OqFENPatOG6ZxGNllzRDnmvLVWXY/WFw=; b=ByMAJO21i0WkgepC
	qBLMYPmSBPFnmTAa6Ql/4NM35PeW+vJ1ZmXLA4Z+PcAcD3IcefYrryJfkp9RpQud
	nfLrdiR/V+ZX7jaC/2FTKvW4IOn8+ZD3s4SodQ3g+yTJAGDZdstDWYXuyDJD47TH
	EqjGNNbeREImoXWBHJKmPfKB6QLOX6fVQGf9sAXRvPQEE/1ZxC/TeBHB2eMbG8Dq
	cVy1kI5KTvitLZec/Qdn8q0mjSU4Be6kRbneE0Lz/dBj5TsflBz1NUvYQ6aDYd8i
	dvg194gDNqBINzt6srKx5t/SoakUcWwy0B3ENudjTRgMb8LUKb3MPgPuJuFTfRiF
	X7bATA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwgupp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:34:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1a439db36so798872a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181279; x=1790786079; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=syJmSg1jd2+OqFENPatOG6ZxGNllzRDnmvLVWXY/WFw=;
        b=apZB21B2SGK2pE3FLwoELdV0r3QznCklj6TRDOWiu3ddPXjF0TSNv8CAVn7CKsfLBA
         45h1jTPe91YeNp3L1B9sCfeZmin90csC4lwjcXNFom9ZYsQK37dwt9QgPmh9YIVK0VAu
         zzGSrl6ZWdIP85hdG7Rs3hUWJI7Q1MNuofKgN0rNNGF5HWIN5xdtXcvy77ZIGRH3IFKg
         Clk15Sp8/xGOE9JjXksxCWQHEsAyoOsjzVZ+kZKHeRlPls9EhXJLSmwd8RRgULycTHeT
         TfPFpD+E8tzmyQuW+Nu9iN0uVXtuc6E3yahbDZGngg+7he1cMNpCd2e3un1h/LQE9c5p
         h9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181279; x=1790786079;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syJmSg1jd2+OqFENPatOG6ZxGNllzRDnmvLVWXY/WFw=;
        b=R/iDUbg6k4L+xpWX9Mw7nxavXzAUc4uTqHWExOskH7dekIwmClLRm8E5JBo5QrGyKR
         EAY7TqhmfkBBHJV8K3ZPYzz31KvylumyZoFz5miCJKTymJ4LODt/D+1ElNCGdx/GOlPe
         gt8ANxtYUTCoatA3GW3rCp1blOHnWiPh1fJPMw4clsoia6xOH3O17gXPhpWUVb7JjSqZ
         TB2RG+qRR71VxC/djdya0FOx9w/PoJE+unk261PnDQ+ug22/kLvc3PFFH0fT32sNH8nj
         45LAJpII9hTBC2mkJnLMDo7H2nA0Usc5pjGGoM4xx8E8qUTso47JQQNIJzLKSTgNnPtA
         OLvw==
X-Forwarded-Encrypted: i=1; AKwUvBzp3x+gqSnQd5P7+2B6ThdMBBCdHn4b/S+dgbrfQQN4LW21STrlHn5OsL3f1TwjebNaRjXE4P0dd+4vAzKyTvGH@lists.infradead.org
X-Gm-Message-State: AFuF++kopwqIMN+ssO2xMR0tVa9TRpcmU1d0imQL8yyE7XQGa2nluUTD
	x7eqZOsWSJOSwLN5OE08H5+K1cPB9SAFs3RfFPCvjW0nk3odS9Nf/o0/ftApzaAzwxk81w7sfRr
	D5iYGhzNSgILdRFTGrEgFZbfpOZS3GRX/Hv3WViIV2e55G/Y0sWGsmW6GK2kLpXXNMxaSFbJihr
	Kthw==
X-Gm-Gg: AYBFou1Fh5JEgJ2ghCTWi3XnWT7jSYUJy/KTJf2uvko/1xslTxQEoh76ID3SywIOKSX
	zX76hCsjYJG5cIaTfkvFnN+y+jeqT0gVmCjstlp1N/t2gj1VDEsuBW4XgdR3txyCcqSXcdEZpsb
	ABBt1T7nu4oE6eIUAZLw52s6wmD/zgzTPDLnRng9BW50R0KcWBdcA3ghnC/VpFZtIThzrxwmRsB
	PjW4IyDHcmuPZpZcCwGak24I4aTmyF71IEK2CIgY8o+7ITR1Z8Ads9wzGMWHVOrsALrdYpf5bVD
	8Mm5XbYXc5iB0t9alzj7wxjL0VvJ3ubihDQvzDqslYDML2Ozti8JMH5Dg/MeOQiQX8juJTfwQ2d
	PUv6/h3fxg+BUvyRd6aDoKTayDTpV+v7F7YDakEoSx9mDwvl+BFK246da0xlWFpbn
X-Received: by 2002:a17:90b:2803:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3a07e53ff81mr2827000a91.24.1790181278463;
        Wed, 23 Sep 2026 09:34:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3a07e53ff81mr2826960a91.24.1790181277942;
        Wed, 23 Sep 2026 09:34:37 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3f0915sm1427960a12.21.2026.09.23.09.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:34:37 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:34:33 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof =?UTF-8?Q?Wilczy?=
 =?UTF-8?Q?=C5=84ski?= <kwilczynski@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Rob Herring
 <robh@kernel.org>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Marek Vasut
 <marek.vasut+renesas@mailbox.org>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Will
 Deacon <will@kernel.org>,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] PCI: iproc: Use __free(device_node) in
 iproc_pcie_msi_enable()
Message-ID: <20260923093433.00006cab@oss.qualcomm.com>
In-Reply-To: <20260922210839.3765444-1-fuad.tabba@linux.dev>
References: <20260922210839.3765444-1-fuad.tabba@linux.dev>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX2lDQD9LHMNq5
 HaQdykxNowVQLOQ1LokMjaombiNF0zOtaH/jslpRhUk2Hwo9caZZklxmU+QbvmXJGjFE1D9JHWv
 SH4D3csOU8O3hYvs8mLoCZqTYEes5oltrzg2m3JM8Fabap6/idlUlnIaEur1v+rLdTLPgJW5hjo
 Ss6iTdmBz/iv9Uk9WWohKVu6MoqDKZjQppbLKAvdCFa7CmsSnMZ2IdkCZSCPexn2IXnYe11tbGk
 hOaoQtwGLufLRoKYUeKXphnOqXIKFdeP3hkFU7m2HuGFz7mxCjvi1w1l6qrY5Qtrh7mM3anMyg1
 y0uYXYIlZ/NllBvvpGA6k/jbYNyeC1oR+Y+yGU1IAWqBCxrjXSoxvwEI9IEUxMpfJMpbZA7cccQ
 Xn3IjmjfcX7FSxGBihVPhUXAqIlnMGVLz+TakDoJhoImufJ01NxGSTH4R3VhWONwZ6DnaDnnL2+
 o746hZHxgHTpBDgJdqg==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab3ffa0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=b3CbU_ItAAAA:8 a=lkVW872q3F1hLcTO0fsA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX9YNH7MoZEXWo
 OTHORmmwlKb4h8rSUyYLbb9BvD9j4DMrJdacaX+B6oWMmIkpbU7ATQS14xShNwJaMF2LlNWPSEl
 UnjaP3EEb02YhI6Rwhg3EhKXqRy1TRA=
X-Proofpoint-ORIG-GUID: u1L-hKFN3PTvdeAy3KJr7yQXrbSxtdKa
X-Proofpoint-GUID: u1L-hKFN3PTvdeAy3KJr7yQXrbSxtdKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_093442_164824_14B9713F 
X-CRM114-Status: GOOD (  23.83  )
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

On Tue, 22 Sep 2026 22:08:39 +0100
Fuad Tabba <fuad.tabba@linux.dev> wrote:

> Declare msi_node with __free(device_node) and drop the out_put_node
> label and its goto: the scoped cleanup puts the MSI controller node on
> every return, as the label did.
> 
> No functional change intended.
> 
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Link: https://lore.kernel.org/linux-pci/61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Hi Fuad,

See the guidance notes in cleanup.h.   Linus has stated a couple
of times that he really never wants to see = NULL pattern miles
from where it is allocated.  Best you can do here is shift
it down to immediately before of_msi_xlate(). It is fine to declare
variables with destructors like this inline (i.e. not at top of function).

Admittedly if the scope shown here had gone a few lines further this
would look less bad!


> ---
>  drivers/pci/controller/pcie-iproc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> index afb3aa38ac6bb..b4f4e6e1d4b41 100644
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -1338,7 +1338,7 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
>  
>  static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
>  {
> -	struct device_node *msi_node = NULL;
> +	struct device_node *msi_node __free(device_node) = NULL;
>  	int ret;
>  
>  	/*
> @@ -1357,18 +1357,14 @@ static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
>  	if (pcie->need_msi_steer) {
>  		ret = iproc_pcie_msi_steer(pcie, msi_node);
>  		if (ret)
> -			goto out_put_node;
> +			return ret;
>  	}
>  
>  	/*
>  	 * If another MSI controller is being used, the call below should fail
>  	 * but that is okay
>  	 */
> -	ret = iproc_msi_init(pcie, msi_node);
> -
> -out_put_node:
> -	of_node_put(msi_node);
> -	return ret;
> +	return iproc_msi_init(pcie, msi_node);
>  }
>  
>  static void iproc_pcie_msi_disable(struct iproc_pcie *pcie)
> 
> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780


