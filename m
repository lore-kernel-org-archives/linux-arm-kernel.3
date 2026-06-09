Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E60BCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw+HTzEU5Iy7MtnFBkzSQ787/7xbF41rkOAgUgVqkcE=; b=SBFn7qsQOHoR++rqap09E73qLV
	8R6c1KFzkNluXhlxC3QwQPTxskbmhYPhdI/P33kKKbbMwXTXCd+mpdjzpPTZFlh9Wiu1he4cp5AmG
	rPiyNNizbm5ROCY3YtxRCnP5fGfhJy5lJTmdSF0i2w+pXhHac8P+9RrJyigS8F7R/4zMo4RYJ42pX
	Pnh6X9FiZH0tOYlokIBxMKcFteho9nKOCPwP9JrgQv3U1HlDQAjq5gsIghuy1T8K3pCaaWfGE6Csh
	iCKRe6ugovGhzS9i6apF+N7VgZomZjyIBgyJ/6QdblxRUXyLfefceTlZ2esPjR1nuOklL2zrpvWHO
	1IpHq82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyfE-00000005xQa-2V1K;
	Tue, 09 Jun 2026 15:46:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyfA-00000005xQ4-06S7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:46:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmRpI2625146
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bw+HTzEU5Iy7MtnFBkzSQ787/7xbF41rkOAgUgVqkcE=; b=WB/qeZzddWSLZJTu
	/kqDbSiNiL8Z2yHm7uiR+9yGFtaSJt4XO1Oq2kxdOH77TwFt4I8fj/in4uXT+LQ9
	VisEKgHgJ7omEEmwGHD64v/f3zq6eDcznHVcE8DEfsZcr15SBF9J/4UrSSn8X93B
	KcSCLBZdKlCArg8oA1IXykcFFzX8vIVoz1v16dxA713hQrCBzUcUra5AGWqmgp0Q
	EhzvjWlYFWyZGgwLin/ZxCrpU0lFSk+7lkj2euau6U7TCiNmTrjQ6aBFgMcp4YaO
	TptR0OrX4j4zsKG+33g3lJnohWXnpUAGErm4XVxJu8y2xb9L05PgjH8/fexZqS5k
	EV0aAA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epddsamth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:46:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c10cd7df22so75848605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781020006; x=1781624806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw+HTzEU5Iy7MtnFBkzSQ787/7xbF41rkOAgUgVqkcE=;
        b=i+7icbJzbybuia2cbDo1zvZ1crLVCNIqakCT9UJivQViGRLMTYZg7ep8ugPf6UWKFC
         SnOrFgwzTzFBVpWP/zfBogu2O4taMs+BAUVwsjUPRU0A10aGuOUsT03MsFFg5d0RvJ1V
         GdISrePKOSq7MZ5ZjtpM2RrTJKFgkku54JtjzN1f23N06eRrnb+YXkHwYmw8F4RRz8iS
         r9iB5NfGA9z4j3rrYPz2lfqlVuGL8NHRXGmD2Q/u2bg5Zfi67r9F7cxrId6XZAZJNE/N
         8Vf2mTEPdhnM/48tJcFOyrcad3fw4IXBolxkxhQLTc0YmUoMyga9U9H9AA3jeuGvchGa
         nB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020006; x=1781624806;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bw+HTzEU5Iy7MtnFBkzSQ787/7xbF41rkOAgUgVqkcE=;
        b=IYKyS6I4VB+pcNYEQQt387jM6lpwIE1lI2LRE25RUPyllOcR7ngqcbybdPxerzNi2T
         ufQMeMUQhj2SdTI0twV5x0Tq9+rVFqSjADY5VhofBh+Ei+rxE0mahrpAE0mYzmjpTNmu
         9+BnAP1CFKkQK+60gClulzJK6wqtcdCCBpuFmk14WFyZBZ9/K8Ky8FMiBpqlYwKSJXHb
         1aSUOBBbwZRXxf3K03SUMROiezwng9j6VULUOhNbckZUD0jqo5423eJKvnYYKT1uf4CV
         wH7Gi8DduICd5KvMZwTfuJWzoiuAHp7keyYrdD9WJ3mR6RUNrN2/jiVqz3prqWFfNi+o
         V35w==
X-Forwarded-Encrypted: i=1; AFNElJ9aAoaGW8uK56Bz4qxOruIpbYRW6guqrlt5rczC+SMYfWL6lnQhL6nCl+7W0V4dPwcvDUsvwOR7nIYpow0D2rjn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1vXV8XqyTSoBwgs1I5PQsw1+plyl9k9omngUR5zzIy0KbNrYt
	0dhBAjQ0apA4IA0KJD7L2jUT6J5JdXFx4yUfh3tj332vKynFQ3IDxwddf5xLbMLNhc+Kh6EHLrz
	Ah9yOzkF5yTtUGAZgBVhmuxMf/YA4rd6hcLpByvhxoTFldcm58uDL+wnhcIri2oc+DE68X8+jus
	GVzA==
X-Gm-Gg: Acq92OFunZ6Zj6LhWNx4/cVqASHgCGlN2PK14tjr+RVrTfGdFJh6QQDmKPW4efCbwO9
	U10U7tb3OaW+Y3rTtwbF25OEDhm8jMUs64IIgjaAfwu4jWbZc9mBaRwuZOVtUjAiz3P4qN11b8z
	N5ZUKIYljWd6EATjUfYN/gkoxTMNzYRgROna51ORZ29p2pyi9mtrLB8HdipIEFzXEO2bJ0Qp7Mk
	quKXryEE9HcYQThtu7DRCmA0rOfjmR6bhgOVm0KdqQt6gaUtNf0EcxIytvknh194ybJtRurDkhj
	QlgLpb6NXVJW7Utqwa43+rZCh0lKg1l10HebpBPUyrPU37KBULi39m1/unilQHsaXO9dzS2PToX
	iIiZGcOEik1BuIQjos5hEYkfNtMlV4Po=
X-Received: by 2002:a17:902:c409:b0:2c2:15c7:ad77 with SMTP id d9443c01a7336-2c215c7ae15mr207432775ad.37.1781020005574;
        Tue, 09 Jun 2026 08:46:45 -0700 (PDT)
X-Received: by 2002:a17:902:c409:b0:2c2:15c7:ad77 with SMTP id d9443c01a7336-2c215c7ae15mr207432405ad.37.1781020005013;
        Tue, 09 Jun 2026 08:46:45 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8792bsm223401015ad.23.2026.06.09.08.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:46:44 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260518072715.3166514-1-hongxing.zhu@nxp.com>
References: <20260518072715.3166514-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2 0/2] PCI: imx6: Fix i.MX95 PCIe PHY initialization
 sequence
Message-Id: <178101999933.10755.15039783004341281715.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 21:16:39 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 6yfO6urpsuYwBqqTp2ZVmxgswmfRuNBO
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a283566 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=6xSj6z8mzX6N8v9Jz00A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 6yfO6urpsuYwBqqTp2ZVmxgswmfRuNBO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OSBTYWx0ZWRfX0nFg5/QEQRGA
 TABqoXj8emTIVUm1JSaNgUCmqKz781OYM4lJPWlOg/2/6pK+AhTLLXP7NRHH0evwVyQkPWnqlII
 qsY26BanGUDSaoAk5NOkOMlB16OBfVfLZrCPZq8XlongL34gjMfJrBt8XWjikDByhlAkLJ1J8Rx
 WRPSDCPoyDVM/4tjYjyM0zqkm+3bjHXPLmD0AikhTdswhX1UXE/6na0TcqT7SGKnyN4XPMSeHWo
 75LQXKE8mkRFrd7nfgvJWbyrfFhlqkY/QHZLBJi6+xPB/Oqv9ZV0pmxqL+lt56g6QvU6S6qhAUp
 Z3/FfiQEuPz+saShcmgWbEuujqMA7F4DLL1oBIROB8GIyRszXLoji49/sAHowsoQisrJRgQp1XV
 92CxrgYNb02IQCOfzYEcVf8FhRcOu6eyjD3arF9yOeyBMFkHSQZvELv3sdf5PQO9cdMsi+pvzyT
 Evu0+4SBBIzL3DrUkng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_084648_212163_2DE33850 
X-CRM114-Status: GOOD (  11.08  )
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


On Mon, 18 May 2026 15:27:13 +0800, Richard Zhu wrote:
> This series addresses PHY initialization sequence issues for i.MX95 PCIe
> that were identified through careful review of the i.MX95 PCIe PHY Databook.
> 
> The current implementation does not strictly follow the timing requirements
> specified in the PHY documentation for reference clock configuration and
> PHY reset sequencing. These violations can potentially lead to unreliable
> PHY initialization.
> 
> [...]

Applied, thanks!

[1/2] PCI: imx6: Configure REF_USE_PAD before PHY reset for i.MX95
      commit: 0c26b1c34d12d4debfb5363cc0be6cdf68e87ba2
[2/2] PCI: imx6: Assert ref_clk_en after reference clock stabilizes on i.MX95
      commit: 9dda3f83ba677b9cc2613cecd9120123000ae50f

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


