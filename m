Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5C3E98E06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=; b=L8DZE2Xpo7Wfwg5B9WvHO9B7LK
	0wE0VvHYxENW1TzoMEgMM2md7ZqDP4eKz5EepVQv2l3k/dzVyLXzGLA5wu+xlN5YS4qPLRfec/r69
	6ePzQMco1LvRBihQDOollzrS/7iNBxt1PtxBF+kw2KNo1TjguHvUt2fmgz24ypp4SRfkVlXh3rLlK
	T5Tpv/e33k+al4QAtuO1jkpXlX/lJ6gLtTlm5UkqpkhUu7hGYDkxPec20l+oqqaTtKuxz76aTVGNA
	xzphoKanrnkyXoz0lLR1BQ6vDMAuVwQQzvt69gcOBDvH46vwl1kk14aOBHrZ9jLEW+KRj9QSxp0bF
	11eDeXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnp-0000000HScO-063J;
	Mon, 23 Feb 2026 09:00:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRne-0000000HSOl-1S64
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7BUsE670853
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=; b=K0N/woDFr29hUgCL
	j4aSDpX99bJZJUbqnsHkF54vWRZ2E3TE6N6BmrLpb6yhd9J0hJkoWckH0PsfsrY9
	wa84yN5dwdoeHPLG3JaETb+M+1cRKKNc2HAgnRNoS1aSpgbKfmFyVfJpUEDtzxeZ
	QgliwKASu4Hi3WzPKyWMAHJ1P0aLlK2oOU1K0CRdb5SLcfZ9/4SADrgHXn0oYnpB
	vighooS7fG02Yyo6y75JFnllJ1bfqvApzfIb6LYnbqn3B9RS9f0p4QR1rE5OUSgx
	xWe8J6lDTWWXzLkQsr79kCH8Ovecmu4vEgTlEQQJag//jTYLyi3ca8cWLLIFxxgE
	tDKP6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70b6a5821so3431749185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837217; x=1772442017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=YSw0flflwXDMvIitO2yctMQLbplSf1iwhLK4Rs9amEtocVU+93Mo0Lq2oVkP1g0tOS
         uAs6sSIngFjVhOQ6jYHFxGCO91uD05HN2pCJgMKjOooaKBqQ9f+8pS5XOyPFaHF6UDf3
         lrdaHB52N6N8KlUwOSXBzTppgVcSLQXzgQ9H9yeOmDFvrumLs9njql4dxhZIog2Q7+bR
         CMzFOMbvfdTwP7syBbLjWhMeiPpYtbeB3cKgpx3NBySN7yrjKK+hHrjbJXewgWqRA5iK
         bzSDtL2e7rZFU6I1GDxEnJyMJgQWi6C+8iGW63LXzEehEd3Fw+ArM3UJ7UkAGlSzdzub
         RSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837217; x=1772442017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=MOECUc9SlZ6xDE9jLl6vZBTwfx3G/GzlQGlGpp0sHFYUHsYSojID4PfWRjzPHeGAxV
         ginB4YIPoNgUwsWk7HvN5c+YF8nPPkbL4bsP40g+4Irt6j/F/IEwCJx3Wi+fxJ1U5Bzy
         cDOz1QNlly0GJUcPkQYboMYnfV37hBt178jSrEuGIhj787rXrXaXg/nNJnHBxNt+PVgp
         vvY5GijysdB2dH933/a5nRHHUgk+5093MdRQ/NR+YNqLHY48iwKPiQsHnoaGe4PA9Eii
         YFBwhlzrfcQ5fC0O1JeXmlZQz8axYAivPtKgWzlL6w938mwrszIQl1k0aO+9AiBE/1ER
         wyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLT9FCXwb7DjeQkcDn6Vn447zZReYd6Lk0PKA/K8dpCxpdvSL4YP322gjn5jKTJ/M1WXPz7PPERdpT5VwlD0UR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Ekrcw/QwpZ0OPgltxWWlZr6DUiDo6KjIcT1ceV34+Jbvqrdp
	mYTSqd0JSQG9JWpf6ka96Z4p/mmEvevNTWKeHe73PuNH6WtpZNSoyuszp6t4XPlSvl1I4vuvjXD
	1nM7Ed0okQ73omNViXwUUKHVpOJWvjatN4f7Yo0aPVSqsAp7GvFH9oSTJMHyZe7F7x3auu6idjA
	NKyQ==
X-Gm-Gg: AZuq6aLKWjmPj58vBc7fXAcFjy8sAYrNHhrRofROw2jmFE2M70ICXkYAb3gx5gh58zB
	t4RHDH6Yxr4+13SO+B33/5PoFJuKvtYnasEQkA2kgtelsroyjH4WEQFYDAQTjPERdyLBnfalyOC
	O59T1w+bxif+iuZdp6pxoXoHiiKSC+fnnjuYBs2ud5/HTyKfRYnDASEL95eZSkfTeRJ2RaD78pE
	3ta8WvYKKwkRP5DTalJ8bRSy3QZP7QgAmo3aM4+yw0rCdpyrSfajAxIadEMk/YZStqyqXwkXNi9
	wd5mUIPWaArmHZAydxMfb5yEXpwCXJbGoeeVu9M+7IX9653ImmLFsiyK7hHT4Qbr3+OIellwLTt
	t2+3QTM0Y21EO6soyNTGRqXyq5WGbOYLkQZEXqfHFcNO+OZd5OS8h
X-Received: by 2002:a05:620a:1a18:b0:8cb:7ad5:6c09 with SMTP id af79cd13be357-8cb8ca0db51mr951742385a.24.1771837215956;
        Mon, 23 Feb 2026 01:00:15 -0800 (PST)
X-Received: by 2002:a05:620a:1a18:b0:8cb:7ad5:6c09 with SMTP id af79cd13be357-8cb8ca0db51mr951731085a.24.1771837214830;
        Mon, 23 Feb 2026 01:00:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:38 +0100
Subject: [PATCH v2 09/13] i2c: powermac: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-9-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DjhS85KLuUmnMirWSsbDnV889wlZnMXf3iYZWcjz17w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcFq5rr7pZsKaH0vo50s68t3HBi/s2UeO3pf
 cyse87kAE2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBQAKCRAFnS7L/zaE
 wwvQD/9KQpGaSOnhf7D5wLXAJtnQ/I9Vwv8R/l5Y+cN3CDNCgFgfSuV8c71GsQwvh5rVVtCYtuI
 O0v0A2OBZs0blNA1qvLFtl+B/sCtCoAuWmbmTse+WATvyGDO0kn/cabe2lihk+xZ/oUzJf1LU6v
 JdAjq4Epdp+fHbNELIyQ1jBt9UPC5J2fmIbgHqZcX8lOZvx4Y524oMJ4NcXEkTLAShJtZiFMTC+
 4Lxl0MTG4YjeeoyByjGFZuskzAy7Uuq3TIGwCkFINVGezKvdEVYcWoAwtEPKM1cire1U/HOJ03U
 M3wZxH9U2KmoVtcm1eJvyPAKp83Y3EzpgGVgIdW0fsOV4brc8ppWTQ8PcTTQNEtA9kcyvYWREAx
 9/TFULQeBL+tzYS38s2fciWkKtrXyaTKtHJ1x9uOazhuzE54jUFHZnF/EyZTNqqEyhsDib2K1p+
 UGFV7sUXMI3+ZxPU/l+iURu0zhIxQCSPGzb6L93EZZ+j1SUDTQS0u04wVUcKHejW0rnUPsRMp0i
 aDU2wl8yMkmu/EerybVNislobBDsx4vSVOtRgMxwY7iJU49TA4qZ3vaBAxo8gKOHtrky2CP39AV
 nk3WeuefJSAZPiKC/jAbYqThvGTXNtLxu/a2PkSu0s5P5PwgDE/+RvFp0LiA4L23pNvBnmMhRlq
 V+y4rtaVTGtj7Ng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c1721 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=xF5Bwn5Do6ynS7Zu1PoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX/htintKrPLCF
 2TTsRHuq2+QpMuxFRJD49uIuN44+iy5P+tDAwu64buXIWGZBIHCy2TkGSXWY60zQYUmMhpDJ3fz
 5Q3Fa6nxG1nPSdd4Pdi5U/r/ARiq8Mgfg66T77+LOlnAICrHpbHNpzfpwDkKlK6i338ItjOnu4v
 bCsdNdafSxqt0MEvPT3mmCrMcg2xItYvZkumMqs0CHYuV+kSGs1Zq9M/dK3wDfDm8Uzoo4pzoVe
 f7FV8LdvF+CCN/KKDOJ1jLbz/eamDHG3mEGyxBd3PiE8VlANz7cd6gPz9iCe7JyTZtV7K074/E5
 TG4w9AbVydqF1rKqgSCiKQ85a4YOFbB2WaAxlGTlORFs1iqbKNHuVxYq03agrlhDMBu7sZDqHdM
 IKmZGBVzaJtNnw5/SjFRbk2WZ7V/lhM8McQRkahaxJbN8AK+erXoCI73AxIhsjOOjGtKOSdqzDt
 fmIAO/q/sfZWHPLNsLQ==
X-Proofpoint-ORIG-GUID: cYZpJKn4ujArxohjS3QM2uhRgwGJ7iXK
X-Proofpoint-GUID: cYZpJKn4ujArxohjS3QM2uhRgwGJ7iXK
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
X-CRM114-CacheID: sfid-20260223_010018_434852_30606B43 
X-CRM114-Status: GOOD (  16.01  )
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
 drivers/i2c/busses/i2c-powermac.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index f99a2cc721a81dc328bc03ea88ff959cafe0f05a..fb5482655d6c5c617392e9ccd745433d5d828335 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -92,13 +92,13 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 
 	rc = pmac_i2c_setmode(bus, mode);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			mode, rc);
 		goto bail;
 	}
@@ -106,11 +106,11 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 	rc = pmac_i2c_xfer(bus, addrdir, subsize, subaddr, buf, len);
 	if (rc) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		else
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		goto bail;
@@ -145,23 +145,23 @@ static int i2c_powermac_xfer(struct i2c_adapter *adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 	rc = pmac_i2c_setmode(bus, pmac_i2c_mode_std);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			pmac_i2c_mode_std, rc);
 		goto bail;
 	}
 	rc = pmac_i2c_xfer(bus, addrdir, 0, 0, msgs->buf, msgs->len);
 	if (rc < 0) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_dbg(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 		else
-			dev_err(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_err(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 	}
@@ -219,7 +219,7 @@ static u32 i2c_powermac_get_addr(struct i2c_adapter *adap,
 	else if (of_node_name_eq(node, "deq"))
 		return 0x34;
 
-	dev_warn(&adap->dev, "No i2c address for %pOF\n", node);
+	i2c_warn(adap, "No i2c address for %pOF\n", node);
 
 	return 0xffffffff;
 }
@@ -235,7 +235,7 @@ static void i2c_powermac_create_one(struct i2c_adapter *adap,
 	info.addr = addr;
 	newdev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(newdev))
-		dev_err(&adap->dev,
+		i2c_err(adap,
 			"i2c-powermac: Failure to register missing %s\n",
 			type);
 }
@@ -299,7 +299,7 @@ static bool i2c_powermac_get_type(struct i2c_adapter *adap,
 		}
 	}
 
-	dev_err(&adap->dev, "i2c-powermac: modalias failure on %pOF\n", node);
+	i2c_err(adap, "i2c-powermac: modalias failure on %pOF\n", node);
 	return false;
 }
 
@@ -331,7 +331,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 		if (!pmac_i2c_match_adapter(node, adap))
 			continue;
 
-		dev_dbg(&adap->dev, "i2c-powermac: register %pOF\n", node);
+		i2c_dbg(adap, "i2c-powermac: register %pOF\n", node);
 
 		/*
 		 * Keep track of some device existence to handle
@@ -353,7 +353,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 
 		newdev = i2c_new_client_device(adap, &info);
 		if (IS_ERR(newdev)) {
-			dev_err(&adap->dev, "i2c-powermac: Failure to register"
+			i2c_err(adap, "i2c-powermac: Failure to register"
 				" %pOF\n", node);
 			of_node_put(node);
 			/* We do not dispose of the interrupt mapping on

-- 
2.47.3


