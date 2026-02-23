Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83DCE98E06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=; b=BojJcTQ95CPzlVLgPU9tLEKDvI
	PsiJb0xMZwpzMSdhNruiuA5kVHNqPiczllOhDb1nPa5BEblqcB1T/CrnDxtw7gLUyZEUWF/iRtAnP
	GVCBFmxqkYGKuKjkuZCHT1dT8WcNC2HA7HPepL6FUCnz9PlUE3vxPi9D6L3TUuA1QXarLVkkuhZOm
	96/5M03ZWlyn9txSQhWhp4/glRSuyc8l2CRPJqQ6wGBOPUnZ+2hMv9Ot+zjzCsqjqFLBTJTzwTL6V
	mikyUGiILpi9keK6BKDds6bAuODF9NsHA5IMzD7XWtD+C3Prep5XOj9CTG+YDZGwPaPpwGAvBNYhQ
	LoUBw8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnn-0000000HSaC-0cdL;
	Mon, 23 Feb 2026 09:00:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnZ-0000000HSKA-1qc6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKllqk1754162
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=; b=PSRJZgRv7ZFbB8fJ
	Ct2ywslvEODZYZD0Dteb/AtL1psfjK7xJSxCfYTywYJyUj64Py+RsIS4jn2Sz3wg
	SrvlcHpwdObHdk+hcFJmGMb+OeDJ/dRXBm1yqjE3G0dX9n7lwbQadBpiEgKTxSQ4
	Y27JqAhe3EVd56Q1Uov6c0DP0GJoDT66dNRd/1/L3bxGBd9MzNc/PSO1pYizrJqU
	1gipxi8xP9ya49/xGglniiT0N7PADwozdAJ29h4itJooEMm0obJDAcCpYuzck7RZ
	h7WdCL2Oi0JtixPv+YwAa3Y5wpxBCjZ+Voi4T291wstbp6U3XXSOHLMBBp3dS0vx
	n4jQwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71304beb4so3086376885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837211; x=1772442011; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=;
        b=DiNmZ0XY73NXYLbRjVqbsAYbsuDGEQK748ksPp77ZyJUp7WT9CODaeNjm/4lneyvjW
         8Osy9PGmxN8KOlqbA9rjoLqrEN9nzoB994jhvhvKlY7MDNH4YuTtGJj9r9YSW5shDF79
         incL4IHM2HN0wUC/0yvJs70JoPglE8bc6Z3dM4M4PRsbbetIp9QepqSL6n2YUInqeHtI
         bnDNYvMrXMSUZz1A5/sX9RVmEFsczXLqUYrdjONbOoiEOmvfOAanrMYYuI7AkqvtuPCs
         NZBEZ4h+Ao8vCVFKdxxu9Og4MiLfyu5PHMd1fQvPP+QkGZ9uO85XUWkDSGAHpuL85ISp
         NVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837211; x=1772442011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=;
        b=sPxJuCXcJih2Uh/HaVUIHfqiKku9l21V5Sk2kt0M7EnEhUzYN1wauNsyDwjMZZeFj+
         8VP4MRGI/BLlrAVBr0jbbKjYxZNXC6BgWT5T+89Nj9YFbvEQGHzTh4CL13/pQnsKlpJz
         ZL8Y1EyowvfGOTOfJkgO/EC++SaCtr4acmD4+eod2AXuVkTx/MJG01nLJ/7y7qN18KaL
         BzOHxIweQ3aOc/1eRsqJJV0DMWz3KhJaf+B9W4+yaC/QmorqAeeqo4lqQS9Za4HCk8WX
         421tUdHi2eusJp9gK6CFrAv34zoZEKFw+PpjW5qsiHJ5PfmeQjs3Zu5d/cMfuYp8K/9M
         QOig==
X-Forwarded-Encrypted: i=1; AJvYcCXC1cZc2lnsLtWD5LCDCE8lfZ5yYq0qUZbMI3LJgU/G+zPVyjWzZ9KDeXH0tVpUHtjGez617qL9LiMYBmFGVVhj@lists.infradead.org
X-Gm-Message-State: AOJu0YxdZ1N4xBoW8tBalMfTBFS+dEJCuoxewn9Z6kfqOovqUfs97xJx
	MbBif8Z5iPKiHez95kHiAkVieP5i8fKaFDhl1sZs6fYySatieoVC7eki/yyyz1+p8HmSPl/kOwM
	vBdbarPimv+AgdcR/59ztUJX1mRJV6TC9uOxSbtpnesBDq+tsK3ax9NLR1Y1iqZjvKKiXLeIdUk
	Br9g==
X-Gm-Gg: AZuq6aL7P8FBu71YGEswJ1jh8a9RozzxSiIy418f7cf+EPzjRqtS4cjiMOX8tWrtIXB
	W5UTrwIfTsP9zJjTe2In2xbMPXPzzBShtk01n/a2g/apTZh0f8WPj9clTXGlJwvBAFs0YaTzNMn
	OXF1atA49aqB4RP760XOtHVBFuaOmTflDVb/7fAhwJG4C4GEV8Xnxeu0rfFMSXMKxiD0MrU9r7d
	TOmGBJdfSH8rx1CmPP8EDTWMARoumVTJV/HzY5RYB0Ex/wYfv+2TRn+m5uDRoT8BYSKckfxH3P8
	toycsLWrvq/u455C0uNYe2CHlCEHYHLgCBEFeuE3gzzJnH3vd7GRyFBOcbMHH6ZkCKjtdIC86NX
	NcmCVh7bT4WvBoleBjLhaZZtxqxsoXCSzHr9iaSTTe0P6S92p1Dbf
X-Received: by 2002:a05:620a:40c4:b0:8cb:1c3a:90f2 with SMTP id af79cd13be357-8cb8ca81f99mr847881285a.64.1771837211286;
        Mon, 23 Feb 2026 01:00:11 -0800 (PST)
X-Received: by 2002:a05:620a:40c4:b0:8cb:1c3a:90f2 with SMTP id af79cd13be357-8cb8ca81f99mr847877485a.64.1771837210797;
        Mon, 23 Feb 2026 01:00:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:36 +0100
Subject: [PATCH v2 07/13] i2c: scmi: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-7-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1vPODltnTM4Mj89cEM+Xo4mC22cbE/KV3QxgDL0fRbY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcDzdqpQoO1qrBXLMBTaUorlyf28sbZOZqxK
 AmDe0QuUlCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAwAKCRAFnS7L/zaE
 wyA4D/417EoyqI0QBn4m++bexsMnLKIhOgaSKHUlCRm4WI0kBCH7GfKNgK0l6z9SvrOC1PZnQbB
 2l0PDir3Gnpx+UNskCvlxw9rjF3lBGssYYGa3MKV4RYggkAOwBTogDaLDyeI0bJw0LvXF9X5UMi
 V+vzvRzs/8vJXCcpVokzUI94EnTskk137bVDQDWWd94SiFlx30X/cS4x1o9Vz/UwklHpX7qi46E
 yMNQqgYnvg4PEPqi10LUKV10mU+2YEQR9/ooqGMteOJjbvRfb1VP00k9n8PzFzPUzWD9ZLCwHEY
 nnc2ULdIYR8Bcbu+AeD4P6PMQ1BpbGYQESpx7GVIKOdNcQrjnrLJefyJKvRpOuJd8rRujB/CwtA
 wnEutW4GlXh/yMXgnpqnOTzrQfU6hC7HMIhpMXf1sk/2idyYqgV/SqJMfZ+BMajPVIuVxTYglj2
 5euD/Mz1ZAtyF2XuBVL2mdeg3jqXPc9fJfgH6XfViUmnaKHN04uOJXrBeB8PvGFLzomwfyC3lCt
 FyF09qqotF/WPjhL+Xivo9wdFdqRe5pK/YtFHMyqtcZN9lpVIjE5exOQA6Kzr0tFqg05+J4v6xn
 caKJHWeVbnZdXH6hqq7ZJwglqDcAazl9a4qgg++XzUMrHK0w9pnYrkW1ldDjKXJF68OF0Uwgty8
 OqHs2gqY3dCK8tA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c171c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=iZeLIxs0cxVxcBwrIEAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfXzR/Z2avUCyIH
 8Ds4MuAby8sf/xe7RG+avOsDGl0ldfOg2v5BoxHXu0Y1/PR+iNR5pi5/fIsS4HGXNZ4zoxQ7Y+J
 YrLNELFqdll/ue2+IVx4yRKLbq7MBX9QS2jVBBrp3xa1Xx4IcPFOl6eF/tLOgXr+Q6qWX8+EPKd
 wJnh2B/8kVMEbiQP5861Hp2CkvDi68+7O0L1yxmO1dMhljdQSbaJzU0O9mGV75Th5joyIVFA32P
 GdyDqr9g3kxJAqaPHbqKRc6X0X5pcotMS2P0E4dJfGEowjFuF9g4Ur3evg5/foe5PpvzKDYX8P5
 N8mAcriwAH4c3WR7MmzmPmzjM6J7JTUPXd/C7/WAGntFQi923708aellE0UsFrk/2cTiljJxyu2
 6VqiMPc53JoaaPlOm7HKTtqr4TTzMr0Un+dXj0RTD/YZr4YBJ+dwa+FmtH6BQ8SqBd7nkSgYbTH
 lGzUQDnjB+bE/AANPtw==
X-Proofpoint-ORIG-GUID: KA-f2X2D8NoBsc3kdKs4PH2qZ4w9Jc2H
X-Proofpoint-GUID: KA-f2X2D8NoBsc3kdKs4PH2qZ4w9Jc2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010013_504011_650D6BED 
X-CRM114-Status: GOOD (  14.51  )
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

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 324a63efa1ab90027854646f84142f052a966537..57b8175f0fa8da52dd74c5bf8e3059358c033a37 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -87,7 +87,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 	char *method;
 	int len = 0;
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size,
+	i2c_dbg(adap, "access size: %d %s\n", size,
 		(read_write) ? "READ" : "WRITE");
 	switch (size) {
 	case I2C_SMBUS_QUICK:
@@ -148,7 +148,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 		break;
 
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -257,7 +257,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 
 out:
 	kfree(buffer.pointer);
-	dev_dbg(&adap->dev, "Transaction status: %i\n", result);
+	i2c_dbg(adap, "Transaction status: %i\n", result);
 	return result;
 }
 

-- 
2.47.3


