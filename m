Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986CACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 04:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ctx4BOtbh3YJbrYRO264BwBpeSzZN3jyDBekObzzGZ4=; b=ZuXXfgssaRTrLm
	rTdImZRuYDWbiE+dwJ7VgFgFGrSBH1IIEmFIYumu4fsqsnLfPbMBCQS29zQkfjje3L6pmwrMYdfMk
	J7lVxWV7D9YLFRVHTkv0SSEkrtUeVW11HUPz+5BYqR4Lc7pcaOFfavL6InTbZt9bzZAorPt00DlAs
	ZSxYgVS8Iazdkfz29NfDlUL+WysWsPUMDgjBOkfUOfGkPADGGaZ7krdL0wSXGd3EjxIeVyLk6VR/S
	qtXMuitGF/YLI18QgvrFwH/lzADugq0hM5pCLfPHvh4gO1n3p52SdPh5Y0vI6ctRZKOxYsoowMnWk
	2WBBouoUn15ihawkEZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF3Fc-000000073yi-1XGw;
	Sat, 01 Nov 2025 04:30:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF3FZ-000000073xf-1NtN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 04:30:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A12kVxO440816
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Nov 2025 04:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ctx4BOtbh3YJbrYRO264Bw
	BpeSzZN3jyDBekObzzGZ4=; b=R+n5h3GpzgOtIEzOZuckh6wuHl8V7faHw7C8Cw
	7WQXpMrADSq4twr4aprpdUilIfMqk9CbAAnz5o81igOo8AuIdJuwwg///neozS/z
	n44GDBEng2BzLyPbp93QFtKVm3PSfRn+Lw8qEh06RpsefL3ZZefxlXPeMqP3VWMc
	lKUP7+G20fb2r0wA01jUMhLGoKbKQZD6ltFqwiNANl4Qxr1HR83WZwG1I8Vj/1Qk
	AO9bYymUtG8fn6tlRydtbOb1iZMKlFUGfmp/1V7yZTetKHRHvDEvG4BXfPsoH7ol
	tO4K70ATkqe/Upyj4FHAotjSq4PtM7gmOm4h5h4FoIDevvlg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a59hhg4c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 04:29:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2930e6e2c03so32942455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 21:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761971397; x=1762576197; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ctx4BOtbh3YJbrYRO264BwBpeSzZN3jyDBekObzzGZ4=;
        b=OoLJCSPlmhEp+dVIxjkNJE/9lpdvMQ/95OabOEfA+kUz8irJzQKb7owUVrwmtTyVWJ
         yieIN1fUN7JwdvLA1s356pL1YsFJB/0Zojcw7MAUuGckm9kJUET6ucvZMYBI1YuZoxVz
         uDmG0BpsFoPCgO70bC6fChCCOi7djPufGMjMkHcrDWzkXxU/vcYC9AalST5+tn+pRNNU
         UtRD/s8eiGb7VNhmOToTyE+bmdTaZFxz8WZbgG2w6RM/b4hhrVCVgzqJoqupTu+fHSrn
         HdRpV0u2y7RWTVnMzzPVoXIK8zrnZd5DE+PhRBhdoB8Go7UKDbo6jWTZ3IhXo5tVqnPu
         BVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761971397; x=1762576197;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ctx4BOtbh3YJbrYRO264BwBpeSzZN3jyDBekObzzGZ4=;
        b=In13K/tQoyvrjM6PRJAE2VDx8Z51KI6sXg3O3P5txABdJ59ZwnlssR8OzwB7WGDDoK
         uLRXVihFIERZE825+7OUhY5zWbsFpRtAOITUkDb78JpQXot5crVO3Hs8qAByPZ2NQ1Vk
         wYIlOwYblBJkKZd8feEaRBwLrCsgTuACEjCnYAQlCEXLsysgUoPnHBX3mpo5Kaf3Tj0s
         9fitR7P4r6K2wu47c3/iGqSEJToYet7L0VmizaG4FNxSd3Ru9807nXmOhp/s/Gg7yHzd
         BikhBgc+vVo7lJGW38uOp2Ny3/F3pwmR8BeF6tKAveobnQFWlvszB6nR2OQWOOkmu4pz
         7+hw==
X-Forwarded-Encrypted: i=1; AJvYcCVsDAd4HEqEQtWTOaJVYETe5zTgUvy9oOcCLJ+ph4lE8DrTNhfCQJa8+3dezI0eXQiOSR0qKUiQdZFyDcDqW9Hr@lists.infradead.org
X-Gm-Message-State: AOJu0YwBlFtP0GQkGl2kkrqty7KokTsXZft/bJaKni2hHtE9K/kEUEkg
	p7xgmFW7aD9OQPslJnYBEc/PvdReOy5QNxLeI4ZOOhOvRBwyYb7kktspcKsgSpx2vp2u3oqUxER
	hMcMnc3Jee1GPuooSulfbZaNpaZCywoN5lQ04vqwqn/Ok803muvPl9wMc7HZeO0E1eaqnRsAEdY
	i9Ng==
X-Gm-Gg: ASbGncus2HTprlzGfitkLAdX1AXvK4bq18O8BWdtLS/JSFiiQ1eftZs8SYf8CaAhJAs
	NqMBBatqXQJBWk8XWDFvHl5vpuCSSNpRWfTHVJlU2XXT1LDrjLWSiC2eH/JWsHb0hIlDHvLZESK
	MIcm6FGpesgUbD4Lhj64SAazOZEL8xePmo/sLoeXkqHnPkdgPR3wkxfeP9aejLXc95wij/5rusi
	Noujjh8zB0+b7X6Inldscx/e3/MLIhsqE0RQn69tMIFgcNk42nbV9YG89BRZMs7ChFTuiBDkmcX
	prNIevFNTSVgJ/vkaNWe60voJ8xqzigKNHmyKC0Mfq+I0rfvBi0Sk9KWJ9FbNDBIavmaSQBpLBd
	wjzKsadsOt2hnfrCxHOFRO12R
X-Received: by 2002:a17:902:7608:b0:290:a32b:9095 with SMTP id d9443c01a7336-2951a5c201bmr53402305ad.54.1761971397232;
        Fri, 31 Oct 2025 21:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGEnGXG9bXhr6lRK93wX5pQfZkWyyZY5Y0I0vLfyj5CKdoO9hxQrq8/lX2O7OrjkVHvk/wAQ==
X-Received: by 2002:a17:902:7608:b0:290:a32b:9095 with SMTP id d9443c01a7336-2951a5c201bmr53402195ad.54.1761971396653;
        Fri, 31 Oct 2025 21:29:56 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:9857:f290:6ecf:344f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268717ffsm42273285ad.2.2025.10.31.21.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 21:29:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH RESEND 0/3] PCI: meson: Fix the parsing of DBI region
Date: Sat, 01 Nov 2025 09:59:39 +0530
Message-Id: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOMBWkC/3WNsQ6CQBBEf4Vs7RLu9C5iZSGthZaGAo5FNhEOb
 5VoCP/uhd5mkpnJvJlBKDAJHJIZAk0s7Ido1CYB11XDnZCb6EFn2qhsq3B0jD2JH7DlD7p9bY2
 qnbVWQ9yMgWK88m5wKa7F+QRlzDuWlw/f9WZSa/uHOCnMkBqdE5na7Nr86EXS57t6ON/3aRQol
 2X5AWUwDvu5AAAA
X-Change-ID: 20251031-pci-meson-fix-c8b651bc6662
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Jingoo Han <jingoohan1@gmail.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable+noautosel@kernel.org, stable@vger.kernel.org,
        Linnaea Lavia <linnaea-von-lavia@live.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=e8YBQCtdDQOE+c2FrOM2E0WznZ1ocAyp2AeN7FC+gwk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpBYy9xaS1zECW9y/pKPSQ13R+OUAM4ux1o+wh1
 rAWsWZ5CluJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQWMvQAKCRBVnxHm/pHO
 9SeBB/4jzfvishB5L41wxpNEervAI3oQbCu7dJAUyZAoVjFZsPUWh6kJtWTyObc+h74WQRqXoqe
 /y4zwmQ9bSK0p3u7XxEpejtutuu6+3ELEhJdV67ODk5bhckHUFyThGk+LSyM3k/tMt9H3NFOrqC
 5aB2T5JYdy/Jr3WU6rMenrzyKBAtiEmZF2qyAf0csR7hUrUJd/oQwk1gusXJub6jUrBCMfvf59i
 LLMyJdcldC6sOfAVHEoAgAjqCg+acMOiG7rdrW5CG00SIpg8sL4jHmH3GFftBhjsDamDnOXFZ2j
 Ud3zZ4Hlsku3C08GcO3xWmynXXTGcZm+yYuNt6X3N4HWEDzH
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Authority-Analysis: v=2.4 cv=V6lwEOni c=1 sm=1 tr=0 ts=69058cc6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=yNGAleCs8xXHwlDqsQYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: iygEjCZXjTvIwY1kn-8QUBUDISGHKWuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAzNSBTYWx0ZWRfXwdoFJkY0St/s
 VrseK7RaerCjS8ANUdpocQJ7+AEl+lJRRHWN79wk2ijwLiemvtJUWOkNw5M/dlDMDzCb9+REUyr
 MgtC7FsBNhuhUgv42rtd9F2h27oWSSP4H4WsMlbOTvRkyhu9LynKb2BIptwC5ZcvtfDspE8WXlJ
 oHiBdg8OD5KAhlMjzPbr/XaDZCqja2ZY/x5RxBX82nTS6XGrKc/k6j5gwdhsWrPe1B/WsSdhOwJ
 NACrwQEDdjT5KDahQAADHwngWD2NmOVtEq5dwK7Tg7gawCQX3YnhTDTnzvY3+QaWUw/8445tjzw
 Q7GDJQotzsFM/6ONm2/vg40/q7bVyb+lAYDA77cfkmrgFIDWM7+6Oc91AGElCKG7WmT5XTLY/NF
 /BdsYbDjDOB+VlHoRGfiUXAKzNmYSQ==
X-Proofpoint-ORIG-GUID: iygEjCZXjTvIwY1kn-8QUBUDISGHKWuI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1011 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_213001_518557_6E170F7B 
X-CRM114-Status: GOOD (  16.35  )
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

This compile tested only series aims to fix the DBI parsing issue repored in
[1]. The issue stems from the fact that the DT and binding described 'dbi'
region as 'elbi' from the start.

Now, both binding and DTs are fixed and the driver is reworked to work with both
old and new DTs.

Note: The driver patch is OK to be backported till 6.2 where the common resource
parsing code was introduced. But the DTS patch should not be backported. And I'm
not sure about the backporting of the binding.

Please test this series on the Meson board with old and new DTs.

- Mani

[1] https://lore.kernel.org/linux-pci/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com/

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Resending as the git sendemail config got messed up

---
Manivannan Sadhasivam (3):
      dt-bindings: PCI: amlogic: Fix the register name of the DBI region
      arm64: dts: amlogic: Fix the register name of the 'DBI' region
      PCI: meson: Fix parsing the DBI register region

 .../devicetree/bindings/pci/amlogic,axg-pcie.yaml      |  6 +++---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi             |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi      |  2 +-
 drivers/pci/controller/dwc/pci-meson.c                 | 18 +++++++++++++++---
 drivers/pci/controller/dwc/pcie-designware.c           | 12 +++++++-----
 5 files changed, 28 insertions(+), 14 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251031-pci-meson-fix-c8b651bc6662

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


