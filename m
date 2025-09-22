Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26535CAC5AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiYvYz09Ku6t3DKDC+/4pI6qfS4bj3bJjEj9wOzslhA=; b=U0j2cJO1fXS/7t3sCKW9ouFQIa
	s7KTAXMdOvFtzTnDrZk2+6TAwG2HhaOeNE9VgqjGO5SWwz0CoaKibIM0EKLf8UNA993xcibBgXX4V
	EIwLwuuwz4BlH8iimHPCdZyPdaEBGRpH22uiGodEji6a+3oYXYloXXgq30nxYRinWAlILjAghGGgF
	QLMpQEwjz2XQXAhHbblr0TOmcOE3xHt2tudH4qFAoOCGd9ppZeVUhqdmBLvm2MTtj1/bPzYpamEZL
	YfssLxJVNO4ZNxS8JUm8VPL1UxYnHA7CX4z1CzFeezEulUz4xdIKRwhAZ79TBTmdb6fbN8pexlads
	8xlmwGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dMo-00000009yFJ-336z;
	Mon, 22 Sep 2025 10:01:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dMl-00000009yDb-2IRZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:01:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M90FRB002252
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 10:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XiYvYz09Ku6t3DKDC+/4pI6q
	fS4bj3bJjEj9wOzslhA=; b=M7Yzv5JW0kzo5jqhfuTrRAr2NwtyCdfXVTLVHncP
	tYI97i8LcDHQB5HgXes9kVdNM0fTPrfKEikVW5TvqhegrojVEAyu1/H2qs8MNc1Q
	VoGZZ2bvd/2C2225s7s7U2IXWuu/zxXLD83t1PfAVQ3Ex8YzYzw0wNK9XuifolUL
	qqRXE5YC0eTFuK2tGjUDYH6nA6ORf7KuA9VYoRVFUXn0VWb7pzvJvozCpd3h5gtV
	/REIvnhJ0oIMAcL7e/3p4yZFYBjUDllStnUmYL2t9DGEVn5PNJv3j6oZfV4pORIB
	3OJcgmPs9kjwgyNQzEhh7tJjyNTuVaYGLy7e3Tuz6HfQTA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7svem6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 10:01:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78ea15d3548so41395746d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 03:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535309; x=1759140109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiYvYz09Ku6t3DKDC+/4pI6qfS4bj3bJjEj9wOzslhA=;
        b=QXB7DSi3B//OCm0N6qJZpQwE1KCLhRbDdBv5zYGSM6SGv3pBm0AVA2lfv8KpJq96d5
         XvGzW0CEDj8YtMmsNZ+22y6CUORLlPIQ+yGK9AKivK274UoplkEzVh8kTL2guZN8YKnM
         /oVo7yAYTxtxQbLqcE9TvfNzIzA4qRuODMweufztSWPr2PMC4wUcijKEoqq2QBZ+TNo1
         tztxHlnhKHlhdgD9l9WZk+zafoWbiWaSDZMtOdhxBaNjtMsnk1DHjyQujxccXzMRc0TD
         X9eCTpIs9bFvd2jvpnaQ7Bbmjew2Wv/eAza893aECpoc9JVzF+UBM28Nq8kKoP1XHl4/
         k03g==
X-Forwarded-Encrypted: i=1; AJvYcCV35Nrv38cyebLthXQVoWWmJ3l5z9QyC8RR0rPp7gJyTmHICYzi9PfoZ/9QkbORJXwtbMP5rfHEDepQShd/lkAh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxawn9uP6X4ghu8PuAHQ9wXK/D/oZv7JSrQ2Rumm4DkzuP6SgtY
	cuDqrMzX1K082MLu3qpbjrdix0f5DxvzCyOwDDQxzaHrzh0QFCCzQRWPETFK60a+vGy2+9/8Kqi
	Id367hMigcsiBqIr0dUX+c90YyulSs1XbGvfagYa5gxviWCirYqe1b4Ul8vSLz1x5aaY8PhpeJz
	9DguMVsVjgcw==
X-Gm-Gg: ASbGncv60XYYRultctgrEnjvuOsUH2kocyivSuFHquAtqs2daE6mjhRgX2/TI891rgi
	rxIC1EUFPl91AzzDnLy/HkNWp0LKaYTmlMwf+wDxUZEDhlTTCNbcKsrkL0zzo6P139r2gpXMsPJ
	sRtFdTNFJr0bRdtwIxCAW/9z/OQCf6E8errYVz0+FvqNw7u1ZObdKZXKJrX6IpLe5GsKSF5yQ+v
	6R0BrrARp2SadRBZuqtFhBdqfsTp3rHnQxiKozvy9bPXZJkXVWWrGFXK6nel7jTQpOd04Q+t4tr
	6hL2khWw379Lc/NZEIUe7Y1X205rBmUh8UDzVWfRF8X/IZrJK2MohOPAni0pGWnAT9Jr/pLxqTa
	gp5x0qsByqep+Fgp2LdjoFBo2HOuNMbUr25UkZgsFrVj+mIi48/gM
X-Received: by 2002:a05:6214:2129:b0:77e:dd3e:a0c9 with SMTP id 6a1803df08f44-79911fe849emr152956866d6.14.1758535309198;
        Mon, 22 Sep 2025 03:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3dwdmnAT8Ej8kna6zU+1gThqQvOHecwhWI8VJSZtuu94b0HchIuEq9o+Du143hQaVFqG97w==
X-Received: by 2002:a05:6214:2129:b0:77e:dd3e:a0c9 with SMTP id 6a1803df08f44-79911fe849emr152956006d6.14.1758535308504;
        Mon, 22 Sep 2025 03:01:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e077d0sm29027191fa.9.2025.09.22.03.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:01:47 -0700 (PDT)
Date: Mon, 22 Sep 2025 13:01:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 4/7] drm/rockchip: cdn-dp: Support handle lane info
 without extcon
Message-ID: <gcgiszrrpqkoi3mhajn4i72awbffqv6mayahmnyswoitxxmrgd@nr2z4cpurbwq>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-5-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-5-kernel@airkyi.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX99zABZdhExc/
 Um7QraG5cWNGwUaOfIkW5mRY7L62VvdnqooLm6nJuFlBmItk+EU/888BYz2gNXFC1w/JuAR56n2
 8KbhOAQhAwHdSSxoK95c2i7O1S2Zzp5FTTR8KD/YVIh1RaD9igkIo8mPyyudugaiVVgucRxsSCE
 FraOtWixJeUWyOmRUdWeQ+6vB6QKGIJnetAINYP5Ql+LxK1btd9sbBVtZVFUReIBcoASohcKLyR
 c29dcb3079nqFj8V+aOVUUmuZgnscu+w2GJFBrULetCln/nND0sM8SiLFibELD7IIB6RYyqgCWM
 JO6YwZQDnFka9H90AvJYpRr5yMX2hRgW047ceD423fPx4JfdRaie5glX8ttIOdb6X3/W2tzchWz
 jFCY3jrG
X-Proofpoint-ORIG-GUID: YDi41m3WUKe7zqnnRLPBSGiwxIW8LTx9
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68d11e8f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=k09sBhBf5rVv_DnywOQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: YDi41m3WUKe7zqnnRLPBSGiwxIW8LTx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030151_582922_36267395 
X-CRM114-Status: GOOD (  26.05  )
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

On Mon, Sep 22, 2025 at 09:20:36AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This patch add support for get PHY lane info without help of extcon.
> 
> There is no extcon needed if the Type-C controller is present. In this
> case, the lane info can be get from PHY instead of extcon.
> 
> The extcon device should still be supported if Type-C controller is
> not present.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v4:
> - Remove cdn_dp_hpd_notify().
> 
> (no changes since v3)
> 
> Changes in v2:
> - Ignore duplicate HPD events.
> 
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> @@ -1120,14 +1129,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
>  		    PTR_ERR(phy) == -EPROBE_DEFER)
>  			return -EPROBE_DEFER;
>  
> -		if (IS_ERR(extcon) || IS_ERR(phy))
> +		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
>  			continue;

This will break the case when the extcon is present. It should be
(IS_ERR(extcon) && PTR_ERR(extcon) != -ENODEV)

>  
>  		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>  		if (!port)
>  			return -ENOMEM;
>  
> -		port->extcon = extcon;
> +		port->extcon = IS_ERR(extcon) ? NULL : extcon;
>  		port->phy = phy;
>  		port->dp = dp;
>  		port->id = i;
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

