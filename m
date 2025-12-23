Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21591E6F08A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ffbG6iJcP+z5d4xqhzCeKpZMxj2hNcge9Gry8DMjRg=; b=odIok5/oyDffmr3sTTV0mF5fvV
	znf5SMBmCnxFmEQm+KTqgDpIk+DAmsHqHFWIunoBHMwI2rU7IEe0uz3nwjhHsfmzW2jy1PqNXW3q9
	7DvqpXkrYLSSOoY7DCh9u9/cG+CcU3xS2dqFS9V8PX6furrsjy5VQBANuyyw4/5flGLQfw4M8d4HI
	64NsVWkD3cUKNUSkFcZS+I5RhkTSUC5nUIlxX5B8BIzuO4Tboi/TgfwrWsplcNHW71FHj863fupjF
	qAli1GEuhIIir6StMYW8zCII73sX3PlWzVv9MYRl2LARX2JFo6Ydo1M4+gNOOwxcRENcT/R2i1ffF
	W6a3wF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1Wc-0000000FSmR-10a0;
	Tue, 23 Dec 2025 12:30:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1WZ-0000000FSlQ-11zQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 12:30:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7AeaL2116374
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ffbG6iJcP+z5d4xqhzCeKpZMxj2hNcge9Gry8DMjRg=; b=VG2eCwzSAuLTBzBS
	cyN+WFz045WXQcDei+Hdlfd11Hw7mqZxT1oWwtVcCuHA8vsbEcLTYv+q7ppf2K/h
	6YEC9QcBH0ZYNrmI6wSS/FEXD+5409iwJliT4Dvb7VBoEJEDFbl0amMUW/lgPPvX
	vvT6eVy3JXF/vTp92Ef7iElVmcjfNb0gM/6fCeytX8KpKQemA3QRcND5bdvuGoic
	ObK5am1BqKhMwqgEOhkQXR3CxtCnNbYa8K90a9ZmEKWAa07nff6BuXpEmVWHzRZ3
	xWA/B+LWbBcNiwvCQTF2HChDHdDkdvU7kstDDWcClB5EOy+CM1FRInmfKUWrOYvT
	8z39yQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudjnd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:29:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso4813563b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 04:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766492998; x=1767097798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ffbG6iJcP+z5d4xqhzCeKpZMxj2hNcge9Gry8DMjRg=;
        b=BEnW67BAvs+qEWqMj+5JZ++LbsUShRQkdGaqs38xxoKHo5J7daTa2GPu0hNmmX4Mwq
         hPviDe71oqWr4spGA+xgO5imRjoszQeJJsS2DXVhDpHD7OfdWy/C2xVaewy28jr5EAxi
         voWRVY0+6sdFdsBKgMtIJtMTApYFnXjAdNd04nIEsg1CX12AimkVMfyxxXsiAkP5iB11
         KoKksxqIt9kjj4Qsb705n/KCtGxpbFDgqInGECVYXHiyA/CXgRq9F6L7AkoRF8MnNpmM
         6BXEY69rDcZHSpOJ0IeHekaqWFTyLKfuMZp56CblS/DK1xo0VBl4SbVkj47QFTInfYFD
         62Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766492998; x=1767097798;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ffbG6iJcP+z5d4xqhzCeKpZMxj2hNcge9Gry8DMjRg=;
        b=hZT5F0bjT0w7n20CX5tPv94YWRMSifLxYPVeh7+zfI0dn1p9GXel6iinW5TW5AHnVf
         aj30by7RfTTGJ3buB7R1aHWJU3wJoO91lyA5T04+CIV7RLxmdFDnIEGGlXJvi1YFPcOb
         9tMQTMHqsp9iBTxR0u+5tqcSM4//xe+ZrgzFM5B1ps/Xe6CUsX2ZMCh0fj0+s57bJOz3
         Dj+oyvzwIj7K/ZKivBOnZCECgOInh+XnRh4S/xs2293JVZIkKV0IH/EcFPXP21sIWab1
         WTD5Spi4jbUABR1pd/rV0E1M+iK4udWkoWP53SAiD2oweZ6Ba0mAaLvSGEMwhI2aOvso
         k2Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUwdF71RGq/8y6XFDn5tipKn6xwCZJEtyMHS7nX/Z2Y8Z6zOCwJv+D6RK3NY7CFXzf5TyG6nnwxlheiMA38Jmgs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9XuwUhr+koCNifUU7K42xo/enjb6DD44bNJ+eLcMytPQh1FsO
	+CjHc8lwGuDMpPsqAan+gREgVMeq2st0vnxMgoRdgZgmJch8eXgajEZdQlgQgpWYWGeY38AybGF
	pOotxkbPiYY6cR0ol6Ra9fF5GxmfBYXvx2xpbyt7ylXn640TWhVG5pS8b5eGx1wWEY6GjuPt7A2
	2USA==
X-Gm-Gg: AY/fxX51Cyf2EtuEIcnu7oZg6rr5mnKfkO0WsfkuKsr3Ba87HDuQgP4bS/EVm1/DOR0
	e1XAEJHBOf7E1HmhCX5u8Bxzf5KC+PVQWp7uRW9/66UDgsv9X6CYfm3u3umrglr6eRv4WhCc/XW
	UC8AQsnAs2KSm5nNYLBVEqwB2iACk403PoeSRPoRFA4lX7WcDO6LlGrJSMLTxRvwLv4OfAwIRDu
	1KOZsZ1Lmew07iXcwzjT71cfQ/T33Ath9ZNlB1xCRx50UlGBWUxGo6OJR89mjnDNQzLWErtAf/B
	smxxTVmHm/LRAYZbx/ruiDr2LdaD10w1Oq2QnWglxi4HwRKEyX+LFNxd3jVGoaGvHzRn0G43AER
	neDiMsIzW
X-Received: by 2002:a05:6a00:1d23:b0:7b0:1d84:8634 with SMTP id d2e1a72fcca58-7ff53501207mr12347217b3a.15.1766492998088;
        Tue, 23 Dec 2025 04:29:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKW+H73D9ksZ7fL/FG16dl2s55ZD5r9HDlncH90Y1SXkZ6xZ0B5TcR1RTF1oMqSDXvIjV3Tw==
X-Received: by 2002:a05:6a00:1d23:b0:7b0:1d84:8634 with SMTP id d2e1a72fcca58-7ff53501207mr12347198b3a.15.1766492997644;
        Tue, 23 Dec 2025 04:29:57 -0800 (PST)
Received: from [192.168.1.102] ([120.60.139.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e892926sm13647781b3a.66.2025.12.23.04.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:29:57 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org,
        Haotian Zhang <vulab@iscas.ac.cn>
Cc: robh@kernel.org, bhelgaas@google.com, michal.simek@amd.com,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251219021615.965-1-vulab@iscas.ac.cn>
References: <20251119033301.518-1-vulab@iscas.ac.cn>
 <20251219021615.965-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v3] PCI: xilinx: Fix INTx IRQ domain leak in error
 paths
Message-Id: <176649299472.522673.6050154108234112363.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 17:59:54 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a8b46 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=wbxd9xFQoh2bOL7BUxlcyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=A4LZ0qbstxbIEDcu2eAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: mcm_C-ZYGVIUvh50nHocdeH-XoUZTY2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwMSBTYWx0ZWRfXxFM7nCmFqxmn
 LpRD3hPVafkuNV5jlWHPjQ0FVeVUzw5XuXYbFGlNtY0qmlpbRnTIsRl088aWbL3S+zNJ/jy8kA0
 ygkQPY8SF/BgaX5dnJ+ZRQg/+tAznm/78rjHws+eBrpJnky+5Wa6SnebKXUFJz2vymLohnkDl8W
 njauW5dHDlehZP1/VTQozGdxhvavhhWHJCk2X1rZ+Fyo0XmBWOtRU7hLmfSOLCgXWv80RYzva5+
 sF/rwWzxhwgUge5gGAIRjRoIr4a6tGgA1nrt6E1p3fmpENlBm+4bVHxl8Rnph7ENZjVgXK/wCYa
 S7sO51J984yZUV31saGf6z45GY+pLeUyC4HClfXhqHj/qJvkWjiHCSyAHaYkXlDq2nk4DvIIDQg
 wQiuCz5Fg5XcEqaQkQtw8qlKbXh92fbBjCt8gfw5kEFkW0wgyIiKRqFib8bDHfv6y/odwYejkPy
 Bspd53mxeefih0ndkDw==
X-Proofpoint-ORIG-GUID: mcm_C-ZYGVIUvh50nHocdeH-XoUZTY2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_042959_304244_6133D663 
X-CRM114-Status: GOOD (  12.48  )
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


On Fri, 19 Dec 2025 10:16:15 +0800, Haotian Zhang wrote:
> In xilinx_pcie_init_irq_domain(), if xilinx_allocate_msi_domains()
> fails after pcie->leg_domain has been successfully created via
> irq_domain_create_linear(), the function returns directly without
> cleaning up the allocated IRQ domain, resulting in a resource leak.
> In xilinx_free_msi_domains(), pcie->leg_domain is also neglected.
> 
> Add irq_domain_remove() call in the error path to properly release the
> IRQ domain before returning the error. Rename xilinx_free_msi_domains()
> to xilinx_free_irq_domains() and add the release of pcie->leg_domain
> in the function.
> 
> [...]

Applied, thanks!

[1/1] PCI: xilinx: Fix INTx IRQ domain leak in error paths
      commit: f42b3c053b1554d66af6fe45bb1ef357464c0456

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


