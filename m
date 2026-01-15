Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2EDD46624
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=; b=X8ImJw+OyxNKkDWrKdDbbx9A8K
	Vc0oHQeGG/WueIRu/v9SoFENOyA+acUx9+n6gC0oLHL37ka2vyZX1+ZXqnFylnpH3bl6TMh4ngEH9
	IqNI0hywYODBobc6jvcL++3luOax+gFX5ahvqRB1JZjqqxjGRnKC6HvMCNLitUCvfHByEUaoOTpxZ
	q/zgVj+GeMRf1CSZh9mYgKJF81gOKlwyJ/vGjtGrQm+UuHvnaZcdY4eKqf16TaAAZeF5OgCFZg3OA
	KPNjA5x5CDaGSJjAO7TxNXVpH0/jKmDfO2uaKXuo5EKTOpb0LEcUVf3c93BPag6ddaQiZxNqXGeo2
	qeYLSyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUXj-0000000DCOb-1rLc;
	Thu, 15 Jan 2026 21:06:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUXb-0000000DCLz-0nJL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 21:06:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYIVs3113515
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 21:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=; b=lFICF+gaABVgQTny
	N/CiKxWb1HRqPSpBiUY9iRo2lmE6IzZibGEYqfLQNY+mAFZseKhMfediFFwC6x/U
	4ZS5tjZe1iIm0fIkb4VkSczBGG0hNvtOvEKBEgzRsQu1dQVKH7MHhRxMIFBH7Omj
	xBDqgDDnfiChreRxc8NZjeC1HeZA9KtpRaBnZZOVfiZe+xDUCo2kTd+z2WYKnAfG
	fUF6ntjUWGnCHOyuyqO0RANhClTnoNr75JIxSLphHj1a26mm40v1mD+SDkteSMxQ
	7nvyFlwPbe64LQPX5qjG79mtprbsYzIx5QNDM3EpBn9qm5c2cNZ6T9vqOImUKSoP
	Cybj1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq2pm11vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 21:06:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52bb3ac7bso241581585a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 13:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511162; x=1769115962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=;
        b=LKv0f8IAc1/24n1xTGauFs+qLWDyjvHoaWAlor+HLVKWwWB8zEXcSD66qkLMfEc7gc
         w2m4WzMp0WACMSQU8565HKWtiF0BTEym8PyBPyn/dlr4T7ohLIutOats4j5s2/CqONkK
         jk4QD1JPkUs9B+ImgfQ93tNMkfYikKele5IjqU/45KBknYDcveWhUDAX34q+Q694wiJG
         vDQtWezWHLefMISvfkh1N734Z0OVzbJuuQ6pJGpMja89TnhT5LgRPHftt4a71fTHmKQe
         va/P2s6U5n9vU+aKqv8/HdfkcDZDi/rFXpiOO2AOGQr+OsV87b99QljHPhyw6z5aD7H+
         YfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511162; x=1769115962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=;
        b=uYdHi7zZnNa2izgcWtDpCWQR4v1rD9cF8Qf6pbvZ1JBBKlSoUFEklJns5+1myvM6xp
         E/WU9HoffaYyw1uCufh4nga1/4QTtv0WEzuIN4ecm6+1cY6qEvSfIhmbFoEz+nrTWmyi
         ZGc3MMkGKMKUbx2w1hTN2XE16yhp/Y/wuwN8HvjksXN2eWmRYWnrqrhvNM38vkU21hE0
         CTEgjEWwUb/IbYMwrRIMX6sTc5gx6XCPcbEKIvh1aHpzeycFY8nzPSSs++q22rOqZWdt
         WjIBW1zJfph/tEQQuwTJrnOjSW+PEvCbm8SGQPg4A4YXQLTVqN/Let9iR/HYyo/WAO8E
         UYrw==
X-Forwarded-Encrypted: i=1; AJvYcCV8nWMZe4ZsviirZDkCF6cOfwtqefrNCsVwZaNSodD6xLgWTj373MXso7KRQXSnmLX2caDbFcmsrtP6S+crU2dO@lists.infradead.org
X-Gm-Message-State: AOJu0YxPf8QxPrQn8pF88ig0QT/8FlPclUrY7agx90ghGDtMgsf0smUC
	V0KTxPk2FnxztCiZ/1agP7+q8JeD4fSqh1P9OLffbXUNnF0x3lL1kJq/KWLODJ6s8NLo94t769b
	odv9IWgdyy0DuDlR+ohgLExk9Z3W0j1gYEe6U4uakYHweBAruX+cXWG68kq0BthhYwsJ0et+Co0
	crFg==
X-Gm-Gg: AY/fxX6lv/UmXChGlFwdnEukQfgf+DD1HtoMToFobEobuen4cWeYEOya6d7nYQN28B4
	PLGpXBdTmDk6xGNxuEYXgReCHsO/bJesGGPHcmddbNu86iQzuV0ZVSbnrP2X/qPQmJbQAND5e9D
	9fHdHlpees5HC2MtO8xhqLntRFbCa59CEMJDEQNQhbv8O4gElKR+MrTQu8DEt2E3d/b5jM7X2ui
	Cav1ogEuOVymSOBh/Ow7ydeO4I09Auuh/QXynAJNYKN82yIyZOMsjSnjxpo7B1vwe0qCIc5A/gj
	A9Nwyu2R7/ScdHpyPy9/u6ml2RphpFYVTQ7+p13fRN1Q3UP2Y0SBUsG/44/O+rpeuZQUiq7N/VB
	X1CZHJ97OfsqPlYCJs6AY3+zihcTSyJm3Px5vhS5BN7EhGdECzaTEOLF1NddPkJE5xjFD6YEbnj
	95b3ac7HvTwV7J3nYG/R9eenQ=
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr110001185a.55.1768511161650;
        Thu, 15 Jan 2026 13:06:01 -0800 (PST)
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr109997185a.55.1768511161128;
        Thu, 15 Jan 2026 13:06:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: Re: [PATCH v2 0/3] Enable mdss1 Display Port for Qualcomm lemans-ride platform
Date: Thu, 15 Jan 2026 23:05:56 +0200
Message-ID: <176851111168.3933955.1978286766565229688.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MvgcIyFlj_PRZ99mHK3u6mvAtHrwRDi7
X-Authority-Analysis: v=2.4 cv=TNlIilla c=1 sm=1 tr=0 ts=696956ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=aXzuBbYBWOr-X92n1-oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: MvgcIyFlj_PRZ99mHK3u6mvAtHrwRDi7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX+ldhS8B3jRP2
 XCeAheHB03yEX6j+ek4vona4cZ9+OzZD+3+oCOCiOBjnjtnl9KbYEpNz5MzAwJWPAySNA04E5tt
 9cM38+37c+sDsm47L9jV6Lx5WScoaXBJitFWNxmHw67O8GMMhmsId4wR49ylR9/kwCGwjlWnoAy
 PffjR7r/7TZA+MWU9t6Hg/0CSOIbRb3rX8yQ+BQGDD/qYEf7hG4BWkACCGVJHg1C+/Qud/dRpU/
 +PHlO1zom0xqBfUYyfaw1yART2N5C9J4RcMEU2/cBulC2A14SLTDytWFahoWxBFh+qjVIaOLpiC
 /56PvTxVvDoxQmxsieb4Xs7dymH5iwWYsVbT+yGfknbMUu2RrjQ/u1U5fh+bY5M+1KC6tKScdNi
 FZPXtyW7roZ9SQEiFaxtL/dtr4Ef1CCMxv9MUL3XuaHFLDEhkrXZgX2BsBHObgy8flZY7eK6hqR
 RNqpuv88PdbSfXLIjLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_130604_887590_E5CAC5A0 
X-CRM114-Status: GOOD (  11.44  )
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

On Tue, 25 Nov 2025 16:26:19 +0530, Mani Chandana Ballary Kuntumalla wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
> lemans-ride platform.
> 

Applied to msm-next, thanks!

[1/3] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1338e8ae4084

Best regards,
-- 
With best wishes
Dmitry



