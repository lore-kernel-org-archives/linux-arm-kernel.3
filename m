Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA8DCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvSrFmHwHX/ePZpcJW7M8TGd97ojj0SDV3pHaZazYYw=; b=cCHgoC45nC1C66YosyvgH8i8h3
	Dkj1WQEVXu5SOYwR36Qkx1wLT72jDYLzdbpttg7nN+5nZcy6mWpsjYBffOzx9V8zU9w54G2BUbgLk
	8BCvIxnVkAF3LHVz1IPpoZfQhL/U1LOHUEDkLcwTx8indrSzS1O8V7a/751k9fO8a1uU4GDOnojdT
	kQrNpty+QmP8vBKe42KfwAi3m+crPkjiX1PQnDlIhqrrb2ibquKlJ2ea1l/NRVY5y79qC0aFVDsRr
	YToAQl6Dmrw/BW48iiy0ojxbiCkBP3AkodRYGDMt4F6pGtig9FRZ/k5mlmg7XKaZP5C+kQhfasA3y
	n5d2e39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGv4Z-0000000F32T-1Zqq;
	Thu, 06 Nov 2025 08:10:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGv4X-0000000F31Z-0Puw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 08:10:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66rDES3361979
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Nov 2025 08:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvSrFmHwHX/ePZpcJW7M8TGd97ojj0SDV3pHaZazYYw=; b=PHM7n0kba9PwHXAQ
	ePWaA+GGtWGu6BJYZ7AvJr7eYHBfZMGoLTLpkVYzhZfbeqrBk8xu3bD2SCyt89cA
	RC9BsgTpu9VUGEgFi/VTBpdrbg3ZfSWnohkHFKKGOZgtuSu8Phanr2G+67/tjOmq
	+ntgoYgLKEo0mx0WV+Xx0pPnjy+kKGbLl3IofziHzSBtEmHDQhbUA9IJJSxVnAUt
	SnH/5Kw6zqmHeavP1qXYcZ8ciBGskQm2je/tFYKj8guqrPtdrthxCn8f0OnDzzeD
	EDgaSWkdUXPQpKXP6336JhGGHGStIWrE9KterJe+uk7K8faqQVN8b7gVW0eNwIgA
	+UfXWA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8pt586sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:10:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a675fbd6c7so240604b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 00:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762416619; x=1763021419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvSrFmHwHX/ePZpcJW7M8TGd97ojj0SDV3pHaZazYYw=;
        b=R1riS39cXkZkdMnGiN04ZBMiMF5YY8+43Eo414iL0MyofzFO6YzK7cgZigYCaGTiU7
         kdaerGs1Nm0mSGVmsjw9jBfFTmNnvhlVBK2NoxeKlcuLSMRIqpSbaJYLFTP3/QOKYrsw
         FM15mFViMrNZRKTMm+qjRCUsdx0tK6d4QLzkt2Ud64UM1W9ZH7NglZ2ZP8ZSWxloN49g
         vvKWRqYMn89QIzXcE980l+QJDPF5NbyFe4Yr4rY/cGQmRl7zWBa8zOAYQQ9mCi1JPv0E
         pWWDp5pF6Tlls6S9vx0wOqC3OL6bW+olbdCaVB7K5cXlLYbpG9zMTp1gZFSMtW5gkT/O
         OMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762416619; x=1763021419;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvSrFmHwHX/ePZpcJW7M8TGd97ojj0SDV3pHaZazYYw=;
        b=JPdUQTUpQ0Pdw2TnvgTTBFMTeK6Dohkac/6SSO9ZL934zTUMOJqzhpNaT6A1qbRiT0
         WS7FpD+SKEEqluJw2JMCL4Ah0nWLIt98MkuI487Gli48XA/nmJ+sb3bTY+o3KxcFPzO7
         9QKSiT++R2bk0S89Vwq9ysHsU2tbF994wfNpicpDoWjPLo6Q12O7OTmB5dQKjh6yBBRn
         9y5rxVUkeRWB5oQG8CZJirRYQUHcUmAuVL4PFIdIa5XWvoNFBefMt03eob805gayCjqI
         JraQZGx7f1MLYB1zKRNg/XYiYCazNtYWATKgOhvCa3e5rSXSbYugcIW3DxmTpUK3wxJi
         6IVg==
X-Forwarded-Encrypted: i=1; AJvYcCX62O34SMX6r+vOeKU6tcxS2g8wpQLo7gDYmbpOXKXXAOn6wOlEd1GB5+Gs/okgyjWQs9eFNhSFom9YajxAnGem@lists.infradead.org
X-Gm-Message-State: AOJu0YySu4vLZdETlLNXOPxcpTRNUY9Tv8b77/nxoBitxpyTL/Kyepbf
	wr5mDYy+oMoSVuYOo95djNyHAPJ+YMFPoBZl+IYCGaIEDsH0AecnzX3W05a7EN7JZAeg26/Jtyp
	Hmv1X8iKtT9zcGoaaKBq1A03wmfp43yu05vHCXloL2RTK35cd7Bf1xaipqcTVAgzKUJzMrF515W
	SLCg==
X-Gm-Gg: ASbGncsgq9ut1lPZ+FrJfKv40zdW6OK8XeYMTv2PLR86PODKgJe4In4qw+FSaJysk/j
	wwRsIU8jmldwUpcP46fDW48Yflq9PW0nkGeIi0+Qqvjl/dgokIsqYEKh6lbm5YCKISiOHo1gedx
	NnqaplDY5+gV8p8IJxGirl4pMhdYgaiMSqOL94euHYU5jK59b3+mMgEFc5kdyxuSp4iKgs7yLyh
	VhPep0QN3tlKXwsqQ5IWaZhl2kkPtv/TkwTkAoBoqCzv3f8NT1I+r+7FN2wA+EPJnqksQXCakOa
	/rrNCYt1Ld9yliyOULsKDYXQDRvnVLYZ0vbGPINL6V7K5w2eUw3QoJEVfpycH85rpGA70iovRg=
	=
X-Received: by 2002:a05:6a00:124c:b0:7ab:63fe:d7d5 with SMTP id d2e1a72fcca58-7ae1f09a060mr6754543b3a.20.1762416619088;
        Thu, 06 Nov 2025 00:10:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/vrmUbhdqoB9oJDb64U5uS5btnwWXM2u02vhE5LrTCHUrX3DROpMhXq9wC6IIxjJy1R1oJg==
X-Received: by 2002:a05:6a00:124c:b0:7ab:63fe:d7d5 with SMTP id d2e1a72fcca58-7ae1f09a060mr6754502b3a.20.1762416618586;
        Thu, 06 Nov 2025 00:10:18 -0800 (PST)
Received: from [192.168.1.102] ([120.60.59.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af826f9520sm1802593b3a.56.2025.11.06.00.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 00:10:18 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com,
        krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        shradha.t@samsung.com, thippeswamy.havalige@amd.com,
        inochiama@gmail.com, fan.ni@samsung.com, cassel@kernel.org,
        kishon@kernel.org, 18255117159@163.com, rongqianfeng@vivo.com,
        jirislaby@kernel.org, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, srk@ti.com
In-Reply-To: <20251029080547.1253757-1-s-vadapalli@ti.com>
References: <20251029080547.1253757-1-s-vadapalli@ti.com>
Subject: Re: [PATCH v5 0/4] PCI: Keystone: Enable loadable module support
Message-Id: <176241661035.23562.15419519383714568853.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 13:40:10 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: fAM3lOn-UKRUMq1bgDD8aVhcI6YOXnLf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA2NSBTYWx0ZWRfX1dvYoMxylVwh
 C+Gj3C5j6dNn7VSZZyWJc9+c5J8h0ots52ilFzVzR8rEm4hScddaZPsbZdaFidDYtfubTelq5mh
 pzoRtLCy4M/Pkcm6cNFb4tGoSm+WRMecwkQd4xTqqq+0sHwRwbGToUs3QdbUd97Klw2ZgUdkpSk
 7G6ZGt4dMRJblSjoMZ7x91VLCQCsnc1Ywnk0b0S+izWXaNBULeIjdUxGtCceDgNoqLcD0zQ7KX+
 tm0j7CXjatnIinSvdktUN4PWiNdxCu7KFR7Ymn12RuS3yCx/IcaTj8u0M+ANdLzHv8ePc2J3b73
 klGkKPk12ytRYHexWdu/c9JKqVmCQTBmE6f4doz43mF9oW95dt7eGhTEjWShU84ccLVUC3seZyl
 ShzYxZY5AC0XcLuUTIevR4wnG/MSEA==
X-Authority-Analysis: v=2.4 cv=XNI9iAhE c=1 sm=1 tr=0 ts=690c57eb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=tomDxdmRQcfPzRosr6lsLA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zUTZuEUZW15Pn9DWoG8A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: fAM3lOn-UKRUMq1bgDD8aVhcI6YOXnLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_001021_165527_9CF103F4 
X-CRM114-Status: GOOD (  14.67  )
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


On Wed, 29 Oct 2025 13:34:48 +0530, Siddharth Vadapalli wrote:
> This series enables support for the 'pci-keystone.c' driver to be built
> as a loadable module. The motivation for the series is that PCIe is not
> a necessity for booting Linux due to which the 'pci-keystone.c' driver
> does not need to be built-in.
> 
> Series is based on 6.18-rc1 tag of Mainline Linux.
> 
> [...]

Applied, thanks!

[1/4] PCI: Export pci_get_host_bridge_device() for use by pci-keystone
      commit: 88254d46823be8563f8f81d78390a7313ae6fad7
[2/4] PCI: dwc: Export dw_pcie_allocate_domains() and dw_pcie_ep_raise_msix_irq()
      commit: 9acc60a5bca02351f852651c0123d9994663ec0a
[3/4] PCI: keystone: Exit ks_pcie_probe() for invalid mode
      commit: 7b5a5b7715c2dea2541e7fd3da15c2881fdfc553
[4/4] PCI: keystone: Add support to build as a loadable module
      commit: 041c2f0e34ba4823101bf307d6a6d41d98f5dac3

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


