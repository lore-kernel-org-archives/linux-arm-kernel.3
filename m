Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87CC10A88FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=; b=qIb8lTV7QbaGdrN+PE5rRdO0EJ
	cu6dJAsfwu1clABGIAYGFCHAuDHqpgLmq4HtEkFEw7UdI2TbeCZbTHfTB+SGqtMqyTcvJkbfJb5zG
	OzzRsvhk/nFsla883wHdY+FWA8hcDJlFISTfXfq65zzD4oeicpnMe+YaOFFarz5EZe6XA2VVSNa5X
	c2U9p4ob+fQy985nSHNdE7WCdgEgl+wa6ZLJE+gWlUnH+N15Cx5YAt/Na6pmDdJXq8p5jbVuC50tz
	i1wyHuVYLxrE8oLgwAjj+3sPrDqDNQWFdepTsLtTqj5EruqpoU7sFMQZgeN3tLyTkMD8HTG0kUoDI
	WfChMcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pST-000000062Fi-0Od2;
	Thu, 26 Mar 2026 18:29:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pSP-000000062Ep-0trv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:29:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QI35Dj3757696
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 18:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=; b=ENRwTg0wQgzSXmjb
	Mfte1+W3mldM2W+BFRwd5RobDOHcS6s8+faGOe2/GKEJD9WDyst+D6RhEif5zxkB
	f07S0mjqTvx+yjrj1RV22kPs2lTRdBsFTG8Bm6Flb9AIB6BxNP4kZeg7Mr4CeZiH
	r4AN05B/ZgCQNZqrsF40onb9wXoeab19z7+GnYtCUeQ3/EpHuqsyPDLIY1OTOPwj
	BpPfmU9Z0JNE9EFMybPlewCnDrMBcv008XOVT5vhTlktjiHVgD0LP49Omsr9vvQx
	3060uUgJI8cqVgNyDUGp9xoPwxoOzWirQICEKpKbwV6laGntEqoPrjAQGofLKPqP
	6chb/g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1835v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 18:29:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a82f78a20so2473827b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774549763; x=1775154563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=;
        b=d9qQ8D1EMjtzcw5lzSFzAGJZ1k4Jm/k5bWP0s6vnOiMwui7tm9E57t0dqcEMWNYLlH
         STd1NrLDdQ5E8r3djnwNi+qZk52Z2Kj8/7wlyoHkaINnpqhLitTJk1CTZiPxEmnnot8r
         NniLgtX6AmoRyTHTLdxWNjPDG4s331YFCwoJ7C7GVhCMK2PGynPleB77cNl406KkiZyH
         XzyfAWovtDGNBQL+DSWsYmDrRgEshroB7a5vheAR3dHKt5kfs4ra9Sry6m5u1JMnTV0D
         Yr77ggCTqm8IjgVvAF5Ac5g+9Kj1Re8xGvEUoyPZ6uKWVzXNH/UGXCmXva7ecLVukBFu
         K09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549763; x=1775154563;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=;
        b=tME4ZaZ/x6t3ai1bvoM5dfg6bA9tolsmfGOHBx4iE/VvMeqiwuYqv1ynnzYcPf3SGo
         G++3vxdSUTD3HGIViGG5OfnKnYFn0Mfz+YcZMm/KrRbZCLEkOx7jDOc51SJVtzDAqe4v
         gQVaj+fc/sLgMXMeZBH32V9yOGY+clXJ7p2dl15U8g/x3BRK1mw1wCZlfoT2lsOTYUiI
         jwg3hQ+zyUcU9QJLtbJsxBjKkaCJtaM9HViepKiwlG2eoZJ3mKdnlz9vtlDhr2sMHdsX
         OYzM0I/vhyyBA390KOETDbpYBIBtGjtDlLBkoCiPRwD+WgTiBG9E2K0WZstKfoCrU6ob
         Yq2A==
X-Forwarded-Encrypted: i=1; AJvYcCXq8wW+wVEi9V4QRCe6+1201/TnjDzfC3mq1nl5l3Oqw1hN4HH/1F/l3YalXN7DBpxnCJQNvUCKttetkDPlT34v@lists.infradead.org
X-Gm-Message-State: AOJu0YxKkQmEz0+A/iCcLwOLuJItyKVI4vfOXoleDrSbKTShZXdpPzZp
	QKsivRS8Keoxbh98i1+XJ7PLwXJWKJtfyp5X2oEL4SqA/Vn+P5FVVJwDd+mCcPbjoMqiwUx/ZAa
	xqPXgwkS7Zq06OfwWv0FzB5J0wizK3tcvsBU7rpi0PR5en5qjFpM89KnAs0/rZX90KfWEoS54Wi
	o3Eg==
X-Gm-Gg: ATEYQzwgaJJy5d+BFfAZXGT/odiqzfy0AdcP8+9a/PsqsL+AiMGL7bu3JbknwRBjHlu
	wJNEdXemviT0AMVdZORFjDWpkhQNVDgu7kmMHabG6sxmRDidAX7zPvUfb+KQWCW4RH1JTkd/+aQ
	TZx6UY/hxXxH6uaQCimfSjI4t/9coy/gbKMikwdzyhzornjIS37IZspGS/pF/wbWu3ng4YzuLac
	KswvOTxtxlxUsNk1XyUJoRsv4PKLolr1H850zHExKzFp+Kv+RkgrpN5J6O6vb0CvcRWvLUIrqpA
	1XWE/oYQRyE6BQWfDulogUZ7HNrqd8Lo2TNyrI4RKie3r3kHDR5swm/ih808kO1Ve29xlJ7nDe/
	VD4d/1IN/lzgepzO8ZzqR28U=
X-Received: by 2002:a05:6a00:430b:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82c6e0da77fmr8829081b3a.47.1774549762467;
        Thu, 26 Mar 2026 11:29:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:430b:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82c6e0da77fmr8829059b3a.47.1774549761916;
        Thu, 26 Mar 2026 11:29:21 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d21777asm3568532b3a.18.2026.03.26.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:29:21 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, jingoohan1@gmail.com, kwilczynski@kernel.org,
        bhelgaas@google.com, helgaas@kernel.org, florian.fainelli@broadcom.com,
        jim2101024@gmail.com, Hans Zhang <18255117159@163.com>
Cc: robh@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawn.lin@rock-chips.com
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
Subject: Re: [PATCH v9 0/5] PCI: of: Remove max-link-speed generation
 validation
Message-Id: <177454975543.471319.11131195385745201008.b4-ty@b4>
Date: Thu, 26 Mar 2026 23:59:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEzMiBTYWx0ZWRfX944Hi2MrLHl6
 Iy1EpV4zpItikz0kvYYpcqSF+nPwoaGjfXnZmbilOr4jCKZZpOc4qzTrwnFO+Y+fWHqrBp2veU3
 ole8pUccwpD2a+fzVE0yYdsqX44gwwlZxfE0PSRg/H7oBoQ8T8/8BXyB8RIpoFmGxTv35QUefxU
 Yj+KN1ycynw7IhYQZYZ6wbuw2i4r7Yd4PfnesmnnpkbRmtfx/a2c0Vn9SL7Ys5N1ati3QvUA8I8
 PvIIMu7iw9ulJPY5wg7OqvbEFyFbc56VMjyoXNg5yhWp9amrKoRJbwW7lOi/PgTEhHywHLenz/D
 CuzyFQgafUN0pGeuL1LCItUmqWmYkb5Zy2JvmmEY6DUTzm702+/T8YBU1DFaF4il2ids1oc1fjw
 6R2482K8lArr/0+LZvEAVYmlrehqlhJIXyyq3lUD/n/Jgb+vgYLAnTrkeEXMx5XWTBEhBchsy3N
 XZX2XqO9HIsZKMjqe+Q==
X-Proofpoint-GUID: viIiopXLBzxBfnaSjVYziTDjsv-8axRz
X-Proofpoint-ORIG-GUID: viIiopXLBzxBfnaSjVYziTDjsv-8axRz
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c57b03 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=YByT1-VEI5v2HgF6YmoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_112925_376799_1C9443C5 
X-CRM114-Status: GOOD (  10.93  )
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


On Sat, 14 Mar 2026 00:55:17 +0800, Hans Zhang wrote:
> This series moves the validation from the common OF function to the
> individual PCIe controller drivers.  To protect against out-of-bounds
> accesses to the pcie_link_speed[] array, we first introduce a helper
> function pcie_get_link_speed() that safely returns the speed value
> (or PCI_SPEED_UNKNOWN) for a given generation number.
> 
> Then all direct uses of pcie_link_speed[] as an array are converted to
> use the new helper, ensuring that even if an invalid generation number
> reaches those code paths, no out-of-bounds access occurs.
> 
> [...]

Applied, thanks!

[1/5] PCI: Add pcie_get_link_speed() helper for safe array access
      commit: df61f4732adf9de5ad1f5e71b7670710c1597d18
[2/5] PCI: dwc: Use pcie_get_link_speed() helper for safe array access
      commit: d884b0e51459175f17ddc52759ea4533bb752130
[3/5] PCI: j721e: Validate max-link-speed from DT
      commit: 1542ac6d83d0b5706f45e2937de7b4f7b8c4831d
[4/5] PCI: controller: Validate max-link-speed
      commit: d0cc5918a1d539344190cbb19fa3ae0e7b0dca1e
[5/5] PCI: of: Remove max-link-speed generation validation
      commit: 15217c7015c0e1804925693c55d721aad8987e32

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


