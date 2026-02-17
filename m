Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA85CE9A031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOD+nAdpJf1uzrUdiNFRB8KZFSJpSBc7+kYwsye2bH4=; b=jSx4giyPO6B8Uns13OLFYH9Hbb
	fgarXTsbj/W3JKJjSjf5kkC0N7WRM5/tzdorQF1F6UcSkYCRpH/PZ1yHpIPKt+kogT2fjbV8ljqBj
	OTzqY/XBobA1jiY4lXQ+bJlFub31MkFI8UYEWO0BYn9xoHIUP+VD16LJs9Bz2Cfvmi7BtI9R9FWJ2
	GHLooGYQDZBkYHsD4LoRsSsxajziaoiydkcy9R3zFP3c6f8pjd/1xGtGYE5zKrWffGii2N74mKC9Z
	T/9RUEs5V+J8qpKQhKT7gIyd2E+iUTOGq7nNOEbDN5husz7C27Lfe7PPYUMv3ZEtNQEzsL5HrFxxV
	dCESVj8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPqh-00000008ipI-2cGj;
	Tue, 17 Feb 2026 18:31:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPqe-00000008iop-3dq9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:31:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HG8DGC288000
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iOD+nAdpJf1uzrUdiNFRB8KZ
	FSJpSBc7+kYwsye2bH4=; b=ikqywinTuKS2fa7esxmRwIAfZa+/VkzXtkVep2ZE
	n3W0IiiKCI09Rb62+jl4GeMZ26ELYqCT0N0tftBYfFXFY6+QDOChej3a3Mas2yqG
	RCWvYwNHtKP8wqMmjnMwuqhJ0jx07dd6QsxLYoJ0uu2odhj0s7dAhZSEwpzVp7If
	Gm2HYurPUjh+dI5jivTFtRpVCSHO7NVSVLi+M70EWGHqBLmnoIAjJv1eGt4MOfwW
	12tPNDU1QGg17uQH/6nQvRUUxrzVABxih+o2KKiXgPz9ZpuQgiGGaQfqGiYxBL6k
	JWhHk2noSB+Emfs3YUqPqzrTHWBo+7C0zuoERW3bxCBhRg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nruf8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:30:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f2381ea85so231368615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353058; x=1771957858; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iOD+nAdpJf1uzrUdiNFRB8KZFSJpSBc7+kYwsye2bH4=;
        b=fIZGc+1+fh348gb/fjxW+DP5M0R7Ou9jGEQxpAhGZ/LaOjxD9RV/qQdyZQkswEpl2z
         l+hjXFJ4kezAnk2D1gXkerHX1ovEcihmYZynT/Xw2O3qX/G1zJpDp3dtyIB7XtKAYtqK
         9Rmbw6IWeoyOjlGXRUj43EN2LX0is7kTFzauqZghrMlASVcLaXWy/eLkLSmNly+at7Wq
         pq/Nggw6KPN+O65IIwYjZ5BKuVwi/QB27mibH5DFh4ZYmIrpf6QTA7UaFP/M0NYgMsE4
         hCFqaC0vu5niHZ61JAwZyoXq2EKu7yUMOFjL8DBkazicCQoqeAB/cWPDxnWTLzifaHQw
         bXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353058; x=1771957858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOD+nAdpJf1uzrUdiNFRB8KZFSJpSBc7+kYwsye2bH4=;
        b=V8kjEx8/OqJKxPzAwRGEvVQUtFKAvO/L/rwV4sIQT6DFXQ8wnNeiyEKwTnUceCexpV
         DZssDstAau9/oTWnTtIQt9eCSp7hssD3G8bA7oOxWLCv4N+DvZ1p2UudQAViDSTTQuQn
         wH8FkbqGxDWlk/cPpQgr5J71UGRo3Se4LKwNd+ZLXxgx4PUf9gbev2zFoV/cMXcGEEGY
         ZaMFrYK5z76dAaC/aOGMcMiVh6vu3n+1k4mHWFrz6bhcbUk+c9PArdo/fhW7VMdOgWX7
         20j+PQ+Q+Kd8G/V2LDYDsqt5rMQNajBvdzv6o1wDCl3f1EhE0Q6C8DwJm114kxtCnECD
         TqFA==
X-Forwarded-Encrypted: i=1; AJvYcCXfQu9mL20wXkimNgcugRqmbwz+eXUmzzsFTLMpkQWXYfHt5N+5SuxEPttyea3AMyaDrC6tOxg/cMIxBbYdEgh3@lists.infradead.org
X-Gm-Message-State: AOJu0YxS0vo64n0AXgAjcuEDzq9ICchsJwGT5Ynm8WBqiU4jfaIzPb+H
	We6l2tMB04hAwfIE4SdbHdHUZHPWV/SjMmoY/OiPa8rER5umiSOxmIbe2gs7pK9LYyTMhNTYIDB
	DVNZbnfkOcjwCZnHdG8WMIOjMRUkxL1byRzwBZoiQI+sowXqGqTZFxNVflKwzS0J8cHj+Whmtmf
	gloQ==
X-Gm-Gg: AZuq6aKUoMH547pd6Di7k743BA2PM72N+Um2evGxpeVywGl6v+maCJLjTHzmAIs4eVL
	2foG00QIVslO99zVf1nTiV8I8bc8RtJ4A027uyqPmFMWYYjYdmJ/EU9/peWW9hEgHt9Ry8OaGku
	+j4/T/7kO/l/EEHLU3qdy2/RCDnmjdW14reCFq8LxXNdNsWV7EU1MOc69xvTHjEIBQcvKIc+eLC
	DWU/alYtuIvnBK8GuDP7b5IKeoxo/weuyPAjKYXxeP9+zMzJ2v9nT7BJafI8F7mvVh3mdH6gQOC
	s2lvqT2QFd/tNApwQMsceGpQl7AkIHBXqKb3pIgfOrjKMwRN92zTG00TbRFimUFkIbBoyroOmjI
	1f1DjK6goeTonkEeM231QQPy6eTQNE+oyxrY=
X-Received: by 2002:a17:902:ef45:b0:29f:1bf:642a with SMTP id d9443c01a7336-2ad17433468mr128152165ad.12.1771353057875;
        Tue, 17 Feb 2026 10:30:57 -0800 (PST)
X-Received: by 2002:a17:902:ef45:b0:29f:1bf:642a with SMTP id d9443c01a7336-2ad17433468mr128151555ad.12.1771353057241;
        Tue, 17 Feb 2026 10:30:57 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a72e444sm115401545ad.34.2026.02.17.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:30:56 -0800 (PST)
Date: Wed, 18 Feb 2026 00:00:49 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aZSz2Z5Ps47XrcHf@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994b3e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Q1s3vWhG7-J6-f9QwIA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MCBTYWx0ZWRfX85lkgcYlsV6Y
 qPDepH9ufysNUfd+gtIxY8I15cwvy6IhGEqN6Y0nZSODU009dOUIQKeI3g58vhERAavR1HmSjKL
 5bxickLLYZOI5cUWtmsf89/lb0/bPnpp7Colh6PgEx/usDD81czIGREiscCOx3Nny4uPFvOBKLE
 y8Plq5TP7ISxFtc9Oje6vOD2V8tu2nZGOpSQipR3lzsNOUEsOELn6GJslXiKT9T8q15cMb15LUP
 yyvmalKo9krrmyNVqlyUQKEpG0Kxb6CN3Nv+VJdy5IMW5ceYlwsmuXgg6ABkGYObEHypKv6Scx2
 CUFkuTuF5xp4AX0lpNVnt4n2cy8U3M7EVRhH2rVK2Xb/xcTAFUFTeNyRdFpxdGGkKtFQL8TBgLd
 W4fIqdiLIFXBtrYwk1Aa6cgKFapBFY9HFDjW5X4HBzpOw0f7jW0jLX91i5lnkHS2uS1hfN88WY7
 nObpgOJgZnHJbeuG6dw==
X-Proofpoint-ORIG-GUID: szAlwyeZT8FSdlHnzfYSUGIsgSb8KmRO
X-Proofpoint-GUID: szAlwyeZT8FSdlHnzfYSUGIsgSb8KmRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_103101_033335_F2B46EF1 
X-CRM114-Status: GOOD (  22.74  )
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

On Thu, Feb 12, 2026 at 12:09:10AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> As the last series had issues with stability, I've changed the approach
> in this series to concentrate on keeping much of the SerDes related
> code within the qcom-ethqos driver rather than trying to move it out at
> this stage. This means it should be possible to bisect these patches and
> pinpoint exactly the code movement that causes any instability.
> 
> This series starts with various cleanups to qcom-ethqos (the first four
> patches) before beginning to move code, passing phylink's phy interface
> (which will change) to the fix_mac_speed() method, and then using that
> to configure the serdes and inband setting before moving the SerDes
> code.
> 
> Please test this patch set, and let me know whether this works, or
> where it breaks.
> 
> Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 114 ++++++++++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
>  include/linux/stmmac.h                             |   3 +-
>  8 files changed, 90 insertions(+), 61 deletions(-)
> 

Tested without issues on:
  - QCS9100 Ride R3 (AQR115C PHY, 2500BASE-X) - 2.5G/1G/100M
  - IQ9 EVK (QCA8081 PHY, 2500BASE-X) - 2.5G
  - QCS615 Ride (KSZ9031 PHY, RGMII) [0][1] - 1G/100M

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
---
[0] https://lore.kernel.org/netdev/20250819-qcs615_eth-v4-6-5050ed3402cb@oss.qualcomm.com/t/#ma85cac924488d580b971e6477e7df30dc7e48045
[1] Ethernet is not yet enabled for this board in the upstream kernel.
    The changes from [0] were applied locally to test this series. I am
    trying to figure out how the board deals with RGMII delays so that I
    can revive the series.


