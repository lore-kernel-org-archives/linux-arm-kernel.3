Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25998CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GVK2Q3DoCZlCLt3MThyL5XhWVbt9wQAr3FM0Zr86Pbs=; b=vgYCJdE3d3zr/G
	VNy+14knQV79EKr9u4fBduU9hQrBxfSoU4H52ZDHFZ0s1vUHwIvpqzIJnFArIxrd/Oxo1hHPfXEYq
	F4JocB/YyJGeOVjI9ERidJ4u0Qv72yJR1jyUjBHgAqoQEsyw9BVugy094HMItww5XHYhFa6GxmWIi
	PPc2XvO7q/lY6hsb4aIR30PvHaq1ylhbjhnKSDmOmkHU62icvy+xDhn+lop9I5WsCxeT3KAqIsi9J
	YtnurAozgz3TydRghxK4madGFTU/f2Skpeei5sOOHomO9XezIiqqinAJpNeYZ7qAq70szauxv0GNb
	2BG9apmw4e6MF/3bnZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUS4-0000000311z-0hkT;
	Tue, 29 Sep 2026 09:48:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUS2-0000000311E-01IN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:48:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T8XYCU1004786
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GVK2Q3DoCZlCLt3MThyL5X
	hWVbt9wQAr3FM0Zr86Pbs=; b=KVF35kP2kzzECKWgHRl1UDNVqS/X4glbm9XavD
	JiMJSPPukdt3j/9f3H20CHczBZ+/KOCWZbu9iCELfILBUZeFw+w+owFsuVxl9Jrx
	2fPNfObP1PgqhOUmjwoX1UITYWnAGKOreDBNbkjR9RTCBCwJa7ytrActbuVzzo4I
	csLDEBW88WO5zoexgUPoHijEH+NVCrxSTkO19ahEHoMxu0icFKnsTUsDxWU/bQyI
	cSUv/kMYI4fB2MJKYo+uY5MkvH2IZhDvaK0WoabS4CPQEHqwiNi4j8z2dG4Dlc0X
	rCnX5CMY0+zeE7bj2PFIVYrBJJTGUiRcqp7B33iMQs4QbtFw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4r9wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:48:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3282d5302ffso1295753eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675321; x=1791280121; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GVK2Q3DoCZlCLt3MThyL5XhWVbt9wQAr3FM0Zr86Pbs=;
        b=BSezyxQtYfbXVTOz3fpho2JK3PZCmbDOsGRmu210Rxyy0fZNiTVhZABhNJ/OcqiaRa
         oQmmS1OZ31fWizR9wCKM2z2sjy7SYpi0uAfGgM3ToDi7rq5F3rzb7VtkkGNmJG/hkx2s
         fTmPYkhJSPDoEVnXce0dzZtnlt4WV+4xLYmFbNmjoZiFRAShj+ux/XF3sF7ba5l1keQ0
         yaS7+hjuj9CzTGgIrI6S4lq6OZF074GfpIaahI2PFMQSP7CaPc1B8DKBDJvzYa1WhBgz
         m6rIuQFHhL0mIiBIbBvvxXXXwwOZ8gQdOh8kOg9ENsZhngh44IM0UfefSRGCdqR8pOiU
         Hjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675321; x=1791280121;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GVK2Q3DoCZlCLt3MThyL5XhWVbt9wQAr3FM0Zr86Pbs=;
        b=NzjE8qtLjAgyQ7307u0LxFLt+O57tsrNd+UJcOfGQyrjhxTP54ECzTWSGc2CwF5CQ9
         8SaEeYyREmJXU9R2HXlaJEfWPnQbE7C51+M3XmXd1KW7i44R7Py4C0T5yy9EJDLfEkoK
         F3N1SWHac89oXWNkEyJKBAaaMSC68capHVXYxzRZbFzu58BD5CzAmsyirQojNXCkuKUt
         ScAe4wt79rBbJiNCGns4UShmMRtYYe+ZbIiW00pUClsC/2bS0tgMa2RQZrRSE0498hfc
         dwK3RXoDD4LtgtKkw2W6E0kLan79Qd3NdMI0tKJTVsKWXFIc7002Ckd9XOObq1qaPnDw
         JtCA==
X-Forwarded-Encrypted: i=1; AKwUvBygnRx1Iz5McnuAabYEs0faZZv8ENDT7KPOl5sUEWrv/PvqSVXOfD44DbPvT0Wzm6y8kAL5yMcMk1SEPRdClpdq@lists.infradead.org
X-Gm-Message-State: AFuF++l6/phNwOVxggofpTRxpPyJT6aoDw2OfjzxtZjKSCFL7+PQA4VK
	l0cPA/Jp2bRAMFaoGqxH+5RJG4HUVoipzErT8PiXTVPz18qVZY8rDK9QViHO/iIAdUsBVeH0fkD
	dK31dDL/m7wYu0jOsDzORAz/dsiNPtfs6pmq85RMFqP9tacKkaNcv4JI1sTDfuoqh2DxRy+iCIm
	rEzg==
X-Gm-Gg: AYBFou0abBSSHnsws5xO3z0rn0XNYfwhS6cUjiCuBYUROwEikIaOIOp6TQ5uIzP8nGY
	y1ZWp7WL+twScJjbP1xw3ElZjs9PwmJ7tMFK1goFy0eU9sxaGJAyVWmhf74Crb/NseQTg13dcLn
	T2kJd2Z45ZiWYGwg2IqtSIIf2CYEbo2nNS3ErD6NcsXm1InIxHXF3fSYHF7wl9PaH926Q6/AGss
	Sl7Nsgt2+iRS6iNIbmbWsuALxQrPalRz1aNSxo82zJqFf3QR+ZLoQZ+v8HB5ChOX7Sa3xmbaddi
	5gsSAVIv8syqf7DKiFGCpFAKeHE79bATGTxaCWwzJk4E1bAZTWTy3lOcOWgR08iGyqUuwieO82H
	/fsWfpNy3bzievOifgqmQnk12N9oUUsbyV3DqUzwpkuOHzFVLxGVz825++Xcff2RSsRPsp8paiR
	DFf9V2By6oOnGAw9LoaeJ2jDE=
X-Received: by 2002:a05:701b:280e:b0:147:1950:8b70 with SMTP id a92af1059eb24-14b2affd397mr2382717c88.2.1790675320675;
        Tue, 29 Sep 2026 02:48:40 -0700 (PDT)
X-Received: by 2002:a05:701b:280e:b0:147:1950:8b70 with SMTP id a92af1059eb24-14b2affd397mr2382680c88.2.1790675320044;
        Tue, 29 Sep 2026 02:48:40 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14bfaaa296dsm1056163c88.9.2026.09.29.02.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:39 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
Date: Tue, 29 Sep 2026 15:18:05 +0530
Message-Id: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFWJu2oC/4XQzU7DMAwH8FeZciaT89Gk2Yn3QBzy4bAAa0rTV
 qCp7046DuzQwsXSX7J/tnwlBYeEhZwOVzLgnErKXQ364UD82XYvSFOomXDgClow9G3qMi3Z0zL
 1fR5GyoJ1LVcBwUVSx/oBY/q8kU/PP7lM7hX9uDprxzmVMQ9ft50zW/v+4GdGgTYIGFBa8Jo/5
 lKOH5N99/lyOdZC1i0zv3OY3HB4dQRoo42MELXYccSdw9mGI6rDjELuBCih2h1H3jt6w5HVCUH
 IyEUTPbM7TvOf01RHBanrLbaNYHYc9esYvvVnRRm1TNloo/PO6w1nWZZvuryTWzECAAA=
X-Change-ID: 20260809-kuno-soc-support-1dab826de0bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790675315; l=6159;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=wpcklggz//RM4632A+rynQyRCph9z7v/W5D75CnlKIc=;
 b=/QIFMI+A7h5xadLWVcBAVTuauEJdNbTwcSXplp8c+HNYYBjAj4co5o96PDl3NIRagSQVf/Wsv
 zdB+QlTAEP5AaVyAKKTcrJ81F3rdOvMjCbKLcVOcN3dqg6awO2lVJpv
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX9KlxTjBe20oU
 7ibnEKD2gBd+pAvNochsQTfHXAm5pSLFUuCSM9lEPWd8Hox0QxYc3hU8QMULg3D0wQCqPoS7JDK
 3DYXed5Lo4LOqF+8VyTLHC/Jvmxvs8Y=
X-Proofpoint-GUID: mF3IDld-GOO5IVPTYD-BiCVpsNEU9Xny
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abb8979 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8riaqLHWwNYsoh2d4OYA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: mF3IDld-GOO5IVPTYD-BiCVpsNEU9Xny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX6KwG5jwzs+gO
 ohO7CU6l+xQES0VriKEFG7D7iRwHNHHBRIg9VmlD9c0xWJDiBGfNXg8D24f3YJ4DxkBDo6r0GNo
 Mns2vxJkKrsaVs0irHnSsnPKXwtiXUd3x0Y3WyO9dL7bQva4aME3L9JVb/nEcfYKkZ0p8lMzzVx
 kgWrL99vj5f3rqtCyLdE1aQgUCa5w1SDO5bZ+95NJ4tT09iaHzxBDngmz7MaouxVQDv5J9K+suo
 wvVDq881aVz9W3iBIiSkzXXOpVDoHlOLE3zqx0NIVigcSortNkyonSiXjwbbzij6irKxGXsziNU
 6Flcjk+/wVQyANhIMNlt3PGN59CJQymryabsZRhMnGvq0YKGziJWQrXhQlU0f+U19h1j8Fe05aG
 Hp4TVSXmU/M3E8XOycttc9I9xw/AjVDTmVGRtQW/MzaEn16vC8qWqsK0DB/+UGrJW1cRg1Cvtad
 DyT2l3IDCjmGRxtqPJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_024842_059334_83D3A559 
X-CRM114-Status: GOOD (  23.33  )
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

This series adds initial support for the Qualcomm Kuno SoC and the Kuno
IDP reference board.

Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. The rest of the
series (bindings, GCC, RPMh clocks and power domains, interconnect,
pinctrl, geni-se) has been applied and is in linux-next, so v7 carries
only the SoC and IDP board devicetree, plus a small geni-se binding
update that lets the QUP wrapper use one address/size cell on 32-bit
SoCs.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
Changes in v7:
- Addressed v6 review feedback:
  - New patch: allow 1 or 2 #address-cells/#size-cells in the geni-se
    QUP wrapper binding.
  - Switched the QUP wrapper to one address/size cell with an empty
    ranges, instead of the explicit 32-bit window.
- Link to v6: https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Changes in v6:
- Rebased on next-20260928. The rest of the series has been applied,
  so only the devicetree patch remains.
- Addressed v5 review feedback:
  - Added the full qcom,pdc-ranges map (22 ranges instead of 3), so
    that all PDC-routed wakeup GPIOs can wake the system.
  - Added wakeup-parent = <&pdc> to the TLMM node.
  - Replaced the explicit soc ranges with an empty ranges and named the
    node soc, matching the other 32-bit Qualcomm SoCs.
  - Widened the QUP wrapper ranges to cover the whole 32-bit address
    space instead of a 16 MiB window.
- Link to v5: https://lore.kernel.org/all/20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com/

Changes in v5:
- Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
  (added in v4), so like the other Qualcomm GCC drivers it must select
  QCOM_GDSC; otherwise, in a configuration where nothing else enables it
  (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() returns
  -ENOSYS and the clock controller fails to probe.
- Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Changes in v4:
- Addressed v3 review feedback:
  - Registered the interconnect NoC provider from an explicit
    core_initcall() instead of module_platform_driver(), matching the
    established qcom interconnect driver convention.
  - Replaced the NA mux-slot placeholder with _ across the pinctrl
    PINGROUP table, matching the upstream qcom pinctrl convention.
  - Added minItems: 1 to the interconnect binding clocks property so a
    single clock is valid (system-noc), and aligned the binding
    examples with the sdx75 labelled-node style.
  - Added GDSC power-domain support to the Kuno GCC: the binding now
    defines GDSC macros and the driver registers the EMAC0, PCIe and
    USB20 GDSCs, so #power-domain-cells has real backing providers.
  - Split the cpu-idle-states phandle list so each phandle is on its
    own line.
  - Collected Acked-by / Reviewed-by tags from v3.
- Link to v3: https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Changes in v3:
- Addressed v2 review feedback:
  - Reworked the interconnect binding clocks: dropped clock-names and
    replaced the flexible min/maxItems list with fixed per-compatible
    clocks (aggre-noc: 2, system-noc: 1), required where present and
    disallowed otherwise, matching the sdx75/glymur shape.
  - Made #power-domain-cells required on the Kuno GCC binding and
    declared it on the SoC gcc node, since the Kuno GCC hosts GDSCs and
    is a power-domain provider (following qcom,sdx75-gcc); the driver's
    GDSC support will follow separately.
  - Made the GPIO65/66 QDSS CTI trig1 funcsel-3 route selectable: added
    a distinct qdss_cti_trig1_mire pin function (and allowed it in the
    TLMM binding enum), as the duplicate funcsel-2/3 entry left
    funcsel-3 unreachable.
  - Collected Acked-by / Reviewed-by tags from v2.
- Link to v2: https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Changes in v2:
- Addressed v1 review feedback:
  - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
  - Reworded dt-bindings commit messages to the "Document X for the
    Qualcomm Kuno SoC" one-liner form.
  - Canonicalized copyright headers on interconnect binding / driver /
    NoC ID header to the single-line Qualcomm Technologies form.
  - Dropped unused <linux/mod_devicetable.h> from the interconnect
    driver.
  - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
    driver.
  - Extended interconnect binding to optionally allow up to four QoS AHB
    clocks (matches sdx75/glymur shape).
  - Cleaned up brace/space style in gcc-kuno.c to match peer clock
    drivers.
  - Reworked initial DTS: moved idle-states / domain-idle-states inside
    cpus{}, wrapped fixed clocks in a clocks{} container with peer node
    names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
    stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
    idiom; the YAML example uses a named placeholder), dropped the
    RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
    no corner votes / no pm_runtime, so the reference was inert), and
    added a bootloader hand-off comment on the memory node.
  - Collected Acked-by / Reviewed-by tags from v1.
- Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/

---
Hardeep Sharma (2):
      dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and size cells
      ARM: dts: qcom: Add initial device tree for Kuno SoC

 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |   4 +-
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |  25 ++
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              | 444 +++++++++++++++++++++
 4 files changed, 472 insertions(+), 2 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>


