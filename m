Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE615C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOyhAyJean9v6TArWBMXk170pLL8aIuulxfnWIj6u5I=; b=LGZhX9CaCRHwhvoshQFsFQTe5u
	RR4b/3nNR5zpJl4wSecikSGco3hYjfLlvLKIL/Pw4GbhVmFUk3aKJ0eLo6fax0u5ckI+I/Q1KhevX
	Ai9sCPEW7neZuvoqoVwoq6SnHxuYdkFdBH7FpuGIH2vmbDLBBvGe+KCrf+5FsZO2o2zy3iWLD3+rB
	WmOZUUaKIse37cqfnjg0GGTM46Ei152OIzpXjKM3gSsdxw6DCafKuwocNXrnvTQaWY3OxAwUV3gPx
	7y4nCMaEF3M96ym653e50Wm4hmscoLI2cK2UVr90wIKdlvW9WjHTsC6HEbrmAetCVCL4wGN2jqlqt
	IJ37tuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxZ-00000000SH5-2KhX;
	Thu, 03 Sep 2026 19:18:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxV-00000000SBJ-1fuE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:18:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3GtT417619;
	Thu, 3 Sep 2026 19:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOyhAyJean9v6TArWBMXk170pLL8aIuulxfnWIj6u5I=; b=e8CEzgqRUg56oHsP
	WzN55M7sLeDY7hJdfPPyj8U7Mzb/Wx13fF07HdQhDlEL1lRhwH5DhAaqYqgaaeOe
	yGbp6BRdpKOPAL409b8gWfzophnj13aWlq5IX76riDCX3aIrT1PvdFQu7c+E+5fn
	4VxprZO2LijI7fSEw87pMeK3zqcy+i8Ifigoqjj9rUqmUsKX2BprCQzFCbiy042V
	4ZQCd7Fv0Zinxlf4J7dNIMNO2q8VJqbAz89HD73FaV/g2hbu3bURcWatIhmd/WZ+
	Qkshm4NWirswnpg5bkE25dRMQJPiViO5MM3A+dZ4J7/1RXqKftc3LATi0/KwmYUS
	7OA6fA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m319y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:36 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 683JGuLt3230275;
	Thu, 3 Sep 2026 19:18:36 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 683JIZQh3232777
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:35 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 7314624DD1;
	Thu,  3 Sep 2026 12:18:35 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 12/13] PCI/ATS: Export pci_enable_pri() and
 pci_reset_pri()
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
        bhelgaas@google.com, praan@google.com, kevin.tian@intel.com,
        kees@kernel.org, smostafa@google.com, baolu.lu@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
        bbiber@nvidia.com, harsha.v@oss.qualcomm.com
In-Reply-To: <8076427d234c9a4dab4ddf3da3737c61d02c1230.1788222486.git.nicolinc@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
 <8076427d234c9a4dab4ddf3da3737c61d02c1230.1788222486.git.nicolinc@nvidia.com>
Date: Thu, 03 Sep 2026 12:18:33 -0700
Message-Id: <178846311320.1308030.14209114570392271213.b4-review@b4>
X-Mailer: b4 0.16.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: Z51InRXKQH3lhTF651XRHYYEq7UVM88i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfXwl4PUibcBPM0
 pBN2BpkH222dpLZq5iFabBJgdFYX05ESf7VfKsW9kYqj9OGaROGBUmeD3zGnASfIlMaFjiKTJSh
 +QqVS5KHjfWwFu90jn3JE1XJyC7dD/KtFxOUsluihElXXSv7dhu75ahRpKgQbir+/mgNvRoOosk
 Wm74W6wqj9FfmeapOmaOaC8tC9oaUA8M6LZbNy1WwZoil/3O99xr9B8IrEUl7+FQWc5bZ8WdIf3
 5CzWaylXGqi8JhVJcyGtbjH+JNAcIgRs1ZtaKUYWx2sMJU+8wSrYMqfY263tTqDrPYuYg8S9Jeb
 ug0calStgyVRfOkjKwbGGg+l46KQNfs+vhf9iJVc4IKhUMAk/qk7DnTrUVqrK7qohBwG9AjkkKd
 rAAg1X+JMhdc5P1e1/46tqc2+MdITEX8wKFr7y3eaRTgwVovcQPOxwhOzdOY25L3eWPLU8RlXCN
 HYhYExbDdrxwKigck6Q==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99c80c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=1XWaLZrsAAAA:8 a=QyXUC8HyAAAA:8 a=Ikd4Dj_1AAAA:8
 a=EUspDBNiAAAA:8 a=tXmE7SF2LxnnnbDZAYUA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfXxoOMgcVb0Gm7
 TgHDlBTVt+NIaWmLUFZw99SRiIqKF27s7LwV8FBu+/i9bQZZoCSY+vxHjAdYh5LtJotlFiftyrL
 jZznODYOhMUaOLeIdc2ULL3Q9tqAENo=
X-Proofpoint-ORIG-GUID: Z51InRXKQH3lhTF651XRHYYEq7UVM88i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_121849_459771_C0BF678E 
X-CRM114-Status: UNSURE (   9.72  )
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

> Export pci_enable_pri() and pci_reset_pri() so the SMMUv3 driver, which is
> tristate, can use them from its probe path when built as a module.
> 
> Link: https://lore.kernel.org/iommu/20201112125519.3987595-9-jean-philippe@linaro.org/
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> [nicolinc: drop stale or already-exported APIs]
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

