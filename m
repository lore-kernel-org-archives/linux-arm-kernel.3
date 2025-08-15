Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229BCCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPoqrG76Fa+IJ69XT6fD+NUhuJLanbuSb1J5gF7obvU=; b=JsaTfM32gRJSCxri5ng1Unxy66
	FdYygA99ZE009biaz3r68M3Me6igcmJ4yK9izTw3i5G69OD/X3vR968oXE5k5QgZiEzyOqAKiBV9+
	PWYKQjXtRvcMo4zHV8nt2iApS0Jj9t9zmXkS1bfDKYqvh90boCOzHRPuFW2b2gFJ5uOSypmvmyInm
	DU0NfSWHhFQ8fgG62q+KTpkyug1LTaLAv27+4djID1oMMZVXD9NWGZRA9tiFPBU3ZpF7YOu50A1wn
	87GX0zFtj5kWsRkC6jw2tmOqzN9SIMLhwWe/GbGNsFH3t6J1thdrYbegIYmgmvRtXv5Wp9OIBgGLi
	lEENyT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un2rt-00000003d96-3Mkx;
	Fri, 15 Aug 2025 22:25:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un2pG-00000003ctk-0ELy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 22:23:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIqsS017540
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 22:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPoqrG76Fa+IJ69XT6fD+NUhuJLanbuSb1J5gF7obvU=; b=bgjyUAi1oWHVp/Jx
	8+Tz+gwEf2MKAx+ZsTVEKOTKcqL/MUqWcbHpC7FH1+FfXTRSWAS3BTpEzo0xOmKj
	Z741Z0P6eAoFegyjXV28v9NMfIb89usjBV57HhgYAwRKiU9Qliw66EeKPQt5uzQf
	fi4amw34pK/R2X45JyFCnbe8i55Qk1dOWYauH4Nv4tTfZhS19RW6xpYCRVYJ0OyD
	z9nvvGdd2hxsxs3bt4lmC8dsYf8ZgHpOXsgBfm2wO0yZlHawC7IX0nJXxyNbVIv4
	LCsQUc5cH3gnkvwW6S0gQ7onmwnRMuoHgxrSj2D51jtWfMzZjdEm5uTrt0UfygvT
	/yMMig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxjgru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 22:23:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9289280dso50427626d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 15:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755296583; x=1755901383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPoqrG76Fa+IJ69XT6fD+NUhuJLanbuSb1J5gF7obvU=;
        b=HNS0UT1qWiiulLx8x1AUg/eSPRgd3BRkMItPErmzdlA+EtNhsgTi5Kb1cuPYVqkT3x
         dhfqwqLfQbyt6Tydswnk2G2sKsBFELhKbCOfxyW8oMqrkd4MNiQpMSpIGtdooFTqcYed
         jSU7vPuu7hT/Z59Cpt3wpRT7hbuN1ZtiK9nYf1rY7+Q3CrTrbJHviZCNZb7oA5i5w3zy
         0GSZmJ0vHuuo+va9qPjvNuJnBU2P7Vy7C8b0jrOvJdMnztsDpmSm2L0CVFCSI7LTZjeo
         mUlqO1vS0Y3/Y69uNm1wi08TeHGsnXJNuvQdBzrc1NjDLNQO1Ecyn3JZczRa1MOOOAUH
         VDnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwBnhyziJSNIvqy6sAdWSAd/2rTBCYHwhCIJq/VotCXHCmG3wcQxhjYwrxODhYb0tHPOkU+Nhej04zA0woAdwX@lists.infradead.org
X-Gm-Message-State: AOJu0YykdFvDmWPV3/agMrpcV1AeNefAhwBTMXyUocLcb/bIOZ08htsI
	WYdaN2+QBAb/TOj1IJ8k+zC7tSEaNa7DdD48AZ8/OUQzzCDeX0nQZ71rWYZeVT3D4ULcX9thE7T
	cuQFJ75BrHlaVW7pVknuGFDdmkpfKAM0PpmHJoF2BP9SJ2EGxItFnNBxVfOwe7U9VW8S/4S7DOb
	lZbw==
X-Gm-Gg: ASbGncuKv9D5hABVzS6winyxnsJ5HQxtkn6FVN3etSLKJApR1S2ZhjNDc/SqaqFIlAZ
	K1lDGjmYHFsJ2Xv1nWgvlItxZ5o66jdpIJt/x3rpNAQDl1yyw5JxRgSLqFxf/GuvUFvEJ+TRm9t
	uLA2rZZ+JsgKgZRYTzGWf+TQwINHpaEzPKSRnva6av9ZXbQNmcepEH38JFTqLQ5+zLiowvJR91T
	IcaAXWvN0nshYn58UUkMWBoDG1comZDeC0BMHjGcHGSecZncQwaNep8iGfyCH3Hgh9MEqw2qrix
	kgt7aY9y6gy/XgvFzLeXyd6sekgnJVdgrW2qRzT49B/ZUWRu4zoPqqTnTugraOL2EImNr3tuqm6
	zYlyDILyUQFdyLem+Eg==
X-Received: by 2002:ad4:5f0b:0:b0:707:71d9:d6de with SMTP id 6a1803df08f44-70ba7c3ad53mr53884286d6.36.1755296583159;
        Fri, 15 Aug 2025 15:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFleBuWAy5mTXP7RbCTDkEBzEH4bx4YRYK1jQyBfG2qlZcDy/NOHJR86cvYBPpQ4zK6w/3KsQ==
X-Received: by 2002:ad4:5f0b:0:b0:707:71d9:d6de with SMTP id 6a1803df08f44-70ba7c3ad53mr53883776d6.36.1755296582437;
        Fri, 15 Aug 2025 15:23:02 -0700 (PDT)
Received: from [10.178.110.229] (37-33-152-67.bb.dnainternet.fi. [37.33.152.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cc6c5sm510042e87.106.2025.08.15.15.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 15:23:01 -0700 (PDT)
Message-ID: <3d796f6c-d1d0-4499-8e63-bd37bfcc7c3a@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 01:23:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] phy: hdmi: Add HDMI 2.1 FRL configuration
 options
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
References: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
 <20250805-phy-hdptx-frl-v2-1-d118bd4b6e0b@collabora.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250805-phy-hdptx-frl-v2-1-d118bd4b6e0b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXwXfIEa5k81uk
 H8SRG98NZnHoVIjnOTpmkuQil7mfM7aGU0iYKbVf39cXv+DsNMVoV1dNcOPaNQ3CskrMrBoHo6a
 Xf1v6P7ueZ+eU/D5DpgqQaHUXqwWMfIHKmc+qt7hF1qkChPKedUJdPY8iL7GQsjegaDplv0Srs4
 MIaAuLxqeByAmmW4Zp3DW1sVAjU7sDI2aZk1lqeK0JVZ4R/CEDvhDR6nGrYb3ex0LBvmcnK1mMf
 b56cnV0ICGU/p1DwBDZACLryDgXIGE5k9DXRHZgtjrjgrCrQQHJSmvLuX47Iq8u+DVb7gwblrum
 f1q0Ydwf2NdCcM6a1nM5V6NPrFBoOuNUnAE42l+VhHdoPBQNZePLm0rPWBiICl9pYS5LRHrOUsI
 psxldm51
X-Proofpoint-GUID: 922DkkEUBuxNn_Jgn71DL2cSqzl0e35Y
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689fb348 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=bUxD0lY5qGftl71vRM2jGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=QX4gbG5DAAAA:8 a=Wdy89XEDvX1HR8FnkzIA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 922DkkEUBuxNn_Jgn71DL2cSqzl0e35Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_152306_209235_88A1AA7D 
X-CRM114-Status: GOOD (  23.54  )
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

On 05/08/2025 14:56, Cristian Ciocaltea wrote:
> Add support for configuring the Fixed Rate Link (FRL) mode for HDMI
> PHYs.
> 
> For improved clarity, also rename existing HDMI mode to HDMI_TMDS.
> Since this mode is currently not being used explicitly, no further
> changes are needed.


I'd say, this need some explanation, especially for those who don't have 
access to the HDMI standard. Please mention that FRL is an alternative 
to the traditional TMDS mode, etc.

> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   include/linux/phy/phy-hdmi.h | 14 ++++++++++++--
>   include/linux/phy/phy.h      |  3 ++-
>   2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> index f0ec963c6e84f1b7728acafc824dff191c6b873d..0b26472d8defcc9ded142d4283e29861dc2b3746 100644
> --- a/include/linux/phy/phy-hdmi.h
> +++ b/include/linux/phy/phy-hdmi.h
> @@ -6,16 +6,26 @@
>   #ifndef __PHY_HDMI_H_
>   #define __PHY_HDMI_H_
>   
> +#include <linux/types.h>
> +
>   /**
>    * struct phy_configure_opts_hdmi - HDMI configuration set
> - * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
>    * @bpc: Bits per color channel.
> + * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
> + * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.
> + * @frl.lanes: HDMI FRL lanes count.
>    *
>    * This structure is used to represent the configuration state of a HDMI phy.
>    */
>   struct phy_configure_opts_hdmi {
> -	unsigned long long tmds_char_rate;
>   	unsigned int bpc;
> +	union {
> +		unsigned long long tmds_char_rate;
> +		struct {
> +			u8 rate_per_lane;
> +			u8 lanes;
> +		} frl;
> +	};
>   };
>   
>   #endif /* __PHY_HDMI_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 13add0c2c40721fe9ca3f0350d13c035cd25af45..04c84c1dbd6dac55fd04c54203cff4f9d939d970 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -44,7 +44,8 @@ enum phy_mode {
>   	PHY_MODE_SATA,
>   	PHY_MODE_LVDS,
>   	PHY_MODE_DP,
> -	PHY_MODE_HDMI,
> +	PHY_MODE_HDMI_TMDS,
> +	PHY_MODE_HDMI_FRL,

I'd maybe suggest keeping PHY_MODE_HDMI and having two submodes: one for 
TMDS (default), one for FRL.

>   };
>   
>   enum phy_media {
> 


-- 
With best wishes
Dmitry

