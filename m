Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512D0C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qjLbtTDhsHiX99dZ4U9zPc7b9TIIVkqC+Y1oTNhL7I=; b=GDhtfufIuldj3PS00Xz8wmwoSh
	rERIJOR+/mybEkP2YqyY8rEnXUAaj0dSxS05Ha6MyOcyL+dkxU2Q2ROEuFqd7vgPlgIjRXXXmzF59
	ZZwGUDO4jekexExWgt8nFLEyxMc8r4Za+TZ7pUVV0oEqJh084bzARp03tBypoXFL0PJD8M4ZvZp+z
	4A95rhH1tquk74OPPl5NA8F33NcL23CNtblC0AJzL5hOTu5dQHoBjBydDXx6J8Z8i/09nk9GaKa5G
	Z1irPpo18F1xq3KW/UhkbWoLcHvuNx4LeK5JUW1nFgKwdp9kChdKvpBODzOA9F5mbnWXoEd8Zq7Dq
	IiilzkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fvw-00000007DQL-0Jat;
	Wed, 23 Sep 2026 05:54:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fvs-00000007DOp-3lnj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:54:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iRxk2247656
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qjLbtTDhsHiX99dZ4U9zPc7b9TIIVkqC+Y1oTNhL7I=; b=gs6N7DBdlGDdnTzF
	J6NVzxTVIPUy88VXKo6EAbYiC6noCrTNvdM9E6DNFHc5S9bGvWyddl1rXMpRvaLp
	TfUF9IEVfo2WBmS0BqHPpWOMSoEbBDuD0Om94aunEBQ91h/9c/hAAEESrH140Dj/
	j45sKoMQp2hN76zSYykEeSw8QwB73dsLO+0z32CCBTbmCBKz169T6o4RGNn2opy8
	+CW2A3Z8iWUn5SZrrdWCX9bT38Qr5FhRGUA9QNrFF1tNAhjD/EtOv2iUVYynfh6q
	Tgr2G2Z40PIUPRYCKi0FIFdQU/hnUuEHuIsugjlPpgpFA56O1gWHQ9AZk9QqVNXa
	oNnpTw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw29pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:54:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33bb08e80a8so552846eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790142855; x=1790747655; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qjLbtTDhsHiX99dZ4U9zPc7b9TIIVkqC+Y1oTNhL7I=;
        b=aqdONwryQKi12i4m1K7lxPtTySANUMnDu6wiucgXmNKUQgvKziRRz7jFmh9kYimnBT
         dSbB3Wb7KpzziJA2ZVi91LgWAoJuPajv5g+5CmBmUWI4RqfHNSPX7JxG13G6k52B/SuB
         41QZD4qATId6csgeqx4y+1EPybz79p6bSzhPBotNFyyYNG66WORNMDQ610fSvtWlLhJ7
         pjgLg9dtXUH+PcT0utxageRxLfQWNI4yhrZgswyAH2oc2wCTFGT+UuTBNfaEjs3gnZ/2
         abJzXbU6p9gXFEYZScs0MJEGLUtoEIuGSyWPrIJqf8btRe001j/QZYHc1tKEW4KPafWH
         truw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142855; x=1790747655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qjLbtTDhsHiX99dZ4U9zPc7b9TIIVkqC+Y1oTNhL7I=;
        b=a3fAn1rxpJj2wuWWT90Z+4dnOfMr/NqNqXSYUsWTdXVv8i7zOhutQlVcHnatcldlwZ
         2S+xrxtQNRuCw76xDMfvqvSiC2TzWooEw8WQSDggzq5aU8owCAI2hKGvWKN/GtLbns/x
         ZEKCbysvO5Thheg79Rnidq2B3UltkdHhinFEKbQ2jl3721GW9WFSnRwsIRyy7WvFxZML
         1zJM+rYXgBz1JOaIoll+BkehxtRaOKeCKYJR4dmNM9h64HTXjEA3SwtsUzsZFmPmXMEB
         WrcQX+NjbFokp/2N7Dej+YycQmEdA9gGkmWmXyBG5hjNjgPwtMmSa38LbNnF7Sbdmlap
         RQQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIEFxMeCc3WGq6cPwU9MeUnkZPoEPtQX3uCNJG7Phug7A4QddDD1UGUCDNJCbJTwnRD6y1uuZdVpI2YyBs16SL@lists.infradead.org
X-Gm-Message-State: AFuF++mK/DDJ8yVupBOHwIKPHhrUhsmD/VCSTvYI0OYonJmmSz//hYJJ
	wQ2lpDRfy7BFvuyKT5Hd0QZA3ZS4g/14lN5Tw5uuWA8ZdPDsa+M2GXrtq6PjzKuhZdNEFMSCwh/
	k/BPPVv5M9gTRR1K2UiYxtoScn+6uH6OqJiIETYCJgXCWo6+fIaLUCHYHcuKCtHnHjq6Y8G+z3z
	u2BA==
X-Gm-Gg: AYBFou19IPoihlS5MrzJIbgjRqf9jQCXwaBkW7JRHntyKDQ3Nc/2v0VvxFZWFKk3kTX
	Ngq0byI5y5vF9i2e8Wg+KMXdqbNuT9uatrkD8LIHUtuTwEf238F7JBwEgjMr2HEMZU01z7mMKWZ
	hT1V9KKRJ+R1dC0w7F6IxGfRU0iY8PUGUl3Hg4ToAHXcGJVw5ihMoy+ZTn9HY44RqpEBlN4jWoh
	cyfd9pxHMPBmZjlyoXNWZzmgWQHBLqVaRR9igvMKw1plKCok8ZBtKwE17KsZhrTq74BPCbVOzOi
	D7hnOiAJCMDyseg7EXtTVdYj4hjUUIoj7T1E2qaQ0THWnjzsqDIBxzTZd17ufmzq23w7zUpQi9I
	PkrxqOw2S3muZDio8p0kRuTGzxQ0ihWYqMMWgmoVGw/PEc0HyYo7dkCxroTQ5rimA4QU=
X-Received: by 2002:a05:693c:80cb:b0:33c:43c:f3dd with SMTP id 5a478bee46e88-33e7c426a71mr1660469eec.11.1790142855401;
        Tue, 22 Sep 2026 22:54:15 -0700 (PDT)
X-Received: by 2002:a05:693c:80cb:b0:33c:43c:f3dd with SMTP id 5a478bee46e88-33e7c426a71mr1660444eec.11.1790142854850;
        Tue, 22 Sep 2026 22:54:14 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm3304240eec.12.2026.09.22.22.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 22:54:14 -0700 (PDT)
Message-ID: <f4b3fb1e-4628-43c5-97da-8af96da4d642@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:24:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] usb: dwc3: core: add post PHY registration hook for
 platform glue
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
        kernel@collabora.com, Igor Paunovic <royalnet026@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-3-763bb546824e@collabora.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-3-763bb546824e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyMyBTYWx0ZWRfXyyrDjmtXAHet
 gpMiGic2BkO46GkNkJDzLYsd8W9/uBF0j1Td1h5/lVMCN9nKIGzUcbN8D1iw3YXJgSnQY5yXmaf
 LSXFfXjusYXKQOLmDXGeokV5qFOGUpr2YwSqsA5YFpXEBOvTrhyoV5lB/RYGhdqK/N2yGhQSk3l
 PKLQjY5/5n5L28XBt4JrZAhNsNVLZJhNI/BmQPWa77VMHRu+mu+Ckv3gZOmkvg8aG4SY6qMtEGC
 Myh63mBF8iMVzsgSgM8HNv6FHX1DMGQyNtfDl2l+ohFiRiYQJgyRrYzd/l4iznidyT/tC1ttwnn
 WIzkHsjpao9JouOAZdIcsrg/oce6sh+ZGaen2hXy8HPD+dFrAqaJm6m38xHDVAVx6uLn9WDzcxN
 eY1nmiMBng0rdFUjLM11M97MRvuX+5GH6bQAQ8WVg2BOI5PNB56/jv0crkRRjESKQmy8g0ao8jB
 /nctO+MflY+RIKzxOsw==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab36988 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=fFHpL_doKWamrhBxXOoA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: sqEl5J7N6HgcF7L2bsQCmsK3tqLxtElG
X-Proofpoint-ORIG-GUID: sqEl5J7N6HgcF7L2bsQCmsK3tqLxtElG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyMyBTYWx0ZWRfX7y129udvjEKN
 TyMz8OgHDGYEJZmhI75pXKfqDECBOwpGSnyNg8PhupWzl8ugbzYSR/OyQS4h7DxgMHCXTUJoNln
 ORKlB8TI6DChqOyesqy+bALsMCRzyB8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_225416_950264_90FB087D 
X-CRM114-Status: GOOD (  23.37  )
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



On 9/15/2026 8:47 PM, Sebastian Reichel wrote:
> Add support for custom PHY handling steps in platform glue code
> by adding a post registration hook. This will be used for handling
> PHY reset notifications on the Rockchip platform.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

> ---
>   drivers/usb/dwc3/core.c | 2 +-
>   drivers/usb/dwc3/core.h | 9 +++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 4b7132887a03..daf5aec07fbf 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1613,7 +1613,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
>   		}
>   	}
>   
> -	return 0;
> +	return dwc3_post_phy_registration(dwc);
>   }
>   
>   static int dwc3_core_init_mode(struct dwc3 *dwc)
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 608daeb7ef10..e9d8df0a298e 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -995,10 +995,12 @@ struct dwc3_scratchpad_array {
>    *				need to be passed on to glue layer
>    * @pre_set_role: Notify glue of role switch notifications
>    * @pre_run_stop: Notify run stop enable/disable information to glue
> + * @post_phy_registration: Called directly after PHY got registered
>    */
>   struct dwc3_glue_ops {
>   	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
>   	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
> +	int	(*post_phy_registration)(struct dwc3 *dwc);
>   };
>   
>   /**
> @@ -1655,6 +1657,13 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
>   		dwc->glue_ops->pre_run_stop(dwc, is_on);
>   }
>   
> +static inline int dwc3_post_phy_registration(struct dwc3 *dwc)
> +{
> +	if (dwc->glue_ops && dwc->glue_ops->post_phy_registration)
> +		return dwc->glue_ops->post_phy_registration(dwc);
> +	return 0;
> +}
> +
>   #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
>   int dwc3_host_init(struct dwc3 *dwc);
>   void dwc3_host_exit(struct dwc3 *dwc);
> 


