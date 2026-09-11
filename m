Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57102C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=; b=LJsfMbnLNgJ/hVJ11jVaiPdbt/
	nbpnRtBSeTafMGO4kbD8vNfqzTk99SoF50xZQtGyuAo08VEgH8Td5YlGHcx/HRnaCl8JuqdzCFbRw
	XSxAYSTmpbxu41Mfiz5x/1zou5dTw4a2sK0h70WSzefFezuR0ObuxfUQlCZBMue3f3KtiBEQOl3pt
	rIvMEEFrDbNrZ00sKrTTD4pt7tuSptEBaNXMkoNVXSTWqtAT5j1SktXaikxuQ5zbwXz9Dje24L/sk
	/1OzsFS9NT3fQGayge92vAWY0ImpvakvRmToUfIwMLdgrOO+JSaQZdDkj8mYgTEFfe/kZLE6fQVop
	BSE1Lr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x536W-0000000H2Mb-31Zs;
	Fri, 11 Sep 2026 15:23:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x536M-0000000H2Gf-2kIx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:23:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmFl5798927
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g5ESSTcnZuT
	5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=; b=Dp4kRRQpf311WuUvZyTt1GXXi8G
	mQYJJF0dlzq5DsvMj5qcT8+2XoHzzdBcsvCTXIZycX1tPeuDr4fJwTrinWI+XCIS
	RZr9KMknF8zabRu1Z99rhRnOTBmnz+oGP3KkyHZ/x/7Zkp/P/UnBfrcxzuo8rRxS
	AYpK2/Xy0wzFGf0g/R79AgTuzeqTejBhWQo53tpIEBFMzeeLvKLYRq+pN/aM+N/y
	Rh7oNoGRbqeQPF7851HTH+/1Hbt0SxLjaX2xCcry4jhnQpsiJR0/LIXHo9rO0VF0
	5rigtLFxh9aHI/uR1xm1pDcI2KT+d9BFbPNeCGMghN2kgL8UZSAg7Qt34eQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q147mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:23:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78bb7517525so245240137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140221; x=1789745021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=;
        b=WNY+aTLIZ/6Rjxnl3+nlM9o7lj+2+El4I163LWcrjywOaDStl84gIoLezqeXAxQc07
         LUTBHYkxeRj86TL2I05/KO00Fg+uJBqRsdiYJ5SCDsk4RUuDEw1OCf870zdfAb48k30M
         V03B5YCEfAKlF8lAf2kT3imeEBRLNY71VtvCZ+9vzKECqAA5mbClQCa0DB6DbQs+5kop
         aEaFd0WNiAVmkDv0DbiQ26G5xvLrBwL4icNz9g9VrK8Gse+Q+Y+oR1NUQKOgrTgT4lab
         CB8JkpqOnF+pyrHmDJsazWcYSdylwmUoFhGDbd+Ou88uxY5V52AGUdI321gTcbcOppBi
         ygkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140221; x=1789745021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=;
        b=fK6yUWb2aHTlMRoOl/3g92Gycl/T+X6rsCy0878H2CpA32H8u2anDz+dtl/dHQLOYu
         LXfwxLeRVMQpl3yOLLxebEs8bVKGuHO80klMT/Lx5e/+xP5n8r/88NaGTlxzjh9MGMfT
         UArqFECsXlcnadjwl55e2zcpzzc5RV/p9SjjftXKBKapJlS/Zw/2kX54B7F46tNv4H3/
         pkeat6i2FdRtPEj9L3weFpqJm4SqV1J0oTWuT7lZGMtZS8p8nFQTWswOFUbzwTDs8a3c
         VNT2GkZADCIHsXDPEzyTOFq/PGsQigC/FgNzHwQjlGaNJ2JTtijD4Skoc70xzCaxfUeg
         eOEw==
X-Forwarded-Encrypted: i=1; AKwUvBxdWZN6Zr9dBVd+i3YufvCHZc3Ugp7Xm4hmbADT0CW65nGcic0wpTblW1uEHVFOI4fTDBOKNJTXRAvyX4IR4r1M@lists.infradead.org
X-Gm-Message-State: AFuF++ncUqCGd4ArKHgpiZiDWzBKZmLCkoZOsgk/2gG6rHa5m9VZSNM/
	xrB63ReLEaVyBWUpe13wFn0+UE3+H529dV/yu7Nb15vaR97TnzCjddD2tn+qb9Z5GsJKzNzmYO+
	X0fZc87+7xq93peudj+x1qKB8slbozAlmBuuw1m/lPwfsTAeBXZ6P+rwvWF3knkZ4zb8hFkEHzO
	4iSg==
X-Gm-Gg: AYBFou1qxAdxMJbX9JA9ocjcEja5ySTnJGRRIWbHyCLSiEZGIPD4nKWhJyCsm3B4MWY
	eVTF4O4gzgXWravWBzEiMhvvxpbWcm0KxQuhe4exmd5IVeK0UENB7d+U8OhXx4ALzIxl2UwCxtT
	z9GPYSSii5h1Vr0GYrvWmA0WJShlNlCRQ861CyJSTiQRbmnItcZyBTkY4jCS09kL+t0kF3svNwI
	NaJZOPrlXLSaaEpqcSb4pkmqC+clfwKIhGB4zoX1gDO6gye8hk53WMVR5AO5YNd/xsaUFpAfu8G
	IG88MBeZKk4orkCQ1jHJ7Ra7gr9yLGTqAZ00S3UDbG7Sp68JeuEsWGSp6DsO27nAbmUKvyA5Cmh
	/5usFv5sygELeFz2rjrPZDB2uU1QvQ6MwpvNpPbjflPdU/lIlmOTQI1sTZZG99rGPMWjePqLag7
	PR1NMZcOUEbLnAm7FsAOBXxfNIjvJqPvuYYPyU
X-Received: by 2002:a05:6102:1953:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-792a52b9d3fmr5324919137.2.1789140220613;
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
X-Received: by 2002:a05:6102:1953:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-792a52b9d3fmr5324849137.2.1789140220237;
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:36 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
Date: Fri, 11 Sep 2026 17:23:27 +0200
Message-ID: <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa41cfd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=mtY6ubt43vOedHXxatAA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfXxKL/8yEnjhp+
 VsSuYN4FSCUzKdQfqFJRTdjb+/iZS2kT9iBPNq6fPlscYfUjnCp67uMWsF3l17D+Yi7Ih3/EEcK
 7XyvFJ8hTfSoKE8bLpejKN3+ddR7lxV6/GNGEj8Q1txOp8YNZJFLOqTFu5r+tCuGpiW+GMtGBQh
 UGrqqvAYNzyIt/2P17SdBeuWJeNGAvnQUqApPZoHMdnE42AB9oCuqGnlX1T3JSt0PZOD94En6x+
 7CgJue+YbWaVgdtAjELb9Acc44T6KJpNy1hgdYmcDf1AuxHxtdf8JuAGACh6isT6Oh/tS6N0wLL
 CqgltH5xhI0eAIJ1ySCjIo/ftfrXwphAxgPDdCHTHWB2Xc1ygGMzCLDeU7SfcAXYPMWq9ibxdMs
 beiWrh4lBk6hr+EOScYmQHA5SxsQu/XZ+TI7qOUylVsxdmQ3R3KqMMCZUXFdTnTPi7/cSzFclNK
 YWtzRcNpCFN9aIxTN7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX7S1XZJdv+4MZ
 R/fEZV46AhXeh/dTTdnlUvpYc+c2EbgAxTSfzQgVfLfrnjHv78Fd6QnvAWF/k87aUTaJ9+rB0Xf
 m4lmo/rE2bCCWLe6QAjP0MUbyIfRGbg=
X-Proofpoint-GUID: lflfKu16Va-VdU8z2YBmq2lVIN9mLlbK
X-Proofpoint-ORIG-GUID: lflfKu16Va-VdU8z2YBmq2lVIN9mLlbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_082342_820522_653EF6E3 
X-CRM114-Status: GOOD (  19.70  )
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

scmi_protocol_table_register() stops at the first failure to request
one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
previously successfully requested device-ids in place.

Unrequest any successfully requested device-ids on error to fix this.

The code manually unrequests these rather then calling
scmi_protocol_table_unregister() because one way this can fail is because
of duplicate device-ids and in that case the original device-id must not
be unrequested.

This also moves scmi_protocol_table_register() to below
scmi_protocol_device_unrequest() since it now calls that local function.

Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- Add Fixes tag

Changes in v5:
- New patch in v5 of this series
---
 drivers/firmware/arm_scmi/bus.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..6f667e4ffeed 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -137,17 +137,6 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	return ret;
 }
 
-static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
-{
-	int ret = 0;
-	const struct scmi_device_id *entry;
-
-	for (entry = id_table; entry->name[0] && ret == 0; entry++)
-		ret = scmi_protocol_device_request(entry);
-
-	return ret;
-}
-
 /**
  * scmi_protocol_device_unrequest  - Helper to unrequest a device
  *
@@ -193,6 +182,25 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	mutex_unlock(&scmi_requested_devices_mtx);
 }
 
+static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
+{
+	int i, ret;
+
+	for (i = 0; id_table[i].name[0]; i++) {
+		ret = scmi_protocol_device_request(&id_table[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		scmi_protocol_device_unrequest(&id_table[i]);
+
+	return ret;
+}
+
 static void
 scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
-- 
2.55.0


