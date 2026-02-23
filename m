Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90BDE98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=; b=GbGsWWat7F0Rl5lPjacG1WqGWn
	zGqSrNZ3KsBNjc7Cf599RJC1dIgLPrqm0UI2SxvKyS1+LPohOaQzDv+rUwKVwJBrBEvsay1qosjuj
	onhYzIRdMHn1mkuPJ8RYqiN/OG2YVl2hI3fvQV2K5twMTb4U6mX1A7MMkGCY5nXD06Dvi+fkyrGMk
	/ZKvvfvvfmhVp8+s6PCT1AbdDsM4XkFIuDRVL9YVINv50H4PIzC82zKoyXrv9EAZ/pScVKQAVEfH4
	En4i815VJU3bYweFDSlyLnZJRjKys3C9qRgFOR/Ku3PfycJm8pqlnboFS0oTTkkdUf4yaHPqfoaEn
	jpGmW7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnn-0000000HSas-2ZgG;
	Mon, 23 Feb 2026 09:00:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnb-0000000HSLD-3Cyo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7WD3a721346
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=; b=Z31W/9nulwQAAZ/y
	ktZPP6LohTfU9u3yekdeRN9Zhw5JTPXndKPMIWP4ZTZPl39CRSKkGmQ24K6wTtVE
	ddvpg8edrCTXMlWpfnSHiRYHxO8cJ9IFoFSsWag9NuJrYQMXuG0MlJ8RXGpLm8j+
	GUGOuqN6cjO8Ly3R2/04h02h+COPxjNLHOM9PZVtKVX1f3Tdh/+7Vr3xra20Wsqn
	eHPAD6B+4p+gFjVPJKeeOp3BxuNhrl5v1qkvfHOMmTtW8iqoyXAEbWpfgxOaNerx
	bxOlU9NumkOl4E7q6mxJvQugmdeQQ7j4YQDpSaLABHgagXr6gLBpSD0kCzxRHHL5
	EE1fiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbc1ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so6373836985a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837214; x=1772442014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=iF/dFclxdUYbIPQgYyeEUBhOLHvlbG4dA16BY/NsNO+Odv4+UUfd4RzcKtDiSlBOIv
         KCnGNYJ/S1/+HVCDyoumF8NWw/b+cUGe82c4IbLp9Udj3xtpAner8foM31EIz+qog+Qr
         uKpYqmsk5sHutIWZD/rPw+ANqYkcJ+AHnYMwGY+iaZzAyLQKeQVguYiMkDdIvnZU78+3
         4SywBrdZ2BSpKOjolfkv/tx2g2I0/Te/XF5JCKkEUYUAD3WsMsYd61dlBiFYLDJ3t+bv
         q/zqdpKrWKaswbKrhRK/uTPtxpsfWTtz//6MxaZBXkO6ibaztWxnj3Dpk1wjZb6Z+R4f
         HHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837214; x=1772442014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=unH67Tt9Bt2P8WWvJC9BXXx9QE9uEgoSZ92sqTxKHEwajeS+TnxfoDMHLbJqoyzFqs
         rKpv1iKSQarX9Ys+VZtUGndNP8P9q7Qv8v4rXYE99mAb26ck1l2wd6Uxpqj0P6Oee/CK
         XU+l0vFwDPRdS0UpMDqr3eQcB6TU5+uSDRhpHxnxNZAiOK0KP2P0IHETcv1WjAtmkbrF
         1AdoLbqBcD8n3Y413Pn9Dx3utkNN2CCT6Lv3Dk0WSq04kmiW8gP6hxcp1BLK7wwB5RXE
         D4ebwmFM36Yo1TjDO/jbGwZjr3C/ubZUm8r4zvs5yMAYL6MuaYOmExNZVgUyCr9MCaVh
         YAUg==
X-Forwarded-Encrypted: i=1; AJvYcCV1z6V9YqWKKEeHgZoSXJbT69eQJqa18V0uie/kC0MtCQRV0Ll9rVrasTnh3TeAAzmb9rGxgZztWmCBCxB8OTtu@lists.infradead.org
X-Gm-Message-State: AOJu0YxmpoNeqzFqOrG1rLf2KyJgc/XvO8WiBHIGwRcu5DA1yK8s7Hm6
	Pe6I7iaEf4TR94ZUAs5UDMUsADaNycO9i81FG0/KqXhrloLXkuLlRn5i55z1/mH8X5dMO1O3xhL
	s0CpgC0nbRNK/HMH6JGJ8bp71NJhKh/4LDqeyEAZ/h7JOlmbE0plwfniamVoCXaw9HpIArKmShY
	iEUg==
X-Gm-Gg: AZuq6aL9jntT66x2urkeoaA23doXVdwtpEaGNG+/mpds57HlJRqCobwAUpW7TknhrML
	13QQuOdY2VsZiPdDpJ+eISDFwyDA/peSgtzsyBqba742IumdFjQvSHIBe8eSbppeEINBKWtQ4RX
	v1NHvH+FlXVBuTOtOArF9WRNoAArg7gXiLJslIt6AR5L3B1M0afeGDOuC1zR8VpINJ3SbsgywhQ
	SfGwgYrH4I8dgqo71V6aroUTmF4KRPEmpKBjn3QlZCEcEeYtyHV6zie7RASwVdHdvKuj8+er4tt
	qyMh4hs1NWbykjF5jrFPzKx/kPIWdZje15rtXV5P3hqyTaMEeHsm7KcYZ6MZrIkbACptlf/gAMp
	tuf/Oh95s1qna309jey17vuQjZiUjkUU4gyaVKz7wgmgqH2Vx3i09
X-Received: by 2002:a05:620a:25cf:b0:89e:67a9:fcf1 with SMTP id af79cd13be357-8cb8ca6e5dfmr893386485a.52.1771837213251;
        Mon, 23 Feb 2026 01:00:13 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:89e:67a9:fcf1 with SMTP id af79cd13be357-8cb8ca6e5dfmr893381785a.52.1771837212768;
        Mon, 23 Feb 2026 01:00:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:37 +0100
Subject: [PATCH v2 08/13] i2c: ali15x3: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-8-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4026;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z5y+uDYDLt8QrBK74QcxPQFJYMWolbieGXxGJWOf/Z0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcEYiK5UQfbNNqKPli3aLyGyc9dDCAApPSVu
 LSNBlM5nICJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBAAKCRAFnS7L/zaE
 w4NbEACQ/tkbIztt7habxCJvYKOkNiHzidkMAis/yUMZwvnw2HpGFGHCIFcmkdnHg0snG26uQ4h
 0M+1oJUA1rCaBIo/sDh+VRpAaMSxZQgwYg3dWej8mpAiT3t+jz1z00zVZ1/DnW0PUH+lh2agaxw
 nvsIfrzaFtUww5SdpThdARVpsR7vCDw4bpz2u1Y9OzPLqqrEewp3+YXh27EsI6WKyDxL0CQsK2Y
 Sb6pdI0qGN0YYYEpZU1xOcnOpfd4Oskb8+Kw7SVj9PlWpfZjKg34Yf7W0RKuf9OLGzjf9UIBDhw
 P8ZhrX1x2eWmWiZnQaUkF6EyhmhxGqbfnp013QQKEMecw/zmvEJds6WY6sYfoFvkgceP3xLxim9
 /jhbVGlEo7jr/FjQs1X0ek88255UcO7PUwflz2vB6zGXoMHjUAg/7QK+H9GE5rZva1whpge1CL6
 DisWCwE0DR4v4MD2gP+Rm4XTJ1ID3W6LjgygBrxIWby8hoO1PYxp4/8hpAjWHuAeDgklOK1VElK
 g2qVJfjeHMCfM1pUgX1wN6je2wLg+vjHdy/noDtTeUBkr1ikXhXpgM21fa/JMFhclnYLx+5JKDm
 BVlk2V0L04Wdt/URrfJ/aSrcxdhtsenJkpzGHNvZuOSKWS7LuTKEVdhDfbFQ3O7JS3EMR8OWiT2
 T5qRX/0rHDZqaVg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: lQT2b6gomDK9wG-pivKT4JWMqm6C9905
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c171e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FH57a1SQlJoUzRel804A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: lQT2b6gomDK9wG-pivKT4JWMqm6C9905
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX4mJFHz7pddGF
 suWxk1NVnfW3Eb0Jd5bjziLIThnjYp84k57R95tXcOoGU91Wr4RdVUsu1H6CP3o3/lCtch7Sj3T
 vyp0NGXmg0aVzf5MISD7jlOxU+Unzz5cWb85/5ofy0606Ioj57oyX1+o1vqKovgBmnm38BX0/qq
 3ddeZTOZm4KT6Sxkyvfp23WShH1xeWdiCqWan+XALqUVTTWxC46kXtEktPvkJzqrrOa70t+ORF7
 8445Xz1jG3At70pR1ss5lgOAKfu8hmKAM52NBEkdtaMpX7sTetMyeB8El42wnvikKkVRE4nEAVU
 NJdwt21Q9gR/Ug8y9j0G9vbDRaCOF8tDplqRSgqSxgHPDfuJgN1eNNQFKtcLkBmDyPT5nPwaz8K
 FIrpVToPGJ8kvKF//Mh5qsGisgXpLb6CSAjEqBPcuZJOeirkyJicloFuVpg5NiCh7/oGFUEgvut
 0WLyl6sDo68mK1DEWVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010015_901380_889C9005 
X-CRM114-Status: GOOD (  20.66  )
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
 drivers/i2c/busses/i2c-ali15x3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 418d11266671e314aa2fb882ece025dc0ae998da..bd62aa8d645004bef121fa46efc1d7afc473332a 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -223,7 +223,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -255,7 +255,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	   then the BUSY bit may come back on when you try and use the chip again.
 	   If that's the case you are stuck.
 	*/
-		dev_info(&adap->dev, "Resetting entire SMB Bus to "
+		i2c_info(adap, "Resetting entire SMB Bus to "
 			"clear busy condition (%02x)\n", temp);
 		outb_p(ALI15X3_T_OUT, SMBHSTCNT);
 		temp = inb_p(SMBHSTSTS);
@@ -270,7 +270,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 			/* this is probably going to be correctable only by a power reset
 			   as one of the bits now appears to be stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev, "SMBus reset failed! (0x%02x) - "
+			i2c_err(adap, "SMBus reset failed! (0x%02x) - "
 				"controller or device on bus is probably hung\n",
 				temp);
 			return -EBUSY;
@@ -299,7 +299,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI15X3_STS_TERM) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/*
@@ -310,7 +310,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	*/
 	if (temp & ALI15X3_STS_COLL) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -318,9 +318,9 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI15X3_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -347,7 +347,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT) {
-		dev_err(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_err(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 	}
 
 	switch (size) {
@@ -404,7 +404,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		size = ALI15X3_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -437,7 +437,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		outb_p(inb_p(SMBHSTCNT) | ALI15X3_BLOCK_CLR, SMBHSTCNT);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3


