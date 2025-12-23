Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03199E6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=; b=Zi+sb/0Y6Q1wOJISoBRWdib3v8
	NbDl69db0SU9w2GknHOAgLMrIC7e+Cjnk10cwDHww67hz1GFZ0I59RmZqTAYTUMMwEXuEEtrVuIzS
	Zg1qPEp6uWw+GI7dpQm0HGZpft2qj8lrjpUrhrEqFOuuCKr32c22LD5Kd7nqgw8reERZaRaa5M9EZ
	oZddhm6pUgImcWePmwIGnzgqvXtuMYLi8CLV8WUuAPZs9rJWQ5LubqkDF2XQ/sozywpliGrzwpEhC
	bgxWr2i/qMaUq/wifTt3G/VyKpSZrwnAz6XY+Vv+krH6dHbztGpETy71GKKUzwsN+9hytV9xINrx6
	GvRV/3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzED-0000000EoOZ-08AM;
	Tue, 23 Dec 2025 10:02:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzE7-0000000EoL7-2pq4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:02:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2tDoA1529451
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=; b=NXZPQwMVokntHKv+
	fa6fgpAlsALdTn0FhVHe/OI0/RAIFpi2EQ58j0PO6zNyNNJW3dkpCjnpyNrjserh
	0SN0Q5/JAdL9cCtjSI6i/4w2C4hlJ7yQ+fChan94YkDrFXAGQoHib/7didgwTuF4
	OSQuTsubDEpoFEg0tMw9DJtVRzDg2TkTTRXbW8CpAvm/g2f81OlpsAqR/N/F0Y3F
	Xunn3GCHzcOoyAhkp0N4OUssKO4zl+U6PUa7fM/Wmd2FMAXFbgxpYpgWha9ZujNF
	bA1ERz0aVQvCCImvoWp+nrwJqnYphez/xoXSXQmkV819WcAWZNfP0n5o1tby7f+N
	UTSBKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3g61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee21a0d326so21060341cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484166; x=1767088966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=VW1/ajvaAYUQt1rUuGwYKztOr+AZQsCdCHbZz/4/pL0Yjk1w9YaTGuFaP+sZ0rCv7p
         EjBB0wBEcI7qboxmCymfhjc53rDIteBLWnoyYU5Tv1mZuWqbBsKB61bD4UaJ0U28wGmh
         1F/sphaIQkkEl9fZsNMtA54WPTy0ne903b6br05hh6KXBVnTBf9TDD4i6Pz7pT52aMZo
         3xumSwYH1H0a0jp8EWJs8q7JIxNo4BMPetVZ9iGOVNM9ycAxmsy2cUgvR4/vH9tWfbig
         IxenuEHurpAOtSYJnpQXEcRuJdKkfzHNrFVNnhV9cdWwNjUHPBlt77pIvhCgotMY4z1D
         ZDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484166; x=1767088966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=bSF1a1eB2XkA/OEViQ+mzLwCC333YM0dqt47FadFFYFj4IbrA5PN4Ee5QeElgJklQf
         8nWhZjQKnIk5ug5oDVkF5ZwDniDnjofh6qDFYz46wHYe5llSw/ORricM6Q4Wu69UrgWc
         wPJD0gzNVE4iy3q8A8VE3LJONS/BIF+5hZt4G/gq9E0IgUq1u9AxjN6/w/nVspIFVpOz
         bkd5kaHj7iAwjmjb6Yd6HjntcOgg++1I9Nnkc4Rz7hsUGa2uhxE6IG0UocqELcwZCV5f
         7t1wQPAtxjC8l+hCmfEAZcFMpeoctSip9IzzOWzoDPI1Jv6vKS4IdrMNrmP86/7sTFRl
         JGQQ==
X-Forwarded-Encrypted: i=1; AJvYcCULG29dIAnasdZs6xcPNo4zpFWEPXMfuZ9McMKJSYaL8FvM9lYv9BNl0Fn7aDb66iBAkxLibcYG1fxvpJFy9nhm@lists.infradead.org
X-Gm-Message-State: AOJu0YyYLwYOfcpw3L270HIKHjwgriOm+68QJw9QULaU47JBxmQyBsTC
	OqguqDL8uVC71OAtIhjP5UBEWB9tW1fbb063PvwJIM7BXi4QPWJtyAdzALgh5DNYzVKo1h7Elz+
	h7OKG27x8QNBrvZY196MOo6ONMQkAAczeYeCWZltbehVmOOimFro8KhmiBYfY491Evc2RvuOxu+
	D2bg==
X-Gm-Gg: AY/fxX5+SJHjvDpdSWce6McXxvEYUBf+xg29js2l5yE9TjgyvY62yDB58F/xhNJoKjJ
	Nbpa58D4zifDqQfeej7X0TXz+aN6ZBLnhEJyEQl7YnJHq7uqrY+4MJnp9zxJ84mD/ANQM1eu+nS
	o9dIDiZCCGH5EZ8c7LKNR28YwcVxOeCApWTjuA9BvgJSQRQCmvYyC4bKv7paVioyaZdjXzDadQ/
	jojj6JO0MIJQPyMl6YQ2LsZR3++yZcem4TSI8tF7ta/jXrX/6UR2mrb8jyJ39CL96gIdHTolKu1
	iHKLaEcN2EFcOYHqfey+H4XZ7cFL2KshDv+k2gzJK1a0qJqzASKc4geq/uN0wuVjcb3edwBTujF
	RMrlj2C7h+OXCs7L2bU1pzv5iSNJHJhrrGY2QvQ==
X-Received: by 2002:ac8:5790:0:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4f4abd18cccmr222573121cf.18.1766484166157;
        Tue, 23 Dec 2025 02:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWaznzSTQAYQqKEgVN6mwd6iFax1OFCffRzJ59eXXh79VnM9WyrAcyYRh+zK9tRY8IGJfXzQ==
X-Received: by 2002:ac8:5790:0:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4f4abd18cccmr222572751cf.18.1766484165645;
        Tue, 23 Dec 2025 02:02:45 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:23 +0100
Subject: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi3cNvVUsgYZCpEuC46abxeRT7pA49Xu64UD
 uziUkVt6sOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpotwAKCRAFnS7L/zaE
 w0ZoD/wM32Bmp3WE+s9el7ws2B8x4OdFoCdcSdX26uMDCnLnt8YtAI8LOsVEEMb6fazPKj6jB3A
 jMHY2S8MeFGIwey/wve2wcUUgB60vRFoCZY+E/dcCGlPQUVhOMO3PC2AhTxwmhkBmfkzDQIquqC
 YfNbf1IdKLBGn9WdVNJaTeo9B8YtMcnX0ZDUKzJuc60m7ulpEF9QqYjLU82JgKNWzllIdtiPLVX
 E684v0yaaD+u8JcHb4qv1yORIxoyhBVKX2DauwcCXPFMlnEN6UYvC+JQTE1mtGICrPrK/mTMyeK
 gxxc5Gj1ENA8Pr3SMUWoPnBF0AoKGWF3CJWRBGsjK1G5vdfyJp9fH8gvBxcdzNXKcAis4Ed3Hbn
 u6faKfE7YzPznFltsBGJGmWNTEdH3N+syfZQgnQr6AdM7NJkPtD91sNAk+g33YMN2lg4BbobqcU
 ++fSFCzby4D85+5WOfn6Am0AFpRgoXSmqqdQwvilG1fiDeXTAx5F86G8I3NKjn3+AmJ3fQFwQ93
 patNHd2OQStX1Jed6F6tfhajOxUvbvZkYwb9LRwX4WBzdiCEej9pxvmzMSDqs73urZJt2Z/41/E
 aAQ15tsTH1dl0aqGratG04wZFTAxiF6I7R3axfNL/mTIyehWRw7qi3fMW+IUk5V1RfiNArrrg8+
 z9zRlaDNDfxGWPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a68c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3PEwmxbnAXTcU586h74A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: kHBDY96gCuys_wQdWY7x46VR4TqfYHLq
X-Proofpoint-GUID: kHBDY96gCuys_wQdWY7x46VR4TqfYHLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX/sgJAs931UWx
 ewxKtxIQ+joFX/XPaBjzTY1H4efueKa1oZeDzdlWSm+Caz1z+HrqNFJpFZXYvi7zjuL8Jcb7UMU
 yIF9DYO/0sMldsPRx5LfFBRtbEkEeOSmPVSJww7QwVz+dSCQ2Sd/2vFfAP0AFOtGvfZT94MS1zB
 7OaMX/V4Y7z3kEw2nWEKwsu6glsu9eqDZeW7wS+OIoDgSiEvGCefi9C2HsYzoGzePBtNDuFCnml
 xuzrXGzSyH2VFbDIb9LzLMGxDcXGhK5uGA4wALX8m2ykWxWFTHM2EMydCBUidCf7TdXaw/Ilwp/
 m1Xfeen4h4YlWoTAsIkZWkcVfl9CDO6tur7VkwCYPKfl8bpKW5ZCv4joRiTgsrXWP/fdNW5SAnK
 6pPJFYu/UOAc1lO73BnyT+bnNBZJkVmQ6VDioTMGuGpb1A9b58GrApjmq5Nq9fDxxV0HQHdTIhA
 z2OtWS4EYxnPymxQg9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020247_720568_A8A07DE9 
X-CRM114-Status: GOOD (  13.48  )
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

Add a set of i2c-specific printk helpers that wrap their device-level
counterparts and hide the dereferencing of struct device embedded in
struct i2c_adapter. This is done in order to allow moving this struct
device out of struct i2c_adapter into memory managed by i2c core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/i2c.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..2225696c859f617479be4d5c9d304bb32cbf5e9d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -768,6 +768,12 @@ struct i2c_adapter {
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
+#define i2c_err(adap, fmt, ...) dev_err(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_warn(adap, fmt, ...) dev_warn(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_notice(adap, fmt, ...) dev_notice(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_info(adap, fmt, ...) dev_info(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
 	return dev_get_drvdata(&adap->dev);

-- 
2.47.3


