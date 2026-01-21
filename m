Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5BEC44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4Ehy94Fv1ZXg3yukgsvhncVRxUO7ynPwWFfhST7HNw=; b=qN+s/knW2JAW9WkjnOJsXrdidj
	EIeqvChJ/ySaXUKN4PMhOSy4AwZDU+J5nCHYhKwbanAhLZmMevFgdBo6lzYmoD1p2k78u9i+QNZbA
	EqcW6jZXmJc3oBgQT2jH4+ZnFyDdp9Fp91WhQAz/sCch1sG3cGivvdEXnxtMs8hCyvXgS0X5QFmNM
	IYIbi1iJT2/6wIpkEoWWDqLCk0Ck/Mi33VZ4KoLaU35fxMpLMBm1G5bfXVWF1AlYOZNu0jPNwdn51
	ARemMijpfp8NXk0FQrtpoZnjJYE1hd2aU2wWoIz0FCNqiFkjv5TjZ/MVBnGvLJZJoX2ZUsJu1W7Py
	1410GKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUhA-00000005COj-3XGp;
	Wed, 21 Jan 2026 09:40:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUh8-00000005COA-35VD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 09:40:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L4FF082840457
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 09:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4Ehy94Fv1ZXg3yukgsvhncVRxUO7ynPwWFfhST7HNw=; b=P1ssyxIfhRn/9CAw
	aSS+XClsUJsN2UoudxSo5YYR31epKp8cajWoKDFzAR/s7m/LCGj0uFA+lIbTsYJw
	8z0WnbxxKzEizba4R6P1CbtspKZPkFH8GF3PhPvWSfMeHQD1+Z1cNe2YcS6nE1re
	HwQYuH/hHYU+YR7mLG2kc8SmX1ef3DcQekSbHS9rLPJ0usYmBWf029coslnVtp/a
	KpAvqBV3RmMPqSzZyncFYw0rQZnZDlYwZ6w8mrf8p0599JNs+wePNydlu0hhjKAF
	k/JyZvWwBAcCgxVhj3OCXwNCLjOILoUu9svJtgE4gK9CgOt5hclI/vQ9FtMM2Osx
	H2RSWQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqm1s9n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 09:40:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34cc8bf226cso6388485a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768988408; x=1769593208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4Ehy94Fv1ZXg3yukgsvhncVRxUO7ynPwWFfhST7HNw=;
        b=D81D8mj00vPrrPgqB8x0/nXgP+phXvMAA5Yx5XblZXL12CNEIzOqgq22b+MLOQ2py1
         zqRVNC38G+6GLvEL+L1mYtRbxZTdVz3SbeXxe0I5T2PkLqR3ndPA1CMh3MWXeQDlM3mf
         AKrDn3VTMbrTKfeqQ+h5LQ+6MsLHAZfh0auyUCFSa01ljVHx1gDNBmeQVGUxJPtgkUrM
         Wps3aW/z0C9t4WgGDHpiRrD07GgAxsRabujx1m0mOzOdfpWcb6S2L9YDTG3uAghF+qJN
         Bp5wy5tdkHi6MCOZ8N/hdfVxL4an06DjNyN10xAiynC81VvFZyG/TdsKbl0olErdyFmF
         k1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988408; x=1769593208;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4Ehy94Fv1ZXg3yukgsvhncVRxUO7ynPwWFfhST7HNw=;
        b=SiVwsEUJ0f3iQ6qkS4yPxbOZshfbYEmiiDv2bNaf9xEM23H1Au6CXCu+vkrq0mRzPq
         0u+GXeLABcjd5LwqLQ5QbtgW3z50ptkQzX8qKF6uOnhknnYov7lPyASBV+mMCrJ5RTEz
         KPdN19U/CLgUbjogPAtS1EVU2FobKla6hGb144hjfrJJvyMLnNxOvGAgVYS93FdsGvnb
         CJ/djL0rUndS+ieR8MKSo/51vP/GrTmJICf3HudSmEtZZKmlKjsM/k/bZjXV5fJkVxMT
         MpCjEs42q9KHwqqSWxHjYqs9Q6sJoj3XcsduMHd9zFGugEcuLLetrP/jl+MQmzGycTAJ
         y3EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHsqWfVWlrnDoGqztaVrRcqY0lvIHc35bIltjJTC49FTY8k7qCSEuohaeLnRTQWx8izw6oOgUkKszIqRmflGax@lists.infradead.org
X-Gm-Message-State: AOJu0YyvLCcJMpPGK9VGS46OuLe0PScRWvgHTO7SsbKEZQHFs0JiOwMZ
	yKRBAY4+B5MjK8DGl7ZBYRUDXbDP4McnLPiqlPKOTFy9HYTSYhYjVIe98ml+isJcYgYfbC/aR/6
	3ywR+STBWiyRBGACZPUrS29s8OI7Jf9tH48LYEWfpJXTLSCVVqZb3f6Ok14wKse4dnvgLiEXRIu
	0kyHiN5Y2wdg==
X-Gm-Gg: AZuq6aIXfnBtgMyZ0BRd24EtpSCme96JhlJF76e7RDbx6nWLnpCKTSlyA5suJJNHHav
	yEexQS+OnHXueNgU0uaX9nJxb7PaA8yYWy9x6hdvD3m1dTiFOEtk2HE6I4an6nTLSQMvqHdl66y
	diekIVQydTDRAjypxWry3twmRrJbA8ZnLixopUvbKsgmbKtvAvf4jRDrg2J+HxBRqxvTEJjZGph
	eEzS2e7GEP1OJrfBUZw94JO1TgxNcU6iTGWWoq86G3XsO9n4x19HBLzO0tp/yact65Ox/srkv8d
	6ab5TjaoBqqKVfu9cEP/0pMRIxl8Hi0Lfdr15HvxOCdUEMiWnS2zTJBb+6NfAJX0uldJuD/tBfo
	R1uIvxsBf
X-Received: by 2002:a17:90b:278f:b0:349:19a8:e00e with SMTP id 98e67ed59e1d1-35272fbf464mr13490495a91.31.1768988408454;
        Wed, 21 Jan 2026 01:40:08 -0800 (PST)
X-Received: by 2002:a17:90b:278f:b0:349:19a8:e00e with SMTP id 98e67ed59e1d1-35272fbf464mr13490478a91.31.1768988407894;
        Wed, 21 Jan 2026 01:40:07 -0800 (PST)
Received: from [192.168.1.102] ([120.56.201.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352fafdcbfasm828673a91.2.2026.01.21.01.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:40:07 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de,
        lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260114083300.3689672-1-hongxing.zhu@nxp.com>
References: <20260114083300.3689672-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v9 0/1] Add quirks to proceed PME handshake in DWC PM
Message-Id: <176898840193.11172.8990003270800077738.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 15:10:01 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4MCBTYWx0ZWRfX05Ep1zrxEnqE
 kaDgdeLvPDYWkqwzZqn1anSoF8AIGL9m6U9dBgGyxjOJ2DDvjdxV3/w/eOSJlnmDxHY7XG9xR7E
 VPdO0xWhexEj0BW4TwMcSwwuDdYAz7FWUo2CI8V257fFLdUkb9q7Pthr7/zP1SGV09jKVVIZAEl
 ueXFMNvYnIcwdx7iSk8rUu3HTdDqeuSlnr768HKOUjeGDVGwejk4TmEBsWuIthz04mRqyKdM+02
 kvyNpBUMR3DuPggpses2VfvgVh6oVBU4Xh7DuXQEikZjHpulfZToFFV86uJDa6n9AHQUbbngqDY
 M/vj5VsjKST/bKyC7wtDzXH/U0q5x5Sq55mtY6HWBfS57sYYALAHnPZ/eugLau5WwYFguN8Zt/N
 E2dRmHhHMDFMXUNRiYb4v4Mbdr4xhcHHDRX7fj0ytyYMlxnWYLodKkW63YTNQIb0UuPT0aXU9+y
 ZEiBJOOfgwjIUNMPhmg==
X-Proofpoint-ORIG-GUID: TfB4gHBXvcAhEF0p56_A7k-562p-lVhy
X-Authority-Analysis: v=2.4 cv=dtnWylg4 c=1 sm=1 tr=0 ts=69709ef9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=o3iIPP6MwdQAWb28Nvg98Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=4S7PnLgJINE9Ke9AXOUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: TfB4gHBXvcAhEF0p56_A7k-562p-lVhy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_014010_785464_8440ABD2 
X-CRM114-Status: GOOD (  11.56  )
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


On Wed, 14 Jan 2026 16:32:59 +0800, Richard Zhu wrote:
> It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
> PME_Turn_Off is sent out, whatever the LTSSM state is in L2 or L3 after
> a recommended 10ms max wait refer to PCIe r6.0, sec 5.3.3.2.1 PME
> Synchronization.
> 
> The LTSSM states of i.MX6QP PCIe is inaccessible after the PME_Turn_Off
> is kicked off. To handle this case, don't poll L2 state and add one max
> 10ms delay if the skip_l23_wait flag is true in suspend.
> 
> [...]

Applied, thanks!

[1/1] PCI: dwc: Don't poll L2 if skip_l23_wait is true
      commit: 58a17b2647ba5aac47e3ffafd0a9b92bf4a9bcbe

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


