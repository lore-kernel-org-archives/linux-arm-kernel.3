Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7841BE6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=; b=tdZYLSdaTEf6a7Xdk/cyDxPSyw
	aTeEQiG1Ir15TV4FdGdhD5iczN9z33nupdWQLszwlOB/IcFp3hB4F+DXmAxrLDo/1VJBozlMQE77r
	j5WNXioTsOczwKl1rx5mW3vrL4r+rA/dEa8KgaMSCuCM+itYprknCTgTIBYOAg4wIPIxSZpOdyTVA
	iP5atjD1Q861/b+vQ2A9DyBQegWaslou/SMcaTOriLj7ULvmkOYaNeqvEX1zwv7svPGWW914e/APf
	s6elyivDjpSsYR3n6nw2k6cL0s87T8/wb/y0vkv7cW22vgTYREOXrM4d0pI0Yjpe8p7zMj/mh74ul
	6VklOrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEI-0000000EoUj-1eeM;
	Tue, 23 Dec 2025 10:02:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEE-0000000EoPi-329C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:02:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2eorC2199451
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=; b=kOWraz2TOCazDGf/
	xFaXszmIsPaHsVx1Y+SMk56kvHxWl6Qswq2UjwUwluKU3ZkPCG62E9lpmTNLi3La
	zkIIRrtamDCJyo3PsxPo8BKCV1Sjsw349P64AqU6rxeKvYsP7w3fT11QqEqVxg3r
	xYjd0kq77VhUBsTiiBT5D1KCkQvRQAg92A+Qcl5Xd/O0eFo4yRZyivy6QJqVeyiM
	jPwpntIMRWc26KtwrHcIVgwSdXpEZP9w1XV38ycO0t7cWYZ3nqgnJ7ynd0Z8Fi+8
	bgj4FxrIz26xWlDvCI8QlRK7Lm7lYQBjXANqdf9J70E/UUe3jArLPMO/kdnpOIbk
	J3ygjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwurfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2dbd36752so1077688785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484173; x=1767088973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=S6caUoxI1vdfMQUThS7Yok6Oh2LvIVys0XvAjAi8sy9JOQDK3JKP5oygDusyVq5NLc
         PJfSnVM3EFzy0RL8PnENtOxF74I3ASJkrB84EhwQzLmXQCYGDZjJBVswcVsRza1DOi5v
         BH9ZPYKwmDi8jCW5p/8n0Zg8Ho2HoDo9hPaafXs93Jdd7Trhjtn0CSIEuLUfnNABNZgi
         vpffp6xW5KPqu3LX4CoPUZxwR9fXBmMY22zOerUjcHQ6hJdcP0deyJMYdKS2r5fLRREy
         abSnl4eC5nD3LP04Ilx8oFfH8IDffPc/0cjN7ND9IebgJ6OkyjLjUT1Q5DZVCYmHPo22
         zVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484173; x=1767088973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=vyRDxjPB5vFtP5a4XRszTeRDfqrD6tDlOtO8Wfl/pZ67rhpFdfl1BKxq8mjgxbSKCY
         Gj/wYkN77eZ6WA7gIBI235hbF1GccibJf1QAUuZeJUWpiRXsGsWEPjZe1y+cf7NPOwa4
         NT5hIpsVxh+W5w+cwmk3JE4t+7HhcBX8IhDXfgfT5WawOa6gpkVtOqDqKI6kafp65TWc
         9E1OvihIDIb4ULSX7pvW7D5K24aah98Lf55ZdG2pdASvIONwA0tDYOyDBgOqHZ7XsCuX
         Tb40m7aDZaMZUxk9LRX3lxad/JQLMK5Yi80ZGu9OCbkLH9Qk2EkxekeHiEayX/KRZfXc
         DgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXENIyxV2opFzXx4BuOQU17x6tV8IJj6JzFAATRl3Rf9+5hbpyhnC2m2e4uMYDMWlSolYC41/v8S0i51TS8YN3V@lists.infradead.org
X-Gm-Message-State: AOJu0YwoDszMqQFPhTU5cbHmWAyqegZzTSOMxB1G6+ARr6JtTZC7g+ms
	0SLLy55+lnXzBz3oelaAbb5zBGKJSUqouhk+vR0tDJo/RyxL1WAVVKDMwDF8Yn8BLzmc44ypzNu
	DS73QxDlH2f2VSK3rlMAaIQcZ9ZmgVC10LJ+PFKL82drN8TxohPPf0YBrRrOT9WweP/xwokubjB
	qnMA==
X-Gm-Gg: AY/fxX7OeAj/93uIjEDsd0i/3IrPTEl0h3nflMC7qiU0irpCQ8eahqFvLWZEH/gC2po
	6Opg8NwAq1mMZnu/kUNCZ4pJaRlN9pCgPXYBcFjxjmPiK7VqMQsgVdk88o3/uOmZM+SHdcQMgVD
	Dor72tnUsXjzQHKmdCInOVNdK7H4D6h7OpkFRqwCE/ex34o3BwL0d+ngO2E35NdFlXraLVAs+Gm
	vQVcGu+4byzPqROpsAtZB7e5/qgY4v5TNoxwJSA9tFGKMOUmj5HJyghhVUu2kNH2TMnvKZmoVMv
	awEl1lP9eQfZsiAEf/FrsRs1mEqvdY3o3XRGjCiHn4hWvUlT/+1SZMVuqzcfsCBAlOVHfcXHSwo
	3uKCFvwV8BS5espdwRgJPemn1yquxzWSKGnqaHg==
X-Received: by 2002:a05:622a:1494:b0:4ee:1b37:c9da with SMTP id d75a77b69052e-4f4abcd08e2mr168063131cf.17.1766484173089;
        Tue, 23 Dec 2025 02:02:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxU8ImwOEdXoIYf1MsM9TeSN65+Y/YYSiNRkoIkd0saptyh7UpmC8vEXV7Zyr4GO6jy06A4A==
X-Received: by 2002:a05:622a:1494:b0:4ee:1b37:c9da with SMTP id d75a77b69052e-4f4abcd08e2mr168062531cf.17.1766484172477;
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:27 +0100
Subject: [PATCH 05/12] i2c: ali1535: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-5-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
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
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi8rAtrAU9cEajonJovu2JYczyiZGMkrWxDS
 Y5Jzyib7tSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovAAKCRAFnS7L/zaE
 wy17D/972dKE+ZfFzABiKYPVHpMHlDBeQ56KuVbzVhhUQvh0TJ2053lqVMHamKoPDvLT0rdTX4A
 99HxmF7uBeJtK+kbQ01Bdhmq9xHApLT+E29E37/AD2kEmDiqgh2pTnK/6jzrt33YZCho8x2JdmP
 FOTUzTACynBfyD/meIOwFNVUlG4WKdCV5XZDwe/EafvWX4xsEE1/NnLEWfwTVWIH0t7neEk1i7h
 zs7wBNgyOwLuRvCFDyHbW8Eq9uo32AHlKqIsh+FuKGKIhA4zqXstnLmuLRentmZEf/EiuAGr9Af
 ps9zEjpcLXnUWlm6GfINfIZvZBDiIMnd8wl1uhXmlEgM4t3FUJ7fwY7nQaskSu9FlHvdC8KMWBR
 ogcRWdUUbIXrCWw55dPDVkZoV1xrZIrrTHq/HzN1/8GZBOZ58mEZsDyGAM++a0RPSToPBNNfZQh
 Ols9ASW/RvRWlQMGgD0AI2ZrcFIgp2di6iLIqqxyhoHMo/1/ZdutGyPOVAjBXsU1qF3WEWcBSy6
 0NQm5+X2Dw/RlYAbc5CP+CuusHtIuMcUfaAIN9rNbvvB0FoFqg+0++Dh7dKod4k441yvjxX8+aN
 iNjR0KQX6Z7yQJY0evDEofPKrBoN3VRupLBzlwys3dtpohLH1tkLvUxD4YuV7pXe2m9kX4AIPof
 LVWSd4OC++9HVcA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a68cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qeKQattCTu4iihMYEEIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX0xZkBEz25QwN
 vZsnLB5/K4mn9F3HaFC7ztjGDiYLU13v18Eti7bJ6aG6lNjsI4j30QtJo/qXl54raDtOdtIB4j3
 CQDHO04cNcxSoS0QDc9RrSRUdTj5LnD2w4EVtSrbOOROetqWRsyWT7WLna6OMfSXX+XyynuM1W3
 RxSmurY32TqxQIaWlHJVhlCM7VV5bNrRRyo0nMxTLLzLtaw/p3pm0i3CUSXDPEh3S5oFpPcdxfL
 +JTp6Pk+UlgUw0pTheQ1IaIiqkV8ZhVBwz8LhWG9tI6DpPug/FkgmWG0nL8yWcIEHTie6auSgmw
 Y46NbSPwvvE+IAuVzlNrxJKRMjHOBUBFrfqxNCMFegPeIV0+oFVfedCfs24QRJEfbTTAeICe4dp
 GtM31VhY6gxHolsCgwmdaRrcmfbBNlkxhrTMjBn95JS1iDYN5CxFGhEC49PjBp2ov1Xth517des
 9JszgVh86jBGypBlWMQ==
X-Proofpoint-GUID: Kz58PCbVJBZ0QFvAV7Sn0CsdhWY3qBtT
X-Proofpoint-ORIG-GUID: Kz58PCbVJBZ0QFvAV7Sn0CsdhWY3qBtT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020254_924442_17D70C51 
X-CRM114-Status: GOOD (  18.96  )
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
 drivers/i2c/busses/i2c-ali1535.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index 1eac358380405838d15551e353605cab0a7e5e65..bf0f36450c5930f86b122618d17eecf1782dd776 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -215,7 +215,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -245,7 +245,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 		 * BUSY bit may come back on when you try and use the chip
 		 * again.  If that's the case you are stuck.
 		 */
-		dev_info(&adap->dev,
+		i2c_info(adap,
 			"Resetting entire SMB Bus to clear busy condition (%02x)\n",
 			temp);
 		outb_p(ALI1535_T_OUT, SMBHSTTYP);
@@ -262,7 +262,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 			 * power reset as one of the bits now appears to be
 			 * stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"SMBus reset failed! (0x%02x) - controller or "
 				"device on bus is probably hung\n", temp);
 			return -EBUSY;
@@ -290,7 +290,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI1535_STS_FAIL) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/* Unfortunately the ALI SMB controller maps "no response" and "bus
@@ -299,7 +299,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	 */
 	if (temp & ALI1535_STS_BUSERR) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -307,14 +307,14 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI1535_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
 
 	/* check to see if the "command complete" indication is set */
 	if (!(temp & ALI1535_STS_DONE))
 		result = -ETIMEDOUT;
 
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -352,7 +352,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT)
-		dev_warn(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_warn(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 
 	/* clear status register (clear-on-write) */
 	outb_p(0xFF, SMBHSTSTS);
@@ -416,7 +416,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		}
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		result = -EOPNOTSUPP;
 		goto EXIT;
 	}
@@ -449,7 +449,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		outb_p(inb_p(SMBHSTTYP) | ALI1535_BLOCK_CLR, SMBHSTTYP);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3


