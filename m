Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D727DC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdAcd3jJW9o4oT6W8Pd28WqwPKx89e7FKJveLvjxmTM=; b=GSfmsVXxbDtX4fHcg8MopqbeEA
	WQEwFBHOXfAiHZv3ibQXxrhwrDHBz451/zpIGENLEWxIxrYFwzq6TF4/+XGxGr+d0hvTOGTCPNd03
	NgenzmuLwn7N+OICA5VYMIMht7L+tytZ37c2T88MyRA2rNRiU9eQa7jnx6dt88fYuJLDAcb6p+5QQ
	O2pF4QkDfueAfRAYSPoXsmWIO9Vq/qSkSXHBVIfGzYvia9RXEQ1hYQoMoSvD3xwxwxccZea6i1sEw
	L7Wad4dxGFWnTrST7kb2qcCYbF2HuQDeBwAWgujMbyBa36APgo5e+z7DTJtYNKEAd3vlw0N9eebi9
	+M61k2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sNh-0000000CL1r-1hbx;
	Thu, 24 Sep 2026 22:57:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sNd-0000000CL0p-2K60
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:57:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMPASg2771640
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WdAcd3jJW9o4oT6W8Pd28WqwPKx89e7FKJveLvjxmTM=; b=BI2Gayz/LjxSc6mE
	Kg+MLNOusLPeYnOxYOG9xy/G6ynTgm5i8HXcMPcVaie12keAjyA2Oz1Cf0fyIkw2
	1iPHcxBnFcP9qOOkZ07f07f5aQw1qPFKV8ApXthFNkR53KsFmNN+apNakWPmF9KB
	GZ4On06jpyBc5aTWoomkmhaScQbrjk2k5yn95Es0ViLT4dyJ6vNbt0gJYJ4jce1c
	XIv1evwdRyzJbK4ev5ygZd0QRpNzogYF0Tn6LwzUygOtjjPo7wa0hzGZ8ulMQwj8
	1Dwm44i8PH1iR4SnWFtv/Stn36RWYL43Nv8n7mH5JL14F6v+yiIOppzxFkJgDYi0
	2R3TpQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7tyc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:57:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33baaba6371so967085eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 15:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790290648; x=1790895448; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WdAcd3jJW9o4oT6W8Pd28WqwPKx89e7FKJveLvjxmTM=;
        b=KiUztf3R+70aA5fh8h8TnKS+Hy6KklYjkiPcHlEGWn8PoTB9mGKqkcOZe58eYHmd2t
         KEitM7yWMPetLxWnUSwe7ASeXDLSygK2eiY/pozrC6ySEjaFIKsNVCfr+xUwUqRUsE9w
         Yeh+aeOBpiXZV0Nnoknamym/ZZpjzlHWQivq3/8e15pf+ZWUas7KbX3eM4gSoIAZp4kt
         k5yHOqrrMChgTTH1Ve0wWq+0+d9js/U7cN6PEQpThFKFa55T3mtPA4y+nTyZVBgtpSEl
         YpZLxPn0nrSIVyc7gby5ww86d1IdKzjig4t/WQKF0cHDOiHoqdQCalN3i0ZTWQzIU/2p
         X2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290648; x=1790895448;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdAcd3jJW9o4oT6W8Pd28WqwPKx89e7FKJveLvjxmTM=;
        b=fcZ8CjKdaN2HMxbhVtpCnrylUzaFBFua3QVYoW0bZNFjRfGCNJ0zE98KKbNhFEatOs
         +17xvl446FG9dwxo3FS0zHNImjoTDc9jwul32Fu0IDLZKqzB1mMhgn/LLP/RTTd8hYmU
         /QNrusRHCdDH8fawvns1SgI5deM5hXqCdg7zsXwhoVFn/ynPpRU0MgVNNVkPmrkSCNlT
         /YxkfCeUmigUVetHYVOhs0v46Vs+B49DumofsgpLVR/3exdiD9mc0eUuvXlFPO1x6RI2
         73wIVIELC83SjUOsSIzvVKnIX8XVuR4V7aLJKpLfb+uj69Fqa0328YXt2b7Qe+cmlvnf
         7BSg==
X-Forwarded-Encrypted: i=1; AKwUvByoO0j2YQcswHP1OXmkBILojoglRrUENKCF9ctRnR3hlV/Xyfnj4MCQgjflCH43avszeGMMzh+CG6tqYZ4eON5J@lists.infradead.org
X-Gm-Message-State: AFuF++kILLxCNac13mInuBgu6waFiLPp/dGPyW2U/pNfMQpbbG77hf2t
	k0ANSnU1Qa9wTWgyKeh2JUCu/pZAmn34hT3rDtggvpfghjFHRYJORKebjvQQS2YyvBCYoZzbkpT
	zTOUTzWmJnLJTZLHOPxxJJ7DbaD8eVXs4WAkR0oP2zceh51hVOPTlL0wT+z7rEY/ZZf/FTZnDAZ
	qtme97gsWdVw==
X-Gm-Gg: AYBFou17++Xkc0SFihW/nsIgjhGn0gbC2Mr3G0c+FWoKT/bnjcI9dkwCGH+dpf69OPy
	bc2METDPTlMnT/w/UdEQBLXvnyRLbic3XFszoStvmIHOUf4VJvdE7fA5WvavcWs/aQzSANQedTX
	M5IjQfFl6AjK11XXxUykLfBGCDG4j2XvIv60c/WooRIDw+96G0Ppova3Gzlwit9LHdG6drqT5S9
	X2BJAqIz8g9DM1+gCTW+1iaCZq7LhrTV9L4iTnVZyp7wNnuvl3kaNyHwhnjHHXIX2FbQTPzBnHP
	xTrUgcJ97HoK8Y/JYHNCBMqf4jaOlU9kn4t5ZbRD1AucyWg7Wo4h+UhbQwgxicGioc1+VPg1kMt
	irlyiatfekpBX7DbthZSoT4ByscIwHBArUjsFPaSr4zVwqVKPeUB9Og==
X-Received: by 2002:a05:693c:621a:b0:33c:e61:e201 with SMTP id 5a478bee46e88-34002edee42mr4033411eec.22.1790290647509;
        Thu, 24 Sep 2026 15:57:27 -0700 (PDT)
X-Received: by 2002:a05:693c:621a:b0:33c:e61:e201 with SMTP id 5a478bee46e88-34002edee42mr4033386eec.22.1790290646954;
        Thu, 24 Sep 2026 15:57:26 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm2046484eec.14.2026.09.24.15.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:57:26 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:57:21 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev, Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH 07/16] efi/zboot: Lift efi_cache_sync_image() from
 efi_zboot_decompress()
Message-ID: <20260924155721.000016a9@oss.qualcomm.com>
In-Reply-To: <7-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<7-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CukZ-rqVScOUk1Hmx5v4bC4veZ0W20pa
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab5aad8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Ikd4Dj_1AAAA:8 a=gav0J8kFgDfseqtY68YA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfXx4fI4kzkwJSI
 yA1w8KGQtL9XlI+NQ7wSgtxtIxKKuSLGt8dV9Xa0EJV0BQ9SBgafAoGp/7zj3VPvJ7bDi0GzKsA
 tiyeF2QwVly7zK5M/wpk0J1qRQbEoK5mD23FrgY+5Qg0nA/DDkqJoO7wnJ+vmYif3ZmaL8+2Ais
 1z+awSCO2N+YPxFCxZIzvS5ddfsVDpKdsDQYboOvEJfNc4lUN7mhrTO43wvbZ/MIfD1AC+UujJl
 iKJh3UJlGObVhidXi88c14PQMaT5ay3UOYb22N5ZKbMR4QKgVi/ntrG2AFgzv+ZtlXrmE52nuLZ
 lqTypU1FKtXUizu9fq2tVusfTDuMUWaiCG/8BuUDZtxtKjB1llfPFrO1zqM9hbYJReIcmryjQkg
 Bfec6oEoBOGLL9oJiK3wG0w0RT+buDzNECUKxvykTTf0JVysW76WNeNAPZFMevYmoI+vne8selS
 M8Qku7ZIrzO9HnHmJ8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfX0zcLjYrYaqa3
 cswhkMnPTY1gmoDKfutY7/xUSFNC/Khq0UXsiP1WHGG/YULON0+7e1UOTZDzv2AY7W+qFz/qBC1
 A/RID5vlaF1i5++WQOXy4Dp04wcpfO4=
X-Proofpoint-ORIG-GUID: CukZ-rqVScOUk1Hmx5v4bC4veZ0W20pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_155729_734471_2E3D0C75 
X-CRM114-Status: GOOD (  17.87  )
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

On Thu, 24 Sep 2026 10:53:10 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> The two decompressors duplicate this call and the next patch needs to
> change the argument. Hoist it up to remove the duplication.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

> diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
> index 4b76f74c56dae0..960a542881d875 100644
> --- a/drivers/firmware/efi/libstub/zboot.c
> +++ b/drivers/firmware/efi/libstub/zboot.c
> @@ -92,9 +92,12 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
>  	}
>  
>  	// Decompress the payload into the newly allocated buffer
> -	status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
> -	         efi_stub_common(handle, image, image_base, cmdline_ptr);
> -
> +	status = efi_zboot_decompress((void *)image_base, alloc_size);
> +	if (status == EFI_SUCCESS) {
> +		efi_cache_sync_image(image_base, alloc_size);
> +		status =
> +			efi_stub_common(handle, image, image_base, cmdline_ptr);

Just go one character longer!

> +	}
>  	efi_free(alloc_size, image_base);
>  	return status;
>  }


