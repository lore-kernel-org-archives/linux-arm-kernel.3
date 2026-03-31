Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B939F109B46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dF4Obv+MCSq8YX0P9fxlsKGDvf3O7jRLPn7ezaYrn94=; b=nS2gP1B2ZoDb1F
	8zODc6y2LGcl+fGV/OwBLNHbbp9aZAXddE80xp2tOcOdTVDn3RkXcWmlgYt3/EkZLxFHnCE+Y/2rf
	DXnEoZKik5MPEEEsqXnwKlfdwczbhNBMN73EkXWVjRxQuhDQaIrBujgZ4Z5zr5NKR4Gjxt/MmjT19
	OjDt2Ysy6PeCy3b5bHnOBbuLIPzRNJmgn7M5RqyNxHBqFB9UwM8DkziTnoHuxFrtEIYVaLPF2IMH7
	e2P9KFhc7fhhR3DOHLj66j5KvRtUuE44zAgu4x30epJTwvZHHGtFpRpQwHLSCd40c7vJSmtlTJjeo
	7ARdLZi6ZTQ5iVU1T8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ZiT-0000000D2Kc-2WcU;
	Tue, 31 Mar 2026 14:05:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ZiQ-0000000D2KA-3U3y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:05:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9v7uU4053792
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 14:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dF4Obv+MCSq8YX0P9fxlsK
	GDvf3O7jRLPn7ezaYrn94=; b=o+CZ3OYj5iT9TfiBJQQTNFVxOHbunQR1j75oeO
	V3YExJ9yt3v/berszKeoWhGOTfi7pdx2GszMQHo48JYAU4vMf8NDj8Qol95WDQtj
	kt2T2qTsSbyWa8Owfkr7utvtrdrH/tohASWBGdMgXOFCECs/gQ6G9iGT+CX3Q2Xc
	MrxqC4EpUdV34HwujWpWIX33DvqEuY1v2ktIbSrDFlRavZFTK/mi9G45ugA5VxS2
	4p7HP8tJJewyZqCsT3WLyCNuBgjgDqmXvj3RFLnzpkGM8rO0prd3v4Kyh2YFupV0
	cMO3ds65t2hoqTNMhqZklxT7/1qmTsjk7AFjVByktZZBITRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3c298-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 14:05:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2471321dcso106109145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 07:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965908; x=1775570708; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dF4Obv+MCSq8YX0P9fxlsKGDvf3O7jRLPn7ezaYrn94=;
        b=Gurp7atxTe/tFt0F6kjmjqmfSAiE+7u5wWflJD40gU2euLqkCByBgayQLflQIm0M9h
         jdU3hQd5HX3vvPUoXsFn4aXnxvKxtopCQ6O6k7Hu5MV0wM3YJaESeYJXzuH18n+CdaZ+
         gt9w3KQayG4lD5zcjwxR2heeXuTChNL+NRODW+8gh7HNuO+4sP2wGvKdL9c4M6IRVhSE
         KxiZf+wTRzPErT1p6C4EuZfbFkzQRir3qPnPkZEOoA+nu95Gqd2j5efAk5ZDNUF/jM7A
         43lmyyW2e6orKGGA4NNsQfXgnl/kYbsqv6UkoTfmiRblPTcYok1WELm6YV2SC/MCYU8o
         nDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965908; x=1775570708;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF4Obv+MCSq8YX0P9fxlsKGDvf3O7jRLPn7ezaYrn94=;
        b=kZSncg3FlFL4DyixoeFBKYV04wyklGWmKL/eoalyiaQ84Ihn9PdRWExT5XQujEd03c
         kU2933sznV27ssMWpYDJAVa/Q227nb3hIIrJBdlRIM8Cg+6tOQi+9zG20tCx+2BoilV9
         73mbEhGci6D9owsAJvdcJBUJq7xum0Puq265rHcKf7t6ku3uEQEnQLDPm9kVLXWhUrAl
         BgymJBVdxxcpY04R9CYOWEYHEqffwc9FmAJO/jDj05JkURohi9oGUaSgok7qOiu+5JbD
         DN5+D4R/unlfNyHOfBrUN52Iv3hWVosoiLV89w7rtcsbJCQ1fJJSm7S2jO1DuEo0nOfc
         y/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0n5cysAqwJjmlHhLPRdVuhHo43g/mKZ7yt7rZuroC075zk2/YqIt9F8ka/dZJZK1QSYjKHwOyp1TUPqLn5TsB@lists.infradead.org
X-Gm-Message-State: AOJu0YxkeKyNEZ+7RkyijNL7TVmD18sqhcCACNzZgqkl5yzU3oOR2ApP
	O6MhGdFcF/dvhXKjh/tRC31qoNX+d45aZ6AmNIrAMMiQYGvnfTxYsWWs2YE2rxnXevY6BTU9D6t
	AV4YTsT1d0O34J200MUghXbqllFyO5g73Ww2B7Q70BkGfoheRGH/cXL/6RMr76VYEm66+hZT9Yr
	AU/g==
X-Gm-Gg: ATEYQzz4BvjSD0pkzQRQOxd/2Yp7an14hiIoFz0+1PAuDpB1ezpQvUGetG1guncOCCO
	f/KlyfoONIQ8mqSUTaFA9shTjGhVcASyylHyO/HTR+scvNz5xIi3Ai09NbgBhnt5sGWRHaBo+Sc
	2hcJV3PHaTyqAxgHOnMqd1FPvUI+Qq+YUh/3h7wSzEDvmm6qZrJHakQf8uwomnA3c2Yf3F01dKO
	2SllZ0xlekzo+A10fMXy4EIFIXzZIynjpztj4vKfm4T7FXJIjTOo1KED0y8hp0QS+y6iaOl8+HC
	erssCt34jj2Q1QUC6uUbyIce9vWLIs6akJjqWgW4Z1LKKWDj0GPX6l4FvyBpTXN0QXUhBICZzIT
	z22nxQgnNWmfKUkFonPgsWqEwanCELxr+hTF8Io9P/418tVIFQTk8LluM
X-Received: by 2002:a17:902:ced0:b0:2b0:c2d9:270a with SMTP id d9443c01a7336-2b0cdcf0019mr180935915ad.42.1774965908088;
        Tue, 31 Mar 2026 07:05:08 -0700 (PDT)
X-Received: by 2002:a17:902:ced0:b0:2b0:c2d9:270a with SMTP id d9443c01a7336-2b0cdcf0019mr180935015ad.42.1774965907346;
        Tue, 31 Mar 2026 07:05:07 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264292asm118311945ad.4.2026.03.31.07.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:05:06 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v12 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Tue, 31 Mar 2026 19:34:45 +0530
Message-Id: <20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3Uy2kC/33NwQ6CMAwG4FchOzuyDkHw5HsYQ0opsgQBNyEaw
 rs7OHFAL03+P+3XSTi2hp04B5OwPBpnutYH0IdAUI3tnaUpfSG00omKFMgerePcdI/HkBM3jZN
 AUXRKUuSiQOHvesuVea/o9eZzbdyrs5/1x5gt7T9tzKSSxxIKYiaKGS6dc+FzwIb8VuiHWNAR1
 FbK9iRQnqJEV4QYI5TpLwo2lI53KfAUVFxhTIpTTTvUPM9fQ6NMd1ABAAA=
X-Change-ID: 20260301-parse_iommu_cells-1c33768aebba
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774965896; l=6029;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=P2NjOwOfDO9uAKBSdnt+bXSNB/+yNSJiXlluqOTEHNk=;
 b=66lmuzH48rtm0FKXbMJnsG4s1A7Kc60A/4pJcguDLuPcx0lroADqyzlA9wif2kvUXlYq0+jLu
 KAnx76iLFtQDeoanD5WsP5LMaqzqXOX3e6iR/p1Nc5+FJv7Y4Bg5pDi
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cbd494 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=w9jVfKxUgDq0yQD5sDkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ekm7jKe-bLdwIw1i2OPSSP9Z7sIdPJVz
X-Proofpoint-GUID: ekm7jKe-bLdwIw1i2OPSSP9Z7sIdPJVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNiBTYWx0ZWRfX3AbCxXLiVFP9
 qies9XH6GSGcdacKcaUQeehQVa008iPLYyAUj+fVwuI7EhVO5fs3TBkPuu+nWnnaD29GyXtSLw0
 hcQmxA9Qu0GhMj4cVGangtnE1XAuaUKkJo8zg4AOmp2lWC5BKkDyUKG6JkVOLt6oLd7/chR7Thl
 4KcVwvK1mOQBTwGHAjh2p1x7ewcg7jydSGF4Wj2o0aO0H9oWA8DSYKUHWyGAINABTl6PFlh5Gg1
 zO8i9Jz18Psb980J9zx5szvJvn80Sqm82+JVpqxYVJQNwXff3XWL/hH2UHNfmqb7jeAxKIYW5nW
 AGIUBrC99wEu9FPCHOG6on3yFCGgG7yz2yfckGon0ogkCuVFxko+eg87jZpIkXKl6ShU2PE8pvc
 htiwt/N7EEJHmLTSQOftiXPTINL16TM7mSZuj0CoG/WnY3DQv3bwJ63p4uVn2vkD19K+UkmyBZo
 skTBtp/n24srOnSPhbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_070510_907926_22439777 
X-CRM114-Status: GOOD (  23.25  )
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

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use[1] in being able to map at least
single input IDs to multi-cell output specifiers (and properly support
0-cell outputs as well), add support for properly parsing and using the
target nodes' #cells values, albeit with the unfortunate complication of
still having to work around expectations of the old behaviour too.
							-- Robin.

Unlike single #{}-cell, it is complex to establish a linear relation
between input 'id' and output specifier for multi-cell properties, thus
it is always expected that len never going to be > 1. 

These changes have been tested on QEMU for the arm64 architecture.

Since, this would also need update in dt-schema, raised PR[2] for the
same.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
[2] PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

Robin,

Could this series be pulled into an immutable branch/tag, if it doesn't make
it into the v7.1 merge window? There are client changes dependent on it,
So it would help to get them moving forward rather than waiting another
cycle.

Thanks,
Vijay

V12:
  - Call of_node_put() unconditionally in imx_pcie_add_lut_by_rid()
    thereby addressing comments from Bjorn Helgaas.

  Link to v11:
  https://lore.kernel.org/r/20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com

V11:
  - Added explicit filter_np parameter to of_map_id() and of_map_msi_id()
    per Dmitry Baryshkov's review feedback, making the filter explicit
    instead of overloading arg->np as both input filter and output parameter.
  - Removed of_node_put() from inside of_map_id(), making the caller responsible
    for reference management. Updated of_msi_xlate() to properly handle reference counting.
  - Collected ACKed by tags, and fixed minor typos.
  Link to v10:
  https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com

V10:
  - Move of_map_iommu_id()/of_map_msi_id() from include/linux/of.h to
    drivers/of/base.c as out-of-line helpers per feedback from Marc Zyngier
    and Rob Herring.
  - Add kernel-doc to document both helpers for discoverability and
    usage clarity.
  - Fix of_map_msi_id() wrapper and all its callers (cdx_msi.c,
    irq-gic-its-msi-parent.c, drivers/of/irq.c) to correctly use the new
    struct of_phandle_args-based API with proper of_node_put() handling
    as per feeback from Dmitry.
  Link to v9:
  https://lore.kernel.org/r/20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com

V9:
  - Updated TO/CC list based on feedback to include all relevant
    maintainers.
  - No functional changes to the patches themselves.

  Link to V8:
  https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/

V8:
  - Removed mentions of of_map_args from commit message to match code.

  Link to V7:
  https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/

V7:
  - Removed of_map_id_args structure and replaced it with
    of_phandle_args as suggested by Dmitry.

  Link to V6:
  https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/

V6:
  - Fixed build error reported by kernel test bot.

  Link to V5:
  https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/

V5:
  - Fixed Build Warnings.
  - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

  Link to V4:
  https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/

V4:
  - Added Reviewed-by tag.
  - Resolved warnings reported by kernel test bot, minor code
    reorganization.

  Link to V3:
  https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/

V3:
  - Added Reviewed-by tag.
  - Updated of_map_id_args struct as a wrapper to of_phandle_args and
    added comment description as suggested by Rob Herring.

  Link to V2:
  https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/

V2:
  - Incorporated the patches from Robin that does the clean implementation.
  - Dropped the patches the were adding multi-map support from this series
    as suggested.

V1:
 https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

RFC:
 https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r

Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
Charan Teja Kalla (1):
      of: Factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   8 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
 drivers/of/base.c                        | 213 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |  11 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  34 +++--
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 240 insertions(+), 84 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


