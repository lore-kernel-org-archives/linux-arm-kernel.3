Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4A6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 17:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFApflFIpR8skWF8n01PwLi2UjQ748Wi+jg6Hh8UytI=; b=G4RjmyB+Sq31xb67ZrQUbGhpY+
	qUka4nKWAXm6GdvHRcwvu/WYrebHXBhzVIXb/EhWJm8a3Lp6jt4x/CV2TowflkOI1NZ5X0cH6WsXf
	AlYOCHSdXPen256GWYKa6PTockRDfNP3B8FhWrWC91cr3qBatZfklKJf3Ps9+s6iU0vdW6cJDOkNe
	BO39YsHFlnICR3/feu/lB7sPJj8j5Tn9cWYORNVkRW+vJaehu+as/j8/KwuJ2tTZSY2jvNsVgbWZ3
	c04tnEl4SU8mYRXOLDWHx3q8pQPHtT0U3jyT5PG1IqiH7iDadyNw1agGHZYntQBVsUU+UYi9TcSJE
	oBZhu14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIrPC-00000007UhH-3auB;
	Fri, 01 May 2026 17:11:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIrPA-00000007Ugv-03dh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 17:11:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLTIe176262
	for <linux-arm-kernel@lists.infradead.org>; Fri, 1 May 2026 17:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFApflFIpR8skWF8n01PwLi2UjQ748Wi+jg6Hh8UytI=; b=W0QbA3VpwRA45kDV
	b2HKsL0Vrb57Zo2lV5jIyauIazhcEsqNBV28NUJAfD86r1pNRz4y1QZxFchpS+G+
	UkXt5OsVjW+PY7Ib+KjfXBUnPwXU2sp5PKZEpI8nRGs+RwI9UOAzya3lLuRzUgkp
	xlgkKzzvg9r1ZBlKytKxcUjuALEEFDeTnewjA6aHj6FtJ/G1hf6kfR37gIvZxBA0
	5FOGpjrYAhzDkeFnbJATv5b2cH5sq8RPQj4VFqJ3KXpf1ps4ppwLE/U5ctQ5hqOK
	Zi6aSENekYRd8khF1rA7LUIzpdxYplezmetYX9YLQu9IrVmfpzHLm7XrKJNxD68v
	UL96mA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dve0g2we9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 17:11:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fbaada0caso2147487a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655515; x=1778260315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFApflFIpR8skWF8n01PwLi2UjQ748Wi+jg6Hh8UytI=;
        b=XdscqAMA7Ci/XqogSE+IQ8IaylX15OvJMevwL/I80ai9bWyoLvHjnS9iZ+7e/biY2u
         YhnmHsFtQ6d3ImTmuwu5GramZ7S9x2freaFcXuZQHuA8YnfuVAUAJpCX15mClMFt/WdV
         ke3S/NHxfx+RcyfjMf/J6bj21JfdLjs8Xq2XoY6+YeStrYNMH+F63Cvo/zbDHV/eeQQ1
         6tg9Ru2Rc8fJ3xaA4pAVpBL4lJIJJ8y8s4Bg9awQn6zB52aRsHlYd2zZqUUnDsX5EP8r
         ccJksxMs7Rv42wL5SDJmJw3GnuOSliggaMAfsuGh6mKoeH/EjJ9sXTPuftREOena7xW6
         F7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655515; x=1778260315;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QFApflFIpR8skWF8n01PwLi2UjQ748Wi+jg6Hh8UytI=;
        b=URv5sfvD9Ur2Mps2VWGV4FcCd5d5llsiQimvM0J6QlWsZHaLPJoRWMTOKezLzoskGG
         rD+RjRKbEyKwJ0bEmC6eNGu8wjhz7i7wzEFpFy7mEheXZ2rtZcOtSDezN2J76vJ49Vg/
         rVxqKqwHAnZW8MsxmUVczeixl1hfPJbqATi3JuYmoL47TEyva7pMV05xng9OrWqNK3Mi
         hqk8dZKWupqx7xwDByZyNnnzM3MlGGABDBWhuFCblFaQYNN9gW6uERLgeYao9swJqp/b
         Rxl8tk2A2kCKGmgWuRkki5d55hGwcYXU7WQigvjV2nBj6o9+kT/JgsNS0AJoOkdpqn2k
         Fqqw==
X-Forwarded-Encrypted: i=1; AFNElJ9BpMb14mRI9S08QXG4aw5T+Fv3xnQClAIvexQG+9RkuZPob32PsjIMAGiFhFGezKbcJtYh3Kd31OOR4jKRP4uw@lists.infradead.org
X-Gm-Message-State: AOJu0YxWpppNGX9lFmGnO/M6OVjKV2Dv+5hWxYp1w9l75MUASDeNFDiD
	27UJECXNxZZl64F2h+cLNFuAcM5WyoJbWii0vp3/fNHC1zI1O6iCfMjzDe3ui3IS06lbthKjNQo
	bA3oaAhISy3JsehwTmeWAdIQM9O9rzO4TqgPcue1DhBuh6+WxdZOLggYAB5HQpKTRvDGPqth95/
	eEJQ==
X-Gm-Gg: AeBDievsK1izgxcozTQc+K3PPrLI7eZlQzJ3pRDxziiG+skGeBBK21Gj3ZFvR7aRNc/
	LT5gO7/a99zeQdLPLx5PdPx5+uDqPr0cfSBQe1zc570vpukfUcsa9X/3UVsagVvGJOO+S5rhfXe
	YiapIX2ginCZyZzVRFOeK3rktR34uGkkrpMMBmAkBPil/SXZdIGek0ERDM1oc3ISUSjeHWTyp/o
	+SAVsuyr91Kqrz6u2aUvqgEesUsM+NztYRm7nwmeEZzyc1FilIeQRUZl20E0HErG19Vrj4uW3Bo
	fiCuMGBeDN4LdWPBuOAB7hR2t22yh0rDSyQEx/l/BY30SzePVw6HlrxIEwkpnRFB/bdyVN8UfVW
	2Rcf5HOpxiuseESs+JSpgK0uE+wtDJOs=
X-Received: by 2002:a17:90b:2b45:b0:35b:a418:698c with SMTP id 98e67ed59e1d1-3650cd988e4mr115310a91.12.1777655514803;
        Fri, 01 May 2026 10:11:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2b45:b0:35b:a418:698c with SMTP id 98e67ed59e1d1-3650cd988e4mr115264a91.12.1777655514265;
        Fri, 01 May 2026 10:11:54 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.59.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebf2affdsm3628258a91.8.2026.05.01.10.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:11:53 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, bhelgaas@google.com,
        Ratheesh Kannoth <rkannoth@marvell.com>
Cc: will@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, vidyas@nvidia.com, Bjorn Helgaas <helgaas@kernel.org>
In-Reply-To: <20260414081730.3864372-1-rkannoth@marvell.com>
References: <20260414081730.3864372-1-rkannoth@marvell.com>
Subject: Re: [PATCH v2] PCI: host-common: Request bus reassignment when not
 probe-only
Message-Id: <177765551005.15551.445091492424222415.b4-ty@b4>
Date: Fri, 01 May 2026 22:41:50 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69f4dedb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=VvXziC1WMG9Np/cC0Lm1wA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=arANb0FDTjGILoVY1XUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: lZlra0icTMY4SgcGcTBUy8D73JXP9xDt
X-Proofpoint-ORIG-GUID: lZlra0icTMY4SgcGcTBUy8D73JXP9xDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OSBTYWx0ZWRfXz9fVVIhptuBI
 hOpg3eOHNkngh4HlzEkMWmTlmWn2pYPgfZLX7IN8likJM47IXY+c4aN/PDv/coadLKV+R5t7uq7
 9uvop2gwReVEh1as1Dy1tbo/3L7a3nPuVsom9LT2CQqEC9RQyaUmOJ0kgFt+JS2RhBanpjGkMuU
 qJUzZ+Wyizo07vT6+612Iz4jP1gJB3C3C9pB3mg1pULriviw2mTPHnNJwQE+PiD27lzCUj5FDbZ
 wP87hx4NC6B+rX6la/fa8I1hwWdjgn+DVjnfIHP6/Y1UC2/vqhZCNAwFAeGSITEUC24HP/0MGZd
 1JCbvfRlFQf6+sVbB4KdZeYpsEZyE8Uk61NQJrpJRKn71ZQu1vrL9bdJuJwb5MHCQPTzYVAZHk0
 ttfHvsxzIHzjPXD2qYyVwimT2TyZb7VWbvblnncflVDi8FKoMa2jd6gCeoqqnLYIBJsJlmD4ZXz
 fZA3d+PIHf6a0pJ4Ldw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_101156_060762_DA58C763 
X-CRM114-Status: GOOD (  11.78  )
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


On Tue, 14 Apr 2026 13:47:30 +0530, Ratheesh Kannoth wrote:
> pci_host_common_init() is used by several generic ECAM host drivers.
> After PCI core changes around pci_flags and preserve_config, these hosts
> no longer opted into full bus number reassignment the way they did
> before.
> 
> When PCI_PROBE_ONLY is not set, add PCI_REASSIGN_ALL_BUS so
> pci_scan_bridge_extend() takes the reassignment path: bus numbers can be
> assigned from firmware EA data (e.g. pci_ea_fixed_busnrs()). Skip the
> flag in probe-only mode so existing assignments are not overridden.
> 
> [...]

Applied, thanks!

[1/1] PCI: host-common: Request bus reassignment when not probe-only
      commit: 76d06fb36e8e6d1705fbbf75a450e5725199ed5f

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


