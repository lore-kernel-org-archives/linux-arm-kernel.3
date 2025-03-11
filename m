Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2CEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=695GR/KZLkHZ1WKu8d8I3wFJq7e0VRh8DjOiryU8o1I=; b=qzIe0kNrRVBurPJiASm+C1bXHn
	9Vkzbh0SCFtdiI3GBvKRIg7+TW7NH2u4zHshy4edqJJpnbFpSsxR2Mvg0F6ZueoIY9RlBBYO47bxo
	ZN0eQAPFnPlFwQiR0XdN9CkE7DYzad4dW/+7k6j6t40AvhpQ35yVChyCP98iQiMYh9nKk3QELGzcF
	t2ab0KFdwLAf7GenM2dv6sQuKoDE/feT1T+K36OtHxwDrJgntOB5+6BHBHV3RK5YdZug/sQ3g9E/O
	BC8n9EtBcoFlHEaE6ng1Kcq/1cMJxMg7CIWDmujVWsQN9SO31ppzTNKJlIV2lm5KE5/wZJkJzXUEu
	kit/9YyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts37j-00000006Psi-1vYT;
	Tue, 11 Mar 2025 17:10:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts32p-00000006OVR-2fx5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 17:05:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BGjKBO031435
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 17:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	695GR/KZLkHZ1WKu8d8I3wFJq7e0VRh8DjOiryU8o1I=; b=Fr9Y2VbKb77uybHC
	SsjKJrzPBcGaari0g6jOfZG9ym0t8sY6Dqvh83l8nq/eF2482GASQmd3zklKQudH
	u7WehTizAFyh9I/RbYG6LgLtlKB5SCa1lNKiXIMMdBAESZ1JwKmpWsd0rsUB4WRT
	vSP0eCnRheAANu6kzK6gvxYn/47JdM/ioIcE9mC3iE9G25z5No4yKhCnt3RHQbrR
	pzDCn/kuBNvf6gLtK8gULvirstcFrX52MzSG5toVSLxJJG/MRJPRUb7jcpdZ0TrR
	ri4JjGtu7dNZ0sZknlLIWi3zaWeKZHb3gC+O7Suh7OulvYjpYGtEwn1GUd24ALeR
	49I/jg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0q1b47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 17:05:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224191d9228so114555905ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 10:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741712729; x=1742317529;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=695GR/KZLkHZ1WKu8d8I3wFJq7e0VRh8DjOiryU8o1I=;
        b=P4kfCAHhR3r1WRElHI/ebqAU8BLsm/n+X7oFUrPZZWDAu3x6k1zkpHCrp0zW4/5d9r
         lkYY/wonirgWnd/QrtOBHUBkDzgFNcFMi+qpcauV2F/8yxaUAH1BBXYuhQ0SndefyePI
         kDlCoPFd+hKllIE2fhll8R2LayDC5zYhdMHaWrEXWwQuX8BZEWhg18hIX2G7aowCksQb
         TBM5Jso8HLvEKwsyuf0KXDU2ftZuJmX8lFVw9Cfsfb2rPF0eQa9vYwJi8cDJhAVkUUHC
         loI4u4XnPOrJOrjPzOm0V8G1rrhXntpu/YPgHYv7exLfM2GQYK6ipUFJKUbc6gFdMk8i
         /oOg==
X-Forwarded-Encrypted: i=1; AJvYcCUcgNzdM4nYhitZlWEBQEwwz+FIcTH0jORHlc85GQCy5z0RdaCq1i5Rc1FZhVL2wB5LlTveFfQ1njJUTrDBNczB@lists.infradead.org
X-Gm-Message-State: AOJu0YwGukrzbGgUJyFks8/o/uNZN/koesHV9m1ey5RSAezAkskzrB9A
	wslQ6ljnde5jCjEnFIxuEmwp6ePX2zx1nj9EakbnQEHU/rQDry1MVlaDDTUWHgFOI7jISw7yXQq
	QSMIlFI9C/Ye8NPAHwkqzupDJTubX16UZv1C/FKYR9Ce4z2l00GCp+r+859BY5TfBnkvgBGBc6A
	==
X-Gm-Gg: ASbGncswbDFwYQE0P8AGdgmNfa77OccmEd2POvb4IiZJeOFyyygb+x+mi9Pw/FJMudE
	zd8/YQJGchNr5FOIuGK6kmyqqqvCqPWc600YG3I30N3ihj0Mxvfwf4OCacwvJEPnQvKuaO1MG2L
	GAx9BEiCkAZXwn4O5b8AwCwfDMOYeH+B0nHwJdyYyvIS2NAFQo3fU8JAvowV8+nVMfFT2LKYIAL
	8SZX40fYY+h7i0SUkR80pwcNVms3053vG5JgGObjimG6s965b8gw1AikhPf+4RUUWeaUS1z7OFA
	B2lEYGlStuycqp+4mpoRwaI/xHE1KUaXDrYT3tG4A9e3oIssV9mB
X-Received: by 2002:a17:902:ce8f:b0:224:1c41:a4bc with SMTP id d9443c01a7336-224288951edmr291368255ad.12.1741712729222;
        Tue, 11 Mar 2025 10:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNmYfTMSW/XGFFejAsebRCu/XXSDKUCbe/u23gMVpwPCacZeb0zlctyyAvyI50SfrBGmgbZg==
X-Received: by 2002:a17:902:ce8f:b0:224:1c41:a4bc with SMTP id d9443c01a7336-224288951edmr291367805ad.12.1741712728800;
        Tue, 11 Mar 2025 10:05:28 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410abb088sm100321875ad.256.2025.03.11.10.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 10:05:28 -0700 (PDT)
Message-ID: <7dc00288-1e12-4524-97e7-a427ee24d984@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 10:05:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/26] clk: mediatek: Add MT8196 apmixedsys clock support
To: Guangjie Song <guangjie.song@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
 <20250307032942.10447-8-guangjie.song@mediatek.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250307032942.10447-8-guangjie.song@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3GCl0noagob65Y5ZbOCjBQfdnTudKhmC
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67d06d5a cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=xSbqf6NU4cea1KmgExsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 3GCl0noagob65Y5ZbOCjBQfdnTudKhmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=992
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_100531_829550_22AD2B08 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

On 3/6/25 19:27, Guangjie Song wrote:
> +module_platform_driver(clk_mt8196_apmixed_drv);
> +MODULE_LICENSE("GPL");

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning with make W=1. Please add a MODULE_DESCRIPTION()
to avoid this warning.

This is a canned review based upon finding a MODULE_LICENSE without a
MODULE_DESCRIPTION.

Note this issue appears in multiple patches in this series, so please
fix all instances.

