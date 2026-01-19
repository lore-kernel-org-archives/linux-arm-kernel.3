Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68951CCF2D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=; b=nJhXKYV7uK/Kf0Da1/WBVrKA78
	45UqmsAqQ4GRZfT5JVcKW1kojC72OndaTOzr6W9s28I989/fZl9Q3duzRL3ARUQSn3TW4pgDVSbBy
	gzqb/gOeYLuGbkis+zXIAXm5FWgGS7J2H50TTj2b3Bs951e7WLxJNEG3LzkXji+5bYRyuKu7yPMJi
	EvKzgAW3Cm6kX08V55nnIFu90CdVfAH9dr9X/Mpsnr0n0RbUUHNN+hc99rsaxjtKOTS0K0p0Tb0Mi
	07A/bDd1Yur9bJgotJeeHYCqC/ddqpAGFADk8eHDsgwVnYMUSzH4HtHy2TAlG3yjOqeLvdInTcX7Y
	zrzz7W8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgh-00000001mth-0Mf7;
	Mon, 19 Jan 2026 10:40:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmga-00000001mpe-2WAp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 10:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=; b=oYh4iGoT9a0DLWHcKs4/riWao3
	iAuXy3oLAC0TyuHi8U3sImADejhBEMdshrCArdodyRauWO0/u4qzVsdEcIEedoERpSJUI30y2Mijf
	dm7XOZP0RLVzjOaBPDEl2J5dvtf1yrTJDB+vMvIPoYqAgAFUukGzWHSLFfUi/68fTo+zRC9jTVRU6
	vTfwccZr933Ki0Dbtcz+AzjKYXP5pNoY+whNHWi7kSJMX3whYPOa5lR29ZyHj+b9c2wSj6sWVCt85
	KYi1/iIxqLuS+a34i//oOOiR2COB+dukVLDsWjor2zgoKResPSe5fg05JItB5N9yuv0dVvLu08jml
	9pcsqkXQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgX-0000000BsbH-1gzA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:40:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9kfSD774894
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=; b=nmtXdM1LuG33ut1P
	Lm7V2f7hk5I3fLWZx2Ma8lcDJ7ZCrv9FdZ2ITnRIwFZ69CBPrK8bR+9cjP4R9Bs7
	bufPn7Yp34AFajEbibFCHuZrxmHrVWMmetjBgVxqp5B4gzuTIbZBAmjc0PnLram/
	Ce6P2kmISeTh741nUsPDtiv8x5EAdONn7emQ5zwDvgzCCrDP7+HHN+lhx46JmOM+
	NLP2MQiy4QX7OB+ycHeaGn8hhKGe6AgKf9UydQ3PaM4zuyl5/kKOshVGJyMmTbxv
	fgKA/y5gjTZ5eV6RiYcjyiVvo8C4yICIccyZocLYI+R1c3XdWbUZ/LSiCoB1NOM5
	WFgkfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a85vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c53919fbfcso1029929985a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819234; x=1769424034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=;
        b=eoN2qPzPQk361+VdomjKIyidiirQV/LPH/EmeP3NAoXYAVDttOMqZq5mmckIF8cpqT
         XqoT5CwSJuJ0T28QovNorWTYPO4RSNKrXMiOzkGWX6Qx3Hr8kZnyjamc6mgFNWS2sQ1I
         Vb5UQ5TT3fdPx1UbsPWyjfFUX1Whmj4iBSSPwbTXkMWt/Q9lDJp70i8JoBghw0Yyh4eO
         0uSGgnyZ1MtRcAmTs1mQZfDsoC8g3FIrotV69xY+MaFq8b4C9g/jO3TVUXaj5UIHPau2
         1EPu2UCSnjGwGy0tmsVNIjMmOLa/71r7maJMPbD2KHMS0hIZ6Zdijm02NyDPdLvQbWPF
         H0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819234; x=1769424034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=;
        b=HkkHeulStma+NXLdU1lkzsLOVkTCiDHoowpfUhcwjHDmgvYZZ0JzdMmrUQmAW7d6G9
         4vKgl1Okx0DifyrQtEgTqv1VTh79OGcqgQJJsFDvh9hjf+8Cv2/L13COUZHLr+uEn12T
         szUfur6Iwe6ekivO67SwJzgvrr1rhiNsDiYZEuWy1JuE8DCkqfDwFDxNMz5tJVkf7HEJ
         comgWe0RRU745djqnDHGbLBbzVYjSEVrH6GJ9ynFLhiIH7pBHaDlhSX/rW+3zx1L5INp
         uqRgCK7Qby7RAQsPoEtmHLg/00TWFbZwqt7vQoBnLiOap2THWk1eDBI27vxi8P4qOfQS
         i96w==
X-Forwarded-Encrypted: i=1; AJvYcCVB1tRvF79UaSsrVy27Q2WnfBST5Q6lXlZcXegAqj/7wEy3gydliZTLi53kxOeNKeepS0ZIWeKjIaTd0IqAy0Pa@lists.infradead.org
X-Gm-Message-State: AOJu0YyEALCKsodgl2H6Y0+CAycB/lU1Ez75DAUFJ0wzluZs1Uf4hzqt
	eIo97BD/oFmdi3mECRvUUef+AGVK6p95XZgwRAUDKcEnp0+keeNtlB1gt6ll62ni46Lo+Qljsez
	XXbiuElMY3oog6zXgCMZ3bAPvYIi9IhICc1+vEcIwMrM8Kh+3mA/Jsij7YHm4u60zHc1ratWmUo
	TroQ==
X-Gm-Gg: AY/fxX4QB1H7LaviiT7rdSOSpprJLz/cXoR90KuFLnAfue7NdfSGYLAYEwmHowgzAcf
	bBS1Rp3MyErhlTRsOFdQO90smhJZWZbY3IriYFrukdI9YSfeZyxpZMxIbMHp3ZdzuKwBI0hADuz
	qozIhcOQEUU2637xdQ2T8YF9SNgcvv9kt65OQ4hPgHr4beTH9fF3aQItLTQf3VxkrttqQ6jk92n
	Op9wZqknSDS18pCdHCKREEImzs5lquggMDyIQVJWxQWIuawJBURK380DF0Uq57Z1u3UrO87J8QQ
	/hlY3osIRvQoMAb7YLteENSDsmO7Q61k/ONt0VC4GZoVgWr5GOTYTHNtbbbvwTLVAznIAic/ADU
	T+uWCiuehq+PO+2WsldFS0M71VgxNlwwGPQ/DY65R
X-Received: by 2002:a05:620a:31a1:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8c6a66c8510mr1419195785a.2.1768819233631;
        Mon, 19 Jan 2026 02:40:33 -0800 (PST)
X-Received: by 2002:a05:620a:31a1:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8c6a66c8510mr1419192085a.2.1768819233098;
        Mon, 19 Jan 2026 02:40:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:12 +0100
Subject: [PATCH 1/8] of: provide of_machine_get_compatible()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PbFFIprfToa4la34wmCmAKivaJm7MBQFtk1XHPgSNcg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoV9sfuT2VvhKGZTGz6p/Fpn/MdjF0ME6wrx
 zPiggHM5viJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KFQAKCRAFnS7L/zaE
 w7fqD/9JerKCgcU3vWvfo1Hz4H9oZ1Phw/+RcPbdyt6LAUfl+9qyGpxqNKxeCeC13AqyqLCFTU9
 vtgZoPGxKFtxYTTB303D8vGvNtcm15aQQnQZ5qQsCTwshMpaxqWTaW0MIBH7rF4bFIuU/hu2k3H
 km9rXyr2ze7sMGjL2ZdAZbWdq7h4a7rKUOUhB42EBoY/g5t+2Nf0cGItt36Y9VKxVsUrEW1gcTb
 2q74U3LKt5IiGzLIdSosJxMYiLQL/5RPBdgkpB4CgpAhTeeCsJ6MzEz6o+3+svQCIxmIf37+OP4
 eItXkBJF/sBodLXDhni8ooEdyhdEmn2TXQaSKwq8udjKlU02e4DJa6veW6Lh3rgLkksL1E/D1au
 Eb8kDWbD13muh/brJ7zVB8uJD25VlpKrIAFoth/coR3lWabcgaICEXy1M+mPho6+NFfieRKNSkm
 QDLzesgb9UYAXcIDXJ3CaqzVZwimwNqDf/lHjrY9oBr68CdUz9p9Tgeb4O5GWheVuJ1mWY69iIp
 sdeRdFuVq+TjtnzDhJpHq+lFX5Zyi7nQwcJV3R/Ee0FmJA0BIn5iFt5DzBRvHmXjUMG3DJTVlbl
 zPo4PHcd/kCpPn5NV81nI1LKkb0ewtXTDhTXxVyOwZQe6VDeANWOXTxYLGU09Vcap5BSadE2NZv
 UBogRnzIuUXIxSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: wXiE6722oDW428JJ8Q1u2N04_aAVBgzg
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e0a22 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PolkbJsynZ_iw5VFs6kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX3DQK/SReKh0W
 LwuOGW6sTG7y39sntWJcw3BTcKzduPJtiiIsBB9RrsiT7bRtXt1ZVXCiMUN+CDPlxTjD08sQBVf
 keusFbrz9UJTVKjEa2VlJvY74sRIXNTmcJZuHOoK07ZmTuSBavldNGSMI5mCP9gDHt4lIgi1RNG
 PpeULhLguigDQGdUY9JNR8+H9h2/Kte845oMFFuOwcIl0PkGMLCu58zci0uvxaX74D7pxaRJLqb
 zvlCLTGZRmT3AHQD1jWygGJKsppFklFS7jbQH/F2Cq4PzmZFDdfv0HulEGFb+aB/NtsxHXiFhlt
 WmOWR2OCBxZTiKYwA6T+n3pnRDcIIR/7+unyUEGvAJnjoXseuEUhiCGfrZDtgrXU77i1zAGqZZG
 QkkBD7rkqiqNgCK4pu74kWSia2DL3DfOyhG0GNpkLehWvxSaamAFOZek5sHH4mTDYn+F2t9YtAR
 XIfsdaXjWPmSr7emGDw==
X-Proofpoint-GUID: wXiE6722oDW428JJ8Q1u2N04_aAVBgzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_104037_826253_6F446480 
X-CRM114-Status: GOOD (  13.67  )
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

Provide a helper function allowing users to read the compatible string
of the machine, hiding the access to the root node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/base.c  | 13 +++++++++++++
 include/linux/of.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 0b65039ece53aa90f30da2420a893a02ab4c6dd8..a7e27d5355929abd6d156b80c52f8f8b08fe6da1 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);
 
+/**
+ * of_machine_get_compatible - Get the compatible string of this machine
+ * @compatible: address at which the compatible string will be stored
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int of_machine_get_compatible(const char **compatible)
+{
+	return of_property_read_string(of_root, "compatible", compatible);
+}
+EXPORT_SYMBOL_GPL(of_machine_get_compatible);
+
 /**
  * of_machine_device_match - Test root of device tree against a of_device_id array
  * @matches:	NULL terminated array of of_device_id match structures to search in
diff --git a/include/linux/of.h b/include/linux/of.h
index 9bbdcf25a2b448ba4ec5ddee8b35a105ca4aab8b..75423fb556ee4c108ce25144a0bdc252a89f7d1d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
 	return of_machine_compatible_match(compats);
 }
 
+int of_machine_get_compatible(const char **compatible);
+
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);

-- 
2.47.3


