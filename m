Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41478103E19B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s32DlM/y7Ky0/WZs7Ka9M2dNtudZDdICUprdqBWO+Eg=; b=JqepftBJF1ZY/Nq0Tz3yHe2Qsl
	NveQHopxrCCeyt3paWbSovzsB7uagb6loQoNJJSmgTL2uAoYdS2Y6SFHH5kgJRqQZJfsu4YcT/qg/
	ltfhOhDQGiX6VBX77E7ekxB/an58n6nDz6x5yz1q4mKTCTf+kqPyNPCp+1qM7vHMamXTmKPa8/YYz
	KHqhYagLSWugLQoU0vOoo/XqNI1bOLcwPYPtzlJX+bTqJDK++hPo1ZxteTeTBFZOYm/0vwtDpbVWQ
	kUgicjvEHLuZK0PKQOmo1T3u5x4PC8kWnxZYiNpxSzhA2NeuD7oLbkyFFXxBNJqZ7pE/Kllw7vdKr
	IhTbKMkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t0K-00000008joM-3ka4;
	Wed, 18 Mar 2026 15:40:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t07-00000008jgH-1N3D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:40:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXC2m1768938
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s32DlM/y7Ky0/WZs7Ka9M2dNtudZDdICUprdqBWO+Eg=; b=TCtOPSpww1WoY31h
	G45iPz2zPxMpGUi5FL4l9rzPEQdGK+cYG0/iX95ZAierAfo63V87/fASmgYNgUqJ
	+zyXbUapMrLsr8leI8CTroCd7Pk643F1+ZgaYb9YRkIp2/Q7gH3Qx+EMSnUzYcff
	mX8mVZRkRnT+PWfRpNG+XRLCa0S/qDenWUtiguZsktxwbONNJTu11Hw7aMdVgNcr
	ksGJG5aey/k48lT+IxAGxTBAxEEZN0GvT0+VWOhXtYyYx2GK3ULJPZGPzcORxaKb
	ubAlJCydVfkGyxfbNWh25EdLecklKBy6Zywa47UIi076KDso15u93gYWgsFmP0hh
	hhEm4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqetx50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:40:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509181cc6ebso22119151cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848402; x=1774453202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s32DlM/y7Ky0/WZs7Ka9M2dNtudZDdICUprdqBWO+Eg=;
        b=Q2ls/UCp+cyu+X8xtJXIVrA5zmn0i+bJgpQv8YfKZ3GsvTFO63gzh3oEMDmvy0DKfy
         lgz0jLpXrkanzjegOWpBAYHE8uUfWjfB989/RDAxKggXPZGjL1H7Spkwaq4vxcRISHci
         1H1E4hGZHes80KvseXH9bjfS+hSai+wUFw3V3P4lZwunAUbQ/qHE4X2XtxjUSWmwpdDV
         z9LvwafO4ARvFVOGArJPECFbDNT93Nf2sN8JhYu24/7c0pB+59e7a/svpd9Mh5E17pbR
         auRTMC1VwSCyymD22dIM9fgWguyvWb13lTaY45XOIQxb0cj3Pv7zZW2zO0VlysEA8BaV
         iN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848402; x=1774453202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s32DlM/y7Ky0/WZs7Ka9M2dNtudZDdICUprdqBWO+Eg=;
        b=STTBCatz6/9mlHTXFF5C4CEl4kVvIQHvZNDqC4NkFdq6LeARG/vbNzv619NAUN0IGi
         0SlDvANfUYyySJYALw9g5WXsJ9Mmu35KA6+ujF00DbRzuJ4KI9mdTmOk4mXzccJpA9R+
         Sxo2eaWqGj9TAZNLQT5klMYD8pLTfxt4JJSltxYBRNTv7zy8ZmaZ8ybfCDr1jq2e/R34
         MZZ3mXv/0oGyyEz0vIC0dPpRJ+G97IVszRhApRYW1gR9Gx3WFebOCSqltnEugUwwf6gg
         gO7054nhvW/49ZKHbabVBusNIvY/uDarh5hIDng4Hvc6vuHBbxZ73ba2leiv5mp5z+p5
         hO/w==
X-Forwarded-Encrypted: i=1; AJvYcCUpb/swaf8SeSlLLU2GyIsqmpw8MMJjfyrQdC2tpcVztaXlzNH4m3cg1aF/idlEJhOCC097qZ3142s7maOLVJ2H@lists.infradead.org
X-Gm-Message-State: AOJu0YzsJ6K/H+Ex+VPnz3qrnTm9nLA+Vmjl2mQA8dcXgHWdCFYNNUGX
	SyINiIPBxF/h62yFVqKmHIsT8phhhhrxL3dvrp9XYTl5WGFJnToYF54OZ46t0zD52E43Y4oHZZN
	+vGNP2fz+UqqxYYkNle8cZcYzfD73AJD+DDmeJWLQ57wOJuU+lUsnLvxr3+SuHEms+39/gVhlzW
	Egiw==
X-Gm-Gg: ATEYQzxVUAel33DAvBtRrxjXL7R54RpqmYYe6My6QGKGc7HqOL6szO7HbxFfsbmpZOU
	1+I1l1RQRwHGHWpH067J2MArTV4ypj0w5Lo7etiuf/rc5LoCAUoGWLRRx24Dasb5m+4V1PpNbdF
	RDhkzjYqWno0cTnWaO0sd84Mzq+ZOlflBtcomSPPq5Y0y/CHvCh9QcuiRHNoE3v3L4/fHn6KB3g
	uDp816gqBe/EtXf+6bJ+zQBElpYixTgraesHkY9cYFI9T1yBU+PP2mFTHAS85ysOn1xVihcckkw
	qdcPZvHG1o17STcIGJez7ddZeg3WFXJsHFtZzKskcTboN6mfpNaRp+rlqVDQyxe/KMb1rUx05Uv
	SIkPASz9JOJojR2mlbvrzahCdDuw=
X-Received: by 2002:ac8:5a43:0:b0:509:27e7:a060 with SMTP id d75a77b69052e-50b148ba4e4mr46678321cf.68.1773848401588;
        Wed, 18 Mar 2026 08:40:01 -0700 (PDT)
X-Received: by 2002:ac8:5a43:0:b0:509:27e7:a060 with SMTP id d75a77b69052e-50b148ba4e4mr46677791cf.68.1773848400901;
        Wed, 18 Mar 2026 08:40:00 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Anson Huang <anson.huang@nxp.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Bai Ping <ping.bai@nxp.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH] clk: imx8mq: Correct the CSI PHY sels
Date: Wed, 18 Mar 2026 17:39:34 +0200
Message-ID: <177384710707.3709943.7150219544572439117.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
References: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX8vbDjgWON93Z
 A5ZkDVWKHbtO3NtlL5xnAhGeuIaf731fGgNTsVSnKaTCBVRFaTUbi5IPzpI2oIC8upmHrRaUolI
 gL+zhT+/b+66XP9tI1zO+ASmLhPHn/sFrSWxl5CgEhi9OpP1wgiJEMBQnWOKOZoQB5Gp5mM0TVz
 rZr+Buv5g6po7IiXYg8jyUIHqvpTNjQcqOn8QOiOBuUS6YNPol4+az3YNJMt++jfk39ibpNERfD
 QDlwVvXQxSJh74bDQ9kr3S6u9zZ9fhcebs5LkPzekPm4NwEZLoV0TVURO/UP9Q+YAEfAn0mpCWc
 U6sNWXcKRGCGLn9bsGgCS4JFuBjoUbvndjaYVinIQ41JVqFEDbRs1+tag34TADkZbJhIrz9YzsG
 HHvA7DfCJiuM57G9UTjQw+9+gI9ICAmjXBYrJ0h8GLBUEhf2gNNmli/SHh321yz4RXlxJE9bB12
 sASWDgSORkkgwTc0eCw==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69bac752 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mLtdRAArnWS4-yPjVp4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: BZWSUxmCvIIQRndXEA_Wji7IlIqvKxWn
X-Proofpoint-GUID: BZWSUxmCvIIQRndXEA_Wji7IlIqvKxWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_084003_372019_30BDF8FE 
X-CRM114-Status: UNSURE (   9.79  )
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


On Wed, 28 Jan 2026 00:47:21 +0100, Sebastian Krzyszkowiak wrote:
> According to i.MX 8M Quad Reference Manual (Section 5.1.2 Table 5-1)
> MIPI_CSI1_PHY_REF_CLK_ROOT and MIPI_CSI2_PHY_REF_CLK_ROOT have
> SYSTEM_PLL2_DIV3 available as their second source, which corresponds
> to sys2_pll_333m rather than sys2_pll_125m.

Applied, thanks!

[1/1] clk: imx8mq: Correct the CSI PHY sels
      commit: 4219a54681d183a143009104967645cc252f1e30

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

