Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6026103E19B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGa+CLZzKHoL/VZx2fIYOeAn8vQRWoCpwsf+TJs8OgM=; b=vb/F4KkIPUSJFgVOcvQg5WLSiN
	GLrC5+eVms5idNwDmuNfMeLvjKXcK2xZOSgA0aiuEApcmXLJbwX6duxVe8RsZ4ER1xSkQc2ibW7tK
	7LJWRFCwMu7r3yI43Po8ICSUMN4YUhRMhQlHBiavaw4X0jjapOSv5RZfZw2Vu5ukDKuj6Zbwrehlb
	psVY8cVU7rdul2LLN+DkGRrEJXuhmMrD4O+pGudiI9aRLzUTxd4REjQPqqKLXJ4mqaFBkIyu0vsLp
	ahv5pdjAETx0zClJHophxbs6/X1aeXBYt99sb0rMQFk60xKnmGygAFaQ3F/DdnwtD4ufcyMUZ1UZD
	KeWoNx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t01-00000008jdz-0fe0;
	Wed, 18 Mar 2026 15:39:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2szy-00000008jdJ-0plM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:39:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXTHc531871
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGa+CLZzKHoL/VZx2fIYOeAn8vQRWoCpwsf+TJs8OgM=; b=WKzZSSBUrBON1rx+
	hM7vlcAT4WcBvaPwpP3WAzsNFI/Rb+sKPvtk0Tb8yiOaSdeiBAWilE4ZVaw+NG3f
	l6ZkRjKBvf3I02fCT+QYnPDwJjiBamlm2pXOTtgEP/pVT8ueO7Wq+UP2qNjOIKyy
	7m20AaqNZvBefUG9NALIZ4th9ddEMgrEdALwbNVezgvPwF+vhu1VoHDabIZ6V8mG
	aInT6XbUMNuXrJSjJXQDFrZvovv1I8kKfAtsvp6av50T3u+sJW01D5SvwmVD3+jH
	4tw3JNL7AJnqY9qtOzD33l4DYZb+jE/oqgqx3mEBXrJvT1xV4lW37fuMs1X2SLK9
	SZvc6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g37jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:39:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50939597b85so43338951cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848392; x=1774453192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGa+CLZzKHoL/VZx2fIYOeAn8vQRWoCpwsf+TJs8OgM=;
        b=XaWZ1xH2s1Xx4bX3GFfhPBtyFhTsJnbEIJ/lQKaKQ3bC2DWxy7VMu2BORI8wbuaQO8
         LupHzpQUYbb9xy+fovzRK6GkmKHWyNzZHpip8Q8QbE7z5IosHWQ4jcnOWXvvas4+xaxe
         a3vtR3ZkYtyG2TcG89K6DqPbn+jnxQgPtr9IcZp5mw9Qqr4+u6LXbgSm9L5unc4OHP2Z
         Dan7DVVT5K0Z8hKf+z/BOpSggkNAJegQegLT0+7TPuYB7HVjBqj5SZVcp32KaDY2oevA
         ilBuHABh934wIVHyeGVhcMVxMbs96C1Zwe8KUADPI/q0eCoH/R4bTJLEDcLvYj13rsSy
         Cg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848392; x=1774453192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGa+CLZzKHoL/VZx2fIYOeAn8vQRWoCpwsf+TJs8OgM=;
        b=NXgOKW9JkoxuFUtXlDRwaDOC0Ig6wprIESNSQOCa+dp98q4BG/Jzug+2qaspD4ik9F
         esaf7z0Q37j0SGUJ21/psSsFQl8OxJw4RX22J3Pi5QFzo+Y0FBTEdfXOAO7iZ/jYpxSY
         tcaS9Tzly6SK/VZQ3XqAvKngiEhte6MG/3qFp9OavdwJDX4BXs4Cqwf/rK9q+MfJh6lY
         omH9xbjP7TJljIDpIKagx/P3r0cB0qkNuy8OYHVCe9RUj5fMoYnmuL+rzC+FLayRmcu6
         U9m6SrEAnl+WbXpWWKGCGAVUvZ+crsBceX5acwpc0Ic/WtoGWaXn/+p+6iInvJ0+N3O3
         7MRw==
X-Forwarded-Encrypted: i=1; AJvYcCVqT3DEomMB4hWawmWL5mQPM51DpOG50mnfCnFz97kTOa1Cfa/hzW94I0YqWqO8aSCQT7SV41Hw1Fy/bBObl+gb@lists.infradead.org
X-Gm-Message-State: AOJu0YxpqwF86AHJ5gBBbIp4JBqAQYuRiUgpn7IIFYlQn0krcmwYKCB8
	0KMXS2YOZlRMkanm6zLWumJdL8xTxJ+uPRC2x8l5o4VR9RW/1ZffUK1Q2HOdYr7qO2LKzbQ03Ih
	W+twB7J+B0U7sQAXEKUJuUDxOXVn1x6n/Ftd8zsxv3daswxzL9BLVgmOFC7WOkTJGjxG1mx3zJ/
	Mi3Q==
X-Gm-Gg: ATEYQzxgXIRCPWpxxIcC/9zzGbgaBne24Cy3wLqRsrV4C3sgqISWzWo4yhTb33Oc6vR
	Qo+bfJlN8+r/HmmYGrKkkDRNCTDQoUTJqtUZj1zzXsslw2YoJhaM0UWpH3zK0h5hSq1dUy0KOY9
	WhYv6nhzZRTkL4xysQT43AcE3MKz+qvh8dKK1Gl9XRsdFX13V9+RfqrZxcihMBU5VFiV7cjsYSz
	dpRGw1p1FM7fozIpbxXcX0G1HUNCcouFXpPh2ypHWgi3jtMfcFUDQ6bsOozWPFv0gcG1P25M5RV
	7n5DSNngNihIFn0ux+Vl++HzDYnf86G7kfl296+Nhnk1rMKbQMYMOa6s2T54UMGZ4Q1di0I3sGx
	nQP2quhyOgLWw6JU4mkIiRvdcdpw=
X-Received: by 2002:ac8:7f43:0:b0:509:764:2efa with SMTP id d75a77b69052e-50b14970746mr44003721cf.59.1773848392386;
        Wed, 18 Mar 2026 08:39:52 -0700 (PDT)
X-Received: by 2002:ac8:7f43:0:b0:509:764:2efa with SMTP id d75a77b69052e-50b14970746mr44003301cf.59.1773848391774;
        Wed, 18 Mar 2026 08:39:51 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@ew.tq-group.com, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] TQMa91/TQMa93: display support on MBa91xxCA
Date: Wed, 18 Mar 2026 17:39:30 +0200
Message-ID: <177384710699.3709943.15119808744846226228.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69bac749 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CwIvE3oJpDz1FoVedloA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: COVDRHiHq8m1NVgbx2o3wVjcS0eEyRZk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfXypCNQ0q/9kyD
 r7CHcNx85e0CgsRV5xVdsv30bGKCwUL0fYEeXOq1QLpCIzK44GxE9eveU/4ZOmrklVdzQ2kA+4J
 UYq896lbFPOu9WVO+WJ9hRjOrjXfC7+rlaj01xmbJds2itcPk9zz0IRpWUfu8N2M+858CHBRJiN
 q/7smbaO8KXAlgY0w1ABkqVn4gfZuHbGsWJcB9zXV7l8kqRamYouvcU9yTUXoiNo1iVKy2kDlPQ
 NcZSQoGHUgl5M1mlu57Yk666baliX2Uqzw9q5/u5rDQQui+p68WSAJ2/c+6yB6V8V3TqO6Z89aH
 5c6evIMXhjz51BXMi4D5zvgcmaNrjIZjHHMyrCHmdvBQypkbddbEhbkyoHd8+nlIqpNm8WClfTP
 MVsFUY3/Wp6iJ0ac5ZDscDFVsiZRAIy2GQKAUkrWgBviy0foTv0ajnM5/MRDdelpbjrCtmVpCBb
 Brd5s/4V+ZZTnq2CTbA==
X-Proofpoint-GUID: COVDRHiHq8m1NVgbx2o3wVjcS0eEyRZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_083954_238722_5C0C7FB8 
X-CRM114-Status: GOOD (  15.47  )
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


On Fri, 13 Mar 2026 08:07:30 +0100, Alexander Stein wrote:
> this series adds support for parallel and LVDS displays on MBa91xxCA, both for
> TQMa91 and TQMa93. The parallel display is attached directly, while the LVDS
> uses an LVDS-Encoder. To actually work it needs the pdfc driver from [1].
> 
> The first two patches add required (Video) PLL configurations to achieve the
> necessary pixel clocks for both displays.
> The last 4 patches add the overlays for TQMa91 and TQMa93, although the
> overlays for TQMa91 use the same overlay for TQMa93.
> 
> [...]

Applied, thanks!

[1/6] clk: imx: fracn-gppll: Add 333.333333 MHz support
      commit: 3cbcf93329c0d40c722122f550bae8f79ca3e65e
[2/6] clk: imx: fracn-gppll: Add 477.4MHz support
      commit: 0463762fa001cee153ac0edb538fd5772a93768c

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

