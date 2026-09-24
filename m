Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B95C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oo8YGRfyp+kAVxf53tgrQWeKF/gkFQ1vpq3RnEKr7OY=; b=2L/zE7XcE+k6Cjx3Hmpjsbvqhd
	iAetj5WzeHVQcbhAn/p3IbxoDO1h+9JuY7i5wusg31FN6TAtofzNj7y+KzXa3xZG6bhdUJA6hLo0V
	Y5uQMjWzsLOuvFpngurHX8YtN4Y80BUDsnZ9dbBiKsxK9tI1nzTssXWdjrOumx3l8Pluuy3hW3inh
	FMPNn+NyMjh64htFoGZOsul4u6fWsp1iphVJBtlSjD6i0pe9pA3OIlZTAd44L24WEdYCwGhyVG0zj
	6ec8ZV3vWQqIQ1S9uxxf7a5cRNTt+cwgVTZzqOZlPagKMfJF5cEDN7PWr9+Ez5Bj/lGS7EnahuFP/
	MOASS/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sFb-0000000CK3p-1bLk;
	Thu, 24 Sep 2026 22:49:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sFY-0000000CK2i-0v0r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:49:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMOo8Z2969294
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oo8YGRfyp+kAVxf53tgrQWeKF/gkFQ1vpq3RnEKr7OY=; b=UnwyqbzYYs+KvHQI
	pdaCx1jtw5ZY0g35b3TDHY1cZfUiyOOybRzb2dGrJpMmxlONRNVSQrHCIK6+AoC7
	QnvuyVkfsbutTtg/yDMfBQUkcTg+g9F3yaain8P0Plp1XMrZxMEFtivmZwU0CQSe
	ofHBo1aKp2Fj7gieTJXChc0guhXjz78g5/YQm8yV6jdF4DVlAjn/ZKGezuK1U1zf
	EgGFGjtO6diq8oxU1+jfEQZtkOeEUAA1QQjM+IUboDFRrPF9yqUpJATk3M3VjNOY
	A8FRKURil3a5aaVAiLtj8asDhAlxSaEDtDqf0iqQI5xndVjM8Dveu39DfcoA+QTX
	4xyL3w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e1srr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:49:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso410317eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 15:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790290147; x=1790894947; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oo8YGRfyp+kAVxf53tgrQWeKF/gkFQ1vpq3RnEKr7OY=;
        b=gU5SJssJjBfDbKzDAp6xdv+PTb8nQFKiBPIOWNbEA+hp0Tk5ILehPAbvCmZ2+M+mCR
         nAR1rBS+w7VXzZbAJK5t1a0NK8fA/UkDG+h169kTDRMA8p0OaM+4nAbweM9ZiP56717T
         4EZun8ZxJRO1IIgYJoRKxJVlZrY2xFHflIhLtGUF6Oq+hFSaHjnt+xgdTrMLRcah3oif
         rJHoPcC3ys2peLys0fjMd9cOtnGsVmE6dRfEmMt6AxGZmPOMVQ3ycCjFCpcj9+KcdzJr
         HsFFYQFEVxQaOUkH8SsR4YPfpU7SaJqZDNe9yhf9cmxZmK1/mQa4LnavvpU64EvVWKxt
         b1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290147; x=1790894947;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oo8YGRfyp+kAVxf53tgrQWeKF/gkFQ1vpq3RnEKr7OY=;
        b=JFe53fqXiSvXe3LTo+jxOlJGpXUwSH/OYYPWqLtrN/MG+2LNoTQ3r0ab6FUMRMNDpF
         qNON4ltKpn8VNVI6k3NDcgm2ScwhXqiBwHxVBC1fikaD+JqoZyH3oghgIE+RTyo7XB/K
         /lZgBmcjRr2mJp0BxmxBlUxoUeVigerPXdjZ9V4sYmuGspTlOg9Hwp96FU5RDIfGPa9l
         hij747WTKVvoa96+CKLv4khv/XJPCHBVGG8SHMvQk51pHeLXI4gXVgP4ZC9iBI1UgXjt
         PKu9AhH2uSqBXAhGaK2HdehIQv0COArhMjQXODFI0vlVgA8jXYjPfL06Tk5WiEzgSEZL
         lKJw==
X-Forwarded-Encrypted: i=1; AKwUvBxvXb8QBBlRG64asybc7ztBpluxINXvJp16G7hDORqxLc/TeaaZ4n/8Bw0FO+mj4yyrz9b68ZTLnLX07B2LzZtX@lists.infradead.org
X-Gm-Message-State: AFuF++klnIpOOm0Xzfaps1cuTVPjbRmrHYN9yLsHly2Pv5a1ejaCEg1g
	qNSBPRRMlsi/mHH0/dOFWVRMdKFu71VRNTAqOiOu1gMI8vF1Zwzl8FvIZ/I3A+nuM3j6JN1kSGx
	j6IIVzloQKuXacqwwLTb/zJYjb3G2l0X+jBKnJBWOt1YjxaDJyiWI0fpdogrlvFTPqDcWkRedqz
	QjZw==
X-Gm-Gg: AYBFou3RgNE8sxsqWCDt99zB7em6mcQuez64obtUyijNEnFmF1ErORF6FQw3Q+MK9+R
	QDt3DvSABkBjHEN4QhJ/KJUd620xNSiX7ngrwZJjajoi3SgtEe9fFVA3MyO0rZ7AJaoWCB7PTiy
	YgIqphqMxaE3UgKYiWu9gwO/p7WNkDXC4MrLSOxSkBgGldv2xjbLX8qRpWiqJVH92ua+VDp59e+
	2b6O7sgNIBvZZdZyfcYqK4GJqZ1A8eS/zhUp4kAG4qlPN7SDO75uiSXBhO3+7slsNvMhB3u2umT
	9L8C8H5tFMlHWOP2Z5bLzRwulU9pcBLSiBBSXVLoVtVxDLI54benUbmC61/SjTo+HHTGYF3GUtm
	ra3D2PbO0+W2XhJ5/iHIxdOZHSg0xZgR2+NfRLT8TOLnlVnJ1LZqqxw==
X-Received: by 2002:a05:7301:8614:b0:33b:dcbc:6046 with SMTP id 5a478bee46e88-33ffe341a5fmr3054547eec.7.1790290146789;
        Thu, 24 Sep 2026 15:49:06 -0700 (PDT)
X-Received: by 2002:a05:7301:8614:b0:33b:dcbc:6046 with SMTP id 5a478bee46e88-33ffe341a5fmr3054509eec.7.1790290146115;
        Thu, 24 Sep 2026 15:49:06 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407d18fsm1417100eec.10.2026.09.24.15.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:49:05 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:49:02 -0700
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
Subject: Re: [PATCH 03/16] efi/libstub: Free cmdline_ptr in efi_pe_entry
Message-ID: <20260924154902.0000528b@oss.qualcomm.com>
In-Reply-To: <3-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<3-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfX5bMc7lFs34/6
 4/Z3afVWAofj0u1FwYXZTEvuPp1Oy+rHdMUbahNomVFm11pzKA4fPMyyQ20uotVa/2J0ZJwL0ZE
 e0BEBYA+Cm/iEJyCKE0fDd4rWwpYdgYs3JgDsCBqdRhAxCJvakd8EtquVY49CXqPRYoIbWcRdsq
 PnWQeD0hdrO1NpKFaKUglRz0xwKoj3sQJU3v7W8VIUAaUhtUDBaGfQ/UV6L5VCJ54sneKfvjgOO
 RhpbpNfdb7IkaNBNdIV0zapkLp+TH5X2IJmry7FDTPDLMMVopb3MiRDr2+20har33UyePDBAoDA
 /CvqUvHr3+6mz149mWpZfoLpXWrENoLiKilvVaImcP43wCLMPg7eoRgGskPp8THmNUj1dpz4+2v
 PaBsrm7fTtsREDKUaJC5b2+Kf0LuL6O7drI9ms669Y8vNZvfJz48RgGwBidYv+53iyLj9SpMw/+
 apazlKB1gtunSf1Xvcg==
X-Proofpoint-GUID: Y2JC5m_AAAzpmuyZn0RGEwO1B0pyz6su
X-Proofpoint-ORIG-GUID: Y2JC5m_AAAzpmuyZn0RGEwO1B0pyz6su
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab5a8e3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ikd4Dj_1AAAA:8 a=xhtQj0KKqAk-GveBB2QA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfX8YMnQjKDXE0J
 1g9DakknbJGYmN4T3pkFZiltEyRsUj/zIUGyjM/Y1qczvDLpLm1A1hdY4D0STGLMwtCJqM2sclZ
 chJ/2VHi4r+CRG0Lxtq5GrjCTlkF2Ps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_154908_275848_F0A1AAB9 
X-CRM114-Status: GOOD (  21.73  )
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

On Thu, 24 Sep 2026 10:53:06 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Sashiko points out that efi_handle_cmdline() allocates this memory and
> hands it over to the caller. If efi_pe_entry() ever returns it should be
> freed. Add a __free annotation.
> 
> Fixes: 42c8ea3dca09 ("efi: libstub: Factor out EFI stub entrypoint into separate file")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/firmware/efi/libstub/efi-stub-entry.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
> index aa85e910fe595e..83fade2b0d3b84 100644
> --- a/drivers/firmware/efi/libstub/efi-stub-entry.c
> +++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
> @@ -40,7 +40,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>  	unsigned long image_addr;
>  	unsigned long image_size = 0;
>  	/* addr/point and size pairs for memory management*/
> -	char *cmdline_ptr = NULL;
> +	char *cmdline_ptr __free(efi_pool) = NULL;

Can we move this down to just above the call to efi_handle_cmdline that
does the constructor side of this?

I see none of the efi stuff follow those guidance note that went in cleanup.h.

Ah well, not my problem :)

J

>  	efi_guid_t loaded_image_proto = LOADED_IMAGE_PROTOCOL_GUID;
>  	unsigned long reserve_addr = 0;
>  	unsigned long reserve_size = 0;


