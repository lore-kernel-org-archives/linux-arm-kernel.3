Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF26EC143A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snhnMYJDQkat9qXJwHdTGT4j0E3K9+24fQ/tGb/FHwE=; b=yfDtvsC4id9phQObXFK/tlOuEM
	UZDjqPe9mQ31lI/6nXW7FAeyxc09Y/Xe2gd7XgKVk0BcB1OpO2dcUfXDBIFNWVUgfkWx3mKNvFNsg
	w/X2HD+/Xr2XI1xwjX3Xou4pvJT4diYUVwpclLczfcxATLRsP4VEOYIpya4EHHPk8+rgBD2pebUQV
	3CkOCadwDso5ezMCCaLbIVex9oQCNqMmOetAu4dUGcYtEb8W9NHS3L5jAOF+WgCBQ/tORh/Et2RCt
	8018kU8WgqXHabwakKl6aGcQtQalHQXuF1HdaeJ6reIwa831fNHRcvH8fvMNDyv1YJ1w0P6rkMJzU
	xU08rHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPXO-0000000FCJt-0jVX;
	Tue, 03 Mar 2026 13:11:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPXK-0000000FCJ4-2x8F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:11:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n8WT2630018
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Mar 2026 13:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=snhnMYJDQkat9qXJwHdTGT4j
	0E3K9+24fQ/tGb/FHwE=; b=kalYhP+Ltoz84W/vWpoW3Ii5QCbGAfW/QxzwlkqT
	0llIux2NAdG/Lf8YjRtWyP/7DsUZFv6+ZMDvvxiJ0wWmFChR/GLxvaoAF4QGzyfw
	wQ6oHsOsCh12Tpt97Y4wG85YP4Kqgci4U0wLYuYK6hjj6OXSWDLHuJPTOFZlbody
	YUzJ/gifjsdCS9xx0Kmh1fSVttTEpFYg0nfI+BGjuuCZczSHt/UBePVHf9zEfr2y
	pCqIAH43GGnudV9Qt4k4gwLtYbZZVZZnxRpP+O5ZUItZK2NAp4ctxtooDyGisZj+
	bG2C2oPJNe3bnh9Sq/g7kCRnM69I1vrwVnEfAOTUtV7d9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5awbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 13:11:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so3581165785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543501; x=1773148301; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snhnMYJDQkat9qXJwHdTGT4j0E3K9+24fQ/tGb/FHwE=;
        b=F05nQNBXjMenrOPNgJISp/8/fuQ+Gh2UZsEWI8ipdM5amOsKyNvLmuFvtYXJLGuXUr
         MdEEMXgZSN7Z36ZLQIdSrdpW1B2T7oN/SXSkryFBhjUAET7itdNrSldLE1Ox6bTgqcpx
         sM8nrSlmRPCK2bF/atvXDfV5xyXlv/BQrOKrk6PTd8BQAvU/Ayt0tLsBjq+FftxtwXds
         o/xz/7TdRfdLdpY3e1XhFVNJMyJyDoE6ypjtqdoqIb3NTD0jFMXdP1xlPHYE9uqJhzS6
         OM8X/pmzdFrkza0i14tnlM5nju5FwFJky3DuhrwEL7JnFrIi2pD+9klC8zwHu4n3uKln
         z4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543501; x=1773148301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snhnMYJDQkat9qXJwHdTGT4j0E3K9+24fQ/tGb/FHwE=;
        b=nBSL2iALPJecVYSMYDJYpDMq9Iu1nPInaa5itsAZ4K7A5Ufnjf0qDonHZfuXtGsSM9
         bznuVqsmD0/V9kgh0wtqrwmrFqgmlKRgS+GI4HP5Uxl7K/2UCOUU2x0J/VnR9LIxMw2k
         cbiQW40pEEvY865WNFdD/v2tEvxf51VQwynKxyX3a/XmHx5vyjVH5nb3Bg8ClVSQmxcN
         NMHJ9QQKyG5BE9ngOaYxHDNsWSCei2Pyk44xINHj4K9HFalWW6gYSflT3MbavX0cS00i
         db+8CIWdcO+8wYCaNUCVfPJptsx93/L1p88vcFREsP8eDrXQSyxQrIOF5aVsPKKPFwl9
         qRyg==
X-Forwarded-Encrypted: i=1; AJvYcCULBOeRqu1vgCzagyyHhaKwj2BAaK41pvzfUpLByo5dBd75KfjTbk7+mQ2V7zM49IunDSssr8IwFPyW/ExcwHyv@lists.infradead.org
X-Gm-Message-State: AOJu0YxukkfMl+UKppycSLwcoG/QaPWSCQHrNBIu21SQ+vyZtKfawNS4
	whjfGMG9HkM06Ud9Xnkp18cTdYGoulshthtAiLjCwSg/HzwXUVGAPXohvq8vlgFojqHnNmVYWAw
	vZCzbBHPnVo9mtaEZryoNzW62yORGgBKss8ezYm+z2a1vSmPGYGKHyUr0q4OBHDPYRY4FzYkAU8
	uSgA==
X-Gm-Gg: ATEYQzy+uYF+ALwZ4S/CY/Qv2aXnzkFW2a/pemzHdEIo6nEuEMaY/zpEBr4ZDeGSvoA
	IxL2mIf0ghzabCN9npqpRtVAKZ9C1I3r1W3rWxNkErHFDh/wGYf8BDOSC1MEkJRwmRGcofy5zMv
	dwLRK2Ua6qAcwtFuKvCNP0eKQUWiBd5NldTudrlDWW/cU+NtEmD1K9a4gENgp/0RRyojWCDUKaA
	QdpChTOWfHLMx/hF4E/ey7E50kxPcMl7+yCeE0WZp5USvj4iJ+eQ9fkMwMWpXxmGqYl7j5owyaA
	fG7v30pjDj5eu8ySbTTu/T7v4lXiHBG7aRfoRaCoSh9SKjtgw7pXkGszgsMIGgAfu8lHiHdo1hr
	SIWeMXgKYbDn+06cw50F2Acxe7Cprxr09sYUd
X-Received: by 2002:a05:620a:1706:b0:8ca:2cf9:819d with SMTP id af79cd13be357-8cbc8d9a85amr2048340585a.26.1772543500777;
        Tue, 03 Mar 2026 05:11:40 -0800 (PST)
X-Received: by 2002:a05:620a:1706:b0:8ca:2cf9:819d with SMTP id af79cd13be357-8cbc8d9a85amr2048333885a.26.1772543500109;
        Tue, 03 Mar 2026 05:11:40 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ebsm16384845e9.1.2026.03.03.05.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:11:38 -0800 (PST)
Date: Tue, 3 Mar 2026 15:11:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related
 CHECK_DTBS warnings
Message-ID: <56f6t2u5peqndhfwxubvhcksusrgkxpqd5woz3i46gpl3q7vc2@5ykg5q6acn5a>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
 <aaYKUC7pWjS1Xnpd@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaYKUC7pWjS1Xnpd@lizhi-Precision-Tower-5810>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNCBTYWx0ZWRfX2YYJDwO5KwB2
 GoLM5TS4Wf6iyRv4RQXDxWMePBQJDzFEpVgca5od0YUvtf18/C5TFNcOPoUPJgPKB4tI0hIxGd6
 eH5Pfg/s1AopbqoH6nJWteIHWitFcXAvYSRAwVlsQ3s0HUkIBR97iHR+EcGl3L6Ti/v5m4kBFzk
 PNWTuHjKWiI7p9SB31VdVNF34EWW9V74D2xiDNZjUo0aT5aU21DgdZFFBujPolH7wPYpu5fs1fM
 +nrK7jxzba3Dvj/FxL8h6QOGu5Mq9SN1K4ZfmZKorLVixUBPHZqYLEQvR3VQ9kH9oqWMKkUdPuY
 tApvPBbDHdr41YGV293gbC9l7iUdMe7QHhjpfZ5BQbLNOY+lpXRvk8LswOl9+hOw9wAgN/VSpqC
 fTTXL/lfugYGJFY6qErLu+hS1WqnoKyLX+5y/uAYOa4bshB/O+nqsBgE91GeG+YtmdOx4RzNe6U
 b2bHbERErkpeuuzOZug==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6de0d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8AirrxEcAAAA:8 a=poxx6UPob8T2UUUd9QAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: uydfo0unWnVRpTYPFVxtfOTo95r5nB8q
X-Proofpoint-ORIG-GUID: uydfo0unWnVRpTYPFVxtfOTo95r5nB8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_051142_862223_3E80BB84 
X-CRM114-Status: GOOD (  14.34  )
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

On 26-03-02 17:08:16, Frank Li wrote:
> On Wed, Jan 21, 2026 at 01:04:14PM -0500, Frank Li wrote:
> > cleanup imx6/7 CCM related CHECK_DTBS warnings
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> Abel Vesa:
> 
> 	Can you help pick binding part?  So I can start pick dts part.

Done.

Thanks.

