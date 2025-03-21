Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8193DC36007
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IMt4Kk4/Dx/8oRvpv98Pwds64XlQ1coaXykI33I/Bc=; b=vbeCj9GjZvviyHhLKTdoeYN/Sn
	bAgLVXjYxFEgwtqgtgYLc92eaO7qgsQO94px1AVpJS9nbYikMaipYxhGyt7bToZjK9p8QJ43aygsK
	1/hQY9yN84BRzIYTolCS1oyUT1NA/E3C9In/lLJlDkcEVhEjjg/+RHdyyqMouTfZooh9JH3im5w8b
	0WrzUMuUHYq/nzF/vvj5pasX44QMgLal/9oqhJVpv3Lp9wz4+UMPJrI/am/+SARbKLkUdS9pggsdZ
	4sXr/cx9YeUIwvPe4NPpO3TwLLlQXB7x7+uRmNH3QDoWqryNCtSRhrwLd3oWaQqIKfxPN5JcrxwcP
	2lVyK5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfIp-0000000FW9w-3OrV;
	Fri, 21 Mar 2025 16:32:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfH8-0000000FVli-2Qoz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 16:31:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCSKCC025797
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 16:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2IMt4Kk4/Dx/8oRvpv98Pwds64XlQ1coaXykI33I/Bc=; b=o+97gpzr9oNx+1c/
	KXMa5bWbdJwfh9Xb5upxmRQIMe+lpArlut9HyxAj7NHPbnPPWRLf8NC25ZJhIlrj
	QXSOZZ7yXJC9jrbfF0fETqLbp4+Inj3JAQqb5KPklZmSXvo3sRaWD/8yN+CPZ4w4
	D0AYupa6Gwbw+X6uySDgOpV/NxAHy7xD5B3duToLxZ1AOXF2NoKeJKqYsYobUU28
	7offgH1u4v87A3G9l8+673B44Jm4Gmy/6jifTISC3ngtUbb4vW3g/OkZ0WTZwAVE
	p33SVoDPiC4U7jMj07+VsOenHXkYxEbKEB7ocbWOZVtKdRwz9iE8xYYiunrGE3XE
	+arRHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h854gnk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 16:31:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3b53373f7so446557785a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 09:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574672; x=1743179472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2IMt4Kk4/Dx/8oRvpv98Pwds64XlQ1coaXykI33I/Bc=;
        b=jO2GCkp1nCPnn14KduFND2dAGI0zMDcTqJdFt5DaKlIeYRPbO+HH/Do4S+/b5Ys6YP
         CwCxm7gC5WmDuIpM7FakRLtTR57pPwaCUkwkqAZ0nleHYPvss6Xi+CoLzWzc5AhCqovd
         L3GByxbs1XzC1MIfF0rFeHL1jX0dnfRbtvdf76AyGE+WoefActDm3zynker9BXxnF/4j
         cmZH/r+s2yoFj8jsaT0YaZp5TMaMwD0ZjRzCr/CaFGMZXX7ookIx8AxKYyqo7dldA/WK
         2elbNUS3R5szrbHDtW6O+0VqbzvtT5B4c4834LIo3112m/rjUgKRH7MTYUFCGFjgSA1a
         wTcw==
X-Forwarded-Encrypted: i=1; AJvYcCWNO56cZ8QP2EI6z4SSSEI1bMMO/n85ph8eDzIdR96r1BvXjVxrR9MrgNv+WTmWvqExuQdiR7hPnqoO2EOp8tq6@lists.infradead.org
X-Gm-Message-State: AOJu0YybAb8EljkQ7eIh0GBFNBOyQ3ZrQf6c2/ucilc16XbDOGLezGY0
	r7N4TsIk5iO7cGmI6aZrJBxlyHkxYGs+1TWUpCo0L3ctYfSDEe7assBFYXqKERG+kM8OY4p8A31
	Q+BD85Gj1s9v3v6mhVaEAvd6OelRkwssdyEtMDAL5lmDW3UKNIFOWfeMbb5YbwlCBWYiapeHpQA
	==
X-Gm-Gg: ASbGncswxStB0sJFovLAJU+zAmoVN3X5XE83rmScLwhT7241gHYXfIzseAO93YynsWX
	9ygUoUFKkZS5I5Yz+ag9hVOZlT53YvKern/5pEIA1vlOXuKM8j8wkBulqurO/RXhV8Rijz+UgFo
	fkfzhat32WVVOwL+iY8XpWZej9sYMsrwiqqgHMGUw2bVGkVsPHq1HGK8RAZMUYOiGh0m5FceSBh
	hIYp2tddmHLjBwhOTMb5o1Kvub5nxeT9hVVB6r600xGfMoseDvMIiVhPw1+MvIW40tPYQ6E/zJJ
	+3ITVr6xYArPdYZb/MT8NoTobqlR2TKWd2Wx4RIF7HaWDRt3TS+gS7d+LZD3CH/DtuVNsBBdmUo
	fzBIq6WxaGipB+8fU6wnlUgWechPkobFjLxrFhnYOYso8Go/iuDlNPulGUVu9z4QJlpcY
X-Received: by 2002:a05:620a:4406:b0:7c5:47c6:b888 with SMTP id af79cd13be357-7c5ba1deda8mr478439285a.40.1742574672465;
        Fri, 21 Mar 2025 09:31:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC11C3ROuEuv4LnPyl+Nggj2bsLHRBsWaManjOdSZzmLn86PXUTHmkaKj69Rn5CvZ35HXpuA==
X-Received: by 2002:a05:620a:4406:b0:7c5:47c6:b888 with SMTP id af79cd13be357-7c5ba1deda8mr478435885a.40.1742574672070;
        Fri, 21 Mar 2025 09:31:12 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c2:310f:a0b3:1d12:b116:f8e6? (2001-14bb-c2-310f-a0b3-1d12-b116-f8e6.rev.dnainternet.fi. [2001:14bb:c2:310f:a0b3:1d12:b116:f8e6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbd15sm215071e87.131.2025.03.21.09.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:31:11 -0700 (PDT)
Message-ID: <f3be50ff-53cd-4e8c-ade1-af8e4f2e1960@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 18:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/14] phy: rockchip: samsung-hdptx: Optimize internal
 rate handling
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
        Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
 <20250318-phy-sam-hdptx-bpc-v6-13-8cb1678e7663@collabora.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250318-phy-sam-hdptx-bpc-v6-13-8cb1678e7663@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r1D37KGdAFWi6lRuFWGlsA-bOKKjfbrT
X-Authority-Analysis: v=2.4 cv=ZtHtK87G c=1 sm=1 tr=0 ts=67dd9451 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=3d3HDMnJp-VYffEgFzgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: r1D37KGdAFWi6lRuFWGlsA-bOKKjfbrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=972 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_093114_626384_A9FA92FA 
X-CRM114-Status: GOOD (  11.20  )
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

On 18/03/2025 14:35, Cristian Ciocaltea wrote:
> Drop the rate parameter from a bunch of internal helpers and, instead,
> make better use of the newly introduced ->hdmi_cfg.tmds_char_rate driver
> data.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 47 +++++++++++------------
>   1 file changed, 23 insertions(+), 24 deletions(-)

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

