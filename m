Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D0FCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCJF5c3+QMhdemtPbsFinQUgkFKPi2bpCjGACADj15g=; b=27S11ImaMsxeDhVRLw58BZ+MTm
	ZiO1L22tFBCdCrJpAGJa15F1ftTVjB4nTfVvgSq9rAFFMkID4uTPzkfWOEMrc/r5pQWjXT+MKGlzc
	cryf/YtEINWyr374ip8YS5PrZE26M2GmZgqZ+T7U7aSoflGkUuDwKHxqubHhuAOsnoyH4OPC9PPdN
	5vNYY2XQBJLHIXWxcMzUfyV+bxo+VqeA8e9j7NlMjDeFgR86VUa/qe11frOuZzlmbzCmWJrsOAgn4
	nhus/UgI7x18vf1Gl+kaYSMuT5qOz1BsIXXS5l28XW5nTKGDhsV/DY8jfz2btLnVzq0e8psqsJ6m8
	P4sHiyeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7FH-0000000HMw7-0AuG;
	Thu, 21 Aug 2025 15:30:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3WJ-0000000Gldi-3Szj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:31:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b8n0012910
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 11:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wCJF5c3+QMhdemtPbsFinQUg
	kFKPi2bpCjGACADj15g=; b=OcnEEl6Iixdz9PVUZ2Zfk4Cr60+6BNxiSiK9QQxX
	YlDAdZyteOIbIJ3p9wrlwEISmUEZdwXf7Y9lInD0mTaJGFVOTzVwJZZmdnME8Zjd
	X3rS8TEdN+ybrLWl8Z08tZ9a/YmPUhsCA8crQWpPprLRVzV2xyF0l5dtLqKhCtdr
	sB7hAj1Imigm4OfEwT0TcC57N6LkCkr3TPObt/tpTWrei3wnmeCVYkm//+ZalfS3
	jOO1JxFiy3RefpH9UzIYtLCz2OisAa1isyao1XOzTI2kx4UfKoeBH3lhatOmu7R4
	bjw9UQ78KKXtWahUl27JLkP378jZAerl+40S0bwEPPDBIw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dn595-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 11:31:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d7c7e9732so21937796d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 04:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755775910; x=1756380710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCJF5c3+QMhdemtPbsFinQUgkFKPi2bpCjGACADj15g=;
        b=hrqiHgarfkAGsP407dP1QD9Ijenyt++AdpIPLwcxPMbDwHRvuNNEVKP1YWtZoTdw1z
         NhY/N686OqsIblhGYkFxSQUvUonxpk4DMSuYjZ4RYICOBhK2jZ5VMnPGD4glzTjjE7eZ
         sY2EwY1upFq9cQyrIOifhOvkMKsK5tguRQbaggBaiHtnnwSj5U6cMuiNZNjAA3BbyUn4
         OCexqIscKuC8jQGstI9S54JfRP1dHAT3pkQkh9Gx+GKv+A79kea6jvUgQyt5fhcNc0em
         DAK2Y7EC1gE3yLSZo8rx8KWI8ZHeuuoXsoEORB+TWvfs+a/kizFAQRmDECRHwIFatl79
         wLJA==
X-Forwarded-Encrypted: i=1; AJvYcCXYy592xfuKyIprK8yZblvUiRwjILb0jj022zvC/VCuDOlS5JEgKfAv/QDZ6MW3AGqo4wIVm/zo2eTMYWTHPTtj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw495nUEO16yZn5qiLHVaN1wMJ1Pf6Py5werwVy/pOKwZsXHnYt
	1f5eIVXyckZ+L7wAXitHDAC+DmRD2X7X2WuyuDoDm6XNGiXzNklCXnrxUd3G+sSWepiax5OLyYK
	RLHfaBhhGcXb/UeSjdTg15uA2LCL6YyRUwshZ/ucqVuuvYgjEmTZ0b+il2DqeI/qHA09RoQhvvP
	5jAw==
X-Gm-Gg: ASbGncsJoL6Z8uMvIU69orBZBrxauQdEt8u0MtOE6HKLNVxwkz9rkCMtP05SJXg7ZVA
	UqxpAG/11Sk71rCRGRsOs7PA0uBHnbJd5Xkm65PltMSlzvXI3s1tnWQOW9wJO7VavbTauc9tcn4
	m9YOZkZpUqS3meL0s4J1bw9Rl+QEpgazHEqWt0JA+HIcMZPETgepBlR+ytI4e8syAhOtaGntdbD
	W2k8JfRlq2PxvnuIOVb2o5gp6Cy5O7eDBKkN87MTIHCpQRpAByX6ZHcvqFpGMxcRsKnueRyn0Is
	l5W+SKwmt5hXBMMK/SvbUQcdmjcG2njP49s5YrB2oNq/YnaVGDPUBnp5K//7ukZazy364fzIXbQ
	29HcSW0PhgiV4xxkrOdoZU9GbkPVCckLtB+pdAJmhmYj+zXseSH/I
X-Received: by 2002:ad4:58f1:0:b0:70d:943e:1623 with SMTP id 6a1803df08f44-70d943e18c4mr1654316d6.55.1755775910029;
        Thu, 21 Aug 2025 04:31:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFSs4VKIibVozJgAfWYCmiz65wGeoOsB2ADhDuNHcn0UHHXs9rSr5gNX58F9niS9BZiB15Dw==
X-Received: by 2002:ad4:58f1:0:b0:70d:943e:1623 with SMTP id 6a1803df08f44-70d943e18c4mr1653726d6.55.1755775909466;
        Thu, 21 Aug 2025 04:31:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3353a08ae5fsm8719801fa.56.2025.08.21.04.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 04:31:48 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:31:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
        stephen@radxa.com, cristian.ciocaltea@collabora.com,
        neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, robh@kernel.org,
        sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v6 04/10] MAINTAINERS: Add entry for DW DPTX Controller
 bridge
Message-ID: <qf7rp5fca6b4orisls2m7jmmtpqriiwiqp7q47vvzwq7zva3b2@6qcsswlzke7b>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-5-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728082846.3811429-5-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4fh9ndlrd/kn
 ecJoHhXvmaeSf2MiK89MjxsO+q4Lfn+Vu4Z+QYj4lYibWMI1QQmmUIaZpvy/Q/It/j8pKoTSRRI
 blmomt2eXOes9LrrlGnIHy+RvKG3eHfed2KwKn+ATTySSOlrbHNMF7+NC+PFQ4eCMc/RNUzOQKs
 D+Emd45raBMjivqkk7UQPi+Hht7nwxKcBOXWrD5TZ6bfYrFm0NaSH8shJxq9XFmAGD3EvaaYUZu
 woG0Z9zcWs0lwNFBkvae16Y35ZTzW3JgkYacARu3PrpT3rrDC9H/dkFV7co2EByaQLm9GS/B3Dh
 Gtl/sW3Evep1Tzj7tysKgoeGM4x5LYd8e5KErgHl/O8OsU/RkOxmMuOyuO70GnnuhCXVYh+pkO6
 5hPKmF+9kmXky9Crt3tLXJBQJd5wjw==
X-Proofpoint-ORIG-GUID: b8ISXev-Mb0O33fpwGwQecnyKZamG-LQ
X-Proofpoint-GUID: b8ISXev-Mb0O33fpwGwQecnyKZamG-LQ
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a703a7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=3WFxphGLh404ikClcyYA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_043151_977607_1B2A8E55 
X-CRM114-Status: GOOD (  17.07  )
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

On Mon, Jul 28, 2025 at 04:28:29PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add an entry for the DW DPTX Controller bridge driver.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> (no changes since v5)
> 
> Changes in v5:
> - First included in this version.
> 
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

