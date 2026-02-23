Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02072E98E0B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=; b=bc43Wlf1q1f8FvyJaPiTj2iV9x
	umJBdBCJD82CALnj+YiBlsYBb/UnL5EN4Mo2HKdPczXh5qmolc6viD6Pc7Cq7lM1HsXv7+WO1Rcj9
	rCtg6wIFmdIoJtMDLv0+xNs0vc5RIYVLAPGd8xI7HKPst0SQoaDDUdexp/o9As+Sv7aW6gC3BSSeM
	kL3/xVUKUejte2fLXG0jne99pjGNivDYLTC2GT9gz+EqEQio/1TQ0+59Y8A2MKi4T3zg/tsHBskop
	YvIEfJ5KgQEUaJmF8KbMbA4qCG3RVMsyYnVRMWpUSsi7flXIB2Q8r9w3OPXMFiy4Y5y0RPgquYjLL
	CrFCePrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtX-0000000HU9Y-46JR;
	Mon, 23 Feb 2026 09:06:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtV-0000000HU79-30po
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7JFj11189024
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=; b=YTPVxryj6fttLgGH
	RWiNJnaVeeo8IXYi2a3nlPBXYzOJFg0kJ4HXHffcmY6mZdjVYU2wXAdIsyyQT7tZ
	8WYSYv2AhIedEBKlTyxZkZx9AMvqxdYsCOm/bnt4EeQJAVzW04YL6yvEERQYgjje
	5sP1WZMCbioyRMX1UsmgWRwqmqh2/9alRdwP6EgHoLgWEN7mA8VGIA+Jrh6Ey8fd
	DT9P4qG6PX1QDnvA1EikNyIVJsC6mwmSukurC88Wvv70LsLT//e8TSKTXw3ft+B2
	ilwT1WABBYuJz9NErBcdW9CXPk0vvmJFxJ0UzbnW6o2nnczCoFvlYX2DhECHr4oj
	S7lMlw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyv2mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8950562d351so199758316d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837580; x=1772442380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=d61eqUIUTMavgJX+wqcrA9aknCyAVo23J2SbFxBy2P12V/ESc7HDNHs7//pz3Qn0ys
         fMJIZf9TB/Kvtd//ZxWATAK2fSet57wmInRsJIqfvdyvP55gEIIyWUT0R/r60mRaIETK
         xsV1yPXOPbuCDPabCecNy+McGbxkZZDc6AsQ9lYmNeDxJ9JJeAeeFMPB+X+CUJUQePD5
         TSeNgXaJUdhyiOlu4LeaGmUIGKlQAyUYZKs+d/vpjTWSbIka7Iv+igYGphfn2OYQdvyF
         BqG19FrnTs7MwLtVmEg9aeF0bNwrdIHwC5RIEkTaxSPI5uBjBiKZ21yA6rRZ5D01ekyN
         BESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837580; x=1772442380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=MX56Zrf5S2FKgNSJOGzTh3nIZYxrGFR7YegMlAK7aHhsE9cVJLfnuW2LaeIEyLCB6X
         nGaEdDbMxhT5kna5UF3XlZYGRYq9WdVpVEatWF6bM6IOezusCuNsfRFk7jD3kjC7hd59
         Sj28MMJfX7nxtr87ogpicOhOrZaI11dcIJ++Q2ONbZG9P3x+bpoIsAV1LCCjzPvnN+Rv
         SDTuX8Ysyzn4bekJxoESG2h1Pwbw74wB8pVi/ZIDe85S6rXJWd2onOCAXPSoJUaa0vVk
         iSrTMBeI98OvF9DWw1ePLGaSfg9t+QFCW6cEVTNollD3Ugp9hvGCA45Do1LFdJxtnRAx
         eW3w==
X-Forwarded-Encrypted: i=1; AJvYcCU4mdrgFlk0SnJhfnlcBuufhm9cHMj+PurtwSligEv0yeiqGOV5+epixgjEaL0np8a+9XjS1JEBHtvxZjRrXpAY@lists.infradead.org
X-Gm-Message-State: AOJu0YzLLnmfJ2UzW4Kkdo8sVLTkK69agVGw+0kWyNgg6LC7wRfg9hol
	Y2Qw0YDLbqQSBxiy0k8hJ7CmGfrGR39yqZdgTW28h/NJXqUtuVh7hwvudgU+NU6c7t0zhVZAZvM
	+a2lgb33jD1LPvlKgb7sr11bhT0iwHGnKOsJZqFMT7RxDaNcqeJoe2Mi3xhNY3aOLw5dMH+b6Tc
	bTTQ==
X-Gm-Gg: AZuq6aIs/+eFL29FZ5N2xRaaOTANV6reu1JipChPvrsoVuTeHu5DcToeOIDKkWlRWXi
	ukxYg9ihkDpeUylAVpgfrHjaffjKLRyW0dFIS8ZeuHOjn8RgpzRSQ5BeoC2MTOdE/sOR/dp0gm4
	BZsqY/zqrvlDnLyUUQfTR8fUjJse8UoaTxuUMn2fV4sqbm9peVNQEG+tH7jDBTxb8BErQufuaxB
	gdTYwP5rIXEKV6/kZlfzNcg6G1JV+lRJk+RCW+hCjzbAmVrNPBmSAER+KRtuiqitf8MyFp99qU8
	qUaWj+mQvM3JLVw0FhhqGsA5cseYYthIv3e4/jbrx7alnkZMT3vkvJYdVe2hXq5im5IlFXxASi2
	pCvVKxF9SyI9WWLu2yPPVPoYYP9KBwIXtq74NXVN9HL8g2o8NZKQM
X-Received: by 2002:a05:620a:25ca:b0:8cb:4de9:ead6 with SMTP id af79cd13be357-8cb8c9ce53amr927490985a.9.1771837580245;
        Mon, 23 Feb 2026 01:06:20 -0800 (PST)
X-Received: by 2002:a05:620a:25ca:b0:8cb:4de9:ead6 with SMTP id af79cd13be357-8cb8c9ce53amr927486185a.9.1771837579749;
        Mon, 23 Feb 2026 01:06:19 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:50 +0100
Subject: [PATCH v2 04/12] i2c: keba: set device parent and of_node through
 the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-4-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhz+YdThvO4PybZoN12qLIFqH/25wCqSXQIl
 /V5UhW8hg6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYcwAKCRAFnS7L/zaE
 w8dJD/0YvmWe+eKNQUwmdkOprYBJLDEghD/tlQF1HC9Xv+6macIkxtbWrcEVLcC1YJ243xE/5C+
 UIpmp60AWCZqWo+w8Sg8lYN5pAOQQcZm65CMDJpvWozdbA1EytRdrcBoInb8e5uTEavrrf29+Wf
 BVX9PajisY4sE5+0sNKu7exBqfC4HULGo41AauatIP0a+ri/I1Kd0apW/jZP8/2VNPB8v2TfyC+
 JKuYxaUJugMLl4OrdX0hqQz9FoJkmdkpvi+eFS6gitLpS4w4XgKAAt85A/zHy8yK4XW1+DfRusJ
 kAjfugD3rNjo9fL/VdbN5pIUwa0HuVuoAFa17emaUlWCoLXUjNs4FG8iimzHGSx07JZE6EKHYxr
 Sqo+fOHjBA/qRv5lJ93uO+uOpIOynNJj7UtaXzx6D1HtPbDeurHQZSQpbPDXbXjsRvfIln6LS0Q
 RmvC1uIZzDMq+Q60D2DATom3xFU5Eg3dtsF65sjpNoyjKr8LEO6s0KwDRniw76k3jrC9logTkXw
 UORxDy39plvEF6KofdTY5fmgKRZX7hIuQiEeDDI9bJ0TsF8t4Ht3KTcOIL3ZEl8otBABbO0qwRu
 aT9bzvxSM+EpZFt03OTbjKBxsEydh0rM2oV/4dJsfK1LN1m+UXvg7XcHdFmLZrABlXLvqlSi/9B
 2/ZzzTWFpvRviOQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX1ND/3Ys5a6MX
 7zCFyVdkEuqTU0HBnkHVmWWeqoJwOYoNmUsCc86b4NhZlam4IfOnQTlvS6vTLRWDgTKFYgvQ+t5
 zutNvr36K5+NXTWKi9U4sPjsSspZSRJhkKXGjzaJ5Weq+Y7PisTUvflXHsPYsn1RmRrJHND/Rkr
 63Onf707sTtd4DB8oWwZRuZNFAWBeV+elYgNUoD3opGtQ/uUA3W/Mh6P0ugXXMwG/Y/d4XP+Y3H
 XXwMUCMg4QKuBvwg69UVpO6Jiw0IGW8NZq/6NCp6kLrbp1g1dCEOq3c5F9oE+TGfrFoXrSZHUrW
 SY5cqr6BQdodGBn/HLRt63a/3VSfvqoJh33LyoN2z3+j26NzVPqaWB4ErLaeYY49guVBPf6m17Q
 XhWXjMmdzzrHEnZh/xH/mvyyOys+F2mlT4oE9XBSkbIxCLF6XpcWo6v9vz5Hz9tGtGFqMS2aTVB
 icQ3QICcHm2EFHiA/ig==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c188d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=op3mqaDViYxnCTu1ZhYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 8B-fse1K0r2Z3plMz2EjuM7a12EZ_ifb
X-Proofpoint-ORIG-GUID: 8B-fse1K0r2Z3plMz2EjuM7a12EZ_ifb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010621_774120_085785A2 
X-CRM114-Status: GOOD (  15.42  )
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

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-keba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-keba.c b/drivers/i2c/busses/i2c-keba.c
index 9420c8b342b573da435eeef5a05efde35d61434d..01aa5dd9638dac38dd92500cc8890feb8020754c 100644
--- a/drivers/i2c/busses/i2c-keba.c
+++ b/drivers/i2c/busses/i2c-keba.c
@@ -532,7 +532,7 @@ static int ki2c_probe(struct auxiliary_device *auxdev,
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_HWMON;
 	adap->algo = &ki2c_algo;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 
 	i2c_set_adapdata(adap, ki2c);
 

-- 
2.47.3


