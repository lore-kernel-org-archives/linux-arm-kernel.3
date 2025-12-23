Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C3FE6F07F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=; b=OuDSzhBuV2qU95L9HR+kanyqsr
	WRFfg7MujDgkucOLf2Q8RSieQEd8mHJFJp0nl8yceJoNc6KfZj2vR9mV6zTfOZHEUF+0ulL3B1vrt
	J+060CuoZReewVOuQipcT1EQwsxi8MQmBQwL7HZm3j2G3qo5b9iHb2ZaffDmNquigC2JltixVnxk/
	GUcgloYz5mRKAht5HsxFkw7G8uhUsmQXekpRnigTcczR58hauHgukk15o5uPQZqVSytY0/BY+gWiS
	hDs0X5ISkEMyfJUgjP1nZYpYO7/qWm20HQ9bNti+CQr1t/P8LDRsqIrRO+zVLDVBQVYSyH46+G8lc
	ymAArh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGw-0000000EqT3-2LEK;
	Tue, 23 Dec 2025 10:05:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGa-0000000Eq8p-3TQZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:05:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2dMfU2199053
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=; b=pogOhgERHMDldIkt
	KAhEDEfQfbo81lUnBP+JJYv8YmjHQu3ASOwq2syL8tnlHWf7xY9raerg4qvN4u7F
	jQ+T2OdTMuBz2x1zwTmH6s2kkqeXBbPOBTpQ+nOlPO4h+WI6sX0xZIA/AuW9uYNe
	opgpoMkieUBaqC4C5mFZ/m7bXyfvWemFDSKuB/XXQLoEqeCBLJagRawrw1rAtZFA
	GxaQF43ozUaaNu3B3GOrAS4DKMVArFToRyCwSd+Fcr6w31/mIPZg2koLqiuDxo1a
	xJ1P13mIpYGxOwoYb01spCOOFodqQZJgL3wKDyEMZrc4Gk2bdVwYIb3rpeBzy9W1
	akZw0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwursd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4a5dba954so113269201cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484319; x=1767089119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=;
        b=gsLLWNENtV0+HbBFkBi9udSJgDx3L2VhZ3yn1jSHns7ZA3oQiUmyQDr+guO/UMsYGV
         woB94GoEexlI6f2qvYbnbmIws9cY2z9eCbr6mdXGy284y4xog3y4vGhE78EIk08+FRZV
         ZXna7YbE7uoI16L4fP2Bz3MDgao9e2rzpkSAWVREeyaqHZKvBeIEoQvmuhtY7QPBvi65
         8oG51vRWDfXFdWdWROJpg6eVuO4pAVvEEcuiIPmPITK5o1UeTbYd0Sj6G7sFzJGqWqUJ
         6r0Jgtewaf8tAABHM6GPk3xoJ7RJaHb31gbu62zmseF7PGuW1RBPhcK2SIBznOMF6TSS
         FTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484319; x=1767089119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=;
        b=V1hn77yJVdJimnKyNjthDOgV9Em5g/Rh3D78dwvhQA1G/hWPhumo1HMy1hwPDl9kJ/
         yupkJu6Vq5zkZ34pcx+IqxauXR5eKUTiKYS3XqQRusOAH/8XS9XyIwuPiXoLfAdP/Xi0
         Q7Bp5cLbCg6SxX9DVmgWWegccH9wUrA1hu+4tBIWLeST1+uZ9INqCfHcI5BpROWMrzzh
         7+B5Ta+cR51XkX/i/m1weT33XoA542HtaefATLofKz+uyk3fXjhtRknNBZUtJryDEcdA
         +HztssO/tHiv9F82FjuNahhqDoguOUjweXB9S5AQRaIUB6sHQZC4sCpf5nzyP7EMcX36
         oIOg==
X-Forwarded-Encrypted: i=1; AJvYcCWaR7CEuGejDTO7yLGVBMhkadmnOj0OrN9/Ukkmnt2FtVupe7g8B3C+CtXFklW4AFwFXH3xQsak+HRYuDbcwmox@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5g98U51iDboocWqy7M5oIZNoBQymLaS6fKBe4N8NOm6czAl8i
	R8lvTcVIpkR5AlEjPNfduY5KkWbHJd9s1hIlcCI4w7YrE7V9u3lX2dpZMec2bUAyX4F39hL1Z5e
	sVyzEtuHRTvyb5F03KcDO/LyJyMpZhCr7niexcI1wE0j8R/hiASofO1h54zSJxACKIijzMwdfLO
	tZvg==
X-Gm-Gg: AY/fxX5QMKcpnn/QwVurJXARqMRqwuZMwKBwcwhBAFl2AjjaPZntZAGw0eI1BzcHQQv
	lY6JB5Nze8T6+GxJIWuiiPaTgtWMLAPnIV1FD0b0TC9hbo8xbBWffoPxwnU1RDowatE4ado/CG4
	gsLzkNOvKMyogbvVGyQQqXyuMGUd7DBENupWMcqALENiB8YmkERdU/xng+2HtifcRoNF8AW5S9E
	7YbyJJCUuXmta2HyK3HaaDz6R++Y6Mf4pQUdBXx1W+iWVZcX1EdBN8cwTDaD1TH5xEas4OwPQ3c
	eP6crfrAV2cDMue67mZKt89cdgXQhSN0aJVmaAjUDhwgIGoQso0F3swQEOGSLWjvHqCeYkUGHBI
	Ju9RNT0idKz1SPD985W444rH5IPGzovG3qH2UHBI=
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr198668841cf.35.1766484319003;
        Tue, 23 Dec 2025 02:05:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IForFIDGNQ9njlDz41j98dh92a2O0U2qbhfYixKg3bKX3y+MnR1F9NI8gPqNhBANugj/T2Qbg==
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr198668581cf.35.1766484318613;
        Tue, 23 Dec 2025 02:05:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:49 +0100
Subject: [PATCH 11/12] i2c: nomadik: set device parent and of_node through
 the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kz3aoETjpXt/sy8S8XSk2Nfc0c3D2LQVFEQrK7qt+cA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlEH8yQsYMAv6ooCMosuFd7IzlZjLcxciyOf
 UQM5iCbkxyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRAAKCRAFnS7L/zaE
 wwKlD/9mCvI2m04rBS/yTO76hF7LJmURZqComcwLRaJTxRw5Kj2GccDWLLba9W/EeWkgaY878dh
 mlgpACmVVjIj/prfsLX7VwnEpPwe4rki5hI3MGdAWPuOBB38zZjTUzpYhocg1jLTgeQGLQxmD2q
 CV4Uj9tLsSN03FmctRiu++tKRNFBOXMsa9K2Z3RAKe13mQwAxnJ5+8Z8HSgmA/JwZZqx1jRM8Qn
 bkWBgiK3t8ow0wq/mNyfLGgDNJc62hmdViGPZLJu412tx2uphiRhRTDobCLSQ9SZcJl5pGKTGYQ
 mHi80IJwOzRfDVKh+DstwfULzzMx4mgWRYr2BY+ktS3eabzeXRUE9aOQTJXFHqfqWILuhuWh/Tk
 PKLcv6/sCH659tOUBfTrwdR85pZbH1LWlXu6e0T7R3wv0TShScYr0aKotIF1j566ak4aqWasiT+
 sC4scVMWKAN4xMEFEaCIRB8Evbqcmd828SbMITuSWbD36vA727i1aE0Oy3V+4yX2Pe3jshJeQEe
 seOtLCdT9PrqO+tbQNx7JsOdrkZk54nPY6VxGMS+AUwQVbaFwbQR/kFLjgPXNFXdtEF0gTLW+fq
 0IaCwqUzHvnG6VJ1Gjbu8FYvHGsSYI0nbDwBTZkeLnbv6lKgiBUMxVS7r3oojb1ZN3OvLhNfYZs
 l4zyIT96c4hbKgA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a695f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tIHrhau139UvCPJ7cvIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX/hkmjDySL9/k
 lV2oEsrPZSX2N/l/MpaTigpo8RHSB8fwPX+n8hv5SEWuPjS6jOILbrFf2ckMYtjG6g+5bCVVOov
 WtCoZ72xDk4liekHkgGdIv4/KPPk+r+H7smy0x4h/9s0GfXM//luKLJfXgs1cAWvNFUdeivHU9N
 90OmgH4e6C8fCzfO276GueGEiFokFcuTAQvo7kZGHZ5/D9RoE1YtD4kwZiJeYi65y+pKV8mT/fa
 4h1cgTl4TQ0nJ//9Yq+stIX4AFhYdtfhTP7HeiMFfS0BkW3b3kmiM2WpiBd+wrjTe4p9laWTyF6
 Kbxl3cnvuHlLClsm67xa6TcT5YNQW5xIGoPeQB8Cadu08p9K0aQnPBVLamsExmXh6C/VIf5FPOQ
 XnhZVMJKHPCEF/hqK4LRiRnH1Cz7KTUTZQcHAhbgbIGwQ5GyLj3nagomlkxYgyEBiRspXAY21mr
 yY4f7woAjJ/cCzLjTIg==
X-Proofpoint-GUID: yZNtEQRKhmWEOLjfC9lUaAKkf3aGVo3y
X-Proofpoint-ORIG-GUID: yZNtEQRKhmWEOLjfC9lUaAKkf3aGVo3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020523_040782_3161A078 
X-CRM114-Status: GOOD (  15.45  )
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

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 19b648fc094d9748a0cce4e35f350da35ee25505..133ce90941ed596ba2e6dc2d9b368cebe7ace3a3 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1147,8 +1147,8 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	init_hw(priv);
 
 	adap = &priv->adap;
-	adap->dev.of_node = np;
-	adap->dev.parent = dev;
+	adap->of_node = np;
+	adap->parent = dev;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;

-- 
2.47.3


