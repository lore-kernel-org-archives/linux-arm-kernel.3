Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81A1EA4FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=; b=iGpKbJvqzKV7YNs3fuvskleuUz
	c6S2BeEhy+UzpCOBBxO30dl7oKOo87pdq7WzxFBgDIWlVyuGGhbTVT0yFB1AoHK6OjJphkGbRXpye
	hH+EKJvjVUeFNiwBwhEBa+oETc1TLM4DTqa4mRcX34mx5qqa1uo7XHvSXFnuVcATQ2sY0Z743AU16
	baZQOV4ODFl0yaW5OfSNooiSRxp38gf8vZr6Pb0s+nCqfWrT82WhosywV3yVxCw/q+Z+KjWcj2Qo1
	ABP2dUbef4LxqmMRgzHowF9OglqAihMYSE4NnDOoP/lZsY2co7sYaTO4A194+muon1MdrNgtVzVIT
	tG7Hn6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8N-00000000NaF-22j8;
	Mon, 23 Feb 2026 13:37:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW8H-00000000NV6-0iYv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:37:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2qux3152071
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=; b=dYXQH0MqntZSpIKl
	cur+MWYG1rIaZsKmNba1FmLfUAKXHNpGFVT+7SP8N7Tr5AlCyvB36GtjALEOK0Od
	ckgnz5RR9O4aFrgY9dG9vbkCWvnORORIkbDI6rQMYjlkJlXEGUAJgrR6C05z+OKI
	s2pN+SWQiFcc6QTY62km53aJJCbrN8W2V/UX3nX7OX+tZTf9xjin8hyGcqx7+M1e
	V9q8/0rgb0cWFYQ9bGW5KfHHCNrbUZHa9sNG92N0hLnZhjUtXpMiJmJdCYIsS/PV
	TbPUsydiR94kgac/pi380Uqn5Dnc2ixobvxW9uOduwCGdexZA+M9ply2XCIV42sJ
	toiboA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj887b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 13:37:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b0d938dso4625891885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 05:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853871; x=1772458671; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
        b=ID9NSzGnL4stNbclLuVSnb7tdjKAwQADZ5YGbfOzEzXyQXK3eeLhrZ3PJC3YuXmJ5W
         I1VTPnbGokgj/ERR5hdniw2d1+EDmfnFB7cFbyAf91dH6uMKNLxixINDZlXm8TYaxfWm
         zWHGaRVmFoq10zcQQhMzp1YpB8LUn+/Zi+Vu35M9295hoKkEvWy47zcrlhccrXwTk1WC
         s31lq9M66rtd0JLTgmDiQP4cFItoYbGYvI9f+gD97CSjMJRwOdhaYQzJfl0NYSgr4kdh
         t+FW7IDHhfeu5u8QOjuUqt0rFbVae1BHUYOb4Al5l292z4IBVODM4gZ7khqHKtd0prKm
         olMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853871; x=1772458671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
        b=I6akqA3DrVexiIQLpPPQHyNPA4S4XCdnOZJJtoL9YXoQiCxUA4pL0Yy5aCpOiJVcLj
         n0VAtjh1anJqG8nL0f5tqsT8XxFVmQd6IQKtUdL/ZQUnYc97b7z8NTjuoMCg02eaYJOa
         mjd6drzZANJpY0Mjr9ugZ8USQcDibjZBgCp8QRuckk+8oj+vEiyRGVC1K2KQSDBwUsZh
         smGr2RoFx0G0ePLqISWuhuCQbj80oabCy0mFdHH6sMMEWU+y/JolIn/BEyJMZP686xgY
         rRzjMkbxxws7+HNeYWyJV4pxjGss9d/s5j3N9z2O2qiinNUFyXcjfJTshYL7NVHb1Z5t
         HiQw==
X-Forwarded-Encrypted: i=1; AJvYcCXw37TPZbMd+ZlYW04oEc+CgSSzu1Wr1iOuDfKv3aooGudyHJ/l0q1mpNVxGA97x9Dij/Q8+hOARamVJgot0fRX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa3UxkDJ4svf/dD2YmGbMFj0kTHs1Ma/ZLJtaIapg2i1bFm2rr
	ElUJYnI66uQN8GmsV7Wnj5lC0DDArRSBN1Y1kfmhL3ih2TGsMNnM9AZQIsrf3o10iYy9mCk5eoc
	XAPE8ZjNzu3Nk79Xp9NWy87bSPG3bDongOfkOmX89PL1W8tXq+ce9YnB3wM1G8BaBo4ZjJoalo7
	RHFQ==
X-Gm-Gg: AZuq6aLa1KvzdVIoTHzLaghpkGpBF08TAUyVQ0WtMfvUfWXnfrhSZK3Oxk5uDpzd68w
	D2K7PGPv2Im92Y7dWO7y1t+u8+vvOTw9+b4RG3vnL1IVveXFE2m2DekB13WLBmqQ2KtvJJRXFuf
	obW7P4x4m76cu5MZ/I0GKso+ZBKGUgygcfZI1qSAPVLkOQR33IyWlUD4vuE6Mixdj6JjTmENQDY
	7fPU2aZ8POIhQrY4kNQFI50NyAPXVa3pf8ibdWb9nvQzLXwCf2286BASnQnLB30yxGQwip+kSxM
	FNqgUpA03vmjggef3daSHFYsAFZ7lhvKYTSeCR/NwMYPwKs6KtpisbXPN2uj84SyErTXwHl+Ikh
	rpn+6e6tFlW8PMr47S77iENSymE74t1aeFar1MfBj8KRARC2nODo=
X-Received: by 2002:a05:620a:4052:b0:8c9:ea6f:6a4a with SMTP id af79cd13be357-8cb8ca92f3amr1068241985a.78.1771853871505;
        Mon, 23 Feb 2026 05:37:51 -0800 (PST)
X-Received: by 2002:a05:620a:4052:b0:8c9:ea6f:6a4a with SMTP id af79cd13be357-8cb8ca92f3amr1068238385a.78.1771853870980;
        Mon, 23 Feb 2026 05:37:50 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:19 +0100
Subject: [PATCH v2 4/9] base: soc: rename and export
 soc_device_get_machine()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-4-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
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
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kiNnpMfASMUUyUM3BexU/p37quB5SdiUkVxgKJCVWKo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgdJ4S3kKQy7E5gZ1HH0U5SQZilqtbHrWuRg
 vsXfy1WCm2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHQAKCRAFnS7L/zaE
 w+ffD/9rAOyhycwaiVuwUk5IsBC6AoWuSyHbtclUsR021hX341sTNrodmTF9hBEyCYtfeoID3s6
 6v54GhA+fRlXWOiMcydGgtSfnh1/l9JMceBWhF24bHQuSAibluRfYEHlf3q7KsT5Hf7u/YfHdwv
 0S7/gjaeJS30/KeoKhxy+4i3Zl33BKt/7NkLDJK4gyrzhOJIecBLTZZbC58VhpbOwBq1uchfsSI
 eM745iLv/Vlg99B9GuBna643AcG2mK0QBRJVBqm0q3ynRf2uJ2T4i6COg66w12blMZcHrZK28k8
 SeC/oWmP91fpkpb0irJ/icN6A6vIIFFenIGT85YwHaTwE3+gvxjb31t1Y5KompcEwLIPOAfn/TL
 dWoMEdcE8krPx2hBK8ylSyyT9+SD1tMG85TZ4OKKbSixYU5XP/Bj6mVeGH9+9pKUqXy3PSuU/An
 V1NP8SeznajicCUQ1QJF93oKppmUIm1V5gQQKKxi1I+gWRG5nG5W0/uTz33jh3tvhXxt14vem2o
 0Y3AZokJjVKI8Il/350KT4+2vWorZeZjVtaku4rZgEEcoxjQ4q8YP+ic+Pt5ExHSIkYiEzhC5jv
 r0utAOUE+xo8SMXpcDj7WmsGu74rh8oim9GPqphG9oWx8OlsUhJ5jecRvSRHBK043p5Arv3iWI2
 hnk/0nakVnNjHYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfXxb6eEzJ5qcO8
 jjEVMwaVzx2X5l640xYgMK8QPhg8KQo+c9UAWUZA0EwQtSIiHXrVIOW7bBxRL13xC7N86edR6JS
 ij4INDdch1dE8KOCdc6sjv/DE6I1+UqIr+uVbIzc3SQRXwqVi1ZL4Co/prnO85+HMQXhEMnfgZB
 n1gtES152r7Emgkl49CcIN4Sk35893Y8MDP4S1E+pYmPWYYKGehYPhK4qHCMOGRHqoT9YA9N0R/
 ArwKUc/vPdXNTG/o0E7rfmuoylQX2xWx71tCL6JozQWEPMc3Hrkl4khUyBhbLpHJql1s5sdHVzC
 n/C4Qxbaf0ttQZnWXf+OPOXN2zhpGiI8p8Z3XqKkAhpGa7V0TtKIhMS3/8TMVbH2TfXmplTrxW8
 FQKJ//GFCEPg+F64PKfTLSLWVbAEqGJ6NvhheUG/eSdz8WGi14WhK7mi6398ryAySzfpxq2maa+
 n/cIBtIkrtlpZLTODrQ==
X-Proofpoint-GUID: j-AXcWddnkAhuN8wgyg-v_QPUa9cb6wK
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c5830 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VU1FamAdWuTKyoDMntYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: j-AXcWddnkAhuN8wgyg-v_QPUa9cb6wK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053753_337743_3177B22C 
X-CRM114-Status: GOOD (  17.34  )
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

Some SoC drivers reimplement the functionality of
soc_device_get_machine(). Make this function accessible through the
sys_soc.h header and rename it to a more descriptive name.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c      | 13 +++++--------
 include/linux/sys_soc.h | 10 ++++++++++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 48e2f0dbd330b8d402135ffa7308f454eb4ab7a5..65ce72d49230360c22a812cb9286e7fb4de0baf2 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -111,17 +111,14 @@ static void soc_release(struct device *dev)
 	kfree(soc_dev);
 }
 
-static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
+int soc_attr_read_machine(struct soc_device_attribute *soc_dev_attr)
 {
-	struct device_node *np;
-
 	if (soc_dev_attr->machine)
-		return;
+		return -EBUSY;
 
-	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
-	of_node_put(np);
+	return of_machine_read_model(&soc_dev_attr->machine);
 }
+EXPORT_SYMBOL_GPL(soc_attr_read_machine);
 
 static struct soc_device_attribute *early_soc_dev_attr;
 
@@ -131,7 +128,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 	const struct attribute_group **soc_attr_groups;
 	int ret;
 
-	soc_device_get_machine(soc_dev_attr);
+	soc_attr_read_machine(soc_dev_attr);
 
 	if (!soc_bus_registered) {
 		if (early_soc_dev_attr)
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index d9b3cf0f410c8cfb509a4c1a4d6c83fde6fe33c6..f19f5cec18e28461fef57f22702d2c44a41e4193 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -37,6 +37,16 @@ void soc_device_unregister(struct soc_device *soc_dev);
  */
 struct device *soc_device_to_device(struct soc_device *soc);
 
+/**
+ * soc_attr_read_machine - retrieve the machine model and store it in
+ *                         the soc_device_attribute structure
+ * @soc_dev_attr: SoC attribute structure to store the model in
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int soc_attr_read_machine(struct soc_device_attribute *soc_dev_attr);
+
 #ifdef CONFIG_SOC_BUS
 const struct soc_device_attribute *soc_device_match(
 	const struct soc_device_attribute *matches);

-- 
2.47.3


