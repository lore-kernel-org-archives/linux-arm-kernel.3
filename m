Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD2D1073C8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7S+jIsI8IolI8S/0NzS+SUgTDKQIENCfMEWeyQ17RZs=; b=1FvDlhldzkKOp0
	BMdyZUXs5m/r8N9Jg4yIr8aKA2BA0Zc0MVq70NlLrN4tEZc9cq3OwBZ24YICzcCQrlZNxKp6KpP4S
	X8CN9rfXNdnCGVQMDfTRp3sr9TlIgTe79LMONcmHAAWuyx3rbhA4hYBW/wyMaISQL+Odq0MZ1vH+M
	R1uXm5hR5nUq/T5gn6JRVqmDvSOBzw7cJHMyHRY+L024kzbNDk++YX4MizQzHzmV1s22mbDa+s4Kc
	6kgQCBQCrtVEYkLq3Tpr0nD3EGjbpRqVzwNoaRQSDoFlklfV+CrvPWEf1I4lAu28rBCGLUr8ehudj
	0xFRbjjpuoZ+mpcEKwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPlE-00000008eVb-3yGW;
	Wed, 08 Apr 2026 10:03:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPlB-00000008eUr-3w9b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:03:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638700LU1619683
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Apr 2026 10:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7S+jIsI8IolI8S/0NzS+SU
	gTDKQIENCfMEWeyQ17RZs=; b=E5a+CiVGxDzyfBjpQZeW+h8coO6mDpkw3C4VLr
	Il7IruwRRyGVifBF2tWEIh0RITVBUh7wynkqqBDiu0qvVthDXizphb40Z0fXg7l1
	4ePD+LWpuMLVmio17YTK1QVRNMPOyHYbMWFwoed9dZ4dSV6Mg9UfbYAstBHh0LrC
	ZcRfFoLo3Ctd4aDMK0HXfG7wz4TO1bUEzKb0WISeGCY/qyVcs8KZiv5bhjTW+QUi
	MjqFoHQ/Aq+Lu9LM0xUn0dFnnR/PTKUZzQwF1+yIbkQFbo36+N0foO3Q1elT13BM
	ppen4soBoDXUil18hOzE/8lDj63ocv022uBlYiZUp66jejBA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrj7rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 10:03:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c6929bd26so7641269b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 03:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642623; x=1776247423; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7S+jIsI8IolI8S/0NzS+SUgTDKQIENCfMEWeyQ17RZs=;
        b=cmKPFjz98yIbWV+7wakc5vNyDBlLZA30CqEPGoSP+fUAxD/iZyK1rCTVU0KzhqfBeo
         Gy/xQ4mic9R166+qxxQ8HDPc1dLAFJpCzIEd2AzLaQJ40Rf/ZI31/CYDEfX6wzsb7QkW
         X50cwlFZwjhFJFgEBuNARFKKxb34DVc6bfXOIecGttr38juaRAnmGJxRflc90/rPUtOX
         LrvWrvlZoXpqm9x6V6ywhKnCSpuHbsS3FjKJ1nSOI+pzvSGIMUX9U387lFz7/1lBTgaa
         LBwZ/3ZL066jiX73DSqAA/r1aDmkzyHPB2npZjZme4aGbvwkHMTOzWUvm+Y9m4pW9yx3
         cUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642623; x=1776247423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S+jIsI8IolI8S/0NzS+SUgTDKQIENCfMEWeyQ17RZs=;
        b=dSYeaXskQ3MBiqFuqe8+Cdfw6SvAQHt6R/v/M2OLh2EJg2YQ8GBur2GLacgzW+aUQT
         8AYjgTq1K1ZGz4j9CPwxF5E6J8tERZ+UPuav1BtIyTKgpUPWIDm+y9e9wCl6k86PzuvO
         yUm4pQ5FBXY3nlXXxzxZlxeSTYvOYaHfMp84Qsc7/ZeUJjTXbCWcyaIS41cC/F5yoevA
         LHpgnzfqUVwyO5ERdGDRjk5RGvTWNaQZoXGnTsThp8w7tKIZpwR6+xGlQrY3N1DjcQ91
         /xujQrjF2L2KrHlNw5d1CZAbuNBhVBJ6wBaE3VI9TFMrl6zbNjjyKmOj/Fj3y+6ygK8G
         XWKA==
X-Forwarded-Encrypted: i=1; AJvYcCWUT/4X9BBd56oCiHmLJeDda4eBJ1x6Hy7+JpjPAooLxAlMUrAcCJ08FjdkL+aMd7l09itTkpUu5YDrYcxSGK2a@lists.infradead.org
X-Gm-Message-State: AOJu0YzQvm2qWOkQrPzywic4yTW8qdaOqOMtIP8Ox0N0Vo+sCktTlwR3
	41O6lBRilnhUhomq1XAnfAqbUg5OT2jeQq/o0eUzwps6TvEoSA8fCOYEf4/gRNS5+NK9knOCIxs
	FzhVLGKSdybhGlXBo4PyAmaikIB69/eMzHmXrfD8G9UcVWZhzwNV8nyZtWCQiWeQBHHEkFr+znQ
	0Q3Q==
X-Gm-Gg: AeBDievCEx7oZ6M3iH+H6mzcLg531I6/XViL4L9QKCL9KER/pBuoNvk/STwdSVhf5ZX
	3hpVMOAP3XtvD/FxeM/VD1yymDTrXwn7TOx/kX9Zh3qxWB/plT7CkWWgjnQ6cDsQ8gjMenGlo9b
	gVnPvZkY1sMafDd5Rx3ur7oy2JokIii0D6/3C5u2v/rALPnhLL7jU0nbM1RcYACE11LvtAth8Ga
	GQGburcs4zgsw6yrP7vxdD3wxiUymdIbWlEZ7vlnHYooYHbBpQq/IsbK9bLID1O+2NYuCUr7tQU
	0Dznt618UEaWtr2DlQjRRzaCU8jOvrCCEWDf9yp99Bu2uxz/wuJ+FF96fY93nsihgvMM3j8xkE3
	1IpqzHtnX7XL0KPVhRyCyJpleCYPM8Hc9sPmwZySfL7koS+nz5B06mzSQ
X-Received: by 2002:a05:6a00:3696:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82d0da77231mr19594603b3a.17.1775642623061;
        Wed, 08 Apr 2026 03:03:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3696:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82d0da77231mr19594542b3a.17.1775642622439;
        Wed, 08 Apr 2026 03:03:42 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm25805584b3a.26.2026.04.08.03.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:03:42 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v13 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Wed, 08 Apr 2026 15:33:24 +0530
Message-Id: <20260408-parse_iommu_cells-v13-0-fa921e92661b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwn1mkC/33PQY7CMAwF0KugrCcoTkinnRX3QAi5jgORCmUSq
 ECod8ew6qKwsfQt+1l+qMI5cVF/i4fKPKSS+pMEcD8LRQc87VmnIA1lja2MM6DPmAvvUn88Xnf
 EXVc0kHO/VY3ctqhk75w5ptsb3WwlH1K59Pn+vjE0r+43bWi00asALTETeYZ1X8ry/4odydRSi
 nqhA5ip1MxJYISiykZC9Aih/kTBhLJ+lgKhIHJET4ZrS58oO6Hc7H9ghQpMMTjjmbGZocZxfAK
 rbA/VmwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642611; l=6465;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=k94qEoqP6LeaqMjZ56JkwcDL9Caxb++/1ywGR2aNrcE=;
 b=Fa93m6jMAv59XO0RGhV08H7u/lbeMgEu+VO89mYeYe9+udo03+OfW5l6aRjt+/+cujOgn9u6U
 /txq4POfFP1D4nQK6IieIAafLv29dRyBbPOkaAXwmZAh5zFPlwXVp/j
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: dYXbVVdRvEtkogyL95ryTzliLDOwB8a-
X-Proofpoint-GUID: dYXbVVdRvEtkogyL95ryTzliLDOwB8a-
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d62800 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=qMDWySynzQg1s02BiloA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MSBTYWx0ZWRfXwJSAe1M8YnGw
 oPN1jnhG8VSffRdBNYXgUMY2MCtJoqqkbslWXzBh7I4mxAkwjkiMSKXRHsd061/3xISVt78MX34
 /hLxPxU0MSniiVjqRxBStcNwaTYr7IQfP1IUed3tgdKe4CF+95X/1AyVc/5h11aDRy9qsRwZqb+
 iRMnp9OH5ejOw5afFe0OZmr8ieIfeMulE2AS9N1Zf9Ehy+HqjqmR8s0kWySuMf3ukUZLxliWPRa
 E3nINbFL2XVDMt1VBEdCqvnHRZomPqwlpmZVbNIB/jYCqpSs4e/FDI+tAUo/g+quvrGOQn7SDPs
 ON6nTqyeYPCCc5WaEdXVxsmpdXZbySRNXi9M2qJwLfqwARfTkD+90gQvBWSqMelw32c4ED0ubpX
 ESzzIxHeXNlOTYzVDf+GHf1H9vxkXpcGth7huvi7j3YetDp3Lv8ysGBjc7BPTJFsm6FeiEAI5gB
 7qDJaZ3uZKx8vTB/muA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_030346_104591_248D4B4B 
X-CRM114-Status: GOOD (  24.85  )
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
 drivers/of/irq.c                         |  11 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  34 +++--
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 242 insertions(+), 84 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


