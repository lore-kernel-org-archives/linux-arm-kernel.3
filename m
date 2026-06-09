Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552ECCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+SJ1odAbeV0uTMzVMi5ad2jR+3gn11BCR39nm6EOKs=; b=uMlRUa4q0MhfC6KEp5OtlX+w38
	1wdn7xUmw5txlVd8yifiFMBvzFI7NDF6fYchB+J3+P1NBpAqvVxGBlS9apRJzMjj5gOkhM/0sqUYM
	9RWThZHujn/dhTsovCBKkWTY/WmGbsryR9S3NnxmMnCf4BKTVt/rVz+afllgyjTSZ14lxJz6tf90t
	a+ER+RBrJR8z4WFHMUw67Xd/XW+mByb9bQEPpvqiOIbygn4PEPwHwLzN2mWfgFhh7IgujsEhJyUNS
	jxgotU8nEo/wuuLoDxg+VzR9rC9jlvLg4WH5FGtThu42gvPZyBqtSDl50887R4iZBA0IJDxuoSnre
	R2+2GHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzWJ-000000064Y1-14qz;
	Tue, 09 Jun 2026 16:41:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzWG-000000064XM-1FYj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 16:41:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOiRo2750374
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 16:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+SJ1odAbeV0uTMzVMi5ad2jR+3gn11BCR39nm6EOKs=; b=QBlLSGej2K0E+f/T
	21hcAjzBrBx/5WrXDO1EWdVmXtHAKkw+lq3CxaKIsIKt+sxjRazrqvhJ6g3HcvXm
	rtyicrP11SYYMUmeCHltMUiUSzt9KjV3fixwRPY+hwH4ENjVLv32g2nFq8tTGQ82
	+oTjgne6bwvjdnui8flGxRH1Mdqp/OHow7tIxabFNlDVvZKJR0CsTYNWLn1cjKXA
	NIy0hWDtj+XoBarJd17JmXggrbGJ0Ajf0PTxHcJgGLhYT5qcy7qo3u6rxlZyFaKn
	pIUi6WlRB/7owAR1KtEf9lN/SgRRO0fLkRRLliK1hm3uMsBOP+dij5k81KNVpD2R
	Cy6wkw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgjkep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 16:41:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0a99db8dfso64499075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781023299; x=1781628099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+SJ1odAbeV0uTMzVMi5ad2jR+3gn11BCR39nm6EOKs=;
        b=EVAMOl9bg8cFnLPjIFHkaarAAtGwC1YTK3dxorjG68M+16zD4tP4DzD/2VrWfGPp/v
         XmAIyAov1t79vRmVFfgI3WvgCEuWPA9Tp0NiohzbxZDUU9cfDO4eMtwgzgIiId5dypFU
         dYpY4YJByiJTI8/VVtvAFlpmhvDIm/GID70l+BNzZzPOJM+e7yoimmtFnWbMTI1Dp7LV
         3DH94DUs6ke23nqaNA5AWfD7vZbXr3izuzQqexk7zWBUgQz5dtdCSYfl9AU2W344fTWP
         JBxMOoAepGAHkLNA/TXLAkg1KjOWDwEQhexkkl99uiwq9FFIRm6wAkE2yVN4sZfvux5j
         ogvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023299; x=1781628099;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+SJ1odAbeV0uTMzVMi5ad2jR+3gn11BCR39nm6EOKs=;
        b=Tz0BnNz+ftN6xcfxmboLvx5Zjms4vLFBZAaXQbsVRQBckaKfVK6tUimrlw3EVDK2kO
         /2VZZxfpdbBZgvlvydhLZFwO/98XLY9+95YiShtu+GeAiya/tJHpnoT6hTzL1UYlUkAT
         dDFlny5wjWib6XxcI9JbBRRVKu3XEk34cCF1P0RBq8Hpw8yRTAmPzKSisvlJXzrzDX2d
         4if6Ka7oKWcCklkR80e1AVhPnvmRHl5nVG/s3GLJWTA8GYRjbv7OZJwz/fvh5oZI/oeK
         kxHzUvR+tYv3TyTA81LygZ0evu74dAgSk0v7E8OZ1TwxyAJJZ/bEpUZjfKOP0/yneIB3
         TLFw==
X-Forwarded-Encrypted: i=1; AFNElJ9i25wyr/vDi2PKjGI8GAsA0x1AUUl7R4nI1hjYXviHasilkdPHzI48CZOaLBPk+NNISSbrT4/QkRyvyR941K61@lists.infradead.org
X-Gm-Message-State: AOJu0YyCVFVzG45iSNXKyKiFwS+JYiRtFevWOhCLo/JPVEbkTHvjztwF
	r73PKzOA/7NryQ9TSJ8ydY+QFHFo48T48C9VOs/cD68tZaJyvSg1NQmKzFH0F4Yvy4Rsrm9ROPx
	ylZ6Fx9seWV94Md0/UOXd7XGC6FiEz96YDfrtx6uLmDNMbHMoZXsK+UUeq1iLo15jLWs7UvR197
	H53Q==
X-Gm-Gg: Acq92OEqcaqUkBcCPNYub/NuZSgtHiIQwHwHuZdtPB4D9CmZS8GZc8aoKC5qmjmnebc
	CMVFbGV0b06a4QyGjIN55S50uahn3h1vIHq44GVanplEkBihVdEfyc/rBQfqpTHQg4mHnYdPGXs
	/CX57UpI1vn4awGIExwax5Rfi+q5phN61spnXID0qHEikKTm1I88M6eATgnHQXWpRUMQL8jguX2
	eZDG5FBLYfR0TqpAcSGYrx0VMfDKdt4c1BNBecGWkTEwJLL0L2m9MR8Tw3HA8O6TMQOeyGRByV1
	8jrZVhODSCnSdsbqhLW5hQ1FagCYu/OlMVw3Ci1nsOQ4dx2MX75LnqsnH7MLF3pG/WEVFfu3JCi
	FDT8FOCd0m9rvraSdGQkDSl3h2rnHHyQ=
X-Received: by 2002:a17:903:4407:b0:2c1:d49c:8398 with SMTP id d9443c01a7336-2c1e78df934mr243154305ad.8.1781023298985;
        Tue, 09 Jun 2026 09:41:38 -0700 (PDT)
X-Received: by 2002:a17:903:4407:b0:2c1:d49c:8398 with SMTP id d9443c01a7336-2c1e78df934mr243153835ad.8.1781023298472;
        Tue, 09 Jun 2026 09:41:38 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm215177165ad.40.2026.06.09.09.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:41:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Shuvam Pandey <shuvampandey1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Fan Ni <fan.ni@samsung.com>, Shradha Todi <shradha.t@samsung.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>, linux-pci@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <1a0c86ab264cdc1c79c917e984b90991af51d827.1779123847.git.shuvampandey1@gmail.com>
References: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
 <1a0c86ab264cdc1c79c917e984b90991af51d827.1779123847.git.shuvampandey1@gmail.com>
Subject: Re: (subset) [PATCH 2/2] PCI: meson: Add missing remove callback
Message-Id: <178102329225.12739.7391385656856361501.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 22:11:32 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1OCBTYWx0ZWRfX0pEYTHIxm42y
 3XaeHzd/pyAiAamru7tYJKCPJzI1d5DhFZHrFu259oQT6DLq3fnc5xFQjkuuJzs1rkf8c+EirzK
 4oGHO+JC5eYaVGYAHqn+BWEnf+RrvwXNhKXr/dqzJVLbZVbGyoy3ecXV/9E99ja635gbYz5PzQ/
 eAjs9gzr8YjZIEt2ceiAZT2iltGWuN0Akzfxl3yZ4rMAcq/DMEpvu8t2unJwM24FoPurk3SMz5h
 7ICXUJGBXVFcpScQI4MZ9n8aKXjlSDAcDvsBNCj1simkP+UAOVIO/mL8oLEp8SUxJiuM/0okevw
 LaJ2QSoZBrZ/WjT0ine5u4w8CGKEmYX1f/huZzVc0MoLbl+8zGIbsjpI+W6qUDtXmKKyqvx5soZ
 5t0grSZkFDorwXaGDhCYpBcKIs/+HORPRtMgyXm93EVsAVH0gZjC+Vyb3SRuzSZU0tKMLSzsHvr
 72uZx9tKs8CdDzPRfMw==
X-Proofpoint-ORIG-GUID: APgx2IXWe_fGtxLB_EzVECVEaEm0ftOi
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a284243 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=Mn0DOdAkTdazpQ9XZsUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: APgx2IXWe_fGtxLB_EzVECVEaEm0ftOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_094140_593283_19088AA7 
X-CRM114-Status: GOOD (  11.32  )
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


On Mon, 18 May 2026 22:44:18 +0545, Shuvam Pandey wrote:
> meson_pcie_probe() powers on the PHY and registers the DesignWare host
> bridge with dw_pcie_host_init(), but the driver has no remove callback.
> On driver unbind or module unload, the driver core therefore proceeds to
> devres cleanup without first unregistering the host bridge or powering off
> the PHY.
> 
> Add a remove callback that deinitializes the DesignWare host bridge and
> powers off the PHY while device-managed resources are still valid.
> 
> [...]

Applied, thanks!

[2/2] PCI: meson: Add missing remove callback
      commit: 4b0dc84b293984f75598881809fb2d3daf54a2a8

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


