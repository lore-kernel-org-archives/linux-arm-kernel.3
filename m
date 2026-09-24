Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159E0C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81QaywXThCj9GvWcrqbFC8hrrggxf6pFQEEvB0A8Stc=; b=2JIrdsIWTCTDRQMdGE1cQWMpvu
	8JokFpC53IfuF+Q85qLV0hR6+bj7gWygv5WLiEvIivJH5HBqqrcg/B/C3EZivXQdPmSePB+4DfQ79
	SK5kInes3RY4P5Mv63iXpmbbZfMKQ0h4vRffKEy/osMklpdahrMCsi0F4TOtFUkNczbkjbijoRLo5
	npueaTkAX4T45LUCXOLb88iIIbL4+A5hxtV9XeJFWXHyUXkMgKwQuyKdZPDjHbBlchhF+d1rkeiJs
	opvA35ZI5mRpqHsfvLJ+I2xGq61utIx8CqtTxTNH4OqJiPbk+KSDK8D5iJLq+Rxk59rKI9VCCzWvz
	5NhxSV0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9s9Q-0000000CJ9D-0YEf;
	Thu, 24 Sep 2026 22:42:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9s9O-0000000CJ8C-1IVw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:42:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMOp5F2766701
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81QaywXThCj9GvWcrqbFC8hrrggxf6pFQEEvB0A8Stc=; b=eaJiYBcoVJ7qevSl
	dhfq+tXf9Yrht/mLq/jwiRTObIgOPPAp4gq7bt1mDqjTW0V6kXIW+8178jTvvqEY
	/g72Tu5uLFr9TmxDOZ/WTOw4Db3jptMoLUpu03x0RYDq28zhhqtQH8+V6kNLVLAO
	1Ua+MyDrNoK2wgREaJE/EZogzihYwOq1s6HaLVkWSmzeuJh3HKsCfCtwvHP6+Jd8
	ENol9vchyHUhmq3K8SCqt3P2t3zGBv8XLggSyAt3yjEQk8zBoVPz6YK9sKvOoTjx
	qeijDJMaDaBEWWHG3mt12b/Lo717uv1T508Ea2fRW/yjOhQsk+HBOm2Y6914Juvl
	Prcy/g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94k8tn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:42:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33310847fcaso426251eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 15:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790289765; x=1790894565; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=81QaywXThCj9GvWcrqbFC8hrrggxf6pFQEEvB0A8Stc=;
        b=f3G0RbYEV70ZrJHc4+RVFWzrOlUoIYB1RoC2ozI+eRNFux01Kt1PubPvpzK0Qh5iM4
         3Nduo7f2uN+QQa4qjffp2emYP+Rvghc/G1PapLU3DpkQu8vG/Uf9RC8Xk6bxCc7qeHHb
         sz+3DwFK39CJMvtcHe+4wXcFylnMYuU2lCkLoQ7y/Ji056OqujvceBn0hTyum0E/X+QX
         DPuNUsTRLDMIW9fDWpY63bOmv4ru3oI7uolM4PWehSGrG+oz4GOyv7z/m2QikzwCNMyJ
         Zsf816dl+dkIUtLSKzyZvyxfkZUEcDdayjjZXW08ozfOgDLteWY4GWdMuZC6cbA/vHi1
         mC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289765; x=1790894565;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81QaywXThCj9GvWcrqbFC8hrrggxf6pFQEEvB0A8Stc=;
        b=May5wOOaf6pr/lq3QZfqDZqLCk1oFFvChM3miOr8EqpATUx+iMVP1RDygTrQDE1A+p
         8A5AQ0lu225E2WU+g4DTWCLgnvBvnHhKxzCA12SfTB0Xe1N/CKa44aol/l818Ecq7Y/G
         nXCvcZ4UTJBS+mdPtaHKWNa5UW4D5XE9wBD1wZVFYm8RSznBtGPsyAdixLDfolNY304B
         TxyPOJZGcPFOkjAqKxJsF8heAvtP5gFR4wA7uQ5/k6FbFx68ujB+rNTr5EQbwE+kvdKY
         PPI/CPJM25M5EavsosmrwrFwkUgRftXVkkNAQd9U6PCqfGBsfQD6L/UZM+1IvCMqlEAi
         GUOA==
X-Forwarded-Encrypted: i=1; AKwUvBz9KEvyhBOozlYJQl1BDn8jtmUiuXCZ/DCgnleq1UzYJzsAPgEDAL8mtJSuu+DbqOKbwFl4+wy4wbhgN/K1FlMQ@lists.infradead.org
X-Gm-Message-State: AFuF++kUN7ADy7gTrL3czjyhVRCx8xRI00XpdJscf2RNfqmqfGlQ8Za9
	DtJcroSkfvc5pTrMiGyFQ/ozQWNN8M4/2DWau+fShHH/9h62C2CE5oUoW7K3GFNQYsxHTJldTRx
	yiRRWNHXaF7DS5f5Z5Ai8S4DPXJLWx7cp3B5f0/ReYaa71DkIW9ywAX08z4Am9syCejwAJDjOpr
	Z8gg==
X-Gm-Gg: AYBFou0yLKNzeR5t+TDzy0lvt6JqweeSDRfWeqb5AZ56UWkv3sROdJ0v8gDprUn2UQN
	PdIF49Uta3NcAlaigFMDyj+CQ++2Om6v3bv+8RwY0A8RF8lPtEz7Dakp21ltLdjDniBeL4EPU0Y
	WEw1TbdYbLHnD6yz+OjYaxc44MXr2jGHgKfQvgM9IM8kY4Xeo9qwduwO97axC2aYszJk7W7wxqZ
	/IYmBtzDLmYie+Cb5A6r+80fsW1j71OZhC1UYseSnlO7Bg8ruVlIOykGXXweaz7yXZMxO+6tJpD
	Gpgex/t4HB1TdKNxlsro4rVd/d+ZiJ3Zdu81dt4nGeig3EI6gfWub0w0jamf5M/S6EU7R9PRK00
	OeDCQl+kXN2HPp5Q+HOEduqEF+B4TWC/Tn0iV5WEoiv/7L+9HIrwtxQ==
X-Received: by 2002:a05:693c:601c:b0:341:4f3:8f84 with SMTP id 5a478bee46e88-341973cf3cfmr121083eec.13.1790289760124;
        Thu, 24 Sep 2026 15:42:40 -0700 (PDT)
X-Received: by 2002:a05:693c:601c:b0:341:4f3:8f84 with SMTP id 5a478bee46e88-341973cf3cfmr120917eec.13.1790289752160;
        Thu, 24 Sep 2026 15:42:32 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm1538764eec.25.2026.09.24.15.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:42:31 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:42:27 -0700
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
Subject: Re: [PATCH 01/16] efi/libstub: Fix error unwind freeing fdt in
 allocate_new_fdt_and_exit_boot()
Message-ID: <20260924154227.00001cbe@oss.qualcomm.com>
In-Reply-To: <1-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<1-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab5a765 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=7U2iMG9xLqzP7ZOKqLsA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: UEEZAa7Qhmb9d2p2pYVeE__NkzsCjzu-
X-Proofpoint-ORIG-GUID: UEEZAa7Qhmb9d2p2pYVeE__NkzsCjzu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MiBTYWx0ZWRfX/Za8bfRjJIGl
 YUb7HZ5NhtC+fHlKeAEgjdE3ODpo064JFyb/8XOmPafl1O1/yVrrpBhHTKhMDjkXdU8JaPW4ZcM
 bs7YFQ3jA6ATA3op4m/en7WJq1pRuZuHj4TSeNC4UukktBVL2kUmEuH1axqctIKZ9LByvzAWX0z
 ZpIr9H0vPbHf9MG/GRq9Lt2L6MPJbNZGiKY0DUwSlrPqbzoscJapguGbm8Ile1vztDc9aUukLuS
 k0zrq8OkrxJQ1CAgDnCTZA6N5rAk1gNltTmJmQSQXCi0B20lp2XcwL6jFpSaryXYS+M6nu8rpYi
 nk3KhK31kszm4FftfEdCv8/lbHk/Wa4F24nMSrggTWj+SpI0O00f5aiueRyrrWfXbBtRdUMmdmu
 U6h7vI9aBy+K22IUjPj/wq8tzYBXSkukow+6fZVsSeKZZkyoARGsEk/wNOrLz6mv+S5O+pqwYC0
 zXGMwG6cu5b1Rmx15/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MiBTYWx0ZWRfXyxaUqvum7aFw
 sfk02Y3jEU67TKhb9kMPfo0lUJ1moENHSC5b0JBuifNGIX97OQ7BDUGEAmhVMMgRbRqomw4usNg
 KRr41lVaOS7kkAyoB1JyfNjEHWTSSRY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_154246_351697_10C61A5D 
X-CRM114-Status: GOOD (  26.23  )
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

On Thu, 24 Sep 2026 10:53:04 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Sashiko says fdt_addr can point to either an allocated fdt or the fdt from
> get_fdt() which is memory owned by FW.
> 
> Only the allocated fdt should be freed on the error unwind path. Use a
> dedicated variable for the allocation's size so that the free does not get
> confused.
> 
> Fixes: 4fc8e738ff3e ("efi: libstub: remove DT dependency from generic stub")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/firmware/efi/libstub/fdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
> index 23b3543d3041b0..5b2dd709d7b151 100644
> --- a/drivers/firmware/efi/libstub/fdt.c
> +++ b/drivers/firmware/efi/libstub/fdt.c
> @@ -229,6 +229,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>  	u32 desc_ver;
>  	efi_status_t status;
>  	struct exit_boot_struct priv;
> +	unsigned long fdt_size_allocated = 0;
>  	unsigned long fdt_addr = 0;
>  	unsigned long fdt_size = 0;
>  
> @@ -257,6 +258,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>  			efi_err("Failed to load device tree!\n");
>  			goto fail;
>  		}
> +		fdt_size_allocated = fdt_size;
Hmm. I argued with myself for a while on this.  Which one of fdt_size and fdt_size_allocate
is the appropriate one to pass to the call?  In the end I didn't get a good answer so
oh I guess this is as good as the other way around.

Bug looks real to me and this fixes it I think. Give I know this code very little
take this tag with a pinch of salt.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

>  	}
>  
>  	if (fdt_addr) {
> @@ -334,7 +336,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>  	efi_free(MAX_FDT_SIZE, *new_fdt_addr);
>  
>  fail:
> -	efi_free(fdt_size, fdt_addr);
> +	efi_free(fdt_size_allocated, fdt_addr);
>  	if (!efi_novamap)
>  		efi_bs_call(free_pool, priv.runtime_map);
>  


