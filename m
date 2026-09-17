Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAE7C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VbNdLbD7tr+jmxCOhngfhFKBi7RxEhhS1Y6zQpNFs1A=; b=KvYiYm1dz00/ak
	0Xr9yJaQ1cRM2FapcYOYUXC9fknwo8DXLFsb4ZH5SxMXi+OdqCyIUkz/arkexs8pEx5C3JvRZocvw
	bfNlGyzWmR8ESb6968H0Nk1xiRSCOMoA0NIPagJxflp6WQi7Xs1np08pUK69IpIkRdF4fBkG8D5gI
	FhHNpJAaGkkt6NP06Ju2Kb/gfhqAXtLqD3lI/v44IeFFAbJQp3D5cZ8yREgkxjGTts/A0d7JrVa+j
	C9GuGMZIsfxVuZLhhJ69PKzxFhiKcWYLpnGCwlvNBkm6W8cbD26DmJsLJyKEFwnqrVBCYiJf/SOAV
	iMETBtEIZMyXUdQJ0VFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L1v-0000000CiaE-2gFo;
	Thu, 17 Sep 2026 22:56:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L1s-0000000CiYX-1XYT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:56:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLGBcP2182448
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 22:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VbNdLbD7tr+jmxCOhngfhF
	KBi7RxEhhS1Y6zQpNFs1A=; b=mOOTaZ2GOTTDXcrsYMzwb3gQfC2HTNT1Pf5pc7
	0PnhDh0MZKFuvz8gvvlNahMnqW8hy0CMQd259Ja1SxlwOE5jhDTibFtAneSq5IJe
	wSxoeNdDmvgxETOxKMUkDOU8cl7jGU3GS9uGrp68bkmQWZQbLBZwvZYFVTU+gYFs
	45gmoUmVttqd4hfSBUZxZoIH9rm3bHlr9OcuOZjpHx8GZmlNqDZWjlwXeWIq718p
	d4MPvFcCav+rHW2GynxbouVqkdODNiHEE/sDbo4i0hCGSLM/0le0lAsXsNqUcjI2
	bEsLdlPCuwgtnPro/rSV5C2Ds4fcPJEKTu8BJt3y9eIPgzNg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2krkhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 22:56:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8c152622so1279695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685790; x=1790290590; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VbNdLbD7tr+jmxCOhngfhFKBi7RxEhhS1Y6zQpNFs1A=;
        b=HydaPkC0W9sTMKX3tyfKvCRJBoPISn27zhtSK2X1ESz7m2Yb/XWBCZjSLl/RT9qtmF
         PW0xvXiVW5CmMJLvT3AQ/eRQH1tP7A1VtZ4ykJ26l9LkyO2joZbILjekCFsvCC02uuPL
         we4yPRbgVoNUXyTJIuVruPwdiVnoh3B6JJfRVUd70kQ+A/gW1U7lsbdrZ2C/S86CCuRt
         f4cQTEXLZq+Tbvz3Z8uNsddNgI+ggCd5IP/oNPxisLyGuX2aEJRRShQf1aD2F1fKgOOv
         jenrrTcjo/iyjY8Hh8HXlhOKVxIhFk9q5A/Lvjj+7StMvi06QyIibI+iwNeZ8f/dlPwr
         ECRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685790; x=1790290590;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbNdLbD7tr+jmxCOhngfhFKBi7RxEhhS1Y6zQpNFs1A=;
        b=wzxDXbqJYerJMN0CqUgyeldeAuYNiHaKxV+LjT8I7HGKgKpfoHktQxrVXOUqRmwx2G
         FOKzJjkOY6GddVCP9W/Uc8K0BeNo9hST1UN/6Qjq5VUQi1NhQksi3pd6/lPUTGShxbex
         5wcM3khbaThwVIqoc4EJ2UGxLMdss30HWJSl7EQvFUjad+kq88DnXzLitSe0rmCnnz6H
         GgmsACBv1JNsLTFShWm+lJ06n30ywSxxU43gxNvQYAqGQKB7hZSvTrs6M7urpsacV4ei
         6p7UDVcaoM7oAtWlJYpqN6yAz0+deY3rzgLrJZxGTUSHroS1E63NPC3rvDRBY8hbquYG
         8YYg==
X-Forwarded-Encrypted: i=1; AKwUvBwXD0BzqK04KY/abJ/a1rSHEq98J2KJxheoQnF1Ut2p8nr++Tgs7zyZrKqTXWz7Rye1K7LtlApHSVbHX7fJ9Oau@lists.infradead.org
X-Gm-Message-State: AFuF++kwzK4YcFKVOpWILyaC2u8gHtf+cL90UG8u209jK7QAux7X/p3q
	CtO4u2vn5KhFgiHXerqbsG4fap6cV87oBneafIsImTORGaQtWMPkhUelqvYgg4YqRXqY6NUmPsr
	yrjTiNFL+W9iMln71ySxPmrKNqbzhbxh9J8Xj2s8dniyOI6VpCQMn5u1ZHBBgfY+CaJ6FV0kSwQ
	tkSw==
X-Gm-Gg: AYBFou1UlZR+4kE/UwgilqZpb13Z4BRaHH1YllbK8mmJkj5Ugbc5Fpp3vPgGPlbrqzJ
	pQRs46u99mrkK2maIIfP2roFaAat41WnCXgpRgB0LJRwYZprPSzATa2/Cz005IlYp8ATWD+CJHq
	EH/Dcu5iErsYRZskxLu4KG9zjTeWaoF9C/DZp8ia6uJfPEYTA+mDhYpi85DdBkGmunjiuViVr+N
	iqRupNrOkbR1e6oA0f9xOivKv5td5TwAXTQ4w6nmwYGO0vwXDlczPeafq7oj+4XClA0pVq1C2v8
	BL/Vr/MDHPFMGqCIcDRlmUecyzB0ReGCqdAmSpZbN2gLXt9m6NiENnexW3bN/cqkI52GrcudmBB
	LmqvXJlKqvlScml5xnuDKch+mulOQrgFZoveilkdMbBA8+Hao6g==
X-Received: by 2002:a17:903:2f8f:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2ddb1baf0a0mr12615755ad.27.1789685789755;
        Thu, 17 Sep 2026 15:56:29 -0700 (PDT)
X-Received: by 2002:a17:903:2f8f:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2ddb1baf0a0mr12615435ad.27.1789685789359;
        Thu, 17 Sep 2026 15:56:29 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:28 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH v2 0/3] pinctrl: scmi: Replace get function and group info
 with generic callbacks
Date: Thu, 17 Sep 2026 15:55:54 -0700
Message-Id: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpvrGoC/3WNQQ6CMBREr2K6tgRqU8CV9zAs2vKBb6DFfiAaw
 t0t6NbNJC+ZmbcygoBA7HpaWYAFCb2LIM4nZjvtWuBYR2YiFSrNheRkB+QjOjuFnrfg4twSz6W
 ShbRlYZRicTsGaPB1/N6rL9NsHmCn/WxvdEiTD+9DvGR77+e4ZH8cS8ZTXuimqYXJS63MzRMlz
 1n31g9DEoNV27Z9AIsJdn3TAAAA
X-Change-ID: 20260724-scmi-pinctrl-generics-746484c98b66
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=2134;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=F7WocV7DuaKABLMSLxd+y8B1sodZx6pHNsQFtV+4VuA=;
 b=BgJpLj7z1mrSx41erlyl/MtJ2q23h5Q53fBYqxP3n3Mp/Q6rRUJLb9agea2fyzGx2AEsQa/qL
 106cr8fmljmC+a1kzw0e1rI5/ta9ji/QSlD7Bk4c8WtS4MmROV66YqU
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX5H9PlQEj/w/w
 G5ijV0XGYGZs+rLANFGo5ExshAjt9jVI+HUn2LsO8p2cVhAmF3j48lzaAkWxQLZxh4g2E7Ffl3c
 YinhPs9xSPEBmOmQk1o58CpsCuaaZ7lMNujCIKdSRKiKH4P9uxPe2V4NMY3i+PV8+SEqqDiMMA6
 nzvrumM4VmUCMbDMhvaTqWYJ/SG+7uIdwzVoOM8/wa3V1JIJh719MEuiL2stotRrygYiv4gfrQI
 R3k4mC/O/QXMU2s8acHbCotmcAxTbY8laJgoTZq+KKx9k7WXsC8HPgQpe9kW5hC+6l40kQkLsGr
 U7cOAJGNPBKcTLL3+6k6W0QtMn2X8oaI30d6JxBiDt9IW7NeSimWS6bCf5j1sxMMXytZRwFisNE
 tU94NwbC6wVTRndN02JJu+khcqlHX4M7MA9GOipcNPpMVz/mpnhQ7pUUGhbJM5dA4KBn9omLZ0E
 5bsb5HLIIQty1L1rafg==
X-Proofpoint-GUID: l8MUv8mcgIabiZHXNSD8DnMK6MyMGfJ9
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aac701f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=JfrnYn6hAAAA:8 a=BgRH2eVm0xmwmakAeEgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX2bipjOOswct3
 x2QdzkkFJk/pQi+NwvgGkRViAmi8UMpvosO5wmx/sKBTFGxOotHdbgBPnqbHKYMMlRCBmIAuMV/
 hoN9RMkN48dsSK1ai/swYLdwn1t9v6s=
X-Proofpoint-ORIG-GUID: l8MUv8mcgIabiZHXNSD8DnMK6MyMGfJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_155632_537821_627C4BF1 
X-CRM114-Status: GOOD (  13.78  )
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

This series refactors the SCMI pinctrl driver to eliminate metadata
getter callbacks to be replaced with pinctrl and pinmux generics
provided by the pinctrl core.

Previously, the driver implemented its own get_functions_count,
get_function_name, get_function_groups, get_groups_count,
get_group_name, and get_group_pins callbacks, which required
maintaining driver metadata like the functions and count.

The pinctrl core already has support to store and manage this
topology in the pinctrl_dev via its own internal radix trees.
By registering functions and groups at probe time using
pinmux_generic_add_function and pinctrl_generic_add_group, the
driver can delegate group and function metadata management to
the core.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
Changes in v2:
- Add patch to select generic pinmux and pinctrl Kconfig symbols when PINCTRL_SCMI is selected
- Remove duplication of pins array while registering generic groups
- Check for duplicate function and group name during generic registration
- Allow functions with 0 groups and groups with 0 pins to be registered during probe but issue warning
- Link to v1: https://patch.msgid.link/20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com

To: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Alex Tran (3):
      pinctrl: scmi: Replace pinmux ops get function info with generics
      pinctrl: scmi: Replace pinctrl ops get group info with generics
      pinctrl: kconfig: Select generic pinctrl helpers for scmi pinctrl

 drivers/pinctrl/Kconfig        |   2 +
 drivers/pinctrl/pinctrl-scmi.c | 232 +++++++++++++++++++----------------------
 2 files changed, 108 insertions(+), 126 deletions(-)
---
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
change-id: 20260724-scmi-pinctrl-generics-746484c98b66

Best regards,
--  
Alex Tran <alex.tran@oss.qualcomm.com>


