Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C6410A88D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fg9vq1NSbflBQy9gaZali+s+bMitFkQSj4SmPdzwvoc=; b=ubll6PfE0kM4qki2jSrIYg0LOT
	Nw11hzJI29cSUBwKEoEc7xW2XuKbVK2TsO06plHqWborP1IVXY4bZc2h0br8+dGsUIO937dYbjLRh
	yfCjAWsi9scTOrN6CYOsi5TBbUxClqNh4spSJTevXyQXfA73iUeCZBfupTivp6TwyqMQ37GejfaRT
	/Jhaq+yyAY9wFIblPqEvz7XrSKG01e+nMUUDMZbUhqZ74wC5BjON7HdmELgQYpLdny3FNx8HyzDR8
	f759L3SCjl9s7Iu27dnZ83/QEA3iueBZNE/2VGP3yO2C6bD4C+KP/YGzZ8f+IKtJ2z3HehNhZv6T5
	cXITplNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nxQ-00000005tXw-3Ght;
	Thu, 26 Mar 2026 16:53:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nxM-00000005tXZ-48s3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 16:53:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9mLn2877648
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 16:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fg9vq1NSbflBQy9gaZali+s+bMitFkQSj4SmPdzwvoc=; b=PFnsfTfs6oJ5S1at
	mIrYfJRqq+Skz3Httf6QVckjDdKrcQ8E6KVGx1Wn/Ea6ebujOjTzswIZAtcu5tdN
	zcsIZftZ0cUN1zv4QSM8o9fgqsylETavI24SNdrcYVrxihmcgkD8HeWuq1Snm07n
	K6LIRxu4COIzJy9fAsU7vk2dg2rVfvA1iOshfn5T2+/lU51JQoPeQm26XxB8GggG
	5jaAzHGlmtYaypbYEl3dJxmuhuoybAZsyCjVj/1N7PZOycky66I8bVOcAaeW9lyW
	FsjstywPg4lUJPCYGProEuxjxzeUciMFftCbQhWgIkDBnjUTQCKrKPCJ6L4BLbx/
	XTdstw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q093rwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 16:53:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b079b4a8c3so37989595ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 09:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774543995; x=1775148795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fg9vq1NSbflBQy9gaZali+s+bMitFkQSj4SmPdzwvoc=;
        b=egH4Lo27vJn8mRmmqveh8LeM/q4t8H/xAG5XNrTiL0DwZE8nah0sKxMQI6bf5FStNO
         21LsNGHWjdKzPoJ+bg9XxNsyOGt2cuJy3tnHhF687btyjNLDjge7CsYuVqjUsfrAtPCS
         XZQrbI258z3gYBVG/b8kJSVE4AL7HkLPTsQO/28fTdwp1zsgIlqW+wcBGyw/xFtFCP1T
         JuV7TGxb7NGqwhYt8tkxt+SejPmeypdmshGcrtiBNzNstAMaP7hOpmsEwz1Lnl/Gsjy/
         7946jQFIMgyfglR7+riS9iU+CNLfM6X+p1rck/wbnUweGdX5Q7OnbxCgkkfYS2QVXZ3M
         DbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774543995; x=1775148795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fg9vq1NSbflBQy9gaZali+s+bMitFkQSj4SmPdzwvoc=;
        b=XI1ZmLcgGBJUSUilLkBIMeLclgCBNjKqJF6XaSRoiA8ao2ZgUC+RW6J7GyeIOvzEJm
         5wBkPslXbZH9Ojb9X2yLkxH0pkiKhqfz1rBC93C+aMkzzFOQZ3BIzY1datKf6ze9rTMd
         3pXauIvG4FcKnRmXcBOqb8AiQUEq2F4L1RoH9AmQXW0Gdx5X5EuShvfzfQvy14FGdzGu
         5sx5LMRL8Itl9tCHLQx6asGD80fBP6fiBsjaOjZd7wgrj6DAUs6QP6aJkeDzevw22tAt
         JCQ02VgQSow/IwbsNidUHB+kDl3YLVL4O869blBcj8CY7tvrkcSUwY7OPbXpXyIfnqYV
         vnuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnQZk7sv/7+AjWduSNIC//qNfcLULpnpiLNMiUIpQQsfxwg80XFKV06I/YjeWnIL/DUNpPSuJGpOJPL1ye8gv4@lists.infradead.org
X-Gm-Message-State: AOJu0YypfN/fKQI5CDO4/ScN4k8R7bfru+ba2F2TK89frSWvHOhCA3Vq
	LXFFnSanL41t1OYf4mPThxU+5zGDS9IeHacL3/gvOcFTuwZha4SEXzCAFRrEPt0S65ivPX6QP0x
	DitgYkdzFUd3gxTHEIS8Domc1xUQl6mdBDxxBSKpj9WjlHv3JJAVN1zjEW0GnIw9x1WJLAThrsl
	NO/w==
X-Gm-Gg: ATEYQzxcfE0Lufdt9/uCEZM8JRcrDgVAQdist7Iag2rVX0jL90eXnCdI3T08IC2GWoW
	SOmnWMdLXL5TmO6yPKfq5kkMnDOziA5j8u429OOrJ8Tpr20MvkJ/Pl3i5inVrXdAeYl0XjCHc3U
	z4D0T6yz3EYIxV+9dU/L6Tm5tSGo4WwHlwFwq6qRGT/Y6SNyyKkkSaglLlt5JyaIyw3PwgFQvnE
	I9QqbdAxn53eyP1XgYe3zy/8jr7Y10+Xegi9tovjguXasyX76Wv4FdvtwqkJJsxaH2kynpkHSR0
	YbkDWR9dtsSziOxRQ1jYqj7pX1UrKbpXfIrACf3EwyUos6EbwfjklFlbGumX0TXVaDiCex4Siuz
	PsWU4v1LS2183LxWuae/l7eQ=
X-Received: by 2002:a17:903:3884:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b0b0987e22mr93048305ad.2.1774543994685;
        Thu, 26 Mar 2026 09:53:14 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b0b0987e22mr93047995ad.2.1774543994189;
        Thu, 26 Mar 2026 09:53:14 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7bbe57sm47090225ad.34.2026.03.26.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:53:13 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20260228080925.1558395-1-hongxing.zhu@nxp.com>
References: <20260228080925.1558395-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v1] PCI: imx6: Skip waiting for L2/L3 Ready on i.MX6SX
Message-Id: <177454398920.452566.5271838432728945617.b4-ty@b4>
Date: Thu, 26 Mar 2026 22:23:09 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c5647b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=rcZeYksTzYAZqbyAQKQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: q_aCYpT09Nq2gCA9c6WsaxswryOKqTao
X-Proofpoint-ORIG-GUID: q_aCYpT09Nq2gCA9c6WsaxswryOKqTao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyMCBTYWx0ZWRfX9YfVGcHt3dog
 IuNRBFTtl3JW+jJZElX6iuaIL5CfwGGBwuP4ewhcpiDPMHQC9BCej3FGQbn1kLStTDyjAJVlpc/
 04RzYL0IvQaROpXADzTQiSvGJsXaEmj8oWp4/p3zBZfZHOnMvvCAAx716dkDlQQztVRIs0VBRwv
 q7Y5yaj8osWlosvCCNPaJ3RrMgxIERP3VGJCRk6yWdIwe7LEHUP1Z/IpjruWWGnVsD4uPPYx/g0
 MxykqsHD60KNCKpvgbvuFbdzhWlsN+zKZ0RGutbmBrW25iJvY58vOGG0gKKpioJTZKKLC0spN/B
 m9jlZMX51DGADxQsC6q1JAMZjT0vdDbqeLNrgt2Uacn7yJhBmCQizaBHO0M9/bwY52RgKDlDZV8
 FaZamKvKpnBLp0GAh7H0Q1dcUPETrkV0xYJxHgobawmpvfOweP2ShKAMRLoAs64jkS8FaoJ/ikD
 bS5bNsPY1m7Pus0PVWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_095317_056432_FB8550DC 
X-CRM114-Status: GOOD (  10.92  )
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


On Sat, 28 Feb 2026 16:09:25 +0800, Richard Zhu wrote:
> On i.MX6SX, the LTSSM registers become inaccessible after the
> PME_Turn_Off message is sent to the link. This prevents verification
> of whether the link has successfully entered the L2/L3 Ready state.
> 
> Add a new flag 'IMX_PCIE_FLAG_SKIP_L23_READY' to skip the L2/L3 Ready
> state check specifically for i.MX6SX PCIe controllers.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Skip waiting for L2/L3 Ready on i.MX6SX
      commit: 5f73cf1db829c21b7fd44a8d2587cd395b1b2d76

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


