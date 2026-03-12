Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321A0106ACD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sl5THP5oQDlWe4OrVbHJJ8rYnqB27vWU2fGTtY+H4so=; b=o63Z5LAWv92ofR+nn1itoOAZqY
	tPq539ZoN/0jIZXc235VB8sZ869ZM6lGidpSHkqUVGfbSXaZw4aPxK0pY2gAnL63esLWfC69VeKQF
	UohzxuLrJvA1fx9gybAVv7zcYO3l3b/ShNHl4C2kgJCDyKzafr5qnkB8ax7e1LYPi04Jsk+bL3QKl
	k5sV6iSqjoby0hQAK/4tzGmphC/J8XzepC99dEP6oiIOhfIBY02EroAiOBBRyQf7Saf75mDFV8fDN
	1Iwe5I0FxApsrI3vnfYWmbutTHrqi1UZyiem2Wif80v04sdQJLI/Z+L11gLxc5WYJmOKkOA+F2stj
	epxLhuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0l0p-0000000EvXJ-2PFZ;
	Thu, 12 Mar 2026 18:43:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0l0l-0000000EvV6-2KC1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 18:43:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHqWk0263424
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 18:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sl5THP5oQDl
	We4OrVbHJJ8rYnqB27vWU2fGTtY+H4so=; b=kbnKF/DK2YY5omo2WQ2ftk7Ila5
	tGwntnyO4j67sWAWAhtNFAwObx3w+bsFcj3B19hkh9f7IroyhBh634JqVpesALfi
	U8TtQUII58JotMx/3TvZVFxMKtz6aEAsmy8qhLAWfG0X9n3yssBUxeXxtV4UQQDX
	WTX/0VN6HWtxuKgGI+CLQkKT/DIGnu4tXc78vWcbTTiHNwMRGZKRzj9OPO8xmJ3H
	FkTJJzLWCRIWccu5wHqJ50MIGRTQ7f2K9rGXit2f7yQyXPITgNykkZERXtf1XOf8
	G2BvDK33NpEBLnAXJfF/O19Xp1sDFqkIQvUfpIW0qRpuvjVqU3cIKNy/5RA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yk87v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 18:43:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd849cd562so840509685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 11:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773341034; x=1773945834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl5THP5oQDlWe4OrVbHJJ8rYnqB27vWU2fGTtY+H4so=;
        b=A+wDIfD+cdEGz0IkxOPVuOI0OQWQ2oZkVS0KVZ3rgLgC8ZWxHwsBCDG4DZCW4yk+AO
         ODF365FZoeiAphpNlxNsRAlERWTKA+jN19zDbjGCu98Q6qrMg5wT3avgOAxoZHh7LLHB
         ae7rb1MPlRwuhcrpj9AtzuS0r9LHOKZlX7DVZOXuY8032CU7w7GHtFvgNj6HqonFS2YW
         gwqXzIur83RW5Q2mHgpqoBABg7Xf1OvdX4P9QvRDewAMkv/Jc3WqVlUarXPi+LQSR4I5
         VdkwTbI9Ql2BVaKdW6ECtUVE6H3N5hoErNH03q9reQTMBcDAmxXzG6oNeA6QrSdU4+Fp
         eedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773341034; x=1773945834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sl5THP5oQDlWe4OrVbHJJ8rYnqB27vWU2fGTtY+H4so=;
        b=xT/S8rkw4PiFSSLfBrq77vP/S88opMpSuFLcHUR36gxh3ViLguQhXP99bEUXBfIMor
         jANDDqUN90JusA8AWLNQUepCnReexWNUCp/FbZ07k9lOndJmGRHy+NTyk+KhV8a3Uwy9
         X3uAxSjYU/CDARIw0r0l9uRy+nru/RGqeYsHkOktnxGHOVTsy8bOH7nS9zK5JppZVe0m
         S2w/VRkqDdm1EseZO0oGRLaigpqAeuEDN1GBXz75nblCpgGtdxS6Mpfx5aQrkP81onSZ
         z2aO+nv24f9Qou6JAfo2dZF0OOPx4+NjH03Rd5HWtdrcbJ8JiIqP0bZrRGZrhBJGcx0W
         Y/wA==
X-Forwarded-Encrypted: i=1; AJvYcCWWL7ogfYxu2prAB9mPNBaPQas81u7RZk+1VwFxpde5tlMoSYgwBeHjER260Lx/PQREhq+BmGjr9jWP43646fvq@lists.infradead.org
X-Gm-Message-State: AOJu0YwkFS8Ilt6F62eNSHHkCn+JTu8ECDxnPicZjMFJAKzkmgaS7Hk1
	gX38b0jm0Ix9/Cv/9Ncz6bgu9mruDPuASW5Hrue4kH0iIGPGAuURtZdGHWSLIYgzLh4bo78CwjE
	dsnwtmoQXAdoid00lpksWlgw+Z4Ea2kgpge3mOWzFeKtJj1EC2A/W9PTHxQvLh8AzeyMJvon2Iv
	/jDg==
X-Gm-Gg: ATEYQzy+EyrKcgk7BZUbZlr2Uw/bG/fP+x6ajW9K34rk/IDosYy1Q3V299IbvZyM+sL
	SruEWKwiblCJbx2qZevB88PiFDTWhpjCn4GbPD781FW/wW11A3P7wlPCkPUvF31Is8FDQq7MXNb
	8yYqNisxVDSwbWh8RBybPh+9TbIeqZq8aeYL47x+bObKdK5/zQX5IdUsIzFJaZ3FXwojjQ9f7At
	uesMlKcI861pU3J87wQdJwenA2y+kfBg3qDEv/lXq9AhivjdFpHngPeZw03TvPye2r17MKpvPXv
	kuzbja4ajNuHP/DNnkIxPhzzCDJBMbXEHdLfvUXRzzVhKmlMoE8jgGyMflpAtJt3AvvTjn9DEuy
	WBLwYQXv9ZUf/rZ/r7FNvwGdv4tLBN6NmVubE
X-Received: by 2002:a05:620a:468d:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cdb5a502afmr113839585a.6.1773341033904;
        Thu, 12 Mar 2026 11:43:53 -0700 (PDT)
X-Received: by 2002:a05:620a:468d:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cdb5a502afmr113834785a.6.1773341033452;
        Thu, 12 Mar 2026 11:43:53 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bbb2sm10005040f8f.22.2026.03.12.11.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 11:43:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] dt-bindings: PCI: snps,dw-pcie: Drop deprecated reset-gpio
Date: Thu, 12 Mar 2026 19:43:46 +0100
Message-ID: <20260312184344.42337-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=DdlRRjHSsKghe56p1ojk1muOX+5Hck51Wqoa815D9zQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpswlh2i4ftdfXM9sNjnFhjkB7pkrSKvqkWkXJL
 W1ow3JuiSiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMJYQAKCRDBN2bmhouD
 191pD/9PtoDiLdlDNOkBmmxPWhb8A4BV2FuXZY1kR0rpBVsnHsnIQ+72yby9Byb9U8e9yZ5g5K9
 IlzwDsGZ1STxkBzJaRchnr3PCHatMnWkFCgXFOEBHOLgx9MYxATivPQhK6C1NX0Vl9mqtHubLv8
 Jt3npQsQ4eRfmKLCvK/960Brafu0Kmr0KYA+pZhLmE9zpapr/qkpd4GTi0Z8x28x+ErV81pBozJ
 Ah5Z+khLFxGt3R4qtc6dalygIwg8UHpKpjdzxwNpApQxJ2bfE4hNSSQMED1KQDUtMXAOaHrAh2P
 +4iov9ifatV3/Xyz0GRN2silJf2Mh4kvljKj2LEdrM05IQWx4CbEzRflrX5CstDGLG5wBrKhBbj
 jM2PQ1mUwqGMl/UivkYWp6/mSpUQl3U5eACEpvsNOQAv0jAP/mD7IdSfCrnnWbdHaS8bYae4zLE
 ohdtSYcjV8QQrmqJgGvLgtmV+eOZt5NefPoaU6RNVajb8b+omYnP5eVPNlbXXudwvc6AcZDiuQv
 05V3vu6XE5/ftiXdtvpjqSPhxKd/jrBFOZhdiw3v81y/r+Ys5z/UziYbpBZYAAzVvHoZdT4Bhv4
 HjdewBVn/u59HflNQsshszxNGuhwcBERIVlkhy+aGbPGVNck0HxiugzsWYb8/lclNTn4/sfm4qZ yHKqzgWns7ReKFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX9IAJhleITKGn
 F35/DjucWgjnp45pMOwF4YxHsg/9n+6qqUAIl2lD/B2SIYBhAVH1H4zBUROPs05fQ19iq4FLpln
 unnH0b0qyCBcg9RM1QUvBylWCiuxJPZf8YjZhC+sm1bZBPhopACui9+2tqQ8+TgxDiLyZiGfhNz
 77CbgHfgY0R+EC+TJpTorGUpvLNGEGxsz6rJUpq6BAk6wi57+8usjctVHSNQ2MjBSUCfF8RhHWx
 ETTNOnfWoWor6aLmY2Axro/CMZCFh8ETFUxxcDBiepDyY8kv9SlZLOo7/7tqljb3sEkh20RTuJW
 MIjvb+7m1YTqBp9LD3DT8xuV+eeKql8UtwKgcQX4UIiXxSiQ3bU2e2uMaHQSO1RpcTNUeLnUUNn
 yEitJIRr/X5+C/F/Z/yW+Z2RZsXtU90QLefvM/t0v47G2AK2WF7J4Tb0SlLUV50oZNK6GgbrePJ
 8nZYqkIs+o2Jr5e3EeA==
X-Proofpoint-ORIG-GUID: dezhUcatXOfBBirmtirVp98I9ItK8zKu
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b3096a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=BpcZMUz7IwU92FFy25sA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: dezhUcatXOfBBirmtirVp98I9ItK8zKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_114355_716825_2F60F798 
X-CRM114-Status: GOOD (  13.31  )
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

GPIOs with "gpio" suffix were long time ago deprecated in favor of
"gpios" and this particular property was documented explicitly as
deprecated since commit 42694f9f6407 ("dt-bindings: PCI: add
snps,dw-pcie.yaml") in 2021.

Linux kernel supports both variants for a long time, thus listing the
deprecated one is redundant and instead legacy DTS should be updated.

Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I will fix DTS separately, so after applying this patch there will be
bunch of dtbs_check warnings. That's expected and fine.

Changes in v2:
1. Ack
---
 .../devicetree/bindings/pci/snps,dw-pcie-common.yaml       | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
index 2c4dc04f9984..deba46d7a924 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
@@ -209,13 +209,6 @@ properties:
             - pattern: '^p2u-[0-7]$'
             - pattern: '^cp[01]-pcie[0-2]-x[124](-lane[0-3])?-phy$'  # marvell,armada8k-pcie
 
-  reset-gpio:
-    deprecated: true
-    description:
-      Reference to the GPIO-controlled PERST# signal. It is used to reset all
-      the peripheral devices available on the PCIe bus.
-    maxItems: 1
-
   reset-gpios:
     description:
       Reference to the GPIO-controlled PERST# signal. It is used to reset all
-- 
2.51.0


