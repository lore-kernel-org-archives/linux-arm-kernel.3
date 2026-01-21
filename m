Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A85D262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umBEj3z/LESlnsW++p+V97CniCnqNLSsVrUC3L6GHxw=; b=sFTWJrgqP2vvDHqCj2vAb6joPB
	jeLrIfC3R8AlmykT2H3J67zb+Uby71DVCZffuWPv6k67yY9VIpl14ZnK4d767ptW1OW9ajbAEo9B3
	qQ7YqfoSqEkT9o75X5mqVmVEgob276pchWDgx78Bcvzx86mGNLB7dnqwL62vhzA93CJeyq5BkxcAG
	IJMlE3IMJVt4cujIcL4BPbSvU3CBkOb2HSQJgaiI3IoA991AM2qSGYZWGcxIO4w/0iP04F3TNUDj7
	G2drwt8IugtI+2VTzTGimTX3dIyievORgPSas9I+6pWvcTpoqJEhha1eFnxLYfReANv0HrujvNGhK
	vlbZKjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYxG-00000005ZUu-2TE8;
	Wed, 21 Jan 2026 14:13:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYxE-00000005ZTf-1JpD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 14:13:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9eckX3991392
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 14:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	umBEj3z/LESlnsW++p+V97CniCnqNLSsVrUC3L6GHxw=; b=Ugw2eKxghXbWq57k
	215Dyw6LYJc+NbVOugKInb0xA/l0Q+0qSYLz/ARyaFO6cee5iZsob9lATGXvg/W0
	ixVg4UaSnlH3Fu8cE8iA4sO/jGBRBGcvS0ZUGnRoXYgzA6Ir2FVlegJMr+U0/GbG
	Xa54Zcizax98t3nY8pSR7RfIKA88VaAdc67XfNQTcL6DLX5MWAuOwyInAOM8OqXC
	XqXtZCFDwsduR3bXQrTKuc6C6Vm7NEj+Lu44F0L6+fvC7Z/HCGORwf1SR9A8n4FN
	JVfeipXAWEl3aDsfQnlSnEakMyH8QHo0HqXhjl8csT32QoZb2KHtJGWc/ikbDdAf
	q2JeCw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btpm42fbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 14:13:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f53036ac9so5121642b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 06:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769004783; x=1769609583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umBEj3z/LESlnsW++p+V97CniCnqNLSsVrUC3L6GHxw=;
        b=T8C/ZPpMRacOGMskfdzkn7srUfdIjHPMYTGFCWLj+0oJR/HEJoxz3Hb4zSBN1wPHUz
         Q5ABnswr/AFlrUu5amjsywf9b0bS7IysAdbUd4E0aMNJTwHgdRlWkoUTPKwXJXLENmoz
         bPmiXfPSD/uqkjAGld7fu9uybtEpkkU7OY6OsIxs2p+r4hhGIepMwPCUSk3Q0QiGNAie
         mZE3ajBY6QJKfXXeh5s6DYUsMeEG6BtLyhYl8u2XPDzTgyGvPw+s6qAYREc7lXT1KtR0
         EDS3bIbggGChUKIo3lLu63xGALAm5rh/2uq32/hm0jE0PVYhcYwlqGaVatsZC3ncyvOG
         CMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769004783; x=1769609583;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=umBEj3z/LESlnsW++p+V97CniCnqNLSsVrUC3L6GHxw=;
        b=qdDBQRWgz0DpzGhXiSNqCduEh7JmlKeCK9Z3bxKNbq6PyGP39Qs+TUOpuXra2kC05q
         E5vZU8hjehBDvnT0VbiocyrdtP7t+jwx1BuRxtudj1dr4FKGfrcd72b80Oitl5ktkK7M
         KfQt2+a+J4xjoH4Y4RaoRg8rIQsYg3zbh72IXbBc1D9db63AwSMotyiH6NvJhZ/QYuW4
         Le0auS1qRQkCqXB5oUQSYQiGsjjWhbUFz1kyWqBY8vzIK6sMtCZ2GHIaF9ODrCYDi42g
         24xhM3kS1ZioKbcjIExcylo78eQbVEwE7VS6xFMURZ+OYr+0OiEd9mXuHILMcmyc6lkC
         4eXA==
X-Forwarded-Encrypted: i=1; AJvYcCXELRITymCZLRbibbYotyFAclnc/vNsV3FvJAq9SJReebPxKd87gI3GK407MKt3BRFH1bx1IURBfg22NzLcblI4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7M55iE707IRpNFUQhhnpfA15VmcrzUwYAMtncVu21M5q5lZSS
	cm1YuUTAnt0Z+Ht8ox5vL082V4JtodAzyX6FJrkSaKF4YlR2p+IfOBuy4J8ht3vVBCsHIxwown3
	ROsKUlFZvOiSB9xsHH9dHb9Tx1tw3A+WEK3zXMrRuL/GiaWdQ0hWNIyg0TikSQaT1A+khMw2nWA
	yoTA==
X-Gm-Gg: AZuq6aLHp4T88dJ7TvIQ91c5B+qhgzcHpvXaMsLRo/z1/ZmjiAsS9usqnl6U2A/2yam
	LEBURkxcotJpXbjP7IcBf/uhbLuF4RfiByoKjxDUnKq0Mz5PZDpZZGfK2zP984LgH1GpXbYE8KZ
	qPo+E1fy1gmPVVv2+jJ0tnQuxEnEJSq7UGkruYI3eFmnwACaoIuSAiQm7wpeEPnF6MAf8xbV7X1
	lJFoQOrIt5NHhjzCQ9IljYHv287sPPuqTlBJwFkDUoEmxCfsuRCV7+3VLHHqj85lMnZd76NW9Ij
	s+aJ+ihVv27Rng6r7uTTVJ4Rz67RCzgV2tUQ4fNYgByvhko359EeCfM9gPEcUMbeN7duNlotOb5
	ZJtZeWZpO
X-Received: by 2002:aa7:88c9:0:b0:81f:4e0b:324d with SMTP id d2e1a72fcca58-81fa03483c5mr17030952b3a.69.1769004782641;
        Wed, 21 Jan 2026 06:13:02 -0800 (PST)
X-Received: by 2002:aa7:88c9:0:b0:81f:4e0b:324d with SMTP id d2e1a72fcca58-81fa03483c5mr17030915b3a.69.1769004782025;
        Wed, 21 Jan 2026 06:13:02 -0800 (PST)
Received: from [192.168.1.102] ([120.56.201.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b51d9sm15252753b3a.65.2026.01.21.06.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:13:01 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Heiko Stuebner <heiko@sntech.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, Niklas Cassel <cassel@kernel.org>
In-Reply-To: <20251224-remove_dw_pcie_ep_hide_ext_capability-v1-1-4302c9cdc316@oss.qualcomm.com>
References: <20251224-remove_dw_pcie_ep_hide_ext_capability-v1-1-4302c9cdc316@oss.qualcomm.com>
Subject: Re: [PATCH] PCI: dwc: Remove duplicate
 dw_pcie_ep_hide_ext_capability() function
Message-Id: <176900477438.343515.1230699650351022573.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 19:42:54 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=6970deef cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=o3iIPP6MwdQAWb28Nvg98Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=bCJlsGfofW6EOh1BOmIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: chtSTRS-or7D_a5JjeoAT1ZXF4gwMptV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExOCBTYWx0ZWRfXwGP99nGnnC22
 rWWwg5y5pS15c6OmJhnZAwQv9jakN0gaxtKfxgLfaaW9UmffWMAIAYdDpm+jExlmj1szn0Qe2YG
 LuyEzYC/8f2uVwLHHE6daOCs5qAiR4jgMve/lLRT3GxVsfZgZVUhNM3aIPpHi7myFo8IS7gn6ES
 brh254hM8DUeNBgZVBKg2QlewYjTrtfs0YYtydiETa25kSRUi0medy5D8uMEuCxVTONs9IkFW/V
 EeMh6RPe1DqsNDvlDCwmyUvwk0/Ci12lzi5gbPCnOvEmEM7Ztsr0D/lw50gVcElGCTk7mZiBK1+
 HeAbmzRK/EbCRF4FPvOKH4Y0TGyGMbt0GjXYkWjwpzTksudZ4YLCrvOF3wyyiTZDKfwOo2io4C/
 MipKdSOaW7pthEYSfzssO2wAj86/An9Yr5vj3y/nseAsg5/c2Yk2mJdWhnrqkuKmP6DIdqTZ3qf
 Kuzl/bt8PHHNax/6nxA==
X-Proofpoint-ORIG-GUID: chtSTRS-or7D_a5JjeoAT1ZXF4gwMptV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_061304_436036_F7C7788B 
X-CRM114-Status: GOOD (  10.68  )
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


On Wed, 24 Dec 2025 02:10:46 -0800, Qiang Yu wrote:
> Remove dw_pcie_ep_hide_ext_capability() and replace its usage with
> dw_pcie_remove_ext_capability(). Both functions serve the same purpose
> of hiding PCIe extended capabilities, but dw_pcie_remove_ext_capability()
> provides a cleaner API that doesn't require the caller to specify the
> previous capability ID.
> 
> Compile-tested only. Runtime testing on RK3588 hardware would be
> appreciated.
> 
> [...]

Applied, thanks!

[1/1] PCI: dwc: Remove duplicate dw_pcie_ep_hide_ext_capability() function
      commit: 86291f774fe8524178446cb2c792939640b4970c

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


