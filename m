Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4DEC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K81payB/ssmTCzPC25RG2gl9qwdhhPB6zdKyYaPSMA=; b=te7DP+B4cTz4XPGA9+TC4dimDN
	iWnw6GmUnGFbg4KLd2CwPD0NmqxB5xnCtNB1eRJn4qh3mFdwUnGKRnq0tUUjbCpVkEe3z3Ud98QnZ
	Dxaq7orN5B8gr5GQ+VoRxmDTHClT0659aO9Ofjh7Yv24njhWWLI2hmEiWuR5KtB2eZNy21U+jyNaj
	m7+NZNdcFonFUgtWfifxd5vPCi5Z7Tm2hbDOS4AUF9l/ASJGPCVd6zXuMXWFF6V4NpReRl4THJBFG
	dd8v8mj28UqFhd2DNwnsD9cuIYiD0UuoT5N1r04vQnlavaMxkLel2vsI3wVYHqtZsBenqswArpoM+
	iR7fm1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSlc-0000000G5UH-2vgo;
	Tue, 30 Jun 2026 07:20:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSla-0000000G5Sz-0VAP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:20:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CZXR1087713
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 07:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3K81payB/ssmTCzPC25RG2gl9qwdhhPB6zdKyYaPSMA=; b=WCt1s9gkySEZXdgB
	eQGrmZt2QpwpKzU6sgYaT7BGLzNL8hq9Nc/Cp83L2EENGpH/uhzY8NT7X8C6wOR2
	ZJor6BJQOymIMEQvbMPRcTJgDWxIUbqp3ZOXCKRRM4oZwPkjBVV+FbS9lJKTumxA
	0NVdk45Y9m1kFjxe9ihgb8U+SbPGfkx+x3ir32FXLm6WjNKsHhvSDYTscLCqcRW+
	c1cQfyVEl1MeXHBnIVgZFNWvEHxwOVFKjqAItnyR+8T15gw948+xFGbfjSmy2Q5s
	3ZM35zy61EewvOG6ZpllYxLZU5S2TOpqgUd3DNkdVjicsIICoYYVsgUTA/b4bnLM
	kY3tAw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qhace5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 07:20:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-138acbc0e69so19769622c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804019; x=1783408819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K81payB/ssmTCzPC25RG2gl9qwdhhPB6zdKyYaPSMA=;
        b=AKKOcqTDvdB0a9Vy3ItXzLMoH/hShmW31M2pmFGpuvsYaQpIUikiu79AooJB9lsRIM
         NBHPwf/9Ge2oW06omuiqamN/sHFrn7MOlFkbANE3i21F5Q5BnngGToAfu7bvfZ96A//g
         bGGIFtvmV5IE7otNdnjzF901GP1n3vfS152ehNAp42CuU//ZCLOEfivbU+5v8hATwS+/
         oQ9XfnM4/YXbtMvVjSEtVmjk7ISdT8K/3JwUeGWwQBzKlsPHGtm8h8QTwCXl8Hgr9yX0
         jdBeDMdpE3QO1KBBmLcYrxa+xAgfwz8m+gwMYcbnEaTYznVJi8SrMaCJ0IFYKYhjdAS/
         Ov8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804019; x=1783408819;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3K81payB/ssmTCzPC25RG2gl9qwdhhPB6zdKyYaPSMA=;
        b=pYfY0B9vRCmPalPz254DNiLHW7NUoF3MK3vf97JMFB47wm5pwMlXc7igIJUmy1nAzn
         zIR9ZdH050TB9X/ciIioLa9ML9adAudJAZMzPjdlqg0H5ES9pO7JIqskX5yaZYDmT6UL
         c+qdRx54pSvYCPtEAfPVchMyfd14vLKEKBrpSLKoTOiRcK1jCNbrm8o3VmaBgMgRBOFP
         N3A318bSfdyGRDdQOBAvDYZ1+YUVlNUePyNbDaYMBR/ZX5qin1ggR9vVXeoXAlhKGxbF
         QuvXWP0obR0BjQ3mMg06fBZFusIzLZgfmxlUZKWXg/Fza1+53ZoRmzLLqbQbJL9GjwUi
         5+qA==
X-Forwarded-Encrypted: i=1; AHgh+RroIlD685WCfFkrJjK6Nat6smrWH/ra12wRml/quz1bMsr16rZifESM1piAzowi2lc/cLsYp74QXh27tzrPvUe5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu5vfl5VxWm8B9IxN0G4bIE4z2xImNGJ23d7z6DC01Upy/t8vj
	qvV70XrhcK5WBmuYHLDUlgf8ms/NAWZCYrClnlF6Q7AsBfYMBxpYsmJxNF85evAu1C5dSsbZDui
	TBcXkPYi/9ar2wzKqtClSzM/ClKKlThLQSqkEZRXqQsfxSSMHCiEp4rKyAIKKHtRBJ13FUm9ajD
	Y4Yg==
X-Gm-Gg: AfdE7cmaFfhp8x3kaB5nYG1crBcvq6XV3nD0CmumRYdIk68zzbT76tBQ9i7kLeDxl7U
	+qPqelS8H5PwxKenza5664xPjSE+sGUBUUNfARNbl/yA9Be2o9nk37+voWIZoyEfIfz5E5E86gV
	WJGTwVpLNcbvCD4BhJz1S/bfwqAQlYya/WsqfFxiriJy6xasLS654xklQkyrmo9BL2q7sSD/Z5W
	bUQg2MvVVbymkZY39ZGS/UxRMZ+NjcveNbUIuLYHedJeLYqNQxipm4S9SnEc3EcuIX0a95pduJJ
	o5MPEw/BdHpuut0eF8Fn2FQKU8tDGNX96UAhkEEVb6kled5+nAuqY+MNZgOxGcoux192Hq4mwYj
	3RVow1IcOM0CorW9p63OGSkYKynDo
X-Received: by 2002:a05:7301:4888:b0:30b:c502:23df with SMTP id 5a478bee46e88-30ee1211bfemr2036168eec.13.1782804019301;
        Tue, 30 Jun 2026 00:20:19 -0700 (PDT)
X-Received: by 2002:a05:7301:4888:b0:30b:c502:23df with SMTP id 5a478bee46e88-30ee1211bfemr2036126eec.13.1782804018618;
        Tue, 30 Jun 2026 00:20:18 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.202.7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fbe011sm4857374eec.9.2026.06.30.00.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:20:18 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com,
        bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, will@kernel.org,
        "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        sherry.sun@nxp.com
In-Reply-To: <20260525065443.2338629-1-sherry.sun@oss.nxp.com>
References: <20260525065443.2338629-1-sherry.sun@oss.nxp.com>
Subject: Re: [PATCH V2 0/2] PCI: imx6: Improve PERST# fallback logic
Message-Id: <178280401285.286395.10401291228239552702.b4-ty@b4>
Date: Tue, 30 Jun 2026 09:20:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: S4zUS7y0c66mlfTfZZCt6ffYT3cFliHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MiBTYWx0ZWRfX/ifTxdUKOm5t
 68L5Pn+I6tEvegk+JeZiG/WUke5Pq3orallY3KswOBxJ+yo4MPvdA7IZhX3c9jnCfI3mdr3ENxq
 LLGFKpL3TWDCU9AdJ85pqz2cbbG+ZdEqPdTfrNvVLCEO6eQGGj8B4vkmdwXfcnGEyiPCzJHrYE3
 fge2mbXMzvajp07h82dDbSZn8PxKL17jRWT7dH1W0/RqJrsDkPEacgFfSUjbFFojlWrdHqom2G1
 EDYvc7a+xnqhSHfd8pzgOdNfqHdU4KeIXiWG0/fb05hpaFn5dnDEhoUkok5XgSu6EhxdkFf1gxL
 QOiGrsKwiD7NUZKyWqH0l3gKBXx6bYBGxt4Oab/dXECIWIdjDNjN+0QC+lPpql2HkriVjkB08HS
 ZGRCF+ZWRJ4l6tt6Ynmc4+fqc8o/rSmR7kO579301ib0hcdevs0v+0hnzl54VCvhNQwVIH8Bv1r
 pEzHgydTRUvDB1WR/Tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MiBTYWx0ZWRfXzc2iDlPmKh7X
 XWYcGJl2/JumOf0/h6X7BN6gTlkMM16lJQc2am3dyUowvSVnuhe8BVwsqq9sviNkYcA6XO1mqT9
 Jp+uRcPeKg6R6cVXZrzrC5lUr48q4GI=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a436e34 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=d0NiXODO0fVjScRmrPHHeg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8AirrxEcAAAA:8 a=tFJ3_42GrAp6gSAKR0AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: S4zUS7y0c66mlfTfZZCt6ffYT3cFliHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_002022_276905_F7B3E05B 
X-CRM114-Status: GOOD (  10.04  )
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


On Mon, 25 May 2026 14:54:41 +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> The pci_host_common_parse_port() shouldn't decide whether to fall back
> to the legacy RC-level binding by checking for "reset-gpios/reset-gpio"
> properties on the RC node and returning -ENODEV. That's a policy
> decision belongs to the caller, not this common helper.
> 
> [...]

Applied, thanks!

[1/2] PCI: host-generic: Simplify return value handling in pci_host_common_parse_port(s)
      commit: 4b523544008aa70cda4b34c0589bbe47172c2637
[2/2] PCI: imx6: Add imx_pcie_perst_found() to inspect the parsed result
      (no commit info)

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



