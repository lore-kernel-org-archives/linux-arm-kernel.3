Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC961CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sUbn6Jgp3v0pvFlFI/aNKH2XE/o7/MSoFt7auzr9ERU=; b=1FxVDpCgEdk/YB
	tBK0m/Ng47nxJR/Hi9N11wQkqgK/1j6Yk/XtNZ1eQW76tfKkkAt93T0A+yW1MccvhcevwqKncdTl9
	5OYXdIjD5I1vaB9HdwKf0X9IpAgjj+AS6cxIY8tiJ5L5i9QycWjkoLb950QvaePuelOGVV3gcDzYX
	TDFtMrcj+bcKnBWl68o2PUUU/03BIcAs11Bv4J+sEJBnkrF75Up6IuD6gMt70PridkrEi0PRvhcZt
	0wDKz7JZunZWOLfrnqybeDKXgOMpxTYQbK5BPxo26/PFzI8ejxsUJ//Kmrkma3Nflzo+DVp8zJj3I
	p4usJtC7YmTvVQtHcZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2lp-0000000Dsdp-1Naf;
	Mon, 15 Jun 2026 08:34:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2lm-0000000DsdT-0Abo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:34:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6K9iG3692490
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sUbn6Jgp3v0pvFlFI/aNKH
	2XE/o7/MSoFt7auzr9ERU=; b=Oq4d66CBV2iPvoTEXcDyAfVAV+Q9kriY3HVolx
	cRQawG0Bzat53M9d52A6pUL4CzG57vsNliIBS4jc5BsGYDP3lnXh9hJqK3Zv4kWz
	lKAIO6meuHyg4I8sMpYMm06L88vFo4C07QmL7JYEshTIHixQUUM5z2TQc5qEMQiD
	aigJij8DwH+98805i8plisSlAkO3uNG7KP04flA2iE8GVACTr/jeqa1z2a83V0Nj
	al6JJMCh7ovwaeg+pE+ck7J/LdG47a5qwHPhiJ7bHQV95x2V6FTAEeh5fFxkgC7b
	Zvsr1kMCJfnviWCAtFVNQ4Lxb0YZkYK9aaS3O8Q1Bj9xhYIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6ec1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2b64850easo13169145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512448; x=1782117248; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUbn6Jgp3v0pvFlFI/aNKH2XE/o7/MSoFt7auzr9ERU=;
        b=GmNWAsSYfbi/Huw0kRtKd49qyYRf94dT1dKDANTB5HMfzCOpOXlY1xmMuN1uuc3pf+
         3semAhJU8Xhb7QVK67RDyfA0fBd5p2I8quHJZyEJiKnS8lJ4A+1TWg26Xpw4yUVFqlP3
         DEKRYpKMX6RNEK+tnNeA6V/u9MRigAD3vlFNX5vc4oayme4+Y2kfoyWb7tqMpIgdql6j
         FD0Q/BGswu4WS8R4rWWbN/RWREZMmmyquVkEm06pcWEYO0zvzQv7ptaGYZa8z6FHtSy8
         tNMchS0AiVJs+nPDJthy9T1NTsJq5foLz5nHUOesB+HvJU7aBk1P64oS5MrEhe7SjU88
         L8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512448; x=1782117248;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUbn6Jgp3v0pvFlFI/aNKH2XE/o7/MSoFt7auzr9ERU=;
        b=Do/+sZ0gw1XsilJURkKXBGnwhSbZxv5bfb9bV6HEYmuELP5WLbYItROAYxPBxVlVGl
         vsTx/hxlPjgbj7y0sbyQ3BsU4WqjbeGBN2wB8ey2uFm372ahA079dTSfc+ttssgXQ2Ft
         IHSEvTTXymQfzSzQXJ0zY0cKywVY1vE8tKXEMD2Q5sDGkmPS+Xls/Yujni5J/5m7P34Z
         Tjy1jY/R6HKMZSwKg4FAdfRB9ebQ45I0m8CTMhS47uiwwNfbnPVmjQ3idfy6J/4ZXhgV
         sAfEbf0D74vQ5DK2wheh8XfENEm81ob+6mGYq/eHyg+gXJVlSmu9m52pfAFyzyvYptau
         xkyA==
X-Forwarded-Encrypted: i=1; AFNElJ8uIljtuFizsLsuiP5F5IaKW0Vp1Bx7y+cS5Ke+bfFJk8bscul5ADj/PIgZ7SQuZfxA+s/pC3M8sVJKdJZeITE9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp1gkx/3MpMGyWGDuPjTWZ5rVD01yPaQ/P4QZM6eXmIGMLB2+i
	21vu2Rn7vdVR0zfwBsetbYY2Wt3jXESJbaTRZj/D6M6VYv69ekRq6NMYgfNzz4iWIfo1X1264GM
	IKzUwmb7qsCkrdmzVjjORWGUHVo/i3pWNr/XT5FZhJgKZqyVnUupaTu7vHaMqVPdlb6bpMLgpnc
	HUuA==
X-Gm-Gg: Acq92OHo94Vpert60LbcX8Kqar8phO6hwIdJA/BBmOeyEiqjy92JNLnWMXaTrpVaAGB
	QIy/eCBCaie2w7Oyg+XOM0ZgRxoJatixCQ/7xs52iaP1DiRvO3JHC4qr6uj+eeBoWFAZwYJEDLh
	ns1e6IcHw5BOcLejaKJqd+MJ59CaVYCb8pVooqbyCiIMdddPNZuY2JE7JYuP3ma/IcYh71ieK8m
	qSraJrnoxeZRROQN00kbxAXUYS/sdhPUGOkiG2DxK/KShkJTVbqVo6TodpdYHwKYWafLEx3gP8m
	H04NiloHWxtKdN1b5/A3sa+Huxwzyjbs+ZkLC2qEx1UBZzmgV/SDUdlZla80KOITkmfYIHd1jo1
	tFdGSYjIO6H4q5Blie0lowtAvxdkqrs1tiwOh7drNS3doo1SX8/x8
X-Received: by 2002:a17:903:228b:b0:2c0:a711:534 with SMTP id d9443c01a7336-2c6641baf51mr107117785ad.13.1781512447706;
        Mon, 15 Jun 2026 01:34:07 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2c0:a711:534 with SMTP id d9443c01a7336-2c6641baf51mr107117365ad.13.1781512447201;
        Mon, 15 Jun 2026 01:34:07 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:06 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Mon, 15 Jun 2026 14:03:53 +0530
Message-Id: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPK4L2oC/32QzW6DMBCEXwX5XEf+XQynvEfUg/FPsBJCsAltF
 fHuNaCoOaBeVpqV5pudfaLkYnAJ1cUTRTeFFPpbFuKjQKbVt7PDwWaNGGFAJAOc2nCJGhvdpYQ
 Xh/vCxoMH0EYCNCg779H58L1ST5+bjm54ZPi4LVGjk8Om77ow1oVuHEiqeGkajt6D62KLpfQVa
 0dsS2mrUkgBAupJ7BkEq16GszE43rs8zfWSMCOVcNZ7zxtSTxIt17UhjX38WV8w0fW8f9tOFBM
 MQlpmlCmlLo/DGA7DQ1+XQoc8VuzE/lBA1D6KZZTRtOLQeMpodexT2kHxNxSV+yieUSp/USjqh
 bJkBzXP8y/efcnn8QEAAA==
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=5223;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=g58ufgvkhduxRPaecFV0Yc1onZng4TUfPFKHjRrwmD0=;
 b=yXSiR4DbCVYmsZXuGQrYPps0MeF2uwOCsQUdOCRyxhXzorsLJA5Xtphe6+cf9MCN67bqzY1eq
 24glSooIVEfDavBBtTw3ltu9b/Wr/g6UUlCWtaeNxu2/U8RW2OjiDeS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX/ECP0js5eWb7
 OiNA5Qj5YwpqlBmO2BG1FZeKwd3BTy/3+11gHJa650ZICNNDjC8cstnZzmZ5bQdiYwVuDQ5tPId
 Ccn0M3r61csDw125s9ZaiiekUkTEyx4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX5L656Z9ubOct
 j7A01b5oDgQPdw8wj2P/F4dkO4IX7/E5S3jvH2OrIBkEp8bm/0lNaqkeuCfnKHrC4JzKoETvcjF
 4pndZtuuluPh0ie67Q4OQM8zA4/i6kaVlM075oCWQm2Zto6CH3kfQ/ZG3YFcmQ3pe8WpB/RQSZU
 3VnE1spxomJLUOUbz/29MeWx4PvaAqy3xwnq7IP+OzVKcP1R5Kdie/1nZCWoodkn5jAmgXgRydn
 ADqJDSHoDqcO7QSxaCO9YtZ6dksPxpigil4Zm7TAdrgBLOIRlOsaTxDasr/kZkpzvoaNLjsezdb
 +Qf92SY1iVrZfYPNxoIx0u+PldBGdd39whLL5lGREXslazpnTfTJJ33KJnrlrsRDQ5t1H8cDNKc
 45TfYlXQfZHrZo6QbLb0DRYmGeDlq81tOYbHHw2N6F6ip09qFdUilfrcFh7RIUgRGAIPAOjnMQX
 Wmau8hT3tD1GMFOiPrg==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2fb900 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _f2PWpS250rXClfa3wlTSniLFbXxPTO9
X-Proofpoint-ORIG-GUID: _f2PWpS250rXClfa3wlTSniLFbXxPTO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_013410_221747_52D8D189 
X-CRM114-Status: GOOD (  17.08  )
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

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

The Shikra CAMSS binding patch does not depend on the rest of the series
and can go through the media tree on its own.

This patch series depends on patch series:
https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
https://lore.kernel.org/all/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (6):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 .../bindings/media/qcom,qcm2290-camss.yaml         |  15 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 ++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 ++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 198 +++++++++++++++++++++
 5 files changed, 377 insertions(+), 2 deletions(-)
---
base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
change-id: 20260526-shikra-camss-review-cf6f66ac566b
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


