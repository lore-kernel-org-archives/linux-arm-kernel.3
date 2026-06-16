Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A993ECD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 18:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jagAJ5kWTSod7R143j9Inn4eTzLl+m9fNAglUfCFpo=; b=s6Zc9eDAnUUMeX5u+wuePy7APF
	WPFS1qLD9+T2EGkca5y9mGt2goTUmQj2Cw1McYtdrOoN6vxEX+prdwCAfgx/iZlBn2qrNt2BW9lXA
	Ipei1fpBRYtPeEoP0jSk9XnUbHyqHRJQkCpKCi4LJU1ew44O3nuJJV9RJs9iA42NrywdE9F26k/v+
	p/0tGUNKUXC/+kDBmPUvkWQPmcUbDPCW9G0gp3dhinP7cfIeSqlRoeJHswTCjxOSTgxUtFz8/7Giu
	xz9YXRKI5qt7LOix/uRmeqYgdOago6DfxGpkwzXPGWmSWx8cAMOTQE+1JE9SiUOhwXpTU3vJT5ptV
	lG1yudEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYE9-0000000GCJR-2zJE;
	Tue, 16 Jun 2026 18:09:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYE1-0000000GCHK-1RUF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 18:09:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GH8sGm3844856
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 18:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0jagAJ5kWTSod7R143j9Inn4eTzLl+m9fNAglUfCFpo=; b=esYTsWvEh4aOuFSh
	7viw280LQ4FQ+iMiZ3Y15ia3pIAC4sBuchx3OffabSvixwod+V8pzoS6vytuIl2w
	qncsz8k5xextFHajpYa+ZeoHtcso8KJGhMWOeheYa56XsMRDGZCHVog+5TigKwNZ
	PbpcNaklhblOajAKAcRKxffNAKMJn8H1vUd6NVkDQgjv7qvBfSn1vpdtAmJ3/biS
	NUf/eUz4L0/IvgURbN0AjagvbEgNYTU842Q/Tk2IKqrOf/MT9YiC1zwqEZd+UpIa
	PMsrJNrBSkKkWisiu/UJrhu5lQVaVFQzb/TxJXCfbMUKRDeYWHS4rysm8+Znb8fl
	1nU1Ow==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253jyb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 18:09:24 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-138acbc0e69so4840601c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 11:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781633364; x=1782238164; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jagAJ5kWTSod7R143j9Inn4eTzLl+m9fNAglUfCFpo=;
        b=H18tg+DLADf2PqaNogvhgMP9DK30F9Lp7FGRHOLVq8lPZo+sLNY9Ih0SKSwAHdsMqD
         DmPMC+62FqEW16Dz5zJtmDG9wD6WwwPy7PKJ7HF4uyMPn+hIuu/SxHWqNNKQfcCXCWfs
         tVGMWA1gKBTw7HOgVtCndveYVwYHRiqfWJHfIi3JBU9V3fl8FYRNEtV6Ipom2UgGDw3/
         eXmLlXm2b6ZItq1TLMKWL9DPwCnA0EHZF/n41WHLwdeSI27/x2R/+Em12j7QSI9Rx95C
         ow5psP/RuB789DwxcQWfBk9Ck0F0JDdJPvQVtQNPwwME0MlmfcMa+sz0BlPLJw2R1D/B
         G3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633364; x=1782238164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0jagAJ5kWTSod7R143j9Inn4eTzLl+m9fNAglUfCFpo=;
        b=DLvv374q0wCU3abdXaDRxgQaX2To36EXpj7V6cLxfSSf/QF9MJHM9Wz8qovngkGYqv
         HAx+ZLjAMZi9SuXRar9PAI5E1cRmiV47+sOWxRLvFxlX9KDnV0NfWPc+jw2rDg75VCnQ
         m4px4N6tq39+fQ27KfpZRFl5SSTWkpBEs0V/jg4oSYtRdqKo6L1KGLagO6oOZv2Fcsm2
         W8+9WTl1sTXQZDNBJGuZ8AUsb1H2al4VGbuC+pykBSBGpGYoT7ZY8iMnsHfOO9zrNK+E
         Rchb3PGVWZN6+ACglsavPSr+6f31eyD8XGjuRg5BWYOcfpMpmDyRL9wOlh6IdLcd1k//
         DQQg==
X-Forwarded-Encrypted: i=1; AFNElJ98gZHKgnFcSqt9/O/iz/28YFLIMa3Xjs9RjepMKFQV0ppBHgGhiuZ3k8a3UK8kptPFTFvcZ5z5gtG1jIEWosZq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6W6IWDCLMSNc4GJcZi97G6a4gK3WvKAkHPeZV5ZoNw7QNv54/
	sFVzW8gNf7HlG43RKac56r6vUSGp7Dvp7yFtRD++OYySfeQiervVFXSx6CoMXu62HOpY/r7jFKF
	KF+3nSOMLwCT6JPmUgtY6nxII8n4DauXe9rJ+CbR1Q6/tO5jkwGHDJcoSDcdi04R9uyOounjg2t
	zbUZn9n/NvEA==
X-Gm-Gg: Acq92OGdcJZC0vvXX11cRiMEvxhp35Z4lyRL/3PsaQ2YvWqkpDvD5BJQxtGHBPdB6zH
	flw+ek/Hi+aYUC3ZbWmZ4Kp1MelfjQb35sgzPDrNCFwln7dTGIK38enVZeNw3flnB8gXb6dpG4P
	imLCzCCt1rl8w6BIFcjXl7xmSMQIKzFwVkL2YGOsr/Hy91H6KFNDNW+eWSETfd6v1eVJfazOd9p
	leaIjLw6EsbRzeiZNsc54QFlwD4OVz0KFJq8vs24KIjI3jVGq4wHzTqn9AM0alV0vnp4Mi6SBhc
	3Uc1DlusjSgExBx2S6H/Ne+8zbR3memaoGvfAQV2USFnB7F/Ij+1HCqf1mpkXQc9X3bBjsegom7
	7l27ydxFf6ftbFLfeNhr5+yq5LltB2iFI60+Pu+lD/7S+puQ+zMp9gz9iJv3KbQE=
X-Received: by 2002:a05:7022:112:b0:138:4f8f:e2f3 with SMTP id a92af1059eb24-1398f6df39bmr14538c88.32.1781633364143;
        Tue, 16 Jun 2026 11:09:24 -0700 (PDT)
X-Received: by 2002:a05:7022:112:b0:138:4f8f:e2f3 with SMTP id a92af1059eb24-1398f6df39bmr14514c88.32.1781633363605;
        Tue, 16 Jun 2026 11:09:23 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b916b2bsm13747124c88.6.2026.06.16.11.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:09:23 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 18:09:16 +0000
Subject: [PATCH 2/2] firmware: arm_scmi: request modules for discovered
 protocols
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-scmi-modalias-v1-2-662b8dd52ab2@oss.qualcomm.com>
References: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
In-Reply-To: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781633360; l=3049;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=QotbZv7vjLrREeiiHMvKmU0dv3R+anoFnJbihk/prqo=;
 b=mB3teymLVnjogVQ6ExoR0B8j71yObnhG9+mpy3G/YKYbRRmaxd/rbtwdNPct9ZL7MkcP9BRiV
 D/b62Do9yGlCbNRbysR8nEk0uZCXaj60e9kojVb6CI+ua3aIcERljQj
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-GUID: 72xzcnEnKDQFwjU-DtM50_fCQ9iLgJp3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfXxLTlqxn8KYNG
 /6+BxOUq8qLGvpv3YBu7IVkOYXL9aWtiLKY14nLuQFPAOQm0b5lAGM4D+YEjWH0mOoRpxH14JwL
 if6dy0fs13jZ6NI7cuKltAapaCy0tgM=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a319154 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pziBBDB2UT3EZnJ0EPMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfXxyCSpZNpwoiY
 hx0hFzCgjVLxsDnfOm3JNdGbiHYuGrHEVTBImpxjc3tR0xQ/urve3ei2FixvBxZoqkAbpAaKixO
 RkwTNzRwVg0J6ASp+hUPFoaCZau9aZCCsJ2md5OVki/mRNKxdfiy8DM75XJf/oYw6iLShHtZ2u+
 AUdP11lABNoCAukKz5AAlgwxSiJ1rlb4gkBxCZgpXfmn4167gR4FeNuyPFxIboMKOvzeHxYFL63
 Q0P1B6MsKcvbd8QRu0gFG7yuqGC2saB1pGxrrsqIRyB0pOxzHnfRhp+M3HFoMUfqhAlbRps1x/3
 fxQjoj1fJAWZAHdQotptH68xLKQlwmbqcvPwUB4kFEYHsJDOdsFF1CW5tgKCRoWVfAF4eK9JgBI
 k31flXiUYsvahqyDA1pLPOvXh3XvZJNbUY+fflnJXxmgqiie4bpU2hGx6LvyDTOqu9K9Iub7LIo
 eNpEpzNv4EI3X9e8Ihg==
X-Proofpoint-ORIG-GUID: 72xzcnEnKDQFwjU-DtM50_fCQ9iLgJp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_110925_393054_C948EDAA 
X-CRM114-Status: GOOD (  17.59  )
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

SCMI client devices are created from SCMI driver id tables. If such a
driver is modular, the core does not know the driver's client name until
the module has already loaded, so normal device uevent based autoloading
cannot break the dependency cycle.

Emit a protocol-level alias for each SCMI device id table entry and
request that alias when the SCMI core discovers an implemented protocol.
This loads modules that have registered interest in the protocol; their
normal SCMI driver registration then requests the concrete client device
and the SCMI bus matches it by protocol and name.

This allows e.g. ARM_SCMI_CPUFREQ=m to autoload on systems that expose
only the SCMI Performance protocol node, where the cpufreq client name
is Linux-internal and not available from firmware before loading the
module.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/driver.c | 2 ++
 include/linux/mod_devicetable.h    | 1 +
 scripts/mod/file2alias.c           | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c..8538eedc7c3a 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -47,6 +47,7 @@
 #include <trace/events/scmi.h>
 
 #define SCMI_VENDOR_MODULE_ALIAS_FMT	"scmi-protocol-0x%02x-%s"
+#define SCMI_MODULE_ALIAS_FMT		SCMI_PROTOCOL_MODULE_PREFIX "0x%02x"
 
 static DEFINE_IDA(scmi_id);
 
@@ -3362,6 +3363,7 @@ static int scmi_probe(struct platform_device *pdev)
 		}
 
 		of_node_get(child);
+		request_module(SCMI_MODULE_ALIAS_FMT, prot_id);
 		scmi_create_protocol_devices(child, info, prot_id, NULL);
 	}
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 769382f2eadd..2cc7e78e35a3 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -477,6 +477,7 @@ struct rpmsg_device_id {
 
 #define SCMI_NAME_SIZE		32
 #define SCMI_MODULE_PREFIX	"scmi:"
+#define SCMI_PROTOCOL_MODULE_PREFIX	"scmi-protocol-"
 
 struct scmi_device_id {
 	__u8 protocol_id;
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index a5283f4c8e6f..40a37b6bf1ad 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,7 +852,7 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
-/* Looks like: scmi:NN:S */
+/* Looks like: scmi:NN:S and scmi-protocol-0xNN */
 static void do_scmi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, scmi_device_id, protocol_id);
@@ -860,6 +860,8 @@ static void do_scmi_entry(struct module *mod, void *symval)
 
 	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
 			    protocol_id, *name);
+	module_alias_printf(mod, false, SCMI_PROTOCOL_MODULE_PREFIX "0x%02x",
+			    protocol_id);
 }
 
 /* Looks like: i2c:S */

-- 
2.53.0


