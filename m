Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B375E98E06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=; b=W8MdBsgNyn3NUx4JTeHXvGdVle
	8PojcExugGp4o8DUlHJqAufHPl+7snClpjYQOxakeEWMEI60KrkMYWWbaYGIcdG6/gasbcMWaaG06
	mchK1rcr5M9tjTr6ZMPtoFYfwrHvT20GzZhSvrn0GMk0QE+5/EJLR7Sl7JXuciTe4WpHHkSfmAVlD
	fzF7x4sSVbADU2bTeMrhksE+wSVSUL6FHmmR/1DOAr4T0daHmJ4MmzqacMjsHyrKd0xddanlj7eHC
	7LDlXtsEOKEr0PgBC5fAvIJWN+EnCWqly/5suXSB4XatOe26G1ruK+0cLg/QDRjvnAifq+C3rnrML
	LBtddoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnd-0000000HSO9-3dt9;
	Mon, 23 Feb 2026 09:00:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnT-0000000HSGL-2APz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNb2eZ3378176
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=; b=L2TcI7/x7teBpyyJ
	gPnAHuqTiwFcvqBpha0hG6k1wOXoQPhpicQsdZSIGKwqLKU4eFTnGPsjFpELk286
	EMx0GlV3ROgtwgZG4p1gJNZq5lr8WTAlBMAroSDT7/76+guIkxKoAgl+FOfivX5J
	KoWiScUAGlncq91zMMk+YdyxSPxUW6KQwXxu1LF8VutmGL/LqlyeDvVa6bAMdiSq
	r9rJSfMN0tA450ClmXMDVR9dmRl1bKnmVf746W5BYLhtSLdVkqYC7hA8SIHVT1UJ
	aNg20iPugZxTE/mIJisvw6Wknmu4wgJeieMIG3Kqx4obZXeJ7698yNh63QWjDO3Y
	hVc8nw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk405p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8947c4398c4so547004196d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837206; x=1772442006; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=AjWU4VgAJDgQNkBzB1qYrPucaPxeadGtE21vLEsloO4LNHJc2Xjvzdt4HdrXFMGDwX
         zFapqwz9l2EfPMWaxc5om0MfnYCEbzkn859mo0Z3zcm3/uLa+EcK+izL62R1jrKLgLad
         p4N3MPvAqEciF9jvEgFijCXe3/YQDPoecJehSZwygTC0+/7Iq9twu+a4TmItyghYF00p
         FReP854+3r1dxrdcSViHxnUpBT5j36/eT6UylcYSGw8PYb7Nzr1WoJK5U5TterBnbZoZ
         csgYG9X3BmASRiVYm0aEu2wPVY/L8WDN7s+luGGupUYFkKnJaD4QBXbrKp2UaIqjw4IT
         3W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837206; x=1772442006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=dZFWNdBFsIVIMNM2FGTtM+dcOO3DeTomcr53teiJhCf5VDDk2F99AKBBmCOf6ziS6U
         qiPFophdneyxcxmvUgo6wbuo5dn+8y1TTw22CRW0OM/WVkGlcTdegw1/lVbKP8KnY2mt
         ng42u0gc49G8+greepK5Hf2XOCEWtr9falERv+4Ae8vW2ijTftxY/Ot4vuOwKCUyKTXK
         +NQr8cHde48WYc32CqG/HL/MRECUpdcPeJTB88q6EqMvsCRjtTNNGYaHBtheBDBvnql7
         Nu1MKTFCz3Cc4cTxzwIabCTvKJitonXZYjhJtqt31hFo8XD45OTgYFdhkGjqE8irNI1e
         xHKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD91NQ02ivc2qFDEaqZr8eqDSRPZxoarorxkUI1FJR/aaE98R/90QJmC6UJOUEdybqdgFhTpkV4/Hs3YR7n1sS@lists.infradead.org
X-Gm-Message-State: AOJu0YxfZMhHz6HAaLGWhOkHEm8QXgQHJRtfsCpNivsNzP8dJAkmKC+h
	hlsm+l61vCeK02zWAle/eerjKPUllFRAP6SeIJS41woBmpZdwJQkjL37zri+GO0PLfy6i9HEFmM
	675pInYVCXKzQj9DFd+ZI+bWJwaohYUe3ZZkahreMoGA3n4ahP0zfQVLzVM1Fyxd9nYc9h3zvF9
	KEMniSDbDc6Q==
X-Gm-Gg: AZuq6aLUH9nWNSZW+fC2VwRbu8wJsIUq7bEzbxzGR8oCWC2qalOyxzqVFrPWkif5CJv
	HBy81SyLuiKfu/ROEFqxV5wgZLrwQyLNh2eFChUSlSC1DCUICNrO0LePSh/aEYEcsP17nDB8zDw
	9k1SrMqlZFfPY4ekSffeglPaaO763G81cC0PTW86MxoGetIhYY0w92UV5wB4qMMoMhEnTpWWukd
	vc4Y2ACi6fVCfOKJ1nhJ6XndjhR5zbLX1qVXSTEtSHcVsT9weAjBr2uxhD+dtqa49c0Lua8I0Rk
	eV00Ry8hD4zf58K6Ox777JqTGHXgCaqGf/oyagN82jrrOZwUCc+uEwQZ1VqAVga7NbU4b8G1Dy+
	0MtGbWOQJFlAroalv3Ap3KGHCeO0d/Wxt0T0F7F3dwfqvBWVUnFvv
X-Received: by 2002:a05:620a:1a0f:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8cb8c9fc733mr1029849285a.26.1771837205854;
        Mon, 23 Feb 2026 01:00:05 -0800 (PST)
X-Received: by 2002:a05:620a:1a0f:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8cb8c9fc733mr1029845185a.26.1771837205401;
        Mon, 23 Feb 2026 01:00:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:34 +0100
Subject: [PATCH v2 05/13] i2c: isch: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-5-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v8r6k2O16OnH5w6BGAVCeXNkCvKSFSyUWNXZMHQqfkA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcBJgBWfoyEfYLkAxhcJWdiklbYSi9bXzFb9
 oLJUErBEW+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAQAKCRAFnS7L/zaE
 w1P+D/44ZcebR/fvD0BMZJTYIEGXsUdU+RvW7Aguaz+mVFiT8m8BjgGaH6bXTtOwFXWltPaYVB8
 gA988LhNnl9RLXQx/d3msmtcpEzxnqJ82g2IBUBx47/Qn5JYYgqUJ7LF0q0dHMl1XKj+e0awcp5
 VRPl4BH/moANOs+eghmvoD1ttdkl+3FMIHqsbY7Kq88iSRMbo7tml0+H/KbtJT5ypVwq1TxHAOJ
 1hCKo2zPjVoDM3VG8yzn4TInTSrlxiVog3/YIPtDR4whybvkrctIa0AX/Zyjn2mnyeI8JgqAXSR
 oaha7BeM6SAMI53TP+V/jq4Kw4RO0v4sVIlKWDEcbXwzmDjH1HFntiZn39C1ZqAYSIflxBKNV+Q
 CoFSfuA2hIq9W/iYmZ3ejMyDByyLKraBPgtOQ0sUPAsmNAIHLbyL//uxD/mT3bvqkSgUmhF3Xdi
 Shm2mBaRB84VPI5P2d5OyK0nbkN6um4VWfA8q/98mjk5X6c+AAmrildSJD0c9WP0L1WYkV7eTTt
 vVWBUJA8GEuLnQPcLTZg7kSKixPQArRRLn9sv0l7sLSzNUqTdqML+VFuqIpRKlbCilNSbTzt7U3
 kLL6biV8HF2aK+DfRl1pVWcaj7QjPt2rrNc2DV2Qt9ocvFAAM0khP2QOYQ27/rcUh4kxU8j2Zzq
 VHZR8pXt3HsZDeg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c1717 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7nvlAvaXHceVFyMUCzIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfXwbK5XdDOAM16
 7vw+1blEIecE4GaoI9Odmw4qKTPE6TLH6YoYOLlAQoFWdxLvuTZcmfATcwYz0Su0/loQhc/Uglc
 QYS4kwfuG/w3+Ok/NI+gGlK8wvqWVEfPH8X+tZzBw1WOEKF/jT/ieL9sHpz1a3RtIK262RzazGk
 L/a1CfiSPEKTIM4WMsGSBHVaslzSvmX34nvD9nBQ5P7ewLGDM1qHF55bLtRP24EC0a4T1zvXM6H
 DILSChGT6DGnR818c+ubG6M5hCP1ZLa76AK0/La+aVWtzwDHcJsAJVAZgh8990e8souHym8o/ol
 LJ1M2rKQ6J5T/jpyConoMFv6fGZtr8klNsZC3+dg/xNGmSnF+LL8KVwzAOHafcJiX3RWFSw9njy
 latagoPSOMoawDYCoAk7jBNq69r243xKK0UopJASkfFPbxeEbYQt8bSnkwPp7Raozr0Fv8lI/xa
 Tf3YHORmLORP6GM8S5A==
X-Proofpoint-ORIG-GUID: fUpNrp4ulGz8duhvW6i6pZ2sOaDScVDq
X-Proofpoint-GUID: fUpNrp4ulGz8duhvW6i6pZ2sOaDScVDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010008_333233_00CA5F11 
X-CRM114-Status: GOOD (  17.66  )
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
 drivers/i2c/busses/i2c-isch.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index a2ac992f9cb0d2accfaa979b802b98c3b7fbe3af..6ff07ab12e30db6821cadea4de3a588b9023ea20 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -86,7 +86,7 @@ static int sch_transaction(struct i2c_adapter *adap)
 	int temp;
 	int rc;
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
@@ -97,13 +97,13 @@ static int sch_transaction(struct i2c_adapter *adap)
 	if (temp) {
 		/* Can not be busy since we checked it in sch_access */
 		if (temp & 0x01)
-			dev_dbg(&adap->dev, "Completion (%02x). Clear...\n", temp);
+			i2c_dbg(adap, "Completion (%02x). Clear...\n", temp);
 		if (temp & 0x06)
-			dev_dbg(&adap->dev, "SMBus error (%02x). Resetting...\n", temp);
+			i2c_dbg(adap, "SMBus error (%02x). Resetting...\n", temp);
 		sch_io_wr8(priv, SMBHSTSTS, temp);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 		if (temp) {
-			dev_err(&adap->dev, "SMBus is not ready: (%02x)\n", temp);
+			i2c_err(adap, "SMBus is not ready: (%02x)\n", temp);
 			return -EAGAIN;
 		}
 	}
@@ -116,28 +116,28 @@ static int sch_transaction(struct i2c_adapter *adap)
 	rc = read_poll_timeout(sch_io_rd8, temp, !(temp & 0x08), 200, 500000, true, priv, SMBHSTSTS);
 	/* If the SMBus is still busy, we give up */
 	if (rc) {
-		dev_err(&adap->dev, "SMBus Timeout!\n");
+		i2c_err(adap, "SMBus Timeout!\n");
 	} else if (temp & 0x04) {
 		rc = -EIO;
-		dev_dbg(&adap->dev, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
+		i2c_dbg(adap, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
 		/* Clock stops and target is stuck in mid-transmission */
 	} else if (temp & 0x02) {
 		rc = -EIO;
-		dev_err(&adap->dev, "Error: no response!\n");
+		i2c_err(adap, "Error: no response!\n");
 	} else if (temp & 0x01) {
-		dev_dbg(&adap->dev, "Post complete!\n");
+		i2c_dbg(adap, "Post complete!\n");
 		sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x07;
 		if (temp & 0x06) {
 			/* Completion clear failed */
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"Failed reset at end of transaction (%02x), Bus error!\n", temp);
 		}
 	} else {
 		rc = -ENXIO;
-		dev_dbg(&adap->dev, "No such address.\n");
+		i2c_dbg(adap, "No such address.\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
+	i2c_dbg(adap, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
 		sch_io_rd8(priv, SMBHSTDAT0), sch_io_rd8(priv, SMBHSTDAT1));
@@ -166,7 +166,7 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 	/* Make sure the SMBus host is not busy */
 	temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 	if (temp & 0x08) {
-		dev_dbg(&adap->dev, "SMBus busy (%02x)\n", temp);
+		i2c_dbg(adap, "SMBus busy (%02x)\n", temp);
 		return -EAGAIN;
 	}
 	temp = sch_io_rd16(priv, SMBHSTCLK);
@@ -177,11 +177,11 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 * 100 kHz. If we actually run at 25 MHz the bus will be
 		 * run ~75 kHz instead which should do no harm.
 		 */
-		dev_notice(&adap->dev, "Clock divider uninitialized. Setting defaults\n");
+		i2c_notice(adap, "Clock divider uninitialized. Setting defaults\n");
 		sch_io_wr16(priv, SMBHSTCLK, backbone_speed / (4 * 100));
 	}
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size, str_read_write(read_write));
+	i2c_dbg(adap, "access size: %d %s\n", size, str_read_write(read_write));
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		sch_io_wr8(priv, SMBHSTADD, (addr << 1) | read_write);
@@ -223,10 +223,10 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		size = SCH_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
-	dev_dbg(&adap->dev, "write size %d to 0x%04x\n", size, SMBHSTCNT);
+	i2c_dbg(adap, "write size %d to 0x%04x\n", size, SMBHSTCNT);
 
 	temp = sch_io_rd8(priv, SMBHSTCNT);
 	temp = (temp & 0xb0) | (size & 0x7);

-- 
2.47.3


