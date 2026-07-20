Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADDCC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIZ+VAsVn1SNZ95QGAq5L0m52yqYtxRT1a/8J3q9Pu4=; b=wfnVOV9d69CngjuHUVa6ubXnOd
	Ny+8C0vEEPe8d3HrV4EARuSpXFDrkSY2Z1iCflCj7tvQlnxoEJtkODIUgDUWrLTu/+IhZXmQYSsFE
	X9w2wYjDIjoxdUO5Jr+xfI0WP+CYUEgcraK+tThhf9jYhHkxE8PYhk8MkA8QkNBmB8kIMYEx0P6bF
	gYiHo8fKVhWY3xTVA4i4I/eWj6WuZKZjuhsPYBZAdF8kTij8bvLNARLyxa4s5YaOTiPmqlaraxCLO
	D7+pqmi0+FHJBC2/l13xKT2vQkMBtPvOSvNeJgopzLSiLrVRldUyS/GMfHdQcWnvXXf8ciCfU8DmT
	rxQRnTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkFu-00000006IiY-0xro;
	Mon, 20 Jul 2026 09:25:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkFk-00000006IeQ-1bH1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:25:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RXJh1420259
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UIZ+VAsVn1SNZ95QGAq5L0m52yqYtxRT1a/8J3q9Pu4=; b=cdsk810PBp7g+01t
	jtgsGaB6bqe7awz+CHFFzkkzoLRYq0k1QLv8MuSjFV4W5+7SdbFv/6T4M9/nmTqb
	9hSzA+WUDlYFsy43Oe2BJmMUGoCTsH/SbrIid3297qp8o4v+URjLubzvWI99IWpk
	bQBxqlqdsY65+HrEd87wxvATZbN4vLF86FWV2YI+1BWihFWMUsi++2WKU4Ew6MSG
	i3twBcvytFoyV5dmENS0paEGxzTC/InElCdcYbKTpIlG5PY1LYSoqfDZ3pI9zXzl
	thHjSjWosG9kmlp7yi+JysDF2XXnIdixKlp1Ltj19pyBdQ3sg6xMQVDoV7w9Y2Eh
	60oT1w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7wjqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:25:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bff5c7035so86656611cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539535; x=1785144335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIZ+VAsVn1SNZ95QGAq5L0m52yqYtxRT1a/8J3q9Pu4=;
        b=YWdcT1MBMZ+uBxF3mVMcpf7BR3wJBMYJo6JLOVYu4qNF2dYvJDTG+/4t0Tbj4LcW9H
         b9AR1i2nv/CAO08qrgkqcQJOsx01dHirkB0s1CPvUqlx81JK/AKy80ToFW6GLi/o63Xq
         841QiBlhnyBzWrx6qFOlYOihcdd/sNpt1H/jDU0MFTrKqK1TyQbloNTxYU5rwjZ5HUXI
         yWQwrUeJQoj5Spms1BTif+0UjwE4Syd1TKIgEqzuaCHC+EhAodNTykPnkYfCQW5USe9B
         03o482D+CU9c+TtACJYeup/FtlqUXwkkZp8wymHXLQNk5NVu5C6N7gSdXw/Ktrv7fDNr
         WKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539535; x=1785144335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIZ+VAsVn1SNZ95QGAq5L0m52yqYtxRT1a/8J3q9Pu4=;
        b=HrZIAM+/I5cd3MwLJaJKTH1gzjGGQKEsa5CjR6z/utFFtO4nCrHR1cGKEqtPUQH1rT
         7/+XDB9zZAqUR/4IkhE24w9i5EuR8eXvbQrVMTIRWunN2FSO+wMouZN8qm7rZPfzOkf4
         VkMJ6pIevi1WfHPCK7LdQua/h4PYvFZJYGhWWqCyy4G5WiuPoGsP65ibqVyqkNrgYxMi
         WbL2heL/R+VS/g7V/CCjaGbURFuH9CdxV4bowDZehq6w3pnp6ZkAQlKgvBhXZtelEsnF
         oIiQgeWl3X83/9Ky510dpA038POJyfQhqVM68xlM3DquqCOJ5RE5R1CiSyzx0QXEKB9q
         1feA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2HMrafo3i1sJ8F60byGC86QVR6DMcbd6rAaPyhtyRXRZzo1F4ttxSgbKtD9XHysCtiZKlYpdDZ0O/pFu/kKI6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9PPSG2qB5DZ64+2YsUCSTGQEyixmfDbMKEOJw1Unampx9E7zC
	QOk0/L79d9ftC0PPhdGNKX5+k5qkR33MS0qXQVZzxNz+pT58x9oqbuFR31D5qzsjd4OpgCBeyZZ
	/j8/Kvwf0VCccN1H/gofCUqhNrPCJtV7NMY1V48MWSJWNbdCz9MMmSmdXc4KoE4Xx/F/DavG6f2
	qYCA==
X-Gm-Gg: AfdE7clYJYBCXBvzN0L8DLVzRvqk7LZY7UqSg8uhotRbYH1+o/XkpC8FREQ4RCoEwB+
	imRz8RyDBbNhFQ39ZGX4MGkmmWqjvgheWSs4PrIiOs67B0cDvephwwuEIQ2FXpJrsJlyS8gaR3K
	X4olu8dHawiMGUEYgxatWkLepPbRo3E7P4ruTT/TFyp90kDMmwZRJZPdxTNRDoARLdkJqxTCb1m
	xkHdBCjuyYnRE4N79EgbmyUNVFq8DRwW7gH1C4pE11hPdY8M4BuByJqbQIXw2gLFhlQAtG01vFI
	fvCYb+WLmH3HkfrC7FP+MoNM3sBy9J8/t1NQ+Qpev3yWvGrW7/W9ICY8H1NDNFsGne31TmXuWj/
	Xoe01pryF3H8CNS6zzhk9sMoWo0j1rA==
X-Received: by 2002:a05:622a:8405:20b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-5218ef0b690mr68227241cf.17.1784539534891;
        Mon, 20 Jul 2026 02:25:34 -0700 (PDT)
X-Received: by 2002:a05:622a:8405:20b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-5218ef0b690mr68227031cf.17.1784539534544;
        Mon, 20 Jul 2026 02:25:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:50 +0200
Subject: [PATCH 3/8] iommu/fsl: use platform_device_set_fwnode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-3-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=800;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ngE1ViR1uejC9qMYv5QiOE7AeBgS+j6esA02JjCNPps=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXel6iXQzzX/uv/M9gp2dgxe5JJKBdP3GI+hsF
 3nTXeFE5ueJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pegAKCRAFnS7L/zaE
 wyjWD/9xXLl+a9ATQzUTmx2pnk3PM2p8fPrhJGmTlsNly3ZXJZphk+eDGVbTZjMKzCAO7n+1MYv
 KC3P5qWxuw82fl5Mbg02h92WwZFcK2jLnAt1fEaQoLmiwKYIglZlCzdDXqh8SF1Ko19OroltKBU
 jwvYBAr3Ie5QCwnDEs0RoHKKubZSQ5mouhqfRrd7qbgG+uDXDg5XpHtk0rDJ5FnPKp4X8W/XhTH
 3GweCttfjt4t/fiwM2j6KmWcSD5TJ+hjv/5KeJZf2QB1Eb0Dzv22Jvlb2raqCQJUCcCg4JAK5g3
 JCWI7Te3zkgFGiJSn9nc5Z9P+Qzwms6BXzpM3qfS5u/Ks7wgnRpq+urnXYHHPlZR64p/nNNQDkV
 xrsRgx0q3ZOgObWODPSBLq7wPynL4OPLsZv9GtIVxxegKpC4h/+4N/6JMo5EzkA79PuYLzxx6DJ
 pb+qZwcXPvSLXNg6IPVLewi3QQIB2HIny/YXxqUAipY98m3orYwhyp0sHs7WLviD4uxwrtAKbjX
 zyNGMpy9b7hxIWjIDa5PPa+q68hJILk4PDf6cQWZ5PiRB+ISL4CPpMGtkvCEcAEiVOQ+rhH2bPm
 DD2NrOLMt6pvLTRgLX3Vj54Vvcw3gI3OzMXg3zRQswULvjd4UuArBK9wB0sB4LT4S9trCF2QCem
 /w1WqggZz70S85g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX3efCEsJF2rcu
 /auzlhTsVwLyl7UZC0ohA1lDBlGKK1a+ZZQS7jojzM4Q8H5rRPV2z8ZBpSOQv5/Kxqo01BJFNa4
 dSyUBuEKH8OMUX43k68YkQpcpKpxacMWmzaXSrQ9rxgFm0hsziPmy8zFSUVgPZbvuCfAb0sMx3k
 pMLCRfNa3QYloIBi2YtOj1rk7Jq0qUtLp5LB+52+WCFT/j6tnU8HZabSXWHrRQG6u8st2nJfiHp
 f3pA7Cj+uqei3a48v2zcgxhIFWYfCux1yJ+bUhWFSW/ItXGJKlJUS2NR7wWwSjHYo+t60fq8Axn
 g2o3VysMpGpGQ4usuKVcK4Sk8T+j7D9csQNyYUugSJPl2b9FZyycaJfK89rv+taCJ1vr8oi0Fpz
 v/DvrlhWjewuwfQPZKRTDMNqrLFmA3F+v/dcXqIyi/3jnfMXBSrFA8EYihhDjtxDuPikAju41Zz
 NI0IOuKucxXgHFwcG6A==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5de98f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=le_mMX733WJEbBjyejwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Cij1vkeOcGR3xRzTykkNOy93G1G2S-Pl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX+IqsCdkn13tt
 YNLNiGgGt150Va+waJ8KtvLGseTq9i2z8SJRb6OKTd3eExCwtVfjH0pObOQykEYKIrGdtqMVynR
 tOp0Vl1G1BxKPU6zakeovIh+CBSDoWE=
X-Proofpoint-GUID: Cij1vkeOcGR3xRzTykkNOy93G1G2S-Pl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022536_867010_29883190 
X-CRM114-Status: GOOD (  15.31  )
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

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/iommu/fsl_pamu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index c83bbc3faad56d6ee1c89b0a7f74028af02c81e9..268a1f752fbceab4fd24013aeea5df1b6982fbb1 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -975,7 +975,7 @@ static __init int fsl_pamu_init(void)
 		goto error_device_alloc;
 	}
 
-	platform_device_set_of_node(pdev, np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 
 	ret = pamu_domain_init();
 	if (ret)

-- 
2.47.3


