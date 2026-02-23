Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74EFE98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bi9pJMMcFRf/NBCA4ID44huyo8rl64qSPRxoYMM2oCo=; b=jUlOJkbCWqN9QMx7RpiJbZsH0t
	SQJmRkLfRm0bpAejqXkBbl6tuywYDdKYlvWu0cmc+DgfkJCHv+EyK5xNBDxIF1XcNDBIBelY7zVau
	vTAEnrxnziuJ8QNGh/elCAPX6n1AqRV3eg1t67LGUKC41nHgc0LoF1CfIHyG/nuS/mMN5PDQK0cHj
	65xjJdnT+GPqVaylTQJMSJbsWhu0gAYou5bhfNqGZz5c9Qgpmd8N/FujJjDSZT5FKm7mC6YpNnOHc
	iMnE/M6lJfgBo1h1U2/YKI4HYDluZqGPMZjmpEzPtU02lNiDzWYCke5Sk+HhQjKT4wPaEqEpLmjcA
	UJZutR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRns-0000000HSh5-0VfV;
	Mon, 23 Feb 2026 09:00:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRni-0000000HSUp-2TAP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7evjg1745021
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bi9pJMMcFRf/NBCA4ID44huyo8rl64qSPRxoYMM2oCo=; b=B8P4JGSIDrvN+8Jf
	xosfPkLtE7i66HGsksi8i3rb4IoYal8nCD07AV0JIUJ7UYFilU4fnKJdTZ/XXvgP
	Yt0kpGJOD3DjC0Jc5lQlS5EmifiL3MyyyroOKqUpDnxFp0IYqGCDDKVgRSsTILjB
	OINQ8MueFNEm5d+ebfaRWcG/ML2/xqE3I+Jaz3xHOeb3t/K3+DZfMOSPNTKP7vXT
	isDhdmjEKXg2LTvFYEFAIhCHVh/g+WLIg4FkzctEU+ZVZiJdEj+kfB0VBs6DLlhi
	QJQ7d0bBSzmogpol2zT02hM9JUuq1HNs9Az1Ztud+z+7oqompZmB2PwOAG1eOlCh
	6cbQ4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv2m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3ef536ddso5083548285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837221; x=1772442021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi9pJMMcFRf/NBCA4ID44huyo8rl64qSPRxoYMM2oCo=;
        b=H5mQofT/zuKSi4DobnJ92dhexSrvCZFN8cy6VvMqQ+reV+csQ0gOcPJ+mi5m92bPk1
         mxJ0hmH/ZDwfI93X+ptBUBtxo0yLk5/n6oyXMQRtV9+tCag02tzhXNWsjuIcEJB0wL/M
         3BXetdIb51SVV4onq3Ed8mTXAaj5hisUwiXdmqk0uTQTYAIBkxTJ0q2nXrlZqG3dlLdd
         7hXR1RzuCpnnrJqP2uwvMDW9RScQLNVHPn1U6h3ZEv90Le8vgRIFCH1dIhomr0Hr7BE+
         Ih3osR3dWqK6WmPswq6ptejJfswYe2Kk8zErQPI4uk6jg+Mz88UyaPi7E51Nf9nHeGGI
         Lx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837221; x=1772442021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bi9pJMMcFRf/NBCA4ID44huyo8rl64qSPRxoYMM2oCo=;
        b=FODLIadOJozgu+Zc+F2Q1YPhh41UMh+xa865XOv6hPssx0SEF1ViOFf4mkXAH7gC4i
         hRuegDbexjyq3Cx+IWHaOTm5QoJ0cvQH5QTb+UFn3M9qo8B0BPMp5+FUyKqPkQOqcCoD
         7GbG6dfGcMAW8fSqgD3khme9Bwvsc1Uliblp4Kt8oK46i5rWL8ML/UqCIOU5ij+zCCUT
         CCK+x1HWjNYd41C3CsqmPw3ZCc7CnVGy0PUz3yUqPvCkOprOkZqzCw1p+Y0tim0M8gGZ
         Aray7/utx0LfG98KZ4tV8rjB8q8Hv7jGz13GRW4G2Rs15MvQN8xUOJpF2o5OTDt6k+qu
         1s3Q==
X-Forwarded-Encrypted: i=1; AJvYcCULFrOlAMqN9K9RZoRa1VMvKc8uN4yHDFZblSX3Cn/diIxbHZq1uWuhBF0F0j3mcNdvNaWbIrVUbsSrFq/M8gCm@lists.infradead.org
X-Gm-Message-State: AOJu0YwyA1sPhuN5nAR34glzkyjpX+VRAPiU6xwTnP1KH/+aB8+3fxwD
	pcERkdOfw3HNMzlhyGerN111eO/aHLfKlX/4/SYWijRGM7crPlX7/E9j8TxuZPRI2G/38E0GV7T
	Rdelw1rd7xwAAcXf3L5HBG3w3GebFUIvfXzlTFdmsiGlWISr1RKg655B52ldiS89xBM+ZASqMq3
	32tA4J1Wmk1g==
X-Gm-Gg: AZuq6aI0PnhkMOsbsL3QtUBZfB43Ab01l44pTm/3332UrGWXX4eRWpxgjgiDdTxekO8
	tZXBzvAx9HH7Jw5omFwRpFsXSPfWJQA4z1+4BVOWzuQecIi7CqDklU90mQpqv8eK8SvIdvT1QhZ
	HWnis2ruWuHl7uYpSceSy0Cl/mc1dtkIrl3D+Quhq+fTQhueu0UuGcpVdc9J1m4fM4DccTFYmXx
	NlNCmN8LtxbX3Hf0T3hrOV/DfRo/NyXYh+/85bewvBZg3j9cjPBB+QiGNwvdyHuLPkxwWZ7E66z
	U9TVXWpKDj1OLb1iiCIwn2LuFzTMJQMP8TvXwt7DsDnkdjDFXVRwZfZfPeZk+7pDll9fEwAnZIW
	FM0f+uPFX54BeG/TZKf6KM1PG7IHDebwp/Ai6hvOiaUTHzCgwuISx
X-Received: by 2002:a05:620a:19a5:b0:8c7:17f3:e98b with SMTP id af79cd13be357-8cb8c9cbfd9mr853276385a.15.1771837220591;
        Mon, 23 Feb 2026 01:00:20 -0800 (PST)
X-Received: by 2002:a05:620a:19a5:b0:8c7:17f3:e98b with SMTP id af79cd13be357-8cb8c9cbfd9mr853249385a.15.1771837218557;
        Mon, 23 Feb 2026 01:00:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:40 +0100
Subject: [PATCH v2 11/13] i2c: nforce2: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-11-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JlJZdIjQAEdOPapDxkG0d9x6lJ7pOOWi8wm3ojrJ0As=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcGnrmRWnN9R49qmQ75B8odbY5Rxd6lE9PAH
 XFL9QpoS0aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBgAKCRAFnS7L/zaE
 wwFtD/9FJmnPrfZtvTNhoH2BGjowqofWNEMiGJ3SSV3vlnqu/q2ovI+NYYSRdIULepLZoRsQxXE
 dYz/t4W3uSTPGMl2Q0VE9oxrPjoDiZdXLZLpisL0TqW1vlOdxuQz00/LXAR4vuC3n4YKAbvvFq2
 /ntNiOJXkZdUhYZsG64K8LoiFOCQSPdjNXCdv09FLCYyup0lxByxltsokWwKsknPY2x1CpUBtNW
 32HN0YKAtXVelAJ2hsDfbDuj5hz1OjOmV0KhV4Ak2jDGogejpUXI7c6hdH4dEqEhIqkuvW4ME8Z
 ZjyUdhdqMKExq9WCyw4NwOJiIxRaJ1Oq9Enf9lkeb2KCh7FwSc3LRcbtfpeIM/c84DWaeCZR8Mm
 oC+mBUGCUE5rvE4tns+2odmLcCcbNscGLHoo58Vi1XxsuSk87nDVohD8VIDy82aXWF3Q5wKFZyM
 KKxXUyjmF3qFSMTwsLCtfcl7vwd/zaSH9BtmzO2dI05Uoz9igDSE2HinYcKfhLeKCDzNtUhWByw
 ZIStk3TbmoyPoX9qMs9WWAQd5ZvxMdFo4QZsHfu+gNUk3DConvZqTV5Dq8qhxPwjmRTSvytFziV
 3bkagq02Zl5WGTJF8d4ftS1nmlSMYLgPaJu8r4j/uJdJVhzdpZg9sXLW8Nmt36NOlHeA/FFrMyq
 OxDgMK/k1/05RRg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX9AQ2QYcSSF5e
 LjqA5s5p3djwnUbPy5dGKmbxpIo/6i55+PmZS7IU+RSasNmh/L4+Px64/X/3q0ht4d5j641pGnm
 jXz/wk0yLnvXEVUq4375rH3ADVvFqkqtMO46bZgLSj0EraUQCe4TTt9KVaEBsOsQpnAkEICqhpe
 ZTWnT4Zxk1wd7tsoJaabKYhusjp/UBRHXsVtSse5arOa7DYrtcZ25RFk+x6S+9RiTy+jsgGjkBa
 qfemxcbIUFSMkqZZdxT/4MwgpYksCiLVetWlqf5/COOJCsTmmTA+HK9X5ju4/3BJMZ0wcSMg+0x
 BgHzvMEOlMWJY0YBDqiySFe5vexpaXY1BwKXz9rrEkoOCkseobCO+qTjeJocMWHmLNa2pOpD9Aw
 +Jg/M4OukWaJ8VW7qd7pMOJn+HfYqfmEmGljyQwhyuep3eDrISBMgzVrT12obl7Gpw7tnn9vNlz
 QyMxEJ1jI9oxbvZxVgQ==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c1725 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ULAvDvZivfA9C-ZB8fsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: OUhl6N3hNMucJxYyhM18AvGLC4-XnIcz
X-Proofpoint-ORIG-GUID: OUhl6N3hNMucJxYyhM18AvGLC4-XnIcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010022_656068_03A62978 
X-CRM114-Status: GOOD (  15.40  )
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
 drivers/i2c/busses/i2c-nforce2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index 7064fab81eacd416756906cc2ff0567ac44a3465..0cc2cfe8f3c788d84374d40ae8b43cabc467fdd4 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -123,7 +123,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	int timeout = 0;
 	unsigned char temp;
 
-	dev_dbg(&adap->dev, "Aborting current transaction\n");
+	i2c_dbg(adap, "Aborting current transaction\n");
 
 	outb_p(NVIDIA_SMB_CTRL_ABORT, NVIDIA_SMB_CTRL);
 	do {
@@ -132,7 +132,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	} while (!(temp & NVIDIA_SMB_STATUS_ABRT_STS) &&
 			(timeout++ < MAX_TIMEOUT));
 	if (!(temp & NVIDIA_SMB_STATUS_ABRT_STS))
-		dev_err(&adap->dev, "Can't reset the smbus\n");
+		i2c_err(adap, "Can't reset the smbus\n");
 	outb_p(NVIDIA_SMB_STATUS_ABRT_STS, NVIDIA_SMB_STATUS_ABRT);
 }
 
@@ -148,13 +148,13 @@ static int nforce2_check_status(struct i2c_adapter *adap)
 	} while ((!temp) && (timeout++ < MAX_TIMEOUT));
 
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "SMBus Timeout!\n");
+		i2c_dbg(adap, "SMBus Timeout!\n");
 		if (smbus->can_abort)
 			nforce2_abort(adap);
 		return -ETIMEDOUT;
 	}
 	if (!(temp & NVIDIA_SMB_STS_DONE) || (temp & NVIDIA_SMB_STS_STATUS)) {
-		dev_dbg(&adap->dev, "Transaction failed (0x%02x)!\n", temp);
+		i2c_dbg(adap, "Transaction failed (0x%02x)!\n", temp);
 		return -EIO;
 	}
 	return 0;
@@ -207,7 +207,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		if (read_write == I2C_SMBUS_WRITE) {
 			len = data->block[0];
 			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-				dev_err(&adap->dev,
+				i2c_err(adap,
 					"Transaction failed (requested block size: %d)\n",
 					len);
 				return -EINVAL;
@@ -221,7 +221,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		break;
 
 	default:
-		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_err(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -249,7 +249,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 	case I2C_SMBUS_BLOCK_DATA:
 		len = inb_p(NVIDIA_SMB_BCNT);
 		if ((len <= 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"Transaction failed (received block size: 0x%02x)\n",
 				len);
 			return -EPROTO;

-- 
2.47.3


