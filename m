Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7FBFB44B1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 05:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yTMN2l5WkkkwpWqXhyGv2MqcOf1QG4ZJfDdEl00tCos=; b=EIbIeBYiWSri36
	m1EvlqAdPU5/SZr7lv7HEos/VTmJSxOS2wKKjMIIOTC/lmL/CUIxR6WEZ4vvvzoKQTPHBr+/tneej
	QhdQJcTEwdRaG5qXnnvbIbuQpwZuYKi1MiS+bX6dRdsC8Qpa1GSsvYuR2NR1KZllI/BBKjQ/pUxqq
	+EplBKZIKoGIhm5VwPivvb3VTseOp9TLhG7rUn30mgAedTbLnydDGXwuiAVZSBEIDRR7M/AphiyxH
	A/aGibZsc43WSIkDzpJegoZJH91Ot6UVuW2iNyKQoKoAuFaKqwuUDIB6Qf9mru8NNrFKohUUXQ3Y5
	Pk73b7msgfAuNardUJ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9Xe-0000000Cgb5-0BRC;
	Fri, 24 Apr 2026 05:57:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9Xb-0000000Cgah-0DxY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 05:57:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NNRfgE1888411
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 05:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yTMN2l5WkkkwpWqXhyGv2M
	qcOf1QG4ZJfDdEl00tCos=; b=MQtcYpEUYiNQ6ouvYFCY2hN7w3wo8Buj0qjRiY
	Cs0V26GdDiI+8cixO9L0s0GnotUXPU8KmW2esxPobQoRrgws7mf8/sBbUwqf3/5I
	WX21nQs9JKIAXhCr6frgHg2PJk/Jb19jf+CAxtbdrrrNhuR/io1XbPtLYxWdqeEa
	GKJfQJHDyKrvYvzLyqt3cYfCM8CsDZQUqKTT4rstdydZpL9aM6hzshD3mhGukIFe
	V7fQiubMYXayk0ncykH0WF8j5wU1MozQpfvFgvH/mtA90uk13P83jOB3nAndEZ9a
	LY1am2uRPuODluYYviP6O5n7FjEtVKvm1rHMWgaRl7N9eP8g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9dty1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 05:57:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c709551ec08so8338980a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 22:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777010244; x=1777615044; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yTMN2l5WkkkwpWqXhyGv2MqcOf1QG4ZJfDdEl00tCos=;
        b=dOOmDnD3aaXuLBP5qHsTopn613uQMHyQ8DbAlSR10Ub/O6T6GUL/7V8hFPsngNO+Pa
         AxUrJ3R3l/b3nGIi0UgGhKvHlXcNkJJSp/QzAKiD9g/HEz3r2Q0TbLqlIGeMIjJSO5tC
         2/HJgoTwEYVcMBm1a/4wUSjOJrZEV41aIcPRblgGwHM+iVq7cY/5MBsOkquNgI9NqfEv
         o4OMsV9HR/A3bU+zQU2VOvgzJw6TKNGMH3SA2Kbr/wZ+FxZ6e6Mxz1q90vS5lD4uy6x4
         BswrGyzmqp+nFmB/opq/v8YWJ1HOzLvpyvVI9yNi76eUheqZH6rjpiwbetKZGtYU8YqT
         31FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777010244; x=1777615044;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTMN2l5WkkkwpWqXhyGv2MqcOf1QG4ZJfDdEl00tCos=;
        b=j7AvFHPjhe+qjnJUpptZeB2qeMW7AjAuNVf9KBR46rZno2ruwGZ08cSOIjr4Vki5b0
         4zt4rpEJW3dP9H1tUNnrdBKvAHrhQsxTBkEa/bGQQP8ysYXMQ+XIiZ/RVKlOY5lm+6Y3
         em7+fsl3GpHxN/gbomdvfjXx8RiIQESnIZBaS9tFrQyyywDAWCvr14a71yV8NWLTn9LH
         yVCpSEw6TRi4+KiTZnCDfJ1ZtTzxOcurUYO2NEr/d25zrWW7iqlQWSrWYRkIlLFhvmVa
         sz47n0iccm8myfdHkMzRGguimsxjWOMJ+72thwGXDbzu9JxLHMK3ms7xpATqM8l1RPeL
         544g==
X-Forwarded-Encrypted: i=1; AFNElJ8xLN10prE5iwE/AVnN4hx7G1NFlI1OVRhvMh5rkPFC4xrPyBPOT/XK1DIfSYabgCh9u8tvGdKn0mxj8HTgKq4a@lists.infradead.org
X-Gm-Message-State: AOJu0YyI/I5Xjc2ozOP6C622h7EbsWMSzAMJfF4OoIDjV9jDrUDelhNT
	vnS2g+oFkxP6BDUK+htsTX+Zpx7M0XsG8rpcigD930Mp/BG/mpjEiqYb0JXh1T/2GnOlEmSKFcA
	UUrnaQrTKMlIWgxrvL6kLWzwzJPtoY11qAlcvl3g2/hMKGKx45shGrioLRh1hEQqZU//zk1W3QD
	LG7Q==
X-Gm-Gg: AeBDieuW16D+Pq3B6vek9Hva/yliNO7elq7GdIW9qqwLzFtyJz/Bdy395CoWkjI3TrB
	HJpJRJaLQNrqzt6MfaBp1A9tvPnm5K41zjeUf/94cNnrcOlF8oKk6eXK/vWjKmyizcyc5hdvfKQ
	DW0xwY/WOZIUGZjdjqgyAt14OUYa+g25BuGfZjDFTE95BvArTE32watBrJupo59NcUzOClxBoa8
	+AwAIt6FFR4VhxqI93z5wAegeCH6eS1XjvK2x3aAsGGEPJ5yKaAB0ilN1H586y90BUWfIMQiive
	98LUIvgDg6SW4hdS3znLFa6lhguWmNPNxUUlOQHEeCoCt1DWuSFPFwWHjrUGjGCtwBMu54zHNAA
	7hBU+Q0Yp//kEyRv6VvMDJLBs5w9qBGxQH16a1Y8OSo6aLSgcdbsMNUplSY5Tf0qCMDo=
X-Received: by 2002:a05:6a20:7292:b0:39f:ebf7:5ba6 with SMTP id adf61e73a8af0-3a08d7abf91mr32181494637.25.1777010243925;
        Thu, 23 Apr 2026 22:57:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:7292:b0:39f:ebf7:5ba6 with SMTP id adf61e73a8af0-3a08d7abf91mr32181453637.25.1777010243387;
        Thu, 23 Apr 2026 22:57:23 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79770512afsm17288101a12.31.2026.04.23.22.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:57:23 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v14 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Fri, 24 Apr 2026 11:26:07 +0530
Message-Id: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPgF62kC/33PwW7DIAwG4FepOI8KQ2Bhp73HNFWOMStS2nSwR
 puqvPtoL8uB7GLpt+zP8k0UzomLeNndROY5lTSda4DuaSfoiOcPlinUhtBKO2UUyAvmwoc0nU7
 XA/E4FglkzLPrkYcBRd27ZI7p+4G+vdd8TOVryj+PG7O/d//TZi+V7AIMxExkGV6nUvafVxypT
 u1rEXd0BrWWfEsCVSlyOhKiRQj9FgUrStsmBZWCyBEtKe41bVF6RZnmf6ArFZhiMMoyo9+izB/
 Vqb5JmUpF9BrYa+dgaFDLsvwCdDU36+YBAAA=
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777010232; l=8281;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=PeFaW7Kdrw7pS2+czBSVD/S1WiB/N+6erzrmdMB/5Y8=;
 b=fEKGmPri8LDYPP4nIodsRoCyeyYT1OGPS0OqEqaH/APENLrZpB+Q8nuTYzbfPqq917ee5aP2w
 JYKMUiobPcFDsrp7EnUv2N9T4k7yYV5sMOp4PQ9MR9EoL3rLLaW0Suj
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: N33eaDXfCCjDnGSMSvodqxjqtlLknPbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA1MSBTYWx0ZWRfX0WoEvRuA7UoQ
 pjytBKA/94P8dE9LCFRY3Gd6ep1EyKUZ8apTQMS/Se2A5UfWUG/p+FiawnYnKMOeU5hcDsCCHYg
 QZi/lO56aj6dPRpkvG6gaTemygjqI10Wfw5/2ztuHg8ftriT1FM+IvKsWNKr8Qt4yJ1eIxRX0iw
 yAW7ufW7BUfFiSwS8hUtRg9O8eZgjnmmKq7auLiAuQAdDWu531nr/SwhDKZWWjxWOaCTYEZHbrV
 /4Kll0mVh6VJGeRwyo3iTDfvDAXH5OGCn3tvEkHV3m1EeHz8cRVrgkwFm0u003070PX79LdngON
 kPs2VHRpX5XTlyXfXZe/rz6DaUymMbkaoW1T9715HtOjjmrHBgACqA3wQMeyrfGgOyEpJjYpI6o
 umpf5fuf4aNSmUMQq8iKH1WkEzJ17EtS1swSfHm6f6RcxLFW36GqsGlD+9K8Hi07fKng8y2/8wy
 24RmDyFD+TnH58OpK5g==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb0644 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=tA7aZXjiAAAA:8 a=7CQSdrXTAAAA:8
 a=8AirrxEcAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8
 a=DBfv99YmAAAA:8 a=JfrnYn6hAAAA:8 a=cWRNjhkoAAAA:8 a=fRNrpDd4OrOfg74B-YAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=kIIFJ0VLUOy1gFZzwZHL:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=sVa6W5Aao32NNC1mekxh:22
X-Proofpoint-GUID: N33eaDXfCCjDnGSMSvodqxjqtlLknPbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_225727_236993_71F76D4C 
X-CRM114-Status: GOOD (  21.18  )
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

V14:
  - Updated Patch 2 ("of: Factor arguments passed to of_map_id() into a struct") to
    fix below two issues in of_msi_xlate() that were introduced by the API refactoring:

    1) The refactoring changed of_map_id()'s dual-purpose **target parameter to
    an explicit filter_np parameter. In of_msi_xlate(), this caused
    of_map_msi_id() to return 0 (pass-through) instead of -ENODEV when a node
    has no msi-map, terminating the device hierarchy walk prematurely before
    reaching the root complex node that has the msi-map. This broke MSI
    allocation for PCIe endpoint devices (e.g., wcn7850 Wi-Fi on ARM64).

    2) Additionally, fsl_mc_get_msi_id() passes msi_np == NULL to of_msi_xlate(),
    which would dereference NULL with the new API.

  Link to v13:
  https://patch.msgid.link/20260408-parse_iommu_cells-v13-0-fa921e92661b@oss.qualcomm.com

V13:
  - Fix bad_map handling in of_map_id(): 'cells' is re-initialized to 0
    on each loop iteration, so the !bad_map guard was insufficient, cells
    stayed 0 for all entries after the first. Fix by explicitly setting
    cells=1 when bad_map is true on every iteration.
  - Collected Acked-by from Frank Li.

  Link to v12:
  https://patch.msgid.link/20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com

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
To: Nipun Gupta <nipun.gupta@amd.com>
To: Nikhil Agarwal <nikhil.agarwal@amd.com>
To: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Saravana Kannan <saravanak@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
To: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: iommu@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: xen-devel@lists.xenproject.org

---
Charan Teja Kalla (1):
      of: Factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   8 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
 drivers/of/base.c                        | 215 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |  31 ++++-
 drivers/pci/controller/dwc/pci-imx6.c    |  34 +++--
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 257 insertions(+), 89 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


