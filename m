Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B13CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 00:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBbn273P8/f9yxcLk4nZc3A83z2zO0Iuz9NA/0alo3o=; b=QvoUEArISuo6u4hZJ/LEpjZnMx
	3NM07mqGZKJ33vJeMIqthTb0ph20TxerIeijf8FMYfvvJ2Ba7CYsK9UsqfpU9drhHP9EOxRxDtqeD
	BtnqeYS8CuPrJjpDskTIwW4i8LY9r/4EJS8+9/1qhXzGL8vEw2IEZaeniwmq6IZCwXYOqp2GQaVJq
	278Ufyg1c7FjLF8FYj/i7pGw290Pm+F271b4wnEXbM1diykFtIaea4IjsrUSuLIBHp209HX8HIAcL
	0UT3nauA+cyLVJ2uJgDh36ZVXYwD3VT6oLDJlPn1nciA6t548IFuKCysA/M22AtyOxfKZgc9V5yi6
	du+sgS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoAT5-000000091fU-0x9L;
	Tue, 19 Aug 2025 00:44:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoAQU-000000091PW-3aFQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 00:42:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IFEFnr014629
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBbn273P8/f9yxcLk4nZc3A83z2zO0Iuz9NA/0alo3o=; b=CVSLpQFIqL2ri/kW
	j3XH9eOVJXfBRJyXZv5o3bkzw/gumYdiq6/AyhS37XxIdOPTUWYjlfjVV7Cb8Rhe
	xQbrHHpqWGwzowE6684jOZ1WAwq26Prr/ojNpbaOMYIE9/Z9DlKBL94w7zBboOmY
	qG85j3YubU5x9rZOzd7z9MSo+yBwYEwOLqa8CwsxmNBbXKfhDLASmNbtE53jTnJX
	DEY8AAOXfEuLGvk5+Uz9NHkMogsDaohynyfcuBNGf15hnC7Rmemke+AxPfSlVXPA
	DfYhMyVkYrquUw2nhEE75BbwVF3T1Akgb5wK1UxUYCX4If+csARnnNJmcfkOqkKZ
	FV00Cw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh076n0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:42:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a94f3bbdbso100250836d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 17:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755564128; x=1756168928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBbn273P8/f9yxcLk4nZc3A83z2zO0Iuz9NA/0alo3o=;
        b=vjvZ03B5poCptzNiTbxc57Fa8j9IjhH0YH348j8hH1PbojXfjm0fmeMu5TfJ7gE0L2
         kXizBHWbfQ1riG7rffmOTcfreWYJWL/tuoqtTN5wzu14d8f0sbpDRMFi2ka2NwBt28bv
         lXcShmcdOLOsapx5FQQKJhQdPH7ru55cfkS7hoc8T2/y8pJP5ondM7gXkqn0mkhuSdRz
         FIodPzLmApsHuqFtrF6XIrgDm0/g6CGvRutPS3dzMhdOq3eAJgQ2793jQKy2/iMghI7k
         HHJvQkST4uuVc2OHOdiiKPoAlpL6GzTekrJmOMTmYLPtLc+JFy+HkDEGvkPhxlI9r0DG
         M8RA==
X-Forwarded-Encrypted: i=1; AJvYcCUTvcchXiWGr3bE2QPJ53zf6lGopzpptQN0cuS+ADCcei5pZKOYO5+gQWXXnorrZx3WhDURDPptCrSg6XHEUqMu@lists.infradead.org
X-Gm-Message-State: AOJu0YxbHlIv0TuvDZgQ1fNaJXby18U8wsmU/EhD2TCdmLoACooABs35
	5v3a+22/8xlfIoK8beUKXBQU6CXnb7QsH7YEzBXsbQvW90fBhqk+9XWdp8X/e7K063+gXCP/bU6
	eTuX0sRAX5yla2PtgvOj/PrfVE8elMX3Kq7u1ZacIsXkUJi2nuXAR8Y5QLnr4CCvc6xjE6HLX7d
	+vAA==
X-Gm-Gg: ASbGnct4IhmkG+Pw4kd1iH5RPNg1EShdmg54q3GSrfTkkRZ8vpGrP/MrVY+TqrMG6Hr
	5ZGg4ML0Q16pEml5tnIdSSIIP55PmLuM9uvnvzd8cnq5GTW2qQD1h8v93mY7XgwwnzWJMaByOZ8
	mLEz30+V81hTuzNxd2NCMy3iCRYtQRpBNDIyvXC4I/8gqsK3wQMKyGU2py0EAYwORkfAvhbMZoC
	3EPzS4XhYrvRpBzTyDamZRc8OJa8zc7kGKgN7elQEiWGPQa9KcU1t09zgdEEGydM+nZMrIsDBDP
	wKnT1+9aofZ2j+0X0xX9EW6+gzgFafE2OkeLathFJnkaAReijKCvGZ3a2My2s7wJKNagsq/8GJP
	E/4nmHFL497VY8CFBGhCcKohet9VN3K/eh2p8r4eX
X-Received: by 2002:a05:6214:e8b:b0:704:a0cd:f597 with SMTP id 6a1803df08f44-70c35b8b5a0mr9282126d6.21.1755564128313;
        Mon, 18 Aug 2025 17:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYUQOO9C5theUsgHuQ7WuHIc+c5d31s4BRQUPisTdCBR05/M1rf3y3WoAQasBUktoz06m8MA==
X-Received: by 2002:a05:6214:e8b:b0:704:a0cd:f597 with SMTP id 6a1803df08f44-70c35b8b5a0mr9281776d6.21.1755564127778;
        Mon, 18 Aug 2025 17:42:07 -0700 (PDT)
Received: from [192.168.10.39] (91-154-146-251.elisa-laajakaista.fi. [91.154.146.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351545sm1861560e87.21.2025.08.18.17.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 17:42:05 -0700 (PDT)
Message-ID: <3f857197-1cd1-4c18-88e9-e8c00d95af82@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 03:42:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] phy: hdmi: Add HDMI 2.1 FRL configuration
 options
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
References: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
 <20250818-phy-hdptx-frl-v3-1-c79997d8bb2b@collabora.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250818-phy-hdptx-frl-v3-1-c79997d8bb2b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AJLY8VSYfyb9z_IaQl3CTkM7XtsDtPVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX3hajwGhR21vj
 MnhovyiO81OzCZtdyIELhRVct4Y4S0/1wYyb1UVcSIrGaaiwoPgKflHMwbTLcVrHpX+b7c0tvPx
 cAswnqyLb4eccBFBwVRFDV1EhbezgrVYbCpUl88jBZoDL0P43Xa9Xq8WXTde/3OIoD6feTNPjXe
 0wvg+M8E9K1yFX1AOCNrKmc762CFhiNawGTIJ3vW8PKXBLNTUF/Bp7NfuAg8KcpuTjaezPBp2vG
 +NjQ9MjWG2UyNhBf3T32KMrWLCP5LJJ2hycLDjWwzn8olhXL6ig7HkMhx7f7sAWCsZvfvZD7LQk
 tZ7eTlxyb9P7N6ySUsTTg1gY1l4BvlU51hBjH2Psg5IFnpu24UB87NGTLEV1M/R4NDqKWK4eUBa
 yQ4OkrH1
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a3c861 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=CKk/IlMN6Gw3Dq31eR3Dfg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=QX4gbG5DAAAA:8 a=bbK825GtWpsu-Oi3XvwA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: AJLY8VSYfyb9z_IaQl3CTkM7XtsDtPVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_174211_018201_BA90F5A4 
X-CRM114-Status: GOOD (  28.28  )
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



On 18/08/2025 21:59, Cristian Ciocaltea wrote:
> The HDMI 2.1 specification introduced the Fixed Rate Link (FRL) mode,
> aiming to replace the older Transition-Minimized Differential Signaling
> (TMDS) mode used in previous HDMI versions to support much higher
> bandwidths (up to 48 Gbps) for modern video and audio formats.
> 
> FRL has been designed to support ultra high resolution formats at high
> refresh rates like 8K@60Hz or 4K@120Hz, and eliminates the need for
> dynamic bandwidth adjustments, which reduces latency.  It operates with
> 3 or 4 lanes at different link rates: 3Gbps, 6Gbps, 8Gbps, 10Gbps or
> 12Gbps.
> 
> Add support for configuring the FRL mode for HDMI PHYs.

Could you please point out corresponding DRM patches? They might be WIP 
or incomplete. I'd like to see how this works on the consumer side.

> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   include/linux/phy/phy-hdmi.h | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> index f0ec963c6e84f1b7728acafc824dff191c6b873d..83330d359e3ae345554f20429519da14506b8ab5 100644
> --- a/include/linux/phy/phy-hdmi.h
> +++ b/include/linux/phy/phy-hdmi.h
> @@ -6,16 +6,31 @@
>   #ifndef __PHY_HDMI_H_
>   #define __PHY_HDMI_H_
>   
> +#include <linux/types.h>
> +
> +enum phy_mode_hdmi {
> +	PHY_MODE_HDMI_TMDS,
> +	PHY_MODE_HDMI_FRL,

There is no unified approach for PHY submode names. Nevertheless I'd 
suggest something like PHY_HDMI_MODE_TMDS / _FRL. It follows more 
closely the networking / USB submodes. An alternative might be to use 
PHY_SUBMODE_HDMI_TMDS / _FRL.

But it's really a nit and/or bikeschedding.

> +};
> +
>   /**
>    * struct phy_configure_opts_hdmi - HDMI configuration set
> - * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
>    * @bpc: Bits per color channel.
> + * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
> + * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.

This works nicely until HDMI Forum adds an rate not being even Gbps. Is 
there a reason for not using ULL and bps following the tmds_char_rate 
design?

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
> 

-- 
With best wishes
Dmitry


