Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD39C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6GJz2i62juPlOyegqHrF3OvjXVoMZ+oRnuJpYKATWxs=; b=PQes1ve7YRaxEj
	djL60RwUrr5KiIGfjZGLOvGPY2eR2DIBWLRXGOZcfhxoZBbSurawCAbvr57XNt6hdqM81W5k2Aenm
	9wggpqIE48jcUJo+uXF5RB1VyUbAwb+5HJZWBwnEesWYaNrp7SnAQcTg+PsrVgewWyfdkxqop6Tu9
	BzkucuEinFbDPd0I0GCQdMDSNwMxAaDcLtMDBpmzt6XmSeHM1dCbUMtELPxuC2KVo/LrTbmbrXOkm
	gxVtVxPdZLTaFEsDtwQxjPWvBasUQOE47X7cQdQQLcrjOZnC3iXDgQobed6EK1YAZM4RwB0HCVF+g
	RZvJtGKyz8QgXgL1dwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubah1-00000004SAk-3XZY;
	Tue, 15 Jul 2025 08:07:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaaI-00000004QmR-3aB6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:00:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F4r0BR008069
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6GJz2i62juPlOyegqHrF3O
	vjXVoMZ+oRnuJpYKATWxs=; b=lidSIJquc1KSKJZMCNQdU9rsDZ+ozrxfqT6zlT
	AVs4GKmm3UWz+RhjDreJgGWdyQ/ia6ucP1mXJ/pTm+f3MKuuheD2e/IH4x7LeJrT
	kF33ucan0rMDJYONdb4SaHISi8BPIr7EU5f31B9XD80uhTYcaak0t3exfMbL94Hp
	P5vA7YMnvEbDA967+WmwPRjqpvuiaekygsOU8qgxDyxjsvq9NPCh5+5wJsSo1iSm
	XSTsZkuKKMwvDd4Bbo8B4gaAtXRyk+HcnzMasRNUtD2BuN4iaLkALvMwusyGucmK
	PPe6jyBC5rb1no204Hl2COEh1NNV4X4qpruYWs3tSbXWO32Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37yfdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:00:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab5d8797ecso43426791cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 01:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566410; x=1753171210;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GJz2i62juPlOyegqHrF3OvjXVoMZ+oRnuJpYKATWxs=;
        b=Atf56stP2ApqHZGn8RPc0nuBKMFZg6DWNakltN1Gl1ENZg6SVfiS9Dt1yj3BkZ8JUG
         KfRtffroVUWHgwHZfrJX89OU4xotVD2s6dNA317t72nkRaLVcgBifKLqxQhCP17pB5/I
         r/ebTpJaTVk1ZcwoEbj7a+tTuqGnRTUEW/6GAL1t60D+9UVBeQNgV34N0mipCfYlZ1GZ
         gTluwHjbkatINnNQsCBF4JYovadnw1F9ihXmtQT2WG00rPFTKM64FTjBGH9zPg6az6jl
         /klTNmKB5wOUe4Ty6NttTgOfPkXpWHF5Q4VZTcyPd7YKi048WYhSJu8Pi/FH2Dbilc+O
         x1Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWKK7hzrDGPBGDhOSUkMEINQahdiP8t243/wlDIi5TAJQRfOeBBAtDFpcEWSloxir21TF4Xpvt4dDjbzp8QR9Y3@lists.infradead.org
X-Gm-Message-State: AOJu0YzGbEet3I/Hdvcllzl+J6ZSyFlj/sZ18s9tmQpSZsNniR4db+kt
	w0Di4NtO4vnkPl4fQiM4mD7GR0giq1N69HFegiR4mQRM65taBHgDTuH+cUgdIRWGjM05O8IH9YY
	GFXJa5yqIFsY9+sqrbWcct4psvhzlWmElaZRKmPqZBbftFQcFOb1fMtbrOq7mkd2OhCAVUe7BRC
	xqLw==
X-Gm-Gg: ASbGncssnpoYeTduA2z0AUGzHkMOkCGzAautmICmrxKYENOJZPSgKpciJqjTx+6p/mx
	4DYAL/voxlwop7NxZqVeA/afqGyb5CbJbeq7dsiOoCGyKSKkhHAInABavxKL0GUy3yIHKCD770P
	3JHV6ucUZ3aBCuC2c8OMkRLeCbvS7YM7wW6ue/29HboXd5e4AN85n70kHST0c/jdNGIjr4hjT+Q
	3OB8BQ05FHlTRKSbo9seUXJt0bdDBNfbtwbZzoOBR73glA0cfiIimgQwStd+iVEQZg9lcD1oe27
	bacwk6nMj1r1a2zRUFndjjZuyUxFXeavejy0DbAQoA2DJrhdVqlO0OHWqU9D2AxcC6kxLA==
X-Received: by 2002:a05:622a:5a05:b0:4ab:5d87:91e8 with SMTP id d75a77b69052e-4ab825ac736mr25858681cf.31.1752566410181;
        Tue, 15 Jul 2025 01:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGodpYpCiKK+ig7+dAeyUiedid2AqDR6o8ee2iwMToEcOyeNts5u5xULe5KHTQAZiadcwUvmA==
X-Received: by 2002:a05:622a:5a05:b0:4ab:5d87:91e8 with SMTP id d75a77b69052e-4ab825ac736mr25858021cf.31.1752566409650;
        Tue, 15 Jul 2025 01:00:09 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3f1c9a2csm37792461cf.67.2025.07.15.01.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:00:08 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v5 0/4] PCI: Add support for resetting the Root Ports in a
 platform specific way
Date: Tue, 15 Jul 2025 13:29:17 +0530
Message-Id: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUKdmgC/x3MMQqAMAxA0atIZgNtNRS9ijiIRs3SllREkN7d4
 viG/1/IrMIZxuYF5VuyxFBBbQPruYSDUbZqcMaR8ZYwrYIp6oXKmS/st4HsQN5Y10GNkvIuzz+
 c5lI+rsDLXGAAAAA=
X-Change-ID: 20250715-pci-port-reset-4d9519570123
To: Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Niklas Cassel <cassel@kernel.org>,
        Wilfred Mallawa <wilfred.mallawa@wdc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4400;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=8xT/TVIi8Lf5TLxzo4hzS0yvnnm7uBaiufG5Ui34iHA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodgqBRV9d193TvHdNlr2jxjHR5Q3V0is3e91iw
 OJ1a7jKZjiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHYKgQAKCRBVnxHm/pHO
 9Yu+B/4tQUVXiGfLVVZt4fAu/lYZmbtEfihDCXylY8XG/vbIBFfj6dhfaYWumgXGPGzRmnadOBW
 AjSCgaX9ZUU5+zhZI4QJTKeYjpQd0wUjXP420GLdSfoQ5o3u5/HprNyr+mG1R5XqhXJql2TKYoG
 otgfNjPLgJZRYCdQnmCHatx9vnKIi5IgdclRY2D++0J2UQxUgfjsJaNemfKB/qUvavyrtUdpyoM
 VB31LN9WMW7lIYy7SIu5saoxRxxh9B7vtTdB51HMlw1NvMA1P1N5UqSPwLxrlhKqaoow/D+2VcN
 pFbvCFrRU+PAoun5tqY3HLgLY9U/DQx6VFKlJxS+VxHElnKC
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3MiBTYWx0ZWRfX33eNcaT4Wf6R
 aNwdAyav7o/LUWWllnCcZj66TbTsAn/n2LATs3ye3KLbn1LFoTeIteRa1VIiLYVR/zU/rYxLkhl
 Ebw/62lADg1cPul/dhp1yFZPJcL94+8eEulVcuHenlDBZLzJfXOO2ZGXSXveLmP/Bh3kSrECNf0
 g6tuPQrLWhFOaniCjjoR/Xjthl39Bc5tvu68dCIRdbUIKNtj/ANPdxanJ8LaZham1hfiG2JFrD3
 fcS6a1BaFm47iqNm+5/0xxbaFQJKR9pIT/bzCSxlrvViUnJWJmtUZzLZdkGV7265uBkOc174neM
 2CMRjQqoFJwxdzImSsG0AMoosUSlMuGuiGKgHYIyi9uogvLiHb5EVF8r69wRqjOaHeIBBToL/Yl
 dzeJ5PDpvMnIIrptz6ULJwRxRCxr7z+ZETvvz20kgMrz8xjpYNsLNaLVgZ+FxdDQTJUz9upA
X-Proofpoint-GUID: FCBfpw9127kLI67gnjWRdd3SHfULS4n0
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68760a90 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=lJ8DZ0MjVbnDIa4D:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pah7fRnKCyhbKptB6fkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FCBfpw9127kLI67gnjWRdd3SHfULS4n0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_010019_034350_F8CA7586 
X-CRM114-Status: GOOD (  24.17  )
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

Hi,

Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
Port) and its subordinate devices by invoking bridge control reset and FLR. But
in some cases like AER Fatal error, it might be necessary to reset the Root
Ports using the PCI host bridge drivers in a platform specific way (as indicated
by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
Otherwise, the PCI link won't be recovered successfully.

So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
host bridge drivers to reset the Root Port when a fatal error happens.

Also, this series allows the host bridge drivers to handle PCI link down event
by resetting the Root Ports and recovering the bus. This is accomplished by the
help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
expected to call this API (preferrably from a threaded IRQ handler) with
relevant Root Port 'pci_dev' when a link down event is detected for the port.
The API will reuse the pcie_do_recovery() function to recover the link if AER
support is enabled, otherwise it will directly call the reset_root_port()
callback of the host bridge driver (if exists).

For reference, I've modified the pcie-qcom driver to call
pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
LINK_DOWN global_irq event and populated 'pci_host_bridge::reset_root_port()'
callback to reset the Root Port. Since the Qcom PCIe controllers support only
a single Root Port (slot) per controller instance, the API is going to be
invoked only once. For multi Root Port controllers, the controller driver is
expected to detect the Root Port that received the link down event and call
the pci_host_handle_link_down() API with 'pci_dev' of that Root Port.

Testing
-------

I've lost access to my test setup now. So Krishna (Cced) will help with testing
on the Qcom platform and Wilfred or Niklas should be able to test it on Rockchip
platform. For the moment, this series is compile tested only.

Changes in v5:
* Reworked the pci_host_handle_link_down() to accept Root Port instead of
  resetting all Root Ports in the event of link down.
* Renamed 'reset_slot' to 'reset_root_port' to avoid confusion as both terms
  were used interchangibly and the series is intended to reset Root Port only.
* Added the Rockchip driver change to this series.
* Dropped the applied patches and review/tested tags due to rework.
* Rebased on top of v6.16-rc1.

Changes in v4:
- Handled link down first in the irq handler
- Updated ICC & OPP bandwidth after link up in reset_slot() callback
- Link to v3: https://lore.kernel.org/r/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org

Changes in v3:
- Made the pci-host-common driver as a common library for host controller
  drivers
- Moved the reset slot code to pci-host-common library
- Link to v2: https://lore.kernel.org/r/20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org

Changes in v2:
- Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
- Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Manivannan Sadhasivam (3):
      PCI/ERR: Add support for resetting the Root Ports in a platform specific way
      PCI: host-common: Add link down handling for Root Ports
      PCI: qcom: Add support for resetting the Root Port due to link down event

Wilfred Mallawa (1):
      PCI: dw-rockchip: Add support to reset Root Port upon link down event

 drivers/pci/controller/dwc/Kconfig            |   2 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  91 ++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-qcom.c        | 120 ++++++++++++++++++++++++--
 drivers/pci/controller/pci-host-common.c      |  33 +++++++
 drivers/pci/controller/pci-host-common.h      |   1 +
 drivers/pci/pci.c                             |  13 +++
 drivers/pci/pcie/err.c                        |   6 +-
 include/linux/pci.h                           |   1 +
 8 files changed, 252 insertions(+), 15 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250715-pci-port-reset-4d9519570123

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


