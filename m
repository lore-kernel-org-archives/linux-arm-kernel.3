Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4554AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRzWkDK3ft+iwkKji/GjVMzBocQDwCbSuP5DIc/EUys=; b=CpkiqPxsMcE1pJ8+DlG6Bh84fU
	gQawx6sqXisa74QiV0sWoVTTRIj+/weLEmlEjcN7HZselA0q/DDN0NMxAZKxaL3Qb/p20gugnSbI6
	f5Jm6fKk1/de7qssPspYe3YbwxH5IL9cLVTArmhcH+xnkzynAIs4kEdug2RFVsRrFgf/7MJCJJuDu
	YXDsXhVm6jW5GnJ2OiPBsEzP83hcgXodSUblJRJBOTYx3UyKw2XoA+dIXWLaAF1DrhFO5wr+4HWdG
	oJLjxrAOaBHYSeIy8mesuMk7mIFqCYJmwMc6zK0gyEQOOjJitzWD8bewgZ9Y/Zw7cQhgphPtAhkrL
	QT0/4NKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCTy-0000000CckB-0eiK;
	Wed, 28 May 2025 08:49:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCR0-0000000CcUL-3EiK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:46:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S7A2f5001002
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRzWkDK3ft+iwkKji/GjVMzB
	ocQDwCbSuP5DIc/EUys=; b=NYX8fy24OEESH86jLxZM9FLzbN+nsk41j6+K93rW
	ueBNg7KgmhdpslFMbhhc4lTXjuX2liHHDZxYeQ/+t5uz9RssxOwPIu4W9c2tZM+J
	CGtb5ziTFEhYj5WTXFiQn5KrflxgZV78v52nlevTu5N0Jjc4c+qYaCk8LOv+Tn+X
	X9OkFAJ3pBEtSkNYly3WQ2nZCCsEO0I5MNBO/kIJSpabr4MU67xuXpVyT/mgYo2N
	NHHOxlvQLJOx7rtO0uWJ3xj2jV7gU37aeb1yVu/1aXV7A4de+16hUocYKszCct8r
	MsQgCFogJEUBfWNdmeQitrcpH8XZeyPrbMesdFQBdkqzXA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek1hvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 08:46:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faac45f582so41021436d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 01:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422009; x=1749026809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRzWkDK3ft+iwkKji/GjVMzBocQDwCbSuP5DIc/EUys=;
        b=bqD9FLoMDAuu2yJKPQu4lbK2BYsgscx8sKI+SPSDuBJRnLK8l9IEBeP5sStk38Kpnk
         dj1BJOFWe6Pw0IcLFNCaeOv7VWJDRtbmM7ymeJzb0dz5qTz6F+fSSqs+DeDowbfRNi+S
         7XGjFxeLFF8wAxB0RXPxwseNCtVAMQp1cSdxxiPfzBXIvBlTXYHFqRs/EpSRbdjQPjuk
         pcMQClQ/AzCM/OokvpE45L/t4SWhr0Shr+pLzJIksjHJ7nC8tkwuxt7CubTc+9pvYceP
         YzHJ6NiKxBL25ne727fFMbo0YAWEFF1/zWo+vvM9CmAQNCjL47inZanfGPuTnYF9DQyz
         FicA==
X-Forwarded-Encrypted: i=1; AJvYcCV0LPNiRXnF2ddy0RylgJOV0Fxel0XRJ8sA501vDucZoYUtE6P3VAPPPlje0gudWlTRf0//15OcuIyNjeKLM/Jy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/NKB5c6jAJT3ku0LntKNUGeQA5fT4ckwTx90e+WsGrPWHI6Rj
	hSV6Ez8qOitauu8dIzxzSysc+WbwHIaceBfF73yr78G3HJ/o1Hdn8bhZpYgHnfe1UtFdhqichZd
	JYOHKZqPevBkMuHceeGs7u9iaS1cGR5jkZFrljDJfUUbk+tFjmuk+77mXy8naC3QhHyJbZGqQIz
	wJog==
X-Gm-Gg: ASbGncszja6C8CQ+zSdfhsCViAcgOlF91Xd8uC85pAuWKwkLJNDTIxHe6+hsqRbXTR7
	yEbHtIpaT1dzKqSc8JnkfLfOMPBRpZl4A3We9dNQJgDBAPXKm4zaJ8DhOREZjjANJnpgijuSg+K
	nP/5JpVKPHWsD8upErrPpjfWQ9V0jVZEyDen2GWhAPDyFHhqrAAvS2L1b+zBbevKdEZwweLp056
	IgiNlb+OSPRTQGbjO/1Er9+3RL7aob7NM2v43So5NZd4mo4qgoZKaogDtZuFl9vtJQ1nDxVBJnO
	UHakAaWrtd6S/lS82xgFxl4g3rL61D1wdAjOLw/wyoHVNUKcAHkQbsqRnv8DjgWVFtNA5K7jE0g
	=
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008626d6.23.1748422008956;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo9qqoQrF01ykPGF/17EjYHoPs6gmbavsSE2zy6sawKd53Clq0hMx0BlOXLpAzfgtNG6M5ag==
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008336d6.23.1748422008535;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3e3asm182752e87.234.2025.05.28.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:46:47 -0700 (PDT)
Date: Wed, 28 May 2025 11:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <vjtgxpbpaowlz7ftryudf44f35jyaislvkckuzrzlpj25z25cf@vytjvui65gec>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
 <20250527082446.2265500-7-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527082446.2265500-7-aichao@kylinos.cn>
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6836cd79 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=uJ6pKfArofpzZCl0i4YA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 8-8_5ydMFw6FKSkFnx2fEgNd5z1l8H1g
X-Proofpoint-GUID: 8-8_5ydMFw6FKSkFnx2fEgNd5z1l8H1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3NSBTYWx0ZWRfX248ZZX+CTeb+
 Ny0wzJtBchomUbGtrZMWjityXy7+kwoCf+Cy95o7CVm/NSpIvu88W0QlN1Azz35/0ulFxfqf7pr
 t42mx/PwhOSHPv+M8R8dbmPdEHSehoSk0KG38y/TcwlETuRlOzEFOrNax4YBpINmDPfBzY84gyo
 wgBS4TEct3wj54gXEINmP8rqBBlG4SC8Y+zz2y1svgaOIXP3LaL7IF+Q8PlB8FA4vyuk/8DbuVs
 Bft9RY9L60z5FwwfZG35VPWo2+H8UrPlh+desGdPizsTMUnp5scRwsamssCwPVpK7jDGQ3LQflw
 ciED7jfrKFPCytagRpMUbbygxEy7SDXh0w7ukfn60z7YtDgUWk5xCq9AO+VJ2u12FItAlfKTF6M
 jPPEgioot3/sXFcm/C/5jjzd2/1cBHJKC/G8ErpSfX4dZ9UCPMVTJVcOKgY7gper45ukWknt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=528 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_014650_947564_57942BF2 
X-CRM114-Status: GOOD (  15.28  )
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

On Tue, May 27, 2025 at 04:24:46PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

There are no calls to put the node. In the patched files the nodes are
already automatically put by the looping macro, there is nothing to
cleanup. Please stop sending this patch.

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

