Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D24E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QMmcdT+K8wwMJ6Nc4yP90XgGiFCkV+mKlk/jeKDr12M=; b=w++K5PP0f+5Aa5FrZDRRMHvTS0
	LloFTBLmMHpOCmC356gioyNdvCJJzWohHX4R35xOr2QTePkVuYCTjyEZFRuToOCAc87CL/OIcfaDg
	Ar+eV1f0NkijNGJuAIPRBAc6SUEd7nWoSUGwHD9hmhRFRR2aeUwzl8o8iAOX6mvKacRqAAVhEkGbS
	2hn2uF0Ln5LdhAviYUexUguWXIfqWW9qUg75pFV/7w5djsEJReAkS6UAeflkCprhAtnxUhv7j+ae/
	VwJXDXohIgD2tvrYFyefu/JjKlUc+MQPliKQhbl45H6X2fJQZfn7n/oxJU+XSbZtp5koJWa4gKa6C
	jtVFDOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4FW-0000000FfoP-1vZH;
	Tue, 23 Dec 2025 15:24:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4FU-0000000Ffnm-22DM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:24:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9u90o1890693
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QMmcdT+K8wwMJ6Nc4yP90XgGiFCkV+mKlk/
	jeKDr12M=; b=YRUlRJxenXvQ+jR1NcpWqryBMsf6boy9w4ikbM1aqcSteWRUEak
	izAeHOrFG9jfp2UEVaGRlMBxf7+vOEbQlVBIO4EIcLYDVwfFo4MFJpoVqjf7ZjpB
	oR6MyYa9hw3iMuvcwSaSk4HbyfCQQDgoGhGfKyPDztkQgH4nKCVV/RRZl/3Cs5wy
	P1YeFpQ+8bk+fkc1OFAh4oami0eqc5glTXc9/vhI65BWT6PsMBYLQYDP6jZgudyd
	utLo6YXeiVGUqx9Dqcfm8f9ahaMQLLaAJ0TqsSjozbBoeHwZX9et8O+FjZYaPAYO
	GfMboj/MHG7RhG4q7RTNHOrUusavxDhj65w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770am0w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:24:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed69f9ce96so165393081cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503470; x=1767108270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QMmcdT+K8wwMJ6Nc4yP90XgGiFCkV+mKlk/jeKDr12M=;
        b=K/y93jFD7FV/+Bn0vtUQikdb8FOX5lJRCkmqSHH/J/2/a99xS6YjNtaqvy7WfaObRe
         CY+vbAhLKVGXYfZzFnoodu/cEbOevmmeNnJRa1kyGcTBDVnABRl86Tj52gd0DzyBDfHm
         /2RXWDjLpinbhd+MHFS+ik+n3+xXTfrRX/9reQPdRaRdliJpN2zGJZb47bo4FLLFAXpN
         4VRimW2/l31ZaPI3CpALGSFSLI5d5A2Pot3C03MiwM20JLDg7bM02JqoiuIjjsKXKryi
         QwmuzYqa3Pp8qWQOyjlVyj2gxW8SvF1wotBa1JzrbRbkTgCp88EWulwoXvOiKSvuEJxx
         S8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503470; x=1767108270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMmcdT+K8wwMJ6Nc4yP90XgGiFCkV+mKlk/jeKDr12M=;
        b=bDYbJl+3J3bqfd5uqtCb5itADLz+ibeDH3vLeUsQBku5CV73wVSglD7Rb9gUDkaAvN
         ijYg/oF+tABOoE8e3xaPKmS5CeaKmQZwjCjfO1Cs/RMcfTAXj5t86MFOR3RixxtElOQy
         mgx1UPCFfg/aZQPTRwgzutfvupTczonlEEfq5Js0AcrkUXaA845XMbpV+Djg2w61iZZ3
         gDVWNgjfNx0oGrBUBpUbuWz3bGX7ebpQkuHX+iEAjDYBLfBVuS0Bu5mrpKnLQ0LVXs3s
         iVCeUQUAta3qvjpjS22H4MCqN23MohqG408BUkztMGdhfIdfUUFwpLfXXQqPo0a43gfE
         X4/A==
X-Forwarded-Encrypted: i=1; AJvYcCWhcMnv2qHYsUGFquaQ8WEwA1JiPVrEjUlIVAzku3fwFdmHqrkeF2PWNODbb5ZXv/f1URZ7ZP6KiHLlYcLYPq5N@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp6Uq2Keuj9Vo6KvOCX4cKa6byOzdQ8tYHS1fkUZUmYhIDMNX2
	ALnZjWlLT1vBeC1AnJslBZOyJsFeJ/a/mm+ev2WU7XtOcSRp7c2CYivoNxOk+mb5COtMChdVrFd
	kdfLJOe13Jqd65Guau4a5GucjTRsdzwD9pQycXqTWE9mnbdm+8JhfiT9+5wDqg4KM+HWvOTlsMX
	7WnVii1+2jew==
X-Gm-Gg: AY/fxX5pmWG2TkZjci2GiwnZG4uTsiu4r5Jr4f+S10yx0jY8dp1d77Gfr5YO1CgWVO9
	RX/AmqmpDdM+bR+ITyNIGw/maTtE4XxGE9LrgpKJKxrgUonNkYrNU4FH3XRcTxHv73OAksN6moj
	P6ht+81ROp8nCrUjgTJ8MJsm8xgQix0T5DXphYg2Z4zyiKUWO5zcxMkeS0HfGVygX/oh0amr4sw
	IGdZ+k5v4yXgIP3FXJqS7JuDa3feOB2fqHIjBsTzDlbE+2H85iXWCu/dX9WtyKMCandmJFiJSxQ
	9dhFI11Slu37/Qt/vCY/yOEj53f1Eu7fA6LWvlzbZFMCFW2aCMBlqRrbIO4vH+YOJ4Mb8A9LQRR
	5x0nfm2p2AEij/VeVvRFSKZMOyfQC+Y+8atcWugf/UKmsjHXK7kzvHbgdTa6ummlA2mo=
X-Received: by 2002:a05:622a:5a07:b0:4f1:bd73:ac6f with SMTP id d75a77b69052e-4f4abdb8cc8mr231626221cf.74.1766503470560;
        Tue, 23 Dec 2025 07:24:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG50u2D69lwV8b3TXu4NEv9KuyeK2nPzCvtYeviZ5nVPswjTYq9WxwSsmE5GaZkxzYacemvMg==
X-Received: by 2002:a05:622a:5a07:b0:4f1:bd73:ac6f with SMTP id d75a77b69052e-4f4abdb8cc8mr231625831cf.74.1766503470119;
        Tue, 23 Dec 2025 07:24:30 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80377f2f18sm1441971566b.0.2025.12.23.07.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:24:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: cix: Use lowercase hex
Date: Tue, 23 Dec 2025 16:24:25 +0100
Message-ID: <20251223152424.155253-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=tfCmGWuWFSw1zXPwxcOw/l/wjenGNWYj4UhPm6Q5Z7Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrQo7RVLhUYbhcym3Pt6bv+anUgASPS/TY4yL
 Nq8sXWeMpOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0KAAKCRDBN2bmhouD
 1wIwD/9wkHL24i2n7uk3eE3ApWRssD6UR7rGxMsnyh/yrEWkRjmqtcrq8FaHa7pew3iASN9FhNO
 FxUN4CgVqpnDiDVw63ljF0oh/HRMXwt6V/y+ljmx+fqLCj0cOqMYDImkLrKtqwBGbQC2ipjSGsa
 ZLydjg35PViPxcSfMHGtwgGY+UqZILz8RsIbtNLpIJD3BxmDO836xYetm4mbqCCKxwm0j479YqL
 vnWsVXXHwBNi0ILoc0LYz7/ILoGvFQk6LJ32f7CE+J6p6CDloT+QUL2p+MAf8wFTBfnWrTA/pgf
 MAbI4rKy16KvmZCIHGRL8WdVLQqNFs9hxSqo2IMtovuxvxCsBOXmk4C35Qmf2K3BnyI153CNbx3
 wqU+X+Bey2hapwdX7rEgfS+5Lspt416rgcQlf1+tcKRZeAYs7y3qRHFzRkWtpePoRSLl87PjypA
 CXNiprWN9ZwcWb1hxo0jpPTw7eU3a/Cq1qBTlxHR8mHe75UtvuPa/O6fQC/kYhd9Mor6Eg8H7Uf
 7O4Ovte73P8Jths10TtG8oMYfGU7uHx2MFvAMdVO9ZXsl6ZFXzSRnV0w7xKTZtb9MY4PXHHdTsO
 aACANrVl2mMHU0rDZGqfaRbBVVYkv8SD090i623eT7a4JZwfLSj3+DS0ddnQnvSXcjayOQj52rQ Jexx7lZsXEPtaRw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX2ePasYcXEiql
 Axyu2SnIRPup/HiKvuqTx5VLP0m3GRZSovS0RXLsAvJ9x5COb0ZCJOoCcUlhGioEkleITdlU8i1
 0D3O//ilwoDmV1oV/EDKDdLKZqAsgHuqL7AI+mEzX+MquVrOKyLasdhSLLNpKkXRk0J0+GIWfzY
 sa3YhnUygjHtzGwCnowr7X2310zYEJvSp+4W3XqaYskFaWKMnP86SAcw4cnq5dmRjFpXy6DNSUK
 huJTwmryzdao9QrvxrHbZW1IVRqffi9/SLABi8hMWBtrbmMUfVqAqwhmLTcCuEPbsZSskJnrcju
 Od7Cd5NmLuvF0hInXUGpPcr/Z2PQs2ZMAGyNEHXRm539w9zPyHJQLdU+hpwdDjbd1qX8s1wnFwV
 jyNE2Au+0ty5gT5fD3Zq4WGpk920iVrDxEPwb/pUUuWXO96JNqHqUaDF+ZuBX/QsMP2OSW7I8WQ
 UNqwvcLtQGgcqDUrHgQ==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694ab42f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=41lT66G6l7ICSz0wmBcA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: dWUyaay1QX8ls1DWjEMqm9QRO43v_Ujy
X-Proofpoint-ORIG-GUID: dWUyaay1QX8ls1DWjEMqm9QRO43v_Ujy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072432_641201_A2663C5F 
X-CRM114-Status: GOOD (  13.56  )
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

The DTS code coding style expects lowercase hex for values and unit
addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 64b76905cbff..fb8c826bbc97 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -523,7 +523,7 @@ pcie_x1_1_rc: pcie@a0e0000 {
 			reg-names = "reg", "cfg", "rcsu_strap", "rcsu_status", "msg";
 			ranges = <0x01000000 0x0 0x38100000 0x0 0x38100000 0x0 0x00100000>,
 				 <0x02000000 0x0 0x38200000 0x0 0x38200000 0x0 0x07e00000>,
-				 <0x43000000 0x0C 0x00000000 0x0C 0x00000000 0x04 0x00000000>;
+				 <0x43000000 0x0c 0x00000000 0x0c 0x00000000 0x04 0x00000000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			bus-range = <0x30 0x5f>;
-- 
2.51.0


