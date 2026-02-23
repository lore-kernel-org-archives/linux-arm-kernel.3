Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16613E98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=; b=TrHxUCjc8gezinUXthNfiSLZWH
	n7AvIzI51lvdSHHTlccfKWoEfXGOSvQ4Uvsdfc2kyqcPFyrqKoCtdXHV0385cN4YkleziH7CwSPJK
	TnbLhzMrv5BEQ52w6EmNb+NC//U1MwMaxbP34E3urmnwlwPEfcteo1TV8VvSZP8sGGZ9NdiTn1s/l
	/ZKsjxFc08ASsgSJ4JGZ+lz+9LSNGJlp0fYqHET3Pswwz1ibSrn+7QTQ7dTW6nIT6pE1/o7mO/bUm
	1WH+zhmgXfyUT7hAnI4abbZX7rLt1pE5z6XizIVq8QBrM5qLOQvsYYD5W3LumwFFtgDY/mZ7aCD8i
	byLAOPLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnY-0000000HSIy-0nZO;
	Mon, 23 Feb 2026 09:00:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnN-0000000HSCk-0oZ3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMs3r52791963
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=; b=cws0ECAbBSCqE6iv
	a8QGmcMF0cnSH9ehxsknG6A2aDPtW9cHO2uem4vDvgFFF66/ZsfJ6uAfEyYz8gKJ
	QgUytz7Is8SH+AYe7IDBTZtKQUD0JgXcLmrmE/5dz2mpGDRr5VRvkRo/BTkDLKbB
	yNLoGtFhMEe8Pk1Se6WZRzgZzWmQGRltuRYozmE8npfyDtPHiJziFtQJIbrRKKoF
	ms+KDNJSiEhZxrZsBunwaUbxpI7XhCsOpb1uMaQWCtqZYLpVBeG3pmO5bko5wgvi
	zZI2B9N51LdwSt+hLE1+CBB1nq3YiKOgt/QyKM8c4VkbuzHoCMyf8gLqO/n7HiI6
	kHp35A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv2gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso575171685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837200; x=1772442000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=Ihp9oUjWLDgaUCBK7kyjnxDlaGXu+lqBT5ldoeNUe6Iw0zlyXWdIQAsAiINcdhjTTr
         vq/9NbFo+E6pT3lBvNvzWm7z2M1mQiUJ9/8ii5jtCFbOSj5LI90sK1mafTXNsqLyAM9J
         t6CL74lVr4UXT9nY/v0DrOZIJ5QsvOnolet49vH4Si9qfqVKf4nEB6A7wMM6XOj0IGCA
         E/7HtSBL9NJ3l+xkXirGBmjv4rLKIinVSS7awq8rv0jlNlPver9KHLefNCSs27koP0V4
         o8LMRxQ0hAiGqcWPZC/7c5Bu8zw4QoyNqi7TIiFaWwpZyspVEDT5QI68qKfIzCaHHa3h
         D/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837200; x=1772442000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=PbPXa31d7kI3UbgZuemkkp9fsIjfwZDQwcwu2p0EbC06geZ1Wur3D7D5W1oFsssvDJ
         dY4Mg6jaJ5mlhTgtzX/LlZUfx2Dp326Tm6lOhiQeEq5ihXbZLvyjAq8+ZEtG3Z/YOVjf
         Ym+dfQeOxx6U/jTjA2iX3rC2HCmvvhXWC9Oz1XNkOdiyqdLm0YchKF2AxBVzPmIJB7VH
         PIUbJu4kspBpsWBQJ1tgxFWQ3tVw/kwsZOvBvYk/F8yRkxYfzWQIekyBdh4AZoGM8F8V
         7tv+fxKhMLy+Svol+szz87JTWqaCG132P+vn6CVO/x9wE9YV+3iIawRLNAAAjChnY6Td
         K7UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOWctphpVbcKDhbreR4aAP+rKV7TYj3qYpwyFxTzUlj1oCGyR6RV4EOKep0DlgPX/GJlQkkf97SWtAkMjUX1ay@lists.infradead.org
X-Gm-Message-State: AOJu0YyvuWtstr3B3kkBRx4PyaIAPh2nzMjWgvU2H6kioXXdY6PVv3Z9
	98QOhhBQXDcUSwoWrriM4TRnK6Z9b0ME0H6EVLlErLdvZfpK639wyh/qNCJhVshLR1ByaT5XU16
	5PMHQTuA5ZbS34rIDOEh/wINa3Pjparvz7PV57VefSxY5EBlTFvJLuRBLtfb+jY6GynPODrcyJo
	4HtA==
X-Gm-Gg: AZuq6aLMsyc8QRiXBwk8LnnbiJRs2sTudyNVJdSUUclp/McfdgKil+OsL3szaSaAzA4
	DuXvQ/VX0dD7peQhBhwuwoVfBySX7TkFkzUDD4LSNE55/Y66Z1zIPZAEK0OyNiLMCN41w9vAfQz
	1ywuhELZGZBDcXDYKGs7PlMGcJg/wKDz4+2RkNvP3FWikIs2guuCjTAg3eXcRwAhF9U4vcjoIei
	5Ev04wIfi4tndbrFz1AfMFoyPiI0sYsvFcaA5d4mvBJerMYNYnbMUP7aYC3L8s/Byxq5igt9FLI
	7eBj8NTZfBiDQ8kgFsqOTjAcy+6rM67dnKGgaA5LRgj2hgpHZLLtwaf6kebeDN1wAI/ZPRh/ALU
	e07JOi7bzkxPjj/bqVdhOeoYEDOy16fxAs7Patx6PrQ4Fro7wPVIF
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr970848885a.52.1771837199587;
        Mon, 23 Feb 2026 00:59:59 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr970846885a.52.1771837199129;
        Mon, 23 Feb 2026 00:59:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:59:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:31 +0100
Subject: [PATCH v2 02/13] i2c: add i2c_adapter-specific printk helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-2-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb9jzjFTJdq3M6FO7EYY2QiwT8GVE9qmSWuz
 3ohkzvQSVmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW/QAKCRAFnS7L/zaE
 w8BmEACrMBvc0WtZJaG8d5jaaStBPDhB6rA1XzsrpvPKTzprO3pfbK0+LDvt2i6hcSz6G/sATKM
 4wmqFf/XEdRLWL54Vwi3cecAtJ8tkTh2p8nA6YHe87diSRhjKjFAv216+yDh0QLuwHOYhUjqM08
 f5kZhLL3dJ4hDRd49MZkT6LGkkFA56GIxx/wOQhMg9FsMGQSnm5tJW4wBUy2F4ldoKdRK3r4eF6
 STm5Z0uulFjPHiAlQ7n/ZGdGSFI/mKQe26GVRiSUTzgHepT6OoK69CwEU6WRm6JdvHpE804SJhS
 6ps8EJHVXUT89mV3+Gbyzz7UtIrFymORTZoy4pq0S5Ari/vp1uOMfyqvRJ0n5OO2oDbe0DiofMd
 L8e6e0NWZ1LU0AHDQ5EFb2rh0u5gom9/cz0WAQ9mGcMdru5aLcsCPFXKFd2aVeRHRskvjca97bk
 pCQ22fRInNk9I9PZzhCx2dLcEUE6ogUyuzOB6bVMFnmtHa6dx99uirWBGGqvzgyIbSqsNGwnXic
 GLik9Q5xUP0W1vpKN6XCwLXHgHleEtmYCyp1FnncRrxB6TxXUTsMd2PluQIrapHsp9Ty4zItN9D
 /wRIDRb0bAFp0WUToMEZ5+f+zdAf3iI9Nl8IyXV7G01Gf2FT7qaKyY93dG3gdHrAKTMSNLB400a
 XLWKVbwUcAwCgXg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfXx/bo+yJZ/uxq
 DSi/S7ssRvxOr7KMndyo7doiEo3FeLPshyYPMz/X7/sAUb1UH/gRYv50RIgZ3WwfsTrzLb1awh5
 D7jdAfkfuhfH0DXpXChObspQdC1HS4/GhEbK+IcZRjFw5IVys0WqbIcab/Oi3dm6fNLmHXGypWL
 Ue38LfPrLoHS7aCQLlg3dWSaR9zpXaQ9Lf1Ax+Q5WESkpi+WHdVJzjYKTIk8spkVIHyJLvFX2gM
 LiakV6A6liqSbwm2K8Qt+rIOHshoOk+03rFyl0ZaluVKae2banvcef/+UwIGdKF8quiZ9uehjZL
 gEGenBAyq9hy5Pvg7/kE2J/IzvR9cMC8VolDUdIuBJbCkF2nHtUF5YQQPhefYd/1rPZtSIvGVax
 kmwbvd7fP+YbzcqY0TG60mKNy7RGcgwGnfZUdhHJEQiQQwoZBTkA67SA72LCx71FLnM6M/9bJR8
 iSzrGIp7eaM+cnIGQkA==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c1710 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3PEwmxbnAXTcU586h74A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: AP7jQcj5Nf_yY1mvbA293LUqX9ZMIebv
X-Proofpoint-ORIG-GUID: AP7jQcj5Nf_yY1mvbA293LUqX9ZMIebv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010001_967080_510B54B8 
X-CRM114-Status: GOOD (  13.60  )
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


