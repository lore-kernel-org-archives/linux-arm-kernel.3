Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC494C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26IKywfxXF+ovz3cISEJ2vKRNs4eRXW7AlvCnEjLpWg=; b=vqGhTx+l0v43/P/rtLxWsvz0dy
	n7dbMIfAg9Xt6JSD+A4KynEHKPxGM7p0dcnp8TbxB0u7Ldrkcsw+pLW6cVZVrDR533t1p2HrCwqLP
	3qCCcjIrgev1aOLZSq42TPN17LCw0R4oYu2sohm7zSaTf1ithmG41egt8wgPYfhyh2tEGtWRFKJZ8
	YHFYL+kKLs1K8+OGrhHM5DnVOhkRzW6rcLyEtRLFZrl3mtihV0l4ulg6RRHZ+foPtjzGAj98Rv5QE
	apdb3BArCnvuZwyy1Axmew42UE6anRHgirQKTO9LaU2V2CQPizfiZkdGc5TTzq8avu/y+bsPaUQRj
	eU0ZeIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sJn-0000000CKWV-1DXD;
	Thu, 24 Sep 2026 22:53:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sJY-0000000CKPy-22ZH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:53:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMOsE0280383
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	26IKywfxXF+ovz3cISEJ2vKRNs4eRXW7AlvCnEjLpWg=; b=ezYnMi7mMpeuODcw
	+WiLkeryjucsr3GUsliA6Q/qo9TCIvd1SSF+jrBzrQsbydlvqplcNShv16zQgQxI
	MZGRtlLbh1SH7v/AkrkJ4rsQTrubeuk55FyS3UYZA3e7Vb0jZYtOfaHJsc0CxZih
	etk7fMNAWWFGjHVbtpCZkh0C3smj0TUga8KPoHo0DhbMcC5s48nWQxTTlwwPM23X
	QjeAe/CIUE+1ffljI8bI50OGKNhfgBFjYbh7Tg1yB5i7NO5Vh63G1a/eoj//OtUr
	RfEUshvbHxlSjE1ljTH7HJPpxS/ad+gFcAm607wb7wN25GasXfj7gfZwpl42yLDA
	g5fLXw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce783b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:53:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so442427c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 15:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790290393; x=1790895193; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=26IKywfxXF+ovz3cISEJ2vKRNs4eRXW7AlvCnEjLpWg=;
        b=NNCz6faeJ12TntL+LaA0kLGk+lKgUHkKxRUf1Mj8SwiQ4aPGdyLJ9OvB9LmnrPVfhl
         XxJm9ruUErbOCpcBA537Tsm2bMVdAYyjXit+9poUy2i6CzneexiCIwxE748LQMK6UCyN
         BCf/LCchs6zpMaKT+QkHzz1qDJuvSxbpK0H4kXFDf+yl6B6KfpWQG9EAAfVh9AgSinne
         MiHLPEMtTvEJBFHXff9glzgrJ2Bs7R6pT+TDe6pTTVLyRbMe98eZwb460vBezU0CCc91
         F46RjwDPGNA+ZGRVExV/UjNvUCExaK0y0RTOZ0Q9KQx+PuqI/+d4235hoIfiweX0Bez4
         oiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290393; x=1790895193;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26IKywfxXF+ovz3cISEJ2vKRNs4eRXW7AlvCnEjLpWg=;
        b=aiYc+SgTjaOflY9yYI0G+fcVc16KMHeOFVsgbVuhRu4d+G4D9p6ME0owUcvW/lopzy
         B8BwzOvvGIcb8DGNnXZCZNHqmP4wmBDw1ug4k3pWL1bI3y/gtHAermtQAd6MtHaeLQcY
         Ou7s7CRCBXtfu8cUZsmbrvbeF1AJ9VCM1TKda8QrwQsoA31TUJrHZ5v4ZNyy7qJhWGmF
         qFdYKe1c+qNnp3/t0tjgWcNaZDVzpu2vqHKiZ9D6sSjZCD6XOoQs3ubpoGY/4jyY50IP
         0QQ0nzqaGYSupBDzAj3IrZPLHhpXpxTmkaMxlQa3Hkkw5BRqaIpHdjA3KfV4GZAhVULB
         8k8g==
X-Forwarded-Encrypted: i=1; AKwUvBzCshHNh6/F8u2w9BANLXIyfrAZpnFW0Adb5/Djyk5qCAOKlFJZWjtlBzFCHQsRsknUByDDmL13F/fnDgzBP5Mf@lists.infradead.org
X-Gm-Message-State: AFuF++kl/SFd3XM3tQ4LslVt7yxJNwlcpRNOV3xBz/0beAmdOcK/t1A6
	eJ9BVmVPpBADT+e+te8e0rNw8GBM+VVPy48FPadhg4RT/+H0Un1f1E+BcVu31pjsWaeQ1VajGcg
	YLJf2wehvVX4/s3d7J4Rc3ZLJLC56Epv/qQ1TpjEv7RPecFWAlJXOfIJx+IOq/7vXMQPWuPxesn
	sC6A==
X-Gm-Gg: AYBFou0upOOuYbGWXaMG4vYE6mAn/IilAxAxzzXcXCR3R+1+sH+0XoU2Zt4umHxis45
	yfT31bdfgR3K1thQnL88AKtCf/TMl6oVP9FBVawMT4cdgMT22hXtLvC7ZxAv0wEsLpc88YH1Axd
	SwWcHCdOgOd0kp8rs+cG42YxaPz3LfCeYLxGwzxy5OxNnmwKRXX+A50QrQglMHzpXjQqo0isx+i
	KOse7fRR3k0Vz/wVimzUC1ep7TXP7gBGp2fTRwKm4mDbaaV7+SOy/sCp4vJRyusrWyNAfAgREeP
	D0WZyuA+vyVyeB1zDoIAfqThNYPk72/XJsJarsiTT5n6YhQ0T6SDeQzdKUjGSr9ml48F4oUrvkO
	EBqxPPPss1hhA/0ZrHg1hpuXJ+AODv5P6nB5WvdVdkeHO3ulfQzqJFg==
X-Received: by 2002:a05:701b:204f:20b0:13b:3132:6e99 with SMTP id a92af1059eb24-14503f966ecmr3398033c88.20.1790290393072;
        Thu, 24 Sep 2026 15:53:13 -0700 (PDT)
X-Received: by 2002:a05:701b:204f:20b0:13b:3132:6e99 with SMTP id a92af1059eb24-14503f966ecmr3398015c88.20.1790290392489;
        Thu, 24 Sep 2026 15:53:12 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm1524306c88.12.2026.09.24.15.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:53:12 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:53:07 -0700
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
 Shuai <songshuaishuai@tinylab.org>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH 04/16] vmlinux.lds: Move DATA_LE32() from arm64 to the
 common linker script
Message-ID: <20260924155307.00007dfc@oss.qualcomm.com>
In-Reply-To: <4-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<4-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zCkHtafRR_M-7uP1JpnqQET4v46KFHX6
X-Proofpoint-ORIG-GUID: zCkHtafRR_M-7uP1JpnqQET4v46KFHX6
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab5a9d9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=Qd5iYfxjV735tpeAhwAA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfX17Pb1T9ArxoC
 jFIjXw7V0smRt+5F8oZ0PKs8yW2so6EePBiFIirYOp7/8b8AdZkRJKPuPHBdK9arQcmnfxM7TfR
 KKx/NgUAE7LxmC0SslOeaIAII5fd78vY6xlNzbM75f8YFEwIzD1XXlHTmq2UIjAHJaTK9xKDSUf
 RFcBCw4ax8Iclt7cR4YWfsupiDfjAo2RpFOKPrHJX4S/ynROwVCJ4jsZAQ8XVnORjxITBlgU/AU
 WVea5+9FshFcKzLJ/zGciK9gTijeVe++kmMnMzKebpX9lfFTQl6rQo4O6JMPw74KyD7l4+kIyKU
 mM69qZm4sdf53RjdFJgyFe5QM/g/g3XGnqZoggphuGoD5qJ7EHw1j25S/0vp8bPmDXYiCbgyHid
 gXmyRmqeFCwV9k5dkRzYdKo5Kd1hpraw/CtXVU+WxUoYNwLJPumvQG/cv+ekpYnWHbBmP7hsTWf
 ydEqj5O80dH/Ov49/mA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfXx5ZQHNoyr1Sw
 t64GIaLZdQ0KdLJDs07msIHuM5N9X2S3dBCb7ABG4DU0cANPBjcAWrPlftIoXHfWnRFzHdAPdjV
 +bUXGxwpeZ8YekERHxy0qIjWj/GVWik=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_155316_525993_841E5C8D 
X-CRM114-Status: GOOD (  25.86  )
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

On Thu, 24 Sep 2026 10:53:07 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Other arches may want to use this to get consistent fixed endian output.

You will have to grab it quickly!
https://lore.kernel.org/all/20260918145217.1669-10-will@kernel.org/#Z31arch:arm64:kernel:image.h
drops that definition as part of ripping out arm64 big endian support.

+CC Will for awareness.

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/arm64/kernel/image.h         | 14 --------------
>  include/asm-generic/vmlinux.lds.h | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
> index 7bc3ba89790191..1bff6b061b6cab 100644
> --- a/arch/arm64/kernel/image.h
> +++ b/arch/arm64/kernel/image.h
> @@ -14,26 +14,12 @@
>  #include <asm/image.h>
>  
>  /*
> - * There aren't any ELF relocations we can use to endian-swap values known only
> - * at link time (e.g. the subtraction of two symbol addresses), so we must get
> - * the linker to endian-swap certain values before emitting them.
> - *
>   * Note that, in order for this to work when building the ELF64 PIE executable
>   * (for KASLR), these values should not be referenced via R_AARCH64_ABS64
>   * relocations, since these are fixed up at runtime rather than at build time
>   * when PIE is in effect. So we need to split them up in 32-bit high and low
>   * words.
>   */
> -#ifdef CONFIG_CPU_BIG_ENDIAN
> -#define DATA_LE32(data)				\
> -	((((data) & 0x000000ff) << 24) |	\
> -	 (((data) & 0x0000ff00) << 8)  |	\
> -	 (((data) & 0x00ff0000) >> 8)  |	\
> -	 (((data) & 0xff000000) >> 24))
> -#else
> -#define DATA_LE32(data) ((data) & 0xffffffff)
> -#endif
> -
>  #define DEFINE_IMAGE_LE64(sym, data)				\
>  	sym##_lo32 = DATA_LE32((data) & 0xffffffff);		\
>  	sym##_hi32 = DATA_LE32((data) >> 32)
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index b2988aa12f6645..1786a8e4323b9f 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -56,6 +56,21 @@
>  #define LOAD_OFFSET 0
>  #endif
>  
> +/*
> + * There aren't any ELF relocations we can use to endian-swap values known only
> + * at link time (e.g. the subtraction of two symbol addresses), so we must get
> + * the linker to endian-swap certain values before emitting them.
> + */
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +#define DATA_LE32(data)				\
> +	((((data) & 0x000000ff) << 24) |	\
> +	 (((data) & 0x0000ff00) << 8)  |	\
> +	 (((data) & 0x00ff0000) >> 8)  |	\
> +	 (((data) & 0xff000000) >> 24))
> +#else
> +#define DATA_LE32(data) ((data) & 0xffffffff)
> +#endif
> +
>  /*
>   * Only some architectures want to have the .notes segment visible in
>   * a separate PT_NOTE ELF Program Header. When this happens, it needs


