Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510ECCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=; b=elAwJPRqyMzPWN8kE2j5sFdGb+
	v5N6fpLMmyBqMe0VUvCGj29MQoXKpX0udrC8TnWqbZiqLsG+Rl4oSDIqeeIne5YQJKk4lbNdXVJD8
	lzIpP/c3s3/CCjkVuuUhKrbCFQujX4AeQ9JXeFaMfUph8DKPKbW+LI9rJWDr1K6rvCeOnvAabqNPL
	qbgJCZOuj8web4r04mly+hhKs/nkRa/WEJIhBY3GaQynA0EFhNfql41tNvL0mUQGQbRr+bAV3uDbL
	QcPAJjsp1kqhF0Y7cTazdnXlC9SXF19Lo9Al/rE4NL3QAIx4ZYagSQqRQWKRyLADzRo4Q/viz+XbE
	CCypiADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyKt-00000005uPk-0nHj;
	Tue, 09 Jun 2026 15:25:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyKo-00000005uOo-16zL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:25:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Claa22183130
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=; b=iDiIrBYdlotazEUZ
	OPyfIz2PkBmylecDyPLU/witxmar0q3GzSccaTD+NWakxvgNkbsvsVuse8mbKM55
	JrvpdhjNnxu5vrgjM3o/xKotsYmPQOC694xMre/ZDTukR44deG7U7wv0A1F8FqtD
	6DvzJ1QzQiDLKGPD8/+KvdEpxVz1pwUKFO6yW2PYA4QDUKyMnYwm8jvT/WN7eVPY
	GCAyQHzpLVRnwBL5xfa50FOUNDmOOS4n9TkSLM+VnZcdBQtVrVnFEQwwWD8YbzAH
	CJnrR5NOd2Urbf4Z5OQWk079PAF9gVFuDEIDrRLkCb13gaUKSJsCpuK042RxTnMo
	69cKEg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenra6jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:25:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84256bee9a9so3606541b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781018745; x=1781623545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=;
        b=ba/dy+BhMWgLLOFxmOVH63ffUhDNwFbk+yxM5y3+wKRBmDwph9emLapO9MfS4arAzm
         7Dbz5U0YFkqXRQs9q24WWhaTzlq8uC+fPt2HssxgQM9fsc7stzlLRPZgCws1qhbcsJ2s
         XwXGLlCD0EqZtkk/AkHaxA1X9tHyfCKISzuTHqWb6oL5af7qBDq6xiJ8PJJ7/yoV36WR
         5noOTih8dVyPL6zy8Y7dGk2sRyrZw+t6w01oqEhjckFSW4UrSEnrYxP6maRG9rS1+IKB
         vS+ujjA7S0ndPWPzTJ0vJKMNhzfTsktJO0i7xKANcE0aHWVerL3sHecXDJTUAuKzTnAD
         KdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018745; x=1781623545;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=;
        b=Tp4Zl0CZjy/a3gmiQjy2+ck19xWaACJSzlGvynwphpHqiHieJj2FnYnYLdsnZppW2X
         CGkFPwBdxbIyq/VJm4Xb2bo3pDhecsmwcarrhvH2WcuCNgB0EK9OqCm0bxj4XwXq3XF3
         0m7vNf4jZpMoSSvGlQB3EXwAVIGLq7WliSEA2gI9D9XAsQhRwGTQLkxQU69MvOLVkn2H
         XrhnvPrqfR4t3wWmQROEWxKmKQXRQI9oehR0oWhbPpQvLVmjXH4FS6q/EX6ur0ZzcRzB
         4NXssEJE3yATD+YAa9kWnk0EJLNHaw+WWnkJyJEcB53wrP9/n6jlTJ65pUc3k1HecA9B
         /gLw==
X-Forwarded-Encrypted: i=1; AFNElJ91FU5yhVaDMrP2uNe5K+LzuStBlFQFeWPz5o0bYbnArIH6DCXLxUcswxShFBw95H+FhECeXlUdIIANIvnOYb+e@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9HzX/ETzGg234Nnk4V0ZS5WWhZLucbvT69SH+dyeqRtTja9z6
	0jat6AacWQTywFZOawUYzbEdV0Nl2ATgHB/IfeaC5gMJFtOWFmZsebO6K2hC/F1pLlKvN6rxBtj
	I0yfdj/Gl9bVi4YkQrZkFIt8qx5qeK7flc/cAsLp1VI9fzX6eDtUOKCcF3x3jWYy/RK4IjCfqig
	VO0A==
X-Gm-Gg: Acq92OH46vuBqspRcXfTh9kwvqBOgj8JhUz27RZn3uBuOGZxWOuceDzCAC/lUxrpbfd
	jc7f3dYEUAaKf3y8MKlM38Gg8Jq1s8RV2c4tQ5zAA5Xjav4GhBNwuhlB6Jjgo/78RpKuQIXkUsw
	dhQF78w03YrTDTHHMJESp6HjfrTHeiGGchZySRAyqCVv2MyS0nwgWjHVMi9FTV7Mhzp8MJjA2KI
	eiRpldslC4u/unIvLdZx1JvGuMc5XB/YQ6MbKdmldbPfpJEIdfRUcRM4JyGRFD0NvyBoyB5ABSU
	x7IJl5iVzQXkZEKYRHB1M4Meob1MuNwn630rkFuGmRmwDBjAQq1hbuZ1e5SJ95ezEy9HdwqbGcP
	SuK1WdiwE4Q8Qu4SAnMnhcjmWGOOxTLY=
X-Received: by 2002:a05:6a00:451b:b0:842:7cb7:a3aa with SMTP id d2e1a72fcca58-842b0f86bf0mr20856486b3a.33.1781018744814;
        Tue, 09 Jun 2026 08:25:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:451b:b0:842:7cb7:a3aa with SMTP id d2e1a72fcca58-842b0f86bf0mr20856437b3a.33.1781018743915;
        Tue, 09 Jun 2026 08:25:43 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282880050sm21250746b3a.29.2026.06.09.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:25:42 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
        ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
        mpillai@cadence.com, Hans Zhang <18255117159@163.com>
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260518004246.1384532-1-18255117159@163.com>
References: <20260518004246.1384532-1-18255117159@163.com>
Subject: Re: [PATCH v4 0/7] PCI: Add common helper for 100 ms delay after
 link training
Message-Id: <178101873635.8877.10733384254725006435.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 20:55:36 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: -GuPdVfmrzvE6yZIudDaZVC4LzWw_IzI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NiBTYWx0ZWRfX9z4k71Z1HFr1
 qNLF92blPFpVBhgg69heQSYUgwUDjCbik+kGRZTaMsWWb1nQCJwLO7ozy2KYm1xwjhHEYyvy7xD
 xzgTEcUHYJeploogqxBSSX6VNsT9y1ZJgcYdGTsomaEnUs20ofCw85HmDrvgiJbCpJ2ixYTVu5z
 wQKdP1CWN/ySYJvjNU1tixWxlkYzR5MKu2ZnFgbVPcNwyZKpTSjD2hi97dGcwru5xAefFiZCc9c
 TeapVNZmLU9yQ2iTtSZhVdZKHgoM6BeCUp70EiNWqStM8euQrR4nljiY45l8L+0hnewVxOk2lSq
 FeH2T6Obej+ZJ/EvsMJOVd8vk12buRQjoQbcU9tpknNTsxp3lllGEP7AWfjGVfndoOljMWpNFgX
 H8sJMtd2yaHtRwGT8KKWek5wQsAuF9PCv954xq+wFOLMxyDiZoebzF85DEFg8yjdcCUulsANrN6
 3d3E0wrYkSvj3bbNlpQ==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a283079 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=snT30zDU7jmJpjBr2YoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: -GuPdVfmrzvE6yZIudDaZVC4LzWw_IzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_082546_342740_50216119 
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


On Mon, 18 May 2026 08:42:39 +0800, Hans Zhang wrote:
> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
> minimum of 100 ms after Link training completes before sending any
> Configuration Request.
> 
> Several PCIe host controller drivers currently omit this 100 ms delay
> when the negotiated link speed is Gen3 (8 GT/s) or higher. Only the DWC
> driver already implements it. The missing delay can lead to violations
> of the PCIe specification and cause enumeration failures with high-speed
> devices (e.g., NVIDIA RTX5070 GPU, PCIe 5.0 NVMe SSDs).
> 
> [...]

Applied, thanks!

[1/7] PCI: Add pci_host_common_link_train_delay() helper
      commit: 29fbf582e75015c031e7965fdd4084af123b9ca2
[2/7] PCI: cadence: Add post-link delay for LGA and j721e glue driver
      commit: 869317b95fd735684057666a65dd8ef95d4bd669
[3/7] PCI: cadence: HPA: Add post-link delay
      commit: 8dd5d65d0dc750b6890c0102c3992f4cef516196
[4/7] PCI: dwc: Use common pci_host_common_link_train_delay() helper
      commit: 681adc339e4c972b9f7a5ef8c2fb6a2f7737d4db
[5/7] PCI: aardvark: Add 100 ms delay after link training
      commit: 8a602b8bfebbf9a755e8f4732132719a3b298b29
[6/7] PCI: mediatek-gen3: Add 100 ms delay after link up
      commit: 798a96740d61c24f193b82388b681b6a4f102d3b
[7/7] PCI: rzg3s-host: Use common pci_host_common_link_train_delay() helper
      commit: 0ae259d0434bc31fc71696355538fd21027d6ebe

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


